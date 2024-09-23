@implementation PHInCallRootViewController

- (void)_testing_viewWillAppear
{
  if ((objc_msgSend(UIApp, "isRunningTest:", CFSTR("PlaceOutgoingCall")) & 1) != 0
    || objc_msgSend(UIApp, "isRunningTest:", CFSTR("FaceTimePlaceOutgoingCall")))
  {
    objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("sbRemoteAlert"), qword_1002E2CB0);
    objc_msgSend(UIApp, "startedSubTest:forTest:", CFSTR("viewControllerSetup"), qword_1002E2CB0);
    objc_msgSend(UIApp, "startedSubTest:forTest:", CFSTR("animation"), qword_1002E2CB0);
  }
}

- (void)_testing_viewDidAppear
{
  if ((objc_msgSend(UIApp, "isRunningTest:", CFSTR("PlaceOutgoingCall")) & 1) != 0
    || objc_msgSend(UIApp, "isRunningTest:", CFSTR("FaceTimePlaceOutgoingCall")))
  {
    objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("viewControllerSetup"), qword_1002E2CB0);
  }
}

- (void)_testing_finishedAnimatingIn
{
  if ((objc_msgSend(UIApp, "isRunningTest:", CFSTR("PlaceOutgoingCall")) & 1) != 0
    || objc_msgSend(UIApp, "isRunningTest:", CFSTR("FaceTimePlaceOutgoingCall")))
  {
    objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("animation"), qword_1002E2CB0);
    objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("end-to-end"), qword_1002E2CB0);
  }
}

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class(PHInCallRootViewController, a2) == a1)
  {
    v2 = objc_alloc_init((Class)NSMutableSet);
    v3 = (void *)qword_1002DCB40;
    qword_1002DCB40 = (uint64_t)v2;

  }
}

+ (void)setShouldLockDeviceOnNextDismiss
{
  byte_1002DCB48 = 1;
}

+ (void)setShouldForceDismiss
{
  byte_1002DCB49 = 1;
}

+ (void)setStatusBarPillSuppressionForBackgroundActivities:(id)a3 onWindowScene:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a3;
  v6 = a4;
  v7 = v5;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredBackgroundActivitiesToSuppress"));
    v9 = objc_msgSend(v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      objc_msgSend(v6, "setPreferredBackgroundActivitiesToSuppress:", v7);
  }
  else
  {
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] No WindowScene, so not setting any preferred status bar pill suppressions", v12, 2u);
    }

  }
}

- (void)setCurrentAlertButtonAction:(id)a3
{
  SBUIRemoteAlertButtonAction *v4;
  SBUIRemoteAlertButtonAction *currentAlertButtonAction;
  SBUIRemoteAlertButtonAction *v6;

  v4 = (SBUIRemoteAlertButtonAction *)a3;
  currentAlertButtonAction = self->_currentAlertButtonAction;
  if (currentAlertButtonAction)
    -[SBUIRemoteAlertButtonAction sendResponseWithUnHandledEvents:](currentAlertButtonAction, "sendResponseWithUnHandledEvents:", 0);
  v6 = self->_currentAlertButtonAction;
  self->_currentAlertButtonAction = v4;

}

- (void)forceUpdateCallControllerForSOS
{
  if (+[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive"))
  {
    -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
    byte_1002DCB48 = 0;
  }
}

- (void)sendResponseIfNecessaryWithUnhandledEvents:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  SBUIRemoteAlertButtonAction *currentAlertButtonAction;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentAlertButtonAction](self, "currentAlertButtonAction"));
    v11 = 138412546;
    v12 = v7;
    v13 = 2048;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending Response on currentAlertButtonAction: %@ with SBUIRemoteAlertServiceButtonEvents: %ld", (uint8_t *)&v11, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentAlertButtonAction](self, "currentAlertButtonAction"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentAlertButtonAction](self, "currentAlertButtonAction"));
    objc_msgSend(v9, "sendResponseWithUnHandledEvents:", a3);

    currentAlertButtonAction = self->_currentAlertButtonAction;
    self->_currentAlertButtonAction = 0;

  }
}

- (PHInCallRootViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v5;
  PHInCallRootViewController *v6;
  PHInCallRootViewController *v7;
  CNKCallParticipantLabelDescriptorFactory *v8;
  CNKCallParticipantLabelDescriptorFactory *labelDescriptorFactory;
  uint64_t v10;
  CNKFeatures *features;
  uint64_t v12;
  TUCallCenter *callCenter;
  PHDeclineCallServiceFactory *v14;
  uint64_t v15;
  PHDeclineCallServiceProtocol *declineCallService;
  UITapGestureRecognizer *v17;
  UITapGestureRecognizer *bannerTapGestureRecognizer;
  void *v19;
  unsigned int v20;
  ICSCallManagerBridge *v21;
  ICSCallDisplayStyleManager *callDisplayStyleManager;
  id v23;
  ICSCallManagerBridge *v24;
  ICSCallManagerBridge *callManager;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PHInCallRootViewController;
  v6 = -[PHInCallRootViewController init](&v27, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v8 = objc_opt_new(CNKCallParticipantLabelDescriptorFactory);
    labelDescriptorFactory = v7->_labelDescriptorFactory;
    v7->_labelDescriptorFactory = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    features = v7->_features;
    v7->_features = (CNKFeatures *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    callCenter = v7->_callCenter;
    v7->_callCenter = (TUCallCenter *)v12;

    v14 = objc_opt_new(PHDeclineCallServiceFactory);
    v15 = objc_claimAutoreleasedReturnValue(-[PHDeclineCallServiceFactory makeWithCallCenter:](v14, "makeWithCallCenter:", v7->_callCenter));
    declineCallService = v7->_declineCallService;
    v7->_declineCallService = (PHDeclineCallServiceProtocol *)v15;

    v17 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v7, "bannerTapped:");
    bannerTapGestureRecognizer = v7->_bannerTapGestureRecognizer;
    v7->_bannerTapGestureRecognizer = v17;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v7->_bannerTapGestureRecognizer, "setNumberOfTapsRequired:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](v7, "features"));
    v20 = objc_msgSend(v19, "callManagerEnabled");

    if (v20)
    {
      v21 = [ICSCallManagerBridge alloc];
      callDisplayStyleManager = v7->_callDisplayStyleManager;
      v23 = objc_alloc_init((Class)TUFeatureFlags);
      v24 = -[ICSCallManagerBridge initWithRootController:callDisplayStyleManager:flags:](v21, "initWithRootController:callDisplayStyleManager:flags:", v7, callDisplayStyleManager, v23);
      callManager = v7->_callManager;
      v7->_callManager = v24;

    }
    -[PHInCallRootViewController updateBannerTapGestureRecognizerForCallDisplayStyle:](v7, "updateBannerTapGestureRecognizerForCallDisplayStyle:", objc_msgSend(v5, "callDisplayStyle"));
  }

  return v7;
}

- (PHInCallRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHInCallRootViewController *v4;
  CNKCallParticipantLabelDescriptorFactory *v5;
  CNKCallParticipantLabelDescriptorFactory *labelDescriptorFactory;
  CNKCrossFadeAnimatorFactory *v7;
  CNKCrossFadeAnimatorFactory *animatorFactory;
  id v9;
  NSObject *v10;
  uint64_t v11;
  CNKFeatures *features;
  uint64_t v13;
  TUCallCenter *callCenter;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  PHInCallRootViewController *v23;

  v21.receiver = self;
  v21.super_class = (Class)PHInCallRootViewController;
  v4 = -[PHInCallRootViewController initWithNibName:bundle:](&v21, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(CNKCallParticipantLabelDescriptorFactory);
    labelDescriptorFactory = v4->_labelDescriptorFactory;
    v4->_labelDescriptorFactory = v5;

    v7 = objc_opt_new(CNKCrossFadeAnimatorFactory);
    animatorFactory = v4->_animatorFactory;
    v4->_animatorFactory = v7;

    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v11 = objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    features = v4->_features;
    v4->_features = (CNKFeatures *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    callCenter = v4->_callCenter;
    v4->_callCenter = (TUCallCenter *)v13;

    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHInitialPresentationAssertionReason"));
    -[PHInCallRootViewController registerForNotifications](v4, "registerForNotifications");
    v15 = +[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CUTWiFiManager sharedInstance](CUTWiFiManager, "sharedInstance"));
    objc_msgSend(v16, "setAutoAssociateWiFiAsForegroundClient:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    v18 = objc_msgSend(v17, "isEnhancedEmergencyEnabled");

    if ((v18 & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSDisconnectionConfirmation sharedInstance](PHSOSDisconnectionConfirmation, "sharedInstance"));
      objc_msgSend(v19, "addDelegate:", v4);

    }
  }
  return v4;
}

- (void)registerForNotifications
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
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "removeObserver:", self);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "dismissalAssertionReleasedNotification:", CFSTR("PHDismissalAssertionReleasedNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "callStateChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "videoCallStateChangedNotification:", TUCallCenterVideoCallStatusChangedNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "callUpgradedToVideoNotification:", TUCallUpgradedToVideoNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "callConnectedNotification:", TUCallCenterCallConnectedNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "callDisplayContextChanged:", TUCallDisplayContextChangedNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "callViewControllerStateChangedNotification:", CFSTR("PHCallViewControllerStateChangedNotification"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "pipStateChangedNotification:", CFSTR("PHPIPControllerStateDidChangeNotification"), v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "pipStashChangedNotification:", CFSTR("PHPIPControllerStashChangeNotification"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "pipProxyActiveChangedNotification:", CFSTR("PHPIPControllerPIPProxyActiveDidChangeNotification"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "pipControllerDidRequestReturnToFullScreenNotification:", CFSTR("PHPIPControllerDidRequestReturnToFullScreenNotification"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "handleSystemInitiatedPIPInterruptionStoppedNotification:", CFSTR("PHPIPControllerSystemInitiatedPIPInterruptionStoppedNotification"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "handlePIPInterruptionChangeNotification:", CFSTR("PHPIPControllerInterruptionChangeNotification"), v8);

  objc_msgSend(v13, "addObserver:selector:name:object:", self, "emergencyCallbackModeChangedNotification:", TUCallCapabilitiesEmergencyCallbackModeChangedNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "callContinuityChangedNotification:", TUCallCenterCallContinuityStateChangedNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "mostRecentlyDisconnectedAudioCallDidClearNotification:", CFSTR("ICSApplicationDelegateMostRecentlyDisconnectedAudioCallDidClearNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "didChangeDeviceOrientationNotification:", CFSTR("PHInCallOrientationEventNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "callDowngradedToAudioNotification:", TUCallDowngradedToAudioNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "handleDoubleHeightStatusBarTap", CFSTR("ICSStatusBarTappedNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "statusBarTappedInFullScreen", CFSTR("ICSStatusBarTapInFullScreenNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "handleActivationContextDidChangeNotification:", CFSTR("ICSActivationContextDidChangeNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "wantsHoldMusicChangedNotification:", TUCallCenterCallWantsHoldMusicChangedNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "hardwareButtonEventNotification:", CFSTR("PHHardwareButtonEventNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "willTransitionToFullScreenNotification:", CFSTR("ICSSceneManagerDidRequesFullScreenTransitionNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "remoteParticipantHandlesChangedNotification:", TUCallRemoteParticipantHandlesChangedNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "handleCallBufferNotification:", CFSTR("PHCallBufferNotification"), 0);
  -[PHInCallRootViewController startObservingAcceptCallButtonTappedWithNotificationCenter:](self, "startObservingAcceptCallButtonTappedWithNotificationCenter:", v13);
  if (!+[PHUIConfiguration shouldUseFullScreenPeoplePicker](PHUIConfiguration, "shouldUseFullScreenPeoplePicker"))objc_msgSend(v13, "addObserver:selector:name:object:", self, "willRotate:", UIWindowWillRotateNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "pttCallStateChangedNotification:", TUBargeCallStatusChangedNotification, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeController"));
  objc_msgSend(v10, "addDelegate:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conversationManager"));
  objc_msgSend(v12, "addDelegate:queue:", self, &_dispatch_main_q);

}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_willAppearInRemoteViewController", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setWallpaperTunnelActive:", 1);

  objc_msgSend(v4, "setBackgroundStyle:withDuration:", 4, 0.1);
  objc_msgSend(v4, "setDismissalAnimationStyle:", 1);
  objc_msgSend(v4, "setShouldDismissOnUILock:", 1);
  objc_msgSend(v4, "setShouldDisableFadeInAnimation:", 0);

  -[PHInCallRootViewController updateDesiredSpringboardBehavior](self, "updateDesiredSpringboardBehavior");
  if (-[PHInCallRootViewController dismissalWasDemandedBeforeRemoteViewControllerWasAvailable](self, "dismissalWasDemandedBeforeRemoteViewControllerWasAvailable"))
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "InCallRootViewController tried to dismiss before the proxy was available. The proxy is now available, so we will dismiss immediately.", v10, 2u);
    }

    -[PHInCallRootViewController requestInCallDismissal](self, "requestInCallDismissal");
  }
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  objc_super v12;
  uint8_t buf[4];
  PHInCallRootViewController *v14;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dealloc %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v6 = objc_msgSend(v5, "isEnhancedEmergencyEnabled");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSDisconnectionConfirmation sharedInstance](PHSOSDisconnectionConfirmation, "sharedInstance"));
    objc_msgSend(v7, "removeDelegate:", self);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:", self);

  -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](self, "releaseIdleTimerAssertionWithComment:", CFSTR("dealloc"));
  -[PHInCallRootViewController setStatusBarHidden:withDuration:](self, "setStatusBarHidden:withDuration:", 0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController remoteHostViewController](self, "remoteHostViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteViewController"));
  objc_msgSend(v10, "setDelegate:", 0);

  -[PHInCallRootViewController setRemoteHostViewController:](self, "setRemoteHostViewController:", 0);
  -[PHInCallRootViewController setContactsViewController:](self, "setContactsViewController:", 0);
  -[FBSDisplayLayoutMonitor invalidate](self->_displayLayoutMonitor, "invalidate");
  displayLayoutMonitor = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = 0;

  v12.receiver = self;
  v12.super_class = (Class)PHInCallRootViewController;
  -[PHInCallRootViewController dealloc](&v12, "dealloc");
}

- (TUFeatureFlags)featureFlags
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  v5 = objc_opt_class(PHApplicationDelegate, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "featureFlags"));
  else
    v6 = 0;

  return (TUFeatureFlags *)v6;
}

- (id)sosHandles
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _UNKNOWN **v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  id v45;
  _QWORD v46[3];
  _BYTE v47[128];

  v2 = sub_10000D538(CFSTR("SOSCallingUsesTestNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = sub_10000D538(CFSTR("SOSCallingUsesTestDisambiguation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = sub_10000D538(CFSTR("SOSCustomEmergencyTestNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0
    || (objc_msgSend(v3, "BOOLValue") & 1) != 0
    || objc_msgSend(v7, "length"))
  {
    v8 = CNKTranscriptionViewComposerFactory_ptr;
    if (objc_msgSend(v7, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v7, 0));
      if (v9)
        goto LABEL_7;
    }
    else
    {
      v35 = v7;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICSApplicationServices sharedInstance](ICSApplicationServices, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "callProviderManager"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "emergencyProvider"));
      v20 = objc_alloc_init((Class)TUSenderIdentityClient);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "prioritizedSenderIdentities"));
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (v22)
      {
        v23 = v22;
        v32 = v19;
        v33 = v18;
        v34 = v3;
        v24 = 0;
        v25 = *(_QWORD *)v38;
LABEL_13:
        v26 = 0;
        v27 = v24;
        while (1)
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v26), "accountUUID"));
          v36 = v27;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "testEmergencyHandleForAccountUUID:error:", v28, &v36));
          v24 = v36;

          if (v9)
            break;
          v26 = (char *)v26 + 1;
          v27 = v24;
          if (v23 == v26)
          {
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
            if (v23)
              goto LABEL_13;
            v9 = 0;
            break;
          }
        }

        v18 = v33;
        v3 = v34;
        v8 = CNKTranscriptionViewComposerFactory_ptr;
        v19 = v32;
      }
      else
      {
        v9 = 0;
      }

      v7 = v35;
      if (v9)
        goto LABEL_7;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[192], "normalizedPhoneNumberHandleForValue:isoCountryCode:", CFSTR("822"), 0));
LABEL_7:
    v10 = objc_msgSend(v5, "BOOLValue");
    v11 = objc_msgSend(objc_alloc((Class)TULabeledHandle), "initWithHandle:label:isSuggested:", v9, CFSTR("EMERGENCY_DISAMBIGUATION_AMBULANCE"), 0);
    v12 = v11;
    if (v10)
    {
      v46[0] = v11;
      v13 = objc_msgSend(objc_alloc((Class)TULabeledHandle), "initWithHandle:label:isSuggested:", v9, CFSTR("EMERGENCY_DISAMBIGUATION_FIRE"), 0);
      v46[1] = v13;
      v14 = objc_msgSend(objc_alloc((Class)TULabeledHandle), "initWithHandle:label:isSuggested:", v9, CFSTR("EMERGENCY_DISAMBIGUATION_POLICE"), 0);
      v46[2] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));

    }
    else
    {
      v45 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
    }
    goto LABEL_10;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICSApplicationServices sharedInstance](ICSApplicationServices, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "callProviderManager"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "emergencyProvider"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "emergencyLabeledHandles"));
  v30 = sub_1000C5588();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v12;
    v43 = 2112;
    v44 = v15;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SOS Numbers: Emergency call provider is %@ with numbers %@", buf, 0x16u);
  }

LABEL_10:
  return v15;
}

- (void)_reloadSOSHandles
{
  PHSOSViewController *sosViewController;
  id v3;

  sosViewController = self->_sosViewController;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController sosHandles](self, "sosHandles"));
  -[PHSOSViewController updateSOSHandles:](sosViewController, "updateSOSHandles:", v3);

}

- (void)_loadSOSViewController
{
  PHSOSViewController *v3;
  PHSOSViewController *v4;
  PHSOSViewController *sosViewController;
  id v6;

  if (!self->_sosViewController)
  {
    v3 = [PHSOSViewController alloc];
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController sosHandles](self, "sosHandles"));
    v4 = -[PHSOSViewController initWithSOSHandles:](v3, "initWithSOSHandles:", v6);
    sosViewController = self->_sosViewController;
    self->_sosViewController = v4;

  }
}

- (PHSOSViewController)sosViewController
{
  -[PHInCallRootViewController _loadSOSViewController](self, "_loadSOSViewController");
  return self->_sosViewController;
}

- (UINavigationController)videoCallNavigationController
{
  UINavigationController *videoCallNavigationController;
  UINavigationController *v4;
  UINavigationController *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  videoCallNavigationController = self->_videoCallNavigationController;
  if (!videoCallNavigationController)
  {
    v4 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
    v5 = self->_videoCallNavigationController;
    self->_videoCallNavigationController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_videoCallNavigationController, "view"));
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_videoCallNavigationController, "view"));
    objc_msgSend(v16, "setAutoresizingMask:", 18);

    -[UINavigationController setNavigationBarHidden:](self->_videoCallNavigationController, "setNavigationBarHidden:", 1);
    -[UINavigationController setDelegate:](self->_videoCallNavigationController, "setDelegate:", self);
    videoCallNavigationController = self->_videoCallNavigationController;
  }
  return videoCallNavigationController;
}

- (void)presentCreateContactViewControllerWithHandle:(id)a3 forViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "value"));
      v12 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact contactWithDisplayName:handleStrings:](CNContact, "contactWithDisplayName:handleStrings:", 0, v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForNewContact:](CNContactViewController, "viewControllerForNewContact:", v9));
      objc_msgSend(v10, "setDelegate:", self);
      objc_msgSend(v10, "setAllowsEditing:", 1);
      objc_msgSend(v10, "setAllowsActions:", 1);
      v11 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v10);
      objc_msgSend(v6, "presentViewController:animated:completion:", v11, 1, 0);

    }
  }
}

- (void)_loadAudioCallViewController
{
  void *v3;
  unsigned int v4;
  void *v5;
  PHAudioCallViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  PHAudioCallViewController *v10;
  PHAudioCallViewController *audioCallViewController;
  id v12;
  NSObject *v13;
  PHAudioCallViewController *v14;
  void *v15;
  unsigned int v16;
  PHAudioCallViewControllerWrapper *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  PHAudioCallViewControllerWrapper *v22;
  PHAudioCallViewControllerWrapper *audioCallViewControllerWrapper;
  id v24;
  void *v25;
  UINavigationController *v26;
  UINavigationController *v27;
  UINavigationController *audioCallNavigationController;
  id v29;
  UINavigationController *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  UIImage *v43;
  UIImage *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  PHAudioCallViewController *v51;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](self, "features"));
  v4 = objc_msgSend(v3, "callManagerEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](self, "callManager"));
    objc_msgSend(v5, "createAudioCallViewController");
LABEL_10:

    goto LABEL_11;
  }
  if (!self->_audioCallViewController)
  {
    v6 = [PHAudioCallViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
    v10 = -[PHAudioCallViewController initWithCallDisplayStyleManager:callCenter:featureFlags:](v6, "initWithCallDisplayStyleManager:callCenter:featureFlags:", v7, v8, v9);
    audioCallViewController = self->_audioCallViewController;
    self->_audioCallViewController = v10;

    v12 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_audioCallViewController;
      *(_DWORD *)buf = 138412290;
      v51 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController loaded a new audio call view controller: %@", buf, 0xCu);
    }

    -[PHCallViewController setInCallRootViewController:](self->_audioCallViewController, "setInCallRootViewController:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
    v16 = objc_msgSend(v15, "audioCallUIModernizationEnabled");

    if (v16)
    {
      v17 = [PHAudioCallViewControllerWrapper alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
      objc_msgSend(v20, "bounds");
      v22 = -[PHAudioCallViewControllerWrapper initWithCallDisplayStyleManager:callCenter:width:inCallRootViewController:](v17, "initWithCallDisplayStyleManager:callCenter:width:inCallRootViewController:", v18, v19, self, v21);
      audioCallViewControllerWrapper = self->_audioCallViewControllerWrapper;
      self->_audioCallViewControllerWrapper = v22;

      v24 = objc_alloc((Class)UINavigationController);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerWrapper](self, "audioCallViewControllerWrapper"));
      v26 = (UINavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "viewController"));
      v27 = (UINavigationController *)objc_msgSend(v24, "initWithRootViewController:", v26);
      audioCallNavigationController = self->_audioCallNavigationController;
      self->_audioCallNavigationController = v27;

    }
    else
    {
      v29 = objc_alloc((Class)UINavigationController);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewController](self, "audioCallViewController"));
      v30 = (UINavigationController *)objc_msgSend(v29, "initWithRootViewController:", v25);
      v26 = self->_audioCallNavigationController;
      self->_audioCallNavigationController = v30;
    }

    -[UINavigationController setOverrideUserInterfaceStyle:](self->_audioCallNavigationController, "setOverrideUserInterfaceStyle:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
    objc_msgSend(v31, "bounds");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_audioCallNavigationController, "view"));
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_audioCallNavigationController, "view"));
    objc_msgSend(v41, "setAutoresizingMask:", 18);

    -[UINavigationController setNavigationBarHidden:](self->_audioCallNavigationController, "setNavigationBarHidden:", 1);
    -[UINavigationController setDelegate:](self->_audioCallNavigationController, "setDelegate:", self);
    -[UINavigationController _setBuiltinTransitionStyle:](self->_audioCallNavigationController, "_setBuiltinTransitionStyle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_audioCallNavigationController, "navigationBar"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v5, "setBackgroundColor:", v42);

    objc_msgSend(v5, "setTranslucent:", 1);
    v43 = objc_opt_new(UIImage);
    objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", v43, 0);

    v44 = objc_opt_new(UIImage);
    objc_msgSend(v5, "setShadowImage:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v5, "setTintColor:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor", NSForegroundColorAttributeName));
    v49 = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    objc_msgSend(v5, "setTitleTextAttributes:", v47);

    goto LABEL_10;
  }
LABEL_11:
  -[PHInCallRootViewController _startMonitoringDisplayLayout](self, "_startMonitoringDisplayLayout");
}

- (void)presentViewControllerFullScreen:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
  -[PHInCallRootViewController _transitionFromViewController:toViewController:](self, "_transitionFromViewController:toViewController:", v5, v4);

}

- (void)_loadPTTFullScreenContainerViewController
{
  PHPTTFullScreenContainerViewController *v3;
  void *v4;
  void *v5;
  PHPTTFullScreenContainerViewController *v6;
  PHPTTFullScreenContainerViewController *pttFullScreenContainerViewController;
  id v8;

  if (!self->_pttFullScreenContainerViewController)
  {
    v3 = [PHPTTFullScreenContainerViewController alloc];
    v8 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bannerPresentationManager"));
    v6 = -[PHPTTFullScreenContainerViewController initWithBannerPresentationManager:](v3, "initWithBannerPresentationManager:", v5);
    pttFullScreenContainerViewController = self->_pttFullScreenContainerViewController;
    self->_pttFullScreenContainerViewController = v6;

  }
}

- (void)pttCallStateChangedNotification:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pttCallStateChangedNotification", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));
  if (objc_msgSend(v6, "isPTT") && objc_msgSend(v6, "status") - 5 <= 1)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Releasing PTT call details dismissal assertion.", v11, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
    objc_msgSend(v10, "setDidDeepLinkToPTTCallDetailsView:", 0);

    +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHPTTCallDetailsViewAssertionReason"));
  }

}

- (void)_loadMultiwayViewControllerForCall:(id)a3
{
  CNKMultiwayViewControllerProtocol *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  CNKMultiwayViewControllerProtocol *v12;
  CNKMultiwayViewControllerProtocol *multiwayViewController;
  id v14;
  NSObject *v15;
  CNKMultiwayViewControllerProtocol *v16;
  CNKMultiwayViewControllerProtocol *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  PHInCallRootViewController *v26;
  __int16 v27;
  CNKMultiwayViewControllerProtocol *v28;

  v4 = (CNKMultiwayViewControllerProtocol *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNKMultiwayViewControllerProtocol call](self->_multiwayViewController, "call"));
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Creating a CNKFaceTimeMultiwayConversationViewController instance for call: %@", (uint8_t *)&v25, 0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bannerPresentationManager"));
    v12 = (CNKMultiwayViewControllerProtocol *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController makeMultiwayConversationViewControllerWithCall:bannerPresentationManager:](self, "makeMultiwayConversationViewControllerWithCall:bannerPresentationManager:", v4, v11));
    multiwayViewController = self->_multiwayViewController;
    self->_multiwayViewController = v12;

    v14 = sub_1000C5588();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_multiwayViewController;
      v25 = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Created a CNKFaceTimeMultiwayConversationViewController instance %@", (uint8_t *)&v25, 0x16u);
    }

    -[CNKMultiwayViewControllerProtocol setDelegate:](self->_multiwayViewController, "setDelegate:", self);
    -[CNKMultiwayViewControllerProtocol setIOSDelegate:](self->_multiwayViewController, "setIOSDelegate:", self);
    if (+[PHUIConfiguration canAutoRotateInCallUIForFaceTime](PHUIConfiguration, "canAutoRotateInCallUIForFaceTime"))
    {
      v17 = self->_multiwayViewController;
      v18 = 2;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      v20 = objc_msgSend(v19, "callDisplayStyle");

      v17 = self->_multiwayViewController;
      v18 = v20 == (id)3;
    }
    -[CNKMultiwayViewControllerProtocol setSupportedDeviceOrientations:](v17, "setSupportedDeviceOrientations:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    -[CNKMultiwayViewControllerProtocol setIsDisplayedInBanner:](self->_multiwayViewController, "setIsDisplayedInBanner:", objc_msgSend(v21, "callDisplayStyle") == 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    -[CNKMultiwayViewControllerProtocol setIsAmbient:](self->_multiwayViewController, "setIsAmbient:", objc_msgSend(v22, "callDisplayStyle") == (id)3);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    -[CNKMultiwayViewControllerProtocol setPipState:](self->_multiwayViewController, "setPipState:", objc_msgSend(v23, "pipState"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallOrientationMonitor sharedInstance](PHInCallOrientationMonitor, "sharedInstance"));
    -[PHInCallRootViewController updateMultiwayDeviceOrientation:](self, "updateMultiwayDeviceOrientation:", objc_msgSend(v24, "lastValidOrientation"));

    -[PHInCallRootViewController _startMonitoringDisplayLayout](self, "_startMonitoringDisplayLayout");
  }

}

- (void)_startMonitoringDisplayLayout
{
  id v3;
  NSObject *v4;
  void *v5;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  FBSDisplayLayoutMonitor *v7;
  FBSDisplayLayoutMonitor *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_startMonitoringDisplayLayout", (uint8_t *)buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
  objc_msgSend(v5, "setNeedsUserInteractivePriority:", 1);
  objc_initWeak(buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A5678;
  v9[3] = &unk_100287130;
  objc_copyWeak(&v10, buf);
  objc_msgSend(v5, "setTransitionHandler:", v9);
  displayLayoutMonitor = self->_displayLayoutMonitor;
  if (displayLayoutMonitor)
    -[FBSDisplayLayoutMonitor invalidate](displayLayoutMonitor, "invalidate");
  v7 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v5));
  v8 = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);

}

- (void)handleFrontBoardInterfaceOrientationChange:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD block[7];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  v6 = objc_msgSend(v5, "frontBoardInterfaceOrientation");

  if (a3)
  {
    if (v6 != (id)a3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000A5CF8;
      block[3] = &unk_1002862C0;
      block[4] = self;
      block[5] = a3;
      block[6] = a3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)rotatePIPForInterfaceOrientation:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  int64_t v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  int64_t v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  v6 = objc_msgSend(v5, "pipState");

  if (v6 == (id)2)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rotating PIP due to interface orientation change %ld", buf, 0xCu);
    }

    v9 = +[PHInCallUIUtilities deviceOrientationForBSInterfaceOrientation:](PHInCallUIUtilities, "deviceOrientationForBSInterfaceOrientation:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A5EE0;
    v11[3] = &unk_100284898;
    v11[4] = self;
    objc_msgSend(v10, "rotatePIPDeviceOrientationTo:withCompletion:", v9, v11);

  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_opt_class(v8, v12);
    v14 = v13;
    v15 = NSStringFromBOOL(-[PHInCallRootViewController shouldShowNavigationBarForViewController:](self, "shouldShowNavigationBarForViewController:", v8) ^ 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = 138412546;
    v18 = v13;
    v19 = 2112;
    v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "TTYC: , viewController: %@ setHidden: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(v9, "setNavigationBarHidden:animated:", -[PHInCallRootViewController shouldShowNavigationBarForViewController:](self, "shouldShowNavigationBarForViewController:", v8) ^ 1, v5);

}

- (BOOL)shouldShowNavigationBarForViewController:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = (void *)qword_1002DCB50;
  if (!qword_1002DCB50)
  {
    v6 = objc_alloc_init((Class)NSMutableSet);
    v7 = (void *)qword_1002DCB50;
    qword_1002DCB50 = (uint64_t)v6;

    v8 = sub_1000F8A50();
    if (v8)
      objc_msgSend((id)qword_1002DCB50, "addObject:", v8);
    objc_msgSend((id)qword_1002DCB50, "addObject:", objc_opt_class(PHConferenceParticipantsViewController, v9));
    v5 = (void *)qword_1002DCB50;
  }
  v10 = objc_msgSend(v5, "containsObject:", objc_opt_class(v4, v3));

  return v10;
}

- (PHAudioCallViewController)audioCallViewController
{
  void *v3;
  unsigned int v4;
  void *v5;
  PHAudioCallViewController *v6;

  -[PHInCallRootViewController _loadAudioCallViewController](self, "_loadAudioCallViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](self, "features"));
  v4 = objc_msgSend(v3, "callManagerEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](self, "callManager"));
    v6 = (PHAudioCallViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioCallViewController"));

  }
  else
  {
    v6 = self->_audioCallViewController;
  }
  return v6;
}

- (id)audioCallViewControllerIfLoaded
{
  PHAudioCallViewController *audioCallViewController;
  PHAudioCallViewController *v3;
  void *v4;

  audioCallViewController = self->_audioCallViewController;
  if (audioCallViewController)
  {
    v3 = audioCallViewController;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](self, "callManager"));
    v3 = (PHAudioCallViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "audioCallViewController"));

  }
  return v3;
}

- (UINavigationController)audioCallNavigationController
{
  void *v3;
  unsigned int v4;
  void *v5;
  UINavigationController *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](self, "features"));
  v4 = objc_msgSend(v3, "callManagerEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](self, "callManager"));
    v6 = (UINavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioCallNavController"));

  }
  else
  {
    v6 = self->_audioCallNavigationController;
  }
  return v6;
}

- (void)callStateChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callStateChangedNotification", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  -[PHInCallRootViewController updateAlertActivationReasonForCall:](self, "updateAlertActivationReasonForCall:", v7);
  -[PHInCallRootViewController updateRemoteAlertSwipeDismissalStyleForCall:](self, "updateRemoteAlertSwipeDismissalStyleForCall:", v7);
  -[PHInCallRootViewController prepareToDismissScreenTime](self, "prepareToDismissScreenTime");
  -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
  -[PHInCallRootViewController dismissScreenTimeAlertHostIfNeeded](self, "dismissScreenTimeAlertHostIfNeeded");
  -[PHInCallRootViewController dismissPhoneRemoteViewController](self, "dismissPhoneRemoteViewController");
  -[PHInCallRootViewController dismissContactsViewController](self, "dismissContactsViewController");
  -[PHInCallRootViewController updateTransportIndicatorView](self, "updateTransportIndicatorView");
  -[PHInCallRootViewController undimScreenIfNecessary:](self, "undimScreenIfNecessary:", v7);

}

- (void)callDisplayContextChanged:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callDisplayContextChanged", v9, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](self, "callManager"));
  objc_msgSend(v8, "updateWithCall:", v7);

}

- (void)videoCallStateChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "videoCallStateChangedNotification", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  -[PHInCallRootViewController updateCallForUserFeedback](self, "updateCallForUserFeedback");
  -[PHInCallRootViewController updateAlertActivationReasonForCall:](self, "updateAlertActivationReasonForCall:", v7);
  -[PHInCallRootViewController showFailureAlertIfNecessaryForCall:](self, "showFailureAlertIfNecessaryForCall:", v7);
  -[PHInCallRootViewController prepareToDismissScreenTime](self, "prepareToDismissScreenTime");
  -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
  -[PHInCallRootViewController dismissScreenTimeAlertHostIfNeeded](self, "dismissScreenTimeAlertHostIfNeeded");
  -[PHInCallRootViewController dismissPhoneRemoteViewController](self, "dismissPhoneRemoteViewController");
  -[PHInCallRootViewController dismissContactsViewController](self, "dismissContactsViewController");
  -[PHInCallRootViewController updateTransportIndicatorView](self, "updateTransportIndicatorView");
  -[PHInCallRootViewController updateUPlusOneVideoCallViews](self, "updateUPlusOneVideoCallViews");
  -[PHInCallRootViewController undimScreenIfNecessary:](self, "undimScreenIfNecessary:", v7);

}

- (void)callConnectedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "callConnectedNotification", v6, 2u);
  }

  -[PHInCallRootViewController updateUPlusOneVideoCallViews](self, "updateUPlusOneVideoCallViews");
  -[PHInCallRootViewController transitionFromBannerToDismissedIfNecessary](self, "transitionFromBannerToDismissedIfNecessary");
  -[PHInCallRootViewController updateBackgroundStartPipAuthorizationState](self, "updateBackgroundStartPipAuthorizationState");
}

- (void)willTransitionToFullScreenNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "willTransitionToFullScreenNotification", v12, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  v9 = objc_msgSend(v8, "isPresentingFullScreenCallUI");

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v11 = objc_msgSend(v10, "isEqual:", &off_100296910);

    if (v11)
      -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
  }

}

- (void)remoteParticipantHandlesChangedNotification:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "remoteParticipantHandlesChangedNotification for call: %@", (uint8_t *)&v8, 0xCu);

  }
  if (objc_msgSend(v4, "isConversation"))
    -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");

}

- (void)undimScreenIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  if (objc_msgSend(a3, "status") == 4)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v10, "_backlightLuminance") == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentInCallScene"));
      v7 = objc_msgSend(v6, "presentationMode");

      if (v7 == (id)2)
      {
        v8 = sub_1000C5588();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Undim screen", buf, 2u);
        }

        SBSUndimScreen();
      }
    }
    else
    {

    }
  }
}

- (void)transitionFromBannerToDismissedIfNecessary
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
  v4 = objc_msgSend(v3, "expanseEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "frontmostAudioOrVideoCall"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeConversationForCall:", v6));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "provider"));
    v10 = objc_msgSend(v9, "isFaceTimeProvider");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentInCallScene"));
      v15 = objc_msgSend(v14, "presentationMode");

      if (objc_msgSend(v8, "resolvedAudioVideoMode") == (id)1 && objc_msgSend(v6, "status") == 1)
        v16 = objc_msgSend(v6, "wantsHoldMusic");
      else
        v16 = 1;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v18 = objc_msgSend(v17, "currentAudioAndVideoCallCount");

      if (v18 == (id)1 && (v16 & 1) == 0 && v11 && v15 == (id)1)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000A69DC;
        v19[3] = &unk_100285158;
        v19[4] = self;
        v20 = v6;
        TUDispatchMainIfNecessary(v19);

      }
    }

  }
}

- (void)callUpgradedToVideoNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callUpgradedToVideoNotification", v7, 2u);
  }

  -[PHInCallRootViewController videoCallStateChangedNotification:](self, "videoCallStateChangedNotification:", v4);
}

- (void)updateCallForUserFeedback
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
  v4 = objc_msgSend(v3, "FTUserScore");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentVideoCall"));

    if (objc_msgSend(v6, "isConnected")
      && (objc_msgSend(v6, "status") == 5 || objc_msgSend(v6, "status") == 6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
      v8 = objc_msgSend(v7, "hasUserScoreFeedbackViewHidden");

      v9 = sub_1000C5588();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if ((v8 & 1) != 0)
      {
        if (v11)
        {
          *(_WORD *)v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UserFeedbackScore : No Assertion Added, send to TU immediately", v16, 2u);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController disconnectCallUUID](self, "disconnectCallUUID"));
        objc_msgSend(v12, "sendUserScoreToRTCReporting:withScore:", v13, 0);

      }
      else
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UserFeedbackScore : adding Assertion to show feedback view", buf, 2u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callUUID"));
        -[PHInCallRootViewController setDisconnectCallUUID:](self, "setDisconnectCallUUID:", v14);

        objc_msgSend((id)objc_opt_class(self, v15), "obtainDismissalAssertionForReason:", CFSTR("PHUserScoreShowingAssertionReason"));
      }
    }

  }
}

- (void)didEnterVideoMessagingFlow
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Entering video messaging flow", v4, 2u);
  }

  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHVideoMessageInProgressAssertionReason"));
}

- (void)didExitVideoMessagingFlow
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Exiting video messaging flow", v4, 2u);
  }

  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHVideoMessageInProgressAssertionReason"));
}

- (void)beganRecordingVideoMessage
{
  -[PHInCallRootViewController obtainIdleTimerAssertionWithComment:](self, "obtainIdleTimerAssertionWithComment:", CFSTR("Start recording video message"));
}

- (void)endedRecordingVideoMessage
{
  -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](self, "releaseIdleTimerAssertionWithComment:", CFSTR("Stopped recording video message"));
}

- (void)_loadUserFeedbackViewController
{
  PHUserFeedbackViewController *v3;
  PHUserFeedbackViewController *userFeedbackViewController;
  ScoreController *v5;

  if (!self->_userFeedbackViewController)
  {
    v5 = objc_alloc_init(ScoreController);
    -[ScoreController setDelegate:](v5, "setDelegate:", self);
    v3 = -[PHUserFeedbackViewController initWithScoreController:]([PHUserFeedbackViewController alloc], "initWithScoreController:", v5);
    userFeedbackViewController = self->_userFeedbackViewController;
    self->_userFeedbackViewController = v3;

  }
}

- (void)callDowngradedToAudioNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callDowngradedToAudioNotification: %@", buf, 0xCu);
  }

  -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if ((objc_msgSend(v7, "isEndpointOnCurrentDevice") & 1) == 0)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Call's endpoint is on another device, releasing dismissal assertions", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController dismissalAssertionReason](PHAudioCallViewController, "dismissalAssertionReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, CFSTR("PHTransitioningBetweenViewControllersAssertionReason"), 0));

    objc_msgSend((id)objc_opt_class(self, v12), "releaseDismissalAssertionReasons:", v11);
  }

}

- (void)callContinuityChangedNotification:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (objc_msgSend(v4, "isConversation")
    && (objc_msgSend(v4, "isEndpointOnCurrentDevice") & 1) == 0)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Multiway call's endpoint is on another device, releasing dismissal assertions", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("PHMulitwayCallAssertionReason"), CFSTR("PHTransitioningBetweenViewControllersAssertionReason"), 0));
    objc_msgSend((id)objc_opt_class(self, v8), "releaseDismissalAssertionReasons:", v7);

  }
}

- (void)pipStateChangedNotification:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  char *v23;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  v7 = (char *)objc_msgSend(v6, "pipState");

  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134217984;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "pipStateChangedNotification; new state=%lu",
      (uint8_t *)&v22,
      0xCu);
  }

  if ((unint64_t)(v7 - 1) <= 1
    && (v10 = -[PHInCallRootViewController shouldStartMultiwayPIP](self, "shouldStartMultiwayPIP"), (_DWORD)v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));

    if (v11)
    {
      -[PHInCallRootViewController transitionIntoPiP](self, "transitionIntoPiP");
    }
    else
    {
      v18 = sub_1000C5588();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "MultiwayViewController isn't ready for initial PiP yet; will transition into PiP on next notification",
          (uint8_t *)&v22,
          2u);
      }

    }
  }
  else
  {
    if (v7 == (char *)3 || v7 == 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pipViewController](v9, "pipViewController"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentViewController"));
      if (v10)
      {
        v13 = 1;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController oldMultiwayPIPViewController](self, "oldMultiwayPIPViewController"));
        v13 = v14 != 0;

        v10 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    if (v7 == (char *)3 || !v7)
    {

    }
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
      objc_msgSend(v15, "setPipState:", v7);

      if (v7)
        goto LABEL_28;
    }
    else
    {
      if (v7)
        goto LABEL_28;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
        objc_msgSend(v17, "updatePIPFrame");

      }
    }
    -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
  }
LABEL_28:
  -[PHInCallRootViewController updateMultiwayViewControllerUIState](self, "updateMultiwayViewControllerUIState");
  -[PHInCallRootViewController updateCallDetailsViewIsOnScreen](self, "updateCallDetailsViewIsOnScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  if (v20 == v21)
    -[PHInCallRootViewController updateBackgroundStartPipAuthorizationState](self, "updateBackgroundStartPipAuthorizationState");
}

- (void)pipStashChangedNotification:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController", a3));
  v5 = objc_msgSend(v4, "isPIPProxyActiveAndHidden");

  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = (_DWORD)v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "pipStashChangedNotification; isStashed=%u",
      (uint8_t *)v9,
      8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  objc_msgSend(v8, "setIsPipStashed:", v5);

}

- (void)transitionIntoPiP
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Transitioning into PiP now", v10, 2u);
  }

  -[PHInCallRootViewController updateMultiwayViewControllerUIState](self, "updateMultiwayViewControllerUIState");
  v6 = (void *)objc_opt_class(self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  v8 = objc_msgSend(v6, "uiDeviceOrientationForCNKDeviceOrientation:", objc_msgSend(v7, "fullScreenFocusedParticipantOrientation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v9, "setPipDeviceOrientation:", v8);

}

- (void)pipProxyActiveChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pipProxyActiveChangedNotification", v6, 2u);
  }

  -[PHInCallRootViewController updateMultiwayViewControllerUIState](self, "updateMultiwayViewControllerUIState");
}

- (void)handlePIPViewControllerRestoredAfterPIPStopped:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  int v29;
  void *v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v14, "setBounds:", v7, v9, v11, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  objc_msgSend(v15, "center");
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));

  objc_msgSend(v20, "setCenter:", v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pipViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "parentViewController"));
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pipViewController"));

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController oldMultiwayPIPViewController](self, "oldMultiwayPIPViewController"));
  }

  v26 = sub_1000C5588();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v28)
    {
      v29 = 138412290;
      v30 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Cross-fading away from PIP view controller %@", (uint8_t *)&v29, 0xCu);
    }

    -[PHInCallRootViewController setOldMultiwayPIPViewController:](self, "setOldMultiwayPIPViewController:", 0);
  }
  else
  {
    if (v28)
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Not performing cross-fade for PIP stop because there's no multiway PIP view controller", (uint8_t *)&v29, 2u);
    }

  }
}

- (BOOL)shouldStartMultiwayPIP
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNKMultiwayViewControllerProtocol view](self->_multiwayViewController, "view"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  v6 = -[CNKMultiwayViewControllerProtocol isChildOf:](self->_multiwayViewController, "isChildOf:", self);

  if ((v6 & 1) == 0)
  {
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v7 = objc_msgSend(v8, "callDisplayStyle") == (id)4;

    return v7;
  }
  return 1;
}

- (void)handlePIPInterruptionChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handlePIPInterruptionChangeNotification", buf, 2u);
  }

  if (-[PHInCallRootViewController isDisplayStyleMiniWindow](self, "isDisplayStyleMiniWindow"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v7 = objc_msgSend(v6, "isPIPProxyInterrupted");

    if (v7)
    {
      v8 = sub_1000C5588();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PIP is interrupted and display style is mini window, attempting to show mini window view.", v10, 2u);
      }

      -[PHInCallRootViewController showHideMiniWindowViewIfNeededAnimated:](self, "showHideMiniWindowViewIfNeededAnimated:", 0);
    }
  }
  -[PHInCallRootViewController updateMultiwayViewControllerUIState](self, "updateMultiwayViewControllerUIState");
}

- (void)handleSystemInitiatedPIPInterruptionStoppedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneSessionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentInCallScene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "session"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentIdentifier"));
  v11 = objc_msgSend(v5, "isEqualToString:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pipInterruptedCallIdentifier"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "callWithUniqueProxyIdentifier:", v13));

    v16 = sub_1000C5588();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "handleSystemInitiatedPIPInterruptionStoppedNotification for call identifier: %@", (uint8_t *)&v26, 0xCu);
    }

    if (-[NSObject length](v13, "length") && v15)
    {
      v18 = sub_1000C5588();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138412290;
        v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Call %@ which was originally pip interrupted has been uninterrupted. Stop that calls video since the interruption-stop was not user-initiated", (uint8_t *)&v26, 0xCu);
      }

      if (objc_msgSend(v15, "isConversation"))
      {
        objc_msgSend(v15, "setRemoteVideoPresentationState:", 0);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "frontmostAudioOrVideoCall"));
        v23 = objc_msgSend(v22, "isVideo");

        if ((v23 & 1) == 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "videoDeviceController"));
          objc_msgSend(v25, "stopPreview");

        }
      }
      objc_msgSend(v15, "setIsSendingVideo:", 0);
    }

  }
  else
  {
    v20 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Not handling PHPIPControllerSystemInitiatedPIPInterruptionStoppedNotification since scene does not match the scene currently used by InCallService.", (uint8_t *)&v26, 2u);
    }
  }

}

- (void)pipControllerDidRequestReturnToFullScreenNotification:(id)a3
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences", a3));
  v5 = objc_msgSend(v4, "hasAdoptedModernInCallAPI");

  if ((v5 & 1) == 0)
    -[PHInCallRootViewController animateToAlert](self, "animateToAlert");
}

- (BOOL)shouldShowSOS
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  if (objc_msgSend(v3, "currentCallCount"))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    if (objc_msgSend(v5, "currentVideoCallCount"))
      v4 = 0;
    else
      v4 = +[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive");

  }
  return v4;
}

- (BOOL)shouldShowScreenTimeShield
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[PHInCallRootViewController shouldShowSOS](self, "shouldShowSOS"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController filteredRequest](self, "filteredRequest"));
  if (v4
    && objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHScreenTimeAlertAssertionReason")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "incomingVideoCall"));
    if (v6)
    {
      v3 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "incomingCall"));
      v3 = v8 == 0;

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)shouldShowVideoCallBlockAndReportScreen
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  BOOL v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentVideoCall"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentVideoCall"));
LABEL_7:

    v13 = -[PHInCallRootViewController shouldShowCallEndedBlockAndReportScreen:](self, "shouldShowCallEndedBlockAndReportScreen:", v6);
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mostRecentlyDisconnectedVideoCall"));

  v10 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v10);
  v11 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[self.callCenter currentVideoCall] is nil, using mostRecentlyDisconnectedVideoCall", buf, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mostRecentlyDisconnectedVideoCall"));

    goto LABEL_7;
  }
  if (v11)
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICSAppDelegate.mostRecentlyDisconnectedVideoCall is nil so shouldShowVideoCallBlockAndReportScreen is false", v15, 2u);
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (BOOL)shouldShowCallEndedBlockAndReportScreen:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  unsigned int v31;
  id v32;
  NSObject *v33;
  unsigned int v34;
  id v35;
  NSObject *v36;
  int v37;
  _BOOL4 v38;
  __int16 v39;
  unsigned int v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](FTDeviceSupport, "sharedInstance"));
  v6 = objc_msgSend(v5, "isGreenTea");

  if ((v6 & 1) == 0)
  {
    v11 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      v10 = "not a greentea device, so we don't show the end call screen";
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v12) = 0;
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));

  if (v7)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      v10 = "it's a contact so we don't show the end call screen";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v37, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
  v15 = objc_msgSend(v14, "isFaceTimeProvider");

  if ((v15 & 1) == 0)
  {
    v17 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    LOWORD(v37) = 0;
    v10 = "it's not a FaceTime call so we don't show the end call screen";
    goto LABEL_7;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateConnected"));

  if (!v12)
  {
    v18 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    LOWORD(v37) = 0;
    v10 = "call was never connnected so we don't show the end call screen";
    goto LABEL_7;
  }
  if (-[PHInCallRootViewController isContactBlockedWithCall:](self, "isContactBlockedWithCall:", v4))
  {
    v16 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    LOWORD(v37) = 0;
    v10 = "the caller is already blocked, so we don't show the end call screen";
    goto LABEL_7;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "normalizedValue"));
  v23 = -[PHInCallRootViewController isFirstTimeInCallHistoryWithHandleValue:normalizedHandleValue:](self, "isFirstTimeInCallHistoryWithHandleValue:normalizedHandleValue:", v20, v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "value"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "normalizedValue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
  v9 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController findMostRecentSilencedCallWithHandleValue:normalizedHandleValue:ignoredIdentifier:](self, "findMostRecentSilencedCallWithHandleValue:normalizedHandleValue:ignoredIdentifier:", v25, v27, v28));

  if (v23)
    LODWORD(v12) = objc_msgSend(v4, "isIncoming");
  else
    LODWORD(v12) = 0;
  v29 = sub_1000C5588();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v37 = 67109376;
    v38 = v23;
    v39 = 1024;
    v40 = objc_msgSend(v4, "isIncoming");
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "(isFirstTimeInCallHistory :%d && call.isIncoming: %d)", (uint8_t *)&v37, 0xEu);
  }

  if (v9)
    v31 = objc_msgSend(v4, "isOutgoing");
  else
    v31 = 0;
  v32 = sub_1000C5588();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_msgSend(v4, "isOutgoing");
    v37 = 67109376;
    v38 = v9 != 0;
    v39 = 1024;
    v40 = v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "(filteredMostRecent != nil :%d && disconnectedCall.isOutgoing: %d", (uint8_t *)&v37, 0xEu);
  }

  v35 = sub_1000C5588();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = 67109376;
    v38 = v12;
    v39 = 1024;
    v40 = v31;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "shouldShowCallEndedBlockAndReportScreen: \n (isUnknownFirstTimeCallerConnectedIncomingCall: %d || isFilteredConnectedOutgoingCall): %d \n", (uint8_t *)&v37, 0xEu);
  }

  LOBYTE(v12) = v12 | v31;
LABEL_9:

  return v12;
}

- (BOOL)shouldExitVideoMessageFlowConsideringShowAudioController:(BOOL)a3 showEmergencyCallController:(BOOL)a4 showSOSController:(BOOL)a5 showScreenTimeController:(BOOL)a6 showUserScoreController:(BOOL)a7 showPTTFullScreenController:(BOOL)a8
{
  return a8 || a3 || a4 || a5 || a6;
}

- (void)updateCallControllerForCurrentState
{
  PHInCallRootViewController *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  unsigned int v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  unsigned int v37;
  NSObject *v38;
  uint64_t v39;
  unsigned int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  int HasChinaSKU;
  id v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  _UNKNOWN **v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  unsigned int v68;
  void *v69;
  void *v70;
  unsigned int v71;
  unsigned int v72;
  void *v73;
  unsigned int v74;
  id v75;
  NSObject *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  unsigned int v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  id v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  id v94;
  BOOL v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  unsigned int v101;
  void *v102;
  void *v103;
  int v104;
  int v105;
  int v106;
  _UNKNOWN **v107;
  unsigned int v108;
  id v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t p_superclass;
  void *v117;
  void *v118;
  unsigned int v119;
  id v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  unint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  NSObject *v132;
  PHEmergencyDialerViewController *emergencyDialerViewController;
  PHEmergencyDialerViewController *v134;
  PHEmergencyDialerViewController *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  NSObject *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  const __CFString *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  NSObject *v157;
  id v158;
  NSObject *v159;
  void *v160;
  void *v161;
  NSObject *v162;
  void *v163;
  id v164;
  NSObject *v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  NSObject *v173;
  unsigned int v174;
  id v175;
  NSObject *v176;
  id v177;
  void *v178;
  id v179;
  NSObject *v180;
  NSObject *v181;
  void *v182;
  unsigned int v183;
  void *v184;
  unsigned __int8 v185;
  id v186;
  void *v187;
  unsigned __int8 v188;
  id v189;
  NSObject *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  id v197;
  NSObject *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  NSObject *v206;
  const char *v207;
  NSObject *v208;
  uint32_t v209;
  id v210;
  NSObject *v211;
  void *v212;
  void *v213;
  id v214;
  NSObject *v215;
  NSObject *v216;
  id v217;
  NSObject *v218;
  void *v219;
  void *v220;
  id v221;
  NSObject *v222;
  void *v223;
  void *v224;
  void *v225;
  unsigned __int8 v226;
  id v227;
  NSObject *v228;
  void *v229;
  void *v230;
  unsigned int v231;
  void *v232;
  id v233;
  NSObject *v234;
  id v235;
  id v236;
  void *v237;
  void *v238;
  void *v239;
  unsigned __int8 v240;
  void *v241;
  void *v242;
  void *v243;
  char v244;
  id v245;
  NSObject *v246;
  void *v247;
  void *v248;
  unsigned int v249;
  void *v250;
  void *v251;
  void *v252;
  id v253;
  NSObject *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  id v259;
  void *v260;
  void *v261;
  void *v262;
  id v263;
  NSObject *v264;
  id v265;
  id v266;
  NSObject *v267;
  id v268;
  NSObject *v269;
  id v270;
  NSObject *v271;
  id v272;
  NSObject *v273;
  void *v274;
  uint64_t v275;
  char v276;
  int v277;
  void *v278;
  void *v279;
  unsigned int v280;
  uint64_t v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  int v287;
  void *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  NSObject *v292;
  PHInCallRootViewController *v293;
  int v294;
  void *v295;
  _QWORD v296[4];
  NSObject *v297;
  uint8_t buf[4];
  uint64_t v299;
  __int16 v300;
  uint64_t v301;
  _QWORD v302[2];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](self, "features"));
  v4 = objc_msgSend(v3, "callManagerEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
    objc_msgSend(v5, "setIgnoreUpdates:", 0);

  }
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "InCallRootViewController updateCallControllerForCurrentState", buf, 2u);
  }

  if (!-[PHInCallRootViewController hasEverAppearedInWindow](v2, "hasEverAppearedInWindow")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](v2, "view")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window")),
        v9,
        v8,
        v9))
  {
    v10 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](v2, "callCenter"));
    v11 = objc_claimAutoreleasedReturnValue(-[NSObject incomingCall](v10, "incomingCall"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mostRecentlyDisconnectedAudioCall"));
    if (objc_msgSend(v14, "disconnectedReasonRequiresCallBackUI"))
    {
      v15 = !+[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked");
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mostRecentlyDisconnectedAudioCall"));
      if (objc_msgSend(v18, "shouldShowFailureAlert"))
        v15 = !+[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked");
      else
        v15 = 0;

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mostRecentlyDisconnectedVideoCall"));
    v293 = v2;
    if (objc_msgSend(v21, "disconnectedReasonRequiresCallBackUI"))
    {
      v22 = !+[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked");
    }
    else
    {
      v23 = v15;
      v24 = v10;
      v25 = v11;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "delegate"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mostRecentlyDisconnectedVideoCall"));
      if (objc_msgSend(v28, "shouldShowFailureAlert"))
        v29 = !+[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked");
      else
        v29 = 0;

      v22 = v29;
      v11 = v25;
      v10 = v24;
      v15 = v23;
      v2 = v293;
    }

    v30 = objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHRedialCallAssertionReason"));
    if ((v15 | v22) == 1)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
      v32 = objc_msgSend(v31, "pipState");

      if (v32 == (id)2)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
        objc_msgSend(v33, "cancelPIPIfNeeded");

      }
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bargeCalls](v10, "bargeCalls"));
    v35 = objc_msgSend(v34, "count");

    v295 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject callsPassingTest:](v10, "callsPassingTest:", &stru_100287170));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject frontmostCall](v10, "frontmostCall"));
    if (objc_msgSend(v36, "isActive"))
    {
      v37 = v15;
      v38 = v10;
      v39 = v11;
      v40 = v22;
      v41 = v38;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject frontmostCall](v38, "frontmostCall"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "provider"));
      if ((objc_msgSend(v43, "supportsDynamicSystemUI") & 1) != 0)
      {
        v44 = objc_msgSend(v295, "count");

        v22 = v40;
        v11 = v39;
        v10 = v41;
        v15 = v37;
        v2 = v293;
        if (v44)
          goto LABEL_32;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](v293, "featureFlags"));
        if (objc_msgSend(v36, "groupConversations"))
        {
          HasChinaSKU = TUDeviceHasChinaSKU();

          if (HasChinaSKU)
          {
            v46 = sub_1000C5588();
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Releasing dismissal assertions and presenting GreenTea3P HUD because only a GroupConversation call remains active.", buf, 2u);
            }

            +[PHInCallRootViewController releaseDismissalAssertionReasons:](PHInCallRootViewController, "releaseDismissalAssertionReasons:", qword_1002DCB40);
            v48 = objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject delegate](v48, "delegate"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bannerPresentationManager"));
            objc_msgSend(v50, "showGreenTea3PHUD");

            goto LABEL_275;
          }
LABEL_32:
          if ((-[NSObject hasCurrentCalls](v10, "hasCurrentCalls") & 1) == 0
            && ((+[TUCallCapabilities isEmergencyCallbackModeEnabled](TUCallCapabilities, "isEmergencyCallbackModeEnabled") | v15 | v22) & 1) == 0&& !-[PHInCallRootViewController shouldShowVideoCallBlockAndReportScreen](v2, "shouldShowVideoCallBlockAndReportScreen")&& !-[PHInCallRootViewController shouldShowSOS](v2, "shouldShowSOS")&& !-[PHInCallRootViewController shouldShowScreenTimeShield](v2, "shouldShowScreenTimeShield")&& ((objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHUserScoreShowingAssertionReason")) | v30) & 1) == 0&& !v35&& (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHAVLessConversationDetailsViewAssertionReason")) & 1) == 0&& (objc_msgSend((id)qword_1002DCB40, "containsObject:",
                                CFSTR("PHAVLessConversationAssertionReason")) & 1) == 0
            && (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHVideoMessageInProgressAssertionReason")) & 1) == 0&& (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHCallEndedBlockAndReportInProgressAssertionReason")) & 1) == 0)
          {
            v163 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
            objc_msgSend(v163, "cancelPIPIfNeeded");

            v164 = sub_1000C5588();
            v165 = objc_claimAutoreleasedReturnValue(v164);
            if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_DEFAULT, "InCallRootViewController doesn't need to show anything", buf, 2u);
            }

            v166 = objc_alloc((Class)NSSet);
            v167 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController dismissalAssertionReason](PHAudioCallViewController, "dismissalAssertionReason"));
            v302[0] = v167;
            v302[1] = CFSTR("PHMulitwayCallAssertionReason");
            v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v302, 2));
            v48 = objc_msgSend(v166, "initWithArray:", v168);

            +[PHInCallRootViewController releaseDismissalAssertionReasons:](PHInCallRootViewController, "releaseDismissalAssertionReasons:", v48);
            goto LABEL_275;
          }
          if (-[NSObject anyCallPassesTest:](v10, "anyCallPassesTest:", &stru_100287190))
          {
            v51 = sub_1000C5588();
            v48 = objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Ringing call wants suppressed UI, not displaying a view controller.", buf, 2u);
            }
            goto LABEL_275;
          }
          HIDWORD(v275) = v22;
          v281 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](v2, "currentViewController"));
          if (v2->_videoCallNavigationController == (UINavigationController *)v281)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[CNKMultiwayViewControllerProtocol view](v2->_multiwayViewController, "view"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "superview"));
            if (v55)
            {
              v56 = (void *)objc_claimAutoreleasedReturnValue(-[CNKMultiwayViewControllerProtocol parentViewController](v2->_multiwayViewController, "parentViewController"));
              LODWORD(v275) = v56 != 0;

            }
            else
            {
              LODWORD(v275) = 0;
            }
            v52 = CNKTranscriptionViewComposerFactory_ptr;

          }
          else
          {
            LODWORD(v275) = 0;
            v52 = CNKTranscriptionViewComposerFactory_ptr;
          }
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentAudioAndVideoCalls](v10, "currentAudioAndVideoCalls", v275));
          v58 = objc_msgSend(v57, "count");

          v296[0] = _NSConcreteStackBlock;
          v296[1] = 3221225472;
          v296[2] = sub_1000AA908;
          v296[3] = &unk_1002871B8;
          v59 = v10;
          v297 = v59;
          v288 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject callPassingTest:](v59, "callPassingTest:", v296));
          v284 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject callPassingTest:](v59, "callPassingTest:", &stru_1002871D8));
          v291 = objc_claimAutoreleasedReturnValue(-[NSObject callPassingTest:](v59, "callPassingTest:", &stru_1002871F8));
          v283 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject callPassingTest:](v59, "callPassingTest:", &stru_100287218));
          v282 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject callPassingTest:](v59, "callPassingTest:", &stru_100287238));
          v60 = objc_claimAutoreleasedReturnValue(-[NSObject callWithStatus:](v59, "callWithStatus:", 2));
          if (v60)
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
            objc_msgSend(v61, "updateWithCall:", v60);

          }
          v62 = objc_claimAutoreleasedReturnValue(-[NSObject callPassingTest:](v59, "callPassingTest:", &stru_100287258));
          if (v62)
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
            objc_msgSend(v63, "updateWithCall:", v62);

          }
          v279 = (void *)v62;
          v285 = (void *)v60;
          v290 = v11;
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52[214], "sharedApplication"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "delegate"));
          v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "mostRecentlyDisconnectedVideoCall"));

          if (v66)
          {
            v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
            objc_msgSend(v67, "updateWithCall:", v66);

          }
          v278 = (void *)v66;
          v68 = -[NSObject anyCallPassesTest:](v59, "anyCallPassesTest:", &stru_100287278);
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52[214], "sharedApplication"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "delegate"));
          v286 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "mostRecentlyDisconnectedVideoCall"));

          v71 = -[NSObject hasCurrentVideoCalls](v59, "hasCurrentVideoCalls");
          v72 = -[NSObject ics_hasTooManyCallsForCallWaitingBanner](v59, "ics_hasTooManyCallsForCallWaitingBanner");
          if (v11)
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
            objc_msgSend(v73, "updateWithCall:", v11);

          }
          v74 = !-[PHInCallRootViewController shouldShowScreenTimeShield](v2, "shouldShowScreenTimeShield") | v68;
          if ((v74 & 1) == 0)
          {
            v81 = sub_1000C5588();
            v82 = objc_claimAutoreleasedReturnValue(v81);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController filteredRequest](v2, "filteredRequest"));
              *(_DWORD *)buf = 138412290;
              v299 = (uint64_t)v83;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show screen time host view controller for request %@", buf, 0xCu);

            }
            v292 = 0;
            LODWORD(v84) = 0;
            if (!v286)
            {
              v289 = 0x100000000;
              v85 = 0;
              v86 = 0;
              goto LABEL_78;
            }
            v85 = 0;
            v86 = 0;
            LODWORD(v289) = 0;
            goto LABEL_73;
          }
          if (v291)
          {
            v75 = sub_1000C5588();
            v76 = objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v299 = v291;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Showing video controller for ringing video call %@", buf, 0xCu);
            }
            v77 = v286;

            if (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHCallEndedBlockAndReportInProgressAssertionReason")))
            {
              v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
              objc_msgSend(v78, "setIsInCallEndedBlockAndReportFlow:", 0);

              objc_msgSend((id)objc_opt_class(v2, v79), "releaseDismissalAssertionForReason:", CFSTR("PHCallEndedBlockAndReportInProgressAssertionReason"));
            }
            v80 = (void *)v291;
            goto LABEL_72;
          }
          if (v58 == (id)1 && v288)
          {
            v77 = v286;
            v87 = sub_1000C5588();
            v88 = objc_claimAutoreleasedReturnValue(v87);
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v299 = (uint64_t)v288;
              _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Showing multiway controller for not-ringing multiway call %@", buf, 0xCu);
            }

            v80 = v288;
LABEL_72:
            v292 = v80;
            LODWORD(v84) = 0;
            v85 = 0;
            v86 = 0;
            v289 = 0;
            if (!v77)
              goto LABEL_78;
            goto LABEL_73;
          }
          if (v11)
          {
            v161 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](v2, "features"));
            if (((objc_msgSend(v161, "shouldShowFullScreenCallWaiting") | v72 | v71 ^ 1) & 1) != 0)
            {

LABEL_209:
              v204 = v286;
              v205 = sub_1000C5588();
              v206 = objc_claimAutoreleasedReturnValue(v205);
              if (!os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
                goto LABEL_212;
              *(_DWORD *)buf = 138412290;
              v299 = v11;
              v207 = "Showing audio controller for incomingCall %@";
              v208 = v206;
              v209 = 12;
              goto LABEL_211;
            }
            v201 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](v2, "features"));
            if ((objc_msgSend(v201, "callManagerEnabled") & 1) != 0)
            {
              v202 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
              v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "presentedFullScreenedCall"));

              if (v203)
                goto LABEL_209;
            }
            else
            {

            }
LABEL_219:
            if (objc_msgSend(v284, "isConversation"))
            {
              v214 = sub_1000C5588();
              v215 = objc_claimAutoreleasedReturnValue(v214);
              if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v299 = (uint64_t)v284;
                _os_log_impl((void *)&_mh_execute_header, v215, OS_LOG_TYPE_DEFAULT, "Showing multiway controller for sending video call %@", buf, 0xCu);
              }

              v216 = v284;
              goto LABEL_223;
            }
            if (v283 && !v284 && !v282)
            {
              if (objc_msgSend(v283, "isScreening"))
                -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](v2, "releaseIdleTimerAssertionWithComment:", CFSTR("Showing audio controller for Screening, enabling idleTimer"));
              v217 = sub_1000C5588();
              v218 = objc_claimAutoreleasedReturnValue(v217);
              if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v299 = (uint64_t)v283;
                _os_log_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_DEFAULT, "Showing audio controller for active audio call %@", buf, 0xCu);
              }

              v292 = 0;
              LODWORD(v84) = 1;
LABEL_282:
              v248 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](v2, "features"));
              v249 = objc_msgSend(v248, "callManagerEnabled");
              if ((v84 & 1) == 0 && v249)
              {
                v250 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
                v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v250, "presentedFullScreenedCall"));

                if (v84)
                {
                  v251 = v286;
                  goto LABEL_286;
                }
                v252 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
                objc_msgSend(v252, "cleanUp");

                v248 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
                objc_msgSend(v248, "setIgnoreUpdates:", 1);
              }

              v85 = 0;
              v86 = 0;
              v289 = 0;
              if (v286)
                goto LABEL_73;
              goto LABEL_78;
            }
            v223 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentVideoCalls](v59, "currentVideoCalls"));
            if (objc_msgSend(v223, "count") == (id)1)
            {
              v224 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentVideoCalls](v59, "currentVideoCalls"));
              v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v224, "objectAtIndex:", 0));
              v226 = objc_msgSend(v225, "isConversation");

              if ((v226 & 1) != 0)
              {
                if (!v282)
                {
                  v292 = 0;
                  goto LABEL_281;
                }
                v227 = sub_1000C5588();
                v228 = objc_claimAutoreleasedReturnValue(v227);
                if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v299 = (uint64_t)v282;
                  _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_DEFAULT, "Showing video controller for active video call %@", buf, 0xCu);
                }

                v216 = v282;
LABEL_223:
                v292 = v216;
LABEL_281:
                LODWORD(v84) = 0;
                goto LABEL_282;
              }
            }
            else
            {

            }
            v245 = sub_1000C5588();
            v246 = objc_claimAutoreleasedReturnValue(v245);
            if (os_log_type_enabled(v246, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_DEFAULT, "Showing video controller", buf, 2u);
            }

            v247 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentVideoCalls](v59, "currentVideoCalls"));
            v292 = objc_claimAutoreleasedReturnValue(objc_msgSend(v247, "objectAtIndex:", 0));

            goto LABEL_281;
          }
          if (v71)
            goto LABEL_219;
          if (-[NSObject currentCallCount](v59, "currentCallCount"))
          {
            if (v281)
            {
              v174 = (PHEmergencyDialerViewController *)v281 == v2->_emergencyDialerViewController ? v68 : 0;
              if (v174 == 1)
              {
                v175 = sub_1000C5588();
                v176 = objc_claimAutoreleasedReturnValue(v175);
                if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                {
                  v177 = (id)objc_claimAutoreleasedReturnValue(-[NSObject currentCalls](v59, "currentCalls"));
                  *(_DWORD *)buf = 138412546;
                  v299 = (uint64_t)v177;
                  v300 = 2112;
                  v301 = v281;
                  _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show emergency viewcontroller for currentCalls %@ (the view controller currently being shown is %@)", buf, 0x16u);

                }
                LODWORD(v84) = 0;
                v86 = 0;
                v292 = 0;
                v289 = 0;
                v85 = 1;
                if (v286)
                  goto LABEL_73;
                goto LABEL_78;
              }
            }
            if (-[NSObject currentCallCount](v59, "currentCallCount") == (id)1)
            {
              v229 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentCalls](v59, "currentCalls"));
              v230 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v229, "objectAtIndexedSubscript:", 0));
              v231 = objc_msgSend(v230, "isScreening");

              if (v231)
                -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](v2, "releaseIdleTimerAssertionWithComment:", CFSTR("Showing audio controller for Screening, enabling idleTimer"));
            }
            v232 = v286;
            v233 = sub_1000C5588();
            v234 = objc_claimAutoreleasedReturnValue(v233);
            if (!os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT))
              goto LABEL_253;
            v235 = (id)objc_claimAutoreleasedReturnValue(-[NSObject currentCalls](v59, "currentCalls"));
            *(_DWORD *)buf = 138412546;
            v299 = (uint64_t)v235;
            v300 = 2112;
            v301 = v281;
            _os_log_impl((void *)&_mh_execute_header, v234, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show audio viewcontroller for currentCalls %@ (the view controller currently being shown is %@)", buf, 0x16u);

            goto LABEL_252;
          }
          if (v15)
          {
            v232 = v286;
            v236 = sub_1000C5588();
            v234 = objc_claimAutoreleasedReturnValue(v236);
            if (!os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT))
              goto LABEL_253;
            v235 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
            v237 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "delegate"));
            v238 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v237, "mostRecentlyDisconnectedAudioCall"));
            *(_DWORD *)buf = 138412290;
            v299 = (uint64_t)v238;
            _os_log_impl((void *)&_mh_execute_header, v234, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show audio view controller for disconnected call %@", buf, 0xCu);

LABEL_252:
LABEL_253:

            v85 = 0;
            v86 = 0;
            v292 = 0;
            v289 = 0;
            LODWORD(v84) = 1;
            if (v232)
              goto LABEL_73;
LABEL_78:
            v93 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
            v94 = objc_msgSend(v93, "pipState");

            v95 = v94 == 0;
            if (v94)
              v96 = 0;
            else
              v96 = v85;
            if (v95)
              v97 = v84;
            else
              v97 = 0;
            v98 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));

            if (v98)
            {
              v99 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
              objc_msgSend(v99, "hideEffectsBrowser");

              if (-[PHInCallRootViewController shouldExitVideoMessageFlowConsideringShowAudioController:showEmergencyCallController:showSOSController:showScreenTimeController:showUserScoreController:showPTTFullScreenController:](v2, "shouldExitVideoMessageFlowConsideringShowAudioController:showEmergencyCallController:showSOSController:showScreenTimeController:showUserScoreController:showPTTFullScreenController:", v97, v96, v86, HIDWORD(v289), v289, 0))
              {
                v100 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
                v101 = objc_msgSend(v100, "isInVideoMessageFlow");

                if (v101)
                {
                  v102 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
                  objc_msgSend(v102, "cancelVideoRecordingWithCompletion:", 0);

                  -[PHInCallRootViewController setMultiwayViewController:](v2, "setMultiwayViewController:", 0);
                }
              }
            }
            v103 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject frontmostBargeCall](v59, "frontmostBargeCall"));
            if (v103)
              v104 = v97;
            else
              v104 = 1;
            v105 = HIDWORD(v289) | v86 | v96 | v104;
            if (v292)
              v106 = 1;
            else
              v106 = v105;

            v107 = CNKTranscriptionViewComposerFactory_ptr;
            if (((v106 | v289) & 1) != 0)
            {
              if ((objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHInitialPTTFullScreenPresentationAssertionReason")) & 1) != 0|| objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHPTTCallDetailsViewAssertionReason")))
              {
                +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHInitialPTTFullScreenPresentationAssertionReason"));
                +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHPTTCallDetailsViewAssertionReason"));
              }
              v108 = 0;
              v280 = 0;
            }
            else
            {
              v109 = sub_1000C5588();
              v110 = objc_claimAutoreleasedReturnValue(v109);
              if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
              {
                v111 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject frontmostBargeCall](v59, "frontmostBargeCall"));
                *(_DWORD *)buf = 138412290;
                v299 = (uint64_t)v111;
                _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Loading PTT full screen controller %@", buf, 0xCu);

              }
              v112 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "delegate"));
              v280 = objc_msgSend(v113, "didDeepLinkToPTTCallDetailsView") ^ 1;

              v114 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v97 = objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "delegate"));
              v108 = objc_msgSend((id)v97, "didDeepLinkToPTTCallDetailsView");

              LODWORD(v97) = 0;
            }
            v294 = v97;
            v287 = v86;
            v115 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject frontmostAudioOrVideoCall](v59, "frontmostAudioOrVideoCall"));
            if (v115)
            {

            }
            else
            {
              p_superclass = objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)p_superclass, "delegate"));
              v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "bannerPresentationManager"));
              v119 = objc_msgSend(v118, "conversationIsAVLess");

              if (v119)
              {
                v120 = sub_1000C5588();
                v121 = objc_claimAutoreleasedReturnValue(v120);
                if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController should show call details view for an AV-less conversation", buf, 2u);
                }

                v108 = 1;
                goto LABEL_110;
              }
            }
            p_superclass = objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
            v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)p_superclass, "delegate"));
            v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "bannerPresentationManager"));
            if (!objc_msgSend(v123, "onlyHasPlaceholderCall"))
            {
              v124 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject conversationManager](v59, "conversationManager"));
              v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "avLessConversation"));

              if (!v125)
              {
                p_superclass = (uint64_t)MPRTTTranscriptionMessage.superclass;
                +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAVLessConversationAssertionReason"));
                +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAVLessConversationDetailsViewAssertionReason"));
              }
              v11 = v290;
              v107 = CNKTranscriptionViewComposerFactory_ptr;
LABEL_114:
              v127 = (unint64_t)v284;
              v126 = v285;
              if ((_DWORD)v96)
              {
                +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHEmergencyCallBackModeAssertionReason"));
                v128 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](v2->_emergencyDialerViewController, "view"));
                v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "superview"));

                v130 = (void *)v281;
                if (!v129)
                {
                  v131 = sub_1000C5588();
                  v132 = objc_claimAutoreleasedReturnValue(v131);
                  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing the emergency callback view controller", buf, 2u);
                  }

                  -[PHInCallRootViewController obtainIdleTimerAssertionWithComment:](v2, "obtainIdleTimerAssertionWithComment:", CFSTR("showing Emergency controller"));
                  emergencyDialerViewController = v2->_emergencyDialerViewController;
                  if (!emergencyDialerViewController)
                  {
                    v134 = objc_alloc_init(PHEmergencyDialerViewController);
                    v135 = v2->_emergencyDialerViewController;
                    v2->_emergencyDialerViewController = v134;

                    -[PHEmergencyDialerViewController setShouldSetPresenceToken:](v2->_emergencyDialerViewController, "setShouldSetPresenceToken:", 0);
                    emergencyDialerViewController = v2->_emergencyDialerViewController;
                  }
                  -[PHInCallRootViewController _transitionFromViewController:toViewController:](v2, "_transitionFromViewController:toViewController:", v281, emergencyDialerViewController);
                  v136 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](v2, "_remoteViewControllerProxy"));
                  objc_msgSend(v136, "setWallpaperTunnelActive:", 1);

                }
LABEL_148:
                -[PHInCallRootViewController showHideMiniWindowViewIfNeededAnimated:](v2, "showHideMiniWindowViewIfNeededAnimated:", 0);
                v162 = v292;
                if (v292)
                {
LABEL_149:
                  v48 = v162;
                  if ((objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHMulitwayCallAssertionReason")) & 1) == 0)
                  {
                    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHMulitwayCallAssertionReason"));
                    v48 = v162;
                  }
                  goto LABEL_265;
                }
LABEL_259:
                if (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHMulitwayCallAssertionReason")))
                {
                  v239 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
                  if (objc_msgSend(v239, "isInVideoMessageFlow"))
                  {

                  }
                  else
                  {
                    v240 = -[PHInCallRootViewController shouldShowVideoCallBlockAndReportScreen](v2, "shouldShowVideoCallBlockAndReportScreen");

                    if ((v240 & 1) == 0)
                      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHMulitwayCallAssertionReason"));
                  }
                }
                v48 = 0;
LABEL_265:
                if ((v294 | v280) == 1)
                {
                  v241 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](v2, "_remoteViewControllerProxy"));
                  objc_msgSend(v241, "setWallpaperTunnelActive:", 1);

                }
                if (v287)
                {
                  v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107[214], "sharedApplication"));
                  v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v242, "delegate"));
                  objc_msgSend(v243, "hideCarPlayUI");
                }
                else
                {
                  v244 = v294 ^ 1;
                  if (v162)
                    v244 = 0;
                  if ((v244 & 1) != 0)
                    goto LABEL_274;
                  v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107[214], "sharedApplication"));
                  v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v242, "delegate"));
                  objc_msgSend(v243, "showCarPlayUIWithActivation:", (v11 | v127 | v291) != 0);
                }

LABEL_274:
                -[PHInCallRootViewController updateMultiwayViewControllerUIState](v2, "updateMultiwayViewControllerUIState");
                -[PHInCallRootViewController updateCallDetailsViewIsOnScreen](v2, "updateCallDetailsViewIsOnScreen");
                -[PHInCallRootViewController updateDesiredSpringboardBehavior](v2, "updateDesiredSpringboardBehavior");

LABEL_275:
                goto LABEL_276;
              }
              if (v294)
              {
                -[PHInCallRootViewController _loadAudioCallViewController](v2, "_loadAudioCallViewController");
                v137 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](v2, "features"));
                if ((objc_msgSend(v137, "callManagerEnabled") & 1) != 0)
                {
                  v138 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](v2, "callCenter"));
                  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "frontmostCall"));

                  v130 = (void *)v281;
                  if (v139)
                  {
                    v140 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](v2, "callManager"));
                    v141 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](v2, "callCenter"));
                    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "frontmostCall"));
                    objc_msgSend(v140, "updateWithCall:", v142);

                    goto LABEL_136;
                  }
                }
                else
                {

                  v130 = (void *)v281;
                }
                v153 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](v2, "audioCallNavigationController"));
                v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "view"));
                v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "superview"));

                if (v155)
                  goto LABEL_137;
                v156 = sub_1000C5588();
                v157 = objc_claimAutoreleasedReturnValue(v156);
                if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing Audio controller", buf, 2u);
                }

                v140 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](v2, "audioCallNavigationController"));
                -[PHInCallRootViewController _transitionFromViewController:toViewController:](v2, "_transitionFromViewController:toViewController:", v130, v140);
LABEL_136:

LABEL_137:
                v152 = CFSTR("showing Audio controller");
                if (!v11)
                {
                  -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](v2, "releaseIdleTimerAssertionWithComment:", CFSTR("showing Audio controller"));
                  goto LABEL_148;
                }
LABEL_138:
                -[PHInCallRootViewController obtainIdleTimerAssertionWithComment:](v2, "obtainIdleTimerAssertionWithComment:", v152);
                goto LABEL_148;
              }
              if (v287)
              {
                v143 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](v2->_sosViewController, "view"));
                v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "superview"));

                v130 = (void *)v281;
                if (!v144)
                {
                  v145 = sub_1000C5588();
                  v146 = objc_claimAutoreleasedReturnValue(v145);
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing SOS controller", buf, 2u);
                  }

                  -[PHInCallRootViewController _loadSOSViewController](v2, "_loadSOSViewController");
                  -[PHInCallRootViewController _reloadSOSHandles](v2, "_reloadSOSHandles");
                  -[PHInCallRootViewController _transitionFromViewController:toViewController:](v2, "_transitionFromViewController:toViewController:", v281, v2->_sosViewController);
                  v147 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
                  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "delegate"));
                  objc_msgSend(v148, "transitionSceneToOverlayForSOS");

                }
                v149 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
                v150 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](v2, "view"));
                v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "window"));
                objc_msgSend(v151, "setBackgroundColor:", v149);

                v152 = CFSTR("showing SOS controller");
                goto LABEL_138;
              }
              if (!v292)
              {
                if (HIDWORD(v289))
                {
                  v169 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController screenTimeHostViewController](v2, "screenTimeHostViewController"));
                  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "view"));
                  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "superview"));

                  v130 = (void *)v281;
                  if (!v171)
                  {
                    v172 = sub_1000C5588();
                    v173 = objc_claimAutoreleasedReturnValue(v172);
                    if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing Screen Time Host controller", buf, 2u);
                    }

                    -[PHInCallRootViewController dismissPhoneRemoteViewController](v2, "dismissPhoneRemoteViewController");
                    -[PHInCallRootViewController dismissContactsViewController](v2, "dismissContactsViewController");
                    -[PHInCallRootViewController presentScreenTimeHostViewController](v2, "presentScreenTimeHostViewController");
                  }
                }
                else
                {
                  v130 = (void *)v281;
                  if ((_DWORD)v289)
                  {
                    -[PHInCallRootViewController _loadUserFeedbackViewController](v2, "_loadUserFeedbackViewController");
                    v210 = sub_1000C5588();
                    v211 = objc_claimAutoreleasedReturnValue(v210);
                    if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing User Feedback View controller", buf, 2u);
                    }

                    v212 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](v2, "callCenter"));
                    v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v212, "videoDeviceController"));
                    objc_msgSend(v213, "stopPreview");

                    -[PHInCallRootViewController presentViewController:animated:completion:](v2, "presentViewController:animated:completion:", v2->_userFeedbackViewController, 1, 0);
                  }
                  else if (v280)
                  {
                    v219 = (void *)objc_claimAutoreleasedReturnValue(-[PHPTTFullScreenContainerViewController view](v2->_pttFullScreenContainerViewController, "view"));
                    v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "superview"));

                    if (!v220)
                    {
                      v221 = sub_1000C5588();
                      v222 = objc_claimAutoreleasedReturnValue(v221);
                      if (os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v222, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing PTT Full screen controller", buf, 2u);
                      }

                      -[PHInCallRootViewController _loadPTTFullScreenContainerViewController](v2, "_loadPTTFullScreenContainerViewController");
                      -[PHInCallRootViewController _transitionFromViewController:toViewController:](v2, "_transitionFromViewController:toViewController:", v281, v2->_pttFullScreenContainerViewController);
                      -[PHInCallRootViewController requestInCallDismissal](v2, "requestInCallDismissal");
                    }
                    -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](v2, "releaseIdleTimerAssertionWithComment:", CFSTR("showing PTT Full Screen controller"));
                  }
                  else if (v108
                         && !-[PHInCallRootViewController isPresentingCallDetailsView](v2, "isPresentingCallDetailsView"))
                  {
                    -[PHInCallRootViewController showCallDetailsView](v2, "showCallDetailsView");
                  }
                }
                -[PHInCallRootViewController showHideMiniWindowViewIfNeededAnimated:](v2, "showHideMiniWindowViewIfNeededAnimated:", 0);
                v162 = 0;
                goto LABEL_259;
              }
              v158 = sub_1000C5588();
              v159 = objc_claimAutoreleasedReturnValue(v158);
              if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, "showMultiwayControllerCall", buf, 2u);
              }

              v160 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](v2, "callDisplayStyleManager"));
              if (objc_msgSend(v160, "callDisplayStyle"))
              {

              }
              else
              {
                v178 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](v2, "featureFlags"));
                p_superclass = (uint64_t)objc_msgSend(v178, "conversationOneToOneModeEnabled");

                if ((p_superclass & 1) == 0)
                {
                  v179 = sub_1000C5588();
                  v180 = objc_claimAutoreleasedReturnValue(v179);
                  if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
                    sub_1001AA218();

                  -[PHInCallRootViewController requestInCallSceneTransitionToFullScreen](v2, "requestInCallSceneTransitionToFullScreen");
                }
              }
              v181 = v292;
              v182 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject activeConversationForCall:](v59, "activeConversationForCall:", v292));
              v183 = -[NSObject wantsStagingArea](v292, "wantsStagingArea");
              if ((v183 & 1) != 0)
              {
                if ((+[TUConversationManager allowsVideo](TUConversationManager, "allowsVideo") & 1) == 0)goto LABEL_193;
                goto LABEL_182;
              }
              v181 = objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "activeRemoteParticipants"));
              if (-[NSObject count](v181, "count") && objc_msgSend(v182, "state") != (id)3)
              {
                v59 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
                p_superclass = objc_claimAutoreleasedReturnValue(-[NSObject call](v59, "call"));
                if (!objc_msgSend((id)p_superclass, "isEqual:", v292)
                  && +[TUConversationManager allowsVideo](TUConversationManager, "allowsVideo"))
                {
LABEL_182:
                  v184 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](v2, "featureFlags"));
                  v185 = objc_msgSend(v184, "conversationOneToOneModeEnabled");

                  if (!v183)
                  {

                  }
                  v127 = (unint64_t)v284;
                  if ((v185 & 1) != 0)
                    goto LABEL_193;
                  v186 = sub_1000C5588();
                  v181 = objc_claimAutoreleasedReturnValue(v186);
                  if (os_log_type_enabled(v181, OS_LOG_TYPE_FAULT))
                    sub_1001AA1E0();
                  goto LABEL_192;
                }

              }
LABEL_192:

LABEL_193:
              v107 = CNKTranscriptionViewComposerFactory_ptr;
              v130 = (void *)v281;
              v126 = v285;
              if ((v276 & 1) == 0)
              {
                v187 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
                v188 = objc_msgSend(v187, "isInVideoMessageFlow");

                if ((v188 & 1) == 0)
                {
                  v189 = sub_1000C5588();
                  v190 = objc_claimAutoreleasedReturnValue(v189);
                  if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing Multiway controller", buf, 2u);
                  }

                  v191 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
                  v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "pipViewController"));
                  v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "parentViewController"));

                  -[PHInCallRootViewController _loadMultiwayViewControllerForCall:](v2, "_loadMultiwayViewControllerForCall:", v292);
                  v194 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
                  -[PHInCallRootViewController transitionToVideoCallBasedViewController:shouldUpdatePipSize:](v2, "transitionToVideoCallBasedViewController:shouldUpdatePipSize:", v194, 1);

                  v195 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallOrientationMonitor sharedInstance](PHInCallOrientationMonitor, "sharedInstance"));
                  objc_msgSend(v195, "setOrientationEventsEnabled:", 1);

                  v196 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
                  v95 = v191 == v196;
                  v107 = CNKTranscriptionViewComposerFactory_ptr;
                  if (!v95 && v193)
                  {
                    v197 = sub_1000C5588();
                    v198 = objc_claimAutoreleasedReturnValue(v197);
                    if (os_log_type_enabled(v198, OS_LOG_TYPE_DEFAULT))
                    {
                      v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "pipViewController"));
                      *(_DWORD *)buf = 138412290;
                      v299 = (uint64_t)v199;
                      _os_log_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_DEFAULT, "Old GFT call was showing PIP view controller %@", buf, 0xCu);

                      v107 = CNKTranscriptionViewComposerFactory_ptr;
                    }

                    v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "pipViewController"));
                    -[PHInCallRootViewController setOldMultiwayPIPViewController:](v2, "setOldMultiwayPIPViewController:", v200);

                  }
                }
              }
              if (v277)
                -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](v2, "releaseIdleTimerAssertionWithComment:", CFSTR("showing Multiway controller for disconnected video call requiring UI"));
              else
                -[PHInCallRootViewController obtainIdleTimerAssertionWithComment:](v2, "obtainIdleTimerAssertionWithComment:", CFSTR("showing Multiway controller"));
              v162 = v292;

              -[PHInCallRootViewController showHideMiniWindowViewIfNeededAnimated:](v2, "showHideMiniWindowViewIfNeededAnimated:", 0);
              goto LABEL_149;
            }

LABEL_110:
            v11 = v290;
            goto LABEL_114;
          }
          if (v277)
          {
            v253 = sub_1000C5588();
            v254 = objc_claimAutoreleasedReturnValue(v253);
            if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
            {
              v255 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v255, "delegate"));
              v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "mostRecentlyDisconnectedVideoCall"));
              *(_DWORD *)buf = 138412290;
              v299 = (uint64_t)v257;
              _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show video view controller for disconnected call %@", buf, 0xCu);

            }
            v91 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](v2, "multiwayViewController"));
            if (-[NSObject isOneToOneModeEnabled](v91, "isOneToOneModeEnabled"))
            {
              v258 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v258, "delegate"));
              v292 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v84, "mostRecentlyDisconnectedVideoCall"));

              LODWORD(v84) = 0;
              v85 = 0;
              v86 = 0;
              HIDWORD(v289) = 0;
LABEL_300:
              LODWORD(v289) = 0;
LABEL_76:

              goto LABEL_78;
            }
          }
          else
          {
            if (!-[PHInCallRootViewController shouldShowVideoCallBlockAndReportScreen](v2, "shouldShowVideoCallBlockAndReportScreen"))
            {
              if (+[TUCallCapabilities isEmergencyCallbackModeEnabled](TUCallCapabilities, "isEmergencyCallbackModeEnabled"))
              {
                v263 = sub_1000C5588();
                v264 = objc_claimAutoreleasedReturnValue(v263);
                if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v264, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show emergency view controller as ECBM is active", buf, 2u);
                }

                LODWORD(v84) = 0;
                v86 = 0;
                v292 = 0;
                v289 = 0;
                v85 = 1;
                if (v286)
                  goto LABEL_73;
                goto LABEL_78;
              }
              if (+[PHSOSViewController isCallBufferDismissalAssertionActive](PHSOSViewController, "isCallBufferDismissalAssertionActive"))
              {
                v204 = v286;
                v265 = sub_1000C5588();
                v206 = objc_claimAutoreleasedReturnValue(v265);
                if (!os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
                {
LABEL_212:

                  v85 = 0;
                  v86 = 0;
                  v292 = 0;
                  v289 = 0;
                  LODWORD(v84) = 1;
                  if (!v204)
                    goto LABEL_78;
LABEL_73:
                  HIDWORD(v289) = v74 ^ 1;
                  v89 = sub_1000C5588();
                  v90 = objc_claimAutoreleasedReturnValue(v89);
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "setting ICSAppDelegate.mostRecentlyDisconnectedVideoCall to nil", buf, 2u);
                  }

                  v91 = objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
                  v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject delegate](v91, "delegate"));
                  objc_msgSend(v92, "setMostRecentlyDisconnectedVideoCall:", 0);

                  goto LABEL_76;
                }
                *(_WORD *)buf = 0;
                v207 = "PHInCallRootViewController will show audio controller for call buffer. No call is active right now.";
                v208 = v206;
                v209 = 2;
LABEL_211:
                _os_log_impl((void *)&_mh_execute_header, v208, OS_LOG_TYPE_DEFAULT, v207, buf, v209);
                goto LABEL_212;
              }
              v251 = v286;
              if (-[PHInCallRootViewController shouldShowSOS](v2, "shouldShowSOS"))
              {
                v266 = sub_1000C5588();
                v267 = objc_claimAutoreleasedReturnValue(v266);
                if (os_log_type_enabled(v267, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v267, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show sos view controller", buf, 2u);
                }

                LODWORD(v84) = 0;
                v85 = 0;
                v292 = 0;
                v289 = 0;
                v86 = 1;
              }
              else if (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHAudioCallViewControllerDismissalAssertionWaitingForIdle")))
              {
                v268 = sub_1000C5588();
                v269 = objc_claimAutoreleasedReturnValue(v268);
                if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v269, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController will show audio controller since we're waiting for an idle call state", buf, 2u);
                }

                v85 = 0;
                v86 = 0;
                v292 = 0;
                v289 = 0;
                LODWORD(v84) = 1;
              }
              else if (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHUserScoreShowingAssertionReason")))
              {
                v270 = sub_1000C5588();
                v271 = objc_claimAutoreleasedReturnValue(v270);
                if (os_log_type_enabled(v271, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v271, OS_LOG_TYPE_DEFAULT, "InCallRootViewController will show UserFeedback View Controller", buf, 2u);
                }

                LODWORD(v84) = 0;
                v85 = 0;
                v86 = 0;
                v292 = 0;
                v289 = 1;
              }
              else
              {
                if (v58
                  || !objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHAVLessConversationAssertionReason")))
                {
                  v292 = 0;
                  v2 = v293;
LABEL_286:
                  LODWORD(v84) = 0;
                  v85 = 0;
                  v86 = 0;
                  v289 = 0;
                  if (v251)
                    goto LABEL_73;
                  goto LABEL_78;
                }
                v272 = sub_1000C5588();
                v273 = objc_claimAutoreleasedReturnValue(v272);
                if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v273, OS_LOG_TYPE_DEFAULT, "InCallRootViewController doesn't have any calls but still has an assertion for an AVLess conversation.", buf, 2u);
                }

                v274 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
                objc_msgSend(v274, "cancelPIPIfNeeded");

                LODWORD(v84) = 0;
                v85 = 0;
                v86 = 0;
                v292 = 0;
                v289 = 0;
              }
              v2 = v293;
              if (v286)
                goto LABEL_73;
              goto LABEL_78;
            }
            v259 = sub_1000C5588();
            v91 = objc_claimAutoreleasedReturnValue(v259);
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              v260 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v260, "delegate"));
              v262 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "mostRecentlyDisconnectedVideoCall"));
              *(_DWORD *)buf = 138412290;
              v299 = (uint64_t)v262;
              _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "updateCallControllerForCurrentState InCallRootViewController will show video view controller for disconnected call %@", buf, 0xCu);

            }
          }
          LODWORD(v84) = 0;
          v85 = 0;
          v86 = 0;
          HIDWORD(v289) = 0;
          v292 = 0;
          goto LABEL_300;
        }
      }
      else
      {

        v22 = v40;
        v11 = v39;
        v10 = v41;
        v15 = v37;
        v2 = v293;
      }
    }

    goto LABEL_32;
  }
  v53 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v299 = (uint64_t)v2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "This instance of PHInCallRootVC %@ no longer has a window, not continuing with updateCallControllerForCurrentState", buf, 0xCu);
  }
LABEL_276:

}

- (UIViewController)currentViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  if (!v5)
  {

LABEL_5:
    v10 = 56;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self->_emergencyDialerViewController, "view"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController parentViewController](self->_emergencyDialerViewController, "parentViewController"));

      if (v14)
        goto LABEL_19;
    }
    else
    {

    }
    v10 = 64;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self->_sosViewController, "view"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));
    if (v16)
    {
      v17 = (void *)v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController parentViewController](self->_sosViewController, "parentViewController"));

      if (v18)
        goto LABEL_19;
    }
    else
    {

    }
    v10 = 120;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_videoCallNavigationController, "view"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));
    if (!v20)
    {

      goto LABEL_17;
    }
    v21 = (void *)v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController parentViewController](self->_videoCallNavigationController, "parentViewController"));

    if (!v22)
    {
LABEL_17:
      v10 = 104;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHPTTFullScreenContainerViewController view](self->_pttFullScreenContainerViewController, "view"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "superview"));
      if (v24)
      {
        v25 = (void *)v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHPTTFullScreenContainerViewController parentViewController](self->_pttFullScreenContainerViewController, "parentViewController"));

        if (v26)
          goto LABEL_19;
      }
      else
      {

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "superview"));
      if (v30)
      {
        v31 = (void *)v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "parentViewController"));

        if (v33)
        {
          v9 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));
          return (UIViewController *)v9;
        }
      }
      else
      {

      }
      v9 = 0;
      return (UIViewController *)v9;
    }
LABEL_19:
    v9 = *(id *)((char *)&self->super.super.super.isa + v10);
    return (UIViewController *)v9;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentViewController"));

  if (!v8)
    goto LABEL_5;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
  return (UIViewController *)v9;
}

- (BOOL)wantsMiniWindowCoverViewController
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[PHInCallRootViewController isDisplayStyleMiniWindow](self, "isDisplayStyleMiniWindow");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v5 = objc_msgSend(v4, "hasCurrentCalls");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)showHideMiniWindowViewIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v3 = a3;
  if (-[PHInCallRootViewController wantsMiniWindowCoverViewController](self, "wantsMiniWindowCoverViewController"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v6 = objc_msgSend(v5, "isPipped");

    if (v6)
    {
      -[PHInCallRootViewController dismissPIPIfNeededForMiniWindowAnimated:](self, "dismissPIPIfNeededForMiniWindowAnimated:", v3);
      return;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
    if ((objc_msgSend(v11, "isBeingPresented") & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentingViewController"));
      if (!v13)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController parentViewController](self, "parentViewController"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));

        if (v20)
        {
          -[PHInCallRootViewController presentMiniWindowViewControllerAnimated:](self, "presentMiniWindowViewControllerAnimated:", v3);
          return;
        }
        goto LABEL_11;
      }

    }
LABEL_11:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));

    if (v14)
    {
      v15 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "InCallRootViewController mini window already visible, updating views", v21, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
      objc_msgSend(v17, "updateViews");

    }
    return;
  }
  v7 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
    v10 = objc_msgSend(v9, "isBeingDismissed");

    if ((v10 & 1) == 0)
      -[PHInCallRootViewController dismissMiniWindowViewControllerAnimated:](self, "dismissMiniWindowViewControllerAnimated:", 1);
  }
}

- (void)dismissPIPIfNeededForMiniWindowAnimated:(BOOL)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  v6 = objc_msgSend(v5, "isPIPProxyActiveAndHidden");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000AB098;
    v8[3] = &unk_100284C98;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(v7, "manuallyStopPIPWithCompletion:", v8);

  }
}

- (void)presentMiniWindowViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  ICSCoverViewController *v7;
  void *v8;
  ICSCoverViewController *v9;
  ICSCoverViewController *coverViewController;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "InCallRootViewController showing mini window", buf, 2u);
  }

  if (!self->_coverViewController)
  {
    v7 = [ICSCoverViewController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v9 = -[ICSCoverViewController initWithCallDisplayStyleManager:](v7, "initWithCallDisplayStyleManager:", v8);
    coverViewController = self->_coverViewController;
    self->_coverViewController = v9;

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
  objc_msgSend(v11, "setModalPresentationStyle:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
  objc_msgSend(v12, "setModalTransitionStyle:", 2);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000AB200;
  v14[3] = &unk_100284898;
  v14[4] = self;
  -[PHInCallRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, v3, v14);

}

- (void)dismissMiniWindowViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AB284;
  v6[3] = &unk_100284898;
  v6[4] = self;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, v6);

}

- (BOOL)isDisplayStyleMiniWindow
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle") == (id)1;

  return v3;
}

- (void)showFailureAlertIfNecessaryForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id location;
  uint8_t buf[32];

  v4 = a3;
  if (!objc_msgSend(v4, "shouldShowFailureAlert"))
    goto LABEL_24;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController failureAlertController](self, "failureAlertController"));
  if (v5)
  {

    goto LABEL_24;
  }
  if (+[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked"))
  {
    goto LABEL_24;
  }
  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHFailureAlertShowingAssertionReason"));
  -[PHInCallRootViewController requestInCallSceneTransitionToFullScreen](self, "requestInCallSceneTransitionToFullScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errorAlertTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errorAlertMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHAlertController alertControllerWithTitle:message:preferredStyle:](PHAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1));
  -[PHInCallRootViewController setFailureAlertController:](self, "setFailureAlertController:", v8);

  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10028DC20, CFSTR("InCallService")));

  if (objc_msgSend(v4, "disconnectedReason") == 30
    || objc_msgSend(v4, "disconnectedReason") == 49)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifiers"));
    if (objc_msgSend(v11, "count") == (id)1)
    {
      if (objc_msgSend(v4, "originatingUIType") == 8)
      {

LABEL_16:
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_10028DC20, CFSTR("InCallService")));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController failureAlertController](self, "failureAlertController"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SHOW_CONTACT_CARD"), &stru_10028DC20, CFSTR("InCallService")));
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_1000ABA60;
        v45[3] = &unk_1002872A0;
        v46 = v4;
        objc_copyWeak(&v47, &location);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 0, v45));
        objc_msgSend(v25, "addAction:", v28);

        objc_destroyWeak(&v47);
        goto LABEL_17;
      }
      v23 = objc_msgSend(v4, "originatingUIType") == 9;

      if (v23)
        goto LABEL_16;
    }
    else
    {

    }
  }
  if (objc_msgSend(v4, "disconnectedReason") == 44)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("InCallService")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController failureAlertController](self, "failureAlertController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SIGN_IN"), &stru_10028DC20, CFSTR("InCallService")));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000ABB48;
    v43[3] = &unk_1002872C8;
    objc_copyWeak(&v44, &location);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, v43));
    objc_msgSend(v14, "addAction:", v17);

    objc_destroyWeak(&v44);
LABEL_17:
    v10 = (void *)v13;
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "disconnectedReason") == 45)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("InCallService")));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController failureAlertController](self, "failureAlertController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SHOW_APP_STORE"), &stru_10028DC20, CFSTR("InCallService")));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000ABBC0;
    v41[3] = &unk_1002872C8;
    objc_copyWeak(&v42, &location);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 0, v41));
    objc_msgSend(v19, "addAction:", v22);

    objc_destroyWeak(&v42);
    goto LABEL_17;
  }
LABEL_18:
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController failureAlertController](self, "failureAlertController"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000ABD00;
  v39[3] = &unk_1002872C8;
  objc_copyWeak(&v40, &location);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, v39));
  objc_msgSend(v29, "addAction:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController failureAlertController](self, "failureAlertController"));
  objc_msgSend(v31, "setDismissalAssertionReason:", CFSTR("PHFailureAlertShowingAssertionReason"));

  v32 = sub_1000C5588();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errorAlertTitle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errorAlertMessage"));
    sub_1001AA244(v34, v35, buf, v33);
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
  if (v36)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000ABD98;
    v38[3] = &unk_100284898;
    v38[4] = self;
    -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v38);
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController failureAlertController](self, "failureAlertController"));
    -[PHInCallRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v37, 1, 0);

  }
  objc_destroyWeak(&v40);

  objc_destroyWeak(&location);
LABEL_24:

}

- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ABE70;
  v7[3] = &unk_100284898;
  v8 = a4;
  v6 = v8;
  -[PHInCallRootViewController _transitionFromViewController:toViewController:completion:](self, "_transitionFromViewController:toViewController:completion:", a3, v6, v7);

}

- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PHInCallRootViewController *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void **v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, int);
  void *v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v8;
    v40 = 2112;
    v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Transitioning from %@ to a new view controller, and setting it as the currentViewController: %@", buf, 0x16u);
  }

  -[PHInCallRootViewController _obtainThenReleaseTransitionAssertion](self, "_obtainThenReleaseTransitionAssertion");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v23, "setAutoresizingMask:", 18);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v25, "setHidden:", 0);

  if (v8
    && (v26 = (PHInCallRootViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentViewController")),
        v27 = v26 == self,
        v26,
        v27))
  {
    -[PHInCallRootViewController addChildViewController:](self, "addChildViewController:", v9);
    objc_msgSend(v8, "willMoveToParentViewController:", 0);
    objc_initWeak((id *)buf, self);
    v30 = _NSConcreteStackBlock;
    v31 = 3221225472;
    v32 = sub_1000AC288;
    v33 = &unk_1002872F0;
    v34 = v8;
    v35 = v9;
    objc_copyWeak(&v37, (id *)buf);
    v36 = v10;
    -[PHInCallRootViewController transitionFromViewController:toViewController:duration:options:animations:completion:](self, "transitionFromViewController:toViewController:duration:options:animations:completion:", v34, v35, 5242880, 0, &v30, 0.5);

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(v9, "willMoveToParentViewController:", self);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v28, "addSubview:", v29);

    -[PHInCallRootViewController addChildViewController:](self, "addChildViewController:", v9);
    objc_msgSend(v9, "didMoveToParentViewController:", self);
    if (v10)
      v10[2](v10);
  }
  -[PHInCallRootViewController setCurrentViewController:](self, "setCurrentViewController:", v9, v30, v31, v32, v33);
  -[PHInCallRootViewController setNeedsWhitePointAdaptivityStyleUpdate](self, "setNeedsWhitePointAdaptivityStyleUpdate");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PHInCallRootViewController;
  -[PHInCallRootViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v4 = objc_msgSend(v3, "callDisplayStyle");

  if (v4 == (id)3)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  objc_msgSend(v8, "setOpaque:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v10, "setAllowsGroupBlending:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bannerTapGestureRecognizer](self, "bannerTapGestureRecognizer"));
  objc_msgSend(v13, "addGestureRecognizer:", v14);

  -[PHInCallRootViewController handleScreenTimeActivationIfNecessary](self, "handleScreenTimeActivationIfNecessary");
  -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
}

- (void)printUI
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recursiveDescription"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);

  }
  -[PHInCallRootViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "printUI", 0, 30.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char isKindOfClass;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  PHInCallRootViewController *v37;
  __int16 v38;
  void *v39;

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentInCallScene"));
    v10 = SBSInCallPresentationModeDescription(objc_msgSend(v9, "presentationMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 134218242;
    v37 = self;
    v38 = 2114;
    v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController (%p) viewWillAppear presentationMode: %{public}@", buf, 0x16u);

  }
  -[PHInCallRootViewController _testing_viewWillAppear](self, "_testing_viewWillAppear");
  v35.receiver = self;
  v35.super_class = (Class)PHInCallRootViewController;
  -[PHInCallRootViewController viewWillAppear:](&v35, "viewWillAppear:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v13 = objc_msgSend(v12, "currentVideoCallCount");

  if (v13)
    -[PHInCallRootViewController obtainIdleTimerAssertionWithComment:](self, "obtainIdleTimerAssertionWithComment:", CFSTR("viewWillAppear"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v14, "setBackgroundStyle:withDuration:", 4, 0.100000001);

  v15 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
  if (!v15)
    goto LABEL_11;
  v16 = (void *)v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
  v18 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController coverViewController](self, "coverViewController"));
  if (v17 == (void *)v18)
  {

    goto LABEL_11;
  }
  v19 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
  v22 = objc_opt_class(UIAlertController, v21);
  isKindOfClass = objc_opt_isKindOfClass(v20, v22);

  if ((isKindOfClass & 1) != 0)
  {
LABEL_11:
    v24 = 0;
    goto LABEL_12;
  }
  if (!+[PHUIConfiguration shouldUseFullScreenPeoplePicker](PHUIConfiguration, "shouldUseFullScreenPeoplePicker"))goto LABEL_13;
  v24 = 1;
LABEL_12:
  -[PHInCallRootViewController setTemporarilyAllowAllStatusBarPills:](self, "setTemporarilyAllowAllStatusBarPills:", v24);
LABEL_13:
  -[PHInCallRootViewController pullRelayingCallsIfNecessary](self, "pullRelayingCallsIfNecessary");
  -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
  -[PHInCallRootViewController updateAlertActivationReason](self, "updateAlertActivationReason");
  -[PHInCallRootViewController registerForNotifications](self, "registerForNotifications");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "routeController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "routes"));
  v28 = objc_msgSend(v27, "count");

  if (!v28)
  {
    v29 = sub_1000C5588();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Currently have no routes, re-querying...", buf, 2u);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "routeController"));
    objc_msgSend(v32, "requeryRoutes");

  }
  if (self->_multiwayViewController)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallOrientationMonitor sharedInstance](PHInCallOrientationMonitor, "sharedInstance"));
    v34 = objc_msgSend(v33, "lastValidOrientation");

    -[PHInCallRootViewController updateMultiwayDeviceOrientation:](self, "updateMultiwayDeviceOrientation:", v34);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  dispatch_time_t v21;
  objc_super v22;
  uint8_t buf[4];
  PHInCallRootViewController *v24;
  __int16 v25;
  void *v26;

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
    *(_DWORD *)buf = 134218240;
    v24 = self;
    v25 = 2048;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController (%p) viewDidAppear in windowScene (%p)", buf, 0x16u);

  }
  v22.receiver = self;
  v22.super_class = (Class)PHInCallRootViewController;
  -[PHInCallRootViewController viewDidAppear:](&v22, "viewDidAppear:", v3);
  v10 = dispatch_time(0, 500000000);
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, &stru_100287310);
  -[PHInCallRootViewController _testing_viewDidAppear](self, "_testing_viewDidAppear");
  -[PHInCallRootViewController _testing_finishedAnimatingIn](self, "_testing_finishedAnimatingIn");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastDaemonConnectTime"));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastDaemonConnectTime"));
    objc_msgSend(v15, "timeIntervalSinceNow");
    if (v16 > 0.0)
    {

LABEL_8:
      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHInitialPresentationAssertionReason"));
      return;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastDaemonConnectTime"));
    objc_msgSend(v18, "timeIntervalSinceNow");
    v20 = v19;

    if (v20 < -1.0)
      goto LABEL_8;
  }
  else
  {

  }
  v21 = dispatch_time(0, 2000000000);
  dispatch_after(v21, (dispatch_queue_t)&_dispatch_main_q, &stru_100287330);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  PHInCallRootViewController *v12;

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController (%p) viewWillDisappear", buf, 0xCu);
  }

  -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](self, "releaseIdleTimerAssertionWithComment:", CFSTR("viewWillDisappear"));
  v10.receiver = self;
  v10.super_class = (Class)PHInCallRootViewController;
  -[PHInCallRootViewController viewWillDisappear:](&v10, "viewWillDisappear:", v3);
  -[PHInCallRootViewController dismissScreenTimeAlertHostIfNeeded](self, "dismissScreenTimeAlertHostIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v8 = objc_msgSend(v7, "currentAudioAndVideoCallCount");

  if (!v8)
  {
    +[PHInCallRootViewController forceClearAllDismissalAssertions](PHInCallRootViewController, "forceClearAllDismissalAssertions");
    if (+[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive"))
    {
      if (BKSHIDServicesIsSmartCoverClosed())
      {
        if (self->_sosViewController)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController sosViewController](self, "sosViewController"));
          objc_msgSend(v9, "deactivateSOSWithSOSDismissalType:", 1);

        }
      }
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  PHInCallRootViewController *v11;

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController (%p) viewDidDisappear", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)PHInCallRootViewController;
  -[PHInCallRootViewController viewDidDisappear:](&v9, "viewDidDisappear:", v3);
  -[PHInCallRootViewController dismissViewControllersWithSensitiveInformation](self, "dismissViewControllersWithSensitiveInformation");
  if (byte_1002DCB48 == 1)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sendResponseIfNecessaryWithUnhandledEvents via viewDidDisappear", buf, 2u);
    }

    byte_1002DCB48 = 0;
    -[PHInCallRootViewController sendResponseIfNecessaryWithUnhandledEvents:](self, "sendResponseIfNecessaryWithUnhandledEvents:", 1);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  objc_super v11;
  uint8_t buf[4];
  PHInCallRootViewController *v13;
  __int16 v14;
  id v15;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHInCallRootViewController;
  -[PHInCallRootViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v11, "viewDidMoveToWindow:shouldAppearOrDisappear:", v6, v4);
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "viewDidMoveToWindow %@ window %@", buf, 0x16u);
  }

  v9 = -[PHInCallRootViewController hasEverAppearedInWindow](self, "hasEverAppearedInWindow");
  if (v6)
    v10 = 1;
  else
    v10 = v9;
  -[PHInCallRootViewController setHasEverAppearedInWindow:](self, "setHasEverAppearedInWindow:", v10);

}

- (id)_remoteViewControllerProxy
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v3 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController parentViewController](self, "parentViewController"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController parentViewController](self, "parentViewController")),
        v6 = objc_opt_respondsToSelector(v5, "_remoteViewControllerProxy"),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController parentViewController](self, "parentViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_remoteViewControllerProxy"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)requestInCallSceneTransitionToFullScreen
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000AD028;
    v4[3] = &unk_100284898;
    v4[4] = self;
    TUDispatchMainIfNecessary(v4);
  }
}

- (void)requestInCallDismissal
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](self, "releaseIdleTimerAssertionWithComment:", CFSTR("requestInCallDismissal"));
  -[PHInCallRootViewController setStatusBarHidden:withDuration:](self, "setStatusBarHidden:withDuration:", 0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
  v4 = objc_msgSend(v3, "hasAdoptedModernInCallAPI");

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "About to request InCall dismissal using the scene-based API", buf, 2u);
    }

    -[PHInCallRootViewController dismissInCallPresentationWithDismissalBlock:](self, "dismissInCallPresentationWithDismissalBlock:", &stru_100287350);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
      objc_msgSend(v9, "dismiss");

    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requested InCall dismissal using remote view controller proxy", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    if (v10)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000AD264;
      v11[3] = &unk_100284898;
      v11[4] = self;
      -[PHInCallRootViewController dismissInCallPresentationWithDismissalBlock:](self, "dismissInCallPresentationWithDismissalBlock:", v11);
    }
    else
    {
      -[PHInCallRootViewController setDismissalWasDemandedBeforeRemoteViewControllerWasAvailable:](self, "setDismissalWasDemandedBeforeRemoteViewControllerWasAvailable:", 1);
    }
  }
}

- (void)dismissInCallPresentationWithDismissalBlock:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  const char *v30;
  id v31;
  void *v32;
  uint8_t v33[16];
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id buf[2];

  v4 = (void (**)(_QWORD))a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "requestInCallDismissal", (uint8_t *)buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  v8 = objc_msgSend(v7, "effectsEnabled");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "videoDeviceController"));
    v11 = objc_msgSend(v10, "isPreviewRunning");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoDeviceController"));
      objc_msgSend(v13, "stopPreview");

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
  objc_msgSend(v15, "acquirePreventSuspensionAssertion");

  objc_initWeak(buf, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v17 = objc_msgSend(v16, "callDisplayStyle");

  if (v17 == (id)3)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000AD690;
    v36[3] = &unk_100285F88;
    v18 = &v37;
    objc_copyWeak(&v37, buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sceneManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ambientScene"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "delegate"));
    objc_msgSend(v23, "setSceneDidDisconnectBlock:", v36);

  }
  else
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000AD6F0;
    v34[3] = &unk_100285F88;
    v18 = &v35;
    objc_copyWeak(&v35, buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentInCallScene"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "delegate"));
    objc_msgSend(v22, "setSceneDidDisconnectBlock:", v34);
  }

  objc_destroyWeak(v18);
  if (byte_1002DCB48 == 1)
  {
    v24 = sub_1000C5588();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "sendResponseIfNecessaryWithUnhandledEvents via requestInCallDismissal", v33, 2u);
    }

    byte_1002DCB48 = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentAlertButtonAction](self, "currentAlertButtonAction"));
    v27 = byte_1002DCB49;

    if (!v26 && (v27 & 1) == 0)
    {
      v28 = sub_1000C5588();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        v30 = "dismissing remoteViewControllerProxy via requestInCallDismissal because no currentAlertButtonAction and sh"
              "ouldForceDismiss == NO";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v30, v33, 2u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    -[PHInCallRootViewController sendResponseIfNecessaryWithUnhandledEvents:](self, "sendResponseIfNecessaryWithUnhandledEvents:", 1);
    if (byte_1002DCB49 == 1)
    {
      v31 = sub_1000C5588();
      v29 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        v30 = "dismissing remoteViewControllerProxy via requestInCallDismissal";
        goto LABEL_20;
      }
LABEL_21:

      v4[2](v4);
      byte_1002DCB49 = 0;
    }
  }
  else
  {
    v4[2](v4);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController", *(_QWORD *)v33));
  objc_msgSend(v32, "resetPipContentViewController");

  objc_destroyWeak(buf);
}

- (void)prepareForDismissal
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  PHPhoneRemoteHostViewController *remoteHostViewController;
  CNContactPickerViewController *contactsViewController;
  UINavigationController *audioCallNavigationController;
  PHAudioCallViewController *audioCallViewController;
  CNKMultiwayViewControllerProtocol *multiwayViewController;
  UINavigationController *videoCallNavigationController;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint8_t v22[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Preparing for dismissal by removing current view controllers", v22, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](self, "features"));
  v6 = objc_msgSend(v5, "callManagerEnabled");

  if (v6)
    -[ICSCallManagerBridge cleanUp](self->_callManager, "cleanUp");
  -[PHInCallRootViewController removeViewController:](self, "removeViewController:", self->_videoCallNavigationController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
  -[PHInCallRootViewController removeViewController:](self, "removeViewController:", v7);

  -[PHInCallRootViewController removeViewController:](self, "removeViewController:", self->_multiwayViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhoneRemoteHostViewController remoteViewController](self->_remoteHostViewController, "remoteViewController"));
  objc_msgSend(v8, "setDelegate:", 0);

  remoteHostViewController = self->_remoteHostViewController;
  self->_remoteHostViewController = 0;

  contactsViewController = self->_contactsViewController;
  self->_contactsViewController = 0;

  audioCallNavigationController = self->_audioCallNavigationController;
  self->_audioCallNavigationController = 0;

  audioCallViewController = self->_audioCallViewController;
  self->_audioCallViewController = 0;

  multiwayViewController = self->_multiwayViewController;
  self->_multiwayViewController = 0;

  videoCallNavigationController = self->_videoCallNavigationController;
  self->_videoCallNavigationController = 0;

  -[CNKMultiwayViewControllerProtocol setMediaPipFrameInWindowScene:](self->_multiwayViewController, "setMediaPipFrameInWindowScene:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[FBSDisplayLayoutMonitor invalidate](self->_displayLayoutMonitor, "invalidate");
  displayLayoutMonitor = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = 0;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "removeObserver:", self);
  -[PHInCallRootViewController startObservingAcceptCallButtonTappedWithNotificationCenter:](self, "startObservingAcceptCallButtonTappedWithNotificationCenter:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
  objc_msgSend(v18, "hideCarPlayUI");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "videoDeviceController"));
  objc_msgSend(v20, "stopPreview");

  objc_msgSend((id)objc_opt_class(self, v21), "releaseDismissalAssertionForReason:", CFSTR("PHMessageComposeViewControllerAssertionReason"));
}

- (void)removeViewController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentViewController"));

  if (v3)
  {
    objc_msgSend(v5, "willMoveToParentViewController:", 0);
    objc_msgSend(v5, "removeFromParentViewController");
    if (objc_msgSend(v5, "isViewLoaded"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
      objc_msgSend(v4, "removeFromSuperview");

    }
    objc_msgSend(v5, "didMoveToParentViewController:", 0);
  }

}

- (void)animateInWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000ADABC;
  v6[3] = &unk_100284898;
  v6[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v6, v4, 0.349999994, 0.0);

}

- (void)presentContactsViewControllerForView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PHInCallRootViewController *v7;
  void *v8;
  PHInCallRootViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  v5 = objc_alloc_init((Class)CNContactPickerViewController);
  objc_msgSend(v5, "setAllowsEditing:", 1);
  objc_msgSend(v5, "setMode:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  objc_msgSend(v5, "setPredicateForSelectionOfContact:", v6);

  objc_msgSend(v5, "setCardActions:", 5);
  objc_msgSend(v5, "setDelegate:", self);
  -[PHInCallRootViewController setContactsViewController:](self, "setContactsViewController:", v5);
  if (+[PHUIConfiguration shouldUseFullScreenPeoplePicker](PHUIConfiguration, "shouldUseFullScreenPeoplePicker"))
  {
    v7 = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](v7, "presentedViewController"));

    v9 = v7;
    if (v8)
    {
      v9 = (PHInCallRootViewController *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](v7, "presentedViewController"));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController contactsViewController](v7, "contactsViewController"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000ADCAC;
    v14[3] = &unk_100284898;
    v14[4] = v7;
    -[PHInCallRootViewController presentViewController:animated:completion:](v9, "presentViewController:animated:completion:", v10, 1, v14);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController contactsViewController](v7, "contactsViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentationController"));
    objc_msgSend(v12, "setDelegate:", v7);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController contactsViewController](self, "contactsViewController"));
    -[PHInCallRootViewController presentAsPopover:fromView:completion:](self, "presentAsPopover:fromView:completion:", v13, v4, 0);

  }
  -[PHInCallRootViewController updateDesiredSpringboardBehavior](self, "updateDesiredSpringboardBehavior");

}

- (void)forceUpdateCallControllerForFilteredRequest:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHScreenTimeAlertAssertionReason")))
  {
    -[PHInCallRootViewController setFilteredRequest:](self, "setFilteredRequest:", v4);
    -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
  }

}

- (void)presentScreenTimeHostViewController
{
  id v3;
  NSObject *v4;
  void *v5;
  PHScreenTimeHostViewController *v6;
  void *v7;
  PHScreenTimeHostViewController *v8;
  void *v9;
  void *v10;
  id v11;
  PHScreenTimeHostViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  PHScreenTimeHostViewController *v16;
  _QWORD v17[4];
  PHScreenTimeHostViewController *v18;
  _QWORD v19[5];
  PHScreenTimeHostViewController *v20;
  uint8_t buf[4];
  void *v22;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController filteredRequest](self, "filteredRequest"));
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading screen time host view controller for request: %@", buf, 0xCu);

  }
  v6 = [PHScreenTimeHostViewController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController filteredRequest](self, "filteredRequest"));
  v8 = -[PHScreenTimeHostViewController initWithRequest:delegate:](v6, "initWithRequest:delegate:", v7, self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentAudioAndVideoCalls"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000ADFB8;
    v19[3] = &unk_100285158;
    v19[4] = self;
    v20 = v8;
    -[PHInCallRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, v19);
    v12 = v20;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController view](v8, "view"));
    objc_msgSend(v13, "setAlpha:", 0.0);

    -[PHScreenTimeHostViewController willMoveToParentViewController:](v8, "willMoveToParentViewController:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHScreenTimeHostViewController view](v8, "view"));
    objc_msgSend(v14, "addSubview:", v15);

    -[PHInCallRootViewController addChildViewController:](self, "addChildViewController:", v8);
    -[PHScreenTimeHostViewController didMoveToParentViewController:](v8, "didMoveToParentViewController:", self);
    -[PHInCallRootViewController setScreenTimeHostViewController:](self, "setScreenTimeHostViewController:", v8);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000ADFE4;
    v17[3] = &unk_100284898;
    v18 = v8;
    v16 = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v17, 0, 0.15, 0.0);
    v12 = v18;
  }

}

- (void)prepareToDismissScreenTime
{
  -[PHInCallRootViewController setFilteredRequest:](self, "setFilteredRequest:", 0);
}

- (void)dismissScreenTimeAlertHostIfNeeded
{
  void *v3;
  _QWORD *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController screenTimeHostViewController](self, "screenTimeHostViewController"));

  if (v3)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000AE258;
    v21[3] = &unk_100284898;
    v21[4] = self;
    v4 = objc_retainBlock(v21);
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController screenTimeHostViewController](self, "screenTimeHostViewController"));
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing screen time view controller: %@", buf, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController screenTimeHostViewController](self, "screenTimeHostViewController"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000AE2A0;
      v19[3] = &unk_100285050;
      v19[4] = self;
      v20 = v4;
      v12 = v4;
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v19);

      v13 = v20;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController screenTimeHostViewController](self, "screenTimeHostViewController"));
      objc_msgSend(v14, "willMoveToParentViewController:", 0);

      v17 = v4;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000AE2D0;
      v18[3] = &unk_100284898;
      v18[4] = self;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000AE31C;
      v16[3] = &unk_100285C30;
      v16[4] = self;
      v15 = v4;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v18, v16, 0.15, 0.0);
      v13 = v17;
    }

  }
}

- (void)dismissSOSIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  if (objc_msgSend(v8, "hasCurrentCalls"))
    goto LABEL_10;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v3, "callDisplayStyle") != (id)4
    || !+[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive"))
  {

LABEL_10:
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController sosViewController](self, "sosViewController"));

  if (v4)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1001AA2B0();

    +[ICSCrashReporter simulateCrashReportWithFormat:](ICSCrashReporter, "simulateCrashReportWithFormat:", CFSTR("The SOS UI was dismissed even though there were no active calls."));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController sosViewController](self, "sosViewController"));
    objc_msgSend(v7, "deactivateSOSWithSOSDismissalType:", 0);

  }
}

- (void)presentAsPopover:(id)a3 fromView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "setModalPresentationStyle:", 7);
  -[PHInCallRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "popoverPresentationController"));
  objc_msgSend(v11, "setDelegate:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  objc_msgSend(v9, "bounds");
  objc_msgSend(v12, "convertRect:fromView:", v9);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "popoverPresentationController"));
  objc_msgSend(v21, "setPermittedArrowDirections:", 15);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "popoverPresentationController"));
  objc_msgSend(v23, "setSourceView:", v22);

  v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "popoverPresentationController"));
  objc_msgSend(v24, "setSourceRect:", v14, v16, v18, v20);

}

- (void)willRotate:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  if (!+[PHUIConfiguration shouldUseFullScreenPeoplePicker](PHUIConfiguration, "shouldUseFullScreenPeoplePicker", a3))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
    if (objc_msgSend(v9, "isBeingPresented"))
    {

    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
      v5 = objc_msgSend(v4, "isBeingDismissed");

      if ((v5 & 1) == 0)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController contactsViewController](self, "contactsViewController"));
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (v8)
          -[PHInCallRootViewController dismissContactsViewControllerAnimated:](self, "dismissContactsViewControllerAnimated:", 0);
        else
          -[PHInCallRootViewController dismissPhoneRemoteViewControllerAnimated:](self, "dismissPhoneRemoteViewControllerAnimated:", 0);
      }
    }
  }
}

- (void)dismissContactsViewController
{
  -[PHInCallRootViewController dismissContactsViewControllerAnimated:](self, "dismissContactsViewControllerAnimated:", 1);
}

- (void)dismissContactsViewControllerAnimated:(BOOL)a3
{
  -[PHInCallRootViewController dismissContactsViewControllerAnimated:completion:](self, "dismissContactsViewControllerAnimated:completion:", a3, 0);
}

- (void)dismissContactsViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD *v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  uint8_t buf[4];
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;

  v4 = a3;
  v6 = a4;
  if (-[PHInCallRootViewController isPresentingContactsViewController](self, "isPresentingContactsViewController"))
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v17 = v4;
      v18 = 1024;
      v19 = v6 != 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "dismissing contactsVC animated %d, hasCompletion: %d", buf, 0xEu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000AE8B8;
    v13[3] = &unk_100287378;
    v15 = v4;
    v13[4] = self;
    v14 = v6;
    v9 = objc_retainBlock(v13);
    v10 = v9;
    if (v4)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000AE9D8;
      v11[3] = &unk_100285050;
      v11[4] = self;
      v12 = v9;
      -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v11);

    }
    else
    {
      -[PHInCallRootViewController setTemporarilyAllowAllStatusBarPills:](self, "setTemporarilyAllowAllStatusBarPills:", 0);
      -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v10);
    }

  }
  else if (v6)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }

}

- (void)dismissContactDetailsWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void ***v7;
  void **v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  PHInCallRootViewController *v12;
  id v13;
  uint8_t buf[4];
  _BOOL4 v15;

  v4 = a3;
  if (-[PHInCallRootViewController isPresentingContactDetails](self, "isPresentingContactDetails"))
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v15 = v4 != 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "dismissing contact details hasCompletion: %d", buf, 8u);
    }

    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_1000AEB48;
    v11 = &unk_100285050;
    v12 = self;
    v13 = v4;
    v7 = objc_retainBlock(&v8);
    -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v7, v8, v9, v10, v11, v12);

  }
  else if (v4)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }

}

- (void)updateRemoteAlertSwipeDismissalStyleForCall:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7 && objc_msgSend(v7, "status") == 4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v5 = v4;
    v6 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v5 = v4;
    v6 = 1;
  }
  objc_msgSend(v4, "setSwipeDismissalStyle:", v6);

}

- (void)updateAlertActivationReason
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "incomingCall"));

  if (v10
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter")),
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingVideoCall")),
        v4,
        v10))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCallGroups"));
    v7 = (char *)objc_msgSend(v6, "count");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v9 = &v7[(_QWORD)objc_msgSend(v8, "currentVideoCallCount")] > (char *)1;

  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  -[PHInCallRootViewController setAlertActivationReason:](self, "setAlertActivationReason:", v9);
  -[PHInCallRootViewController setAlertActivationCall:](self, "setAlertActivationCall:", v10);

}

- (void)updateAlertActivationReasonForCall:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  TUCall *alertActivationCall;
  id v13;

  v13 = a3;
  if ((id)-[PHInCallRootViewController alertActivationReason](self, "alertActivationReason") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController alertActivationCall](self, "alertActivationCall"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "callUUID"));
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      v8 = objc_msgSend(v13, "status");
      if (v8 - 5 < 2)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        v10 = objc_msgSend(v9, "hasCurrentCalls");

        if ((v10 & 1) == 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController dismissalAssertionReason](PHAudioCallViewController, "dismissalAssertionReason"));
          +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", v11);

          +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHMulitwayCallAssertionReason"));
        }
        goto LABEL_7;
      }
      if (v8 == 1)
      {
LABEL_7:
        alertActivationCall = self->_alertActivationCall;
        self->_alertActivationCall = 0;

        self->_alertActivationReason = 0;
      }
    }
  }

}

- (void)emergencyCallbackModeChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Emergency callback mode changed notification, reassessing dismissal assertions", buf, 2u);
  }

  v6 = +[TUCallCapabilities isEmergencyCallbackModeEnabled](TUCallCapabilities, "isEmergencyCallbackModeEnabled");
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "... mode is active, obtaining emergency callback assertion reason", v11, 2u);
    }

    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHEmergencyCallBackModeAssertionReason"));
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "... mode is not active, releasing emergency callback assertion reason", v10, 2u);
    }

    +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHEmergencyCallBackModeAssertionReason"));
  }
  -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
}

- (void)mostRecentlyDisconnectedAudioCallDidClearNotification:(id)a3
{
  if (+[TUCallCapabilities isEmergencyCallbackModeEnabled](TUCallCapabilities, "isEmergencyCallbackModeEnabled", a3))-[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
}

- (void)didChangeDeviceOrientationNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  __CFString **v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (self->_multiwayViewController)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v6 = objc_msgSend(v5, "isPipped");

    v7 = &off_100287870;
    if (!v6)
      v7 = &off_100287878;
    v8 = *v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));
    v11 = (int)objc_msgSend(v10, "intValue");

    -[PHInCallRootViewController updateMultiwayDeviceOrientation:](self, "updateMultiwayDeviceOrientation:", v11);
  }
}

- (void)updateMultiwayDeviceOrientation:(int64_t)a3
{
  id v4;

  if ((unint64_t)(a3 - 1) <= 3)
  {
    v4 = objc_msgSend((id)objc_opt_class(self, a2), "cnkDeviceOrientationForUIDeviceOrientation:", a3);
    -[CNKMultiwayViewControllerProtocol setDeviceOrientation:](self->_multiwayViewController, "setDeviceOrientation:", v4);
  }
}

- (CGSize)preferredPIPContentAspectRatio
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentViewController"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    v7 = objc_opt_respondsToSelector(v6, "preferredPIPContentAspectRatio");

    if ((v7 & 1) == 0)
    {
      v11 = 0x4059000000000000;
      v9 = 0x4059000000000000;
      goto LABEL_7;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    objc_msgSend(v3, "preferredPIPContentAspectRatio");
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v11 = 0x4059000000000000;
    v9 = 0x4059000000000000;
  }

LABEL_7:
  v12 = *(double *)&v9;
  v13 = *(double *)&v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)prepareForDeviceLock
{
  -[PHInCallRootViewController prepareForDeviceLockWithCompletion:](self, "prepareForDeviceLockWithCompletion:", 0);
}

- (void)prepareForDeviceLockWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "prepareForDeviceLock started", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities handleNavigationControllerIfNecessary:](PHInCallUIUtilities, "handleNavigationControllerIfNecessary:", v7));

  if (-[PHInCallRootViewController viewControllerSupportsEffects:](self, "viewControllerSupportsEffects:", v8))
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Disabling effects controller due to device lock event", buf, 2u);
    }

    objc_msgSend(v8, "resetEffectsState");
  }
  v11 = -[PHInCallRootViewController isPresentingViewControllerWithSensitiveInformation](self, "isPresentingViewControllerWithSensitiveInformation");
  v12 = sub_1000C5588();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "dismissing view controllers with sensitive information due to device lock event", buf, 2u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000AF3FC;
    v15[3] = &unk_100284E18;
    v16 = v4;
    -[PHInCallRootViewController dismissViewControllersWithSensitiveInformationWithCompletion:](self, "dismissViewControllersWithSensitiveInformationWithCompletion:", v15);
    v13 = v16;
  }
  else if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "prepareForDeviceLock completed without dismissal", buf, 2u);
  }

}

- (BOOL)viewControllerSupportsEffects:(id)a3
{
  return objc_msgSend(a3, "conformsToProtocol:", &OBJC_PROTOCOL___CNKFaceTimeInCallControlsEffectsPresentingProtocol);
}

- (BOOL)isPresentingEffectsBrowser
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities handleNavigationControllerIfNecessary:](PHInCallUIUtilities, "handleNavigationControllerIfNecessary:", v3));

  if (-[PHInCallRootViewController viewControllerSupportsEffects:](self, "viewControllerSupportsEffects:", v4))
    v5 = objc_msgSend(v4, "isPresentingEffectsBrowser");
  else
    v5 = 0;

  return v5;
}

- (BOOL)isPresentingViewControllerWithSensitiveInformation
{
  if (-[PHInCallRootViewController isPresentingEffectsBrowser](self, "isPresentingEffectsBrowser")
    || -[PHInCallRootViewController isPresentingRemoteHostViewController](self, "isPresentingRemoteHostViewController")
    || -[PHInCallRootViewController isPresentingContactsViewController](self, "isPresentingContactsViewController"))
  {
    return 1;
  }
  else
  {
    return -[PHInCallRootViewController isPresentingContactDetails](self, "isPresentingContactDetails");
  }
}

- (BOOL)isPresentingRemoteHostViewController
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController remoteHostViewController](self, "remoteHostViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentingViewController"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isPresentingContactsViewController
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController contactsViewController](self, "contactsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentingViewController"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isPresentingContactDetails
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
  v5 = objc_opt_class(CNContactViewController, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
    v10 = objc_opt_class(UINavigationController, v9);
    v11 = objc_opt_isKindOfClass(v8, v10);

    if ((v11 & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController", 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewControllers"));

      v7 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
      {
        v15 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v13);
            v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
            v18 = objc_opt_class(CNContactViewController, v14);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
            {
              LOBYTE(v7) = 1;
              goto LABEL_15;
            }
          }
          v7 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return (char)v7;
}

- (void)dismissViewControllersWithSensitiveInformation
{
  -[PHInCallRootViewController dismissViewControllersWithSensitiveInformationWithCompletion:](self, "dismissViewControllersWithSensitiveInformationWithCompletion:", 0);
}

- (void)dismissViewControllersWithSensitiveInformationWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "dismiss sensitive view controllers: started", buf, 2u);
  }

  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000AF924;
  v18[3] = &unk_100284898;
  v8 = v7;
  v19 = v8;
  -[PHInCallRootViewController dismissPhoneRemoteViewControllerAnimated:completion:](self, "dismissPhoneRemoteViewControllerAnimated:completion:", 0, v18);
  dispatch_group_enter(v8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000AF994;
  v16[3] = &unk_100284898;
  v9 = v8;
  v17 = v9;
  -[PHInCallRootViewController dismissContactsViewControllerAnimated:completion:](self, "dismissContactsViewControllerAnimated:completion:", 0, v16);
  dispatch_group_enter(v9);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000AFA04;
  v14[3] = &unk_100284898;
  v15 = v9;
  v10 = v9;
  -[PHInCallRootViewController dismissContactDetailsWithCompletion:](self, "dismissContactDetailsWithCompletion:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000AFA74;
  v12[3] = &unk_100284E18;
  v13 = v4;
  v11 = v4;
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, v12);

}

- (void)showKeypadIfPossible
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewController](self, "audioCallViewController"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewController](self, "audioCallViewController"));
    objc_msgSend(v4, "audioCallControlsViewControllerRequestedKeypadPresentation:", 0);

  }
}

- (BOOL)isShowingHUD
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  v3 = objc_msgSend(v2, "isShowingHUD");

  return v3;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
  objc_msgSend(v8, "preferredContentSize");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
  objc_msgSend(v11, "setPreferredContentSize:", v10, v7 * 0.5);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController contactsViewController](self, "contactsViewController"));

  if (v12 == v13)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v4, "setBackgroundColor:");
  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[UIColor _externalSystemDarkGrayColor](UIColor, "_externalSystemDarkGrayColor"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "colorWithAlphaComponent:", 0.8));
    objc_msgSend(v4, "setBackgroundColor:", v14);

    v4 = (id)v14;
  }

}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController contactsViewController](self, "contactsViewController"));

  if (v4 == v5)
  {
    objc_msgSend(v8, "setDelegate:", 0);
    -[PHInCallRootViewController setContactsViewController:](self, "setContactsViewController:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController remoteHostViewController](self, "remoteHostViewController"));

    if (v6 == v7)
    {
      objc_msgSend(v8, "setDelegate:", 0);
      -[PHInCallRootViewController setRemoteHostViewController:](self, "setRemoteHostViewController:", 0);
    }
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController contactsViewController](self, "contactsViewController"));

  if (v4 == v5)
  {
    -[PHInCallRootViewController setContactsViewController:](self, "setContactsViewController:", 0);
    -[PHInCallRootViewController setTemporarilyAllowAllStatusBarPills:](self, "setTemporarilyAllowAllStatusBarPills:", 0);
  }
}

- (void)transitionToVideoCallBasedViewController:(id)a3
{
  -[PHInCallRootViewController transitionToVideoCallBasedViewController:shouldUpdatePipSize:](self, "transitionToVideoCallBasedViewController:shouldUpdatePipSize:", a3, 0);
}

- (void)transitionToVideoCallBasedViewController:(id)a3 shouldUpdatePipSize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void ***v12;
  void ***v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void **v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  PHInCallRootViewController *v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;

  v4 = a4;
  v6 = a3;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Transitioning to video-call-based view controller: %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    if (v4)
    {
      v40 = _NSConcreteStackBlock;
      v41 = 3221225472;
      v42 = sub_1000B021C;
      v43 = &unk_100284898;
      v12 = &v40;
      v44 = self;
    }
    else
    {
      v12 = 0;
    }
    v13 = objc_retainBlock(v12);
    v14 = sub_1000C5588();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not currently showing the video call nav controller, transitioning to it first", buf, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    objc_msgSend(v17, "alpha");
    v19 = v18;

    if (v19 == 0.0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
      objc_msgSend(v21, "setAlpha:", 1.0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
      objc_msgSend(v23, "layoutIfNeeded");

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController", v40, v41, v42, v43, v44));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
    -[PHInCallRootViewController _transitionFromViewController:toViewController:completion:](self, "_transitionFromViewController:toViewController:completion:", v24, v25, v13);

    v4 = 0;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callForVideoCallBasedViewController:](self, "callForVideoCallBasedViewController:", v6));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topViewController"));
  v29 = objc_msgSend(v28, "conformsToProtocol:", &OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol);

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topViewController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "call"));

  }
  else
  {
    v32 = 0;
  }
  v33 = sub_1000C5588();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v47 = v26;
    v48 = 2112;
    v49 = v32;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Transitioning to multiway view controller for %@, Current displayed active call: %@", buf, 0x16u);
  }

  if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol)
    && (objc_msgSend(v32, "isEqualToCall:", v26) & 1) == 0)
  {
    v35 = sub_1000C5588();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Replacing existing view controllers with multiway view controller", buf, 2u);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
    v45 = v6;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
    objc_msgSend(v37, "setViewControllers:animated:", v38, 1);

  }
  if (v4)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    objc_msgSend(v39, "updatePIPSize");

  }
}

- (id)callForVideoCallBasedViewController:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "call"));
  else
    v4 = 0;

  return v4;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v8 = a6;
  v9 = a5;
  v18 = objc_opt_class(PHConferenceParticipantsViewController, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

  v14 = objc_opt_class(v9, v13);
  if ((objc_msgSend(v12, "containsObject:", v14) & 1) != 0
    || (objc_msgSend(v12, "containsObject:", objc_opt_class(v8, v15)) & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CNKCrossFadeAnimatorFactory makeAnimator](self->_animatorFactory, "makeAnimator"));
  }

  return v16;
}

- (void)showCallDetailsView
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  if (-[PHInCallRootViewController isPresentingCallDetailsView](self, "isPresentingCallDetailsView"))
  {
    v3 = sub_1000C5588();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requested details view controller presentation, but it's already presented", buf, 2u);
    }
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));

    if (!v5)
    {
      v6 = sub_1000C5588();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating new call details navigation controller to show from the root view controller", v17, 2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bannerPresentationManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController makeConversationHUDDetailsNavigationControllerWithBannerPresentationManager:delegate:shouldSetControlsManagerInCallDetailsDelegate:](self, "makeConversationHUDDetailsNavigationControllerWithBannerPresentationManager:delegate:shouldSetControlsManagerInCallDetailsDelegate:", v10, self, 1));
      -[PHInCallRootViewController setCallDetailsNavigationController:](self, "setCallDetailsNavigationController:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));
      objc_msgSend(v12, "setOverrideUserInterfaceStyle:", 2);

    }
    v13 = sub_1000C5588();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController transitioning to call details view", v16, 2u);
    }

    v4 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));
    -[PHInCallRootViewController _transitionFromViewController:toViewController:](self, "_transitionFromViewController:toViewController:", v4, v15);

  }
}

- (BOOL)isPresentingCallDetailsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentViewController"));
      v9 = v8 != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)presentPhoneRemoteViewControllerForView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController remoteHostViewController](self, "remoteHostViewController"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController remoteHostViewController](self, "remoteHostViewController")),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        v7,
        v6,
        v9))
  {
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController remoteHostViewController](self, "remoteHostViewController"));
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requested Add Call presentation, but we already have a remote view controller: %@", buf, 0xCu);

    }
  }
  else if (+[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked"))
  {
    v13 = sub_1000C5588();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Requested Add Call presentation, but the device is passcode locked", buf, 2u);
    }

  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B08C4;
    v15[3] = &unk_1002873A0;
    v15[4] = self;
    v16 = v4;
    +[PHPhoneRemoteHostViewController requestViewControllerWithCompletionHandler:](PHPhoneRemoteHostViewController, "requestViewControllerWithCompletionHandler:", v15);

  }
}

- (void)dismissPhoneRemoteViewController
{
  -[PHInCallRootViewController dismissPhoneRemoteViewControllerAnimated:](self, "dismissPhoneRemoteViewControllerAnimated:", 1);
}

- (void)dismissPhoneRemoteViewControllerAnimated:(BOOL)a3
{
  -[PHInCallRootViewController dismissPhoneRemoteViewControllerAnimated:completion:](self, "dismissPhoneRemoteViewControllerAnimated:completion:", a3, 0);
}

- (void)dismissPhoneRemoteViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD *v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  uint8_t buf[4];
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;

  v4 = a3;
  v6 = a4;
  if (-[PHInCallRootViewController isPresentingRemoteHostViewController](self, "isPresentingRemoteHostViewController"))
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v17 = v4;
      v18 = 1024;
      v19 = v6 != 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "dismissing phoneRemoteVC animated: %d, hasCompletion: %d", buf, 0xEu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B0D68;
    v13[3] = &unk_100287378;
    v15 = v4;
    v13[4] = self;
    v14 = v6;
    v9 = objc_retainBlock(v13);
    v10 = v9;
    if (v4)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000B0E88;
      v11[3] = &unk_100285050;
      v11[4] = self;
      v12 = v9;
      -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v11);

    }
    else
    {
      -[PHInCallRootViewController setTemporarilyAllowAllStatusBarPills:](self, "setTemporarilyAllowAllStatusBarPills:", 0);
      -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v10);
    }

  }
  else if (v6)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController: Remote view service terminated with error: %@", (uint8_t *)&v10, 0xCu);

  }
  if (objc_msgSend(v4, "code") != (id)1)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController: Remote view service was not cancelled, so dismissing remote view controller", (uint8_t *)&v10, 2u);
    }

    -[PHInCallRootViewController dismissPhoneRemoteViewControllerAnimated:](self, "dismissPhoneRemoteViewControllerAnimated:", 0);
  }

}

- (void)setBackgroundStyle:(int64_t)a3 animatedWithDuration:(double)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "setBackgroundStyle:withDuration:", a3, a4);

}

- (void)setStatusBarHidden:(BOOL)a3 withDuration:(double)a4
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;

  v5 = a3;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Request to set status bar hidden %@ on %@", (uint8_t *)&v12, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v11, "setStatusBarHidden:withDuration:", v5, a4);

  -[PHInCallRootViewController setShouldHideStatusBar:](self, "setShouldHideStatusBar:", v5);
  -[PHInCallRootViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)phoneRemoteHostViewControllerDidDismiss
{
  -[PHInCallRootViewController setTemporarilyAllowAllStatusBarPills:](self, "setTemporarilyAllowAllStatusBarPills:", 0);
  -[PHInCallRootViewController setRemoteHostViewController:](self, "setRemoteHostViewController:", 0);
  -[PHInCallRootViewController updateDesiredSpringboardBehavior](self, "updateDesiredSpringboardBehavior");
}

+ (void)obtainDismissalAssertionForReason:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  if ((objc_msgSend((id)qword_1002DCB40, "containsObject:", v3) & 1) == 0)
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Obtaining Dismissal Assertion for reason: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend((id)qword_1002DCB40, "addObject:", v3);
  }

}

+ (void)releaseDismissalAssertionForReason:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  uint64_t v14;

  v3 = a3;
  if (objc_msgSend((id)qword_1002DCB40, "containsObject:", v3))
  {
    objc_msgSend((id)qword_1002DCB40, "removeObject:", v3);
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      v13 = 2112;
      v14 = qword_1002DCB40;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing Dismissal Assertion %@. Remaining assertions are: %@", buf, 0x16u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v3, CFSTR("PHReleasedAssertionKey")));
    v10 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PHDismissalAssertionReleasedNotification"), 0, v7);

  }
}

+ (void)releaseDismissalAssertionReasons:(id)a3
{
  id v3;
  id v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;

  v3 = a3;
  v4 = objc_msgSend((id)qword_1002DCB40, "copy");
  v5 = objc_msgSend(v4, "intersectsSet:", v3);

  if (v5)
  {
    objc_msgSend((id)qword_1002DCB40, "minusSet:", v3);
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = qword_1002DCB40;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Releasing Dismissal Assertion Reasons %@. Remaining assertions are: %@", buf, 0x16u);
    }

    v10 = CFSTR("PHReleasedAssertionKey");
    v11 = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("PHDismissalAssertionReleasedNotification"), 0, v8);

  }
}

+ (BOOL)containsDismissalAssertionForReason:(id)a3
{
  return objc_msgSend((id)qword_1002DCB40, "containsObject:", a3);
}

+ (void)forceClearAllDismissalAssertions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[8];
  const __CFString *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSViewController getSetOfSOSDismissalAssertions](PHSOSViewController, "getSetOfSOSDismissalAssertions"));
  v3 = objc_msgSend((id)qword_1002DCB40, "mutableCopy");
  objc_msgSend(v3, "minusSet:", v2);
  if (objc_msgSend((id)qword_1002DCB40, "count"))
  {
    objc_msgSend((id)qword_1002DCB40, "intersectSet:", v2);
    v9 = CFSTR("PHReleasedAssertionKey");
    v10 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PHDismissalAssertionReleasedNotification"), 0, v4);

    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Force clearing dismissal assertions besides PHSOSCallAssertionReason", v8, 2u);
    }

  }
}

- (void)dismissalAssertionReleasedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  PHInCallRootViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  PHSOSViewController *sosViewController;
  PHSOSViewController *v14;
  id v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  UINavigationController *audioCallNavigationController;
  PHAudioCallViewController *audioCallViewController;
  id v23;
  NSObject *v24;
  PHPTTFullScreenContainerViewController *pttFullScreenContainerViewController;
  int v26;
  PHInCallRootViewController *v27;
  __int16 v28;
  id v29;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412546;
    v27 = self;
    v28 = 2112;
    v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v26, 0x16u);
  }

  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (PHInCallRootViewController *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions"));
    v26 = 138412290;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "The remaining dismissal assertions are %@", (uint8_t *)&v26, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHReleasedAssertionKey")));

  if (+[PHInCallRootViewController hasDismissalAssertions](PHInCallRootViewController, "hasDismissalAssertions"))
  {
    if (+[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSViewController getSetOfSOSDismissalAssertions](PHSOSViewController, "getSetOfSOSDismissalAssertions"));
      if ((objc_msgSend(v11, "intersectsSet:", v12) & 1) != 0)
      {
        sosViewController = self->_sosViewController;

        if (sosViewController)
        {
          v14 = self->_sosViewController;
LABEL_12:
          self->_sosViewController = 0;

          goto LABEL_23;
        }
      }
      else
      {

      }
    }
    else
    {
      v14 = self->_sosViewController;
      if (v14)
        goto LABEL_12;
    }
    if (-[PHInCallRootViewController shouldReleaseAudioCallViewController](self, "shouldReleaseAudioCallViewController"))
    {
      v15 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138412290;
        v27 = (PHInCallRootViewController *)qword_1002DCB40;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Releasing the audio call view controller based on current dismissal assertions: %@", (uint8_t *)&v26, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController features](self, "features"));
      v18 = objc_msgSend(v17, "callManagerEnabled");

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](self, "callManager"));
        objc_msgSend(v19, "cleanUp");

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
      -[PHInCallRootViewController removeViewController:](self, "removeViewController:", v20);

      audioCallNavigationController = self->_audioCallNavigationController;
      self->_audioCallNavigationController = 0;

      audioCallViewController = self->_audioCallViewController;
      self->_audioCallViewController = 0;

    }
    else if (objc_msgSend((id)qword_1002DCB40, "count") == (id)1
           && objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHMessageComposeViewControllerAssertionReason")))
    {
      -[PHInCallRootViewController releaseIdleTimerAssertionWithComment:](self, "releaseIdleTimerAssertionWithComment:", CFSTR("only showing message compose"));
    }
  }
  else
  {
    -[PHInCallRootViewController requestInCallDismissal](self, "requestInCallDismissal");
  }
LABEL_23:
  if (objc_msgSend(v11, "containsObject:", CFSTR("PHInitialPTTFullScreenPresentationAssertionReason"))
    && self->_pttFullScreenContainerViewController)
  {
    v23 = sub_1000C5588();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Releasing the PushToTalk view controller.", (uint8_t *)&v26, 2u);
    }

    -[PHInCallRootViewController removeViewController:](self, "removeViewController:", self->_pttFullScreenContainerViewController);
    pttFullScreenContainerViewController = self->_pttFullScreenContainerViewController;
    self->_pttFullScreenContainerViewController = 0;

  }
  -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");

}

- (BOOL)shouldReleaseAudioCallViewController
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)qword_1002DCB40;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController dismissalAssertionReason](PHAudioCallViewController, "dismissalAssertionReason"));
  if ((objc_msgSend(v3, "containsObject:", v4) & 1) != 0
    || (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHAudioCallViewControllerDismissalAssertionHandlingCallFailure")) & 1) != 0|| (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHFailureAlertShowingAssertionReason")) & 1) != 0|| (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHMessageComposeViewControllerAssertionReason")) & 1) != 0|| (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHCallEndedBlockAndReportInProgressAssertionReason")) & 1) != 0|| (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHAudioCallViewControllerDismissalAssertionWaitingForIdle")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
    if (v7 == v8)
    {
      v5 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));
      v5 = v9 != 0;

    }
  }

  return v5;
}

+ (NSSet)dismissalAssertions
{
  return (NSSet *)(id)qword_1002DCB40;
}

+ (BOOL)hasDismissalAssertions
{
  return objc_msgSend((id)qword_1002DCB40, "count") != 0;
}

- (void)obtainIdleTimerAssertionWithComment:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Obtaining Idle Timer Assertion: %@", (uint8_t *)&v16, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setIdleTimerDisabled:forReason:", 1, CFSTR("PHIdleTimerDisabledReason"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v9 = objc_msgSend(v8, "callDisplayStyle");

  if (v9 == (id)3)
  {
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Obtaining Idle Timer Assertion on ambient scene: %@", (uint8_t *)&v16, 0xCu);
    }

    -[PHInCallRootViewController ambientSetIdleTimerDisabled:](self, "ambientSetIdleTimerDisabled:", 1);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));

    if (v12)
    {
      v13 = sub_1000C5588();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Obtaining Idle Timer Assertion on window scene: %@", (uint8_t *)&v16, 0xCu);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
      objc_msgSend(v15, "setIdleTimerDisabled:", 1);

    }
  }

}

- (void)releaseIdleTimerAssertionWithComment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 0, CFSTR("PHIdleTimerDisabledReason"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v7 = objc_msgSend(v6, "callDisplayStyle");

  if (v7 == (id)3)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Released Idle Timer Assertion on ambient scene: %@", (uint8_t *)&v16, 0xCu);
    }

    -[PHInCallRootViewController ambientSetIdleTimerDisabled:](self, "ambientSetIdleTimerDisabled:", 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
      objc_msgSend(v11, "setIdleTimerDisabled:", 0);

      v12 = sub_1000C5588();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Released Idle Timer Assertion on window scene: %@", (uint8_t *)&v16, 0xCu);
      }

    }
  }
  v14 = sub_1000C5588();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Released Idle Timer Assertion: %@", (uint8_t *)&v16, 0xCu);
  }

}

- (void)pullRelayingCallsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  _QWORD v13[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pickedRoute"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v7 = objc_msgSend(v6, "anyCallPassesTest:", &stru_1002873C0);

  v8 = objc_msgSend(v5, "deviceType");
  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8 != (id)13 || (v7 & 1) != 0)
  {
    if (v11)
    {
      v12 = 67109376;
      LODWORD(v13[0]) = v7;
      WORD2(v13[0]) = 2048;
      *(_QWORD *)((char *)v13 + 6) = objc_msgSend(v5, "deviceType");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not pulling any relay calls (incomingCallExists: %d, pickedRouteDeviceType: %ld)", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    if (v11)
    {
      v12 = 138412290;
      v13[0] = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pulling all relaying calls from device: %@", (uint8_t *)&v12, 0xCu);
    }

    v10 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    -[NSObject pullRelayingCallsFromClient](v10, "pullRelayingCallsFromClient");
  }

}

- (void)handleActivationForEndAndLock
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  unsigned int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  unsigned int v38;
  _BYTE v39[128];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleActivationForEndAndLock", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pickedRoute"));
  v8 = objc_msgSend(v7, "isReceiver");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v10 = v9;
  if (v8)
  {
    if ((objc_msgSend(v9, "hasCurrentCalls") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
      v12 = objc_msgSend(v11, "isLockToEndCallEnabled");

      if (v12)
      {
        v13 = sub_1000C5588();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Ending call on lock event", buf, 2u);
        }

        byte_1002DCB48 = 1;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        objc_msgSend(v15, "disconnectAllCalls");

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter", 0));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentVideoCalls"));

        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v34;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v34 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
              objc_msgSend(v23, "disconnectCall:", v22);

              v21 = (char *)v21 + 1;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          }
          while (v19);
        }

        return;
      }
    }
    else
    {

    }
    v29 = sub_1000C5588();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
      v32 = objc_msgSend(v31, "isLockToEndCallEnabled");
      *(_DWORD *)buf = 67109120;
      v38 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "sendResponseIfNecessaryWithUnhandledEvents via handleActivationForEndAndLock - Receiver route is picked, but there are no active calls or AX setting to ignore is on: %d", buf, 8u);

    }
    byte_1002DCB48 = 0;
LABEL_24:
    -[PHInCallRootViewController sendResponseIfNecessaryWithUnhandledEvents:](self, "sendResponseIfNecessaryWithUnhandledEvents:", 1);
    return;
  }
  v24 = objc_msgSend(v9, "hasCurrentVideoCalls");

  v25 = sub_1000C5588();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Disconnecting video calls due to lock button press", buf, 2u);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    objc_msgSend(v28, "disconnectAllCalls");

    goto LABEL_24;
  }
  if (v27)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "sendResponseIfNecessaryWithUnhandledEvents via handleActivationForEndAndLock - Not ending call on lock event because audio route is handset", buf, 2u);
  }

  byte_1002DCB48 = 0;
  -[PHInCallRootViewController sendResponseIfNecessaryWithUnhandledEvents:](self, "sendResponseIfNecessaryWithUnhandledEvents:", 1);
  +[PHInCallRootViewController forceClearAllDismissalAssertions](PHInCallRootViewController, "forceClearAllDismissalAssertions");
}

- (BOOL)shouldConsumeDeviceLockEvent
{
  unsigned __int8 v2;

  v2 = +[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive");
  return v2 & 1 | ((byte_1002DCB48 & 1) == 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHInCallRootViewController;
  -[PHInCallRootViewController traitCollectionDidChange:](&v9, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "_backlightLuminance");

  if (v5 == (id)1)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Screen entered into reduced luminance. Prepare for device lock", v8, 2u);
    }

    -[PHInCallRootViewController prepareForDeviceLock](self, "prepareForDeviceLock");
  }
}

- (void)handleDeviceLockEventWithSourceType:(int64_t)a3 resultHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  _QWORD *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  _BOOL8 v32;
  id v33;
  NSObject *v34;
  _QWORD v35[4];
  _QWORD *v36;
  uint8_t v37[16];
  _QWORD v38[4];
  void (**v39)(id, _QWORD);
  id v40;
  uint8_t buf[4];
  int64_t v42;

  v6 = (void (**)(id, _QWORD))a4;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v42 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController handleDeviceLockEventWithSourceType %ld started", buf, 0xCu);
  }

  if (!a3)
  {
    v15 = sub_1000C5588();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received device lock event with unknown source type, not handing off to child view controllers", buf, 2u);
    }

    -[PHInCallRootViewController prepareForDeviceLock](self, "prepareForDeviceLock");
    v6[2](v6, 0);
    goto LABEL_37;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parentViewController"));
    v14 = v13 == 0;

    if (v14)
      goto LABEL_12;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));
    objc_msgSend(v9, "handleDeviceLockEventWithSourceType:", a3);
  }
  else
  {

  }
LABEL_12:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CNKMultiwayViewControllerProtocol view](self->_multiwayViewController, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
  if (!v18)
  {

    goto LABEL_21;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CNKMultiwayViewControllerProtocol parentViewController](self->_multiwayViewController, "parentViewController"));
  v20 = v19 == 0;

  if (!v20)
  {
    if ((-[CNKMultiwayViewControllerProtocol isOneToOneModeEnabled](self->_multiwayViewController, "isOneToOneModeEnabled") & 1) == 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
      if ((objc_msgSend(v21, "conversationOneToOneModeEnabled") & 1) != 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "incomingVideoCall"));
        v24 = v23 == 0;

        if (!v24)
          goto LABEL_17;
      }
      else
      {

      }
      +[PHInCallRootViewController setShouldLockDeviceOnNextDismiss](PHInCallRootViewController, "setShouldLockDeviceOnNextDismiss");
      goto LABEL_21;
    }
LABEL_17:
    -[PHInCallRootViewController handleDeviceLockEventOverUPlusOneVideoViewsWithSourceType:](self, "handleDeviceLockEventOverUPlusOneVideoViewsWithSourceType:", a3);
  }
LABEL_21:
  if (-[PHInCallRootViewController isPresentingViewControllerWithSensitiveInformation](self, "isPresentingViewControllerWithSensitiveInformation"))
  {
    objc_initWeak((id *)buf, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000B29FC;
    v38[3] = &unk_100284B68;
    objc_copyWeak(&v40, (id *)buf);
    v39 = v6;
    v25 = objc_retainBlock(v38);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController transitionCoordinator](self, "transitionCoordinator"));

    if (v26)
    {
      v27 = sub_1000C5588();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Device lock event received while transitioning a view controller with sensitive information. Delaying lock until transition is complete.", v37, 2u);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController transitionCoordinator](self, "transitionCoordinator"));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000B2B8C;
      v35[3] = &unk_1002873E8;
      v36 = v25;
      objc_msgSend(v29, "animateAlongsideTransition:completion:", 0, v35);

      -[PHInCallRootViewController dismissViewControllersWithSensitiveInformation](self, "dismissViewControllersWithSensitiveInformation");
LABEL_30:

      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
      goto LABEL_37;
    }
    if (-[PHInCallRootViewController shouldConsumeDeviceLockEvent](self, "shouldConsumeDeviceLockEvent"))
    {
      v30 = sub_1000C5588();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "We are requesting lock events due to ICS showing view controllers with sensitive information, allow the screen to be locked", v37, 2u);
      }

      ((void (*)(_QWORD *))v25[2])(v25);
      goto LABEL_30;
    }

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }
  v32 = -[PHInCallRootViewController shouldConsumeDeviceLockEvent](self, "shouldConsumeDeviceLockEvent");
  v33 = sub_1000C5588();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v42) = v32;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController handleDeviceLockEventWithSourceType shouldConsumeDeviceLockEvent %d", buf, 8u);
  }

  if (!v32)
    -[PHInCallRootViewController prepareForDeviceLock](self, "prepareForDeviceLock");
  v6[2](v6, v32);
LABEL_37:

}

- (void)handleLockButtonPressed
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  const __CFString *v7;
  const __CFString *v8;

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleLockButtonPressed", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = CFSTR("kPHHardwareButtonEventType");
  v8 = CFSTR("kPHHardwareButtonEventTypeLockButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PHHardwareButtonEventNotification"), 0, v5);

}

- (void)handleVolumeUpButtonPressed
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  const __CFString *v7;
  const __CFString *v8;

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleVolumeUpButtonPressed", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = CFSTR("kPHHardwareButtonEventType");
  v8 = CFSTR("kPHHardwareButtonEventTypeVolumeUpButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PHHardwareButtonEventNotification"), 0, v5);

}

- (void)handleVolumeDownButtonPressed
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  const __CFString *v7;
  const __CFString *v8;

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleVolumeDownButtonPressed", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = CFSTR("kPHHardwareButtonEventType");
  v8 = CFSTR("kPHHardwareButtonEventTypeVolumeDownButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PHHardwareButtonEventNotification"), 0, v5);

}

- (void)handleHeadsetButtonPressed
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  const __CFString *v7;
  const __CFString *v8;

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleHeadsetButtonPressed", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = CFSTR("kPHHardwareButtonEventType");
  v8 = CFSTR("kPHHardwareButtonEventTypeHeadsetButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PHHardwareButtonEventNotification"), 0, v5);

}

- (void)handleHeadsetButtonLongPressed
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  const __CFString *v7;
  const __CFString *v8;

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HardwareEvent: handleHeadsetButtonLongPressed", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = CFSTR("kPHHardwareButtonEventType");
  v8 = CFSTR("kPHHardwareButtonEventTypeHeadsetButtonLongPress");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PHHardwareButtonEventNotification"), 0, v5);

}

- (void)statusBarTappedInFullScreen
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](self, "callManager"));
  objc_msgSend(v3, "setIgnoreUpdates:", 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](self, "callManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "frontmostAudioOrVideoCall"));
  objc_msgSend(v6, "prioritizeCall:", v5);

}

- (void)handleDoubleHeightStatusBarTap
{
  -[PHInCallRootViewController dismissPhoneRemoteViewController](self, "dismissPhoneRemoteViewController");
  -[PHInCallRootViewController dismissContactsViewController](self, "dismissContactsViewController");
  -[PHInCallRootViewController dismissScreenTimeAlertHostIfNeeded](self, "dismissScreenTimeAlertHostIfNeeded");
}

- (unint64_t)desiredButtonEventsForCallContainer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  const char *v12;
  id v13;
  int v15;
  unint64_t v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));

  if (v5)
  {
    v6 = -[PHInCallRootViewController desiresLockButtonEventsForCallContainer:](self, "desiresLockButtonEventsForCallContainer:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingCall"));

    v8 = v6 | 6;
    if (!v7)
      v8 = v6;
    v9 = v8 | 0x28;
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v15 = 134217984;
    v16 = v9;
    v12 = "Audio controller requesting button events %ld";
    goto LABEL_12;
  }
  if (!self->_multiwayViewController)
  {
    v9 = 0;
    goto LABEL_14;
  }
  if (-[PHInCallRootViewController desiresLockAndVolumeButtonEventsForCallContainer:](self, "desiresLockAndVolumeButtonEventsForCallContainer:", v4))
  {
    v9 = 47;
  }
  else
  {
    v9 = 40;
  }
  v13 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = v9;
    v12 = "Video controller requesting button events %ld";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0xCu);
  }
LABEL_13:

LABEL_14:
  return v9;
}

- (unint64_t)desiredSceneButtonEventsForCallContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  const char *v10;
  id v11;
  int v13;
  unint64_t v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingCall"));

    if (v6)
      v7 = 30;
    else
      v7 = 24;
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v13 = 134217984;
    v14 = v7;
    v10 = "Audio controller requesting scene button events %ld";
    goto LABEL_13;
  }
  if (!self->_multiwayViewController)
  {
    v7 = 0;
    goto LABEL_15;
  }
  if (-[PHInCallRootViewController desiresLockAndVolumeButtonEventsForCallContainer:](self, "desiresLockAndVolumeButtonEventsForCallContainer:", v4))
  {
    v7 = 30;
  }
  else
  {
    v7 = 24;
  }
  v11 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = v7;
    v10 = "Video controller requesting scene button events %ld";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
  }
LABEL_14:

LABEL_15:
  return v7;
}

- (BOOL)desiresLockAndVolumeButtonEventsForCallContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "incomingVideoCallUsingCallContainer:", v3));

  return v6 != 0;
}

- (BOOL)isPickedRouteReceiver
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pickedRoute"));
  v5 = objc_msgSend(v4, "isReceiver");

  return v5;
}

- (BOOL)desiresLockButtonEventsForCallContainer:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingCall"));
  if (v5)
  {
    v6 = 1;
  }
  else if (objc_msgSend(v4, "currentCallCount"))
  {
    v6 = -[PHInCallRootViewController isPickedRouteReceiver](self, "isPickedRouteReceiver");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)hardwareButtonEventNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v18 = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController received a hardware button event (%@)", (uint8_t *)&v18, 0xCu);

  }
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
  if (!-[__CFString conversationOneToOneModeEnabled](v8, "conversationOneToOneModeEnabled")
    || !-[CNKMultiwayViewControllerProtocol isViewLoaded](self->_multiwayViewController, "isViewLoaded"))
  {
    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CNKMultiwayViewControllerProtocol view](self->_multiwayViewController, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("kPHHardwareButtonEventType")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "incomingVideoCallUsingCallContainer:", v14));

    if (v8 == CFSTR("kPHHardwareButtonEventTypeVolumeDownButton")
      || v8 == CFSTR("kPHHardwareButtonEventTypeVolumeUpButton"))
    {
      objc_msgSend(v15, "suppressRingtone");
    }
    else
    {
      if (v8 == CFSTR("kPHHardwareButtonEventTypeHeadsetButton"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
        objc_msgSend(v17, "handleHeadsetButtonPressForCall:sourceIdentifier:", v15, 0);

        goto LABEL_13;
      }
      if (v8 == CFSTR("kPHHardwareButtonEventTypeHeadsetButtonLongPress"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        objc_msgSend(v16, "handleActionForWiredHeadsetMiddleButtonLongPress");
LABEL_13:

      }
    }

LABEL_15:
  }

}

- (void)updateDesiredSpringboardBehavior
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  PHSOSViewController *sosViewController;
  unsigned int v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  __int16 v42;
  _BOOL4 v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));
    v5 = (unint64_t)objc_msgSend(v4, "allowsOrientationChangeEvents");

  }
  else
  {
    v5 = self->_multiwayViewController != 0;
  }
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v40 = 67109120;
    v41 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting allowsOrientationChangeEvents to %d", (uint8_t *)&v40, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v8, "setOrientationChangedEventsEnabled:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v10 = -[PHInCallRootViewController desiredButtonEventsForCallContainer:](self, "desiredButtonEventsForCallContainer:", v9);
  v11 = -[PHSOSViewController desiredButtonEvents](self->_sosViewController, "desiredButtonEvents") | v10;

  v12 = sub_1000C5588();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v40 = 67109120;
    v41 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting desired hardware buttons to %d", (uint8_t *)&v40, 8u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v14, "setDesiredHardwareButtonEvents:", v11);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
  if (v15)
  {
    v16 = -[PHInCallRootViewController desiresLockButtonEvents](self, "desiresLockButtonEvents");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v18 = -[PHInCallRootViewController desiredSceneButtonEventsForCallContainer:](self, "desiredSceneButtonEventsForCallContainer:", v17);
    v19 = -[PHSOSViewController desiredSceneButtonEvents](self->_sosViewController, "desiredSceneButtonEvents") | v18;

    v20 = sub_1000C5588();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 67109376;
      v41 = v19;
      v42 = 1024;
      v43 = v16;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Setting scenes desired button events to %d and desires lock button events to %d", (uint8_t *)&v40, 0xEu);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
    objc_msgSend(v22, "setSupportsDeviceLockEvents:", v16);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
    objc_msgSend(v23, "setPreferredHardwareButtonEventTypes:", v19);

    -[PHInCallRootViewController updateInCallWindowScenePrefersHiddenWhenDismissed](self, "updateInCallWindowScenePrefersHiddenWhenDismissed");
    -[PHInCallRootViewController updateInCallWindowSceneFaceTimeLaunchBehavior](self, "updateInCallWindowSceneFaceTimeLaunchBehavior");
  }
  if (v3)
    v24 = objc_msgSend(v3, "allowsMenuButtonDismissal");
  else
    v24 = 1;
  sosViewController = self->_sosViewController;
  if (sosViewController)
    v26 = -[PHSOSViewController allowsMenuButtonDismissal](sosViewController, "allowsMenuButtonDismissal");
  else
    v26 = 1;
  v27 = v24 & v26;
  v28 = sub_1000C5588();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v40 = 67109120;
    v41 = v27;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Setting allows menu button dismissal to %d", (uint8_t *)&v40, 8u);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v30, "setAllowsMenuButtonDismissal:", v27);

  -[PHInCallRootViewController setAllowHomeOutDismissal:](self, "setAllowHomeOutDismissal:", v27);
  -[PHInCallRootViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  if (v3)
  {
    v31 = objc_msgSend(v3, "allowsOtherAlertsToStackOnTop");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v32, "setAllowsAlertStacking:", v31);

    v33 = (uint64_t)objc_msgSend(v3, "allowsBanners");
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v33 = 1;
    objc_msgSend(v34, "setAllowsAlertStacking:", 1);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v35, "setAllowsBanners:", v33);

  if ((objc_msgSend(v3, "wantsApplicationDismissalStyle") & 1) != 0
    || -[CNKMultiwayViewControllerProtocol wantsApplicationDismissalStyle](self->_multiwayViewController, "wantsApplicationDismissalStyle"))
  {
    if (self->_sosViewController)
      v36 = 1;
    else
      v36 = 2;
  }
  else
  {
    v36 = 1;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v37, "setDismissalAnimationStyle:", v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "frontmostAudioOrVideoCall"));
  -[PHInCallRootViewController updateRemoteAlertSwipeDismissalStyleForCall:](self, "updateRemoteAlertSwipeDismissalStyleForCall:", v39);

  -[PHInCallRootViewController updateShouldBecomeVisibleWhenWakingDisplay](self, "updateShouldBecomeVisibleWhenWakingDisplay");
}

- (void)updateShouldBecomeVisibleWhenWakingDisplay
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _DWORD v17[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostAudioOrVideoCall"));

  if (!v4
    || (objc_msgSend(v4, "isVideo") & 1) != 0
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteParticipantHandles")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 != (id)1))
  {
    if (!-[PHInCallRootViewController wantsMiniWindowCoverViewController](self, "wantsMiniWindowCoverViewController"))
    {
      if ((SBUIIsSystemApertureEnabled() & 1) != 0)
      {
        v9 = 0;
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  v7 = objc_msgSend(v4, "isScreening");
  v8 = SBUIIsSystemApertureEnabled();
  v9 = v8 & v7 ^ 1;
  if ((v8 & 1) == 0 && v7)
  {
LABEL_10:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController pttFullScreenContainerViewController](self, "pttFullScreenContainerViewController"));
    v9 = v10 == v11;

  }
LABEL_11:
  v12 = sub_1000C5588();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating shouldBecomeVisibleWhenWakingDisplay: %d", (uint8_t *)v17, 8u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentInCallScene"));
  objc_msgSend(v16, "setShouldBecomeVisibleWhenWakingDisplay:", v9);

}

- (BOOL)desiresLockButtonEvents
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));
  if ((objc_msgSend(v3, "desiresLockButtonEvents") & 1) != 0
    || -[PHSOSViewController desiresLockButtonEvents](self->_sosViewController, "desiresLockButtonEvents"))
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    if ((objc_msgSend(v5, "hasCurrentVideoCalls") & 1) != 0)
      v4 = 1;
    else
      v4 = -[PHInCallRootViewController isPresentingViewControllerWithSensitiveInformation](self, "isPresentingViewControllerWithSensitiveInformation");

  }
  return v4;
}

- (id)getPreferredBackgroundActivitiesToSuppress:(id)a3 whenIsPipped:(BOOL)a4 whenTemporarilyAllowAllStatusBarPills:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  id v13;
  NSSet *v14;
  NSSet *v15;
  __int16 v17;
  __int16 v18;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = v7;
  if (v5)
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 0;
      v11 = "Don't suppress status bar pill because temporarilyAllowAllStatusBarPills is true.";
      v12 = (uint8_t *)&v18;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
  }
  else
  {
    if (!v6)
    {
      v14 = (NSSet *)v7;
      goto LABEL_10;
    }
    v13 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v11 = "Don't suppress status bar pill because ICS is pipped.";
      v12 = (uint8_t *)&v17;
      goto LABEL_7;
    }
  }

  v14 = objc_opt_new(NSSet);
LABEL_10:
  v15 = v14;

  return v15;
}

- (id)backgroundActivities
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
  v3 = sub_1000A33EC((unint64_t)objc_msgSend(v2, "ics_sceneType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (BOOL)isPipped
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  v3 = objc_msgSend(v2, "isPipped");

  return v3;
}

- (void)setTemporarilyAllowAllStatusBarPills:(BOOL)a3
{
  if (self->_temporarilyAllowAllStatusBarPills != a3)
  {
    self->_temporarilyAllowAllStatusBarPills = a3;
    -[PHInCallRootViewController setNeedsStatusBarPillSuppressionUpdate](self, "setNeedsStatusBarPillSuppressionUpdate");
  }
}

- (void)setNeedsStatusBarPillSuppressionUpdate
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController backgroundActivities](self, "backgroundActivities"));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController getPreferredBackgroundActivitiesToSuppress:whenIsPipped:whenTemporarilyAllowAllStatusBarPills:](self, "getPreferredBackgroundActivitiesToSuppress:whenIsPipped:whenTemporarilyAllowAllStatusBarPills:", v3, -[PHInCallRootViewController isPipped](self, "isPipped"), -[PHInCallRootViewController temporarilyAllowAllStatusBarPills](self, "temporarilyAllowAllStatusBarPills")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
  +[PHInCallRootViewController setStatusBarPillSuppressionForBackgroundActivities:onWindowScene:](PHInCallRootViewController, "setStatusBarPillSuppressionForBackgroundActivities:onWindowScene:", v5, v4);

}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController childViewControllers](self, "childViewControllers"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  if ((objc_opt_respondsToSelector(v7, "willAnimateRotationToInterfaceOrientation:duration:") & 1) != 0)
    objc_msgSend(v7, "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController childViewControllers](self, "childViewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  if ((objc_opt_respondsToSelector(v5, "shouldAutorotateToInterfaceOrientation:") & 1) != 0)
    v6 = objc_msgSend(v5, "shouldAutorotateToInterfaceOrientation:", a3);
  else
    v6 = 0;

  return v6;
}

- (void)updateTransportIndicatorView
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  if (CPIsInternalDevice(self, a2))
  {
    v3 = sub_10000D538(CFSTR("ShowFaceTimeTransportIndicator"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callPassingTest:", &stru_100287408));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController transportIndicatorView](self, "transportIndicatorView"));
      if (!v26)
      {

        if (v7)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController transportIndicatorView](self, "transportIndicatorView"));
          objc_msgSend(v23, "removeFromSuperview");

          -[PHInCallRootViewController setTransportIndicatorView:](self, "setTransportIndicatorView:", 0);
        }
        goto LABEL_16;
      }

      if (!v7)
      {
        v8 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 15.0, 15.0);
        -[PHInCallRootViewController setTransportIndicatorView:](self, "setTransportIndicatorView:", v8);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController transportIndicatorView](self, "transportIndicatorView"));
        objc_msgSend(v9, "setAutoresizingMask:", 9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController transportIndicatorView](self, "transportIndicatorView"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
        objc_msgSend(v11, "setCornerRadius:", 7.5);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController transportIndicatorView](self, "transportIndicatorView"));
        objc_msgSend(v12, "addSubview:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
        objc_msgSend(v14, "bounds");
        v16 = v15 + -15.0 + -5.0;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
        objc_msgSend(v17, "bounds");
        v19 = v18 + -15.0 + -5.0;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController transportIndicatorView](self, "transportIndicatorView"));
        objc_msgSend(v20, "setFrame:", v16, v19, 15.0, 15.0);

      }
      v21 = objc_msgSend(v26, "faceTimeTransportType");
      if (v21 == (id)2)
      {
        v22 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      }
      else if (v21 == (id)1)
      {
        v22 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
      }
      else
      {
        if (v21)
        {
LABEL_16:

          return;
        }
        v22 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
      }
      v24 = (void *)v22;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController transportIndicatorView](self, "transportIndicatorView"));
      objc_msgSend(v25, "setBackgroundColor:", v24);

      goto LABEL_16;
    }
  }
}

- (SBSUIInCallWindowScene)inCallWindowScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sceneManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callScene"));

  return (SBSUIInCallWindowScene *)v5;
}

- (void)animateToAlert
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[8];
  _QWORD v11[5];
  _QWORD v12[5];

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Animate to Alert", v10, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  v5 = objc_msgSend(v4, "pipState");

  if (v5 == (id)2)
  {
    v11[0] = SBSUIRemoteAlertOptionViewControllerClass;
    v6 = TUInCallRemoteAlertViewControllerClassName();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v12[0] = v7;
    v12[1] = &__kCFBooleanTrue;
    v11[1] = SBSUIRemoteAlertOptionDismissWithHomeButton;
    v11[2] = SBSUIRemoteAlertOptionWantsWallpaperTunnel;
    v12[2] = &__kCFBooleanTrue;
    v11[3] = SBSUIRemoteAlertOptionDismissalAnimationStyle;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
    v11[4] = SBSUIRemoteAlertOptionSwipeDismissalStyle;
    v12[3] = v8;
    v12[4] = &off_100296928;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 5));

    SBSUIActivateRemoteAlert(TUBundleIdentifierInCallServiceApplication, v9);
  }
}

- (void)presentBlockAndReportAlertToBlockCall:(id)a3 forViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("BLOCK_REPORT_ALERT_TITLE"), &stru_10028DC20, CFSTR("InCallService")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, 0, 0));

    objc_initWeak(location, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("BLOCK_REPORT_ALERT_ACTION_BLOCK"), &stru_10028DC20, CFSTR("InCallService")));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000B4A28;
    v32[3] = &unk_100287430;
    objc_copyWeak(&v35, location);
    v16 = v8;
    v33 = v16;
    v17 = v10;
    v34 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 2, v32));
    objc_msgSend(v13, "addAction:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("BLOCK_REPORT_ALERT_ACTION_BLOCK_REPORT"), &stru_10028DC20, CFSTR("InCallService")));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000B4AC8;
    v28[3] = &unk_100287430;
    objc_copyWeak(&v31, location);
    v29 = v16;
    v21 = v17;
    v30 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 2, v28));
    objc_msgSend(v13, "addAction:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("BLOCK_REPORT_ALERT_ACTION_CANCEL"), &stru_10028DC20, CFSTR("InCallService")));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000B4B80;
    v26[3] = &unk_100286110;
    v27 = v21;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 1, v26));
    objc_msgSend(v13, "addAction:", v25);

    objc_msgSend(v9, "presentModalViewController:animated:", v13, 1);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&v35);
    objc_destroyWeak(location);

  }
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return 0;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
  if (objc_msgSend(v3, "hasAdoptedModernInCallAPI"))
    v4 = !-[PHInCallRootViewController allowHomeOutDismissal](self, "allowHomeOutDismissal");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)prefersStatusBarHidden
{
  return -[PHInCallRootViewController shouldHideStatusBar](self, "shouldHideStatusBar");
}

- (void)routesChangedForRouteController:(id)a3
{
  id v4;

  -[PHInCallRootViewController updateDesiredSpringboardBehavior](self, "updateDesiredSpringboardBehavior", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController routeListController](self, "routeListController"));
  objc_msgSend(v4, "reload");

}

- (void)viewController:(id)a3 setStatusBarHidden:(BOOL)a4
{
  -[PHInCallRootViewController setStatusBarHidden:withDuration:](self, "setStatusBarHidden:withDuration:", a4, 0.3);
}

- (void)viewControllerDidRequestTemporaryPreventSuspension:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  objc_msgSend(v3, "acquireLongPreventSuspensionAssertion");

}

- (void)viewController:(id)a3 fullScreenFocusedParticipantOrientationChanged:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  NSString *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  NSRect v29;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController", a3));
  v7 = objc_msgSend(v6, "pipState");

  if (v7 == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pipContentViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    if (objc_msgSend(v8, "pipState") == (id)2
      && (v18 == CGSizeZero.height ? (v20 = v16 == CGSizeZero.width) : (v20 = 0),
          !v20 ? (v21 = v16 == v18) : (v21 = 0),
          v21))
    {
      v22 = sub_1000C5668();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        v29.origin.x = v12;
        v29.origin.y = v14;
        v29.size.width = v16;
        v29.size.height = v18;
        v24 = NSStringFromRect(v29);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        *(_DWORD *)buf = 138412290;
        v28 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Skipping orientation update to PIP since the PIP is square %@", buf, 0xCu);

      }
    }
    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000B4E70;
      v26[3] = &unk_100284898;
      v26[4] = self;
      objc_msgSend(v8, "rotatePIPDeviceOrientationTo:withCompletion:", objc_msgSend((id)objc_opt_class(self, v19), "uiDeviceOrientationForCNKDeviceOrientation:", a4), v26);
    }

  }
}

- (void)viewController:(id)a3 fullScreenFocusedParticipantAspectRatioChanged:(CGSize)a4 participantGridIsFullScreen:(BOOL)a5
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController", a3, a5, a4.width, a4.height));
  objc_msgSend(v5, "updatePIPSize");

  v6 = (id)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v6, "updatePIPFrame");

}

- (void)viewController:(id)a3 localParticipantAspectRatioChanged:(CGSize)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController", a3, a4.width, a4.height));
  objc_msgSend(v4, "updatePIPSize");

  v5 = (id)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v5, "updatePIPFrame");

}

- (void)viewController:(id)a3 pipSourceProviderNeedsUpdate:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  objc_msgSend(v5, "setSourceProvider:", v4);

}

- (void)participantsDidChangeLocation:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController", a3));
  objc_msgSend(v3, "updatePIPFrame");

}

- (void)updateBackgroundStartPipAuthorizationState
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  int v25;
  unsigned int v26;
  __int16 v27;
  _BYTE v28[10];
  _BYTE v29[6];
  id v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
  v4 = objc_msgSend(v3, "expanseEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    v6 = objc_msgSend(v5, "hasParticipantVideo");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v8 = objc_msgSend(v7, "callDisplayStyle");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 67109888;
      v26 = v6;
      v27 = 2048;
      *(_QWORD *)v28 = v8;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)v29 = objc_msgSend(v5, "isPipped");
      *(_WORD *)&v29[4] = 2048;
      v30 = objc_msgSend(v9, "pipState");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "hasParticipantVideo changed (hasParticipantVideo: %d, callDisplayStyle: %ld, isPipped: %d pipState: %lu)", (uint8_t *)&v25, 0x22u);
    }

    objc_msgSend(v9, "setHasParticipantVideoForActiveConversation:", v6);
    objc_msgSend(v9, "updateShouldPIPWhenEnteringBackground");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "frontmostAudioOrVideoCall"));

    if ((objc_msgSend(v13, "isConnected") & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      if ((objc_msgSend(v5, "isOneToOneModeEnabled") & 1) == 0)
      {
        v15 = v5 == 0;
        goto LABEL_19;
      }
      v14 = objc_msgSend(v13, "status") != 3;
    }
    v15 = v5 == 0;
    if (v5 && !v14)
    {
      if (v8 == (id)4)
        v16 = (int)v6;
      else
        v16 = 0;
      if (v16 == 1 && !objc_msgSend(v9, "pipState"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "call"));
        objc_msgSend(v18, "requestBackgroundPiPAuthorizationOfDismissedInCallSceneForCall:", v24);

      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
        objc_msgSend(v18, "revokeAndRemoveBackgroundPiPAuthorizationForSceneTypeIfNeeded:", 0);
      }

      if ((v6 & 1) == 0)
        objc_msgSend(v9, "cancelPIPIfNeeded");
LABEL_22:

      return;
    }
LABEL_19:
    v19 = sub_1000C5588();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v13, "isConnected");
      v22 = objc_msgSend(v13, "status");
      v23 = objc_msgSend(v5, "isOneToOneModeEnabled");
      v25 = 67109888;
      v26 = v21;
      v27 = 1024;
      *(_DWORD *)v28 = v22;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v23;
      *(_WORD *)v29 = 1024;
      *(_DWORD *)&v29[2] = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "skipping updating background start pip authorization; call is connected %d or call status %d or call isOneToOneM"
        "odeEnabled %d or multiway view controller is nil %d",
        (uint8_t *)&v25,
        0x1Au);
    }

    goto LABEL_22;
  }
}

- (void)viewController:(id)a3 mediaPipSafeAreaFrameChanged:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  double top;
  double left;
  double bottom;
  double right;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double MinX;
  double MaxY;
  double v41;
  double MaxX;
  id v43;
  NSObject *v44;
  NSString *v45;
  void *v46;
  double v47;
  CGFloat v48;
  double MinY;
  double v50;
  uint8_t buf[4];
  void *v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  UIEdgeInsets v62;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
  v12 = objc_msgSend(v11, "expanseEnabled");

  if (v12 && v10 == v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentInCallScene"));

    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    if (CGRectIsEmpty(v53))
    {
      top = UIEdgeInsetsZero.top;
      left = UIEdgeInsetsZero.left;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "coordinateSpace"));
      objc_msgSend(v20, "convertRect:toCoordinateSpace:", v21, x, y, width, height);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "coordinateSpace"));
      objc_msgSend(v30, "bounds");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;

      v54.origin.x = v23;
      v48 = v23;
      v54.origin.y = v25;
      v54.size.width = v27;
      v54.size.height = v29;
      MinY = CGRectGetMinY(v54);
      v55.origin.x = v32;
      v55.origin.y = v34;
      v55.size.width = v36;
      v55.size.height = v38;
      v50 = MinY - CGRectGetMinY(v55);
      v56.origin.x = v23;
      v56.origin.y = v25;
      v56.size.width = v27;
      v56.size.height = v29;
      MinX = CGRectGetMinX(v56);
      v57.origin.x = v32;
      v57.origin.y = v34;
      v57.size.width = v36;
      v57.size.height = v38;
      v47 = MinX - CGRectGetMinX(v57);
      v58.origin.x = v32;
      v58.origin.y = v34;
      v58.size.width = v36;
      v58.size.height = v38;
      MaxY = CGRectGetMaxY(v58);
      v59.origin.x = v48;
      v59.origin.y = v25;
      v59.size.width = v27;
      v59.size.height = v29;
      v41 = MaxY - CGRectGetMaxY(v59);
      v60.origin.x = v32;
      v60.size.width = v36;
      v60.origin.y = v34;
      left = v47;
      v60.size.height = v38;
      bottom = v41;
      MaxX = CGRectGetMaxX(v60);
      v61.origin.x = v48;
      v61.origin.y = v25;
      v61.size.width = v27;
      v61.size.height = v29;
      right = MaxX - CGRectGetMaxX(v61);
      top = v50;
    }
    v43 = sub_1000C5588();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v62.top = top;
      v62.left = left;
      v62.bottom = bottom;
      v62.right = right;
      v45 = NSStringFromUIEdgeInsets(v62);
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      *(_DWORD *)buf = 138412290;
      v52 = v46;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "mediaPipSafeAreaInsetsInScene changed to %@", buf, 0xCu);

    }
    objc_msgSend(v15, "setExpanseHUDDodgingInsets:", top, left, bottom, right);

  }
}

- (double)viewController:(id)a3 rubberBandConstrained:(double)a4 inRange:(double)a5
{
  id v7;
  void *v8;
  double v9;

  v7 = a3;
  BSUIConstrainValueWithRubberBand(a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewIfLoaded"));

  v9 = UIRoundToViewScale(v8);
  return v9;
}

- (id)audioRouteMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController routeListController](self, "routeListController"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioRoutingMenuController menuControllerWithCallStyle:dataSource:delegate:](PHAudioRoutingMenuController, "menuControllerWithCallStyle:dataSource:delegate:", 1, self, self));
    -[PHInCallRootViewController setRouteListController:](self, "setRouteListController:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController routeListController](self, "routeListController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "menu"));

  return v6;
}

- (id)audioRouteGlyphFor:(id)a3
{
  return objc_msgSend(a3, "audioRouteGlyphForDisplayStyle:", 4);
}

- (id)audioRouteGlyphFor:(id)a3 buttonStyle:(int64_t)a4
{
  uint64_t v5;

  if ((unint64_t)a4 > 6)
    v5 = 0;
  else
    v5 = qword_100240040[a4];
  return objc_msgSend(a3, "audioRouteGlyphForDisplayStyle:", v5);
}

- (UIImage)audioRouteGlyphForDevice
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHDevice currentDevice](PHDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "audioRouteGlyphImage"));

  return (UIImage *)v3;
}

- (id)callParticipantLabelsViewForViewController:(id)a3
{
  id v4;
  id v5;
  PHCallParticipantsView *v6;
  PHCallParticipantsView *callParticipantLabelsView;
  PHCallParticipantsView *v8;
  void *v9;
  PHCallParticipantsView *v10;
  PHCallParticipantsView *v11;
  id v12;
  NSObject *v13;
  PHCallParticipantsView *v14;
  int v16;
  id v17;
  __int16 v18;
  PHCallParticipantsView *v19;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));

  if (v5 == v4)
  {
    callParticipantLabelsView = self->_callParticipantLabelsView;
    if (!callParticipantLabelsView)
    {
      v8 = [PHCallParticipantsView alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      v10 = -[PHCallParticipantsView initWithCallDisplayStyleManager:](v8, "initWithCallDisplayStyleManager:", v9);
      v11 = self->_callParticipantLabelsView;
      self->_callParticipantLabelsView = v10;

      v12 = sub_1000C5588();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_callParticipantLabelsView;
        v16 = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "View controller %@ requested a call participant label view: %@", (uint8_t *)&v16, 0x16u);
      }

      -[PHCallParticipantsView setAutoresizingMask:](self->_callParticipantLabelsView, "setAutoresizingMask:", 37);
      -[PHCallParticipantsView setUserInteractionEnabled:](self->_callParticipantLabelsView, "setUserInteractionEnabled:", 1);
      -[PHCallParticipantsView setDelegate:](self->_callParticipantLabelsView, "setDelegate:", self);
      -[PHCallParticipantsView setPreservesSuperviewLayoutMargins:](self->_callParticipantLabelsView, "setPreservesSuperviewLayoutMargins:", 1);
      -[PHInCallRootViewController updateUPlusOneVideoCallViews](self, "updateUPlusOneVideoCallViews");
      callParticipantLabelsView = self->_callParticipantLabelsView;
    }
    v6 = callParticipantLabelsView;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateCallParticipantLabelsViewForViewController:(id)a3
{
  id v4;
  PHCallParticipantsView *callParticipantLabelsView;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  if (v4 == v6)
  {
    callParticipantLabelsView = self->_callParticipantLabelsView;

    if (callParticipantLabelsView)
      -[PHInCallRootViewController updateUPlusOneVideoCallViews](self, "updateUPlusOneVideoCallViews");
  }
  else
  {

  }
}

- (id)bottomControlsViewForViewController:(id)a3
{
  id v4;
  id v5;
  PHBottomBar *v6;
  PHBottomBar *bottomControlsView;
  PHBottomBar *v8;
  void *v9;
  PHBottomBar *v10;
  PHBottomBar *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));

  if (v5 == v4)
  {
    bottomControlsView = self->_bottomControlsView;
    if (!bottomControlsView)
    {
      v8 = [PHBottomBar alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      v10 = -[PHBottomBar initWithCallDisplayStyleManager:](v8, "initWithCallDisplayStyleManager:", v9);
      v11 = self->_bottomControlsView;
      self->_bottomControlsView = v10;

      -[PHBottomBar setDelegate:](self->_bottomControlsView, "setDelegate:", self);
      v12 = objc_alloc((Class)UIView);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v16, "bounds");
      v17 = objc_msgSend(v12, "initWithFrame:", 0.0, 0.0, v15);
      +[PHCallViewController _bottomBarBottomMarginForView:](PHCallViewController, "_bottomBarBottomMarginForView:", v17);
      -[PHBottomBar setBottomMargin:](self->_bottomControlsView, "setBottomMargin:");

      -[PHBottomBar setUsesLowerButtons:](self->_bottomControlsView, "setUsesLowerButtons:", 1);
      +[PHCallViewController _yOffsetForLoweredButtons](PHCallViewController, "_yOffsetForLoweredButtons");
      -[PHBottomBar setYOffsetForLoweredButtons:](self->_bottomControlsView, "setYOffsetForLoweredButtons:");
      -[PHInCallRootViewController updateUPlusOneVideoCallViews](self, "updateUPlusOneVideoCallViews");
      bottomControlsView = self->_bottomControlsView;
    }
    v6 = bottomControlsView;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)customOverrideOneToOneShutterButtonForViewController:(id)a3
{
  return 0;
}

+ (int64_t)uiDeviceOrientationForCNKDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return qword_100240078[a3];
}

+ (int64_t)cnkDeviceOrientationForUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return 1;
  else
    return qword_100240098[a3 - 2];
}

+ (int64_t)cnkSupportedDeviceOrientationsFromUIInterfaceOrientationMask:(unint64_t)a3
{
  int64_t v3;

  v3 = (~(_BYTE)a3 & 0x18) == 0;
  if ((a3 & 2) != 0)
    v3 = 0;
  if ((~(_BYTE)a3 & 0x1E) != 0)
    return v3;
  else
    return 2;
}

- (BOOL)isShownAboveCoverSheet
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
  v3 = objc_msgSend(v2, "isBeingShownAboveCoverSheet");

  return v3;
}

- (BOOL)wantsStandardControls
{
  return 1;
}

- (void)unansweredCallUIDismissed
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  objc_msgSend(v3, "setMostRecentlyDisconnectedVideoCall:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("PHMulitwayCallAssertionReason"), CFSTR("PHVideoMessageInProgressAssertionReason"), 0));
  +[PHInCallRootViewController releaseDismissalAssertionReasons:](PHInCallRootViewController, "releaseDismissalAssertionReasons:", v4);

}

- (id)routesForAudioRoutingMenuController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedRoutes"));

  return v5;
}

- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeController"));
  objc_msgSend(v6, "pickRoute:", v5);

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a4;
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating call controller because active remote participants changed for conversation %@", (uint8_t *)&v8, 0xCu);
  }

  -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
}

- (void)handleActivationContextDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "handleActivationContextDidChangeNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHInCallRootViewController handleSOSActivationIfNecessary](self, "handleSOSActivationIfNecessary");
  -[PHInCallRootViewController handleScreenTimeActivationIfNecessary](self, "handleScreenTimeActivationIfNecessary");

}

- (void)handleSOSActivationIfNecessary
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = objc_msgSend(v4, "shouldActivateSOS");

  if (v5)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting SOS UI", v8, 2u);
    }

    -[PHInCallRootViewController forceUpdateCallControllerForSOS](self, "forceUpdateCallControllerForSOS");
    -[PHInCallRootViewController dismissScreenTimeAlertHostIfNeeded](self, "dismissScreenTimeAlertHostIfNeeded");
  }
}

- (void)handleScreenTimeActivationIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
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
  int v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activationContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pendingRestrictedScreenTimeRequest"));

  if (v6)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activationContext"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pendingRestrictedScreenTimeRequest"));
      v19 = 138412290;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will request screen time alert for request %@", (uint8_t *)&v19, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activationContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pendingRestrictedScreenTimeRequest"));
    -[PHInCallRootViewController forceUpdateCallControllerForFilteredRequest:](self, "forceUpdateCallControllerForFilteredRequest:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
    objc_msgSend(v18, "setActivationContext:", 0);

  }
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  _BOOL8 v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  _BOOL4 v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unsigned __int8 v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _DWORD v58[2];
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;

  v7 = a4 == 4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callManager](self, "callManager"));
  objc_msgSend(v8, "setIsInBackground:", v7);

  if (a3 == 4 && a4 == 2)
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v58[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "In-call UI was just presented full-screen, updating shouldPIPWhenEnteringBackground", (uint8_t *)v58, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    objc_msgSend(v11, "updateShouldPIPWhenEnteringBackground");

  }
  if (a3 == 1 || a4 == 1)
  {
    -[PHInCallRootViewController updateVideoState](self, "updateVideoState");
    -[PHInCallRootViewController showHideMiniWindowViewIfNeededAnimated:](self, "showHideMiniWindowViewIfNeededAnimated:", a3 != 4);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
  if (objc_msgSend(v12, "conversationOneToOneModeEnabled"))
  {
    v13 = -[PHInCallRootViewController currentViewControllerIsMultiway](self, "currentViewControllerIsMultiway");
    if (a3 == 2)
    {
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
        v15 = objc_msgSend(v14, "shouldDisconnectOnDismissal");

        if (!v15)
          goto LABEL_15;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "call"));
        objc_msgSend(v12, "disconnectCall:withReason:", v17, 2);

      }
    }
  }

LABEL_15:
  v19 = a4 == 4 || a4 == 2;
  v20 = -[PHInCallRootViewController currentViewControllerIsMultiway](self, "currentViewControllerIsMultiway");
  if (!a3 && v19 && v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    objc_msgSend(v21, "setDidExpandIncomingCallBanner:", 1);

  }
  -[PHInCallRootViewController updateMultiwayViewControllerUIState](self, "updateMultiwayViewControllerUIState");
  -[PHInCallRootViewController updateCallDetailsViewIsOnScreen](self, "updateCallDetailsViewIsOnScreen");
  if (a4 == 4)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
    objc_msgSend(v22, "stopSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForFullscreenUIReason"));

    -[PHInCallRootViewController dismissSOSIfNeeded](self, "dismissSOSIfNeeded");
    -[PHInCallRootViewController dismissScreenTimeAlertHostIfNeeded](self, "dismissScreenTimeAlertHostIfNeeded");
    -[PHInCallRootViewController dismissViewControllersWithSensitiveInformation](self, "dismissViewControllersWithSensitiveInformation");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "delegate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bannerPresentationManager"));
    -[PHInCallRootViewController dissmissConfirmLeavePTTChannelAlertIfNeededWithBannerPresentationManager:](self, "dissmissConfirmLeavePTTChannelAlertIfNeededWithBannerPresentationManager:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "delegate"));
    if (objc_msgSend(v27, "didDeepLinkToPTTCallDetailsView"))
    {
      v28 = objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHPTTCallDetailsViewAssertionReason"));

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "delegate"));
        objc_msgSend(v30, "setDidDeepLinkToPTTCallDetailsView:", 0);

        +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHPTTCallDetailsViewAssertionReason"));
      }
    }
    else
    {

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "delegate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "allInCallScenes"));
    v35 = objc_msgSend(v34, "count");

    if (v35 == (id)1)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[PHIntervalTimer oneSecondTimer](PHIntervalTimer, "oneSecondTimer"));
      objc_msgSend(v36, "pause");

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "delegate"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "currentVideoCallUsingCallContainer:", v39));

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "callPassingTest:", &stru_100287450));

    if (!(v31 | v41))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
      v43 = objc_msgSend(v42, "isInVideoMessageFlow");

      if ((v43 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(self, v44), "releaseDismissalAssertionForReason:", CFSTR("PHMulitwayCallAssertionReason"));
        if (objc_msgSend((id)qword_1002DCB40, "containsObject:", CFSTR("PHCallEndedBlockAndReportInProgressAssertionReason")))
        {
          v45 = sub_1000C5588();
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v58[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Dismissing PHCallEndedBlockAndReportInProgressAssertionReason because display style is dismissed.", (uint8_t *)v58, 2u);
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
          objc_msgSend(v47, "setIsInCallEndedBlockAndReportFlow:", 0);

          objc_msgSend((id)objc_opt_class(self, v48), "releaseDismissalAssertionForReason:", CFSTR("PHCallEndedBlockAndReportInProgressAssertionReason"));
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "delegate"));
        objc_msgSend(v50, "setMostRecentlyDisconnectedVideoCall:", 0);

      }
    }

  }
  else
  {
    if (a3 != 4)
      goto LABEL_43;
    v31 = objc_claimAutoreleasedReturnValue(+[PHIntervalTimer oneSecondTimer](PHIntervalTimer, "oneSecondTimer"));
    objc_msgSend((id)v31, "resume");
  }

LABEL_43:
  v51 = sub_1000C5588();
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = -[PHInCallRootViewController isCurrentViewControllerAudio](self, "isCurrentViewControllerAudio");
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController parentViewController](self, "parentViewController"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController view](self, "view"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "window"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController childViewControllers](self, "childViewControllers"));
    v58[0] = 67109890;
    v58[1] = v53;
    v59 = 2112;
    v60 = v54;
    v61 = 2112;
    v62 = v56;
    v63 = 2112;
    v64 = v57;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController - isCurrentViewControllerAudio: %d, my parent: %@, window: %@, children: %@", (uint8_t *)v58, 0x26u);

  }
  -[PHInCallRootViewController updateBannerTapGestureRecognizerForCallDisplayStyle:](self, "updateBannerTapGestureRecognizerForCallDisplayStyle:", a4);
  -[PHInCallRootViewController notifyAudioCallControllerIfNecessaryCallDisplayStyleDidChangeFromStyle:toStyle:](self, "notifyAudioCallControllerIfNecessaryCallDisplayStyleDidChangeFromStyle:toStyle:", a3, a4);
}

- (BOOL)currentViewControllerIsMultiway
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentViewController"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
    if (v5 == v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController videoCallNavigationController](self, "videoCallNavigationController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topViewController"));
      if ((objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
        v7 = objc_msgSend(v10, "isInVideoMessageFlow");

      }
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

  return v7;
}

- (BOOL)isCurrentViewControllerAudio
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentViewController"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isShowing6UP
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[PHInCallRootViewController isCurrentViewControllerAudio](self, "isCurrentViewControllerAudio");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));
    v5 = objc_msgSend(v4, "isShowing6UP");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isMicIndicatorVisible
{
  if (-[PHInCallRootViewController isShowing6UP](self, "isShowing6UP"))
    return 1;
  else
    return -[PHInCallRootViewController isShowingHUD](self, "isShowingHUD");
}

- (void)updateCallDetailsViewIsOnScreen
{
  void *v2;
  void *v3;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));

  if (v5)
  {
    v6 = -[PHInCallRootViewController isPresentingCallDetailsView](self, "isPresentingCallDetailsView");
    if (v6)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sceneManager"));
      v7 = objc_msgSend(v3, "hasActiveOrPendingFullScreenCallScene");
    }
    else
    {
      v7 = 0;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDetailsNavigationController](self, "callDetailsNavigationController"));
    objc_msgSend(v8, "setIsOnScreen:", v7);

    if (v6)
    {

    }
  }
}

- (BOOL)isFullScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentInCallScene"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentInCallScene"));
    if (objc_msgSend(v8, "presentationMode") == (id)2)
    {
      v9 = 1;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentInCallScene"));
      if (objc_msgSend(v12, "presentationMode") == (id)3)
      {
        v9 = 1;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sceneManager"));
        if ((objc_msgSend(v15, "hasPendingCompletionForSceneType:presentationMode:", 0, 2) & 1) != 0)
        {
          v9 = 1;
        }
        else
        {
          v18 = v13;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
          v9 = objc_msgSend(v16, "callDisplayStyle") == (id)3;

          v13 = v18;
        }

      }
    }

    goto LABEL_15;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v6, "callDisplayStyle") != (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v9 = objc_msgSend(v7, "callDisplayStyle") == (id)3;
LABEL_15:

    goto LABEL_16;
  }
  v9 = 1;
LABEL_16:

  return v9;
}

- (void)updateMultiwayViewControllerUIState
{
  _BOOL8 v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  int v26;
  void *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  id v33;

  v3 = -[PHInCallRootViewController isFullScreen](self, "isFullScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  v5 = objc_msgSend(v4, "isPIPProxyActive");

  if (v3 || v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    if ((objc_msgSend(v7, "isPIPProxyInterrupted") & 1) != 0)
      v6 = 0;
    else
      v6 = !-[PHInCallRootViewController isDisplayStyleMiniWindow](self, "isDisplayStyleMiniWindow");

  }
  else
  {
    v6 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v9 = objc_msgSend(v8, "callDisplayStyle");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
  if (v10)
  {
    if (v6)
      v11 = -[PHInCallRootViewController currentViewControllerIsMultiway](self, "currentViewControllerIsMultiway");
    else
      v11 = 0;
    v12 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      v26 = 138413058;
      v27 = v14;
      v28 = 1024;
      v29 = v11;
      v30 = 1024;
      v31 = v5;
      v32 = 2048;
      v33 = objc_msgSend(v15, "callDisplayStyle");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating %@ isMultiwayVisibleOnScreen=%d isPipped=%d callDisplayStyle=%ld", (uint8_t *)&v26, 0x22u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v17 = objc_msgSend(v16, "pipState");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    objc_msgSend(v18, "setPipState:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    objc_msgSend(v19, "setIsOnScreen:", v11);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    objc_msgSend(v20, "setIsDisplayedInBanner:", v9 == 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    objc_msgSend(v21, "setIsFullScreen:", v3);

    -[PHInCallRootViewController refreshBottomBarButtonLayout](self, "refreshBottomBarButtonLayout");
    -[PHInCallRootViewController setNeedsStatusBarPillSuppressionUpdate](self, "setNeedsStatusBarPillSuppressionUpdate");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallOrientationMonitor sharedInstance](PHInCallOrientationMonitor, "sharedInstance"));
    v23 = v22;
    if ((v5 & 1) != 0)
      v24 = objc_msgSend(v22, "currentOrientation");
    else
      v24 = objc_msgSend(v22, "lastValidOrientation");
    v25 = v24;

    -[PHInCallRootViewController updateMultiwayDeviceOrientation:](self, "updateMultiwayDeviceOrientation:", v25);
  }
}

- (void)updateVideoState
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_videoCallNavigationController, "topViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___CNKMultiwayViewControllerProtocol);
  if (!v3 || (v4 & 1) != 0)
  {
    if (-[PHInCallRootViewController isDisplayStyleMiniWindow](self, "isDisplayStyleMiniWindow"))
      objc_msgSend(v3, "muteVideo");
    else
      objc_msgSend(v3, "updateVideoState");
  }
  else
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_1001AA350((uint64_t)v3, self, v6);

  }
}

- (void)notifyAudioCallControllerIfNecessaryCallDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DWORD v19[2];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallNavigationController](self, "audioCallNavigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));
    v11 = v10 == 0;

  }
  else
  {
    v11 = 0;
  }

  v12 = sub_1000C5588();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController - audioCallControllerExistsOutsideHierarchy: %d", (uint8_t *)v19, 8u);
  }

  if (a3)
    v14 = 0;
  else
    v14 = v11;
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));
    +[ICSCallDisplayStyleManager notifyAllRespondersForViewController:callDisplayStyleDidChangeFromStyle:toStyle:](ICSCallDisplayStyleManager, "notifyAllRespondersForViewController:callDisplayStyleDidChangeFromStyle:toStyle:", v15, 0, a4);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
    LODWORD(v15) = objc_msgSend(v16, "audioCallUIModernizationEnabled");

    if ((_DWORD)v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerWrapper](self, "audioCallViewControllerWrapper"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewController"));
      +[ICSCallDisplayStyleManager notifyAllRespondersForViewController:callDisplayStyleDidChangeFromStyle:toStyle:](ICSCallDisplayStyleManager, "notifyAllRespondersForViewController:callDisplayStyleDidChangeFromStyle:toStyle:", v18, 0, a4);

    }
  }
}

- (void)updateBannerTapGestureRecognizerForCallDisplayStyle:(int64_t)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3 == 0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bannerTapGestureRecognizer](self, "bannerTapGestureRecognizer"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)bannerTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Transitioning scene to full screen due to tap", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B7168;
    v7[3] = &unk_100284898;
    v7[4] = self;
    TUDispatchMainIfNecessary(v7);
  }
}

- (void)updateUPlusOneVideoCallViews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t v26[16];

  v3 = -[PHInCallRootViewController inCallState](self, "inCallState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentVideoCallUsingCallContainer:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeConversationForCall:", v7));

  if ((v3 & 0xFFFE) == 4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentInCallScene"));
    if (objc_msgSend(v12, "presentationMode") == (id)1)
    {
      v13 = objc_msgSend(v9, "resolvedAudioVideoMode");

      if (v13 == (id)2)
      {
        v14 = sub_1000C5588();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Transitioning to fullscreen since we're transitioning to show an active video call", v26, 2u);
        }

        -[PHInCallRootViewController requestInCallSceneTransitionToFullScreen](self, "requestInCallSceneTransitionToFullScreen");
      }
    }
    else
    {

    }
  }
  else if (!(_DWORD)v3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDurationTimerForParticipantsView](self, "callDurationTimerForParticipantsView"));
    objc_msgSend(v16, "invalidate");

    -[PHInCallRootViewController setCallDurationTimerForParticipantsView:](self, "setCallDurationTimerForParticipantsView:", 0);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController traitCollection](self, "traitCollection"));
  v18 = objc_msgSend(v17, "_backlightLuminance") != (id)1;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController updateContactInformationForParticipantViewWithInCallState:](self, "updateContactInformationForParticipantViewWithInCallState:", v3));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController updateSecondaryStringForParticipantViewWithInCallState:allowsDuration:](self, "updateSecondaryStringForParticipantViewWithInCallState:allowsDuration:", v3, v18));
  if (!v19)
  {
LABEL_15:
    if (!v20)
      goto LABEL_20;
    goto LABEL_16;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "link"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "displayName"));

  if (!v22 || !v20)
  {
    -[PHInCallRootViewController setContactNameForParticipantsView:](self, "setContactNameForParticipantsView:", v19);
    goto LABEL_15;
  }
  -[PHInCallRootViewController setSecondaryStringForParticipantsView:](self, "setSecondaryStringForParticipantsView:", v20);
LABEL_16:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "link"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "displayName"));

  if (v19 && v24)
    -[PHInCallRootViewController setContactNameForParticipantsView:](self, "setContactNameForParticipantsView:", v19);
  else
    -[PHInCallRootViewController setSecondaryStringForParticipantsView:](self, "setSecondaryStringForParticipantsView:", v20);
LABEL_20:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callParticipantLabelsView](self, "callParticipantLabelsView"));
  objc_msgSend(v25, "updateParticipants");

  -[PHInCallRootViewController updateBottomControlsViewWithInCallState:](self, "updateBottomControlsViewWithInCallState:", v3);
}

- (unsigned)inCallState
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  unsigned int v15;
  unsigned __int16 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  const char *v29;
  id v30;
  NSObject *v31;
  const char *v32;
  id v33;
  id v34;
  id v36;
  id v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  unsigned int v49;
  id v50;
  _BOOL4 v51;
  id v52;
  int v53;
  _QWORD v54[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v4 = objc_msgSend(v3, "currentCallCount");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v6 = objc_msgSend(v5, "currentVideoCallCount");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentVideoCalls"));

  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v53 = 138412290;
    v54[0] = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState for non final chats %@", (uint8_t *)&v53, 0xCu);
  }

  if (v6)
  {
    if (!v4 && v6 == (id)1)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
      if (-[NSObject status](v11, "status") == 4
        || -[NSObject wantsHoldMusic](v11, "wantsHoldMusic"))
      {
        v12 = sub_1000C5588();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = -[NSObject status](v11, "status") == 4;
          v15 = -[NSObject wantsHoldMusic](v11, "wantsHoldMusic");
          v53 = 67109376;
          LODWORD(v54[0]) = v14;
          WORD2(v54[0]) = 1024;
          *(_DWORD *)((char *)v54 + 6) = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusRinging (%d) or call wants hold music (%d), setting state to PHInCallStateIncomingRinging", (uint8_t *)&v53, 0xEu);
        }
        v16 = 1;
        goto LABEL_38;
      }
      if (-[NSObject status](v11, "status") == 3)
      {
        v28 = sub_1000C5588();
        v13 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v53) = 0;
          v29 = "UpdateCurrentState: Call status is TUCallStatusSending, setting state to PHInCallStateOutgoingRinging";
LABEL_44:
          v16 = 2;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v53, 2u);
          goto LABEL_38;
        }
        goto LABEL_50;
      }
      if (-[NSObject status](v11, "status") == 1
        && -[NSObject isEndpointOnCurrentDevice](v11, "isEndpointOnCurrentDevice"))
      {
        v37 = sub_1000C5588();
        v13 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v38 = -[NSObject isHostedOnCurrentDevice](v11, "isHostedOnCurrentDevice");
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "routeController"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pickedRoute"));
          v42 = objc_msgSend(v41, "deviceType");
          v53 = 67109376;
          LODWORD(v54[0]) = v38;
          WORD2(v54[0]) = 2048;
          *(_QWORD *)((char *)v54 + 6) = v42;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusActive, setting state to PHInCallStateSingleCallActive (hosted: %d, endpoint: 1, pickedRouteDeviceType: %ld)", (uint8_t *)&v53, 0x12u);

        }
        v16 = 4;
        goto LABEL_38;
      }
      if (-[NSObject status](v11, "status") == 1)
      {
        v43 = sub_1000C5588();
        v13 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v44 = -[NSObject isHostedOnCurrentDevice](v11, "isHostedOnCurrentDevice");
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "routeController"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "pickedRoute"));
          v48 = objc_msgSend(v47, "deviceType");
          v53 = 67109376;
          LODWORD(v54[0]) = v44;
          WORD2(v54[0]) = 2048;
          *(_QWORD *)((char *)v54 + 6) = v48;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusActive, setting state to PHInCallStateIdle (hosted: %d, endpoint: 0, pickedRouteDeviceType: %ld)", (uint8_t *)&v53, 0x12u);

        }
        v16 = 0;
        goto LABEL_38;
      }
      if (-[NSObject status](v11, "status") != 5)
      {
        v16 = 0;
        goto LABEL_39;
      }
      v52 = sub_1000C5588();
      v13 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v53) = 0;
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v22 = objc_msgSend(v21, "currentAudioAndVideoCallCount");

    if ((unint64_t)v22 >= 2)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "delegate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentVideoCallUsingCallContainer:", v25));

      if (-[NSObject status](v11, "status") != 4
        && !-[NSObject wantsHoldMusic](v11, "wantsHoldMusic"))
      {
        if (-[NSObject status](v11, "status") == 3)
        {
          v36 = sub_1000C5588();
          v13 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v53) = 0;
            v29 = "UpdateCurrentState: Current chat status is TUCallStatusSending, setting state to PHInCallStateOutgoingRinging";
            goto LABEL_44;
          }
LABEL_50:
          v16 = 2;
          goto LABEL_38;
        }
        v49 = -[NSObject status](v11, "status");
        v50 = sub_1000C5588();
        v13 = objc_claimAutoreleasedReturnValue(v50);
        v51 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v49 != 5)
        {
          if (v51)
          {
            LOWORD(v53) = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Multiple chats, setting state to PHInCallStateMultipleCallsActive", (uint8_t *)&v53, 2u);
          }
          v16 = 5;
          goto LABEL_38;
        }
        if (v51)
        {
          LOWORD(v53) = 0;
LABEL_61:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusDisconnecting, setting state to PHInCallStateEnding", (uint8_t *)&v53, 2u);
        }
LABEL_62:
        v16 = 6;
        goto LABEL_38;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "displayedCalls"));

      if (-[NSObject count](v13, "count"))
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v13, "firstObject"));
      else
        v27 = 0;
      if (-[NSObject wantsHoldMusic](v11, "wantsHoldMusic"))
      {
        v30 = sub_1000C5588();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v53) = 0;
          v32 = "UpdateCurrentState: Current video call wants hold music, setting state to PHInCallStateIncomingRinging";
LABEL_28:
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v53, 2u);
        }
      }
      else
      {
        if (v4 != (id)1 || !-[NSObject isVideoUpgradeFromCall:](v11, "isVideoUpgradeFromCall:", v27))
        {
          v34 = sub_1000C5588();
          v31 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v53) = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Incoming chat and active chat, setting state to PHInCallStateCallWaiting", (uint8_t *)&v53, 2u);
          }
          v16 = 3;
          goto LABEL_37;
        }
        v33 = sub_1000C5588();
        v31 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v53) = 0;
          v32 = "UpdateCurrentState: Incoming chat that is an upgrade, setting state to PHInCallStateIncomingRinging";
          goto LABEL_28;
        }
      }
      v16 = 1;
LABEL_37:

LABEL_38:
LABEL_39:

      goto LABEL_40;
    }
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mostRecentlyDisconnectedVideoCall"));

    if (v19)
    {
      v20 = sub_1000C5588();
      v11 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v53) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call has been disconnected, setting state to PHInCallStateEnded", (uint8_t *)&v53, 2u);
      }
      v16 = 7;
      goto LABEL_39;
    }
  }
  v16 = 0;
LABEL_40:

  return v16;
}

- (id)updateContactInformationForParticipantViewWithInCallState:(unsigned __int16)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  v7 = v6;
  if (v3 == 7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostRecentlyDisconnectedVideoCall"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentVideoCallUsingCallContainer:", v9));

  }
  if (v8)
  {
    v10 = objc_msgSend(objc_alloc((Class)TUContactsDataProviderFetchRequest), "initWithCall:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactIdentifier"));
    objc_msgSend(v10, "setContactIdentifier:", v11);

    v35 = objc_claimAutoreleasedReturnValue(+[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1));
    v36[0] = v35;
    v36[1] = CNContactImageDataAvailableKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
    objc_msgSend(v10, "setAuxiliaryKeysToFetch:", v12);

    v34 = objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v8));
    v13 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v34);
    v14 = objc_msgSend(objc_alloc((Class)TUContactsDataProvider), "initWithContactsDataSource:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "executeFetchRequest:", v10));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "siriDisplayName"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
      v19 = objc_msgSend(v18, "shouldHideContact");

    }
    else
    {
      v19 = 0;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contacts"));
    v22 = objc_msgSend(v21, "count");

    if (v22 == (id)1 && (v19 & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contacts"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));

      -[PHInCallRootViewController setContactForParticipantsView:](self, "setContactForParticipantsView:", v24);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "activeConversationForCall:", v8));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "link"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "displayName"));

    -[PHInCallRootViewController setCallForParticipantsView:](self, "setCallForParticipantsView:", v8);
    if (objc_msgSend(v8, "isConversation") && v26)
    {
      v30 = (void *)v34;
      v29 = (void *)v35;
      if (v28)
        v31 = v28;
      else
        v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "displayName"));
      v20 = v31;
    }
    else
    {
      if (v19)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "siriDisplayName"));

      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedName"));
      }
      v30 = (void *)v34;
      v29 = (void *)v35;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)updateSecondaryStringForParticipantViewWithInCallState:(unsigned __int16)a3 allowsDuration:(BOOL)a4
{
  int v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  unsigned __int8 v38;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentVideoCallUsingCallContainer:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeConversationForCall:", v10));

  switch(v5)
  {
    case 0:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
      v14 = v13;
      v15 = CFSTR("STATUS_ENDED");
      goto LABEL_43;
    case 1:
      if (!objc_msgSend(v10, "wantsHoldMusic"))
        goto LABEL_7;
      if (a4)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@_HOLD_MUSIC"), &stru_10028DC20, CFSTR("CallStatus")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "callDurationString"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18));

      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("HOLD_MUSIC"), &stru_10028DC20, CFSTR("CallStatus")));
      }

      if (objc_msgSend(v10, "isConnected"))
      {
        v35 = v14;
        goto LABEL_44;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("STATUS_CONNECTING"), &stru_10028DC20, CFSTR("CallStatus")));

      goto LABEL_45;
    case 2:
      if (objc_msgSend(v10, "isConversation"))
        v20 = v12 == 0;
      else
        v20 = 1;
      if (v20)
        goto LABEL_39;
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "link"));
      if (!v21)
        goto LABEL_39;
      v22 = (void *)v21;
      if (objc_msgSend(v12, "letMeInRequestState") == (id)1)
      {

      }
      else
      {
        v37 = objc_msgSend(v12, "letMeInRequestState");

        if (v37 != (id)2)
        {
LABEL_39:
          v38 = objc_msgSend(v10, "isConnecting");
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
          if ((v38 & 1) != 0)
            v15 = CFSTR("STATUS_CONNECTING");
          else
            v15 = CFSTR("STATUS_WAITING");
          goto LABEL_42;
        }
      }
      if (objc_msgSend(v12, "letMeInRequestState") == (id)2)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
        v14 = v13;
        v15 = CFSTR("FACETIME_VIDEO_WAITING_FOR_LET_IN");
        goto LABEL_43;
      }
LABEL_38:
      v24 = 0;
      goto LABEL_46;
    case 3:
LABEL_7:
      if (v12)
        v19 = objc_msgSend(v12, "resolvedAudioVideoMode") == (id)1;
      else
        v19 = 0;
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "link"));
      if (v30)
      {
        v31 = (void *)v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "link"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "displayName"));

        if (v33)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
          goto LABEL_46;
        }
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
      if (v19)
        v15 = CFSTR("FACETIME_AUDIO_INCOMING");
      else
        v15 = CFSTR("FACETIME_VIDEO_INCOMING");
LABEL_42:
      v13 = v14;
LABEL_43:
      v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_10028DC20, CFSTR("CallStatus")));
LABEL_44:
      v24 = v35;
      goto LABEL_45;
    case 4:
    case 5:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
      v14 = v13;
      v15 = CFSTR("STATUS_CONNECTING");
      goto LABEL_43;
    case 6:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
      v14 = v13;
      v15 = CFSTR("STATUS_ENDING");
      goto LABEL_43;
    case 7:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("STATUS_ENDED"), &stru_10028DC20, CFSTR("CallStatus")));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "delegate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mostRecentlyDisconnectedVideoCall"));

      if (objc_msgSend(v14, "disconnectedReason") == 14)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
        v28 = v27;
        v29 = CFSTR("STATUS_FAILED");
LABEL_29:
        v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", v29, &stru_10028DC20, CFSTR("CallStatus")));

        v24 = (void *)v34;
        goto LABEL_45;
      }
      if (objc_msgSend(v14, "disconnectedReason") == 15
        || objc_msgSend(v14, "disconnectedReason") == 5)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
        v28 = v27;
        v29 = CFSTR("STATUS_UNAVAILABLE");
        goto LABEL_29;
      }
LABEL_45:

LABEL_46:
      return v24;
    default:
      goto LABEL_38;
  }
}

- (void)updateBottomControlsViewWithInCallState:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  dispatch_time_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
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
  PHDeclineWithMessageController *v51;
  void *v52;
  void *v53;
  PHDeclineWithMessageController *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  unsigned int v61;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v64;
  __int16 v65;
  unsigned int v66;

  if (a3 != 7)
  {
    if (a3 != 3)
    {
      if (a3 != 1)
        goto LABEL_38;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "incomingVideoCallUsingCallContainer:", v6));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
      v9 = objc_msgSend(v8, "currentState");

      if (v9 == (id)9
        || +[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive"))
      {
        v61 = 0;
        v10 = 0;
      }
      else
      {
        v10 = objc_msgSend(v7, "isMessagingAllowed");
        v61 = objc_msgSend(v7, "isReminderAllowed");
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "activeConversationForCall:", v7));

      if (v19 && objc_msgSend(v19, "resolvedAudioVideoMode") == (id)1)
      {
        if (objc_msgSend(v19, "isOneToOneModeEnabled"))
          v34 = 2;
        else
          v34 = 3;
      }
      else
      {
        v34 = 1;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "delegate"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "currentInCallScene"));
      if (objc_msgSend(v38, "isBeingShownAboveCoverSheet"))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        if (objc_msgSend(v39, "currentCallCount"))
          v40 = v34;
        else
          v40 = 6;
        objc_msgSend(v35, "setCurrentState:", v40);

      }
      else
      {
        objc_msgSend(v35, "setCurrentState:", v34);
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
      objc_msgSend(v41, "setDeclineAndMessageIsAvailable:", v10);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
      objc_msgSend(v42, "setDeclineAndRemindIsAvailable:", v61);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
      objc_msgSend(v43, "setUsesLowerButtons:", 0);

      goto LABEL_36;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "delegate"));
    v23 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "incomingVideoCallUsingCallContainer:", v23));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "delegate"));
    LOBYTE(v23) = objc_msgSend(v25, "isPresentingAmbient");

    if ((v23 & 1) == 0)
      -[PHInCallRootViewController requestInCallSceneTransitionToFullScreen](self, "requestInCallSceneTransitionToFullScreen");
    v26 = objc_msgSend(v7, "isMessagingAllowed");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    objc_msgSend(v27, "setDeclineAndMessageIsAvailable:", v26);

    v28 = objc_msgSend(v7, "isReminderAllowed");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    objc_msgSend(v29, "setDeclineAndRemindIsAvailable:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    objc_msgSend(v30, "setUserInteractionEnabled:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    v19 = v18;
    v20 = 9;
LABEL_14:
    objc_msgSend(v18, "setCurrentState:animated:animationCompletionBlock:", v20, 1, 0);
LABEL_36:

    goto LABEL_37;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mostRecentlyDisconnectedVideoCall"));

  v13 = sub_1000C5588();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v64 = -[PHInCallRootViewController shouldShowVideoCallBlockAndReportScreen](self, "shouldShowVideoCallBlockAndReportScreen");
    v65 = 1024;
    v66 = objc_msgSend(v7, "disconnectedReason");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[self shouldShowVideoCallBlockAndReportScreen]: %d, disconnectedCall.disconnectedReason: %d", buf, 0xEu);
  }

  if (-[PHInCallRootViewController shouldShowVideoCallBlockAndReportScreen](self, "shouldShowVideoCallBlockAndReportScreen"))
  {
    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHCallEndedBlockAndReportInProgressAssertionReason"));
    -[PHInCallRootViewController requestInCallSceneTransitionToFullScreen](self, "requestInCallSceneTransitionToFullScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    objc_msgSend(v15, "setIsInCallEndedBlockAndReportFlow:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    objc_msgSend(v16, "setUserInteractionEnabled:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    objc_msgSend(v17, "setUsesLowerButtons:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    v19 = v18;
    v20 = 26;
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "disconnectedReason") == 14
    || objc_msgSend(v7, "disconnectedReason") == 5
    || objc_msgSend(v7, "disconnectedReason") == 15)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v31, "callDisplayStyle") == (id)4
      || +[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked"))
    {

    }
    else
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handle"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "value"));
      v58 = objc_msgSend(v57, "length");

      if (v58)
      {
        if ((objc_msgSend(v7, "isMessagingAllowed") & 1) != 0)
        {
          v59 = 17;
        }
        else if (objc_msgSend(v7, "isCallbackAllowed"))
        {
          v59 = 13;
        }
        else
        {
          v59 = 18;
        }
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
        objc_msgSend(v60, "setCurrentState:animated:animationCompletionBlock:", v59, 1, 0);

        goto LABEL_37;
      }
    }
  }
  v32 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8B00;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_after(v32, (dispatch_queue_t)&_dispatch_main_q, block);
  -[PHInCallRootViewController showFailureAlertIfNecessaryForCall:](self, "showFailureAlertIfNecessaryForCall:", v7);
LABEL_37:

LABEL_38:
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "incomingVideoCall"));

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "controlForActionType:", 12));

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "controlForActionType:", 9));

    if (!v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "controlForActionType:", 11));

    }
    if (v47)
      +[PHDeclineWithReminderController configureButton:forIncomingCall:presenter:](PHDeclineWithReminderController, "configureButton:forIncomingCall:presenter:", v47, v45, self);
    if (v49)
    {
      v51 = [PHDeclineWithMessageController alloc];
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController declineCallService](self, "declineCallService"));
      v54 = -[PHDeclineWithMessageController initWithIncomingCall:customMessagePresentingViewController:declineCallService:](v51, "initWithIncomingCall:customMessagePresentingViewController:declineCallService:", v45, v52, v53);
      -[PHInCallRootViewController setDeclineWithMessageController:](self, "setDeclineWithMessageController:", v54);

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController declineWithMessageController](self, "declineWithMessageController"));
      objc_msgSend(v55, "configureDeclineMessageForButton:", v49);

    }
  }
  -[PHInCallRootViewController refreshBottomBarButtonLayout](self, "refreshBottomBarButtonLayout");

}

- (void)sceneDidConnect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentInCallScene"));

  if (v5)
  {
    -[PHInCallRootViewController updateUPlusOneVideoCallViews](self, "updateUPlusOneVideoCallViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController audioCallViewControllerIfLoaded](self, "audioCallViewControllerIfLoaded"));
    objc_msgSend(v6, "updateIncomingBottomBarControlState");

    -[PHInCallRootViewController updateBackgroundStartPipAuthorizationState](self, "updateBackgroundStartPipAuthorizationState");
    -[PHInCallRootViewController updateInCallWindowScenePrefersHiddenWhenDismissed](self, "updateInCallWindowScenePrefersHiddenWhenDismissed");
  }
}

- (void)wantsHoldMusicChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "wantsHoldMusicChangedNotification", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentVideoCallUsingCallContainer:", v8));
  v10 = objc_msgSend(v9, "wantsHoldMusic");

  if (v10)
  {
    v11 = sub_1000C5588();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "decline with reminder and decline with message unavailable due to call wanting hold music.", v17, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    objc_msgSend(v13, "setDeclineAndMessageIsAvailable:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    objc_msgSend(v14, "setDeclineAndRemindIsAvailable:", 0);

    -[PHInCallRootViewController updateUPlusOneVideoCallViews](self, "updateUPlusOneVideoCallViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "updateUPlusOneVideoCallViews", 0, 1, 1.0));
    -[PHInCallRootViewController setCallDurationTimerForParticipantsView:](self, "setCallDurationTimerForParticipantsView:", v15);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDurationTimerForParticipantsView](self, "callDurationTimerForParticipantsView"));
    objc_msgSend(v16, "invalidate");

    -[PHInCallRootViewController setCallDurationTimerForParticipantsView:](self, "setCallDurationTimerForParticipantsView:", 0);
    -[PHInCallRootViewController transitionFromBannerToDismissedIfNecessary](self, "transitionFromBannerToDismissedIfNecessary");
  }
}

- (void)refreshBottomBarButtonLayout
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
  objc_msgSend(v3, "setUsesLowerButtons:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
  objc_msgSend(v4, "setUsesLowerButtons:", 0);

}

- (id)contactForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return -[PHInCallRootViewController contactForParticipantsView](self, "contactForParticipantsView", a3, a4);
}

- (id)nameForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return -[PHInCallRootViewController contactNameForParticipantsView](self, "contactNameForParticipantsView", a3, a4);
}

- (id)callForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return -[PHInCallRootViewController callForParticipantsView](self, "callForParticipantsView", a3, a4);
}

- (id)labelForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4 allowsDuration:(BOOL)a5
{
  void *v6;
  CNKCallParticipantLabelDescriptorFactory *labelDescriptorFactory;
  void *v8;
  void *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController updateSecondaryStringForParticipantViewWithInCallState:allowsDuration:](self, "updateSecondaryStringForParticipantViewWithInCallState:allowsDuration:", -[PHInCallRootViewController inCallState](self, "inCallState", a3, a4), a5));
  -[PHInCallRootViewController setSecondaryStringForParticipantsView:](self, "setSecondaryStringForParticipantsView:", v6);

  labelDescriptorFactory = self->_labelDescriptorFactory;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController secondaryStringForParticipantsView](self, "secondaryStringForParticipantsView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CNKCallParticipantLabelDescriptorFactory makeLabelWithString:](labelDescriptorFactory, "makeLabelWithString:", v8));

  return v9;
}

- (id)supplementalParticipantLabelFormatStringAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return 0;
}

- (unsigned)activityStateForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return 3;
}

- (unint64_t)numberOfParticipantsForParticipantsView:(id)a3
{
  return 1;
}

- (BOOL)shouldShowInfoButtonForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return 0;
}

- (BOOL)shouldShowParticipantImageAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  return 1;
}

- (BOOL)shouldShowCallDetailsViewButton
{
  return 0;
}

- (BOOL)shouldShowSingleDurationLabelInParticipantsView:(id)a3
{
  return 0;
}

- (id)overrideStringForParticipantsView:(id)a3
{
  return 0;
}

- (BOOL)shouldShowLargeAvatar
{
  return 0;
}

- (BOOL)shouldShowParticipantLabel
{
  return 1;
}

- (id)localizedSenderIdentityForParticipantAtIndex:(unint64_t)a3 inParticipantsView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentVideoCallUsingCallContainer:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "provider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "prioritizedSenderIdentities"));
    v11 = objc_msgSend(v10, "count");

    if ((unint64_t)v11 < 2)
    {
      v13 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localSenderIdentity"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedShortName"));

    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)participantsView:(id)a3 didPerformActionType:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  void *v14;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callParticipantLabelsView](self, "callParticipantLabelsView"));

  if (v7 == v6)
  {
    -[PHInCallRootViewController performBottomBarActionType:](self, "performBottomBarActionType:", a4);
  }
  else
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callParticipantLabelsView](self, "callParticipantLabelsView"));
      v11 = 134218242;
      v12 = a4;
      v13 = 2112;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot perform bottom bar action %ld from unknown call participants view object %@", (uint8_t *)&v11, 0x16u);

    }
  }
}

- (id)linkNameForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "isConversation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeConversationForCall:", v4));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "link"));
    if (v7)
    {
      v8 = v7;
      if (objc_msgSend(v7, "isLocallyCreated")
        && (objc_msgSend(v6, "letMeInRequestState") == (id)1 || objc_msgSend(v6, "letMeInRequestState") == (id)2)
        && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "linkName")),
            v10 = objc_msgSend(v9, "length"),
            v9,
            !v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FACETIME_LINK"), &stru_10028DC20, CFSTR("InCallService")));

      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isCallRinging
{
  return 0;
}

- (int64_t)bottomBarCallStateInBar:(id)a3
{
  return 2;
}

- (void)bottomBarActionPerformed:(int64_t)a3 withCompletionState:(int64_t)a4 fromBar:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  id v14;

  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));

  if (v8 == v7)
  {
    -[PHInCallRootViewController performBottomBarActionType:](self, "performBottomBarActionType:", a3);
  }
  else
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218242;
      v12 = a3;
      v13 = 2112;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot perform bottom bar action %ld from unknown bottom bar %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (void)performBottomBarActionType:(int64_t)a3
{
  id v5;
  NSObject *v6;
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
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  NSObject *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v97;
  _BOOL4 v98;
  void *v99;
  void *v100;
  void *v101;
  _QWORD v102[5];
  _QWORD v103[5];
  _QWORD v104[4];
  id v105;
  id v106;
  uint8_t buf[4];
  _BYTE v108[24];
  __int16 v109;
  void *v110;
  __int16 v111;
  void *v112;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController bottomControlsView](self, "bottomControlsView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameForActionType:", a3));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v108 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BottomBarActionPerformed: %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentVideoCallUsingCallContainer:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "incomingVideoCallUsingCallContainer:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeConversationForCall:", v16));

  switch(a3)
  {
    case 1:
    case 3:
      v101 = v12;
      v29 = objc_msgSend(v18, "resolvedAudioVideoMode");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "delegate"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "currentInCallScene"));
      v33 = objc_msgSend(v32, "presentationMode");

      if (v33 == (id)1 && v29 == (id)2)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "delegate"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "currentInCallScene"));
        objc_msgSend(v36, "requestTransitionToPresentationMode:isUserInitiated:analyticsSource:", 2, 0, CFSTR("SBSUIInCallTransitionAnalyticsSourceAnswerFaceTimeButtonPress"));

        v12 = v101;
      }
      else
      {
        v12 = v101;
        if (!objc_msgSend(v101, "wantsHoldMusic"))
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "activeConversationForCall:", v101));

          if (!objc_msgSend(v101, "isConversation")
            || objc_msgSend(v101, "status") != 4
            || (objc_msgSend(v101, "isSendingVideo") & 1) != 0
            || (objc_msgSend(v22, "isOneToOneModeEnabled") & 1) != 0)
          {
            v85 = sub_1000C5588();
            v86 = objc_claimAutoreleasedReturnValue(v85);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              v98 = v29 == (id)2;
              v100 = v22;
              v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "resolvedAudioVideoMode")));
              v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeRemoteParticipants"));
              v99 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "delegate"));
              v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "currentInCallScene"));
              v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "presentationMode")));
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)v108 = v98;
              *(_WORD *)&v108[4] = 2112;
              *(_QWORD *)&v108[6] = v97;
              *(_WORD *)&v108[14] = 2112;
              *(_QWORD *)&v108[16] = v96;
              v109 = 2112;
              v110 = v89;
              v111 = 2112;
              v112 = v16;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Answering FaceTime Video call. hasPartWithVideoEnabled: %d, resolvedAudioVideoMode: %@, participants: %@, banner: %@, incomingCall: %@", buf, 0x30u);

              v22 = v100;
              v12 = v101;

            }
            v43 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
            objc_msgSend(v43, "answerCall:", v16);
            goto LABEL_70;
          }
          v94 = sub_1000C5588();
          v95 = objc_claimAutoreleasedReturnValue(v94);
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Answering a ringing conversation while video is disabled, updating answer behavior to downgrade to audio so we join conversation with video disabled as well.", buf, 2u);
          }

          v43 = objc_msgSend(objc_alloc((Class)TUAnswerRequest), "initWithCall:", v16);
          objc_msgSend(v43, "setBehavior:", 4);
          objc_msgSend(v43, "setDowngradeToAudio:", 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
          objc_msgSend(v44, "answerWithRequest:", v43);
          goto LABEL_16;
        }
        objc_msgSend(v101, "resetWantsHoldMusic");
        -[PHInCallRootViewController updateUPlusOneVideoCallViews](self, "updateUPlusOneVideoCallViews");
      }
      goto LABEL_72;
    case 4:
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v104[0] = _NSConcreteStackBlock;
      v104[1] = 3221225472;
      v104[2] = sub_1000BA12C;
      v104[3] = &unk_100285158;
      v105 = v16;
      v106 = v46;
      v47 = v46;
      v48 = objc_retainBlock(v104);
      ((void (*)(void))v48[2])();

      goto LABEL_37;
    case 5:
      v47 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      objc_msgSend(v47, "answerCall:", v16);
      goto LABEL_37;
    case 7:
    case 8:
    case 14:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "delegate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "incomingVideoCallUsingCallContainer:", v21));

      if (v22)
      {
        v23 = sub_1000C5588();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v108 = v22;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Ending FaceTime %@", buf, 0xCu);
        }

        v25 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        -[NSObject disconnectCall:withReason:](v25, "disconnectCall:withReason:", v22, 2);
LABEL_63:

        goto LABEL_71;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "activeVideoCall"));

      if (!v38)
      {
        -[PHInCallRootViewController updateUPlusOneVideoCallViews](self, "updateUPlusOneVideoCallViews");
        goto LABEL_71;
      }
      v39 = sub_1000C5588();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "activeVideoCall"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v108 = v42;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Ending FaceTime %@", buf, 0xCu);

      }
      v43 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "activeVideoCall"));
      objc_msgSend(v43, "disconnectCall:", v45);

LABEL_16:
      goto LABEL_70;
    case 13:
    case 18:
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "delegate"));
      objc_msgSend(v27, "setMostRecentlyDisconnectedVideoCall:", 0);

      v28 = CFSTR("PHMulitwayCallAssertionReason");
      goto LABEL_43;
    case 17:
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "delegate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "mostRecentlyDisconnectedVideoCall"));

      if (v22)
      {
        v25 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dialRequestForRedial"));
        -[NSObject launchAppForDialRequest:completion:](v25, "launchAppForDialRequest:completion:", v77, 0);

      }
      else
      {
        v91 = sub_1000C5588();
        v25 = objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1001AA408();
      }
      goto LABEL_63;
    case 23:
      v47 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      objc_msgSend(v47, "disconnectCall:withReason:", v16, 2);
LABEL_37:

      goto LABEL_72;
    case 26:
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "delegate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "mostRecentlyDisconnectedVideoCall"));

      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "handle"));
      v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "value"));

      v52 = sub_1000C5588();
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v108 = v22;
        *(_WORD *)&v108[8] = 2112;
        *(_QWORD *)&v108[10] = v43;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Call %@; Destination ID %@", buf, 0x16u);
      }

      if (objc_msgSend(v43, "destinationIdIsPhoneNumber"))
      {
        v54 = v12;
        v55 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage(0);
        if (!v55)
        {
          v56 = TUActiveCountryCode();
          v55 = (void *)objc_claimAutoreleasedReturnValue(v56);
        }
        v57 = TUNetworkCountryCode();
        v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
        v59 = TUNumberToDial(v43, v58, v55, 0, 0);
        v60 = objc_claimAutoreleasedReturnValue(v59);

        v43 = (id)v60;
        v12 = v54;
      }
      v61 = objc_alloc_init((Class)MFMessageComposeViewController);
      objc_msgSend(v61, "setBody:", &stru_10028DC20);
      objc_msgSend(v61, "setMessageComposeDelegate:", self);
      objc_msgSend(v61, "_setCanEditRecipients:", 0);
      if (v43 && objc_msgSend(v43, "length"))
      {
        v62 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v43));
        objc_msgSend(v61, "setRecipients:", v62);
      }
      else
      {
        v83 = sub_1000C5588();
        v62 = objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          sub_1001AA460();
      }

      -[PHInCallRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v61, 1, 0);
      goto LABEL_69;
    case 32:
      v63 = v12;
      v64 = sub_1000C5588();
      v65 = objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "SpamReport: did tap on block caller", buf, 2u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentVideoCall"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "delegate"));
      v61 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "mostRecentlyDisconnectedVideoCall"));

      if (v43)
      {
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = sub_1000BA1D8;
        v103[3] = &unk_1002848C0;
        v103[4] = self;
        -[PHInCallRootViewController presentBlockAndReportAlertToBlockCall:forViewController:completion:](self, "presentBlockAndReportAlertToBlockCall:forViewController:completion:", v61, self, v103);
        v12 = v63;
        goto LABEL_69;
      }
      v12 = v63;
      if (v61)
      {
        v102[0] = _NSConcreteStackBlock;
        v102[1] = 3221225472;
        v102[2] = sub_1000BA284;
        v102[3] = &unk_1002848C0;
        v102[4] = self;
        -[PHInCallRootViewController presentBlockAndReportAlertToBlockCall:forViewController:completion:](self, "presentBlockAndReportAlertToBlockCall:forViewController:completion:", v61, self, v102);
        goto LABEL_69;
      }
      v92 = sub_1000C5588();
      v74 = objc_claimAutoreleasedReturnValue(v92);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        goto LABEL_67;
      goto LABEL_68;
    case 33:
      v68 = v12;
      v69 = sub_1000C5588();
      v70 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "SpamReport: did tap on create contact", buf, 2u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentVideoCall"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "delegate"));
      v61 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "mostRecentlyDisconnectedVideoCall"));

      if (v43)
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "handle"));
        -[PHInCallRootViewController presentCreateContactViewControllerWithHandle:forViewController:](self, "presentCreateContactViewControllerWithHandle:forViewController:", v73, self);

        v74 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
        -[NSObject setIsInCallEndedBlockAndReportFlow:](v74, "setIsInCallEndedBlockAndReportFlow:", 0);
        v12 = v68;
      }
      else
      {
        v12 = v68;
        if (v61)
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "handle"));
          -[PHInCallRootViewController presentCreateContactViewControllerWithHandle:forViewController:](self, "presentCreateContactViewControllerWithHandle:forViewController:", v90, self);

          v74 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
          -[NSObject setIsInCallEndedBlockAndReportFlow:](v74, "setIsInCallEndedBlockAndReportFlow:", 0);
        }
        else
        {
          v93 = sub_1000C5588();
          v74 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
LABEL_67:
            sub_1001AA434();
        }
      }
LABEL_68:

LABEL_69:
LABEL_70:

LABEL_71:
LABEL_72:

      return;
    case 34:
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "delegate"));
      objc_msgSend(v79, "setMostRecentlyDisconnectedVideoCall:", 0);

      v80 = sub_1000C5588();
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "SpamReport: did tap on close", buf, 2u);
      }

      v82 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
      objc_msgSend(v82, "setIsInCallEndedBlockAndReportFlow:", 0);

      v28 = CFSTR("PHCallEndedBlockAndReportInProgressAssertionReason");
LABEL_43:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v28));
      +[PHInCallRootViewController releaseDismissalAssertionReasons:](PHInCallRootViewController, "releaseDismissalAssertionReasons:", v22);
      goto LABEL_71;
    default:
      goto LABEL_72;
  }
}

- (void)handleDeviceLockEventOverUPlusOneVideoViewsWithSourceType:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController presentedViewController](self, "presentedViewController"));
  v7 = objc_opt_class(PHMessageComposeViewController, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  if ((isKindOfClass & 1) != 0)
    -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v9, "callDisplayStyle") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "incomingVideoCall"));
    v12 = objc_msgSend(v11, "isConversation");

  }
  else
  {
    v12 = 0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  if ((objc_msgSend(v13, "hasCurrentVideoCalls") & 1) != 0 || v12)
  {

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController multiwayViewController](self, "multiwayViewController"));
    v15 = objc_msgSend(v14, "isInVideoMessageFlow");

    if ((v15 & 1) == 0)
      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHMulitwayCallAssertionReason"));
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "incomingVideoCallUsingCallContainer:", v16));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "delegate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentVideoCallUsingCallContainer:", v16));

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000BA680;
  v36[3] = &unk_100285360;
  v23 = v16;
  v37 = v23;
  v24 = v19;
  v38 = v24;
  v25 = v22;
  v39 = v25;
  v26 = objc_retainBlock(v36);
  if (a3 == 2)
    goto LABEL_12;
  if (!v24)
    goto LABEL_16;
  if ((objc_msgSend(v24, "shouldSuppressRingtone") & 1) != 0)
  {
    if (objc_msgSend(v24, "shouldSuppressRingtone"))
    {
LABEL_12:
      ((void (*)(_QWORD *))v26[2])(v26);
      goto LABEL_20;
    }
LABEL_16:
    if (v25)
      +[PHInCallRootViewController setShouldLockDeviceOnNextDismiss](PHInCallRootViewController, "setShouldLockDeviceOnNextDismiss");
    goto LABEL_20;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "delegate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentInCallScene"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "delegate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "callAnalyticsLogger"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueProxyIdentifierUUID"));
  objc_msgSend(v30, "ringerMutedForCallUUID:", v31);

  objc_msgSend(v24, "suppressRingtone");
  if (objc_msgSend(v24, "status") == 4)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "delegate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bannerPresentationManager"));
    objc_msgSend(v34, "invalidatePersistentSystemApertureAlertWithReason:", CFSTR("Hardware lock button pressed"));

  }
LABEL_20:

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &stru_100287470);
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void)sendUserRating:(int)a3 dontShowPromptAgain:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  _BOOL4 v16;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v14 = v5;
    v15 = 1024;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "UserFeedbackScore : User has rating: %d and BOOL: %d", buf, 0xEu);
  }

  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
    objc_msgSend(v9, "setHasUserScoreFeedbackViewHidden:", 1);

  }
  if ((_DWORD)v5 != -1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController disconnectCallUUID](self, "disconnectCallUUID"));
    objc_msgSend(v10, "sendUserScoreToRTCReporting:withScore:", v11, v5);

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000BA9A0;
  v12[3] = &unk_100284898;
  v12[4] = self;
  -[PHInCallRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v12);
}

- (void)updateInCallWindowScenePrefersHiddenWhenDismissed
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int HasChinaSKU;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));

  if (v3)
  {
    if (-[PHInCallRootViewController isPresentingCallDetailsView](self, "isPresentingCallDetailsView")
      && (v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication")),
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate")),
          v6 = objc_msgSend(v5, "didDeepLinkToCallDetailsView"),
          v5,
          v4,
          !v6))
    {
      v9 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "frontmostBargeCall"));
      v9 = v8 != 0;

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "frontmostCall"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "provider"));
      if (objc_msgSend(v12, "supportsDynamicSystemUI"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController featureFlags](self, "featureFlags"));
        if (objc_msgSend(v13, "groupConversations"))
          HasChinaSKU = TUDeviceHasChinaSKU();
        else
          HasChinaSKU = 0;

      }
      else
      {
        HasChinaSKU = 0;
      }

    }
    else
    {
      HasChinaSKU = 0;
    }
    v15 = HasChinaSKU | v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
    v17 = objc_msgSend(v16, "prefersHiddenWhenDismissed");

    if ((_DWORD)v15 != v17)
    {
      v18 = sub_1000C5588();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
        v21 = (void *)v20;
        v22 = CFSTR("NO");
        if ((_DWORD)v15)
          v22 = CFSTR("YES");
        v24 = 138412546;
        v25 = v20;
        v26 = 2112;
        v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating scene: %@ prefersHiddenWhenDismissed: %@", (uint8_t *)&v24, 0x16u);

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
      objc_msgSend(v23, "setPrefersHiddenWhenDismissed:", v15);

    }
  }
}

- (void)updateInCallWindowSceneFaceTimeLaunchBehavior
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));

  if (v3)
  {
    v4 = -[PHInCallRootViewController shouldShowInCallWindowScene](self, "shouldShowInCallWindowScene") ^ 1;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
    objc_msgSend(v5, "setShouldNeverBeShownWhenLaunchingFaceTime:", v4);

  }
}

- (BOOL)shouldShowInCallWindowScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController callCenter](self, "callCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversationManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "avLessConversation"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController currentViewController](self, "currentViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController pttFullScreenContainerViewController](self, "pttFullScreenContainerViewController"));

  return v6 != v7 && v5 == 0;
}

- (void)wantsDismissal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  objc_msgSend(v4, "setDidDeepLinkToCallDetailsView:", 0);

  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAVLessConversationDetailsViewAssertionReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  objc_msgSend(v6, "setDidDeepLinkToPTTCallDetailsView:", 0);

  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHPTTCallDetailsViewAssertionReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRootViewController inCallWindowScene](self, "inCallWindowScene"));
  objc_msgSend(v7, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:", 0, 0);

  -[PHInCallRootViewController updateInCallWindowScenePrefersHiddenWhenDismissed](self, "updateInCallWindowScenePrefersHiddenWhenDismissed");
}

- (void)presentDisconnectionAlert:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v5 = objc_msgSend(v4, "isEnhancedEmergencyEnabled");

  if ((v5 & 1) == 0)
    -[PHInCallRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (BOOL)isShowSOSConfirmationSupported
{
  return 1;
}

- (void)handleCallBufferNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController,handleCallBufferNotification", v6, 2u);
  }

  -[PHInCallRootViewController updateCallControllerForCurrentState](self, "updateCallControllerForCurrentState");
}

- (void)acceptCallButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHInCallRootViewController.acceptCallButtonTapped", v6, 2u);
  }

  -[PHInCallRootViewController _obtainThenReleaseTransitionAssertion](self, "_obtainThenReleaseTransitionAssertion");
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_callCenter, a3);
}

- (BOOL)dismissalWasDemandedBeforeRemoteViewControllerWasAvailable
{
  return self->_dismissalWasDemandedBeforeRemoteViewControllerWasAvailable;
}

- (void)setDismissalWasDemandedBeforeRemoteViewControllerWasAvailable:(BOOL)a3
{
  self->_dismissalWasDemandedBeforeRemoteViewControllerWasAvailable = a3;
}

- (int64_t)alertActivationReason
{
  return self->_alertActivationReason;
}

- (void)setAlertActivationReason:(int64_t)a3
{
  self->_alertActivationReason = a3;
}

- (TUCall)alertActivationCall
{
  return self->_alertActivationCall;
}

- (void)setAlertActivationCall:(id)a3
{
  objc_storeStrong((id *)&self->_alertActivationCall, a3);
}

- (void)setAudioCallViewController:(id)a3
{
  objc_storeStrong((id *)&self->_audioCallViewController, a3);
}

- (PHAudioCallViewControllerWrapper)audioCallViewControllerWrapper
{
  return self->_audioCallViewControllerWrapper;
}

- (void)setAudioCallViewControllerWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_audioCallViewControllerWrapper, a3);
}

- (PHEmergencyDialerViewController)emergencyDialerViewController
{
  return self->_emergencyDialerViewController;
}

- (void)setEmergencyDialerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyDialerViewController, a3);
}

- (void)setSosViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sosViewController, a3);
}

- (CNKMultiwayViewControllerProtocol)multiwayViewController
{
  return self->_multiwayViewController;
}

- (void)setMultiwayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_multiwayViewController, a3);
}

- (ICSCoverViewController)coverViewController
{
  return self->_coverViewController;
}

- (void)setCoverViewController:(id)a3
{
  objc_storeStrong((id *)&self->_coverViewController, a3);
}

- (PHScreenTimeHostViewController)screenTimeHostViewController
{
  return self->_screenTimeHostViewController;
}

- (void)setScreenTimeHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeHostViewController, a3);
}

- (PHUserFeedbackViewController)userFeedbackViewController
{
  return self->_userFeedbackViewController;
}

- (void)setUserFeedbackViewController:(id)a3
{
  objc_storeStrong((id *)&self->_userFeedbackViewController, a3);
}

- (PHPTTFullScreenContainerViewController)pttFullScreenContainerViewController
{
  return self->_pttFullScreenContainerViewController;
}

- (void)setPttFullScreenContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pttFullScreenContainerViewController, a3);
}

- (void)setCurrentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewController, a3);
}

- (void)setVideoCallNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_videoCallNavigationController, a3);
}

- (UIViewController)oldMultiwayPIPViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_oldMultiwayPIPViewController);
}

- (void)setOldMultiwayPIPViewController:(id)a3
{
  objc_storeWeak((id *)&self->_oldMultiwayPIPViewController, a3);
}

- (CNContactPickerViewController)contactsViewController
{
  return self->_contactsViewController;
}

- (void)setContactsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactsViewController, a3);
}

- (void)setAudioCallNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_audioCallNavigationController, a3);
}

- (PHAudioRoutingMenuController)routeListController
{
  return self->_routeListController;
}

- (void)setRouteListController:(id)a3
{
  objc_storeStrong((id *)&self->_routeListController, a3);
}

- (PHPhoneRemoteHostViewController)remoteHostViewController
{
  return self->_remoteHostViewController;
}

- (void)setRemoteHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteHostViewController, a3);
}

- (CNKSceneVisibilityHandler)callDetailsNavigationController
{
  return self->_callDetailsNavigationController;
}

- (void)setCallDetailsNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_callDetailsNavigationController, a3);
}

- (UIView)transportIndicatorView
{
  return self->_transportIndicatorView;
}

- (void)setTransportIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_transportIndicatorView, a3);
}

- (SBUIRemoteAlertButtonAction)currentAlertButtonAction
{
  return self->_currentAlertButtonAction;
}

- (TUFilteredRequest)filteredRequest
{
  return self->_filteredRequest;
}

- (void)setFilteredRequest:(id)a3
{
  objc_storeStrong((id *)&self->_filteredRequest, a3);
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (BOOL)allowHomeOutDismissal
{
  return self->_allowHomeOutDismissal;
}

- (void)setAllowHomeOutDismissal:(BOOL)a3
{
  self->_allowHomeOutDismissal = a3;
}

- (BOOL)shouldHideStatusBar
{
  return self->_shouldHideStatusBar;
}

- (void)setShouldHideStatusBar:(BOOL)a3
{
  self->_shouldHideStatusBar = a3;
}

- (BOOL)isPresentingCoverView
{
  return self->_isPresentingCoverView;
}

- (void)setIsPresentingCoverView:(BOOL)a3
{
  self->_isPresentingCoverView = a3;
}

- (UITapGestureRecognizer)bannerTapGestureRecognizer
{
  return self->_bannerTapGestureRecognizer;
}

- (PHCallParticipantsView)callParticipantLabelsView
{
  return self->_callParticipantLabelsView;
}

- (void)setCallParticipantLabelsView:(id)a3
{
  objc_storeStrong((id *)&self->_callParticipantLabelsView, a3);
}

- (CNContact)contactForParticipantsView
{
  return self->_contactForParticipantsView;
}

- (void)setContactForParticipantsView:(id)a3
{
  objc_storeStrong((id *)&self->_contactForParticipantsView, a3);
}

- (TUCall)callForParticipantsView
{
  return self->_callForParticipantsView;
}

- (void)setCallForParticipantsView:(id)a3
{
  objc_storeStrong((id *)&self->_callForParticipantsView, a3);
}

- (NSString)contactNameForParticipantsView
{
  return self->_contactNameForParticipantsView;
}

- (void)setContactNameForParticipantsView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)secondaryStringForParticipantsView
{
  return self->_secondaryStringForParticipantsView;
}

- (void)setSecondaryStringForParticipantsView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSTimer)callDurationTimerForParticipantsView
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_callDurationTimerForParticipantsView);
}

- (void)setCallDurationTimerForParticipantsView:(id)a3
{
  objc_storeWeak((id *)&self->_callDurationTimerForParticipantsView, a3);
}

- (PHBottomBar)bottomControlsView
{
  return self->_bottomControlsView;
}

- (void)setBottomControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomControlsView, a3);
}

- (PHDeclineWithMessageController)declineWithMessageController
{
  return self->_declineWithMessageController;
}

- (void)setDeclineWithMessageController:(id)a3
{
  objc_storeStrong((id *)&self->_declineWithMessageController, a3);
}

- (PHAlertController)failureAlertController
{
  return self->_failureAlertController;
}

- (void)setFailureAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_failureAlertController, a3);
}

- (NSString)disconnectCallUUID
{
  return self->_disconnectCallUUID;
}

- (void)setDisconnectCallUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)temporarilyAllowAllStatusBarPills
{
  return self->_temporarilyAllowAllStatusBarPills;
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, a3);
}

- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory
{
  return self->_labelDescriptorFactory;
}

- (CNKCrossFadeAnimatorFactory)animatorFactory
{
  return self->_animatorFactory;
}

- (void)setAnimatorFactory:(id)a3
{
  objc_storeStrong((id *)&self->_animatorFactory, a3);
}

- (BOOL)hasEverAppearedInWindow
{
  return self->_hasEverAppearedInWindow;
}

- (void)setHasEverAppearedInWindow:(BOOL)a3
{
  self->_hasEverAppearedInWindow = a3;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (PHDeclineCallServiceProtocol)declineCallService
{
  return self->_declineCallService;
}

- (void)setDeclineCallService:(id)a3
{
  objc_storeStrong((id *)&self->_declineCallService, a3);
}

- (ICSCallManagerBridge)callManager
{
  return self->_callManager;
}

- (void)setCallManager:(id)a3
{
  objc_storeStrong((id *)&self->_callManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callManager, 0);
  objc_storeStrong((id *)&self->_declineCallService, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_animatorFactory, 0);
  objc_storeStrong((id *)&self->_labelDescriptorFactory, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_disconnectCallUUID, 0);
  objc_storeStrong((id *)&self->_failureAlertController, 0);
  objc_storeStrong((id *)&self->_declineWithMessageController, 0);
  objc_storeStrong((id *)&self->_bottomControlsView, 0);
  objc_destroyWeak((id *)&self->_callDurationTimerForParticipantsView);
  objc_storeStrong((id *)&self->_secondaryStringForParticipantsView, 0);
  objc_storeStrong((id *)&self->_contactNameForParticipantsView, 0);
  objc_storeStrong((id *)&self->_callForParticipantsView, 0);
  objc_storeStrong((id *)&self->_contactForParticipantsView, 0);
  objc_storeStrong((id *)&self->_callParticipantLabelsView, 0);
  objc_storeStrong((id *)&self->_bannerTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_filteredRequest, 0);
  objc_storeStrong((id *)&self->_currentAlertButtonAction, 0);
  objc_storeStrong((id *)&self->_transportIndicatorView, 0);
  objc_storeStrong((id *)&self->_callDetailsNavigationController, 0);
  objc_storeStrong((id *)&self->_remoteHostViewController, 0);
  objc_storeStrong((id *)&self->_routeListController, 0);
  objc_storeStrong((id *)&self->_audioCallNavigationController, 0);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
  objc_destroyWeak((id *)&self->_oldMultiwayPIPViewController);
  objc_storeStrong((id *)&self->_videoCallNavigationController, 0);
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong((id *)&self->_pttFullScreenContainerViewController, 0);
  objc_storeStrong((id *)&self->_userFeedbackViewController, 0);
  objc_storeStrong((id *)&self->_screenTimeHostViewController, 0);
  objc_storeStrong((id *)&self->_coverViewController, 0);
  objc_storeStrong((id *)&self->_multiwayViewController, 0);
  objc_storeStrong((id *)&self->_sosViewController, 0);
  objc_storeStrong((id *)&self->_emergencyDialerViewController, 0);
  objc_storeStrong((id *)&self->_audioCallViewControllerWrapper, 0);
  objc_storeStrong((id *)&self->_audioCallViewController, 0);
  objc_storeStrong((id *)&self->_alertActivationCall, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
}

- (id)makeConversationHUDDetailsNavigationControllerWithBannerPresentationManager:(id)a3 delegate:(id)a4 shouldSetControlsManagerInCallDetailsDelegate:(BOOL)a5
{
  id v7;
  PHInCallRootViewController *v8;
  void *v9;
  void *v10;

  v7 = a3;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10019CF1C((uint64_t)v7);
  v10 = v9;

  swift_unknownObjectRelease(a4);
  return v10;
}

- (id)makeMultiwayConversationViewControllerWithCall:(id)a3 bannerPresentationManager:(id)a4
{
  id v6;
  id v7;
  PHInCallRootViewController *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10019D004(v6, (uint64_t)v7);
  v10 = v9;

  return v10;
}

- (void)dissmissConfirmLeavePTTChannelAlertIfNeededWithBannerPresentationManager:(id)a3
{
  id v4;
  PHInCallRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10019D0D4((uint64_t)v4);

}

- (void)ambientSetIdleTimerDisabled:(BOOL)a3
{
  PHInCallRootViewController *v4;

  v4 = self;
  sub_10019D18C(a3);

}

- (void)startObservingAcceptCallButtonTappedWithNotificationCenter:(id)a3
{
  id v4;
  PHInCallRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10019D2E0(v4);

}

- (void)handleAcceptCallButtonTapped:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  PHInCallRootViewController *v11;
  uint64_t v12;

  v5 = sub_1001085C0(&qword_1002DC2F0);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = type metadata accessor for Notification(0);
    v10 = 0;
  }
  else
  {
    v9 = type metadata accessor for Notification(0);
    v10 = 1;
  }
  sub_100108600((uint64_t)v8, v10, 1, v9);
  v11 = self;
  sub_10019D388();

  sub_1001A3CD8((uint64_t)v8, &qword_1002DC2F0);
}

- (void)_obtainThenReleaseTransitionAssertion
{
  PHInCallRootViewController *v2;

  v2 = self;
  sub_10019D634();

}

- (BOOL)isContactBlockedWithCall:(id)a3
{
  id v4;
  PHInCallRootViewController *v5;
  BOOL v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10019DA28();

  return v6;
}

- (void)blockWithHandle:(id)a3
{
  id v4;
  PHInCallRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10019DA98(v4);

}

- (void)reportWithCall:(id)a3
{
  id v4;
  PHInCallRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10019DDDC((uint64_t)v4);

}

- (id)findMostRecentSilencedCallWithHandleValue:(id)a3 normalizedHandleValue:(id)a4 ignoredIdentifier:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PHInCallRootViewController *v16;
  id v17;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  if (a4)
  {
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }
  else
  {
    v11 = 0;
  }
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = v14;
  v16 = self;
  v17 = sub_10019DF04(v8, v10, v11, (unint64_t)a4, v13, v15);

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(a4);
  return v17;
}

- (BOOL)isFirstTimeInCallHistoryWithHandleValue:(id)a3 normalizedHandleValue:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PHInCallRootViewController *v11;
  BOOL v12;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = self;
  v12 = sub_10019E9B0(v6, v8, v9, (unint64_t)a4);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(a4);
  return v12;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  id v7;
  PHInCallRootViewController *v8;
  CNContact_optional v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PHInCallRootViewController.contactViewController(_:didCompleteWith:)((CNContactViewController)v8, v9);

}

@end
