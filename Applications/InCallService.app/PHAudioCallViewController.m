@implementation PHAudioCallViewController

- (int64_t)preferredInterfaceOrientationForPresentation
{
  objc_super v4;

  if (!+[PHUIConfiguration canAutoRotateInCallUIForFaceTimeAudio](PHUIConfiguration, "canAutoRotateInCallUIForFaceTimeAudio"))return 1;
  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewController;
  return -[PHAudioCallViewController preferredInterfaceOrientationForPresentation](&v4, "preferredInterfaceOrientationForPresentation");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (+[PHUIConfiguration canAutoRotateInCallUIForFaceTimeAudio](PHUIConfiguration, "canAutoRotateInCallUIForFaceTimeAudio"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)_testing_finishedAnimatingToActiveCallState:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("AnswerIncomingCall")))
  {
    objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("end-to-end"), CFSTR("AnswerIncomingCall"));
    -[PHAudioCallViewController bottomBarActionPerformed:withCompletionState:fromBar:](self, "bottomBarActionPerformed:withCompletionState:fromBar:", 14, 1, v4);
  }

}

- (void)_testing_didTransitionToActiveCallState:(id)a3
{
  id v4;
  dispatch_time_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("AnswerIncomingCall")))
  {
    objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("pre-animation-delay"), CFSTR("AnswerIncomingCall"));
  }
  else if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("EndActiveCall")))
  {
    v5 = dispatch_time(0, 2000000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000869F0;
    v7[3] = &unk_100285158;
    v7[4] = self;
    v8 = v4;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

  }
  else if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("PlaceOutgoingCall")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v6, "disconnectAllCalls");

  }
}

- (void)_testing_didTransitionToIdleCallState
{
  if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("EndActiveCall")))
  {
    objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("end-call"), CFSTR("EndActiveCall"));
    _objc_msgSend(UIApp, "finishedTest:", CFSTR("EndActiveCall"));
  }
  else if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("AnswerIncomingCall")))
  {
    _objc_msgSend(UIApp, "finishedTest:", CFSTR("AnswerIncomingCall"));
  }
  else if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("PlaceOutgoingCall")))
  {
    _objc_msgSend(UIApp, "finishedTest:", CFSTR("PlaceOutgoingCall"));
  }
}

- (void)_testing_didTransitionToEndingCallState
{
  if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("EndActiveCall")))
    objc_msgSend(UIApp, "finishedSubTest:forTest:", CFSTR("pre-transition-delay"), CFSTR("EndActiveCall"));
}

- (void)_testing_didTransitionToIncomingRingingCallState:(id)a3
{
  id v4;
  dispatch_time_t v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("AnswerIncomingCall")))
  {
    v5 = dispatch_time(0, 2000000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100086C14;
    v6[3] = &unk_100285158;
    v6[4] = self;
    v7 = v4;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);

  }
}

- (void)setParticipantsViewControllersShouldIgnoreUpdates:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;

  if (self->_participantsViewControllersShouldIgnoreUpdates != a3)
  {
    v3 = a3;
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating the participants view and viewController shouldIgnoreUpdates: %@", (uint8_t *)&v10, 0xCu);
    }

    self->_participantsViewControllersShouldIgnoreUpdates = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
    objc_msgSend(v8, "setShouldIgnoreUpdates:", v3);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callWaitingParticipantsViewController](self, "callWaitingParticipantsViewController"));
    objc_msgSend(v9, "setShouldIgnoreUpdates:", v3);

  }
}

- (PHAudioCallViewController)initWithCallDisplayStyleManager:(id)a3 callCenter:(id)a4 featureFlags:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHAudioCallViewController *v12;
  PHAudioCallViewController *v13;
  CNKCoreAnalyticsReporter *v14;
  CNKCoreAnalyticsReporter *analyticsReporter;
  PHDeclineCallServiceFactory *v16;
  uint64_t v17;
  PHDeclineCallServiceProtocol *declineCallService;
  CNKCallParticipantLabelDescriptorFactory *v19;
  CNKCallParticipantLabelDescriptorFactory *labelDescriptorFactory;
  CNKMutedTalkerBannerViewControllerFactory *v21;
  CNKMutedTalkerBannerViewControllerFactory *mutedTalkerViewControllerFactory;
  uint64_t v23;
  CNKMutedTalkerBannerViewControllerProtocol *mutedTalkerBannerViewController;
  CNKTranscriptionViewComposerFactory *v25;
  CNKTranscriptionViewComposerFactory *screeningViewControllerFactory;
  uint64_t v27;
  CNKFeatures *features;
  NSCache *v29;
  NSCache *contactsCache;
  NSCache *v31;
  NSCache *configurationCache;
  uint64_t v33;
  NSMutableArray *callUUIDsThatPresentedSNaPHUD;
  TUFeatureFlags *v35;
  TUFeatureFlags *featureFlags;
  CNKScreenSharingInteractionControllerFactory *v37;
  CNKScreenSharingInteractionControllerFactory *screenSharingInteractionControllerFactory;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  _TtC13InCallService16AlertCoordinator *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  PHEnhancedEmergencyCoordinator *v64;
  void *v65;
  void *v66;
  objc_super v68;
  uint8_t buf[4];
  PHAudioCallViewController *v70;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v68.receiver = self;
  v68.super_class = (Class)PHAudioCallViewController;
  v12 = -[PHCallViewController initWithNibName:bundle:](&v68, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_callCenter, a4);
    objc_storeStrong((id *)&v13->_featureFlags, a5);
    v14 = objc_opt_new(CNKCoreAnalyticsReporter);
    analyticsReporter = v13->_analyticsReporter;
    v13->_analyticsReporter = v14;

    v16 = objc_opt_new(PHDeclineCallServiceFactory);
    v17 = objc_claimAutoreleasedReturnValue(-[PHDeclineCallServiceFactory makeWithCallCenter:](v16, "makeWithCallCenter:", v10));
    declineCallService = v13->_declineCallService;
    v13->_declineCallService = (PHDeclineCallServiceProtocol *)v17;

    v19 = objc_opt_new(CNKCallParticipantLabelDescriptorFactory);
    labelDescriptorFactory = v13->_labelDescriptorFactory;
    v13->_labelDescriptorFactory = v19;

    objc_storeStrong((id *)&v13->_callDisplayStyleManager, a3);
    v13->_wasPresentedAsBanner = objc_msgSend(v9, "callDisplayStyle") == 0;
    v13->_middleViewState = 0;
    v13->_canDumpHierarchy = 1;
    v21 = objc_opt_new(CNKMutedTalkerBannerViewControllerFactory);
    mutedTalkerViewControllerFactory = v13->_mutedTalkerViewControllerFactory;
    v13->_mutedTalkerViewControllerFactory = v21;

    v23 = objc_claimAutoreleasedReturnValue(-[CNKMutedTalkerBannerViewControllerFactory makeViewController](v13->_mutedTalkerViewControllerFactory, "makeViewController"));
    mutedTalkerBannerViewController = v13->_mutedTalkerBannerViewController;
    v13->_mutedTalkerBannerViewController = (CNKMutedTalkerBannerViewControllerProtocol *)v23;

    -[CNKMutedTalkerBannerViewControllerProtocol setDelegate:](v13->_mutedTalkerBannerViewController, "setDelegate:", v13);
    v13->_didNotifyMutedCaller = 0;
    v25 = objc_opt_new(CNKTranscriptionViewComposerFactory);
    screeningViewControllerFactory = v13->_screeningViewControllerFactory;
    v13->_screeningViewControllerFactory = v25;

    v27 = objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    features = v13->_features;
    v13->_features = (CNKFeatures *)v27;

    v13->_participantsViewShouldShowParticipantLabel = 1;
    v29 = (NSCache *)objc_alloc_init((Class)NSCache);
    contactsCache = v13->_contactsCache;
    v13->_contactsCache = v29;

    -[NSCache setCountLimit:](v13->_contactsCache, "setCountLimit:", 10);
    v31 = (NSCache *)objc_alloc_init((Class)NSCache);
    configurationCache = v13->_configurationCache;
    v13->_configurationCache = v31;

    v33 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    callUUIDsThatPresentedSNaPHUD = v13->_callUUIDsThatPresentedSNaPHUD;
    v13->_callUUIDsThatPresentedSNaPHUD = (NSMutableArray *)v33;

    v35 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v13->_featureFlags;
    v13->_featureFlags = v35;

    v37 = objc_opt_new(CNKScreenSharingInteractionControllerFactory);
    screenSharingInteractionControllerFactory = v13->_screenSharingInteractionControllerFactory;
    v13->_screenSharingInteractionControllerFactory = v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "callCenterCallStatusChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "hardwareButtonEventNotification:", CFSTR("PHHardwareButtonEventNotification"), 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "hardPauseDigitsStateChangedNotification:", TUCallHardPauseDigitsStateChangedNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "callContinuityStateChangedNotification:", TUCallCenterCallContinuityStateChangedNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "wantsHoldMusicChangedNotification:", TUCallCenterCallWantsHoldMusicChangedNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "callOnHoldChangedNotification:", TUCallIsOnHoldChangedNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "handleTUCallSupportsTTYWithVoiceChangedNotification:", TUCallSupportsTTYWithVoiceChangedNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "handleTUCallTTYTypeChangedNotification:", TUCallTTYTypeChangedNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "callIsScreenSharingChangedNotification:", TUCallIsSharingScreenChangedNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "callKeypadDataSourceChangedNotification:", CFSTR("PHInCallKeypadDataSourceChangedNotification"), 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "callDisplayContextChangedNotification:", TUCallDisplayContextChangedNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v13, "callIsEmergencyChangedNotification:", TUCallCenterIsEmergencyChangedNotification, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](v13, "featureFlags"));
    LODWORD(v16) = TUCallScreeningEnabledM3(v40);

    if ((_DWORD)v16)
      objc_msgSend(v39, "addObserver:selector:name:object:", v13, "callCenterScreeningStatusChangedNotification:", TUCallCenterIsScreeningChangedNotification, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeController"));
    objc_msgSend(v41, "addDelegate:", v13);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "audioDeviceController"));
    objc_msgSend(v42, "addDelegate:", v13);

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "delegate"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bannerPresentationManager"));
    objc_msgSend(v45, "setLocalAudioTogglingDelegate:", v13);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CNKScreenSharingInteractionControllerFactory sharedController](v13->_screenSharingInteractionControllerFactory, "sharedController"));
    objc_msgSend(v46, "addDelegate:", v13);

  }
  v47 = sub_1000C5588();
  v48 = objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController is about to set shouldPresentAlertButton to NO", buf, 2u);
  }

  v13->_shouldPresentAlertButton = 0;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "delegate"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "alertCoordinator"));

  if (!v51)
  {
    v52 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "delegate"));
    objc_msgSend(v54, "setAlertCoordinator:", v52);

  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "delegate"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "alertCoordinator"));
  objc_msgSend(v57, "setDelegate:", v13);

  v13->_shouldEnableVideoStreamingButton = 0;
  v13->_shouldEnableShareMediaButton = 0;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](v13, "features"));
  LODWORD(v56) = objc_msgSend(v58, "isEnhancedEmergencyEnabled");

  if ((_DWORD)v56)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSDisconnectionConfirmation sharedInstance](PHSOSDisconnectionConfirmation, "sharedInstance"));
    objc_msgSend(v59, "addDelegate:", v13);

    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "frontmostCall"));
    if (!objc_msgSend(v60, "isEmergency"))
    {
LABEL_15:

      goto LABEL_16;
    }
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](v13, "emergencyCoordinator"));

    if (!v61)
    {
      v62 = sub_1000C5588();
      v63 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v13;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: going to create PHEnhancedEmergencyCoordinator from initing PHAudioCallViewController: %@", buf, 0xCu);
      }

      v64 = objc_alloc_init(PHEnhancedEmergencyCoordinator);
      -[PHAudioCallViewController setEmergencyCoordinator:](v13, "setEmergencyCoordinator:", v64);

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](v13, "emergencyCoordinator"));
      objc_msgSend(v65, "setDelegate:", v13);

      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "frontmostCall"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](v13, "emergencyCoordinator"));
      objc_msgSend(v66, "setTuCall:", v60);

      goto LABEL_15;
    }
  }
LABEL_16:
  -[PHAudioCallViewController setupDimmingViewForAlwaysOnDisplay](v13, "setupDimmingViewForAlwaysOnDisplay");
  -[PHAudioCallViewController updateCallRecordingIfNeeded](v13, "updateCallRecordingIfNeeded");

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  PHAudioCallViewController *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsCoordinator](self, "callDetailsCoordinator"));
  objc_msgSend(v4, "stopWithReason:", CFSTR("PHAudioCallViewController deallocated"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v5, "setDelegate:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "audioDeviceController"));
  objc_msgSend(v7, "removeDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v8, "callDisplayStyle") != (id)3)
  {

    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v10 = objc_msgSend(v9, "isDominoEnabled");

  if ((v10 & 1) == 0)
LABEL_5:
    -[PHAudioCallViewController deleteAllUnarchivedPosterDirectories](self, "deleteAllUnarchivedPosterDirectories");
  -[PHAudioCallViewController stopTracking](self, "stopTracking");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v12 = objc_msgSend(v11, "isEnhancedEmergencyEnabled");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSDisconnectionConfirmation sharedInstance](PHSOSDisconnectionConfirmation, "sharedInstance"));
    objc_msgSend(v13, "removeDelegate:", self);

  }
  v14 = sub_1000C5588();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController deallocated %@", buf, 0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)PHAudioCallViewController;
  -[PHAudioCallViewController dealloc](&v16, "dealloc");
}

- (void)loadView
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  -[PHAudioCallViewController setRootView](self, "setRootView");
  -[PHAudioCallViewController setupAmbientAudioRoutesControlViewIfNeeded](self, "setupAmbientAudioRoutesControlViewIfNeeded");
  -[PHAudioCallViewController addCallParticipantsSubView](self, "addCallParticipantsSubView");
  -[PHAudioCallViewController addBottomBarSubView](self, "addBottomBarSubView");
  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view loaded: %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)setRootView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (id)-[PHAudioCallViewController preferredInterfaceOrientationForPresentation](self, "preferredInterfaceOrientationForPresentation") == (id)1;
  v13 = v11 < v9;
  if (v12 && v13)
    v14 = v9;
  else
    v14 = v11;
  if (v12 && v13)
    v9 = v11;
  v17 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v5, v7, v9, v14);
  -[PHAudioCallViewController setView:](self, "setView:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  objc_msgSend(v15, "setAllowsGroupBlending:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  objc_msgSend(v16, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v17, "setAutoresizingMask:", 18);
}

- (void)addBottomBarSubView
{
  PHBottomBar *v3;
  void *v4;
  PHBottomBar *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void ***v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id location;

  v3 = [PHBottomBar alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v5 = -[PHBottomBar initWithCallDisplayStyleManager:](v3, "initWithCallDisplayStyleManager:", v4);
  -[PHCallViewController setBottomBar:](self, "setBottomBar:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v8, "setDelegate:", self);

  v10 = (void *)objc_opt_class(self, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  objc_msgSend(v10, "_bottomBarBottomMarginForView:", v11);
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v14, "setBottomMargin:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v16 = objc_msgSend(v15, "callDisplayStyle");

  if (!v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v17, "setAlpha:", 0.0);

  }
  -[PHAudioCallViewController updateHardPauseDigitsState](self, "updateHardPauseDigitsState");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v18, "addSubview:", v19);

  -[PHAudioCallViewController constrainBottomBar](self, "constrainBottomBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v20, "setCurrentState:", 11);

  objc_initWeak(&location, self);
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_1000C8F8C;
  v29 = &unk_100285F88;
  objc_copyWeak(&v30, &location);
  v21 = objc_retainBlock(&v26);
  ((void (*)(void ***, uint64_t, uint64_t, uint64_t))v21[2])(v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar", v26, v27, v28, v29));
  objc_msgSend(v25, "setStatusChangedHandler:", v21);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)constrainBottomBar
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  double v26;
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
  _QWORD v41[2];
  _QWORD v42[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PHAudioCallViewController constrainBottomBarBottom](self, "constrainBottomBarBottom");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v4, "callDisplayStyle") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v6 = objc_msgSend(v5, "isDominoEnabled");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v40, 11.0));
      v42[0] = v39;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
      +[PHUIConfiguration ambientHorizontalPadding](PHUIConfiguration, "ambientHorizontalPadding");
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, -v10));
      v42[1] = v34;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "widthAnchor"));
      +[PHBottomBar ambientWidth](PHBottomBar, "ambientWidth");
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToConstant:"));
      v42[2] = v31;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
      v42[3] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
      v42[4] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 5));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

      goto LABEL_9;
    }
  }
  else
  {

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  LODWORD(v21) = objc_msgSend(v22, "isButtonLayoutEnabled");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "widthAnchor"));
  if ((_DWORD)v21)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    objc_msgSend(v25, "frame");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", v26));

  }
  else
  {
    +[PHBottomBar defaultWidth](PHBottomBar, "defaultWidth");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:"));
  }

  v41[0] = v7;
  v41[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);
LABEL_9:

}

- (void)addCallParticipantsSubView
{
  PHCallParticipantsViewController *v3;
  void *v4;
  void *v5;
  PHCallParticipantsViewController *v6;
  PHCallParticipantsViewController *callParticipantsViewController;
  void *v8;
  void *v9;
  void *v10;

  if (!self->_callParticipantsViewController)
  {
    v3 = [PHCallParticipantsViewController alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
    v6 = -[PHCallParticipantsViewController initWithCallDisplayStyleManager:contactsCache:](v3, "initWithCallDisplayStyleManager:contactsCache:", v4, v5);
    callParticipantsViewController = self->_callParticipantsViewController;
    self->_callParticipantsViewController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
    -[PHCallParticipantsViewController setPrioritizedCall:](self->_callParticipantsViewController, "setPrioritizedCall:", v8);

    -[PHCallParticipantsViewController setDelegate:](self->_callParticipantsViewController, "setDelegate:", self);
    -[PHCallParticipantsViewController setShouldIgnoreUpdates:](self->_callParticipantsViewController, "setShouldIgnoreUpdates:", -[PHAudioCallViewController participantsViewControllersShouldIgnoreUpdates](self, "participantsViewControllersShouldIgnoreUpdates"));
    -[PHAudioCallViewController updateShouldShowLargeAvatar](self, "updateShouldShowLargeAvatar");
    -[PHAudioCallViewController addChildViewController:](self, "addChildViewController:", self->_callParticipantsViewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callParticipantsViewController, "view"));
    objc_msgSend(v9, "addSubview:", v10);

    -[PHAudioCallViewController setUpLayoutGuidesForParticipantsViewController:](self, "setUpLayoutGuidesForParticipantsViewController:", self->_callParticipantsViewController);
    -[PHAudioCallViewController applyParticipantsViewConstraints](self, "applyParticipantsViewConstraints");
  }
}

- (void)layoutParticipantsViewAnimated:(BOOL)a3
{
  -[PHAudioCallViewController layoutParticipantsViewAnimated:crossfade:](self, "layoutParticipantsViewAnimated:crossfade:", a3, 0);
}

- (void)layoutParticipantsViewAnimated:(BOOL)a3 crossfade:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unsigned int v7;
  unsigned int v8;
  int v9;
  void *v10;
  _QWORD v11[5];
  char v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a4;
  v5 = a3;
  v7 = -[PHAudioCallViewController shouldShowLargeAvatar](self, "shouldShowLargeAvatar");
  -[PHAudioCallViewController updateShouldShowLargeAvatar](self, "updateShouldShowLargeAvatar");
  v8 = -[PHAudioCallViewController shouldShowLargeAvatar](self, "shouldShowLargeAvatar");
  if (v5)
  {
    if (v4)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000C97CC;
      v14[3] = &unk_100284898;
      v14[4] = self;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000C9828;
      v13[3] = &unk_1002848C0;
      v13[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v13, 0.400000006);
    }
    else
    {
      v9 = v7 ^ v8;
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        objc_msgSend(v10, "layoutIfNeeded");

      }
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000C9914;
      v11[3] = &unk_100284C98;
      v12 = v9;
      v11[4] = self;
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v11, &stru_1002878B0, 0.800000012, 0.0, 1.0, 0.0);
    }
  }
  else
  {
    -[PHAudioCallViewController resetParticipantsViewConstraints](self, "resetParticipantsViewConstraints");
  }
}

- (void)resetParticipantsViewConstraints
{
  -[PHAudioCallViewController removeAllParticipantsViewConstraints](self, "removeAllParticipantsViewConstraints");
  -[PHAudioCallViewController applyParticipantsViewConstraints](self, "applyParticipantsViewConstraints");
  -[PHAudioCallViewController copyCallWaitingConstraintsFromParticipantsView](self, "copyCallWaitingConstraintsFromParticipantsView");
}

- (void)removeAllParticipantsViewConstraints
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
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
    objc_msgSend(v15, "addObject:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewLeadingConstraint](self, "participantsViewLeadingConstraint"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewLeadingConstraint](self, "participantsViewLeadingConstraint"));
    objc_msgSend(v15, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTrailingConstraint](self, "participantsViewTrailingConstraint"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTrailingConstraint](self, "participantsViewTrailingConstraint"));
    objc_msgSend(v15, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewCenterXConstraint](self, "participantsViewCenterXConstraint"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewCenterXConstraint](self, "participantsViewCenterXConstraint"));
    objc_msgSend(v15, "addObject:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewBottomConstraint](self, "participantsViewBottomConstraint"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewBottomConstraint](self, "participantsViewBottomConstraint"));
    objc_msgSend(v15, "addObject:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewCenterYConstraint](self, "participantsViewCenterYConstraint"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewCenterYConstraint](self, "participantsViewCenterYConstraint"));
    objc_msgSend(v15, "addObject:", v14);

  }
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v15);

}

- (void)applyParticipantsViewConstraints
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v4 = objc_msgSend(v3, "callDisplayStyle");

  switch((unint64_t)v4)
  {
    case 0uLL:
      -[PHAudioCallViewController applyParticipantsViewConstraintsForBanner](self, "applyParticipantsViewConstraintsForBanner");
      break;
    case 1uLL:
    case 2uLL:
    case 4uLL:
      -[PHAudioCallViewController applyParticipantsViewConstraintsForFullScreen](self, "applyParticipantsViewConstraintsForFullScreen");
      break;
    case 3uLL:
      -[PHAudioCallViewController applyParticipantsViewConstraintsForAmbient](self, "applyParticipantsViewConstraintsForAmbient");
      break;
    default:
      return;
  }
}

- (void)applyParticipantsViewConstraintsForFullScreen
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
  _QWORD v29[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController viewIfLoaded](self, "viewIfLoaded"));

    if (v4)
    {
      objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PHAudioCallViewController setParticipantsViewCenterYConstraint:](self, "setParticipantsViewCenterYConstraint:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safeAreaLayoutGuide"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      +[TPIncomingCallMetricsProvider sixPercentOfDeviceHeight](TPIncomingCallMetricsProvider, "sixPercentOfDeviceHeight");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v8));
      -[PHAudioCallViewController setParticipantsViewTopConstraint:](self, "setParticipantsViewTopConstraint:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
      -[PHAudioCallViewController setParticipantsViewCenterXConstraint:](self, "setParticipantsViewCenterXConstraint:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "readableContentGuide"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v17));
      -[PHAudioCallViewController setParticipantsViewLeadingConstraint:](self, "setParticipantsViewLeadingConstraint:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "readableContentGuide"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v22));
      -[PHAudioCallViewController setParticipantsViewTrailingConstraint:](self, "setParticipantsViewTrailingConstraint:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
      v29[0] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewCenterXConstraint](self, "participantsViewCenterXConstraint"));
      v29[1] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewLeadingConstraint](self, "participantsViewLeadingConstraint"));
      v29[2] = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTrailingConstraint](self, "participantsViewTrailingConstraint"));
      v29[3] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

    }
  }

}

- (id)ambientParticipantsViewConstraintsForView:(id)a3 largeAvatar:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
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

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  +[PHUIConfiguration ambientVerticalPadding](PHUIConfiguration, "ambientVerticalPadding");
  v9 = v8;
  +[PHUIConfiguration ambientHorizontalPadding](PHUIConfiguration, "ambientHorizontalPadding");
  v11 = v10;
  if (v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -v9));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, &off_100296AC0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "safeAreaLayoutGuide"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v19, -v11));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, &off_100296AD8);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientAudioRoutesControlView](self, "ambientAudioRoutesControlView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -20.0));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, &off_100296AD8);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, v9));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, &off_100296AF0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "safeAreaLayoutGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v28, v11));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, &off_100296B08);

  return v7;
}

- (void)applyParticipantsViewConstraintsForAmbient
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
  _QWORD v16[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientParticipantsViewConstraintsForView:largeAvatar:](self, "ambientParticipantsViewConstraintsForView:largeAvatar:", v4, -[PHAudioCallViewController shouldShowLargeAvatar](self, "shouldShowLargeAvatar")));
    -[PHAudioCallViewController setParticipantsViewCenterXConstraint:](self, "setParticipantsViewCenterXConstraint:", 0);
    -[PHAudioCallViewController setParticipantsViewCenterYConstraint:](self, "setParticipantsViewCenterYConstraint:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_100296AF0));
    -[PHAudioCallViewController setParticipantsViewTopConstraint:](self, "setParticipantsViewTopConstraint:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_100296AC0));
    -[PHAudioCallViewController setParticipantsViewBottomConstraint:](self, "setParticipantsViewBottomConstraint:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_100296B08));
    -[PHAudioCallViewController setParticipantsViewLeadingConstraint:](self, "setParticipantsViewLeadingConstraint:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_100296AD8));
    -[PHAudioCallViewController setParticipantsViewTrailingConstraint:](self, "setParticipantsViewTrailingConstraint:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewLeadingConstraint](self, "participantsViewLeadingConstraint", v10));
    v16[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTrailingConstraint](self, "participantsViewTrailingConstraint"));
    v16[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewBottomConstraint](self, "participantsViewBottomConstraint"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewBottomConstraint](self, "participantsViewBottomConstraint"));
      objc_msgSend(v15, "setActive:", 1);

    }
  }

}

- (void)applyParticipantsViewConstraintsForBanner
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
  void *v29;
  void *v30;
  _QWORD v31[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHAudioCallViewController setParticipantsViewCenterXConstraint:](self, "setParticipantsViewCenterXConstraint:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
    -[PHAudioCallViewController setParticipantsViewCenterYConstraint:](self, "setParticipantsViewCenterYConstraint:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v11));
    -[PHAudioCallViewController setParticipantsViewTopConstraint:](self, "setParticipantsViewTopConstraint:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v15));
    -[PHAudioCallViewController setParticipantsViewBottomConstraint:](self, "setParticipantsViewBottomConstraint:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    -[PHAudioCallViewController setParticipantsViewLeadingConstraint:](self, "setParticipantsViewLeadingConstraint:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    -[PHAudioCallViewController setParticipantsViewTrailingConstraint:](self, "setParticipantsViewTrailingConstraint:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewCenterYConstraint](self, "participantsViewCenterYConstraint"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint", v25));
    v31[1] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewBottomConstraint](self, "participantsViewBottomConstraint"));
    v31[2] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewLeadingConstraint](self, "participantsViewLeadingConstraint"));
    v31[3] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTrailingConstraint](self, "participantsViewTrailingConstraint"));
    v31[4] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  }
}

- (void)setUpLayoutGuidesForParticipantsViewController:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  UILayoutGuide *v7;
  UILayoutGuide *leadingSideLayoutGuide;
  UILayoutGuide *v9;
  UILayoutGuide *trailingSideLayoutGuide;
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
  id v28;

  v28 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v4, "callDisplayStyle") != (id)3)
  {
LABEL_7:

    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v6 = objc_msgSend(v5, "isDominoEnabled");

  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));
    if (!self->_leadingSideLayoutGuide && !self->_trailingSideLayoutGuide)
    {
      v7 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
      leadingSideLayoutGuide = self->_leadingSideLayoutGuide;
      self->_leadingSideLayoutGuide = v7;

      v9 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
      trailingSideLayoutGuide = self->_trailingSideLayoutGuide;
      self->_trailingSideLayoutGuide = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController leadingSideLayoutGuide](self, "leadingSideLayoutGuide"));
      objc_msgSend(v11, "addLayoutGuide:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
      objc_msgSend(v13, "addLayoutGuide:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController leadingSideLayoutGuide](self, "leadingSideLayoutGuide"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "safeAreaLayoutGuide"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v19));
      objc_msgSend(v20, "setActive:", 1);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController leadingSideLayoutGuide](self, "leadingSideLayoutGuide"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerXAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
      objc_msgSend(v25, "setActive:", 1);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController leadingSideLayoutGuide](self, "leadingSideLayoutGuide"));
    objc_msgSend(v4, "setLeadingSideLayoutGuide:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
    objc_msgSend(v4, "setTrailingSideLayoutGuide:", v27);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)updateScreenSharingDisableUpdateMask
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  _BYTE v32[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentAudioAndVideoCalls"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "isSharingScreen") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screenSharingInteractionControllerFactory](self, "screenSharingInteractionControllerFactory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sharedController"));
  v12 = objc_msgSend(v11, "remoteControlStatus");

  if (v12 == (id)2)
    v13 = 0;
  else
    v13 = v9;
  v14 = sub_1000C5748();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("NO");
    if ((_DWORD)v13)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    if (v9)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v27 = v16;
    v28 = 2114;
    v29 = v17;
    if (v12 == (id)2)
      v15 = CFSTR("YES");
    v30 = 2114;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Screen sharing audio call view controller shouldHideViewsFromScreenSharing: %{public}@ (isSharingScreenForAnyCall: %{public}@ isUnderRemoteControl: %{public}@)", buf, 0x20u);
  }
  if ((_DWORD)v13)
    v18 = 16;
  else
    v18 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
  objc_msgSend(v20, "setDisableUpdateMask:", v18);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsCoordinator](self, "callDetailsCoordinator"));
  objc_msgSend(v21, "setShouldHideViewsFromScreenSharing:", v13);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHAudioCallViewController;
  -[PHAudioCallViewController viewDidLoad](&v3, "viewDidLoad");
  -[PHAudioCallViewController updateCurrentState](self, "updateCurrentState");
  -[PHAudioCallViewController startTracking](self, "startTracking");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view will appear.", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)PHAudioCallViewController;
  -[PHAudioCallViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  -[PHAudioCallViewController handleViewWillAppear:](self, "handleViewWillAppear:", v3);
}

- (void)handleViewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[PHAudioCallViewController setParticipantsViewControllersShouldIgnoreUpdates:](self, "setParticipantsViewControllersShouldIgnoreUpdates:", 0);
  -[PHAudioCallViewController updateCurrentState](self, "updateCurrentState");
  -[PHAudioCallViewController updateScreenSharingDisableUpdateMask](self, "updateScreenSharingDisableUpdateMask");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v8, "isEnhancedEmergencyEnabled"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      v7 = objc_msgSend(v6, "eedRTTState");

      if (v7 != (id)4)
        return;
      v8 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      objc_msgSend(v8, "transitionToRTTState:", 2);
    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view did appear.", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)PHAudioCallViewController;
  -[PHCallViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  -[PHAudioCallViewController handleViewDidAppear:](self, "handleViewDidAppear:", v3);
}

- (void)handleViewDidAppear:(BOOL)a3
{
  double v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = 0.300000012;
  if (!a3)
    v4 = 0.0;
  -[PHCallViewController setStatusBarHidden:withDuration:](self, "setStatusBarHidden:withDuration:", 0, v4);
  v16 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "provider"));
  if (objc_msgSend(v5, "isFaceTimeProvider"))
  {
    v6 = objc_msgSend(v16, "isVideo");

    if ((v6 & 1) != 0)
      goto LABEL_7;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUTWiFiManager sharedInstance](CUTWiFiManager, "sharedInstance"));
    objc_msgSend(v5, "addWiFiAutoAssociationClientToken:", CFSTR("PHFaceTimeAudioWiFiAssertionKey"));
  }

LABEL_7:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  objc_msgSend(v7, "enteredForegroundForCall:", v16);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "alertCoordinator"));
  v11 = objc_msgSend(v10, "isMonitoring");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "alertCoordinator"));
  v15 = v14;
  if (v11)
    objc_msgSend(v14, "refreshDelegateWithState");
  else
    objc_msgSend(v14, "startMonitoring");

}

- (void)viewDidLayoutSubviews
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHAudioCallViewController;
  -[PHAudioCallViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  v3 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[PHAudioCallViewController canDumpHierarchy](self, "canDumpHierarchy");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
      +[ICSViewEvaluation processHierarchy:](ICSViewEvaluation, "processHierarchy:", v7);

      -[PHAudioCallViewController setCanDumpHierarchy:](self, "setCanDumpHierarchy:", 0);
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view will disappear.", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)PHAudioCallViewController;
  -[PHCallViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  -[PHAudioCallViewController handleViewWillDisappear:](self, "handleViewWillDisappear:", v3);
}

- (void)handleViewWillDisappear:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CUTWiFiManager sharedInstance](CUTWiFiManager, "sharedInstance", a3));
  objc_msgSend(v3, "removeWiFiAutoAssociationClientToken:", CFSTR("PHFaceTimeAudioWiFiAssertionKey"));

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view did disappear.", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)PHAudioCallViewController;
  -[PHCallViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  -[PHAudioCallViewController handleViewDidDisappear:](self, "handleViewDidDisappear:", v3);
  -[PHAudioCallViewController setCanDumpHierarchy:](self, "setCanDumpHierarchy:", 1);
}

- (void)handleViewDidDisappear:(BOOL)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter", a3));
  objc_msgSend(v4, "enteredBackgroundForAllCalls");

  -[PHAudioCallViewController suspendPosterAndCancelDelay:](self, "suspendPosterAndCancelDelay:", 1);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  _BOOL4 v13;

  v4 = a4;
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAudioCallViewController;
  -[PHAudioCallViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, "viewDidMoveToWindow:shouldAppearOrDisappear:", v6, v4);
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController view did move to window %@, shouldAppearOrDisappear %d", buf, 0x12u);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
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
  id v25;
  void *v26;
  void *v27;
  double v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void (**v38)(void);
  uint8_t v39[16];
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)PHAudioCallViewController;
  v4 = a3;
  -[PHAudioCallViewController traitCollectionDidChange:](&v40, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "_backlightLuminance");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "_backlightLuminance");

  if (v5 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "_backlightLuminance");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController traitCollection](self, "traitCollection"));
    v11 = objc_msgSend(v10, "_backlightLuminance");

    if (!v11)
    {
      v12 = sub_1000C5588();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Got trait collection callback saying display was off", v39, 2u);
      }

      -[PHAudioCallViewController suspendPosterAndCancelDelay:](self, "suspendPosterAndCancelDelay:", 1);
    }
    if (v9 == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayDimmingView](self, "alwaysOnDisplayDimmingView"));
      objc_msgSend(v14, "bringSubviewToFront:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
      objc_msgSend(v16, "bringSubviewToFront:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayDimmingView](self, "alwaysOnDisplayDimmingView"));
      objc_msgSend(v19, "setAlpha:", 1.0);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
        objc_msgSend(v22, "setAlpha:", 0.0);

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayPosterNameViewModel](self, "alwaysOnDisplayPosterNameViewModel"));

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v25 = objc_msgSend(v24, "currentCallCount");

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayPosterNameViewModel](self, "alwaysOnDisplayPosterNameViewModel"));
        v27 = v26;
        v28 = 1.0;
        if ((unint64_t)v25 > 1)
          v28 = 0.0;
        objc_msgSend(v26, "updatePosterNameAlpha:", v28);

      }
      if (!-[PHAudioCallViewController videoStreamingIsGoingOn](self, "videoStreamingIsGoingOn"))
        goto LABEL_21;
      v29 = sub_1000C5588();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: pause video if necessary when going to AOD", v39, 2u);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      objc_msgSend(v31, "handleDeviceLockEvent");
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayDimmingView](self, "alwaysOnDisplayDimmingView"));
      objc_msgSend(v32, "setAlpha:", 0.0);

      v33 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
      if (!v33)
        goto LABEL_21;
      v34 = (void *)v33;
      v35 = -[PHAudioCallViewController canShowPosterImage](self, "canShowPosterImage");

      if (!v35)
        goto LABEL_21;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
      objc_msgSend(v36, "setAlpha:", 1.0);

    }
LABEL_21:
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController stateDisplayChangedObservation](self, "stateDisplayChangedObservation"));

    if (v37)
    {
      v38 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController stateDisplayChangedObservation](self, "stateDisplayChangedObservation"));
      v38[2]();

    }
  }
}

- (BOOL)needsDismissalAssertion
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v3 = objc_msgSend(v2, "hasCurrentAudioCalls");

  return v3;
}

+ (id)dismissalAssertionReason
{
  return CFSTR("PHAudioCallViewControllerDismissalAssertionHandlingActiveCall");
}

- (void)releaseDismissalAssertion
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHAudioCallViewController;
  -[PHCallViewController releaseDismissalAssertion](&v2, "releaseDismissalAssertion");
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAudioCallViewControllerDismissalAssertionHandlingCallFailure"));
}

- (void)callIsEmergencyChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  PHAudioCallViewController *v8;
  PHAudioCallViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  PHEnhancedEmergencyCoordinator *v15;
  void *v16;
  int v17;
  PHAudioCallViewController *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (PHAudioCallViewController *)objc_opt_class(self, v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v17 = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v17, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (v11)
  {
    if (-[PHAudioCallViewController shouldUpdateBackgroundForEmergencyCall](self, "shouldUpdateBackgroundForEmergencyCall"))
    {
      -[PHAudioCallViewController updateViewForEmergencyCallIfNecessary](self, "updateViewForEmergencyCallIfNecessary");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));

      if (!v12)
      {
        v13 = sub_1000C5588();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 138412290;
          v18 = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: going to create PHEnhancedEmergencyCoordinator from callIsEmergencyChangedNotification from PHAudioCallViewController: %@", (uint8_t *)&v17, 0xCu);
        }

        v15 = objc_alloc_init(PHEnhancedEmergencyCoordinator);
        -[PHAudioCallViewController setEmergencyCoordinator:](self, "setEmergencyCoordinator:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
        objc_msgSend(v16, "setDelegate:", self);

      }
    }
  }

}

- (void)updateViewForEmergencyCallIfNecessary
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: remove all the possile call UI because we are now in emergency call", v10, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
  if (v5)
    -[PHAudioCallViewController removePosterViewController:completion:](self, "removePosterViewController:completion:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView"));

  if (v6)
    -[PHAudioCallViewController removeBackgroundContactImageView](self, "removeBackgroundContactImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController defaultBackgroundGradientView](self, "defaultBackgroundGradientView"));

  if (v7)
    -[PHAudioCallViewController removeDefaultBackgroundGradientView](self, "removeDefaultBackgroundGradientView");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController unblurredBackgroundImageView](self, "unblurredBackgroundImageView"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController unblurredBackgroundImageView](self, "unblurredBackgroundImageView"));
    objc_msgSend(v9, "removeFromSuperview");

    -[PHAudioCallViewController setUnblurredBackgroundImageView:](self, "setUnblurredBackgroundImageView:", 0);
  }
  -[PHAudioCallViewController updateBackgroundForEmergencyCall](self, "updateBackgroundForEmergencyCall");
  -[PHAudioCallViewController _updateStatusLabelVisibility](self, "_updateStatusLabelVisibility");
}

- (void)wantsHoldMusicChangedNotification:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall", a3));
  v5 = objc_msgSend(v4, "wantsHoldMusic");

  if (v5)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "decline with reminder and decline with message unavailable due to call wanting hold music.", v10, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v8, "setDeclineAndMessageIsAvailable:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v9, "setDeclineAndRemindIsAvailable:", 0);

  }
}

- (void)callCenterScreeningStatusChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v13, 0x16u);

  }
  -[PHAudioCallViewController updateCurrentState](self, "updateCurrentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "singleCallLabelView"));
  objc_msgSend(v12, "updateLabelsOrderAndLayout");

}

- (void)callCenterCallStatusChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  PHAudioCallViewController *v8;
  PHAudioCallViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  PHEnhancedEmergencyCoordinator *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unsigned int v37;
  id v38;
  NSObject *v39;
  PHAudioCallViewController *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  id v47;
  NSObject *v48;
  void *v49;
  unsigned int v50;
  int v51;
  PHAudioCallViewController *v52;
  __int16 v53;
  void *v54;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (PHAudioCallViewController *)objc_opt_class(self, v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v51 = 138412546;
    v52 = v8;
    v53 = 2112;
    v54 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v51, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (!-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
    goto LABEL_12;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "callUUID"));
  if (!v13)
  {
LABEL_11:

    goto LABEL_12;
  }
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "callUUID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "callUUID"));
  if (v15 == (void *)v17)
  {

    goto LABEL_11;
  }
  v18 = (void *)v17;
  v19 = -[PHAudioCallViewController prioritizedCallIsInSameCallGroupAsCall:](self, "prioritizedCallIsInSameCallGroupAsCall:", v11);

  if ((v19 & 1) == 0)
  {
    v20 = sub_1000C5588();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v51) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "callCenterCallStatusChangedNotification - bail since we don't want to choose the call ourselves", (uint8_t *)&v51, 2u);
    }

    -[PHAudioCallViewController refreshUseRTTButton](self, "refreshUseRTTButton");
    -[PHAudioCallViewController _updatePosterStatusLabelForState:](self, "_updatePosterStatusLabelForState:", -[PHCallViewController currentState](self, "currentState"));
    goto LABEL_46;
  }
LABEL_12:
  if (objc_msgSend(v11, "status") == 1)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    if (!objc_msgSend(v22, "isEnhancedEmergencyEnabled"))
    {
LABEL_20:

      goto LABEL_21;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    if (v23)
    {

      goto LABEL_20;
    }
    v24 = objc_msgSend(v11, "isEmergency");

    if (v24)
    {
      v25 = sub_1000C5588();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v51 = 138412290;
        v52 = self;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: going to create PHEnhancedEmergencyCoordinator when call is active from PHAudioCallViewController: %@", (uint8_t *)&v51, 0xCu);
      }

      v27 = objc_alloc_init(PHEnhancedEmergencyCoordinator);
      -[PHAudioCallViewController setEmergencyCoordinator:](self, "setEmergencyCoordinator:", v27);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      objc_msgSend(v22, "setDelegate:", self);
      goto LABEL_20;
    }
  }
LABEL_21:
  if (objc_msgSend(v11, "status") == 6)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "delegate"));
    objc_msgSend(v29, "setMostRecentlyDisconnectedAudioCall:", v11);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    if ((objc_msgSend(v11, "isVideo") & 1) == 0
      && objc_msgSend(v11, "disconnectedReason") == 6)
    {
      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        v32 = objc_msgSend(v31, "currentState");

        if (v32 == (id)7)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController analyticsReporter](self, "analyticsReporter"));
          objc_msgSend(v33, "reportMultipleCallsWaitingUIAction:", 0);

        }
      }
    }
    -[PHAudioCallViewController writeToLastSeenPosterCacheIfNecessaryForCall:](self, "writeToLastSeenPosterCacheIfNecessaryForCall:", v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    if ((objc_msgSend(v34, "isEnhancedEmergencyEnabled") & 1) != 0
      && (v35 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"))) != 0)
    {
      v36 = (void *)v35;
      v37 = objc_msgSend(v11, "isEmergency");

      if (v37)
      {
        v38 = sub_1000C5588();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = (PHAudioCallViewController *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
          v51 = 138412290;
          v52 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: clean emergencyCoordinator: %@", (uint8_t *)&v51, 0xCu);

        }
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
        objc_msgSend(v41, "cleanUpViewAndObjectWhenCallEnds");

        -[PHAudioCallViewController setEmergencyCoordinator:](self, "setEmergencyCoordinator:", 0);
      }
    }
    else
    {

    }
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    objc_msgSend(v43, "setTuCall:", v11);

  }
  -[PHAudioCallViewController updateViewsForHeldCallControlsViewIfNeeded](self, "updateViewsForHeldCallControlsViewIfNeeded");
  -[PHAudioCallViewController updateCurrentState](self, "updateCurrentState");
  -[PHAudioCallViewController refreshUseRTTButton](self, "refreshUseRTTButton");
  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
    -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v44, 1, 0);

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v46 = objc_msgSend(v45, "autoPunchOutBehaviorRequiredForCurrentCalls");

  if (v46)
  {
    v47 = sub_1000C5588();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v51) = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Punch-out requested for current calls", (uint8_t *)&v51, 2u);
    }

    -[PHAudioCallViewController setParticipantsViewControllersShouldIgnoreUpdates:](self, "setParticipantsViewControllersShouldIgnoreUpdates:", 1);
    -[PHCallViewController punchOutToVoIPApplicationForCurrentCall](self, "punchOutToVoIPApplicationForCurrentCall");
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v50 = objc_msgSend(v49, "shouldActivateProviderInBackgroundForCall:", v11);

    if (v50)
      -[PHCallViewController activateProviderInBackgroundForCall:](self, "activateProviderInBackgroundForCall:", v11);
    else
      -[PHAudioCallViewController setParticipantsViewControllersShouldIgnoreUpdates:](self, "setParticipantsViewControllersShouldIgnoreUpdates:", 0);
  }
LABEL_46:

}

- (void)callContinuityStateChangedNotification:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callContinuityStateChangedNotification: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAudioCallViewController updateCurrentState](self, "updateCurrentState");
}

- (void)hardPauseDigitsStateChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "hardPauseDigitsStateChangedNotification: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v7, "refreshCustomizedActionTypeTitles");

  -[PHAudioCallViewController updateHardPauseDigitsState](self, "updateHardPauseDigitsState");
  -[PHAudioCallViewController refreshExtensionNumberButton](self, "refreshExtensionNumberButton");

}

- (void)callOnHoldChangedNotification:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar", a3));
  objc_msgSend(v3, "refreshEndCallButton");

}

- (void)handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v11, 0x16u);

  }
  -[PHAudioCallViewController refreshUseRTTButton](self, "refreshUseRTTButton");

}

- (void)handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  UIViewController *screeningViewController;
  void *v20;
  id v21;
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
  int v34;
  void *v35;
  __int16 v36;
  void *v37;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v34 = 138412546;
    v35 = v8;
    v36 = 2112;
    v37 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v34, 0x16u);

  }
  -[PHAudioCallViewController refreshUseRTTButton](self, "refreshUseRTTButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v11, "isEnhancedEmergencyEnabled"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "frontmostCall"));
    v14 = objc_msgSend(v13, "isEmergency");

    if (!v14)
      goto LABEL_7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "frontmostCall"));
    objc_msgSend(v11, "updateRTTEnabled:", objc_msgSend(v16, "isRTT"));

  }
LABEL_7:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](self, "featureFlags"));
  v18 = TUCallScreeningRTTEnabled();

  if (v18)
  {
    if (-[PHAudioCallViewController middleViewState](self, "middleViewState") == 4)
    {
      -[PHAudioCallViewController setMiddleViewState:](self, "setMiddleViewState:", 0);
      screeningViewController = self->_screeningViewController;
      self->_screeningViewController = 0;

      -[PHAudioCallViewController setMiddleViewState:](self, "setMiddleViewState:", 4);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    v21 = objc_msgSend(v20, "currentState");

    if (v21 == (id)23)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
      objc_msgSend(v22, "setCurrentState:", 27);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
      objc_msgSend(v23, "setCurrentState:", 23);

    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "delegate"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "currentInCallScene"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "delegate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentInCallScene"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "delegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "delegate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "currentInCallScene"));
    objc_msgSend(v30, "updateSceneBackgroundMaterialWith:", v33);

  }
}

- (void)callIsScreenSharingChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class(self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v10, 0x16u);

  }
  -[PHAudioCallViewController updateScreenSharingDisableUpdateMask](self, "updateScreenSharingDisableUpdateMask");

}

- (void)callKeypadDataSourceChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class(self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@, we are going to hide the name on keypad", (uint8_t *)&v10, 0x16u);

  }
  -[PHAudioCallViewController hideFirstNameLabelOnKeypad](self, "hideFirstNameLabelOnKeypad");
  -[PHAudioCallViewController setHasKeypadUpdated:](self, "setHasKeypadUpdated:", 1);

}

- (void)callDisplayContextChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class(self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v11, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  -[PHAudioCallViewController updateBottomBarButtonsWithCall:](self, "updateBottomBarButtonsWithCall:", v10);

}

- (void)refreshCallDetailsViewButton
{
  -[PHAudioCallViewController setShowsCallDetailsViewButton:](self, "setShowsCallDetailsViewButton:", -[PHAudioCallViewController shouldShowCallDetailsViewButton](self, "shouldShowCallDetailsViewButton"));
}

- (void)setShowsCallDetailsViewButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  v6 = v5;
  if (v3)
  {

    if (!v6)
      -[PHAudioCallViewController setUpCallDetailsViewButton](self, "setUpCallDetailsViewButton");
  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

    -[PHAudioCallViewController setCallDetailsViewButton:](self, "setCallDetailsViewButton:", 0);
  }
}

- (void)setUpCallDetailsViewButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 4));
  -[PHAudioCallViewController setCallDetailsViewButton:](self, "setCallDetailsViewButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v4, "addTarget:action:forEvents:", self, "callDetailsViewButtonTapped", 64);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v6, "addSubview:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v9, "setTintColor:", v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  -[PHAudioCallViewController applyCallDetailsViewButtonPositionAndSizeCapToElement:](self, "applyCallDetailsViewButtonPositionAndSizeCapToElement:", v10);

}

- (double)callDetailsButtonPaddingTop
{
  void *v3;
  double v4;

  +[TPIncomingCallMetricsProvider fullDeviceHeight](TPIncomingCallMetricsProvider, "fullDeviceHeight");
  -[PHAudioCallViewController callDetailsButtonPaddingTop_PERCENT](self, "callDetailsButtonPaddingTop_PERCENT");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v4 = UIRoundToViewScale(v3);

  return v4;
}

- (double)callDetailsButtonPaddingTrailing
{
  void *v3;
  double v4;

  +[TPIncomingCallMetricsProvider fullDeviceWidth](TPIncomingCallMetricsProvider, "fullDeviceWidth");
  -[PHAudioCallViewController callDetailsButtonPaddingTrailing_PERCENT](self, "callDetailsButtonPaddingTrailing_PERCENT");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v4 = UIRoundToViewScale(v3);

  return v4;
}

- (double)callDetailsButtonPaddingTop_PERCENT
{
  void *v3;
  unsigned int v4;
  double result;

  if ((+[TPIncomingCallMetricsProvider deviceHasHomeButton](TPIncomingCallMetricsProvider, "deviceHasHomeButton") & 1) != 0)
  {
    +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTopPercent_HomeButton](TPIncomingCallMetricsProvider, "callDetailsButtonPaddingTopPercent_HomeButton");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v4 = objc_msgSend(v3, "isSystemApertureEnabled");

    if (v4)
      +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTopPercent_DynamicIsland](TPIncomingCallMetricsProvider, "callDetailsButtonPaddingTopPercent_DynamicIsland");
    else
      +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTopPercent_Notch](TPIncomingCallMetricsProvider, "callDetailsButtonPaddingTopPercent_Notch");
  }
  return result;
}

- (double)callDetailsButtonPaddingTrailing_PERCENT
{
  void *v3;
  unsigned int v4;
  double result;

  if ((+[TPIncomingCallMetricsProvider deviceHasHomeButton](TPIncomingCallMetricsProvider, "deviceHasHomeButton") & 1) != 0)
  {
    +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTrailingPercent_HomeButton](TPIncomingCallMetricsProvider, "callDetailsButtonPaddingTrailingPercent_HomeButton");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v4 = objc_msgSend(v3, "isSystemApertureEnabled");

    if (v4)
      +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTrailingPercent_DynamicIsland](TPIncomingCallMetricsProvider, "callDetailsButtonPaddingTrailingPercent_DynamicIsland");
    else
      +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTrailingPercent_Notch](TPIncomingCallMetricsProvider, "callDetailsButtonPaddingTrailingPercent_Notch");
  }
  return result;
}

- (void)updateParticipantConstraintsForPosterName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v5 = objc_msgSend(v4, "callDisplayStyle");

  if (v5)
  {
    if (-[PHAudioCallViewController participantsViewIsShowingMultipleLabel](self, "participantsViewIsShowingMultipleLabel"))
    {
LABEL_7:
      -[PHAudioCallViewController restoreParticipantsViewStatusLabelForFullScreen](self, "restoreParticipantsViewStatusLabelForFullScreen");
      goto LABEL_8;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel"));
    if (v6)
    {

      goto LABEL_7;
    }
    if (!-[PHAudioCallViewController callHasContactPosterWithVerticalName](self, "callHasContactPosterWithVerticalName"))goto LABEL_7;
    -[PHAudioCallViewController positionParticipantsViewStatusLabelToBeHorizontallyCenteredToInfoButton:](self, "positionParticipantsViewStatusLabelToBeHorizontallyCenteredToInfoButton:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TPIncomingCallMetricsProvider callDetailsButtonMaxSize](TPIncomingCallMetricsProvider, "callDetailsButtonMaxSize"));
    objc_msgSend(v7, "setMaximumContentSizeCategory:", v8);

  }
LABEL_8:

}

- (void)restoreParticipantsViewStatusLabelForFullScreen
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;

  v3 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewVerticalPosterNameTopConstraint](self, "participantsViewVerticalPosterNameTopConstraint"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewVerticalPosterNameTopConstraint](self, "participantsViewVerticalPosterNameTopConstraint"));
    v6 = objc_msgSend(v5, "isActive");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewVerticalPosterNameTopConstraint](self, "participantsViewVerticalPosterNameTopConstraint"));
      objc_msgSend(v7, "setActive:", 0);

      -[PHAudioCallViewController setParticipantsViewVerticalPosterNameTopConstraint:](self, "setParticipantsViewVerticalPosterNameTopConstraint:", 0);
    }
  }
  v8 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
    v11 = objc_msgSend(v10, "isActive");

    if ((v11 & 1) == 0)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
      objc_msgSend(v12, "setActive:", 1);

    }
  }
}

- (void)positionParticipantsViewStatusLabelToBeHorizontallyCenteredToInfoButton:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
    objc_msgSend(v16, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewCenterYConstraint](self, "participantsViewCenterYConstraint"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewCenterYConstraint](self, "participantsViewCenterYConstraint"));
    objc_msgSend(v16, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewVerticalPosterNameTopConstraint](self, "participantsViewVerticalPosterNameTopConstraint"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewVerticalPosterNameTopConstraint](self, "participantsViewVerticalPosterNameTopConstraint"));
    objc_msgSend(v16, "addObject:", v10);

  }
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  -[PHAudioCallViewController callDetailsButtonPaddingTop](self, "callDetailsButtonPaddingTop");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13));
  -[PHAudioCallViewController setParticipantsViewVerticalPosterNameTopConstraint:](self, "setParticipantsViewVerticalPosterNameTopConstraint:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewVerticalPosterNameTopConstraint](self, "participantsViewVerticalPosterNameTopConstraint"));
  objc_msgSend(v15, "setActive:", 1);

}

- (void)positionPosterBadgeToBeHorizontallyCenteredToInfoButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  -[PHAudioCallViewController callDetailsButtonPaddingTrailing](self, "callDetailsButtonPaddingTrailing");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7));
  v15[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  -[PHAudioCallViewController callDetailsButtonPaddingTop](self, "callDetailsButtonPaddingTop");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, v12 + 6.0));
  v15[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)applySizeToElement:(id)a3 usingThisElementAsGuide:(id)a4
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
  void *v15;
  _QWORD v16[2];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 0.0));
    v16[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 0.0));
    v16[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maximumContentSizeCategory"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maximumContentSizeCategory"));
      objc_msgSend(v5, "setMaximumContentSizeCategory:", v15);

    }
  }

}

- (void)applyCallDetailsViewButtonPositionAndSizeCapToElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  -[PHAudioCallViewController callDetailsButtonPaddingTop](self, "callDetailsButtonPaddingTop");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7));
  v16[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  -[PHAudioCallViewController callDetailsButtonPaddingTrailing](self, "callDetailsButtonPaddingTrailing");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -v12));
  v16[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TPIncomingCallMetricsProvider callDetailsButtonMaxSize](TPIncomingCallMetricsProvider, "callDetailsButtonMaxSize"));
  objc_msgSend(v4, "setMaximumContentSizeCategory:", v15);

}

- (BOOL)shouldShowCallDetailsViewButton
{
  id v2;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
    goto LABEL_2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v4, "callDisplayStyle") != (id)3)
  {
    v9 = 0;
LABEL_19:

    return v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v2 = objc_msgSend(v10, "isDominoEnabled");

  if ((_DWORD)v2)
  {
LABEL_2:
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
    v6 = objc_msgSend(v5, "isFaceTimeProvider");
    if ((v6 & 1) != 0
      || (v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider")),
          objc_msgSend(v2, "isTelephonyProvider")))
    {
      if (((objc_msgSend(v4, "isActive") & 1) != 0 || objc_msgSend(v4, "isOnHold"))
        && (objc_msgSend(v4, "isVideo") & 1) == 0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        if (objc_msgSend(v7, "callDisplayStyle"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
          v9 = objc_msgSend(v8, "callDisplayStyle") != (id)3;

          if ((v6 & 1) != 0)
            goto LABEL_18;
          goto LABEL_17;
        }

      }
      v9 = 0;
      if ((v6 & 1) != 0)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v9 = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  return 0;
}

- (void)callDetailsViewButtonTapped
{
  void *v3;
  PHConferenceParticipantsViewController *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _QWORD *v12;
  void *v13;
  void ***v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, int);
  void *v19;
  id v20;
  id location;
  _QWORD v22[4];
  id v23;
  PHAudioCallViewController *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  if (-[PHAudioCallViewController shouldShowConferenceCallDetails](self, "shouldShowConferenceCallDetails"))
  {
    v4 = objc_alloc_init(PHConferenceParticipantsViewController);
    v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "dismissNavigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController navigationItem](v4, "navigationItem"));
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);

    -[PHAudioCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
    v11 = objc_msgSend(v10, "isTelephonyProvider");

    if (v11)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000CD8A4;
      v22[3] = &unk_100284DF0;
      v23 = v3;
      v24 = self;
      v12 = objc_retainBlock(v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
      objc_msgSend(v13, "requestPasscodeUnlockWithCompletion:", v12);

    }
    else
    {
      objc_initWeak(&location, self);
      v16 = _NSConcreteStackBlock;
      v17 = 3221225472;
      v18 = sub_1000CDBD8;
      v19 = &unk_100284F60;
      objc_copyWeak(&v20, &location);
      v14 = objc_retainBlock(&v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance", v16, v17, v18, v19));
      objc_msgSend(v15, "requestPasscodeUnlockWithCompletion:", v14);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

}

- (void)contactViewController:(id)a3 didExecuteBlockAndReportContactAction:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController activeCall](self, "activeCall", a3, a4));
  -[PHAudioCallViewController reportWithCall:](self, "reportWithCall:", v5);

}

- (BOOL)shouldShowConferenceCallDetails
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v6 = objc_opt_class(PHCallParticipantsView, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) == 0)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
  v10 = objc_msgSend(v9, "shouldShowInfoButtonForParticipantAtIndex:inParticipantsView:", 0, v8);

  return v10;
}

- (BOOL)canDoInfoButtonCoinFlipWith:(id)a3 contactStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("PHInCallUIInfoButtonCoinFlipKey"));

  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)CNSharedProfileStateOracle), "initWithContact:contactStore:", v5, v6);
    v10 = objc_msgSend(v9, "avatarViewAnimationTypeForEffectiveState") == (id)1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)animateInfoButtonCoinFlipIfNeeded
{
  void *v2;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  _TtC13InCallService19BlurrableAvatarView *v41;
  void *v42;
  _TtC13InCallService19BlurrableAvatarView *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  _TtC13InCallService19BlurrableAvatarView *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  _QWORD block[4];
  id v59;
  _TtC13InCallService19BlurrableAvatarView *v60;
  id v61;
  PHAudioCallViewController *v62;
  id v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;

  v4 = -[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout");
  if ((v4 & 1) == 0)
  {
    v56 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v56, "callDisplayStyle") != (id)3)
    {
LABEL_19:

      return;
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    if ((objc_msgSend(v2, "isDominoEnabled") & 1) == 0)
    {
LABEL_18:

      goto LABEL_19;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (!objc_msgSend(v5, "isNameAndPhotoC3Enabled"))
  {

    if ((v4 & 1) != 0)
      return;
    goto LABEL_18;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));

  if (!v4)
  {

  }
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactIdentifier"));

    if (!v8)
    {
LABEL_34:

      return;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v7));
    v10 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController contactKeysToFetch](PHAudioCallViewController, "contactKeysToFetch"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactForIdentifier:keysToFetch:usingCache:", v11, v12, v13));

    if (!v14
      || !-[PHAudioCallViewController canDoInfoButtonCoinFlipWith:contactStore:](self, "canDoInfoButtonCoinFlipWith:contactStore:", v14, v10))
    {
LABEL_33:

      goto LABEL_34;
    }
    v15 = objc_msgSend(objc_alloc((Class)CNSharedProfileStateOracle), "initWithContact:contactStore:", v14, v10);
    v16 = +[CNSharedProfileStateOracle contactIsInAutoUpdateState:](CNSharedProfileStateOracle, "contactIsInAutoUpdateState:", v14);
    v17 = sub_1000C5588();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentNickname"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageData"));
        *(_DWORD *)buf = 138412546;
        v66 = v20;
        v67 = 2112;
        v68 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SNAP: animateInfoButtonCoinFlipIfNeeded using currentNickname %@ contact.imageData: %@", buf, 0x16u);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentNickname"));

      v23 = objc_alloc((Class)CNSharedProfile);
      v24 = v23;
      if (!v22)
      {
        v28 = objc_msgSend(v23, "initWithContact:", v14);
        goto LABEL_24;
      }
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentNickname"));
    }
    else
    {
      if (v19)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pendingNickname"));
        *(_DWORD *)buf = 138412290;
        v66 = v26;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SNAP: animateInfoButtonCoinFlipIfNeeded using pendingNickname %@", buf, 0xCu);

      }
      v24 = objc_alloc((Class)CNSharedProfile);
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pendingNickname"));
    }
    v27 = (void *)v25;
    v28 = objc_msgSend(v24, "initWithNickname:", v25);

LABEL_24:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
    objc_msgSend(v29, "setAlpha:", 0.0);

    v30 = objc_alloc_init((Class)UIView);
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    objc_msgSend(v31, "addSubview:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pendingNickname"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "avatar"));

    v57 = v15;
    v54 = v33;
    if (+[SensitivityFeatureFlags isSensitivityAvatarTreatmentEnabled](_TtC13InCallService23SensitivityFeatureFlags, "isSensitivityAvatarTreatmentEnabled"))
    {
      v34 = objc_msgSend(v33, "contentIsSensitive");
      v35 = sub_1000C5588();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v66) = v34;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for infoButton peekaboo returning %d", buf, 8u);
      }
    }
    else
    {
      v37 = sub_1000C5588();
      v36 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for infoButton peekaboo not performing check", buf, 2u);
      }
      v34 = 0;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
    v39 = objc_msgSend(v38, "forceBlurNewPoster");

    v40 = v39 | v34;
    v41 = [_TtC13InCallService19BlurrableAvatarView alloc];
    v55 = v28;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contact"));
    v43 = -[BlurrableAvatarView initWithContact:wantsBlur:isCommunicationSafetyEnabled:](v41, "initWithContact:wantsBlur:isCommunicationSafetyEnabled:", v42, v40, +[SensitivityFeatureFlags isCommunicationSafetyEnabled](_TtC13InCallService23SensitivityFeatureFlags, "isCommunicationSafetyEnabled"));

    -[BlurrableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v30, "addSubview:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 4));
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v30, "addSubview:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v44, "setTintColor:", v45);

    -[PHAudioCallViewController applyCallDetailsViewButtonPositionAndSizeCapToElement:](self, "applyCallDetailsViewButtonPositionAndSizeCapToElement:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTitleStyleAttributes](self, "wallpaperTitleStyleAttributes"));
    v47 = v46;
    if (v46)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "titleColor"));
      objc_msgSend(v44, "setTintColor:", v48);

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[TPIncomingCallMetricsProvider callDetailsButtonMaxSize](TPIncomingCallMetricsProvider, "callDetailsButtonMaxSize"));
    -[BlurrableAvatarView setMaximumContentSizeCategory:](v43, "setMaximumContentSizeCategory:", v49);

    -[PHAudioCallViewController applySizeToElement:usingThisElementAsGuide:](self, "applySizeToElement:usingThisElementAsGuide:", v43, v44);
    -[PHAudioCallViewController applySizeToElement:usingThisElementAsGuide:](self, "applySizeToElement:usingThisElementAsGuide:", v30, v44);
    -[PHAudioCallViewController applyCallDetailsViewButtonPositionAndSizeCapToElement:](self, "applyCallDetailsViewButtonPositionAndSizeCapToElement:", v30);
    -[PHAudioCallViewController applyCallDetailsViewButtonPositionAndSizeCapToElement:](self, "applyCallDetailsViewButtonPositionAndSizeCapToElement:", v43);
    -[BlurrableAvatarView setAlpha:](v43, "setAlpha:", 0.0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CE4B8;
    block[3] = &unk_100287900;
    v59 = v30;
    v60 = v43;
    v61 = v44;
    v62 = self;
    v63 = v14;
    v64 = v57;
    v50 = v57;
    v51 = v44;
    v52 = v43;
    v53 = v30;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_33;
  }
}

- (void)triggerInversionColorUpdate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id buf[2];

  v4 = a3;
  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout")
    && !-[PHAudioCallViewController hasInvertedUIElementColorsBasedOnPoster](self, "hasInvertedUIElementColorsBasedOnPoster"))
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SNAP: We are going to update inversion color based on new configuration", (uint8_t *)buf, 2u);
    }

    v7 = objc_msgSend(objc_alloc((Class)TPInComingCallUISnapshotViewController), "initWithConfiguration:style:nameString:", v4, 0, &stru_10028DC20);
    objc_initWeak(buf, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000CEAD4;
    v11[3] = &unk_100287928;
    objc_copyWeak(&v12, buf);
    objc_msgSend(v7, "snapshotWithOptions:windowScene:completionBlock:", 0, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);

  }
}

- (void)invertNecessaryUIElementsBasedOnPosterImage:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[PHAudioCallViewController hasInvertedUIElementColorsBasedOnPoster](self, "hasInvertedUIElementColorsBasedOnPoster"))
  {
    -[PHAudioCallViewController invertColorForBottomButtonsBasedOn:](self, "invertColorForBottomButtonsBasedOn:", v4);
    -[PHAudioCallViewController invertColorForCallDetailsButtonBasedOn:](self, "invertColorForCallDetailsButtonBasedOn:", v4);
    -[PHAudioCallViewController invertColorForPosterBadgeViewBasedOn:](self, "invertColorForPosterBadgeViewBasedOn:", v4);
  }

}

+ (void)fetchPrefersWhiteColorAtCropRect:(CGRect)a3 image:(id)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v10)(id, _BOOL8, _QWORD);
  CGImage *v11;
  CGImageRef v12;
  CGImage *v13;
  _BOOL8 v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void (**)(id, _BOOL8, _QWORD))a5;
  v11 = +[PHAudioCallViewController imageRefFrom:](PHAudioCallViewController, "imageRefFrom:", a4);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v12 = CGImageCreateWithImageInRect(v11, v21);
  if (v12)
  {
    v13 = v12;
    v14 = +[PHAudioCallViewController prefersWhiteTextOnImageRef:](PHAudioCallViewController, "prefersWhiteTextOnImageRef:", v12);
    CGImageRelease(v13);
    v10[2](v10, v14, 0);
  }
  else
  {
    v15 = sub_1000C5588();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1001AA968();

    v19 = NSLocalizedFailureReasonErrorKey;
    v20 = CFSTR("SNAP: croppedImageRef for snapshot is nil, can't invert the color");
    v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.incallservice"), -1, v17));
    ((void (**)(id, _BOOL8, void *))v10)[2](v10, 0, v18);

    v10 = (void (**)(id, _BOOL8, _QWORD))v17;
  }

}

- (void)invertColorForBottomButtonsBasedOn:(id)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v4, "scale");
  v11 = v10 * (v7 * 0.1);
  objc_msgSend(v4, "scale");
  v13 = v9 * 0.6 * v12;
  objc_msgSend(v4, "scale");
  v15 = v7 * 0.8 * v14;
  objc_msgSend(v4, "scale");
  v17 = v9 * 0.3 * v16;
  objc_opt_class(self, v18);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000CEED0;
  v20[3] = &unk_100285E50;
  v20[4] = self;
  objc_msgSend(v19, "fetchPrefersWhiteColorAtCropRect:image:completion:", v4, v20, v11, v13, v15, v17);

}

- (void)invertColorForCallDetailsButtonBasedOn:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  _QWORD v27[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v5, "origin");
  v7 = v6;
  objc_msgSend(v4, "scale");
  v9 = v7 * v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v10, "origin");
  v12 = v11;
  objc_msgSend(v4, "scale");
  v14 = v12 * v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v15, "frame");
  v17 = v16;
  objc_msgSend(v4, "scale");
  v19 = v18 * v17;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v20, "frame");
  v22 = v21;
  objc_msgSend(v4, "scale");
  v24 = v23 * v22;

  objc_opt_class(self, v25);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000CF11C;
  v27[3] = &unk_100285E50;
  v27[4] = self;
  objc_msgSend(v26, "fetchPrefersWhiteColorAtCropRect:image:completion:", v4, v27, v9, v14, v19, v24);

}

- (void)invertColorForPosterBadgeViewBasedOn:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
    objc_opt_class(TPBadgeView, v8);
    isKindOfClass = objc_opt_isKindOfClass(v7, v9);

    if ((isKindOfClass & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
      objc_msgSend(v12, "origin");
      v14 = v13;
      objc_msgSend(v4, "scale");
      v16 = v14 * v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
      objc_msgSend(v17, "origin");
      v19 = v18;
      objc_msgSend(v4, "scale");
      v21 = v19 * v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
      objc_msgSend(v22, "frame");
      v24 = v23;
      objc_msgSend(v4, "scale");
      v26 = v25 * v24;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
      objc_msgSend(v27, "frame");
      v29 = v28;
      objc_msgSend(v4, "scale");
      v31 = v30 * v29;

      objc_opt_class(self, v32);
      v34 = v33;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000CF3EC;
      v36[3] = &unk_100287640;
      v36[4] = self;
      v37 = v11;
      v35 = v11;
      objc_msgSend(v34, "fetchPrefersWhiteColorAtCropRect:image:completion:", v4, v36, v16, v21, v26, v31);

    }
  }

}

+ (BOOL)prefersWhiteTextOnImageRef:(CGImage *)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNImageDerivedColorGenerator colorsForImageRef:](CNImageDerivedColorGenerator, "colorsForImageRef:", a3));
  v4 = +[CNImageDerivedColorBackgroundUtilities backgroundColorsPreferWhiteForegroundText:](CNImageDerivedColorBackgroundUtilities, "backgroundColorsPreferWhiteForegroundText:", v3);

  return v4;
}

+ (CGImage)imageRefFrom:(id)a3
{
  id v3;
  CGImage *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGColorSpace *DeviceRGB;
  CGContext *v10;
  CGImageRef Image;
  CGImage *v12;
  CGRect v14;

  v3 = a3;
  if (objc_msgSend(v3, "ioSurface"))
  {
    v4 = (CGImage *)UICreateCGImageFromIOSurface();
    objc_msgSend(v3, "size");
    v6 = v5;
    objc_msgSend(v3, "size");
    v8 = v7;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v10 = CGBitmapContextCreate(0, (unint64_t)v6, (unint64_t)v8, 8uLL, vcvtd_n_u64_f64(v6, 2uLL), DeviceRGB, 1u);
    v14.origin.x = 0.0;
    v14.origin.y = 0.0;
    v14.size.width = v6;
    v14.size.height = v8;
    CGContextDrawImage(v10, v14, v4);
    Image = CGBitmapContextCreateImage(v10);
    v12 = Image;
    if (Image)
      CFAutorelease(Image);
    if (v4)
      CFRelease(v4);
    CGColorSpaceRelease(DeviceRGB);
    if (v10)
      CFRelease(v10);
  }
  else
  {
    v12 = (CGImage *)objc_msgSend(objc_retainAutorelease(v3), "CGImage");
  }

  return v12;
}

- (void)useRTTButtonTapped
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  objc_msgSend(v3, "setTTYType:forCall:", 1, v4);

}

- (void)extensionNumberButtonTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  objc_msgSend(v2, "sendHardPauseDigits");

}

- (void)callTransferButtonTapped
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = objc_alloc_init((Class)TUCallProviderManager);
  v3 = objc_alloc((Class)TUDialRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "telephonyProvider"));
  v5 = objc_msgSend(v3, "initWithProvider:", v4);

  v6 = objc_msgSend(objc_alloc((Class)TUHandle), "initWithType:value:", 2, CFSTR("4"));
  objc_msgSend(v5, "setHandle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v8 = objc_msgSend(v7, "dialWithRequest:", v5);

}

- (BOOL)shouldAddRTTButtonToViewHierarchy
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[PHAudioCallViewController shouldShowUseRTT](self, "shouldShowUseRTT"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v3, "isButtonLayoutEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v4, "callDisplayStyle") == (id)3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v6 = (objc_msgSend(v5, "isDominoEnabled") & 1) == 0 && self->_middleViewState == 1;

    }
    else
    {
      v6 = self->_middleViewState == 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)refreshUseRTTButton
{
  id v3;

  -[PHAudioCallViewController updateLayoutSupplementalButtons](self, "updateLayoutSupplementalButtons");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v3, "refreshUseRTTButton");

}

- (BOOL)shouldAddExtensionNumberButtonToViewHierarchy
{
  void *v2;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v4, "isButtonLayoutEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v6 = objc_msgSend(v5, "callDisplayStyle");
    if (v6 == (id)3)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      if ((objc_msgSend(v2, "isDominoEnabled") & 1) != 0 || self->_middleViewState != 1)
      {
        v7 = 0;
        goto LABEL_9;
      }
    }
    else if (self->_middleViewState != 1)
    {
      v7 = 0;
      goto LABEL_11;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    v7 = objc_msgSend(v8, "hardPauseDigitsState") == 2;

    if (v6 != (id)3)
    {
LABEL_11:

      goto LABEL_12;
    }
LABEL_9:

    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (void)refreshExtensionNumberButton
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController customizedTitleForItemInBar:withActionType:](self, "customizedTitleForItemInBar:withActionType:", v3, 22));

  -[PHAudioCallControlsSupplementalButton setTitle:forState:](self->_extensionNumberButton, "setTitle:forState:", v4, 0);
  -[PHAudioCallViewController updateLayoutSupplementalButtons](self, "updateLayoutSupplementalButtons");

}

- (void)updateLayoutSupplementalButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
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
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callTransferButton](self, "callTransferButton"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController extensionNumberButton](self, "extensionNumberButton"));
  objc_msgSend(v4, "removeFromSuperview");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController useRTTButton](self, "useRTTButton"));
  objc_msgSend(v5, "removeFromSuperview");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[PHAudioCallViewController middleViewState](self, "middleViewState");

    if (v10 == 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v11, "bounds");
      v13 = v12;
      v15 = v14;

      if (v13 >= v15)
        v13 = v15;
      v16 = objc_alloc_init((Class)NSMutableArray);
      if (-[PHAudioCallViewController shouldShowCallTransfer](self, "shouldShowCallTransfer"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callTransferButton](self, "callTransferButton"));
        objc_msgSend(v16, "addObject:", v17);

      }
      if (-[PHAudioCallViewController shouldAddExtensionNumberButtonToViewHierarchy](self, "shouldAddExtensionNumberButtonToViewHierarchy"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController extensionNumberButton](self, "extensionNumberButton"));
        objc_msgSend(v16, "addObject:", v18);

      }
      if (-[PHAudioCallViewController shouldAddRTTButtonToViewHierarchy](self, "shouldAddRTTButtonToViewHierarchy"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController useRTTButton](self, "useRTTButton"));
        objc_msgSend(v16, "addObject:", v19);

      }
      v20 = v13 * 0.102;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1000CFEAC;
      v46[3] = &unk_100287950;
      v46[4] = self;
      v21 = v7;
      v47 = v21;
      objc_msgSend(v16, "__imForEach:", v46);
      if (objc_msgSend(v16, "count") == (id)3)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
        v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, v20));
        v49[0] = v40;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 1));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerXAnchor"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerXAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
        v49[1] = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 2));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -v20));
        v49[2] = v28;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 3));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

        v30 = (void *)v40;
        v31 = (void *)v44;

        v32 = v43;
        v33 = v42;

      }
      else if (objc_msgSend(v16, "count") == (id)2)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
        v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v45, v20));
        v48[0] = v34;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 1));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -v20));
        v48[1] = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 2));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

        v30 = (void *)v34;
        v31 = (void *)v45;
      }
      else
      {
        if (objc_msgSend(v16, "count") != (id)1)
        {
LABEL_18:

          goto LABEL_19;
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerXAnchor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerXAnchor"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v31));
        objc_msgSend(v30, "setActive:", 1);
      }

      goto LABEL_18;
    }
  }
LABEL_19:

}

- (void)dismissNavigationController
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController navigationController](self, "navigationController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)updateCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  unsigned int v29;
  PHAudioCallViewController *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  unsigned int v35;
  id v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  char *v46;
  void *v47;
  char *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  void *v60;
  unsigned __int8 v61;
  void *v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  unsigned int v74;
  unsigned int v75;
  id v76;
  NSObject *v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  id v82;
  NSObject *v83;
  _BOOL4 v84;
  uint64_t v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  uint64_t v89;
  void *v90;
  void *v91;
  unsigned __int8 v92;
  id v93;
  NSObject *v94;
  id v95;
  NSObject *v96;
  PHAudioCallViewController *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  NSObject *v101;
  _BOOL4 v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  unsigned int v108;
  unsigned int v109;
  id v110;
  NSObject *v111;
  void *v112;
  id v113;
  id v114;
  NSObject *v115;
  _BOOL4 v116;
  void *v117;
  id v118;
  id v119;
  NSObject *v120;
  const char *v121;
  void *v122;
  id v123;
  id v124;
  PHAudioCallViewController *v125;
  uint64_t v126;
  id v127;
  id v128;
  NSObject *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  unsigned int v134;
  id v135;
  NSObject *v136;
  id v137;
  NSObject *v138;
  _BYTE v139[14];
  __int16 v140;
  unsigned int v141;
  __int16 v142;
  unsigned int v143;
  __int16 v144;
  unsigned int v145;

  -[PHAudioCallViewController refreshCallDetailsViewButton](self, "refreshCallDetailsViewButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentCallGroups"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v5, "callDisplayStyle"))
    goto LABEL_4;
  v6 = -[PHAudioCallViewController _isScreeningAnyCallGroup:](self, "_isScreeningAnyCallGroup:", v4);

  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentInCallScene"));
    objc_msgSend(v8, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:", 0, 0, CFSTR("SBSUIInCallTransitionAnalyticsSourceCallScreeningBegin"));

LABEL_4:
  }
  if (+[PHSOSViewController isCallBufferDismissalAssertionActive](PHSOSViewController, "isCallBufferDismissalAssertionActive"))
  {
    if (!objc_msgSend(v4, "count"))
    {
      v25 = sub_1000C5588();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v139 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController,UpdateCurrentState,invoking setCurrentState:PHInCallStateCallBuffer", v139, 2u);
      }

      -[PHAudioCallViewController setCurrentState:](self, "setCurrentState:", 10);
      goto LABEL_107;
    }
    +[PHSOSViewController releaseAllCallBufferDismissalAssertions](PHSOSViewController, "releaseAllCallBufferDismissalAssertions");
  }
  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v139 = 138412290;
    *(_QWORD *)&v139[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Current Call Groups is %@", v139, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v12 = objc_msgSend(v11, "allCallsPassTest:", &stru_100287970);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routeController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pickedRoute"));
  v16 = objc_msgSend(v15, "deviceType");

  if (!v12)
    goto LABEL_15;
  if (-[PHCallViewController currentState](self, "currentState") == 1)
  {
    v17 = 1;
    goto LABEL_16;
  }
  v17 = 1;
  if (-[PHCallViewController currentState](self, "currentState") != 3 && v16 != (id)13)
  {
LABEL_15:
    -[PHCallViewController obtainDismissalAssertionIfNeeded](self, "obtainDismissalAssertionIfNeeded");
    v17 = 0;
  }
LABEL_16:
  if (objc_msgSend(v4, "count"))
  {
    if ((-[PHAudioCallViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
      -[PHAudioCallViewController loadView](self, "loadView");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "delegate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bannerPresentationManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsCoordinator](self, "callDetailsCoordinator"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController makeCallDetailsCoordinatorWithBannerPresentationManager:existingCoordinator:deferredPresentationManager:](self, "makeCallDetailsCoordinatorWithBannerPresentationManager:existingCoordinator:deferredPresentationManager:", v20, v21, self));

    v23 = objc_msgSend(v22, "outcome");
    if (v23 == (id)1)
    {
      -[PHAudioCallViewController setCallDetailsCoordinator:](self, "setCallDetailsCoordinator:", 0);
    }
    else if (v23 == (id)2)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "coordinator"));
      -[PHAudioCallViewController setCallDetailsCoordinator:](self, "setCallDetailsCoordinator:", v24);

    }
  }
  if (!objc_msgSend(v4, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "delegate"));
    v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "mostRecentlyDisconnectedAudioCall"));

    if (!v34)
      goto LABEL_71;
    v35 = objc_msgSend(v34, "canDisplayAlertUI:", -[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton"));
    v36 = sub_1000C5588();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v35)
    {
      if (v38)
      {
        *(_WORD *)v139 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Emergency call has been disconnected, setting state to PHInCallStateAlertModeNeededIfAvailable", v139, 2u);
      }

      -[PHAudioCallViewController setCurrentState:animated:](self, "setCurrentState:animated:", 8, 1);
      -[PHAudioCallViewController updateCallParticipantsViewControllerCallGroups](self, "updateCallParticipantsViewControllerCallGroups");
      -[PHAudioCallViewController setEmergencyTextViaSatelliteUI](self, "setEmergencyTextViaSatelliteUI");
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "view"));

      objc_msgSend(v40, "updateControls");
      -[PHAudioCallViewController setMiddleViewState:](self, "setMiddleViewState:", 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
      v42 = objc_opt_respondsToSelector(v41, "setButtonsEnabled:");

      if ((v42 & 1) != 0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
        objc_msgSend(v43, "setButtonsEnabled:", 1);

      }
    }
    else
    {
      if (v38)
      {
        *(_WORD *)v139 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call has been disconnected, setting state to PHInCallStateEnded", v139, 2u);
      }

      if (-[PHCallViewController currentState](self, "currentState") == 8)
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        objc_msgSend(v73, "setCurrentState:", 11);

      }
      -[PHAudioCallViewController setCurrentState:animated:](self, "setCurrentState:animated:", 7, 0);
      -[PHAudioCallViewController removeEmergencyTextViaSatelliteUI](self, "removeEmergencyTextViaSatelliteUI");
      -[PHAudioCallViewController updateCallParticipantsViewControllerCallGroups](self, "updateCallParticipantsViewControllerCallGroups");
    }
    if ((objc_msgSend(v34, "disconnectedReasonRequiresCallBackUI") & 1) == 0)
LABEL_71:
      -[PHAudioCallViewController removeEmergencyTextViaSatelliteUI](self, "removeEmergencyTextViaSatelliteUI");
    goto LABEL_105;
  }
  if (v17)
  {
    v27 = sub_1000C5588();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = -[PHCallViewController currentState](self, "currentState");
      *(_DWORD *)v139 = 67109376;
      *(_DWORD *)&v139[4] = v29;
      *(_WORD *)&v139[8] = 1024;
      *(_DWORD *)&v139[10] = v16 == (id)13;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: All calls are an endpoint elsewhere and previous state was %d OR shouldDismissForPickedRoute is %d, so setting state to PHInCallStateIdle", v139, 0xEu);
    }

    v30 = self;
    v31 = 0;
    goto LABEL_32;
  }
  if (objc_msgSend(v4, "count") == (id)1)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v45 = objc_msgSend(v44, "hasCurrentVideoCalls");

    if ((v45 & 1) == 0)
    {
      v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
      v74 = objc_msgSend(v34, "isConnected");
      v75 = objc_msgSend(v34, "canDisplayAlertUI:", -[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton"));
      if ((v75 & 1) == 0)
        -[PHAudioCallViewController removeEmergencyTextViaSatelliteUI](self, "removeEmergencyTextViaSatelliteUI");
      v76 = sub_1000C5588();
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v78 = objc_msgSend(v34, "callStatus");
        v79 = objc_msgSend(v34, "isEmergency");
        v80 = objc_msgSend(v34, "isFailureExpected");
        v81 = -[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton");
        *(_DWORD *)v139 = 67110144;
        *(_DWORD *)&v139[4] = v75;
        *(_WORD *)&v139[8] = 1024;
        *(_DWORD *)&v139[10] = v78;
        v140 = 1024;
        v141 = v79;
        v142 = 1024;
        v143 = v80;
        v144 = 1024;
        v145 = v81;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController will or will not update UI for alert: needsAlertUI = %d, callStatus = %d, isEmergency = %d, isFailureExpected = %d, alertServiceAvailable = %d", v139, 0x20u);
      }

      if (v75)
      {
        v82 = sub_1000C5588();
        v83 = objc_claimAutoreleasedReturnValue(v82);
        v84 = os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);
        if (v74)
        {
          if (v84)
          {
            *(_WORD *)v139 = 0;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is not TUCallStatusActive, setting state to PHInCallStateAlertModeNeededWhileConnectedIfAvailable", v139, 2u);
          }
          v85 = 9;
        }
        else
        {
          if (v84)
          {
            *(_WORD *)v139 = 0;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is not TUCallStatusActive, setting state to PHInCallStateAlertModeNeededIfAvailable", v139, 2u);
          }
          v85 = 8;
        }

        -[PHAudioCallViewController setCurrentState:animated:](self, "setCurrentState:animated:", v85, 1);
        -[PHAudioCallViewController updateCallParticipantsViewControllerCallGroups](self, "updateCallParticipantsViewControllerCallGroups");
        -[PHAudioCallViewController setEmergencyTextViaSatelliteUI](self, "setEmergencyTextViaSatelliteUI");
LABEL_103:
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "view"));

        objc_msgSend(v105, "updateControls");
        goto LABEL_104;
      }
      if (objc_msgSend(v34, "status") == 4 || objc_msgSend(v34, "wantsHoldMusic"))
      {
        v95 = sub_1000C5588();
        v96 = objc_claimAutoreleasedReturnValue(v95);
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v139 = 0;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusRinging, setting state to PHInCallStateIncomingRinging", v139, 2u);
        }

        v97 = self;
        v98 = 1;
        v99 = 0;
        goto LABEL_93;
      }
      if (objc_msgSend(v34, "status") == 1 || objc_msgSend(v34, "status") == 2)
      {
        v109 = -[PHCallViewController currentState](self, "currentState");
        v110 = sub_1000C5588();
        v111 = objc_claimAutoreleasedReturnValue(v110);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v139 = 0;
          _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusActive, and the call was initiated on this device", v139, 2u);
        }

        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "calls"));
        v113 = objc_msgSend(v112, "count");

        v114 = sub_1000C5588();
        v115 = objc_claimAutoreleasedReturnValue(v114);
        v116 = os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT);
        if ((unint64_t)v113 >= 2)
        {
          if (v116)
          {
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "calls"));
            v118 = objc_msgSend(v117, "count");
            *(_DWORD *)v139 = 134217984;
            *(_QWORD *)&v139[4] = v118;
            _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "There are %lu calls in call group, so setting state to PHInCallStateMultipleCallsActive", v139, 0xCu);

          }
          -[PHAudioCallViewController setCurrentState:animated:](self, "setCurrentState:animated:", 5, 1);
          if (!v109)
          {
            -[PHAudioCallViewController setMiddleViewState:](self, "setMiddleViewState:", 1);
            goto LABEL_104;
          }
          goto LABEL_147;
        }
        if (v116)
        {
          *(_WORD *)v139 = 0;
          _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "There is only one call in call group, so setting state to PHInCallStateSingleCallActive", v139, 2u);
        }

        if (!-[PHAudioCallViewController _isScreeningCallGroup:](self, "_isScreeningCallGroup:", v34))
        {
          -[PHAudioCallViewController setCurrentState:animated:](self, "setCurrentState:animated:", 4, 1);
          if (!-[PHAudioCallViewController hasKeypadUpdated](self, "hasKeypadUpdated"))
            -[PHAudioCallViewController showFirstNameLabelOnKeypad](self, "showFirstNameLabelOnKeypad");
          goto LABEL_147;
        }
        v125 = self;
        v126 = 11;
LABEL_136:
        -[PHAudioCallViewController setCurrentState:animated:](v125, "setCurrentState:animated:", v126, 1);
LABEL_147:
        if ((v109 & 0xFFFE) != 8)
          goto LABEL_104;
        v130 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        objc_msgSend(v130, "setCurrentState:", 11);

        -[PHAudioCallViewController updateCallParticipantsViewControllerCallGroups](self, "updateCallParticipantsViewControllerCallGroups");
        v131 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        if (objc_msgSend(v131, "isButtonLayoutEnabled"))
        {

        }
        else
        {
          v132 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
          if (objc_msgSend(v132, "callDisplayStyle") != (id)3)
          {

            goto LABEL_104;
          }
          v133 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
          v134 = objc_msgSend(v133, "isDominoEnabled");

          if (!v134)
            goto LABEL_104;
        }
        goto LABEL_103;
      }
      if (objc_msgSend(v34, "status") == 5)
      {
        v128 = sub_1000C5588();
        v129 = objc_claimAutoreleasedReturnValue(v128);
        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v139 = 0;
          _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusDisconnecting, setting state to PHInCallStateEnding", v139, 2u);
        }

        v97 = self;
        v98 = 6;
      }
      else
      {
        if (objc_msgSend(v34, "status") != 6)
        {
          if (objc_msgSend(v34, "status") != 3)
            goto LABEL_104;
          LOWORD(v109) = -[PHCallViewController currentState](self, "currentState");
          v137 = sub_1000C5588();
          v138 = objc_claimAutoreleasedReturnValue(v137);
          if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v139 = 0;
            _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is Sending, setting state to PHInCallStateOutgoingRinging", v139, 2u);
          }

          v125 = self;
          v126 = 2;
          goto LABEL_136;
        }
        v135 = sub_1000C5588();
        v136 = objc_claimAutoreleasedReturnValue(v135);
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v139 = 0;
          _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: Call status is TUCallStatusDisconnected, setting state to PHInCallStateEnded", v139, 2u);
        }

        v97 = self;
        v98 = 7;
      }
      v99 = 1;
LABEL_93:
      -[PHAudioCallViewController setCurrentState:animated:](v97, "setCurrentState:animated:", v98, v99);
LABEL_104:

LABEL_105:
      goto LABEL_106;
    }
  }
  v46 = (char *)objc_msgSend(v4, "count");
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v48 = &v46[(_QWORD)objc_msgSend(v47, "currentVideoCallCount")];

  if ((unint64_t)v48 < 2)
    goto LABEL_106;
  v49 = sub_1000C5588();
  v50 = objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v139 = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: More than one call is active...", v139, 2u);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "incomingCall"));

  if (!v52)
  {
    v86 = -[PHAudioCallViewController _isScreeningAnyCallGroup:](self, "_isScreeningAnyCallGroup:", v4);
    v87 = -[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI");
    v88 = v87;
    if (!v86)
    {
      v100 = sub_1000C5588();
      v101 = objc_claimAutoreleasedReturnValue(v100);
      v102 = os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);
      if (v88)
      {
        if (v102)
        {
          *(_WORD *)v139 = 0;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... so setting state to PHInCallStateSingleCallActive", v139, 2u);
        }
        v103 = 4;
      }
      else
      {
        if (v102)
        {
          *(_WORD *)v139 = 0;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... so setting state to PHInCallStateMultipleCallsActive", v139, 2u);
        }
        v103 = 5;
      }

      -[PHAudioCallViewController setCurrentState:animated:](self, "setCurrentState:animated:", v103, 1);
      -[PHAudioCallViewController hideFirstNameLabelOnKeypad](self, "hideFirstNameLabelOnKeypad");
      goto LABEL_106;
    }
    if (!v87
      || (v89 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"))) == 0
      || (v90 = (void *)v89,
          v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall")),
          v92 = objc_msgSend(v91, "isScreening"),
          v91,
          v90,
          (v92 & 1) != 0))
    {
      v93 = sub_1000C5588();
      v94 = objc_claimAutoreleasedReturnValue(v93);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v139 = 0;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... but no incoming call while one is being screened meaning the other was declined, so moving to PHInCallStateScreening", v139, 2u);
      }

      v30 = self;
      v31 = 11;
      goto LABEL_32;
    }
    v127 = sub_1000C5588();
    v120 = objc_claimAutoreleasedReturnValue(v127);
    if (!os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      goto LABEL_140;
    *(_WORD *)v139 = 0;
    v121 = "UpdateCurrentState: ... but no incoming call and the screening call isn't the prioritized one.";
    goto LABEL_139;
  }
  v53 = sub_1000C5588();
  v54 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v139 = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... and we have an incoming audio call...", v139, 2u);
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "callWithStatus:", 1));
  if (v56)
    goto LABEL_53;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "callWithStatus:", 3));
  if (v57)
  {
LABEL_52:

LABEL_53:
    goto LABEL_54;
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "callWithStatus:", 2));
  if (v58)
  {

    goto LABEL_52;
  }
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v123 = objc_msgSend(v122, "currentVideoCallCount");

  if (!v123)
  {
    v124 = sub_1000C5588();
    v65 = objc_claimAutoreleasedReturnValue(v124);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v139 = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... but we don't also have an active call, so moving to PHInCallStateIncomingRinging", v139, 2u);
    }
LABEL_130:

LABEL_131:
    v30 = self;
    v31 = 1;
    goto LABEL_32;
  }
LABEL_54:
  v59 = -[PHAudioCallViewController _isScreeningAnyCallGroup:](self, "_isScreeningAnyCallGroup:", v4);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v61 = objc_msgSend(v60, "ics_hasTooManyCallsForCallWaitingBanner");

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if ((objc_msgSend(v62, "shouldShowFullScreenCallWaiting") & 1) != 0
    || (v59 & 1) != 0
    || (v61 & 1) != 0
    || -[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
  {

    goto LABEL_59;
  }
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v106, "callDisplayStyle") != (id)3)
  {

LABEL_125:
    v119 = sub_1000C5588();
    v120 = objc_claimAutoreleasedReturnValue(v119);
    if (!os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
LABEL_140:

      v30 = self;
      v31 = 4;
      goto LABEL_32;
    }
    *(_WORD *)v139 = 0;
    v121 = "UpdateCurrentState: ... and we also have an active call, so moving to PHInCallStateSingleCallActive (EmbedSwapBanner)";
LABEL_139:
    _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, v121, v139, 2u);
    goto LABEL_140;
  }
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v108 = objc_msgSend(v107, "isDominoEnabled");

  if (!v108)
    goto LABEL_125;
LABEL_59:
  v63 = sub_1000C5588();
  v64 = objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v139 = 0;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: ... and we also have an active call, so moving to PHInCallStateCallWaiting", v139, 2u);
  }

  if (!-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
  {
    v30 = self;
    v31 = 3;
LABEL_32:
    -[PHAudioCallViewController setCurrentState:animated:](v30, "setCurrentState:animated:", v31, 1, *(_QWORD *)v139);
LABEL_106:
    -[PHAudioCallViewController updateCallRecordingIfNeeded](self, "updateCallRecordingIfNeeded");
    goto LABEL_107;
  }
  v65 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
  v66 = objc_claimAutoreleasedReturnValue(-[NSObject callUUID](v65, "callUUID"));
  if (!v66)
    goto LABEL_130;
  v67 = (void *)v66;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "incomingCall"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "callUUID"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "callUUID"));

  if (v70 == v72)
    goto LABEL_131;
LABEL_107:

}

- (BOOL)_isScreeningAnyCallGroup:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D10A0;
  v4[3] = &unk_100287998;
  v4[4] = self;
  return objc_msgSend(a3, "tu_containsObjectPassingTest:", v4);
}

- (BOOL)_isScreeningCallGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](self, "featureFlags"));
  if (TUCallScreeningEnabled(v5, 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calls"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = objc_msgSend(v7, "isScreening");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setCurrentState:(unsigned __int16)a3
{
  -[PHAudioCallViewController setCurrentState:animated:](self, "setCurrentState:animated:", a3, 0);
}

- (void)setIdleState:(unsigned __int16)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  objc_msgSend(v5, "setMostRecentlyDisconnectedAudioCall:", 0);

  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHAudioCallViewControllerDismissalAssertionWaitingForIdle"));
  -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", 0, 1, 0);
  -[PHAudioCallViewController releaseDismissalAssertion](self, "releaseDismissalAssertion");
  -[PHAudioCallViewController _testing_didTransitionToIdleCallState](self, "_testing_didTransitionToIdleCallState");
}

- (void)setActiveState:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void **v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  char v47;
  id location[2];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeController"));

  if (objc_msgSend(v6, "hasAirPodsAvailable"))
    v7 = objc_msgSend(v6, "hasAirPodsInEar") ^ 1;
  else
    LOBYTE(v7) = 0;
  v8 = sub_10000D538(CFSTR("RevealAudioRoutesOnIncomingCall"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else if (-[PHCallViewController currentState](self, "currentState") != 1)
  {
    LOBYTE(v7) = 0;
  }

  if (!-[PHAudioCallViewController middleViewState](self, "middleViewState")
    || -[PHAudioCallViewController middleViewState](self, "middleViewState") == 4)
  {
    objc_initWeak(location, self);
    v42 = _NSConcreteStackBlock;
    v43 = 3221225472;
    v44 = sub_1000D16F8;
    v45 = &unk_1002879C0;
    objc_copyWeak(&v46, location);
    v47 = v7;
    -[PHAudioCallViewController setMiddleViewState:animated:completion:](self, "setMiddleViewState:animated:completion:", 1, 1, &v42);
    objc_destroyWeak(&v46);
    objc_destroyWeak(location);
  }
  if ((_DWORD)v3 == 5 || -[PHCallViewController currentState](self, "currentState") == 5)
    -[PHAudioCallViewController updateViewsForHeldCallControlsViewIfNeeded](self, "updateViewsForHeldCallControlsViewIfNeeded", v42, v43, v44, v45);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar", v42, v43, v44, v45));
  objc_msgSend(v10, "setUserInteractionEnabled:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
  v12 = objc_opt_respondsToSelector(v11, "setButtonsEnabled:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
    objc_msgSend(v13, "setButtonsEnabled:", 1);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  -[PHAudioCallViewController _testing_didTransitionToActiveCallState:](self, "_testing_didTransitionToActiveCallState:", v14);

  -[PHCallViewController setWantsApplicationDismissalStyle:](self, "setWantsApplicationDismissalStyle:", (_DWORD)v3 == 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v15, "callDisplayStyle") == (id)3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v17 = objc_msgSend(v16, "isDominoEnabled");

    if (v17)
      -[PHAudioCallViewController layoutParticipantsViewAnimated:](self, "layoutParticipantsViewAnimated:", 0);
  }
  else
  {

  }
  if ((_DWORD)v3 == 4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController isolatedCall](self, "isolatedCall"));
    -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v18, 1, 0);
    if (-[PHAudioCallViewController shouldShowNewPosterUpdates](self, "shouldShowNewPosterUpdates"))
      -[PHAudioCallViewController updateLayeredBackgroundWallpaper](self, "updateLayeredBackgroundWallpaper");
    -[PHAudioCallViewController animateInfoButtonCoinFlipIfNeeded](self, "animateInfoButtonCoinFlipIfNeeded");
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
    -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v18, 1, 0);
  }
  if (objc_msgSend(v18, "originatingUIType") == 10)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routeController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "routeForSpeakerEnable"));

    if (v21)
    {
      v22 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeController](v22, "routeController"));
      objc_msgSend(v23, "pickRoute:", v21);

    }
    else
    {
      v28 = sub_1000C5588();
      v22 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1001AA994();
    }

    v26 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopManager](self, "voiceLoopManager"));
    -[NSObject startLoopPlayback](v26, "startLoopPlayback");
  }
  else
  {
    if (objc_msgSend(v18, "originatingUIType") != 12)
      goto LABEL_35;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "routeController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "routeForSpeakerDisable"));

    if (v21)
    {
      v26 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeController](v26, "routeController"));
      objc_msgSend(v27, "pickRoute:", v21);

    }
    else
    {
      v41 = sub_1000C5588();
      v26 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[WARN] PHAudioCallViewController: Could not find available route to pick for speaker disable", (uint8_t *)location, 2u);
      }
    }
  }

LABEL_35:
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v30 = objc_msgSend(v29, "callDisplayStyle");

  if (!v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
    objc_msgSend(v31, "setBannerButtonsState:", 1);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "routeController"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "pickedRoute"));
    v35 = objc_msgSend(v34, "isReceiver") ^ 1;

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "delegate"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "currentInCallScene"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "delegate"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "callAnalyticsLogger"));
    objc_msgSend(v40, "createAnsweredBannerAnalyticsViewWithIsHandsfreeAudioRoute:", v35);

  }
  -[PHAudioCallViewController _performPosterTransformationsIfNecessaryToState:](self, "_performPosterTransformationsIfNecessaryToState:", v3);

}

- (void)_performPosterTransformationsIfNecessaryToState:(unsigned __int16)a3
{
  int v3;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[5];
  __int16 v12;

  v3 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v5 = objc_msgSend(v10, "callDisplayStyle");
  if (v3 == 4
    && v5 == (id)2
    && (v6 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"))) != 0)
  {
    v7 = (void *)v6;
    v8 = -[PHAudioCallViewController shouldShowContactOrLastSeenWallpaper](self, "shouldShowContactOrLastSeenWallpaper");

    if (v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000D1884;
      v11[3] = &unk_100284AF8;
      v11[4] = self;
      v12 = 4;
      v9 = objc_retainBlock(v11);
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.5);

    }
  }
  else
  {

  }
}

- (void)updateCallParticipantsViewControllerCallGroups
{
  void *v3;
  void *v4;
  id v5;

  if (-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall")),
        v3,
        v3))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
    objc_msgSend(v4, "setPrioritizedCall:", v5);

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
    objc_msgSend(v5, "updateCallGroups");
  }

}

- (void)_updateStatusLabelVisibility
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_WaitingOrNot](self, "getParticipantsView_WaitingOrNot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "singleCallLabelView"));
  -[PHAudioCallViewController updatePosterBadgeView:to:](self, "updatePosterBadgeView:to:", -[PHAudioCallViewController callHasNoContactPoster](self, "callHasNoContactPoster") ^ 1, v3);
  -[PHAudioCallViewController updateCallRecordingPositionIfNeeded](self, "updateCallRecordingPositionIfNeeded");
  if (-[PHAudioCallViewController callHasContactPosterWithHorizontalName](self, "callHasContactPosterWithHorizontalName")|| (v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel")), v4, v4))
  {
    v5 = v3;
    v6 = 1;
  }
  else
  {
    if (-[PHAudioCallViewController callHasContactPosterWithVerticalName](self, "callHasContactPosterWithVerticalName"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "posterNameTextView"));
      v9 = objc_msgSend(v8, "callIsActive");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "posterNameTextView"));
      LODWORD(v8) = objc_msgSend(v11, "statusIsSuitableForVerticalLayout");

      objc_msgSend(v3, "setHidesLabel:", v8 & ~v9);
      objc_msgSend(v3, "hideBadgesOnly");
      goto LABEL_5;
    }
    v5 = v3;
    v6 = 0;
  }
  objc_msgSend(v5, "setHidesLabel:", v6);
LABEL_5:

}

- (BOOL)isShowingPosterBadge
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
  v3 = v2 != 0;

  return v3;
}

- (void)updatePosterBadgeView:(BOOL)a3 to:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  if (v4
    && -[PHAudioCallViewController canShowPosterBadgeInAudioCallView:](self, "canShowPosterBadgeInAudioCallView:", v9))
  {
    -[PHAudioCallViewController setUpPosterBadgeViewIfNecessary](self, "setUpPosterBadgeViewIfNecessary");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
      objc_msgSend(v7, "removeFromSuperview");

      -[PHAudioCallViewController setPosterBadgeView:](self, "setPosterBadgeView:", 0);
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
  objc_msgSend(v9, "setPosterBadgeView:", v8);

  -[PHAudioCallViewController synchronizeSingleLabelViewWithPosterText](self, "synchronizeSingleLabelViewWithPosterText");
}

- (void)synchronizeSingleLabelViewWithPosterText
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_WaitingOrNot](self, "getParticipantsView_WaitingOrNot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel"));
    objc_msgSend(v4, "updateViewModelForParticipantsView:", v5);

  }
  else
  {
    -[PHAudioCallViewController updatePosterViewModelForParticipantsView:](self, "updatePosterViewModelForParticipantsView:", v5);
  }

}

- (void)setUpPosterBadgeViewIfNecessary
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v3, "callDisplayStyle") != (id)3)
  {

LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));

    if (v6)
      return;
    v14 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_WaitingOrNot](self, "getParticipantsView_WaitingOrNot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "singleCallLabelView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "iconView"));

    if (v8)
    {
      v9 = objc_alloc_init((Class)UIImageView);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "badgeView"));

      if (!v10)
      {
LABEL_11:
        objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        objc_msgSend(v11, "addSubview:", v10);

        -[PHAudioCallViewController positionPosterBadgeToBeHorizontallyCenteredToInfoButton:](self, "positionPosterBadgeToBeHorizontallyCenteredToInfoButton:", v10);
        -[PHAudioCallViewController setPosterBadgeView:](self, "setPosterBadgeView:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[TPIncomingCallMetricsProvider posterBadgeMaxSize](TPIncomingCallMetricsProvider, "posterBadgeMaxSize"));
        objc_msgSend(v12, "setMaximumContentSizeCategory:", v13);

        -[PHAudioCallViewController invertColorForPosterBadgeViewIfSnapshotPoster](self, "invertColorForPosterBadgeViewIfSnapshotPoster");
        return;
      }
      v9 = objc_msgSend(objc_alloc((Class)TPBadgeView), "initWithTitle:theme:", &stru_10028DC20, 1);
    }
    v10 = v9;
    goto LABEL_11;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v5 = objc_msgSend(v4, "isDominoEnabled");

  if ((v5 & 1) == 0)
    goto LABEL_5;
}

- (void)invertColorForPosterBadgeViewIfSnapshotPoster
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController snapshottedPosterImageToUseForColorInversion](self, "snapshottedPosterImageToUseForColorInversion"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController snapshottedPosterImageToUseForColorInversion](self, "snapshottedPosterImageToUseForColorInversion"));
    -[PHAudioCallViewController invertColorForPosterBadgeViewBasedOn:](self, "invertColorForPosterBadgeViewBasedOn:", v4);

  }
}

- (void)_updatePosterStatusLabelForState:(unsigned __int16)a3
{
  unsigned int v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  dispatch_time_t v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_WaitingOrNot](self, "getParticipantsView_WaitingOrNot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));
    objc_msgSend(v7, "updateStatusFromParticipantsView:", v6);

    if (v3 <= 0xB && ((1 << v3) & 0x814) != 0)
    {
      -[PHAudioCallViewController _updatePosterNameAlpha](self, "_updatePosterNameAlpha");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

      v10 = v9 != 0;
      if (-[PHAudioCallViewController shouldShowNewPosterUpdates](self, "shouldShowNewPosterUpdates"))
      {
        v11 = dispatch_time(0, 850000000);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1000D2090;
        v13[3] = &unk_100284C98;
        v13[4] = self;
        v14 = v10;
        dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));
        objc_msgSend(v12, "transitionCallToActiveStateAnimated:", v10);

      }
    }
    -[PHAudioCallViewController _updateStatusLabelVisibility](self, "_updateStatusLabelVisibility");

  }
}

- (void)_updatePosterNameAlpha
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel"));
  if (v3
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"))) != 0)
  {
    v4 = 0.0;
    if (!self->_participantsViewIsShowingMultipleLabel)
      v4 = 1.0;
    v9 = v3;
    objc_msgSend(v3, "updatePosterNameAlpha:", v4);
    v5 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));
        objc_msgSend(v8, "updatePosterNameAlpha:", 0.0);

      }
    }
    v3 = v9;
  }

}

- (void)setRingingState:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController presentedViewController](self, "presentedViewController", a3));

  if (v4)
    -[PHAudioCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[PHAudioCallViewController updateShouldShowLargeAvatar](self, "updateShouldShowLargeAvatar");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentInCallScene"));
  v8 = objc_msgSend(v7, "isBeingShownAboveCoverSheet");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "incomingCall"));

  v10 = -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v25, 1, 0);
  v11 = 4;
  if (v10)
    v11 = 5;
  if (v8)
    v12 = v11;
  else
    v12 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v13, "callDisplayStyle") == (id)3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v15 = objc_msgSend(v14, "isDominoEnabled");

    if (v15)
      v12 = 0;
  }
  else
  {

  }
  v16 = objc_msgSend(v25, "isMessagingAllowed");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v17, "setDeclineAndMessageIsAvailable:", v16);

  v18 = objc_msgSend(v25, "isReminderAllowed");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v19, "setDeclineAndRemindIsAvailable:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v20, "setCurrentState:", v12);

  -[PHAudioCallViewController setMiddleViewState:animated:](self, "setMiddleViewState:animated:", 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v22 = objc_msgSend(v21, "callDisplayStyle");

  if (!v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
    objc_msgSend(v23, "setBannerButtonsState:", 0);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  -[PHAudioCallViewController _testing_didTransitionToIncomingRingingCallState:](self, "_testing_didTransitionToIncomingRingingCallState:", v24);

}

- (void)setWaitingState:(unsigned __int16)a3
{
  unsigned int v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  char HasChinaSKU;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134217984;
    v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setWaitingState: %lu", (uint8_t *)&v24, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "incomingCall"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v11 = objc_msgSend(v10, "isPresentingAmbient");

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "provider"));
    if (objc_msgSend(v12, "supportsDynamicSystemUI"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](self, "featureFlags"));
      if ((objc_msgSend(v13, "groupConversations") & 1) != 0)
      {
        HasChinaSKU = TUDeviceHasChinaSKU();

        if ((HasChinaSKU & 1) != 0)
          goto LABEL_11;
        goto LABEL_10;
      }

    }
LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController inCallRootViewController](self, "inCallRootViewController"));
    objc_msgSend(v15, "requestInCallSceneTransitionToFullScreen");

  }
LABEL_11:
  -[PHAudioCallViewController setShouldShowLargeAvatarForCallWaiting:](self, "setShouldShowLargeAvatarForCallWaiting:", -[PHAudioCallViewController shouldShowLargeAvatarForCall:](self, "shouldShowLargeAvatarForCall:", v8));
  -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v8, 1, 0);
  if (-[PHAudioCallViewController participantsViewControllersShouldIgnoreUpdates](self, "participantsViewControllersShouldIgnoreUpdates"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v17 = objc_msgSend(v16, "autoPunchOutBehaviorRequiredForCurrentCalls");

    if ((v17 & 1) == 0)
      -[PHAudioCallViewController setParticipantsViewControllersShouldIgnoreUpdates:](self, "setParticipantsViewControllersShouldIgnoreUpdates:", 0);
  }
  -[PHAudioCallViewController setShowsCallWaitingParticipantView:](self, "setShowsCallWaitingParticipantView:", 1);
  v18 = objc_msgSend(v8, "isMessagingAllowed");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v19, "setDeclineAndMessageIsAvailable:", v18);

  v20 = objc_msgSend(v8, "isReminderAllowed");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v21, "setDeclineAndRemindIsAvailable:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v22, "setUserInteractionEnabled:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v23, "setCurrentState:animated:animationCompletionBlock:", -[PHAudioCallViewController bottomBarStateForCallWaitingCall](self, "bottomBarStateForCallWaitingCall"), 0, 0);

  -[PHAudioCallViewController setMiddleViewState:animated:](self, "setMiddleViewState:animated:", 0, 1);
  -[PHCallViewController setWantsApplicationDismissalStyle:](self, "setWantsApplicationDismissalStyle:", 0);

}

- (void)setEndedState:(unsigned __int16)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  unsigned int v40;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "mostRecentlyDisconnectedAudioCall"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
  LOBYTE(v5) = objc_opt_respondsToSelector(v7, "setButtonsEnabled:");

  if ((v5 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
    objc_msgSend(v8, "setButtonsEnabled:", 0);

  }
  -[SOSEmergencyCallVoiceLoopManager invalidate](self->_voiceLoopManager, "invalidate");
  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactIdentifiers"));
    v11 = objc_msgSend(v30, "count");
    v12 = objc_msgSend(v6, "isOutgoing");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateConnected"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "provider"));
    v16 = objc_msgSend(v15, "isFaceTimeProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](FTDeviceSupport, "sharedInstance"));
    *(_DWORD *)buf = 134219010;
    v32 = v11;
    v33 = 1024;
    v34 = v12;
    v35 = 2112;
    v36 = v14;
    v37 = 1024;
    v38 = v16;
    v39 = 1024;
    v40 = objc_msgSend(v17, "isGreenTea");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(disconnectedCall.contactIdentifiers.count: %lu && \n\n !(disconnectedCall.isOutgoing: %d && disconnectedCall.dateConnected: %@) && \n\n disconnectedCall.provider.isFaceTimeProvider: %d \n\n [[FTDeviceSupport sharedInstance] isGreenTea]) : %d", buf, 0x28u);

  }
  if (!objc_msgSend(v6, "disconnectedReasonRequiresCallBackUI")
    || !-[PHAudioCallViewController isUserInterfaceShowing](self, "isUserInterfaceShowing"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController UUIDForLocallyDisconnectedCall](self, "UUIDForLocallyDisconnectedCall"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callUUID"));
    if (objc_msgSend(v19, "isEqualToString:", v20))
    {

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "delegate"));
      v23 = objc_msgSend(v22, "hasExistingFullScreenInCallScene");

      if (v23)
        +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHAudioCallViewControllerDismissalAssertionWaitingForIdle"));
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v24, "setUserInteractionEnabled:", 0);

    -[PHCallViewController transitionToIdleAfterDelay](self, "transitionToIdleAfterDelay");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController inCallRootViewController](self, "inCallRootViewController"));
    objc_msgSend(v25, "showFailureAlertIfNecessaryForCall:", v6);
    goto LABEL_15;
  }
  -[PHAudioCallViewController transitionToFullScreenIfNecessary](self, "transitionToFullScreenIfNecessary");
  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHAudioCallViewControllerDismissalAssertionHandlingCallFailure"));
  -[PHAudioCallViewController setMiddleViewState:](self, "setMiddleViewState:", 0);
  -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v6, 1, 0);
  if (objc_msgSend(v6, "service") == 2 && (objc_msgSend(v6, "isMessagingAllowed") & 1) != 0)
  {
    v18 = 17;
  }
  else if (objc_msgSend(v6, "isCallbackAllowed"))
  {
    v18 = 13;
  }
  else
  {
    v18 = 18;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v28, "setCurrentState:animated:animationCompletionBlock:", v18, 1, 0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v29, "setUserInteractionEnabled:", 1);

  if (-[PHAudioCallViewController shouldShowEnableWiFiCallingAlertForCall:](self, "shouldShowEnableWiFiCallingAlertForCall:", v6))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController enableWiFiCallingAlertController](UIAlertController, "enableWiFiCallingAlertController"));
    if (v25)
    {
      -[PHAudioCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);
      sub_100086DCC();
    }
LABEL_15:

  }
  if (objc_msgSend(v6, "disconnectedReason") == 34)
  {
    -[PHAudioCallViewController setMiddleViewState:](self, "setMiddleViewState:", 0);
    v26 = sub_1000C5588();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController is about to set shouldPresentAlertButton to NO", buf, 2u);
    }

    self->_shouldPresentAlertButton = 0;
  }

}

- (void)setEndingState:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar", a3));
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
  v6 = objc_opt_respondsToSelector(v5, "setButtonsEnabled:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
    objc_msgSend(v7, "setButtonsEnabled:", 0);

  }
  -[SOSEmergencyCallVoiceLoopManager invalidate](self->_voiceLoopManager, "invalidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController isolatedCall](self, "isolatedCall"));
  if (v8)
  {
    v9 = v8;
    -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v8, 0, 0);
    v8 = v9;
  }

}

- (void)setOutgoingRingingState:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void ***v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void **v41;
  uint64_t v42;
  id *(*v43)(id *, int);
  void *v44;
  id v45;
  PHAudioCallViewController *v46;
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentCallGroups"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  if (objc_msgSend(v6, "originatingUIType") == 10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pickedRoute"));
    v10 = objc_msgSend(v9, "isSpeaker");

    if ((v10 & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "routeController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "routeForSpeakerEnable"));

      if (!v17)
      {
        v23 = sub_1000C5588();
        v19 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_1001AA994();
        goto LABEL_12;
      }
      goto LABEL_9;
    }
  }
  if (objc_msgSend(v6, "originatingUIType") == 12)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pickedRoute"));
    v14 = objc_msgSend(v13, "isReceiver");

    if ((v14 & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routeController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routeForSpeakerDisable"));

      if (!v17)
      {
        v18 = sub_1000C5588();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] PHAudioCallViewController: Could not find available route to pick for speaker disable", buf, 2u);
        }
        goto LABEL_12;
      }
LABEL_9:
      v19 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeController](v19, "routeController"));
      objc_msgSend(v22, "pickRoute:", v17);

LABEL_12:
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController isolatedCall](self, "isolatedCall"));
  -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v24, 1, 0);

  v41 = _NSConcreteStackBlock;
  v42 = 3221225472;
  v43 = sub_1000D2F58;
  v44 = &unk_100284DF0;
  v25 = v6;
  v45 = v25;
  v46 = self;
  v26 = objc_retainBlock(&v41);
  -[PHAudioCallViewController setMiddleViewState:animated:completion:](self, "setMiddleViewState:animated:completion:", 1, objc_msgSend(v25, "isVoicemail", v41, v42, v43, v44) ^ 1, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
  v28 = objc_opt_respondsToSelector(v27, "setButtonsEnabled:");

  if ((v28 & 1) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
    objc_msgSend(v29, "setButtonsEnabled:", 1);

  }
  if (objc_msgSend(v25, "isVoicemail"))
    -[PHAudioCallViewController setMiddleViewState:](self, "setMiddleViewState:", 2);
  -[PHCallViewController setWantsApplicationDismissalStyle:](self, "setWantsApplicationDismissalStyle:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v30, "callDisplayStyle") != (id)3)
    goto LABEL_24;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (!objc_msgSend(v31, "isDominoEnabled"))
    goto LABEL_23;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "delegate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "currentInCallScene"));
  v35 = objc_msgSend(v34, "presentationMode");

  if (!v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "routeController"));

    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "routeForSpeakerEnable"));
    if (!v37)
      goto LABEL_24;
    v38 = (void *)v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pickedRoute"));
    v40 = objc_msgSend(v39, "isReceiver");

    if (!v40)
      goto LABEL_24;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "routeForSpeakerEnable"));
    objc_msgSend(v30, "pickRoute:", v31);
LABEL_23:

LABEL_24:
  }

}

- (void)setCallBufferState:(unsigned __int16)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController,setCurrentState,PHInCallStateCallBuffer", (uint8_t *)buf, 2u);
  }

  if (-[PHAudioCallViewController middleViewState](self, "middleViewState") == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
    objc_msgSend(v6, "setButtonsEnabled:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buttonForControlType:", 15));
    objc_msgSend(v8, "setEnabled:", 1);

  }
  else
  {
    objc_initWeak(buf, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000D313C;
    v10[3] = &unk_100284F60;
    objc_copyWeak(&v11, buf);
    -[PHAudioCallViewController setMiddleViewState:animated:completion:](self, "setMiddleViewState:animated:completion:", 1, 1, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v9, "setUserInteractionEnabled:", 1);

  -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", 0, 1, 0);
  -[PHAudioCallViewController displayDialledNumberDetailsForCallBufferScreen](self, "displayDialledNumberDetailsForCallBufferScreen");
  -[PHCallViewController setWantsApplicationDismissalStyle:](self, "setWantsApplicationDismissalStyle:", 0);
  -[PHAudioCallViewController startCallBufferScreenCountdown](self, "startCallBufferScreenCountdown");
}

- (void)setAlertModeNeededState:(unsigned __int16)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  if (-[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v4, "setUserInteractionEnabled:", 1);

    if (-[PHAudioCallViewController middleViewState](self, "middleViewState") == 2)
    {
      v5 = sub_1000C5588();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController skips updating bottomBarButton to alert style since keypad is expanded", v7, 2u);
      }
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
      -[NSObject setCurrentState:](v6, "setCurrentState:", 22);
    }

    -[PHAudioCallViewController speakAlertUtteranceIfNecessary](self, "speakAlertUtteranceIfNecessary");
  }
}

- (void)setEmergencyTextViaSatelliteUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];

  v38 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v38, "isButtonLayoutEnabled"))
  {

LABEL_3:
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "singleCallLabelView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusLabel"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyTextViaSatelliteLabel](self, "emergencyTextViaSatelliteLabel"));
    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController defaultBackgroundGradientView](self, "defaultBackgroundGradientView"));
      objc_msgSend(v7, "removeFromSuperview");

      -[PHAudioCallViewController setDefaultBackgroundGradientView:](self, "setDefaultBackgroundGradientView:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      objc_msgSend(v9, "setBackgroundColor:", v8);

      v10 = objc_alloc_init((Class)UILabel);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
      objc_msgSend(v10, "setText:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
      objc_msgSend(v10, "setFont:", v12);

      objc_msgSend(v10, "setNumberOfLines:", 3);
      objc_msgSend(v10, "setTextAlignment:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textColor"));
      objc_msgSend(v10, "setTextColor:", v13);

      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PHAudioCallViewController setEmergencyTextViaSatelliteLabel:](self, "setEmergencyTextViaSatelliteLabel:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      objc_msgSend(v14, "addSubview:", v10);

      v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v37));
      v40[0] = v36;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
      v40[1] = v33;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerXAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerXAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
      v40[2] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
      v40[3] = v19;
      v20 = v3;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

      v3 = v20;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    if (objc_msgSend(v22, "currentState") == (id)19)
      v23 = 0.0;
    else
      v23 = 1.0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyTextViaSatelliteLabel](self, "emergencyTextViaSatelliteLabel"));
    objc_msgSend(v24, "setAlpha:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    if (objc_msgSend(v25, "currentState") == (id)19)
      v26 = 1.0;
    else
      v26 = 0.0;
    objc_msgSend(v5, "setAlpha:", v26);

    return;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v27, "callDisplayStyle") != (id)3)
  {

    return;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v29 = objc_msgSend(v28, "isDominoEnabled");

  if (v29)
    goto LABEL_3;
}

- (void)removeEmergencyTextViaSatelliteUI
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (!-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v13, "callDisplayStyle") != (id)3)
      goto LABEL_9;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v4 = objc_msgSend(v3, "isDominoEnabled");

    if (!v4)
      return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  v13 = v5;
  if (v5)
  {
    v6 = objc_msgSend(v5, "isEmergency");
    v7 = v13;
    if (!v6)
      goto LABEL_10;
  }
  -[PHAudioCallViewController addDefaultBackgroundGradientView](self, "addDefaultBackgroundGradientView");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "singleCallLabelView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statusLabel"));

  objc_msgSend(v10, "setAlpha:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyTextViaSatelliteLabel](self, "emergencyTextViaSatelliteLabel"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyTextViaSatelliteLabel](self, "emergencyTextViaSatelliteLabel"));
    objc_msgSend(v12, "removeFromSuperview");

    -[PHAudioCallViewController setEmergencyTextViaSatelliteLabel:](self, "setEmergencyTextViaSatelliteLabel:", 0);
  }

LABEL_9:
  v7 = v13;
LABEL_10:

}

- (void)setScreeningState:(unsigned __int16)a3 animated:(BOOL)a4
{
  -[PHAudioCallViewController setScreeningState:animated:overrideWithIsUnlocked:](self, "setScreeningState:animated:overrideWithIsUnlocked:", a3, 1, 0);
}

- (void)setScreeningState:(unsigned __int16)a3 animated:(BOOL)a4 overrideWithIsUnlocked:(BOOL)a5
{
  void *v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  id v59;
  _BOOL4 v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  void *v64;
  _QWORD v65[7];
  __int16 v66;
  _QWORD v67[3];
  id v68;
  _QWORD v69[6];
  __int16 v70;
  _QWORD v71[3];
  char v72;
  _BYTE buf[24];
  void (*v74)(uint64_t, uint64_t);
  id v75[3];

  v6 = a5;
  v60 = a4;
  v63 = a3;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v63;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Audio: setCurrentState: (existing state is %d) with unlockedOverride: %d", buf, 0xEu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v10, "setUserInteractionEnabled:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController presentedViewController](self, "presentedViewController"));
  if (v11)
  {
    v12 = -[PHCallViewController isPresentingCustomMessageController](self, "isPresentingCustomMessageController");

    if ((v12 & 1) == 0)
      -[PHAudioCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v13, "_backlightLuminance") == (id)1)
  {
    v14 = 1;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController traitCollection](self, "traitCollection"));
    v14 = objc_msgSend(v15, "_backlightLuminance") == 0;

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentInCallScene"));
  v19 = objc_msgSend(v18, "isBeingShownAboveCoverSheet");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v62 = v19 & !v6 | v14;
  if (objc_msgSend(v20, "callDisplayStyle") == (id)3)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v22 = objc_msgSend(v21, "isDominoEnabled");
    v23 = 23;
    if ((v62 & 1) != 0)
      v24 = 24;
    else
      v24 = 23;
    if (!v22)
      v23 = v24;
    v61 = v23;

  }
  else
  {
    v25 = 23;
    if (((v19 & !v6 | v14) & 1) != 0)
      v25 = 24;
    v61 = v25;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "screeningCall"));

  v27 = sub_1000C5588();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    if ((v62 & 1) != 0)
      v29 = CFSTR("YES");
    else
      v29 = CFSTR("NO");
    if (v14)
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    if (v19)
      v31 = CFSTR("YES");
    else
      v31 = CFSTR("NO");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v33 = objc_msgSend(v32, "callDisplayStyle");
    v34 = CFSTR("NO");
    if (v33 == (id)3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      if (objc_msgSend(v5, "isDominoEnabled"))
        v34 = CFSTR("YES");
    }
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v30;
    *(_WORD *)&buf[22] = 2112;
    v74 = (void (*)(uint64_t, uint64_t))v31;
    LOWORD(v75[0]) = 2112;
    *(id *)((char *)v75 + 2) = (id)v34;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Audio: setCurrentState: showLockedState: %@, displayIsOff: %@, beingShownAboveCoverSheet: %@, isAmbient: %@", buf, 0x2Au);
    if (v33 == (id)3)

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](self, "featureFlags"));
  if ((TUCallScreeningEnabledM3(v35) & 1) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "contactIdentifiers"));
    v37 = objc_msgSend(v36, "count") != 0;

    if (((v62 | v37) & 1) == 0)
      v61 = 25;
  }
  else
  {

  }
  -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v64, 1, 0);
  v38 = objc_msgSend(v64, "isMessagingAllowed");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v39, "setDeclineAndMessageIsAvailable:", v38);

  v40 = objc_msgSend(v64, "isReminderAllowed");
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v41, "setDeclineAndRemindIsAvailable:", v40);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v43, "callDisplayStyle") == (id)3)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    objc_msgSend(v42, "setCurrentState:animated:animationCompletionBlock:", v61, objc_msgSend(v44, "isDominoEnabled"), 0);

  }
  else
  {
    objc_msgSend(v42, "setCurrentState:animated:animationCompletionBlock:", v61, 0, 0);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "controlForActionType:", 27));

  -[PHCallViewController configureDeclineWithReminderButton:declineWithMessageButton:forIncomingCall:](self, "configureDeclineWithReminderButton:declineWithMessageButton:forIncomingCall:", 0, v46, v64);
  -[PHAudioCallViewController setMiddleViewState:animated:](self, "setMiddleViewState:animated:", 4, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v48 = objc_msgSend(v47, "callDisplayStyle") == 0;

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
    objc_msgSend(v49, "setBannerButtonsState:", 0);

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  -[PHAudioCallViewController _testing_didTransitionToIncomingRingingCallState:](self, "_testing_didTransitionToIncomingRingingCallState:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v51, "callDisplayStyle") == (id)3)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v53 = objc_msgSend(v52, "isDominoEnabled");

    if (v53)
    {
      -[PHAudioCallViewController layoutParticipantsViewAnimated:](self, "layoutParticipantsViewAnimated:", v60);
      -[PHAudioCallViewController updateBottomBarAlphaWithCurrentState:](self, "updateBottomBarAlphaWithCurrentState:", v63);
    }
  }
  else
  {

  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController stateChangeLockObservation](self, "stateChangeLockObservation"));
  if (!v54
    || (v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController stateDisplayChangedObservation](self, "stateDisplayChangedObservation")), v56 = v55 == 0, v55, v54, v56))
  {
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    v72 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3042000000;
    v74 = sub_1000D4018;
    v75[0] = sub_1000D4024;
    objc_initWeak(&v75[1], self);
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000D402C;
    v69[3] = &unk_1002879E8;
    v69[4] = buf;
    v69[5] = v71;
    v70 = v63;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController makeLockObserverWithHandler:](self, "makeLockObserverWithHandler:", v69));
    -[PHAudioCallViewController setStateChangeLockObservation:](self, "setStateChangeLockObservation:", v57);

    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    v68 = 0;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController traitCollection](self, "traitCollection"));
    v59 = objc_msgSend(v58, "_backlightLuminance");

    v68 = v59;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1000D4148;
    v65[3] = &unk_100287A10;
    v65[4] = buf;
    v65[5] = v67;
    v65[6] = v71;
    v66 = v63;
    -[PHAudioCallViewController setStateDisplayChangedObservation:](self, "setStateDisplayChangedObservation:", v65);
    _Block_object_dispose(v67, 8);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v75[1]);
    _Block_object_dispose(v71, 8);
  }

}

- (void)setCurrentState:(unsigned __int16)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  unsigned int v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  unsigned int v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  dispatch_time_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  __int16 v31;
  _OWORD v32[3];
  objc_super v33;
  uint8_t buf[4];
  unsigned int v35;
  __int16 v36;
  unsigned int v37;

  v4 = a4;
  v5 = a3;
  v7 = -[PHCallViewController currentState](self, "currentState");
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v35 = v5;
    v36 = 1024;
    v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Audio: setCurrentState: %d (existing state is %d)", buf, 0xEu);
  }

  if (v7 != (_DWORD)v5)
  {
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[PHCallViewController currentState](self, "currentState");
      *(_DWORD *)buf = 67109376;
      v35 = v12;
      v36 = 1024;
      v37 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Audio: Setting current state: %d -> %d", buf, 0xEu);
    }

    v33.receiver = self;
    v33.super_class = (Class)PHAudioCallViewController;
    -[PHCallViewController setCurrentState:](&v33, "setCurrentState:", v5);
    -[PHAudioCallViewController setStateChangeLockObservation:](self, "setStateChangeLockObservation:", 0);
    -[PHAudioCallViewController setStateDisplayChangedObservation:](self, "setStateDisplayChangedObservation:", 0);
    switch((int)v5)
    {
      case 0:
        -[PHAudioCallViewController setIdleState:](self, "setIdleState:", 0);
        goto LABEL_19;
      case 1:
        -[PHAudioCallViewController setRingingState:](self, "setRingingState:", 1);
        goto LABEL_19;
      case 2:
        -[PHAudioCallViewController setOutgoingRingingState:](self, "setOutgoingRingingState:", 2);
        goto LABEL_19;
      case 3:
        -[PHAudioCallViewController setWaitingState:](self, "setWaitingState:", 3);
        goto LABEL_45;
      case 4:
      case 5:
        v13 = -[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI");
        if ((_DWORD)v5 == 5 && (v13 & 1) != 0)
          return;
        -[PHAudioCallViewController setActiveState:](self, "setActiveState:", v5);
LABEL_19:
        if (v7 == 3)
          -[PHAudioCallViewController setShowsCallWaitingParticipantView:](self, "setShowsCallWaitingParticipantView:", 0);
        if (v5 <= 7 && ((1 << v5) & 0xC1) != 0)
          goto LABEL_23;
LABEL_45:
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        objc_msgSend(v29, "setUserInteractionEnabled:", 1);

        if ((_DWORD)v5 == 1)
          -[PHAudioCallViewController startSuppressionOfSTKAlerts](self, "startSuppressionOfSTKAlerts");
        else
LABEL_23:
          -[PHAudioCallViewController stopSuppressionOfSTKAlerts](self, "stopSuppressionOfSTKAlerts");
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        if (objc_msgSend(v14, "callDisplayStyle") == (id)3)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
          v16 = objc_msgSend(v15, "isDominoEnabled");

          if ((v16 & 1) != 0)
            goto LABEL_29;
        }
        else
        {

        }
        -[PHAudioCallViewController updateBottomBarAlphaWithCurrentState:](self, "updateBottomBarAlphaWithCurrentState:", v5);
LABEL_29:
        if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
          goto LABEL_33;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        if (objc_msgSend(v17, "callDisplayStyle") != (id)3)
          goto LABEL_36;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        if (!objc_msgSend(v18, "isDominoEnabled"))
          goto LABEL_35;

LABEL_33:
        if ((_DWORD)v5 == 7)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "singleCallLabelView"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "statusLabel"));
          v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
          v32[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
          v32[1] = v20;
          v32[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
          objc_msgSend(v19, "setTransform:", v32);

LABEL_35:
LABEL_36:

        }
        if (-[PHAudioCallViewController shouldShowNewPosterUpdates](self, "shouldShowNewPosterUpdates"))
        {
          v21 = dispatch_time(0, 950000000);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_1000D4790;
          v30[3] = &unk_100284AF8;
          v30[4] = self;
          v31 = v5;
          dispatch_after(v21, (dispatch_queue_t)&_dispatch_main_q, v30);
        }
        else
        {
          -[PHAudioCallViewController _updatePosterStatusLabelForState:](self, "_updatePosterStatusLabelForState:", v5);
          if (-[PHAudioCallViewController hasNoCallsOrOnlyEndedCalls](self, "hasNoCallsOrOnlyEndedCalls"))
          {
            v22 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
            if (v22)
            {
              v23 = (void *)v22;
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "priorityPosterNameTextView"));

              if (v25)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
                objc_msgSend(v27, "setAlpha:", 0.0);

              }
            }
          }
        }
        -[PHAudioCallViewController updateAmbientAudioRoutesVisibility](self, "updateAmbientAudioRoutesVisibility");
        -[PHAudioCallViewController updateShareNameAndPhotoHUDPresentationIfNeeded](self, "updateShareNameAndPhotoHUDPresentationIfNeeded");
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v28, "postNotificationName:object:", CFSTR("PHCallViewControllerStateChangedNotification"), 0);

        break;
      case 6:
        -[PHAudioCallViewController setEndingState:](self, "setEndingState:", 6);
        -[PHAudioCallViewController _testing_didTransitionToEndingCallState](self, "_testing_didTransitionToEndingCallState");
        goto LABEL_19;
      case 7:
        -[PHAudioCallViewController setEndedState:](self, "setEndedState:", 7);
        goto LABEL_19;
      case 8:
      case 9:
        -[PHAudioCallViewController setAlertModeNeededState:](self, "setAlertModeNeededState:", v5);
        goto LABEL_19;
      case 10:
        -[PHAudioCallViewController setCallBufferState:](self, "setCallBufferState:", 10);
        goto LABEL_19;
      case 11:
        -[PHAudioCallViewController setScreeningState:animated:](self, "setScreeningState:animated:", 11, v4);
        goto LABEL_19;
      default:
        goto LABEL_19;
    }
  }
}

- (void)updateBottomBarAlphaWithCurrentState:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  void *v11;
  double v12;
  id v13;

  v3 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v13, "isButtonLayoutEnabled"))
  {

    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v5, "callDisplayStyle") != (id)3)
  {

LABEL_20:
    return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v7 = objc_msgSend(v6, "isDominoEnabled");

  if (v7)
  {
LABEL_5:
    v8 = (unsigned __int16)(((unsigned __int16)(v3 - 1) >> 1) | (((_WORD)v3 - 1) << 15));
    v9 = v8 > 5 || ((1 << ((unsigned __int16)(v3 - 1) >> 1)) & 0x2B) == 0;
    if (v9
      || (v3 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager")),
          !objc_msgSend((id)v3, "callDisplayStyle")))
    {
      v10 = -[PHAudioCallViewController middleViewState](self, "middleViewState");
      if (v8 <= 5 && ((1 << v8) & 0x2B) != 0)

      if (v10 != 2)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        v13 = v11;
        v12 = 0.0;
        goto LABEL_19;
      }
    }
    else
    {

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    v13 = v11;
    v12 = 1.0;
LABEL_19:
    objc_msgSend(v11, "setAlpha:", v12);
    goto LABEL_20;
  }
}

- (void)updateIncomingBottomBarControlState
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  v4 = objc_msgSend(v3, "currentState");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentInCallScene"));
    if (objc_msgSend(v7, "isBeingShownAboveCoverSheet"))
      v8 = 4;
    else
      v8 = 0;

    v9 = (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v9, "setCurrentState:", v8);

  }
}

- (void)updateBottomBarButtonsWithCall:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(a3, "isMessagingAllowed");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v5, "setDeclineAndMessageIsAvailable:", v4);

}

- (void)updateHardPauseDigitsState
{
  void *v3;
  _BOOL8 v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  v4 = objc_msgSend(v3, "hardPauseDigitsState") == 2;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v5, "setAction:enabled:", 22, v4);

}

- (void)transitionToFullScreenIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (!objc_msgSend(v9, "callDisplayStyle"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
    objc_opt_class(SBSUIInCallWindowScene, v6);
    isKindOfClass = objc_opt_isKindOfClass(v5, v7);

    if ((isKindOfClass & 1) == 0)
      return;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController inCallRootViewController](self, "inCallRootViewController"));
    objc_msgSend(v9, "requestInCallSceneTransitionToFullScreen");
  }

}

- (BOOL)isUserInterfaceShowing
{
  void *v3;
  unsigned int v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
  v4 = objc_msgSend(v3, "hasAdoptedModernInCallAPI");

  if (!v4)
    return -[PHAudioCallViewController _appearState](self, "_appearState") == 2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v6 = objc_msgSend(v5, "callDisplayStyle") != (id)4;

  return v6;
}

- (id)isolatedCall
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentCalls"));

  if (objc_msgSend(v3, "count") == (id)1)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  else
    v4 = 0;

  return v4;
}

- (id)associatedCallGroupForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCallGroups"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calls"));
        v12 = objc_msgSend(v11, "containsObject:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)prioritizedCallIsInSameCallGroupAsCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController associatedCallGroupForCall:](self, "associatedCallGroupForCall:", v4));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calls"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getParticipantsView_WaitingOrNot
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_Waiting](self, "getParticipantsView_Waiting"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
  v6 = v5;

  return v6;
}

- (id)getParticipantsView_Waiting
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callWaitingParticipantsViewController](self, "callWaitingParticipantsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return v3;
}

- (id)getParticipantsView_NotWaiting
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return v3;
}

- (BOOL)callHasNoContactPoster
{
  void *v3;
  BOOL v4;

  if (!-[PHAudioCallViewController canShowPosterImage](self, "canShowPosterImage"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
  v4 = v3 == 0;

  return v4;
}

- (BOOL)callHasContactPosterWithHorizontalName
{
  if (-[PHAudioCallViewController callHasNoContactPoster](self, "callHasNoContactPoster"))
    return 0;
  else
    return !-[PHAudioCallViewController callHasContactPosterWithVerticalName](self, "callHasContactPosterWithVerticalName");
}

- (BOOL)callHasContactPosterWithVerticalName
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "posterNameTextView"));
  v6 = objc_msgSend(v5, "layout") == (id)1;

  return v6;
}

- (BOOL)canShowPosterBadgeInAudioCallView:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[PHAudioCallViewController participantsViewIsShowingMultipleLabel](self, "participantsViewIsShowingMultipleLabel"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "badgeView"));
    if (v6)
    {
      v5 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
      v5 = v7 != 0;

    }
  }

  return v5;
}

- (BOOL)usesCompactMulticallUI
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v3, "callManagerEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v4, "callDisplayStyle") == (id)3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v6 = objc_msgSend(v5, "isDominoEnabled") ^ 1;

    }
    else
    {
      LOBYTE(v6) = 1;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)newPosterConfigurationForCall:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  ICSPosterConfigurationWrapper *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  int v28;
  void *v29;

  v6 = a3;
  v7 = -[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout");
  if ((v7 & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v3, "callDisplayStyle") == (id)3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      if ((objc_msgSend(v4, "isDominoEnabled") & 1) != 0)
        goto LABEL_4;

    }
    goto LABEL_20;
  }
LABEL_4:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v9 = objc_msgSend(v8, "isNameAndPhotoC3Enabled");

  if ((v7 & 1) == 0)
  {

    if ((v9 & 1) != 0)
      goto LABEL_8;
LABEL_20:
    v18 = 0;
    goto LABEL_21;
  }
  if (!v9)
    goto LABEL_20;
LABEL_8:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController sharedProfileStateOracleForCall:](self, "sharedProfileStateOracleForCall:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pendingNickname"));

  if (v11
    && (v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wallpaper"))) != 0
    && (v13 = (void *)v12,
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wallpaper")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "wallpaperData")),
        v15,
        v14,
        v13,
        v15))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wallpaper"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "wallpaperData"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[PRSPosterArchiver unarchiveConfigurationFromData:error:](PRSPosterArchiver, "unarchiveConfigurationFromData:error:", v17, 0));
    v19 = sub_1000C5588();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueProxyIdentifier"));
      v28 = 138412290;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SNAP: unarchived a pending PRSPosterConfiguration for %@", (uint8_t *)&v28, 0xCu);

    }
    v22 = -[ICSPosterConfigurationWrapper initWithConfiguration:source:]([ICSPosterConfigurationWrapper alloc], "initWithConfiguration:source:", v18, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueProxyIdentifier"));
    objc_msgSend(v23, "setObject:forKey:", v22, v24);

  }
  else
  {
    v25 = sub_1000C5588();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SNAP: there is no newPosterConfiguration, current pendingNickName is %@", (uint8_t *)&v28, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
    v22 = -[ICSPosterConfigurationWrapper initWithConfiguration:source:]([ICSPosterConfigurationWrapper alloc], "initWithConfiguration:source:", 0, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueProxyIdentifier"));
    objc_msgSend(v17, "setObject:forKey:", v22, v23);
    v18 = 0;
  }

LABEL_21:
  return v18;
}

- (id)sharedProfileStateOracleForCall:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  int v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v4));
    v7 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController contactKeysToFetch](PHAudioCallViewController, "contactKeysToFetch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactForIdentifier:keysToFetch:usingCache:", v8, v9, v10));

    if (v11)
    {
      v12 = objc_msgSend(objc_alloc((Class)CNSharedProfileStateOracle), "initWithContact:contactStore:", v11, v7);
      v13 = sub_1000C5588();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SNAP: current CNSharedProfileStateOracle is %@", (uint8_t *)&v18, 0xCu);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v15 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
      v18 = 138412290;
      v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SNAP: call doesn't have contactIdentifier %@", (uint8_t *)&v18, 0xCu);

    }
    v12 = 0;
  }

  return v12;
}

- (BOOL)currentCallStateCanShowNewPoster
{
  PHAudioCallViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  LOBYTE(v2) = -[PHAudioCallViewController callStateCanShowNewPoster:](v2, "callStateCanShowNewPoster:", v3);

  return (char)v2;
}

- (BOOL)callStateCanShowNewPoster:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  BOOL v12;

  v6 = a3;
  v7 = -[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout");
  if ((v7 & 1) != 0)
    goto LABEL_2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v3, "callDisplayStyle") != (id)3)
  {
LABEL_8:

    goto LABEL_13;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if ((objc_msgSend(v4, "isDominoEnabled") & 1) == 0)
  {

    goto LABEL_8;
  }
LABEL_2:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v9 = objc_msgSend(v8, "isNameAndPhotoC3Enabled");

  if ((v7 & 1) != 0)
  {
    if (!v9)
      goto LABEL_13;
  }
  else
  {

    if ((v9 & 1) == 0)
      goto LABEL_13;
  }
  if (v6)
  {
    if (objc_msgSend(v6, "status") == 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v11 = objc_msgSend(v10, "currentCallCount");

      if ((unint64_t)v11 < 2)
      {
        v12 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  v12 = 0;
LABEL_14:

  return v12;
}

- (BOOL)shouldShowNewPosterUpdates
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  double v6;
  id v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  if (-[PHAudioCallViewController callStateCanShowNewPoster:](self, "callStateCanShowNewPoster:", v3))
  {
    v4 = -[PHAudioCallViewController suggestedNewPosterSourceAfterCallConnects:](self, "suggestedNewPosterSourceAfterCallConnects:", v3);
    *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
    v8 = objc_msgSend(v7, "posterSourceIsSyncedWithContacts:", v4, v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)finishNewPosterUpdatesWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  void (**v6)(id, void *);
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v6 = (void (**)(id, void *))a3;
  v7 = -[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout");
  if ((v7 & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v3, "callDisplayStyle") == (id)3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      if ((objc_msgSend(v4, "isDominoEnabled") & 1) != 0)
        goto LABEL_4;

    }
LABEL_17:

    goto LABEL_18;
  }
LABEL_4:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v9 = objc_msgSend(v8, "isNameAndPhotoC3Enabled");

  if ((v7 & 1) != 0)
  {
    if (!v9)
      goto LABEL_18;
    goto LABEL_8;
  }

  if ((v9 & 1) != 0)
  {
LABEL_8:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    v3 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "status") == 1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v12 = objc_msgSend(v11, "currentCallCount");

        if ((unint64_t)v12 <= 1)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController sharedProfileStateOracleForCall:](self, "sharedProfileStateOracleForCall:", v3));
          v18 = 0;
          v14 = objc_msgSend(v13, "updateContactAndNicknamesForAutoUpdateWithError:", &v18);
          v15 = v18;
          v16 = sub_1000C5588();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SNAP: new poster update completed with error: %@", buf, 0xCu);
          }

          if (v6)
            v6[2](v6, v13);

        }
      }
    }
    goto LABEL_17;
  }
LABEL_18:

}

- (BOOL)canShowPosterImage
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  unsigned int v9;

  if (!-[CNKFeatures isEnhancedEmergencyEnabled](self->_features, "isEnhancedEmergencyEnabled")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall")),
        v4 = objc_msgSend(v3, "isEmergency"),
        v3,
        (v4 & 1) == 0))
  {
    if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
    {
LABEL_4:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      v6 = objc_msgSend(v5, "callDisplayStyle") != 0;
LABEL_12:

      return v6;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v7, "callDisplayStyle") == (id)3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v9 = objc_msgSend(v8, "isDominoEnabled");

      if (v9)
        goto LABEL_4;
    }
    else
    {

    }
    if (!-[PHAudioCallViewController wasPresentedAsBanner](self, "wasPresentedAsBanner"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v6 = objc_msgSend(v5, "userInterfaceIdiom") == 0;
      goto LABEL_12;
    }
  }
  return 0;
}

- (BOOL)canShowBackgroundImage
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;

  if (!-[CNKFeatures isEnhancedEmergencyEnabled](self->_features, "isEnhancedEmergencyEnabled")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall")),
        v4 = objc_msgSend(v3, "isEmergency"),
        v3,
        (v4 & 1) == 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v6, "callDisplayStyle") == (id)3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v8 = objc_msgSend(v7, "isDominoEnabled");

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v5 = objc_msgSend(v9, "callDisplayStyle") != 0;
LABEL_11:

        return v5;
      }
    }
    else
    {

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v9, "userInterfaceIdiom"))
    {
      v5 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      v5 = objc_msgSend(v10, "callDisplayStyle") != 0;

    }
    goto LABEL_11;
  }
  return 0;
}

- (BOOL)shouldApplyNewGradientBlur
{
  void *v2;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;

  if (!-[CNKFeatures isEnhancedEmergencyEnabled](self->_features, "isEnhancedEmergencyEnabled")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall")),
        v5 = objc_msgSend(v4, "isEmergency"),
        v4,
        (v5 & 1) == 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "provider"));
    v9 = objc_msgSend(v8, "isSystemProvider");
    if ((v9 & 1) != 0
      || (v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper")),
          objc_msgSend(v2, "status") != 4))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v6 = objc_msgSend(v10, "isHeroImageEnabled");

      if ((v9 & 1) != 0)
      {
LABEL_9:

        return v6;
      }
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_9;
  }
  return 0;
}

- (BOOL)isShowingBackgroundImage
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isShowing6UP
{
  return -[PHAudioCallViewController middleViewState](self, "middleViewState") == 1;
}

- (BOOL)shouldShowCircularAvatar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;

  if (-[CNKFeatures isEnhancedEmergencyEnabled](self->_features, "isEnhancedEmergencyEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentCalls"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

      if (!v3)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mostRecentlyDisconnectedAudioCall"));

      }
    }
    v8 = objc_msgSend(v3, "isEmergency");

    if ((v8 & 1) != 0)
      return 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v10, "callDisplayStyle") == (id)3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v12 = objc_msgSend(v11, "isDominoEnabled");

    if ((v12 & 1) != 0)
      return 1;
  }
  else
  {

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v14 = (unint64_t)objc_msgSend(v13, "userInterfaceIdiom");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v16 = (unint64_t)objc_msgSend(v15, "callDisplayStyle");

  if (!-[PHAudioCallViewController shouldShowContactOrLastSeenWallpaper](self, "shouldShowContactOrLastSeenWallpaper"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));

    if (!v17 && -[PHAudioCallViewController shouldApplyNewGradientBlur](self, "shouldApplyNewGradientBlur"))
      return 1;
  }
  return (v14 | v16) == 0;
}

- (id)contactToDisplayInCallWallpaperForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier")), v6, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v5));
    v8 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController contactKeysToFetch](PHAudioCallViewController, "contactKeysToFetch"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactForIdentifier:keysToFetch:usingCache:", v9, v10, v11));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactChangesNotifier sharedNotifier](CNContactChangesNotifier, "sharedNotifier"));
      objc_msgSend(v13, "unregisterObserver:forContact:", self, 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactChangesNotifier sharedNotifier](CNContactChangesNotifier, "sharedNotifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController contactKeysToFetch](PHAudioCallViewController, "contactKeysToFetch"));
      objc_msgSend(v14, "registerObserver:forContact:keysToFetch:", self, v12, v15);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)contactWallpaperForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  int v23;
  id v24;

  v4 = a3;
  if (!-[CNKFeatures isEnhancedEmergencyEnabled](self->_features, "isEnhancedEmergencyEnabled")
    || (objc_msgSend(v4, "isEmergency") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "siriDisplayName"));
      if (objc_msgSend(v8, "length"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
        v10 = objc_msgSend(v9, "shouldHideContact");

        if (v10)
        {
          v11 = sub_1000C5588();
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v23 = 138412290;
            v24 = v4;
            v13 = "SNAP: call initiated with Siri using a phone or email on a lock device, not showing the wallpaper %@";
LABEL_11:
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, 0xCu);
            goto LABEL_12;
          }
          goto LABEL_12;
        }
      }
      else
      {

      }
      v12 = objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v4));
      v15 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController contactKeysToFetch](PHAudioCallViewController, "contactKeysToFetch"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contactForIdentifier:keysToFetch:usingCache:", v16, v17, v18));

      v20 = sub_1000C5588();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412290;
        v24 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SNAP: the contact we used to fetch wallpaper for call is %@", (uint8_t *)&v23, 0xCu);
      }

      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "wallpaper"));
      if (v5)
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "wallpaper"));

      goto LABEL_19;
    }
    v14 = sub_1000C5588();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v4;
      v13 = "SNAP: call doesn't have contactIdentifier %@";
      goto LABEL_11;
    }
LABEL_12:
    v5 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v5 = 0;
LABEL_20:

  return v5;
}

- (id)wallpaperTypeForCNWallpaper:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "extensionBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTypeForBundleID:](self, "wallpaperTypeForBundleID:", v4));

  return v5;
}

- (id)wallpaperTypeForIMWallpaperMetadata:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTypeForBundleID:](self, "wallpaperTypeForBundleID:", v4));

  return v5;
}

- (id)wallpaperTypeForBundleID:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider")) & 1) != 0)
  {
    v4 = (id *)&CNWallpaperTypePhoto;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.AvatarUI.AvatarPosterExtension")) & 1) != 0)
  {
    v4 = (id *)&CNWallpaperTypeMemoji;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ContactsUI.MonogramPosterExtension")))
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = (id *)&CNWallpaperTypeMonogram;
  }
  v5 = *v4;
LABEL_8:

  return v5;
}

- (BOOL)shouldShowContactOrLastSeenWallpaper
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v3, "callDisplayStyle") == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    if (objc_msgSend(v4, "isDominoEnabled"))
    {

      goto LABEL_13;
    }
    v10 = -[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout");

    if ((v10 & 1) == 0)
      return 0;
  }
  else
  {
    v5 = -[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout");

    if (!v5)
      return 0;
  }
  if (!-[PHAudioCallViewController hasNoCallsOrOnlyEndedCalls](self, "hasNoCallsOrOnlyEndedCalls")
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController")),
        v6,
        !v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
    v3 = v8;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactIdentifier"));

      if (v9)
      {
        if (-[PHAudioCallViewController callStateCanShowNewPoster:](self, "callStateCanShowNewPoster:", v3)
          || !-[PHAudioCallViewController prefersShowingCachedLastSeenPosterBeforeCallConnected:](self, "prefersShowingCachedLastSeenPosterBeforeCallConnected:", v3))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactWallpaperForCall:](self, "contactWallpaperForCall:", v3));
          v7 = v12 != 0;

        }
        else
        {
          v7 = -[PHAudioCallViewController hasLastSeenPosterForCall:](self, "hasLastSeenPosterForCall:", v3);
        }
        goto LABEL_14;
      }
    }
LABEL_13:
    v7 = 0;
LABEL_14:

    return v7;
  }
  return 1;
}

- (id)lastSeenOrCurrentPosterConfigurationForCall:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (-[PHAudioCallViewController prefersShowingCachedLastSeenPosterBeforeCallConnected:](self, "prefersShowingCachedLastSeenPosterBeforeCallConnected:", v4))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController lastSeenPosterConfigurationForCall:](self, "lastSeenPosterConfigurationForCall:", v4));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactWallpaperConfigurationForCall:shouldReadFromCache:](self, "contactWallpaperConfigurationForCall:shouldReadFromCache:", v4, 1));
  }
  v6 = (void *)v5;

  return v6;
}

- (id)lastSeenPosterConfigurationForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  ICSPosterConfigurationWrapper *v28;
  void *v29;
  void *v30;
  int v32;
  void *v33;

  v4 = a3;
  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
LABEL_4:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));

    if (v11)
    {
      v12 = sub_1000C5588();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callUUID"));
        v32 = 138412290;
        v33 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SNAP: Returning a cached PRSPosterConfiguration for %@", (uint8_t *)&v32, 0xCu);

      }
      v15 = v11;
      goto LABEL_22;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "siriDisplayName"));
    if (objc_msgSend(v17, "length"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
      v19 = objc_msgSend(v18, "shouldHideContact");

      if (v19)
      {
        v20 = sub_1000C5588();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
          v32 = 138412290;
          v33 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SNAP: call initiated with Siri using a phone or email on a lock device, not showing the wallpaper for callUUID %@", (uint8_t *)&v32, 0xCu);

        }
        goto LABEL_20;
      }
    }
    else
    {

    }
    v23 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController readCachedLastSeenPosterDataForCall:](self, "readCachedLastSeenPosterDataForCall:", v4));
    if (v23)
    {
      v24 = (void *)v23;
      v15 = (id)objc_claimAutoreleasedReturnValue(+[PRSPosterArchiver unarchiveConfigurationFromData:error:](PRSPosterArchiver, "unarchiveConfigurationFromData:error:", v23, 0));
      v25 = sub_1000C5588();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
        v32 = 138412290;
        v33 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SNAP: unarchived a lastSeen PRSPosterConfiguration for %@", (uint8_t *)&v32, 0xCu);

      }
      v28 = -[ICSPosterConfigurationWrapper initWithConfiguration:source:]([ICSPosterConfigurationWrapper alloc], "initWithConfiguration:source:", v15, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
      objc_msgSend(v29, "setObject:forKey:", v28, v30);

      goto LABEL_21;
    }
LABEL_20:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
    v28 = -[ICSPosterConfigurationWrapper initWithConfiguration:source:]([ICSPosterConfigurationWrapper alloc], "initWithConfiguration:source:", 0, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
    objc_msgSend(v24, "setObject:forKey:", v28, v29);
    v15 = 0;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v5, "callDisplayStyle") == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v7 = objc_msgSend(v6, "isDominoEnabled");

    if (v7)
      goto LABEL_4;
  }
  else
  {

  }
  v15 = 0;
LABEL_23:

  return v15;
}

- (id)contactWallpaperConfigurationForCall:(id)a3 shouldReadFromCache:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  ICSPosterConfigurationWrapper *v24;
  ICSPosterConfigurationWrapper *v25;
  void *v26;
  void *v27;
  ICSPosterConfigurationWrapper *v28;
  void *v29;
  id v30;
  int v32;
  NSObject *v33;
  __int16 v34;
  id v35;

  v4 = a4;
  v6 = a3;
  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
    goto LABEL_4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v7, "callDisplayStyle") != (id)3)
  {

    goto LABEL_16;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v9 = objc_msgSend(v8, "isDominoEnabled");

  if (!v9)
  {
LABEL_16:
    v14 = 0;
    goto LABEL_25;
  }
LABEL_4:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactWallpaperForCall:](self, "contactWallpaperForCall:", v6));
  if (v10)
  {
    if (v4
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueProxyIdentifier")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12)),
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration")),
          v13,
          v12,
          v11,
          v14))
    {
      v15 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callUUID"));
        v32 = 138412290;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SNAP: Returning a cached PRSPosterConfiguration for %@", (uint8_t *)&v32, 0xCu);

      }
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "posterArchiveData"));
      v18 = sub_1000C5588();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v20)
        {
          v32 = 138412546;
          v33 = v16;
          v34 = 2048;
          v35 = -[NSObject length](v16, "length");
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SNAP: posterArchiveData in wallpaper is %@, length is %lu", (uint8_t *)&v32, 0x16u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[PRSPosterArchiver unarchiveConfigurationFromData:error:](PRSPosterArchiver, "unarchiveConfigurationFromData:error:", v16, 0));
        v21 = sub_1000C5588();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueProxyIdentifier"));
          v32 = 138412290;
          v33 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SNAP: unarchived a contact (current) PRSPosterConfiguration for %@", (uint8_t *)&v32, 0xCu);

        }
        v24 = -[ICSPosterConfigurationWrapper initWithConfiguration:source:]([ICSPosterConfigurationWrapper alloc], "initWithConfiguration:source:", v14, 2);
        v25 = (ICSPosterConfigurationWrapper *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueProxyIdentifier"));
        -[ICSPosterConfigurationWrapper setObject:forKey:](v25, "setObject:forKey:", v24, v26);
      }
      else
      {
        if (v20)
        {
          LOWORD(v32) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SNAP: there is no posterArchiveData in wallpaper", (uint8_t *)&v32, 2u);
        }

        v24 = (ICSPosterConfigurationWrapper *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
        v25 = -[ICSPosterConfigurationWrapper initWithConfiguration:source:]([ICSPosterConfigurationWrapper alloc], "initWithConfiguration:source:", 0, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueProxyIdentifier"));
        -[ICSPosterConfigurationWrapper setObject:forKey:](v24, "setObject:forKey:", v25, v26);
        v14 = 0;
      }

    }
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
    v28 = -[ICSPosterConfigurationWrapper initWithConfiguration:source:]([ICSPosterConfigurationWrapper alloc], "initWithConfiguration:source:", 0, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueProxyIdentifier"));
    objc_msgSend(v27, "setObject:forKey:", v28, v29);

    v30 = sub_1000C5588();
    v16 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SNAP: contactWallpaperForCall is nil", (uint8_t *)&v32, 2u);
    }
    v14 = 0;
  }

LABEL_25:
  return v14;
}

- (id)wallpaperTitleStyleAttributesForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v18;

  v4 = a3;
  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
LABEL_4:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController lastSeenOrCurrentPosterConfigurationForCall:](self, "lastSeenOrCurrentPosterConfigurationForCall:", v4));
    if (!v8)
    {
      v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
      if ((objc_msgSend(v12, "isEqual:", v8) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "titleStyleAttributes"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "titleStyleAttributes"));
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {

      }
    }
    v18 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PRUISPosterConfigurationUtilities titleStyleAttributesForConfiguration:error:](PRUISPosterConfigurationUtilities, "titleStyleAttributesForConfiguration:error:", v8, &v18));
    if (v11)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
      v16 = objc_msgSend(v15, "isEqual:", v8);

      if (v16)
        objc_msgSend(v11, "setTitleStyleAttributes:", v14);
    }
    goto LABEL_16;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v5, "callDisplayStyle") == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v7 = objc_msgSend(v6, "isDominoEnabled");

    if (v7)
      goto LABEL_4;
  }
  else
  {

  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (id)wallpaperTitleStyleAttributes
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTitleStyleAttributesForCall:](self, "wallpaperTitleStyleAttributesForCall:", v3));

  return v4;
}

- (id)contactWallpaperBackgroundColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
  if (!-[PHAudioCallViewController callStateCanShowNewPoster:](self, "callStateCanShowNewPoster:", v3)
    && -[PHAudioCallViewController prefersShowingCachedLastSeenPosterBeforeCallConnected:](self, "prefersShowingCachedLastSeenPosterBeforeCallConnected:", v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController lastSeenPosterIMWallpaperMetadataForCall:](self, "lastSeenPosterIMWallpaperMetadataForCall:", v3));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
LABEL_6:
    v7 = (void *)v5;
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactWallpaperForCall:](self, "contactWallpaperForCall:", v3));
  v4 = v6;
  if (v6)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColorDescription"));
    goto LABEL_6;
  }
  v7 = 0;
LABEL_8:

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CNWallpaperColorDescriptionKeyRed));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CNWallpaperColorDescriptionKeyGreen));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CNWallpaperColorDescriptionKeyBlue));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CNWallpaperColorDescriptionKeyAlpha));
  v12 = (void *)v11;
  if (v8)
    v13 = v9 == 0;
  else
    v13 = 1;
  if (v13 || v10 == 0 || v11 == 0)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v8, "doubleValue");
    v17 = v16;
    objc_msgSend(v9, "doubleValue");
    v19 = v18;
    objc_msgSend(v10, "doubleValue");
    v21 = v20;
    objc_msgSend(v12, "doubleValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v17, v19, v21, v22));
  }

  return v23;
}

- (void)updateLegacyBackgroundImageVisibilityWithShouldShowWallpaper:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  double v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v3 = a3;
  v5 = -[PHAudioCallViewController canShowBackgroundImage](self, "canShowBackgroundImage");
  v6 = (double)!v3;
  if (!v5)
    v6 = 0.0;
  -[PHBackgroundGradientBlurView setAlpha:](self->_backgroundImageView, "setAlpha:", v6);
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PHBackgroundGradientBlurView alpha](self->_backgroundImageView, "alpha");
    v10 = 134217984;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SNAP: updated legacyBackgroundImageVisibility to %f", (uint8_t *)&v10, 0xCu);
  }

}

- (BOOL)setCallForBackgroundImage:(id)a3 animated:(BOOL)a4 callDisplayStyleChanged:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  int v21;
  id v22;

  v5 = a5;
  v7 = a3;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setCallForBackgroundImage to: %@", (uint8_t *)&v21, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callForBackgroundImage](self, "callForBackgroundImage"));
  if ((objc_msgSend(v10, "isEqual:", v7) & 1) != 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callForBackgroundImage](self, "callForBackgroundImage"));
    v12 = v11 == 0;
    v13 = v7 != 0;
    v14 = v13 && v12;
    if (v13 && v12)
      v15 = 0;
    else
      v15 = (void *)v11;

    if (!v14 && !v5)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView"));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));

      -[PHAudioCallViewController hideOrShowThirdPartyBackgroundImageWithImage:](self, "hideOrShowThirdPartyBackgroundImageWithImage:", v17);
      goto LABEL_18;
    }
  }
  else
  {

  }
  if (v7)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactImageDataForCall:](self, "contactImageDataForCall:", v7));
    if (v18)
      v17 = objc_msgSend(objc_alloc((Class)UIImage), "initWithData:", v18);
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }
  -[PHAudioCallViewController setBackgroundImage:](self, "setBackgroundImage:", v17);
  -[PHAudioCallViewController setCallForBackgroundImage:](self, "setCallForBackgroundImage:", v7);
LABEL_18:
  -[PHAudioCallViewController updateLegacyBackgroundImageVisibilityWithShouldShowWallpaper:](self, "updateLegacyBackgroundImageVisibilityWithShouldShowWallpaper:", -[PHAudioCallViewController callHasNoContactPoster](self, "callHasNoContactPoster") ^ 1);
  if (v17)
    v19 = -[PHAudioCallViewController canShowBackgroundImage](self, "canShowBackgroundImage");
  else
    v19 = 0;

  return v19;
}

- (id)contactImageDataForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  int v25;
  void *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "siriDisplayName"));
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
    v8 = objc_msgSend(v7, "shouldHideContact") ^ 1;

  }
  else
  {
    v8 = 1;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
  v10 = 0;
  if (v9 && v8)
  {
    v11 = sub_1000C5588();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SNAP: trying to fetch contactImageData", (uint8_t *)&v25, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v4));
    v14 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController contactKeysToFetch](PHAudioCallViewController, "contactKeysToFetch"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contactForIdentifier:keysToFetch:usingCache:", v15, v16, v17));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fullscreenImageData"));
      v20 = v19;
      if (v19)
        v21 = v19;
      else
        v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageData"));
      v10 = v21;

    }
    else
    {
      v10 = 0;
    }

  }
  v22 = sub_1000C5588();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SNAP: contactImageDataForCall is %@", (uint8_t *)&v25, 0xCu);
  }

  return v10;
}

- (id)contactImageForCall:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (v5 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactImageDataForCall:](self, "contactImageDataForCall:", v4))) != 0)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v5));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)contactImage
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactImageForCall:](self, "contactImageForCall:", v3));

  return v4;
}

- (void)setBackgroundImage:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int *v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  BOOL v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v4, "callDisplayStyle") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v6 = objc_msgSend(v5, "isDominoEnabled");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
      if (-[PHAudioCallViewController callStateCanShowNewPoster:](self, "callStateCanShowNewPoster:", v7)
        || !-[PHAudioCallViewController prefersShowingCachedLastSeenPosterBeforeCallConnected:](self, "prefersShowingCachedLastSeenPosterBeforeCallConnected:", v7))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactWallpaperForCall:](self, "contactWallpaperForCall:", v7));
        v9 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTypeForCNWallpaper:](self, "wallpaperTypeForCNWallpaper:", v8));
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController lastSeenPosterIMWallpaperMetadataForCall:](self, "lastSeenPosterIMWallpaperMetadataForCall:", v7));
        v9 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTypeForIMWallpaperMetadata:](self, "wallpaperTypeForIMWallpaperMetadata:", v8));
      }
      v15 = (void *)v9;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      if ((unint64_t)objc_msgSend(v16, "currentCallCount") <= 1)
      {

      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "incomingCall"));

        if (v18)
        {
          v19 = &OBJC_IVAR___PHAudioCallViewController__shouldShowLargeAvatarForCallWaiting;
LABEL_24:
          v21 = *((unsigned __int8 *)&self->super.super.super.super.isa + *v19);
          v22 = -[PHCallViewController currentState](self, "currentState");
          if (v15 == (void *)CNWallpaperTypeMemoji || v15 == (void *)CNWallpaperTypeMonogram)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactWallpaperBackgroundColor](self, "contactWallpaperBackgroundColor"));
            if (v25)
            {
              -[PHAudioCallViewController setBackgroundColor:animated:](self, "setBackgroundColor:animated:", v25, 1);
            }
            else
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
              -[PHAudioCallViewController setBackgroundColor:animated:](self, "setBackgroundColor:animated:", v27, 1);

            }
            -[PHAudioCallViewController removeBackgroundContactImageView](self, "removeBackgroundContactImageView");
          }
          else
          {
            if (v21)
              v23 = 1;
            else
              v23 = v22 == 11;
            v24 = v23;
            if (v28 && v24)
            {
              -[PHAudioCallViewController updateBackgroundContactImageViewWithImage:animated:](self, "updateBackgroundContactImageViewWithImage:animated:", v28, 1);
            }
            else
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
              -[PHAudioCallViewController setBackgroundColor:animated:](self, "setBackgroundColor:animated:", v26, 1);

            }
          }

          goto LABEL_41;
        }
      }
      v20 = -[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI");
      v19 = &OBJC_IVAR___PHAudioCallViewController__shouldShowLargeAvatar;
      if (v20)
        v19 = &OBJC_IVAR___PHAudioCallViewController__shouldShowLargeAvatarForCallWaiting;
      goto LABEL_24;
    }
  }
  else
  {

  }
  if (v28 && -[PHAudioCallViewController canShowBackgroundImage](self, "canShowBackgroundImage")
    || -[PHAudioCallViewController shouldShowContactOrLastSeenWallpaper](self, "shouldShowContactOrLastSeenWallpaper"))
  {
    -[PHAudioCallViewController updateBackgroundContactImageViewWithImage:animated:](self, "updateBackgroundContactImageViewWithImage:animated:", v28, 0);
    -[PHAudioCallViewController updateLayeredBackgroundWallpaper](self, "updateLayeredBackgroundWallpaper");
    -[PHAudioCallViewController removeDefaultBackgroundGradientView](self, "removeDefaultBackgroundGradientView");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v11 = objc_msgSend(v10, "callDisplayStyle");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mostRecentlyDisconnectedAudioCall"));

      if (!v14
        || !objc_msgSend(v14, "isEmergency")
        || (objc_msgSend(v14, "disconnectedReasonRequiresCallBackUI") & 1) == 0)
      {
        -[PHAudioCallViewController addDefaultBackgroundGradientView](self, "addDefaultBackgroundGradientView");
      }
      -[PHAudioCallViewController updateLayeredBackgroundWallpaper](self, "updateLayeredBackgroundWallpaper");
      -[PHAudioCallViewController removeBackgroundContactImageView](self, "removeBackgroundContactImageView");

    }
  }
LABEL_41:

}

- (void)setBackgroundColor:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D7AD4;
  v10[3] = &unk_100285158;
  v10[4] = self;
  v5 = a3;
  v11 = v5;
  v6 = objc_retainBlock(v10);
  v7 = v6;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000D7B10;
    v8[3] = &unk_100284E18;
    v9 = v6;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.5);

  }
  else
  {
    ((void (*)(_QWORD *))v6[2])(v6);
  }

}

- (void)updateBackgroundContactImageViewWithImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  PHBackgroundGradientBlurView *backgroundImageView;
  PHBackgroundGradientBlurView *v10;
  PHBackgroundGradientBlurView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSDictionary *v18;
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
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  _QWORD v47[4];
  uint8_t buf[4];
  id v49;

  v4 = a4;
  v6 = a3;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SNAP: update backgroundContactImageView withImage: %@", buf, 0xCu);
  }

  if (-[PHAudioCallViewController isShowingBackgroundImage](self, "isShowingBackgroundImage"))
  {
    if (v4)
    {
      backgroundImageView = self->_backgroundImageView;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000D8074;
      v44[3] = &unk_100285158;
      v44[4] = self;
      v45 = v6;
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", backgroundImageView, 5242880, v44, 0, 0.5);

    }
    else
    {
      -[PHBackgroundGradientBlurView setImage:](self->_backgroundImageView, "setImage:", v6);
      -[PHBackgroundGradientBlurView setAlpha:](self->_backgroundImageView, "setAlpha:", 1.0);
    }
    goto LABEL_15;
  }
  v10 = -[PHBackgroundGradientBlurView initWithImage:]([PHBackgroundGradientBlurView alloc], "initWithImage:", v6);
  v11 = self->_backgroundImageView;
  self->_backgroundImageView = v10;

  -[PHBackgroundGradientBlurView setContentMode:](self->_backgroundImageView, "setContentMode:", 2);
  -[PHBackgroundGradientBlurView setClipsToBounds:](self->_backgroundImageView, "setClipsToBounds:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  objc_msgSend(v12, "insertSubview:atIndex:", self->_backgroundImageView, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));

  objc_msgSend(v14, "updateBackgroundMaterial:", 1);
  -[PHBackgroundGradientBlurView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v15, "callDisplayStyle") != (id)3)
  {

    goto LABEL_11;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v17 = objc_msgSend(v16, "isDominoEnabled");

  if (!v17)
  {
LABEL_11:
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHBackgroundGradientBlurView topAnchor](self->_backgroundImageView, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v34));
    v47[0] = v40;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHBackgroundGradientBlurView bottomAnchor](self->_backgroundImageView, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v47[1] = v35;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHBackgroundGradientBlurView leadingAnchor](self->_backgroundImageView, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v43 = v6;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
    v41 = v14;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v25));
    v47[2] = v26;
    v42 = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHBackgroundGradientBlurView trailingAnchor](self->_backgroundImageView, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
    v47[3] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    v22 = v33;
    v23 = (void *)v34;

    v4 = v42;
    v14 = v41;

    v6 = v43;
    v19 = v39;

    goto LABEL_12;
  }
  -[PHBackgroundGradientBlurView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = _NSDictionaryOfVariableBindings(CFSTR("_backgroundImageView"), self->_backgroundImageView, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_backgroundImageView]|"), 0, 0, v19));
  objc_msgSend(v20, "addConstraints:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_backgroundImageView]|"), 0, 0, v19));
  objc_msgSend(v22, "addConstraints:", v23);
LABEL_12:

  if (v4)
  {
    -[PHBackgroundGradientBlurView setAlpha:](self->_backgroundImageView, "setAlpha:", 0.0);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000D805C;
    v46[3] = &unk_100284898;
    v46[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v46, 0.5);
  }

LABEL_15:
  -[PHAudioCallViewController hideOrShowThirdPartyBackgroundImageWithImage:](self, "hideOrShowThirdPartyBackgroundImageWithImage:", v6);

}

- (void)hideOrShowThirdPartyBackgroundImageWithImage:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  if (!-[CNKFeatures isEnhancedEmergencyEnabled](self->_features, "isEnhancedEmergencyEnabled")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall")),
        v5 = objc_msgSend(v4, "isEmergency"),
        v4,
        (v5 & 1) == 0))
  {
    if (-[PHAudioCallViewController shouldApplyNewGradientBlur](self, "shouldApplyNewGradientBlur")
      || -[PHAudioCallViewController shouldShowContactOrLastSeenWallpaper](self, "shouldShowContactOrLastSeenWallpaper"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController unblurredBackgroundImageView](self, "unblurredBackgroundImageView"));
      objc_msgSend(v6, "removeFromSuperview");

      -[PHAudioCallViewController setUnblurredBackgroundImageView:](self, "setUnblurredBackgroundImageView:", 0);
    }
    else
    {
      v7 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v22);
      -[PHAudioCallViewController setUnblurredBackgroundImageView:](self, "setUnblurredBackgroundImageView:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      objc_msgSend(v8, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController unblurredBackgroundImageView](self, "unblurredBackgroundImageView"));
      objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController unblurredBackgroundImageView](self, "unblurredBackgroundImageView"));
      objc_msgSend(v18, "setContentMode:", 2);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController unblurredBackgroundImageView](self, "unblurredBackgroundImageView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView"));
      objc_msgSend(v19, "insertSubview:above:", v20, v21);

    }
  }

}

- (id)fallbackHorizontalNameLabelString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController associatedCallGroupForCall:](self, "associatedCallGroupForCall:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nameForCallGroup:", v4));

  return v6;
}

- (id)createContactFirstNameLabelViewModel
{
  void *v3;
  void *v4;
  void *v5;
  PHPosterNameViewModel *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactToDisplayInCallWallpaperForCall:](self, "contactToDisplayInCallWallpaperForCall:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPIncomingCallMetricsProvider appropriateCallerNameViewForContact:callStatus:callIsActive:](TPIncomingCallMetricsProvider, "appropriateCallerNameViewForContact:callStatus:callIsActive:", v4, 0, 1));

  -[PHAudioCallViewController applyWallpaperTitleStyleAttributesToTextViewWrapper:](self, "applyWallpaperTitleStyleAttributesToTextViewWrapper:", v5);
  objc_msgSend(v5, "overrideTitleLayoutWith:", 0);
  v6 = -[PHPosterNameViewModel initWithCall:posterNameTextView:]([PHPosterNameViewModel alloc], "initWithCall:posterNameTextView:", v3, v5);

  return v6;
}

- (void)applyWallpaperTitleStyleAttributesToTextViewWrapper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTitleStyleAttributes](self, "wallpaperTitleStyleAttributes"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleFont"));
    objc_msgSend(v7, "setTextFontUsingDefaultFontSizes:", v6);

    objc_msgSend(v7, "setPreferredAlignment:", objc_msgSend(v5, "preferredTitleAlignment"));
    objc_msgSend(v7, "setPreferredLayout:", 0);
  }

}

- (void)removeFirstNameLabelFromViewIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadPosterNameViewModel](self, "keypadPosterNameViewModel"));

  if (v3)
    -[PHAudioCallViewController setKeypadPosterNameViewModel:](self, "setKeypadPosterNameViewModel:", 0);
}

- (void)hideFirstNameLabelOnKeypad
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadPosterNameViewModel](self, "keypadPosterNameViewModel"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadPosterNameViewModel](self, "keypadPosterNameViewModel"));
    objc_msgSend(v4, "updatePosterNameAlpha:", 0.0);

  }
}

- (void)showFirstNameLabelOnKeypad
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadPosterNameViewModel](self, "keypadPosterNameViewModel"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadPosterNameViewModel](self, "keypadPosterNameViewModel"));
    objc_msgSend(v4, "updatePosterNameAlpha:", 1.0);

  }
}

- (id)createBlurryBackgroundView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControls](UIColorEffect, "inCallControls"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 50.0));
  v5 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  objc_msgSend(v6, "frame");
  objc_msgSend(v5, "setFrame:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
  if (v7)
  {

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView"));
    if (!v10
      || (v11 = (void *)v10,
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView")),
          objc_msgSend(v12, "alpha"),
          v14 = v13,
          v12,
          v11,
          v14 == 0.0))
    {
      v17 = v4;
      v8 = &v17;
      v9 = 1;
      goto LABEL_7;
    }
  }
  v18 = v4;
  v19 = v3;
  v8 = &v18;
  v9 = 2;
LABEL_7:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, v9, v17, v18, v19));
  objc_msgSend(v5, "setBackgroundEffects:", v15);

  return v5;
}

- (void)hideOrShowKeypadBackgroundView
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
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
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  _QWORD v44[2];
  void *v45;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v4 = objc_msgSend(v3, "isDialPadEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    v6 = objc_msgSend(v5, "currentState");

    if (v6 != (id)19)
    {
      -[PHAudioCallViewController removeFirstNameLabelFromViewIfNeeded](self, "removeFirstNameLabelFromViewIfNeeded");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadBackgroundView](self, "keypadBackgroundView"));

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadBackgroundView](self, "keypadBackgroundView"));
        objc_msgSend(v20, "removeFromSuperview");

        -[PHAudioCallViewController setKeypadBackgroundView:](self, "setKeypadBackgroundView:", 0);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyTextViaSatelliteLabel](self, "emergencyTextViaSatelliteLabel"));

      if (!v21)
        goto LABEL_26;
      v22 = (double)-[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton");
      goto LABEL_25;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadBackgroundView](self, "keypadBackgroundView"));

    if (v7)
    {
LABEL_23:
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyTextViaSatelliteLabel](self, "emergencyTextViaSatelliteLabel"));

      if (!v39)
        goto LABEL_26;
      v22 = (double)(-[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton") ^ 1);
LABEL_25:
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyTextViaSatelliteLabel](self, "emergencyTextViaSatelliteLabel"));
      objc_msgSend(v40, "setAlpha:", v22);

LABEL_26:
      -[PHAudioCallViewController _updateStatusLabelVisibility](self, "_updateStatusLabelVisibility");
      if (-[CNKFeatures isEnhancedEmergencyEnabled](self->_features, "isEnhancedEmergencyEnabled"))
        -[PHAudioCallViewController removeEnhancedEmergencyIntermittentStateLabel](self, "removeEnhancedEmergencyIntermittentStateLabel");
      return;
    }
    -[PHAudioCallViewController setHasKeypadUpdated:](self, "setHasKeypadUpdated:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController createBlurryBackgroundView](self, "createBlurryBackgroundView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
      objc_msgSend(v10, "insertSubview:above:", v8, v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController createContactFirstNameLabelViewModel](self, "createContactFirstNameLabelViewModel"));
      -[PHAudioCallViewController setKeypadPosterNameViewModel:](self, "setKeypadPosterNameViewModel:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadPosterNameViewModel](self, "keypadPosterNameViewModel"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "posterNameTextView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
      +[TPIncomingCallMetricsProvider addCallerNameView:toContainerView:](TPIncomingCallMetricsProvider, "addCallerNameView:toContainerView:", v15, v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v18 = objc_msgSend(v17, "currentCallCount");

      if ((unint64_t)v18 >= 2)
        -[PHAudioCallViewController hideFirstNameLabelOnKeypad](self, "hideFirstNameLabelOnKeypad");
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController defaultBackgroundGradientView](self, "defaultBackgroundGradientView"));

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController defaultBackgroundGradientView](self, "defaultBackgroundGradientView"));
        objc_msgSend(v24, "insertSubview:above:", v8, v25);

      }
    }
    -[PHAudioCallViewController setKeypadBackgroundView:](self, "setKeypadBackgroundView:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
    v27 = v26;
    if (v26 && objc_msgSend(v26, "status") == 1)
    {
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeScale(&v43, 1.03, 1.03);
      v42 = v43;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadBackgroundView](self, "keypadBackgroundView"));
      v41 = v42;
      objc_msgSend(v28, "setTransform:", &v41);

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
    if (v29)
    {

    }
    else
    {
      v33 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView"));
      if (!v33
        || (v34 = (void *)v33,
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView")),
            objc_msgSend(v35, "alpha"),
            v37 = v36,
            v35,
            v34,
            v37 == 0.0))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControlsButtonNoPhotoNoAvatar](UIColorEffect, "inCallControlsButtonNoPhotoNoAvatar"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 30.0));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
        v44[0] = v30;
        v44[1] = v31;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));
        objc_msgSend(v32, "updateKeypadButtonBackgroundMaterial:", v38);

        goto LABEL_22;
      }
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControlsKeypadButton](UIColorEffect, "inCallControlsKeypadButton"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
    v45 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
    objc_msgSend(v31, "updateKeypadButtonBackgroundMaterial:", v32);
LABEL_22:

    goto LABEL_23;
  }
}

- (void)hideOrShowScreeningBackgroundView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CNKTranscriptionViewComposerFactory *v16;
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
  dispatch_time_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void **v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](self, "featureFlags"));
  v4 = TUCallScreeningEnabled(v3, 0);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    if (objc_msgSend(v6, "currentState") == (id)23)
    {

LABEL_4:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundView](self, "screeningBackgroundView"));
      if (v7)
      {

      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController createBlurryBackgroundView](self, "createBlurryBackgroundView"));
          v16 = objc_opt_new(CNKTranscriptionViewComposerFactory);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CNKTranscriptionViewComposerFactory makeViewComposer](v16, "makeViewComposer"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "composeBackgroundWithView:", v15));
          -[PHAudioCallViewController setScreeningBackgroundViewController:](self, "setScreeningBackgroundViewController:", v18);

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundViewController](self, "screeningBackgroundViewController"));
          -[PHAudioCallViewController addChildViewController:](self, "addChildViewController:", v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundViewController](self, "screeningBackgroundViewController"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
          -[PHAudioCallViewController setScreeningBackgroundView:](self, "setScreeningBackgroundView:", v21);

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundView](self, "screeningBackgroundView"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "view"));
          objc_msgSend(v22, "insertSubview:above:", v23, v25);

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundViewController](self, "screeningBackgroundViewController"));
          objc_msgSend(v26, "didMoveToParentViewController:", self);

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController createContactFirstNameLabelViewModel](self, "createContactFirstNameLabelViewModel"));
          -[PHAudioCallViewController setScreeningPosterNameViewModel:](self, "setScreeningPosterNameViewModel:", v27);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel"));
          objc_msgSend(v28, "updatePosterNameAlpha:", 0.0);

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel"));
          objc_msgSend(v29, "updateStatusFromParticipantsView:", v5);

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "posterNameTextView"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundView](self, "screeningBackgroundView"));
          +[TPIncomingCallMetricsProvider addCallerNameView:toContainerView:](TPIncomingCallMetricsProvider, "addCallerNameView:toContainerView:", v31, v32);

          v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningPosterNameViewModel](self, "screeningPosterNameViewModel"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "posterNameTextView"));
          -[PHAudioCallViewController applyWallpaperTitleStyleAttributesToTextViewWrapper:](self, "applyWallpaperTitleStyleAttributesToTextViewWrapper:", v34);

          objc_initWeak(&location, self);
          v35 = dispatch_time(0, 550000000);
          v47 = _NSConcreteStackBlock;
          v48 = 3221225472;
          v49 = sub_1000D8FC0;
          v50 = &unk_100285F88;
          objc_copyWeak(&v51, &location);
          dispatch_after(v35, (dispatch_queue_t)&_dispatch_main_q, &v47);
          objc_destroyWeak(&v51);
          objc_destroyWeak(&location);

        }
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController", v47, v48, v49, v50));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "view"));
      objc_msgSend(v37, "frame");
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundView](self, "screeningBackgroundView"));
      objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

LABEL_16:
      return;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    if (objc_msgSend(v8, "currentState") == (id)24)
    {
      v9 = -[PHCallViewController currentState](self, "currentState");

      if (v9 == 11)
        goto LABEL_4;
    }
    else
    {

    }
    -[PHAudioCallViewController setScreeningPosterNameViewModel:](self, "setScreeningPosterNameViewModel:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundView](self, "screeningBackgroundView"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundView](self, "screeningBackgroundView"));
      objc_msgSend(v11, "removeFromSuperview");

      -[PHAudioCallViewController setScreeningBackgroundView:](self, "setScreeningBackgroundView:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundViewController](self, "screeningBackgroundViewController"));
      objc_msgSend(v12, "willMoveToParentViewController:", 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundViewController](self, "screeningBackgroundViewController"));
      objc_msgSend(v13, "removeFromParentViewController");

      -[PHAudioCallViewController setScreeningBackgroundViewController:](self, "setScreeningBackgroundViewController:", 0);
    }
    -[PHAudioCallViewController _updatePosterNameAlpha](self, "_updatePosterNameAlpha");
    -[PHAudioCallViewController _updateStatusLabelVisibility](self, "_updateStatusLabelVisibility");
    -[PHAudioCallViewController updateParticipantConstraintsForPosterName:](self, "updateParticipantConstraintsForPosterName:", v5);
    goto LABEL_16;
  }
}

- (void)removeBackgroundContactImageView
{
  PHBackgroundGradientBlurView *backgroundImageView;

  -[PHBackgroundGradientBlurView removeFromSuperview](self->_backgroundImageView, "removeFromSuperview");
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = 0;

}

- (void)addDefaultBackgroundGradientView
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
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
  PHAudioCallBackgroundGradientViewController *v32;
  uint8_t buf[8];
  _QWORD v34[4];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SNAP: Adding default backgroundGradientView", buf, 2u);
  }

  if (!-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v5, "callDisplayStyle") != (id)3)
    {
LABEL_14:

      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v7 = objc_msgSend(v6, "isDominoEnabled");

    if (!v7)
      return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v8, "callDisplayStyle") != (id)3)
  {

LABEL_10:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));

    if (-[PHAudioCallViewController shouldUpdateBackgroundForEmergencyCall](self, "shouldUpdateBackgroundForEmergencyCall"))
    {
      -[PHAudioCallViewController updateBackgroundForEmergencyCall](self, "updateBackgroundForEmergencyCall");
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController defaultBackgroundGradientView](self, "defaultBackgroundGradientView"));

      if (!v12)
      {
        v32 = objc_alloc_init(PHAudioCallBackgroundGradientViewController);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallBackgroundGradientViewController view](v32, "view"));
        objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        objc_msgSend(v14, "insertSubview:atIndex:", v13, 0);

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
        v34[0] = v28;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
        v34[1] = v24;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v15));
        v34[2] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
        v34[3] = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

        -[PHAudioCallViewController setDefaultBackgroundGradientView:](self, "setDefaultBackgroundGradientView:", v13);
        objc_msgSend(v5, "updateBackgroundMaterial:", 2);

      }
    }
    goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v10 = objc_msgSend(v9, "isDominoEnabled");

  if ((v10 & 1) == 0)
    goto LABEL_10;
}

- (void)removeDefaultBackgroundGradientView
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint8_t v9[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SNAP: Removing default backgroundGradientView", v9, 2u);
  }

  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
LABEL_6:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController defaultBackgroundGradientView](self, "defaultBackgroundGradientView"));
    objc_msgSend(v8, "removeFromSuperview");

    -[PHAudioCallViewController setDefaultBackgroundGradientView:](self, "setDefaultBackgroundGradientView:", 0);
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v5, "callDisplayStyle") == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v7 = objc_msgSend(v6, "isDominoEnabled");

    if (!v7)
      return;
    goto LABEL_6;
  }

}

- (void)setPosterNameViewModel:(id)a3
{
  PHPosterNameViewModel *v4;
  PHPosterNameViewModel *posterNameViewModel;
  PHPosterNameViewModel *v6;

  v4 = (PHPosterNameViewModel *)a3;
  posterNameViewModel = self->_posterNameViewModel;
  if (posterNameViewModel)
    -[PHPosterNameViewModel removeFromSuperview](posterNameViewModel, "removeFromSuperview");
  v6 = self->_posterNameViewModel;
  self->_posterNameViewModel = v4;

}

- (void)setKeypadPosterNameViewModel:(id)a3
{
  PHPosterNameViewModel *v4;
  PHPosterNameViewModel *keypadPosterNameViewModel;
  PHPosterNameViewModel *v6;

  v4 = (PHPosterNameViewModel *)a3;
  keypadPosterNameViewModel = self->_keypadPosterNameViewModel;
  if (keypadPosterNameViewModel)
    -[PHPosterNameViewModel removeFromSuperview](keypadPosterNameViewModel, "removeFromSuperview");
  v6 = self->_keypadPosterNameViewModel;
  self->_keypadPosterNameViewModel = v4;

}

- (void)setScreeningPosterNameViewModel:(id)a3
{
  PHPosterNameViewModel *v4;
  PHPosterNameViewModel *screeningPosterNameViewModel;
  PHPosterNameViewModel *v6;

  v4 = (PHPosterNameViewModel *)a3;
  screeningPosterNameViewModel = self->_screeningPosterNameViewModel;
  if (screeningPosterNameViewModel)
    -[PHPosterNameViewModel removeFromSuperview](screeningPosterNameViewModel, "removeFromSuperview");
  v6 = self->_screeningPosterNameViewModel;
  self->_screeningPosterNameViewModel = v4;

}

- (void)updatePosterViewModelForParticipantsView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));
    objc_msgSend(v5, "updateViewModelForParticipantsView:", v6);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "singleCallLabelView"));
    objc_msgSend(v5, "setPosterNameViewModel:", 0);
  }

}

- (void)showPosterBlurTransition
{
  void *v3;
  id v4;
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
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 15.0));
  v4 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  objc_msgSend(v4, "setFrame:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v6, "insertSubview:below:", v4, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v9, "bringSubviewToFront:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterBadgeView](self, "posterBadgeView"));
  objc_msgSend(v11, "bringSubviewToFront:", v12);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000D98F0;
  v17[3] = &unk_100285158;
  v18 = v4;
  v19 = v3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D9974;
  v15[3] = &unk_1002848C0;
  v16 = v18;
  v13 = v18;
  v14 = v3;
  +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v17, v15, 0.25, 0.0, 2.0, 300.0, 50.0, 0.0);

}

- (void)removePosterViewController:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  PHAudioCallViewController *v13;
  void (**v14)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
  -[PHAudioCallViewController setRenderingViewController:](self, "setRenderingViewController:", 0);
  -[PHAudioCallViewController setPosterNameViewModel:](self, "setPosterNameViewModel:", 0);
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000D9B98;
    v11[3] = &unk_100285AA0;
    v12 = v7;
    v13 = self;
    v14 = v6;
    v8 = objc_retainBlock(v11);
    v9 = v8;
    if (v4)
    {
      -[PHAudioCallViewController showPosterBlurTransition](self, "showPosterBlurTransition");
      v10 = dispatch_time(0, 0);
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v9);
    }
    else
    {
      ((void (*)(_QWORD *))v8[2])(v8);
    }

  }
  else
  {
    -[PHAudioCallViewController setParticipantsViewShouldShowParticipantLabel:](self, "setParticipantsViewShouldShowParticipantLabel:", 1);
    if (v6)
      v6[2](v6);
  }

}

- (void)transitionToNewPoster:(id)a3 showingPosterTransition:(BOOL)a4 shouldBlurPoster:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void ***v37;
  void ***v38;
  dispatch_time_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void **v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  PHAudioCallViewController *v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[16];

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
  -[PHAudioCallViewController setRenderingViewController:](self, "setRenderingViewController:", v10);
  -[PHAudioCallViewController addChildViewController:](self, "addChildViewController:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  v14 = sub_1000C5588();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SNAP: Going to swap old and new poster", buf, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundView](self, "screeningBackgroundView"));
    if (v17)
    {
      objc_msgSend(v13, "frame");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundView](self, "screeningBackgroundView"));
      objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

      v27 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningBackgroundView](self, "screeningBackgroundView"));
      -[NSObject insertSubview:below:](v27, "insertSubview:below:", v13, v28);
LABEL_16:

      goto LABEL_17;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView"));

    if (v32)
      goto LABEL_14;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController defaultBackgroundGradientView](self, "defaultBackgroundGradientView"));

    if (v42)
      goto LABEL_22;
    v43 = sub_1000C5588();
    v27 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1001AA9C0();
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SNAP: Going to set up a new poster, there isn't an old one", buf, 2u);
    }

    if (!v8
      || (v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView")),
          v29,
          v29))
    {
LABEL_14:
      v27 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v33 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView"));
LABEL_15:
      v28 = (void *)v33;
      -[NSObject insertSubview:above:](v27, "insertSubview:above:", v13, v33);
      goto LABEL_16;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController defaultBackgroundGradientView](self, "defaultBackgroundGradientView"));

    if (v30)
    {
LABEL_22:
      v27 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v33 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController defaultBackgroundGradientView](self, "defaultBackgroundGradientView"));
      goto LABEL_15;
    }
    v31 = sub_1000C5588();
    v27 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "SNAP: Going to set up a new poster, but there is no backgroundImageView or defaultBackgroundGradientView", buf, 2u);
    }
  }
LABEL_17:

  objc_msgSend(v10, "didMoveToParentViewController:", self);
  v44 = _NSConcreteStackBlock;
  v45 = 3221225472;
  v46 = sub_1000DA0F0;
  v47 = &unk_100287A88;
  LOBYTE(v53) = a5;
  v48 = self;
  v49 = v10;
  v51 = v11;
  v52 = 0x3FE0000000000000;
  v50 = v12;
  v34 = v11;
  v35 = v12;
  v36 = v10;
  v37 = objc_retainBlock(&v44);
  v38 = v37;
  if (v8)
  {
    -[PHAudioCallViewController showPosterBlurTransition](self, "showPosterBlurTransition", v44, v45, v46, v47, v48, v49, v50, v51, v52, v53);
    v39 = dispatch_time(0, 0);
    dispatch_after(v39, (dispatch_queue_t)&_dispatch_main_q, v38);
  }
  else
  {
    ((void (*)(void ***))v37[2])(v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController", v44, v45, v46, v47, v48, v49, v50, v51, v52, v53));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "view"));

    objc_msgSend(v41, "updateBackgroundMaterial:", 0);
  }

}

- (double)viewAlphaForPosterRenderingViewController
{
  return (double)-[PHAudioCallViewController canShowPosterImage](self, "canShowPosterImage");
}

- (void)updateLayeredBackgroundWallpaper
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  BOOL v54;
  void *v55;
  dispatch_block_t v56;
  dispatch_time_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  int v64;
  unsigned int v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  _QWORD *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  PHPosterNameViewModel *v75;
  void *v76;
  _BOOL4 v77;
  id v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL8 v85;
  uint64_t v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  NSObject *v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  char v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  _QWORD v107[4];
  id v108;
  id v109;
  id v110;
  _QWORD block[4];
  id v112[7];
  char v113;
  uint8_t buf[4];
  id v115;

  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v3, "callDisplayStyle") == (id)3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v5 = objc_msgSend(v4, "isDominoEnabled");

      if ((v5 & 1) != 0)
        return;
    }
    else
    {

    }
    if (!-[PHAudioCallViewController hasNoCallsOrOnlyEndedCalls](self, "hasNoCallsOrOnlyEndedCalls"))
    {
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v106));
      v102 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v103);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "contactIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallViewController contactKeysToFetch](PHAudioCallViewController, "contactKeysToFetch"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "contactForIdentifier:keysToFetch:usingCache:", v6, v7, v8));

      v9 = -[PHAudioCallViewController prefersShowingCachedLastSeenPosterBeforeCallConnected:](self, "prefersShowingCachedLastSeenPosterBeforeCallConnected:", v106);
      v10 = -[PHAudioCallViewController suggestedNewPosterSourceAfterCallConnects:](self, "suggestedNewPosterSourceAfterCallConnects:", v106);
      v97 = (void *)v10;
      if (-[PHAudioCallViewController currentCallStateCanShowNewPoster](self, "currentCallStateCanShowNewPoster")
        && (*(_QWORD *)&v12 = objc_opt_class(self, v11).n128_u64[0],
            objc_msgSend(v13, "posterSourceIsSyncedWithContacts:", v10, v12)))
      {
        if (v10 == 2)
        {
          v78 = sub_1000C5588();
          v79 = objc_claimAutoreleasedReturnValue(v78);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "SNAP: PosterSource - transitioning from cached last seen poster -> current wallpaper if available.", buf, 2u);
          }

          v80 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "contactIdentifier"));
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKey:", v81));

          if (v82)
          {
            v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "contactIdentifier"));
            objc_msgSend(v83, "removeObjectForKey:", v84);

          }
          v85 = (id)-[PHAudioCallViewController currentDisplayedPosterSourceForCall:](self, "currentDisplayedPosterSourceForCall:", v106) != (id)1;
          -[PHAudioCallViewController setSnapshottedPosterImageToUseForColorInversion:](self, "setSnapshottedPosterImageToUseForColorInversion:", 0);
          -[PHAudioCallViewController setHasInvertedUIElementColorsBasedOnPoster:](self, "setHasInvertedUIElementColorsBasedOnPoster:", 0);
          v104 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactWallpaperConfigurationForCall:shouldReadFromCache:](self, "contactWallpaperConfigurationForCall:shouldReadFromCache:", v106, v85));
          *(_QWORD *)&v87 = objc_opt_class(self, v86).n128_u64[0];
          v89 = v88;
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentIMNicknameMatchingContact:](self, "currentIMNicknameMatchingContact:", v99, v87));
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "wallpaper"));
          v29 = objc_msgSend(v89, "wallpaperContentIsSensitive:", v91);

        }
        else
        {
          if (v10 != 3)
          {
            v92 = sub_1000C5588();
            v93 = objc_claimAutoreleasedReturnValue(v92);
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              sub_1001AA9EC();

            v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_WaitingOrNot](self, "getParticipantsView_WaitingOrNot"));
            v101 = 1;
            goto LABEL_58;
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
          v104 = -[PHAudioCallViewController newPosterConfigurationForCall:](self, "newPosterConfigurationForCall:", v14);

          v15 = sub_1000C5588();
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v115 = v104;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SNAP: PosterSource - transitioning to show new poster updates (i.e. pendingIMNickname), new configuration: %@", buf, 0xCu);
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "contactIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v18));

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "contactIdentifier"));
            objc_msgSend(v20, "removeObjectForKey:", v21);

          }
          -[PHAudioCallViewController setSnapshottedPosterImageToUseForColorInversion:](self, "setSnapshottedPosterImageToUseForColorInversion:", 0);
          -[PHAudioCallViewController setHasInvertedUIElementColorsBasedOnPoster:](self, "setHasInvertedUIElementColorsBasedOnPoster:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController sharedProfileStateOracleForCall:](self, "sharedProfileStateOracleForCall:", v106));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pendingNickname"));

          *(_QWORD *)&v25 = objc_opt_class(self, v24).n128_u64[0];
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "wallpaper", v25));
          v29 = objc_msgSend(v27, "wallpaperContentIsSensitive:", v28);

        }
        v101 = 1;
      }
      else
      {
        v30 = sub_1000C5588();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
        if (v9)
        {
          if (v32)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SNAP: PosterSource - Going to show the last seen poster for this contact if available.", buf, 2u);
          }

          v104 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController lastSeenPosterConfigurationForCall:](self, "lastSeenPosterConfigurationForCall:", v106));
          v29 = -[PHAudioCallViewController lastSeenPosterDataIsSensitiveForCall:](self, "lastSeenPosterDataIsSensitiveForCall:", v106);
        }
        else
        {
          if (v32)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SNAP: PosterSource - Going to show the current wallpaper for this contact if available.", buf, 2u);
          }

          v104 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactWallpaperConfigurationForCall:shouldReadFromCache:](self, "contactWallpaperConfigurationForCall:shouldReadFromCache:", v106, 1));
          *(_QWORD *)&v34 = objc_opt_class(self, v33).n128_u64[0];
          v36 = v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentIMNicknameMatchingContact:](self, "currentIMNicknameMatchingContact:", v99, v34));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "wallpaper"));
          v29 = objc_msgSend(v36, "wallpaperContentIsSensitive:", v38);

        }
        v101 = 0;
      }
      if (v106 && v104)
      {
        -[PHAudioCallViewController triggerInversionColorUpdate:](self, "triggerInversionColorUpdate:", v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_WaitingOrNot](self, "getParticipantsView_WaitingOrNot"));
LABEL_28:
        v98 = objc_msgSend(objc_alloc((Class)PRUISIncomingCallPosterContext), "initWithTitleString:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", &stru_10028DC20, 0, 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        v39 = objc_msgSend(objc_alloc((Class)PRUISPosterRenderingViewController), "initWithConfiguration:context:", v104, v98);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        objc_msgSend(v40, "bounds");
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "view"));
        objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "view"));
        objc_msgSend(v50, "setAutoresizingMask:", 18);

        if ((objc_opt_respondsToSelector(v39, "setRenderingMode:") & 1) != 0)
        {
          v51 = sub_1000C5588();
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "SNAP: Setting poster renderingMode to .live and starting 30sec delay to set it back to .paused", buf, 2u);
          }

          objc_msgSend(v39, "setRenderingMode:", 2);
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController suspendPosterAfterDelayBlock](self, "suspendPosterAfterDelayBlock"));
          v54 = v53 == 0;

          if (!v54)
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController suspendPosterAfterDelayBlock](self, "suspendPosterAfterDelayBlock"));
            dispatch_block_cancel(v55);

            -[PHAudioCallViewController setSuspendPosterAfterDelayBlock:](self, "setSuspendPosterAfterDelayBlock:", 0);
          }
          objc_initWeak((id *)buf, self);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000DB22C;
          block[3] = &unk_100285F88;
          objc_copyWeak(v112, (id *)buf);
          v56 = dispatch_block_create((dispatch_block_flags_t)0, block);
          -[PHAudioCallViewController setSuspendPosterAfterDelayBlock:](self, "setSuspendPosterAfterDelayBlock:", v56);

          v57 = dispatch_time(0, 30000000000);
          v58 = &_dispatch_main_q;
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController suspendPosterAfterDelayBlock](self, "suspendPosterAfterDelayBlock"));
          dispatch_after(v57, (dispatch_queue_t)&_dispatch_main_q, v59);

          objc_destroyWeak(v112);
          objc_destroyWeak((id *)buf);
        }
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "singleCallLabelView"));
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "statusLabel"));

        if (-[PHAudioCallViewController canShowPosterImage](self, "canShowPosterImage"))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
          v62 = v61;
          if ((v101 & 1) != 0)
            v63 = objc_msgSend(v61, "forceBlurNewPoster");
          else
            v63 = objc_msgSend(v61, "forceBlurCurrentPoster");
          v65 = v63;

          v64 = v65 | v29;
        }
        else
        {
          v64 = 0;
        }
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "text"));
        objc_initWeak((id *)buf, self);
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = sub_1000DB26C;
        v107[3] = &unk_100287B00;
        objc_copyWeak(&v110, (id *)buf);
        v68 = v66;
        v108 = v68;
        v69 = v67;
        v109 = v69;
        v70 = objc_retainBlock(v107);
        v71 = ((uint64_t (*)(_QWORD *, _QWORD))v70[2])(v70, 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        if (v64)
        {
          v73 = ((uint64_t (*)(_QWORD *, uint64_t))v70[2])(v70, 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        }
        else
        {
          v74 = 0;
        }
        +[TPIncomingCallMetricsProvider addCallerNameView:toViewController:](TPIncomingCallMetricsProvider, "addCallerNameView:toViewController:", v72, v39);
        v75 = -[PHPosterNameViewModel initWithCall:posterNameTextView:priorityPosterNameTextView:]([PHPosterNameViewModel alloc], "initWithCall:posterNameTextView:priorityPosterNameTextView:", v68, v72, v74);
        -[PHAudioCallViewController setPosterNameViewModel:](self, "setPosterNameViewModel:", v75);

        -[PHAudioCallViewController updatePosterViewModelForParticipantsView:](self, "updatePosterViewModelForParticipantsView:", v105);
        -[PHAudioCallViewController setupNameLabelForAlwaysOnDisplay](self, "setupNameLabelForAlwaysOnDisplay");
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v77 = objc_msgSend(v76, "callDisplayStyle") == 0;

        if (v77)
        {
          -[PHAudioCallViewController setParticipantsViewShouldShowParticipantLabel:](self, "setParticipantsViewShouldShowParticipantLabel:", 1);
          objc_msgSend(v100, "setAlpha:", 1.0);
        }
        else
        {
          -[PHAudioCallViewController setParticipantsViewShouldShowParticipantLabel:](self, "setParticipantsViewShouldShowParticipantLabel:", 0);
          -[PHAudioCallViewController _updatePosterStatusLabelForState:](self, "_updatePosterStatusLabelForState:", -[PHCallViewController currentState](self, "currentState"));
          -[PHAudioCallViewController updateParticipantConstraintsForPosterName:](self, "updateParticipantConstraintsForPosterName:", v105);
          -[PHAudioCallViewController _updatePosterNameAlpha](self, "_updatePosterNameAlpha");
        }
        -[PHAudioCallViewController transitionToNewPoster:showingPosterTransition:shouldBlurPoster:completion:](self, "transitionToNewPoster:showingPosterTransition:shouldBlurPoster:completion:", v39);

        objc_destroyWeak(&v110);
        objc_destroyWeak((id *)buf);

LABEL_47:
        return;
      }
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_WaitingOrNot](self, "getParticipantsView_WaitingOrNot", v104));
      if (v104)
        goto LABEL_28;
LABEL_58:
      v94 = sub_1000C5588();
      v95 = objc_claimAutoreleasedReturnValue(v94);
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        v96 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
        *(_DWORD *)buf = 138412290;
        v115 = v96;
        _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "SNAP: There is no configuration now, we are going to fade out old poster %@", buf, 0xCu);

      }
      -[PHAudioCallViewController removeNameLabelForAlwaysOnDisplay](self, "removeNameLabelForAlwaysOnDisplay");
      v112[1] = _NSConcreteStackBlock;
      v112[2] = (id)3221225472;
      v112[3] = sub_1000DAFC8;
      v112[4] = &unk_100287AD8;
      v113 = v101;
      v112[5] = self;
      v112[6] = v97;
      -[PHAudioCallViewController removePosterViewController:completion:](self, "removePosterViewController:completion:");
      if ((v101 & 1) == 0 && -[PHCallViewController currentState](self, "currentState") == 11)
        -[PHAudioCallViewController removeFirstNameLabelFromViewIfNeeded](self, "removeFirstNameLabelFromViewIfNeeded");
      goto LABEL_47;
    }
  }
}

- (void)setupNameLabelForAlwaysOnDisplay
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PHAudioCallViewController removeNameLabelForAlwaysOnDisplay](self, "removeNameLabelForAlwaysOnDisplay");
  -[PHAudioCallViewController setupDimmingViewForAlwaysOnDisplay](self, "setupDimmingViewForAlwaysOnDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController createContactFirstNameLabelViewModel](self, "createContactFirstNameLabelViewModel"));
  -[PHAudioCallViewController setAlwaysOnDisplayPosterNameViewModel:](self, "setAlwaysOnDisplayPosterNameViewModel:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayPosterNameViewModel](self, "alwaysOnDisplayPosterNameViewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "posterNameTextView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayDimmingView](self, "alwaysOnDisplayDimmingView"));
  +[TPIncomingCallMetricsProvider addCallerNameView:toContainerView:](TPIncomingCallMetricsProvider, "addCallerNameView:toContainerView:", v4, v5);

}

- (void)removeNameLabelForAlwaysOnDisplay
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayPosterNameViewModel](self, "alwaysOnDisplayPosterNameViewModel"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayPosterNameViewModel](self, "alwaysOnDisplayPosterNameViewModel"));
    objc_msgSend(v4, "removeFromSuperview");

    -[PHAudioCallViewController setAlwaysOnDisplayPosterNameViewModel:](self, "setAlwaysOnDisplayPosterNameViewModel:", 0);
  }
}

- (void)setupDimmingViewForAlwaysOnDisplay
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayDimmingView](self, "alwaysOnDisplayDimmingView"));

  if (!v3)
  {
    v4 = objc_alloc((Class)UIView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    objc_msgSend(v5, "frame");
    v10 = objc_msgSend(v4, "initWithFrame:");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.75));
    objc_msgSend(v10, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    objc_msgSend(v8, "addSubview:", v10);

    -[PHAudioCallViewController setAlwaysOnDisplayDimmingView:](self, "setAlwaysOnDisplayDimmingView:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alwaysOnDisplayDimmingView](self, "alwaysOnDisplayDimmingView"));
    objc_msgSend(v9, "setAlpha:", 0.0);

  }
}

- (id)snapshotUIImageView
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;

  v3 = objc_alloc((Class)UIImageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController backgroundImageView](self, "backgroundImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
  v6 = objc_msgSend(v3, "initWithImage:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  objc_msgSend(v7, "frame");
  objc_msgSend(v6, "setFrame:");

  v8 = objc_alloc_init((Class)UIVisualEffectView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 100.0));
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  objc_msgSend(v8, "setBackgroundEffects:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  objc_msgSend(v11, "frame");
  objc_msgSend(v8, "setFrame:");

  objc_msgSend(v6, "addSubview:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterPlusD));
  objc_msgSend(v12, "setCompositingFilter:", v13);

  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.150000006)));
  objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  objc_msgSend(v15, "frame");
  objc_msgSend(v12, "setFrame:");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v16, "addSublayer:", v12);

  return v6;
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewController;
  -[PHAudioCallViewController viewSafeAreaInsetsDidChange](&v4, "viewSafeAreaInsetsDidChange");
  -[PHAudioCallViewController _updateStatusLabelVisibility](self, "_updateStatusLabelVisibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));

  if (v3)
    -[PHAudioCallViewController setupNameLabelForAlwaysOnDisplay](self, "setupNameLabelForAlwaysOnDisplay");
}

- (BOOL)shouldUseHeroImageLayout
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v3 = objc_msgSend(v2, "isHeroImageEnabled");

  return v3;
}

- (void)lockScreenVisibilityDidChange:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIViewController *screeningViewController;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager", a3));
  if (objc_msgSend(v4, "callDisplayStyle") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v6 = objc_msgSend(v5, "isDominoEnabled");

    if ((v6 & 1) != 0)
      return;
  }
  else
  {

  }
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Lock screen visibility did change, refreshing UI", v18, 2u);
  }

  -[PHAudioCallViewController setCallForBackgroundImage:](self, "setCallForBackgroundImage:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
  -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v9, 1, 0);

  -[PHAudioCallViewController updateCallParticipantsViewControllerCallGroups](self, "updateCallParticipantsViewControllerCallGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "singleCallLabelView"));
  objc_msgSend(v11, "updateLabelsOrderAndLayout");
  v12 = -[PHAudioCallViewController middleViewState](self, "middleViewState");
  -[PHAudioCallViewController setMiddleViewState:](self, "setMiddleViewState:", 0);
  screeningViewController = self->_screeningViewController;
  self->_screeningViewController = 0;

  -[PHAudioCallViewController setMiddleViewState:](self, "setMiddleViewState:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  v15 = objc_msgSend(v14, "currentState");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v16, "setCurrentState:", -1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v17, "setCurrentState:", v15);

}

- (unint64_t)currentDisplayedPosterSourceForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));

    v9 = objc_msgSend(v8, "source");
  }
  else
  {
    v9 = 0;
  }

  return (unint64_t)v9;
}

+ (NSArray)contactKeysToFetch
{
  if (qword_1002DCC40 != -1)
    dispatch_once(&qword_1002DCC40, &stru_100287B20);
  return (NSArray *)(id)qword_1002DCC38;
}

- (void)suspendPosterAndCancelDelay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
    v7 = objc_opt_respondsToSelector(v6, "setRenderingMode:");

    if ((v7 & 1) != 0)
    {
      if (v3)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController suspendPosterAfterDelayBlock](self, "suspendPosterAfterDelayBlock"));

        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController suspendPosterAfterDelayBlock](self, "suspendPosterAfterDelayBlock"));
          dispatch_block_cancel(v9);

          -[PHAudioCallViewController setSuspendPosterAfterDelayBlock:](self, "setSuspendPosterAfterDelayBlock:", 0);
        }
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
      v11 = objc_msgSend(v10, "renderingMode");

      if (v11 == (id)2)
      {
        v12 = sub_1000C5588();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SNAP: Setting poster renderingMode to .paused", v15, 2u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController renderingViewController](self, "renderingViewController"));
        objc_msgSend(v14, "setRenderingMode:", 1);

      }
    }
  }
}

- (void)setShowsCallWaitingParticipantView:(BOOL)a3
{
  PHCallParticipantsViewController *callWaitingParticipantsViewController;
  PHCallParticipantsViewController *v5;
  void *v6;
  void *v7;
  PHCallParticipantsViewController *v8;
  PHCallParticipantsViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PHCallParticipantsViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  PHCallParticipantsViewController *v26;
  void *v27;
  void *v28;
  double v29;
  _QWORD v30[4];
  PHCallParticipantsViewController *v31;
  PHAudioCallViewController *v32;
  _QWORD v33[4];
  PHCallParticipantsViewController *v34;
  PHAudioCallViewController *v35;
  _QWORD v36[5];

  callWaitingParticipantsViewController = self->_callWaitingParticipantsViewController;
  if (a3)
  {
    if (callWaitingParticipantsViewController)
      return;
    v5 = [PHCallParticipantsViewController alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
    v8 = -[PHCallParticipantsViewController initWithCallDisplayStyleManager:contactsCache:](v5, "initWithCallDisplayStyleManager:contactsCache:", v6, v7);
    v9 = self->_callWaitingParticipantsViewController;
    self->_callWaitingParticipantsViewController = v8;

    -[PHCallParticipantsViewController setShouldIgnoreUpdates:](self->_callWaitingParticipantsViewController, "setShouldIgnoreUpdates:", -[PHAudioCallViewController participantsViewControllersShouldIgnoreUpdates](self, "participantsViewControllersShouldIgnoreUpdates"));
    -[PHCallParticipantsViewController setHandlesCallWaitingCalls:](self->_callWaitingParticipantsViewController, "setHandlesCallWaitingCalls:", 1);
    -[PHCallParticipantsViewController setDelegate:](self->_callWaitingParticipantsViewController, "setDelegate:", self);
    -[PHAudioCallViewController addChildViewController:](self, "addChildViewController:", self->_callWaitingParticipantsViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callWaitingParticipantsViewController, "view"));
    objc_msgSend(v10, "addSubview:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callParticipantsViewController, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "singleCallLabelView"));
    objc_msgSend(v13, "setPosterNameViewModel:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callWaitingParticipantsViewController, "view"));
    -[PHAudioCallViewController updatePosterViewModelForParticipantsView:](self, "updatePosterViewModelForParticipantsView:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v15, "callDisplayStyle") == (id)3)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v17 = objc_msgSend(v16, "isDominoEnabled");

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        objc_msgSend(v18, "bringSubviewToFront:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientAudioRoutesControlView](self, "ambientAudioRoutesControlView"));
        objc_msgSend(v20, "bringSubviewToFront:", v21);

        -[PHAudioCallViewController setUpLayoutGuidesForParticipantsViewController:](self, "setUpLayoutGuidesForParticipantsViewController:", self->_callWaitingParticipantsViewController);
        -[PHAudioCallViewController applyCallWaitingConstraintsForAmbient](self, "applyCallWaitingConstraintsForAmbient");
        -[PHCallParticipantsViewController updateCallGroups](self->_callWaitingParticipantsViewController, "updateCallGroups");
        -[PHCallParticipantsViewController setShouldIgnoreUpdates:](self->_callWaitingParticipantsViewController, "setShouldIgnoreUpdates:", 1);
LABEL_10:
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callWaitingParticipantsViewController, "view"));
        objc_msgSend(v27, "setAlpha:", 0.0);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callParticipantsViewController, "view"));
        objc_msgSend(v28, "setAlpha:", 1.0);

        -[PHAudioCallViewController callWaitingAnimationDelay](self, "callWaitingAnimationDelay");
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_1000DC134;
        v36[3] = &unk_100284898;
        v36[4] = self;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v36, 0, 0.5, v29);
        goto LABEL_11;
      }
    }
    else
    {

    }
    -[PHAudioCallViewController copyCallWaitingConstraintsFromParticipantsView](self, "copyCallWaitingConstraintsFromParticipantsView");
    goto LABEL_10;
  }
  if (!callWaitingParticipantsViewController)
    return;
  v22 = callWaitingParticipantsViewController;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](v22, "view"));
  objc_msgSend(v23, "setAlpha:", 1.0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callParticipantsViewController, "view"));
  objc_msgSend(v24, "setAlpha:", 0.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callWaitingParticipantsViewController, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "singleCallLabelView"));
  objc_msgSend(v25, "setPosterNameViewModel:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callParticipantsViewController, "view"));
  -[PHAudioCallViewController updatePosterViewModelForParticipantsView:](self, "updatePosterViewModelForParticipantsView:", v14);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000DC1A8;
  v33[3] = &unk_100285158;
  v34 = v22;
  v35 = self;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000DC210;
  v30[3] = &unk_100284DF0;
  v31 = v34;
  v32 = self;
  v26 = v34;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v33, v30, 0.5);

LABEL_11:
}

- (double)callWaitingAnimationDelay
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v2, "callDisplayStyle"))
    v3 = 0.0;
  else
    v3 = 0.5;

  return v3;
}

- (int64_t)bottomBarStateForCallWaitingCall
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v12;
  NSObject *v13;
  int v15;
  int64_t v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  if (objc_msgSend(v3, "currentVideoCallCount"))
  {

LABEL_8:
    v11 = 9;
    goto LABEL_9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v5 = objc_msgSend(v4, "isHoldAndAnswerAllowed");

  if (!v5)
    goto LABEL_8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callWithStatus:", 2));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callWithStatus:", 1));

    if (v10)
      v11 = 8;
    else
      v11 = 7;
  }
  else
  {

    v11 = 7;
  }
LABEL_9:
  v12 = sub_1000C5588();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AudioCallWaiting: Showing bottom bar state: %ld", (uint8_t *)&v15, 0xCu);
  }

  return v11;
}

- (void)copyCallWaitingConstraintsFromParticipantsView
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
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
  _QWORD v30[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v3, "callDisplayStyle") == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v5 = objc_msgSend(v4, "isDominoEnabled");

    if ((v5 & 1) != 0)
      return;
  }
  else
  {

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_Waiting](self, "getParticipantsView_Waiting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

    if (v8)
    {
      if (v7)
      {
        objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callWaitingLayoutConstraints](self, "callWaitingLayoutConstraints"));
        +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v9);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
        v30[0] = v27;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
        v30[1] = v24;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
        v30[2] = v21;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
        v30[3] = v18;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
        v30[4] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
        v30[5] = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 6));
        -[PHAudioCallViewController setCallWaitingLayoutConstraints:](self, "setCallWaitingLayoutConstraints:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callWaitingLayoutConstraints](self, "callWaitingLayoutConstraints"));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

      }
    }
  }

}

- (void)applyCallWaitingConstraintsForAmbient
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_Waiting](self, "getParticipantsView_Waiting"));
  if (v3)
  {
    v10 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
    v3 = v10;
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      if (objc_msgSend(v5, "callDisplayStyle") != (id)3)
      {
LABEL_6:

        v3 = v10;
        goto LABEL_7;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v7 = objc_msgSend(v6, "isDominoEnabled");

      v3 = v10;
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallParticipantsViewController view](self->_callWaitingParticipantsViewController, "view"));
        objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientParticipantsViewConstraintsForView:largeAvatar:](self, "ambientParticipantsViewConstraintsForView:largeAvatar:", v10, self->_shouldShowLargeAvatarForCallWaiting));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
        -[PHAudioCallViewController setCallWaitingLayoutConstraints:](self, "setCallWaitingLayoutConstraints:", v9);

        v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callWaitingLayoutConstraints](self, "callWaitingLayoutConstraints"));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);
        goto LABEL_6;
      }
    }
  }
LABEL_7:

}

- (void)audioCallControlsViewControllerRequestedKeypadPresentation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint8_t v10[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested keypad presentation", v10, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v6, "callDisplayStyle") == (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v8 = objc_msgSend(v7, "isDominoEnabled");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL showKeypadURL](NSURL, "showKeypadURL"));
      TUUnlockAndOpenURL();

      return;
    }
  }
  else
  {

  }
  -[PHAudioCallViewController setMiddleViewState:animated:](self, "setMiddleViewState:animated:", 2, 1);
}

- (void)audioCallControlsViewControllerRequestedKeypadPresentationForFieldMode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested keypad presentation for field mode", v7, 2u);
  }

  -[PHAudioCallViewController setMiddleViewState:animated:](self, "setMiddleViewState:animated:", 2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
  objc_msgSend(v6, "setAllowsFieldModeSendButton:", 1);

}

- (void)audioCallControlsViewControllerRequestedContactsPresentation:(id)a3 forView:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void ***v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, int);
  void *v14;
  PHAudioCallViewController *v15;
  id v16;
  uint8_t buf[16];

  v5 = a4;
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested Contacts presentation", buf, 2u);
  }

  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000DCAF8;
  v14 = &unk_100284DF0;
  v15 = self;
  v16 = v5;
  v8 = v5;
  v9 = objc_retainBlock(&v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance", v11, v12, v13, v14, v15));
  objc_msgSend(v10, "requestPasscodeUnlockWithCompletion:", v9);

}

- (void)audioCallControlsViewControllerRequestedAddCallPresentation:(id)a3 forView:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void ***v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, int);
  void *v14;
  PHAudioCallViewController *v15;
  id v16;
  uint8_t buf[16];

  v5 = a4;
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested Add Call presentation", buf, 2u);
  }

  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000DCC64;
  v14 = &unk_100284DF0;
  v15 = self;
  v16 = v5;
  v8 = v5;
  v9 = objc_retainBlock(&v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance", v11, v12, v13, v14, v15));
  objc_msgSend(v10, "requestPasscodeUnlockWithCompletion:", v9);

}

- (void)audioCallControlsViewControllerRequestedAudioRoutesPresentation:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested Audio Route presentation", v6, 2u);
  }

  -[PHAudioCallViewController revealAudioRoutingDeviceListAnimated:](self, "revealAudioRoutingDeviceListAnimated:", 1);
}

- (void)audioCallControlsViewControllerRequestedVideoPresentation:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Requested Video presentation", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DCE20;
  v8[3] = &unk_1002848C0;
  v8[4] = self;
  v6 = objc_retainBlock(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
  objc_msgSend(v7, "requestPasscodeUnlockWithCompletion:", v6);

}

- (void)audioCallControlsViewControllerRequestedInvokeAlert
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertCoordinator"));
  objc_msgSend(v4, "invokeAlertWithRequestUnlock:automaticallyInvoked:", -[PHAudioCallViewController alertTriggeredByAutoCountdown](self, "alertTriggeredByAutoCountdown") ^ 1, -[PHAudioCallViewController alertTriggeredByAutoCountdown](self, "alertTriggeredByAutoCountdown"));

}

- (void)audioCallControlsViewControllerDidTapVideoStreamingButton
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v4 = objc_msgSend(v3, "isEnhancedEmergencyEnabled");

  if (v4)
  {
    -[PHAudioCallViewController removeEnhancedEmergencyIntermittentStateLabel](self, "removeEnhancedEmergencyIntermittentStateLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    objc_msgSend(v5, "handleVideoStreamingButtonTapped");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    v7 = objc_msgSend(v6, "videoStreamingIsOnScreen");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

      objc_msgSend(v11, "changeVideoStreamingButtonTitleWithIsSharing:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      v10 = objc_msgSend(v9, "videoStreamingRequestHasBeenAccepted");

      if (v10)
        -[PHAudioCallViewController addEnhancedEmergencyIntermittentStateLabelWithState:](self, "addEnhancedEmergencyIntermittentStateLabelWithState:", 1);

    }
    else
    {
      -[PHAudioCallViewController requestToAddResumeCameraLabel](self, "requestToAddResumeCameraLabel");
    }
  }
}

- (void)audioCallControlsViewControllerRequestedShareMedia
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v4 = objc_msgSend(v3, "isEnhancedEmergencyEnabled");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    objc_msgSend(v5, "handleMediaUploadButtonTapped");

  }
}

- (void)audioCallControlsViewControllerDidTapRTTButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v3, "isEnhancedEmergencyEnabled")
    && (v4 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"))) != 0)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    v7 = objc_msgSend(v6, "eedRTTState");

    if (v7 == (id)3)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      objc_msgSend(v12, "transitionToRTTState:", 2);
      goto LABEL_8;
    }
  }
  else
  {

  }
  v8 = sub_1000F8A50();
  if (!v8)
    return;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController activeCall](self, "activeCall"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewControllerForCall:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController navigationController](self, "navigationController"));
  objc_msgSend(v11, "pushViewController:animated:", v12, 1);

LABEL_8:
}

- (void)audioCallControlsViewControllerRequestedShareCardFromSourceView:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: requested share card presentation", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bannerPresentationManager"));
  -[PHAudioCallViewController presentShareCard:source:](self, "presentShareCard:source:", v9, v4);

}

- (BOOL)videoStreamingIsGoingOn
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v3, "isEnhancedEmergencyEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      v6 = objc_msgSend(v5, "videoStreamingIsOnScreen");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)audioCallControlsViewControllerDidToggleMuteButton:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[PHAudioCallViewController audioCallMutedTalkerIsSupported](self, "audioCallMutedTalkerIsSupported"))
  {
    if (!v3)
      -[PHAudioCallViewController setDidNotifyMutedCaller:](self, "setDidNotifyMutedCaller:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController mutedTalkerBannerViewController](self, "mutedTalkerBannerViewController"));
    objc_msgSend(v5, "updatePillViewWithIsMuted:", v3);

  }
}

- (void)audioCallControlsViewControllerDidTapEndButton:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[PHCallViewController currentState](self, "currentState", a3) == 10)
  {
    -[PHAudioCallViewController handleCancelPressedInCallBufferScreen](self, "handleCancelPressedInCallBufferScreen");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mostRecentlyDisconnectedAudioCall"));

    if (v11 && objc_msgSend(v11, "isEmergency"))
      v6 = objc_msgSend(v11, "disconnectedReasonRequiresCallBackUI") ^ 1;
    else
      v6 = 1;
    v7 = objc_msgSend(v11, "canDisplayAlertUI:", -[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton"));
    if ((v6 & 1) != 0 || !v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController activeCall](self, "activeCall"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callUUID"));
      -[PHAudioCallViewController setUUIDForLocallyDisconnectedCall:](self, "setUUIDForLocallyDisconnectedCall:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      objc_msgSend(v10, "disconnectCurrentCallAndActivateHeld");

    }
    else
    {
      -[PHAudioCallViewController setCurrentState:](self, "setCurrentState:", 0);
    }

  }
}

- (void)localAudioToggledWithIsMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[PHAudioCallViewController audioCallMutedTalkerIsSupported](self, "audioCallMutedTalkerIsSupported"))
  {
    if (!v3)
      -[PHAudioCallViewController setDidNotifyMutedCaller:](self, "setDidNotifyMutedCaller:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController mutedTalkerBannerViewController](self, "mutedTalkerBannerViewController"));
    objc_msgSend(v5, "updatePillViewWithIsMuted:", v3);

  }
}

- (void)voiceLoopManagerDidStartLoopPlayback:(id)a3
{
  -[PHAudioCallViewController setMiddleViewState:animated:](self, "setMiddleViewState:animated:", 3, 1);
}

- (void)voiceLoopManagerDidStopLoopPlayback:(id)a3
{
  -[PHAudioCallViewController setMiddleViewState:animated:](self, "setMiddleViewState:animated:", 1, 1);
}

- (void)audioCallVoiceLoopViewControllerRequestedButtonPresentation
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: Voice loop controller requested button presentation", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopManager](self, "voiceLoopManager"));
  objc_msgSend(v5, "stopLoopPlayback");

}

- (void)setMiddleViewState:(unsigned __int16)a3
{
  -[PHAudioCallViewController setMiddleViewState:animated:](self, "setMiddleViewState:animated:", a3, 0);
}

- (void)setMiddleViewState:(unsigned __int16)a3 animated:(BOOL)a4
{
  -[PHAudioCallViewController setMiddleViewState:animated:completion:](self, "setMiddleViewState:animated:completion:", a3, a4, 0);
}

- (void)setMiddleViewState:(unsigned __int16)a3 animated:(BOOL)a4 completion:(id)a5
{
  PHAudioCallViewController *v5;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  CGAffineTransform *v22;
  PHAudioCallViewController *v23;
  void **p_cache;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CGAffineTransform *v33;
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
  _QWORD *v44;
  id v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
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
  void *v64;
  void *v65;
  void *v66;
  unsigned int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  _BOOL8 v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  _BOOL4 v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  double v147;
  void *v148;
  void *v149;
  double v150;
  void *v151;
  void *v152;
  double v153;
  void *v154;
  void *v155;
  double v156;
  FTConstraintsToggle *v157;
  void *v158;
  void *v159;
  unsigned int v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  PHAudioCallViewController *v167;
  void *v168;
  void *v169;
  void *v170;
  double v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  _QWORD *v179;
  void *v180;
  id v181;
  void *v182;
  double v183;
  double v184;
  double v185;
  id v186;
  PHAudioCallViewController *v187;
  void *v188;
  id v189;
  void *v190;
  void *v191;
  void *v192;
  double v193;
  void *v194;
  void *v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  void *v202;
  void *v203;
  __int16 v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  double v209;
  double v210;
  void *v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  PHAudioCallViewController *v221;
  void *v222;
  void *v223;
  id v224;
  id v225;
  NSObject *v226;
  void *v227;
  unsigned int v228;
  unint64_t v229;
  BOOL v230;
  double v231;
  unsigned int v232;
  double v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  unsigned int v240;
  double v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  unint64_t v247;
  double v248;
  void *v249;
  void *v250;
  void *v251;
  unsigned int v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  double v257;
  double v258;
  double v259;
  void *v260;
  unsigned __int8 v261;
  id v262;
  PHAudioCallViewController *v263;
  void *v264;
  void *v265;
  void *v266;
  PHAudioCallViewController *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  unsigned __int8 v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  unsigned int v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  uint64_t v286;
  void *v287;
  void *v288;
  void *v289;
  id v290;
  void *v291;
  void *v292;
  unsigned __int8 v293;
  void *v294;
  void *v295;
  unsigned int v296;
  void *v297;
  void *v298;
  double v299;
  double v300;
  double v301;
  void *v302;
  unsigned __int8 v303;
  id v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  char *v309;
  void *v310;
  id v311;
  void *v312;
  void *v313;
  unsigned int v314;
  _BOOL8 v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  unsigned int v320;
  void *v321;
  void *v322;
  _QWORD *v323;
  void *v324;
  id v325;
  void *v326;
  void *v327;
  PHAudioCallViewController *v328;
  void *v329;
  id v330;
  id v331;
  NSObject *v332;
  void *v333;
  double v334;
  double v335;
  double v336;
  _QWORD *v337;
  void *v338;
  id v339;
  void *v340;
  void *v341;
  unsigned int v342;
  void *v343;
  void *v344;
  id v345;
  NSObject *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  PHAudioCallViewController *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  unsigned int v399;
  unsigned int v400;
  void *v401;
  void *v402;
  id v403;
  void *v404;
  id v405;
  int v406;
  __int16 v407;
  __int16 v408;
  PHAudioCallViewController *v409;
  unsigned int v410;
  unsigned int v411;
  CGAffineTransform *v412;
  void *v413;
  _BOOL4 v414;
  _QWORD v415[4];
  id v416;
  _QWORD v417[4];
  id v418;
  _QWORD v419[4];
  id v420;
  PHAudioCallViewController *v421;
  CGAffineTransform *v422;
  _QWORD v423[4];
  id v424;
  id v425;
  CGAffineTransform v426;
  CGAffineTransform v427;
  _QWORD v428[4];
  id v429;
  CGAffineTransform *v430;
  _QWORD v431[4];
  id v432;
  _QWORD v433[5];
  id v434;
  CGAffineTransform *v435;
  _QWORD v436[4];
  id v437;
  CGAffineTransform *v438;
  _QWORD v439[4];
  id v440;
  id v441;
  CGAffineTransform v442;
  CGAffineTransform v443;
  _QWORD v444[4];
  id v445;
  CGAffineTransform *v446;
  _QWORD v447[4];
  id v448;
  id v449;
  _QWORD v450[4];
  id v451;
  _QWORD v452[5];
  id v453;
  CGAffineTransform *v454;
  _QWORD v455[4];
  id v456;
  id v457;
  PHAudioCallViewController *v458;
  CGAffineTransform v459;
  CGAffineTransform v460;
  _QWORD v461[4];
  id v462;
  CGAffineTransform *v463;
  _QWORD v464[4];
  id v465;
  id v466;
  _QWORD v467[4];
  id v468;
  PHAudioCallViewController *v469;
  CGAffineTransform *v470;
  _QWORD v471[4];
  id v472;
  id v473;
  CGAffineTransform v474;
  CGAffineTransform v475;
  _QWORD v476[4];
  id v477;
  _QWORD v478[5];
  _QWORD v479[5];
  id v480;
  CGAffineTransform *v481;
  _QWORD v482[5];
  id v483;
  id v484;
  CGAffineTransform v485;
  CGAffineTransform v486;
  _QWORD v487[4];
  id v488;
  _QWORD v489[5];
  _QWORD v490[4];
  CGAffineTransform *v491;
  _QWORD v492[4];
  _QWORD v493[4];
  _QWORD v494[5];
  _QWORD v495[2];
  uint8_t buf[4];
  void *v497;
  __int16 v498;
  uint64_t v499;
  __int16 v500;
  void *v501;

  v414 = a4;
  LODWORD(v5) = a3;
  v7 = a5;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v497) = (_DWORD)v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setMiddleViewState: %d", buf, 8u);
  }

  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v413 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v413, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    objc_msgSend(v14, "alpha");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
    v18 = (int)v5;
    v5 = self;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));
    *(_DWORD *)buf = 138412802;
    v497 = v12;
    v498 = 2048;
    v499 = v16;
    v500 = 2112;
    v501 = v20;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "current six-up is: %@, six-up view alpha is: %f, six-up view parent view is: %@", buf, 0x20u);

    self = v5;
    LODWORD(v5) = v18;

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
  v490[0] = _NSConcreteStackBlock;
  v490[1] = 3221225472;
  v490[2] = sub_1000E0788;
  v490[3] = &unk_100285AC8;
  v22 = (CGAffineTransform *)v7;
  v491 = v22;
  v23 = objc_retainBlock(v490);
  p_cache = PHSOSKappaMaskedCheckInViewModel.cache;
  if (+[PHUIConfiguration usesMiddleCenteringView](PHUIConfiguration, "usesMiddleCenteringView"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController middleSizingView](self, "middleSizingView"));

    if (!v25)
    {
      v26 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[PHAudioCallViewController setMiddleSizingView:](self, "setMiddleSizingView:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController middleSizingView](self, "middleSizingView"));
      objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v406 = (int)v5;
      v5 = v23;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController middleSizingView](self, "middleSizingView"));
      objc_msgSend(v28, "addSubview:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController middleSizingView](self, "middleSizingView"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
      v33 = v22;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "view"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 3, 0, v34, 4, 1.0, 0.0));
      objc_msgSend(v30, "addConstraint:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController middleSizingView](self, "middleSizingView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "mainButtonLayoutGuide"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, 4, 0, v39, 3, 1.0, 0.0));
      objc_msgSend(v36, "addConstraint:", v40);

      v22 = v33;
      p_cache = PHSOSKappaMaskedCheckInViewModel.cache;

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController middleSizingView](self, "middleSizingView"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 7, 0, 0, 0, 1.0, 0.0));
      objc_msgSend(v41, "addConstraint:", v43);

      v23 = v5;
      LODWORD(v5) = v406;

    }
  }
  if (self->_middleViewState != (_DWORD)v5)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    v47 = objc_msgSend(v46, "canDisplayAlertUI:", -[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton"));
    v409 = v23;
    v412 = v22;
    v22 = &v426;
    switch((int)v5)
    {
      case 0:
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
        objc_msgSend(v48, "resetNameOverrideString");

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v22 = v412;
        if (objc_msgSend(v49, "callDisplayStyle") != (id)3)
          goto LABEL_45;
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        if ((objc_msgSend(v50, "isDominoEnabled") & 1) != 0)
        {
          v51 = -[PHAudioCallViewController middleViewState](self, "middleViewState");

          if (v51 == 1)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
            objc_msgSend(v52, "setAlpha:", 1.0);

            v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
            objc_msgSend(v53, "setUpdatesPaused:", 1);

            v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
            v433[0] = _NSConcreteStackBlock;
            v433[1] = 3221225472;
            v433[2] = sub_1000E0F48;
            v433[3] = &unk_100287A38;
            v433[4] = self;
            v434 = v21;
            v435 = v412;
            +[AmbientAnimationCoordinator transitionFrom:to:allowRoll:completion:](_TtC13InCallService27AmbientAnimationCoordinator, "transitionFrom:to:allowRoll:completion:", v54, v55, 0, v433);

            v45 = 0;
            v44 = 0;
            v23 = v409;
            goto LABEL_195;
          }
        }
        else
        {

LABEL_45:
        }
        v431[0] = _NSConcreteStackBlock;
        v431[1] = 3221225472;
        v431[2] = sub_1000E0FB8;
        v431[3] = &unk_100284898;
        v189 = v21;
        v432 = v189;
        v44 = objc_retainBlock(v431);
        v428[0] = _NSConcreteStackBlock;
        v428[1] = 3221225472;
        v428[2] = sub_1000E0FC4;
        v428[3] = &unk_100285C30;
        v429 = v189;
        v430 = v412;
        v23 = objc_retainBlock(v428);

        v45 = 0;
        if (v44)
          goto LABEL_188;
        goto LABEL_195;
      case 1:
        v399 = v47;
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "view"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "superview"));

        if (v58)
          goto LABEL_118;
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "view"));
        objc_msgSend(v59, "addSubview:", v61);

        v62 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "view"));
        objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v394 = v46;
        v65 = v21;
        if (objc_msgSend(v64, "callDisplayStyle") == (id)3)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
          v67 = objc_msgSend(v66, "isDominoEnabled");

          if (v67)
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "centerXAnchor"));
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "view"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "centerXAnchor"));
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v72));
            objc_msgSend(v73, "setActive:", 1);

            goto LABEL_61;
          }
        }
        else
        {

        }
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "view"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v70, 9, 0, v71, 9, 1.0, 0.0));
        objc_msgSend(v68, "addConstraint:", v72);
LABEL_61:

        -[PHAudioCallViewController updateViewsForHeldCallControlsViewIfNeeded](self, "updateViewsForHeldCallControlsViewIfNeeded");
        v203 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewBottomConstraint](self, "buttonsViewBottomConstraint"));

        v21 = v65;
        v46 = v394;
        p_cache = PHSOSKappaMaskedCheckInViewModel.cache;
        if (v203)
          goto LABEL_118;
        if (sub_100044158(0))
        {
          v204 = (__int16)v5;
          v205 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v206 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
          v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "view"));
          v5 = self;
          v208 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v209 = 0.326797396;
          v210 = 0.0;
          v211 = v207;
          v212 = 3;
          v213 = v208;
          v214 = 4;
        }
        else
        {
          if (sub_100044158((void *)3))
          {
            v204 = (__int16)v5;
            v232 = +[PHUIConfiguration usesMiddleCenteringView](PHUIConfiguration, "usesMiddleCenteringView");
            v205 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
            v206 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
            v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "view"));
            v5 = self;
            if (v232)
            {
              v208 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController middleSizingView](self, "middleSizingView"));
              v209 = 1.0;
              v210 = 0.0;
            }
            else
            {
              v208 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
              v209 = 1.0;
              v210 = -12.0;
            }
          }
          else if (sub_100044158((void *)1))
          {
            v204 = (__int16)v5;
            v205 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
            v206 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
            v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "view"));
            v5 = self;
            v208 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
            v209 = 1.0;
            v210 = -2.0;
          }
          else
          {
            if (!sub_100044158((void *)2))
              goto LABEL_118;
            v204 = (__int16)v5;
            v205 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
            v206 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
            v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "view"));
            v5 = self;
            v208 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
            v209 = 1.0;
            v210 = 2.0;
          }
          v211 = v207;
          v212 = 10;
          v213 = v208;
          v214 = 10;
        }
        v270 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v211, v212, 0, v213, v214, v209, v210));
        objc_msgSend(v205, "addConstraint:", v270);

        self = v5;
        LOWORD(v5) = v204;
        v46 = v394;
        p_cache = (void **)(PHSOSKappaMaskedCheckInViewModel + 16);
LABEL_118:
        v271 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
        objc_msgSend(v271, "resetNameOverrideString");

        -[PHAudioCallViewController _updateStatusLabelVisibility](self, "_updateStatusLabelVisibility");
        v272 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        if (objc_msgSend(v272, "callDisplayStyle") == (id)3)
        {
          v273 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
          v274 = objc_msgSend(v273, "isDominoEnabled");

          if ((v274 & 1) != 0)
          {
            -[PHAudioCallViewController layoutParticipantsViewAnimated:](self, "layoutParticipantsViewAnimated:", 0);
            goto LABEL_123;
          }
        }
        else
        {

        }
        v275 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
        v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "view"));
        objc_msgSend(v276, "setNeedsLayout");

        v277 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
        v278 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "view"));
        objc_msgSend(v278, "layoutIfNeeded");

LABEL_123:
        if (v399)
        {
          v279 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
          objc_msgSend(v279, "setCurrentState:", 22);

          v280 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
          v281 = objc_msgSend(v280, "isDialPadEnabled");

          if (!v281)
            goto LABEL_146;
LABEL_144:
          -[PHAudioCallViewController hideOrShowKeypadBackgroundView](self, "hideOrShowKeypadBackgroundView");
          goto LABEL_146;
        }
        v282 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        if (objc_msgSend(v282, "callDisplayStyle"))
        {
          v283 = v46;
          v284 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
          if (objc_msgSend(v284, "callDisplayStyle") == (id)3)
          {
            v285 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
            v286 = objc_msgSend(v285, "isDominoEnabled") ^ 1;

          }
          else
          {
            v286 = 1;
          }

          v46 = v283;
        }
        else
        {
          v286 = 0;
        }

        v287 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        v288 = v46;
        if ((objc_msgSend(v287, "isDialPadEnabled") & 1) != 0)
        {
          v289 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
          v290 = objc_msgSend(v289, "currentState");

          if (v290 == (id)19)
            v286 = 0;
          else
            v286 = v286;
        }
        else
        {

        }
        v291 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        if (objc_msgSend(v291, "callDisplayStyle") == (id)3)
        {
          v292 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
          v293 = objc_msgSend(v292, "isDominoEnabled");

          if ((v293 & 1) != 0)
          {
LABEL_142:
            v295 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
            if (objc_msgSend(v295, "isDialPadEnabled"))
            {
              v296 = -[PHAudioCallViewController middleViewState](self, "middleViewState");

              v46 = v288;
              p_cache = (void **)(PHSOSKappaMaskedCheckInViewModel + 16);
              if (!v296)
                goto LABEL_146;
              goto LABEL_144;
            }

            v46 = v288;
            p_cache = PHSOSKappaMaskedCheckInViewModel.cache;
LABEL_146:
            v297 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
            v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v297, "view"));

            if (-[PHAudioCallViewController middleViewState](self, "middleViewState"))
            {
              if (-[PHAudioCallViewController middleViewState](self, "middleViewState") == 2)
              {
                v298 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
                objc_msgSend(p_cache + 333, "yParticipantsViewAdjustmentForKeypad");
                v300 = v299;
                objc_msgSend(v298, "constant");
                objc_msgSend(v298, "setConstant:", v300 + v301);

                v302 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
                v303 = objc_msgSend(v302, "isButtonLayoutEnabled");

                if ((v303 & 1) == 0)
                {
                  CGAffineTransformMakeScale(&v486, 1.20000005, 1.20000005);
                  v485 = v486;
                  objc_msgSend(v45, "setTransform:", &v485);
                }
                objc_msgSend(v45, "setAlpha:", 0.0);
                v482[0] = _NSConcreteStackBlock;
                v482[1] = 3221225472;
                v482[2] = sub_1000E0804;
                v482[3] = &unk_100285360;
                v482[4] = self;
                v403 = v45;
                v483 = v403;
                v304 = v21;
                v484 = v304;
                v44 = objc_retainBlock(v482);
                v479[0] = _NSConcreteStackBlock;
                v479[1] = 3221225472;
                v479[2] = sub_1000E08BC;
                v479[3] = &unk_100287A38;
                v479[4] = self;
                v480 = v304;
                v22 = v412;
                v481 = v412;
                v263 = objc_retainBlock(v479);

                v305 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
                if (objc_msgSend(v305, "isButtonLayoutEnabled"))
                {

                }
                else
                {
                  v326 = v46;
                  v327 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
                  if (objc_msgSend(v327, "callDisplayStyle") != (id)3)
                  {

                    v46 = v326;
                    goto LABEL_180;
                  }
                  v328 = v263;
                  v329 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
                  v411 = objc_msgSend(v329, "isDominoEnabled");

                  v263 = v328;
                  v46 = v326;
                  if (!v411)
                    goto LABEL_181;
                }
                v305 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
                objc_msgSend(v305, "setAlpha:", 0.0);
LABEL_180:

LABEL_181:
                v269 = v483;
                goto LABEL_182;
              }
              if (-[PHAudioCallViewController middleViewState](self, "middleViewState") != 4)
              {
                v23 = v409;
                if (-[PHAudioCallViewController middleViewState](self, "middleViewState") != 3)
                  goto LABEL_171;
                objc_msgSend(v45, "setAlpha:", 0.0);
                v464[0] = _NSConcreteStackBlock;
                v464[1] = 3221225472;
                v464[2] = sub_1000E0BF4;
                v464[3] = &unk_100285158;
                v330 = v21;
                v465 = v330;
                v45 = v45;
                v466 = v45;
                v44 = objc_retainBlock(v464);
                v461[0] = _NSConcreteStackBlock;
                v461[1] = 3221225472;
                v461[2] = sub_1000E0C24;
                v461[3] = &unk_100285C30;
                v462 = v330;
                v22 = v412;
                v463 = v412;
                v187 = objc_retainBlock(v461);

                v188 = v465;
LABEL_169:

                v23 = v187;
                if (!v44)
                  goto LABEL_195;
                goto LABEL_188;
              }
              v404 = v45;
              v318 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
              if (objc_msgSend(v318, "callDisplayStyle") == (id)3)
              {
                v319 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
                v320 = objc_msgSend(v319, "isDominoEnabled");

                if (v320)
                {
                  v321 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
                  v322 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
                  v478[0] = _NSConcreteStackBlock;
                  v478[1] = 3221225472;
                  v478[2] = sub_1000E0954;
                  v478[3] = &unk_1002848C0;
                  v478[4] = self;
                  +[AmbientAnimationCoordinator transitionFrom:to:allowRoll:completion:](_TtC13InCallService27AmbientAnimationCoordinator, "transitionFrom:to:allowRoll:completion:", v321, v322, 1, v478);

                  v476[0] = _NSConcreteStackBlock;
                  v476[1] = 3221225472;
                  v476[2] = sub_1000E09B0;
                  v476[3] = &unk_100284898;
                  v477 = v21;
                  v44 = objc_retainBlock(v476);

                  v22 = v412;
LABEL_201:
                  v45 = v404;
                  v467[0] = _NSConcreteStackBlock;
                  v467[1] = 3221225472;
                  v467[2] = sub_1000E0A4C;
                  v467[3] = &unk_100287B48;
                  v468 = v21;
                  v470 = v22;
                  v469 = self;
                  v23 = objc_retainBlock(v467);

                  v135 = v468;
LABEL_68:

                  if (!v44)
                    goto LABEL_195;
                  goto LABEL_188;
                }
              }
              else
              {

              }
              v333 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
              objc_msgSend(p_cache + 333, "yParticipantsViewAdjustmentForKeypad");
              v335 = v334;
              objc_msgSend(v333, "constant");
              objc_msgSend(v333, "setConstant:", v335 + v336);

              CGAffineTransformMakeScale(&v475, 1.20000005, 1.20000005);
              v474 = v475;
              objc_msgSend(v404, "setTransform:", &v474);
              objc_msgSend(v404, "setAlpha:", 0.0);
              v471[0] = _NSConcreteStackBlock;
              v471[1] = 3221225472;
              v471[2] = sub_1000E09BC;
              v471[3] = &unk_100285158;
              v472 = v404;
              v473 = v21;
              v337 = objc_retainBlock(v471);
              v338 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
              v339 = objc_msgSend(v338, "callDisplayStyle");

              if (v339)
              {
                v44 = objc_retainBlock(v337);
              }
              else
              {
                v345 = sub_1000C5588();
                v346 = objc_claimAutoreleasedReturnValue(v345);
                if (os_log_type_enabled(v346, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v346, OS_LOG_TYPE_DEFAULT, "The audio call UI is currently showing in a banner, animations on the middle view state will be queued up until we transition out of the banner.", buf, 2u);
                }

                -[PHAudioCallViewController setPendingMiddleViewAnimations:](self, "setPendingMiddleViewAnimations:", v337);
                v44 = 0;
              }
              v22 = v412;

              goto LABEL_201;
            }
            v306 = v45;
            v393 = v21;
            v398 = v46;
            v307 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
            v308 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v307, "currentCallGroups"));

            v309 = (char *)objc_msgSend(v308, "count");
            v310 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
            v311 = objc_msgSend(v310, "currentVideoCallCount");

            v312 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
            if (objc_msgSend(v312, "callDisplayStyle") == (id)3)
            {
              v313 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
              v314 = objc_msgSend(v313, "isDominoEnabled");

              if (v314)
              {
                objc_msgSend(v306, "setAlpha:", 1.0);
                if (v414)
                {
                  v315 = &v309[(_QWORD)v311] < (char *)2;
                  v316 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
                  v317 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
                  v489[0] = _NSConcreteStackBlock;
                  v489[1] = 3221225472;
                  v489[2] = sub_1000E07A0;
                  v489[3] = &unk_1002848C0;
                  v489[4] = self;
                  +[AmbientAnimationCoordinator transitionFrom:to:allowRoll:completion:](_TtC13InCallService27AmbientAnimationCoordinator, "transitionFrom:to:allowRoll:completion:", v316, v317, v315, v489);

                }
                else
                {
                  v340 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
                  objc_msgSend(v340, "setCurrentState:animated:animationCompletionBlock:", 11, 0, 0);

                  -[PHAudioCallViewController updateBottomBarAlphaWithCurrentState:](self, "updateBottomBarAlphaWithCurrentState:", -[PHCallViewController currentState](self, "currentState"));
                }
                v44 = 0;
                v21 = v393;
                v22 = v412;
                goto LABEL_187;
              }
            }
            else
            {

            }
            objc_msgSend(v306, "setAlpha:", 0.0);
            v487[0] = _NSConcreteStackBlock;
            v487[1] = 3221225472;
            v487[2] = sub_1000E07F8;
            v487[3] = &unk_100284898;
            v488 = v306;
            v323 = objc_retainBlock(v487);
            v324 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
            v325 = objc_msgSend(v324, "callDisplayStyle");

            v22 = v412;
            if (v325)
            {
              v44 = objc_retainBlock(v323);
              v21 = v393;
            }
            else
            {
              v331 = sub_1000C5588();
              v332 = objc_claimAutoreleasedReturnValue(v331);
              v21 = v393;
              if (os_log_type_enabled(v332, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v332, OS_LOG_TYPE_DEFAULT, "The audio call UI is currently showing in a banner, animations on the middle view state will be queued up until we transition out of the banner.", buf, 2u);
              }

              -[PHAudioCallViewController setPendingMiddleViewAnimations:](self, "setPendingMiddleViewAnimations:", v323);
              v44 = 0;
            }

LABEL_187:
            v23 = v409;
            v45 = v306;

            v46 = v398;
            if (v44)
            {
LABEL_188:
              if (v414)
              {
                v405 = v45;
                v341 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
                v342 = objc_msgSend(v341, "isButtonLayoutEnabled");

                if (v342)
                {
                  v343 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
                  v417[0] = _NSConcreteStackBlock;
                  v417[1] = 3221225472;
                  v417[2] = sub_1000E1240;
                  v417[3] = &unk_100284E18;
                  v44 = v44;
                  v418 = v44;
                  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v343, 5242880, v417, v23, 0.200000003);

                  v344 = v418;
                }
                else
                {
                  v415[0] = _NSConcreteStackBlock;
                  v415[1] = 3221225472;
                  v415[2] = sub_1000E124C;
                  v415[3] = &unk_100284E18;
                  v44 = v44;
                  v416 = v44;
                  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v415, v23, 0.200000003);
                  v344 = v416;
                }

                v22 = v412;
                v45 = v405;
              }
              else
              {
                ((void (*)(_QWORD *))v44[2])(v44);
                if (v23)
                  ((void (*)(PHAudioCallViewController *, uint64_t))v23->super._senderIdentityClient)(v23, 1);
              }
            }
LABEL_195:
            self->_middleViewState = (unsigned __int16)v5;
            -[PHAudioCallViewController setCurrentMiddleView:](self, "setCurrentMiddleView:", v45);
            -[PHAudioCallViewController refreshUseRTTButton](self, "refreshUseRTTButton");
            -[PHAudioCallViewController refreshExtensionNumberButton](self, "refreshExtensionNumberButton");
            -[PHAudioCallViewController hideOrShowScreeningBackgroundView](self, "hideOrShowScreeningBackgroundView");
            -[PHAudioCallViewController updateCallRecordingIfNeeded](self, "updateCallRecordingIfNeeded");

            goto LABEL_196;
          }
        }
        else
        {

        }
        v294 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        objc_msgSend(v294, "setCurrentState:animated:animationCompletionBlock:", 11, v286, 0);

        goto LABEL_142;
      case 2:
        v400 = v47;
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "view"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "superview"));

        if (v76)
          goto LABEL_97;
        v77 = v46;
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "view"));
        objc_msgSend(v78, "addSubview:", v80);

        v81 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "view"));
        objc_msgSend(v83, "setBackgroundColor:", v81);

        v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "view"));
        objc_msgSend(v85, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v86 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "view"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v88, 9, 0, v89, 9, 1.0, 0.0));
        objc_msgSend(v86, "addConstraint:", v90);

        v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        LODWORD(v86) = objc_msgSend(v91, "isButtonLayoutEnabled");

        if ((_DWORD)v86)
        {
          v92 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
          objc_msgSend(v92, "bounds");
          v94 = v93;
          v96 = v95;

          if (v94 >= v96)
            v97 = v96;
          else
            v97 = v94;
          if (v94 < v96)
            v94 = v96;
          +[PHUIConfiguration inComingCallAndInCallControlsBottomPaddingRatio](PHUIConfiguration, "inComingCallAndInCallControlsBottomPaddingRatio");
          v99 = v98 * v94;
          *(float *)&v98 = v97 * 0.1976;
          v100 = roundf(*(float *)&v98);
          +[PHUIConfiguration distanceBetweenEndButtonAndKeyPadLastRow](PHUIConfiguration, "distanceBetweenEndButtonAndKeyPadLastRow");
          v102 = v94 * v101;
          +[TPNumberPadButton verticalPadding](TPNumberPadButton, "verticalPadding");
          v104 = v102 + v99 + v100 - v103;
          v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "view"));
          v107 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v106, 4, 0, v107, 4, 1.0, -v104));

          goto LABEL_50;
        }
        if (+[PHUIConfiguration usesMiddleCenteringView](PHUIConfiguration, "usesMiddleCenteringView"))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
          v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "view"));
          v192 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController middleSizingView](self, "middleSizingView"));
          v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v191, 10, 0, v192, 10, 1.0, 0.0));

          LODWORD(v193) = 1144750080;
          objc_msgSend(v108, "setPriority:", v193);
LABEL_50:
          v194 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          objc_msgSend(v194, "addConstraint:", v108);
          goto LABEL_96;
        }
        v227 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        v228 = objc_msgSend(v227, "isDialPadEnabled");

        v229 = +[PHUIConfiguration inCallControlSpacing](PHUIConfiguration, "inCallControlSpacing");
        v230 = v229 == 5;
        if (v228)
        {
          if (v229 == 5)
          {
            v231 = 52.0;
LABEL_87:
            v392 = v21;
            v397 = v77;
            v408 = (__int16)v5;
            if (v400)
            {
              if ((id)+[PHUIConfiguration inCallControlSpacing](PHUIConfiguration, "inCallControlSpacing") == (id)5)v231 = 32.0;
              else
                v231 = 0.0;
            }
            -[PHAudioCallViewController updateViewsForHeldCallControlsViewIfNeeded](self, "updateViewsForHeldCallControlsViewIfNeeded");
            v234 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
            v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v234, "view"));
            v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "centerYAnchor"));
            v237 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
            v238 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v237, "centerYAnchor"));
            v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v236, "constraintEqualToAnchor:constant:", v238, v231));

            v239 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
            v240 = objc_msgSend(v239, "shouldEmbedSwapBanner");
            LODWORD(v241) = 1144750080;
            if (v240)
              *(float *)&v241 = 250.0;
            objc_msgSend(v108, "setPriority:", v241);

            v495[0] = v108;
            v194 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
            v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "view"));
            v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v242, "bottomAnchor"));
            v244 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
            v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v244, "topLayoutGuide"));
            v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v245, "topAnchor"));
            v247 = +[PHUIConfiguration inCallControlSpacing](PHUIConfiguration, "inCallControlSpacing");
            v248 = -4.0;
            if (v247 > 1)
              v248 = -9.0;
            v5 = self;
            v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v243, "constraintLessThanOrEqualToAnchor:constant:", v246, v248));
            v495[1] = v249;
            v250 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v495, 2));
            +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v250);

            self = v5;
            LOWORD(v5) = v408;
            v21 = v392;
            v77 = v397;
LABEL_96:

            v46 = v77;
LABEL_97:
            v251 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
            v252 = objc_msgSend(v251, "isDialPadEnabled");

            v253 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
            v254 = v253;
            if (v252)
            {
              objc_msgSend(v253, "setCurrentState:animated:animationCompletionBlock:", 19, 0, 0);

              -[PHAudioCallViewController hideOrShowKeypadBackgroundView](self, "hideOrShowKeypadBackgroundView");
              -[PHAudioCallViewController updateEnhancedEmergencyViewWhenKeypadPresented](self, "updateEnhancedEmergencyViewWhenKeypadPresented");
            }
            else
            {
              objc_msgSend(v253, "setCurrentState:animated:animationCompletionBlock:", 19, 1, 0);

            }
            v255 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController keypadViewController](self, "keypadViewController"));
            v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v255, "view"));

            v256 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
            +[PHUIConfiguration yParticipantsViewAdjustmentForKeypad](PHUIConfiguration, "yParticipantsViewAdjustmentForKeypad");
            v258 = v257;
            objc_msgSend(v256, "constant");
            objc_msgSend(v256, "setConstant:", v259 - v258);

            if (-[PHAudioCallViewController middleViewState](self, "middleViewState") != 1)
            {
              v44 = 0;
              v23 = v409;
              v22 = v412;
              goto LABEL_195;
            }
            v260 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
            v261 = objc_msgSend(v260, "isButtonLayoutEnabled");

            if ((v261 & 1) == 0)
            {
              CGAffineTransformMakeScale(&v460, 0.100000001, 0.100000001);
              v459 = v460;
              objc_msgSend(v45, "setTransform:", &v459);
            }
            objc_msgSend(v45, "setAlpha:", 0.0);
            v455[0] = _NSConcreteStackBlock;
            v455[1] = 3221225472;
            v455[2] = sub_1000E0C70;
            v455[3] = &unk_100285360;
            v262 = v21;
            v456 = v262;
            v403 = v45;
            v457 = v403;
            v458 = self;
            v44 = objc_retainBlock(v455);
            v452[0] = _NSConcreteStackBlock;
            v452[1] = 3221225472;
            v452[2] = sub_1000E0D28;
            v452[3] = &unk_100287A38;
            v452[4] = self;
            v453 = v262;
            v22 = v412;
            v454 = v412;
            v263 = objc_retainBlock(v452);

            v264 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
            if (objc_msgSend(v264, "isButtonLayoutEnabled"))
            {

            }
            else
            {
              v265 = v46;
              v266 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
              if (objc_msgSend(v266, "callDisplayStyle") != (id)3)
              {

                v46 = v265;
                goto LABEL_111;
              }
              v267 = v263;
              v268 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
              v410 = objc_msgSend(v268, "isDominoEnabled");

              v263 = v267;
              v46 = v265;
              if (!v410)
              {
LABEL_112:

                v269 = v456;
LABEL_182:

                v23 = v263;
LABEL_183:
                v45 = v403;
                if (!v44)
                  goto LABEL_195;
                goto LABEL_188;
              }
            }
            v264 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
            objc_msgSend(v264, "setAlpha:", 1.0);
LABEL_111:

            goto LABEL_112;
          }
          v230 = +[PHUIConfiguration inCallControlSpacing](PHUIConfiguration, "inCallControlSpacing") == 0;
          v233 = -5.0;
        }
        else
        {
          v233 = 16.0;
        }
        if (v230)
          v231 = v233;
        else
          v231 = 0.0;
        goto LABEL_87;
      case 3:
        v109 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopViewController](self, "voiceLoopViewController"));
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "view"));
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "superview"));

        if (!v111)
        {
          v112 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v113 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopViewController](self, "voiceLoopViewController"));
          v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "view"));
          objc_msgSend(v112, "addSubview:", v114);

          v115 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopViewController](self, "voiceLoopViewController"));
          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "view"));
          objc_msgSend(v116, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

          v401 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopViewController](self, "voiceLoopViewController"));
          v387 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v401, "view"));
          v383 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v387, "centerXAnchor"));
          v385 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v381 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v385, "centerXAnchor"));
          v379 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v383, "constraintEqualToAnchor:", v381));
          v494[0] = v379;
          v377 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopViewController](self, "voiceLoopViewController"));
          v375 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v377, "view"));
          v371 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v375, "leadingAnchor"));
          v373 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v369 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v373, "leadingAnchor"));
          v367 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v371, "constraintEqualToAnchor:", v369));
          v494[1] = v367;
          v365 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopViewController](self, "voiceLoopViewController"));
          v363 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v365, "view"));
          v358 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v363, "trailingAnchor"));
          v360 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v356 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v360, "trailingAnchor"));
          v354 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v358, "constraintEqualToAnchor:", v356));
          v494[2] = v354;
          v353 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopViewController](self, "voiceLoopViewController"));
          v352 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v353, "view"));
          v350 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v352, "topAnchor"));
          v351 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
          v349 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v351, "view"));
          v348 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v349, "bottomAnchor"));
          v395 = v46;
          v347 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v350, "constraintEqualToAnchor:", v348));
          v494[3] = v347;
          v390 = v21;
          v117 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopViewController](self, "voiceLoopViewController"));
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "view"));
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "bottomAnchor"));
          v120 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
          v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "topLayoutGuide"));
          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "topAnchor"));
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v122));
          v494[4] = v123;
          v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v494, 5));
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v124);

          v21 = v390;
          v46 = v395;

        }
        v125 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
        objc_msgSend(v125, "resetNameOverrideString");

        v126 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
        v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "view"));
        objc_msgSend(v127, "setNeedsLayout");

        v128 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "view"));
        objc_msgSend(v129, "layoutIfNeeded");

        v130 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v131 = objc_msgSend(v130, "callDisplayStyle") != 0;

        v132 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        objc_msgSend(v132, "setCurrentState:animated:animationCompletionBlock:", 11, v131, 0);

        v133 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceLoopViewController](self, "voiceLoopViewController"));
        v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "view"));

        if (!-[PHAudioCallViewController middleViewState](self, "middleViewState"))
        {
          objc_msgSend(v45, "setAlpha:", 0.0);
          v450[0] = _NSConcreteStackBlock;
          v450[1] = 3221225472;
          v450[2] = sub_1000E0DC0;
          v450[3] = &unk_100284898;
          v403 = v45;
          v451 = v403;
          v179 = objc_retainBlock(v450);
          v180 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
          v181 = objc_msgSend(v180, "callDisplayStyle");

          if (v181)
          {
            v44 = objc_retainBlock(v179);
            v22 = v412;
          }
          else
          {
            v225 = sub_1000C5588();
            v226 = objc_claimAutoreleasedReturnValue(v225);
            v22 = v412;
            if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v226, OS_LOG_TYPE_DEFAULT, "The audio call UI is currently showing in a banner, animations on the middle view state will be queued up until we transition out of the banner.", buf, 2u);
            }

            -[PHAudioCallViewController setPendingMiddleViewAnimations:](self, "setPendingMiddleViewAnimations:", v179);
            v44 = 0;
          }

          v23 = v409;
          goto LABEL_183;
        }
        if (-[PHAudioCallViewController middleViewState](self, "middleViewState") == 1)
        {
          objc_msgSend(v45, "setAlpha:", 0.0);
          v447[0] = _NSConcreteStackBlock;
          v447[1] = 3221225472;
          v447[2] = sub_1000E0DCC;
          v447[3] = &unk_100285158;
          v134 = v21;
          v448 = v134;
          v45 = v45;
          v449 = v45;
          v44 = objc_retainBlock(v447);
          v444[0] = _NSConcreteStackBlock;
          v444[1] = 3221225472;
          v444[2] = sub_1000E0DFC;
          v444[3] = &unk_100285C30;
          v445 = v134;
          v22 = v412;
          v446 = v412;
          v23 = objc_retainBlock(v444);

          v135 = v448;
          goto LABEL_68;
        }
        v23 = v409;
        if (-[PHAudioCallViewController middleViewState](self, "middleViewState") == 2)
        {
          v182 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController participantsViewTopConstraint](self, "participantsViewTopConstraint"));
          +[PHUIConfiguration yParticipantsViewAdjustmentForKeypad](PHUIConfiguration, "yParticipantsViewAdjustmentForKeypad");
          v184 = v183;
          objc_msgSend(v182, "constant");
          objc_msgSend(v182, "setConstant:", v184 + v185);

          CGAffineTransformMakeScale(&v443, 1.20000005, 1.20000005);
          v442 = v443;
          objc_msgSend(v45, "setTransform:", &v442);
          objc_msgSend(v45, "setAlpha:", 0.0);
          v439[0] = _NSConcreteStackBlock;
          v439[1] = 3221225472;
          v439[2] = sub_1000E0E48;
          v439[3] = &unk_100285158;
          v45 = v45;
          v440 = v45;
          v186 = v21;
          v441 = v186;
          v44 = objc_retainBlock(v439);
          v436[0] = _NSConcreteStackBlock;
          v436[1] = 3221225472;
          v436[2] = sub_1000E0ED8;
          v436[3] = &unk_100285C30;
          v437 = v186;
          v22 = v412;
          v438 = v412;
          v187 = objc_retainBlock(v436);

          v188 = v440;
          goto LABEL_169;
        }
LABEL_171:
        v44 = 0;
        v22 = v412;
        goto LABEL_195;
      case 4:
        v136 = -[PHAudioCallViewController middleViewState](self, "middleViewState") != 1 && v414;
        v414 = v136;
        v137 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "view"));
        v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "superview"));

        if (v139)
          goto LABEL_67;
        v140 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v141 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "view"));
        objc_msgSend(v140, "addSubview:", v142);

        v143 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "view"));
        objc_msgSend(v144, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v145 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "view"));
        LODWORD(v147) = 0;
        objc_msgSend(v146, "setContentCompressionResistancePriority:forAxis:", 0, v147);

        v148 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "view"));
        LODWORD(v150) = 0;
        objc_msgSend(v149, "setContentCompressionResistancePriority:forAxis:", 1, v150);

        v151 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "view"));
        LODWORD(v153) = 0;
        objc_msgSend(v152, "setContentHuggingPriority:forAxis:", 0, v153);

        v154 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "view"));
        LODWORD(v156) = 0;
        objc_msgSend(v155, "setContentHuggingPriority:forAxis:", 1, v156);

        v157 = objc_opt_new(FTConstraintsToggle);
        -[PHAudioCallViewController setScreeningConstraints:](self, "setScreeningConstraints:", v157);

        v158 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v389 = self;
        v407 = (__int16)v5;
        v396 = v46;
        if (objc_msgSend(v158, "callDisplayStyle") == (id)3)
        {
          v159 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
          v160 = objc_msgSend(v159, "isDominoEnabled");

          if (v160)
          {
            v357 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
            v355 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "view"));
            v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v355, "trailingAnchor"));
            v391 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
            v388 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v391, "mainButtonLayoutGuide"));
            v402 = v161;
            v386 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v388, "leadingAnchor"));
            v384 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "constraintEqualToAnchor:constant:", -20.0));
            v493[0] = v384;
            v382 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
            v380 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v382, "view"));
            v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v380, "leadingAnchor"));
            v376 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
            v374 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v376, "safeAreaLayoutGuide"));
            v378 = v162;
            v372 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v374, "leadingAnchor"));
            v370 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintEqualToAnchor:"));
            v493[1] = v370;
            v368 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
            v366 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v368, "view"));
            v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v366, "topAnchor"));
            v362 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
            v361 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v362, "view"));
            v364 = v163;
            v359 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v361, "bottomAnchor"));
            v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "constraintEqualToAnchor:"));
            v493[2] = v164;
            v165 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
            v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "view"));
            v167 = self;
            v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "bottomAnchor"));
            v169 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](v167, "view"));
            v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "bottomAnchor"));
            +[PHUIConfiguration ambientVerticalPadding](PHUIConfiguration, "ambientVerticalPadding");
            v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "constraintEqualToAnchor:constant:", v170, -v171));
            v493[3] = v172;
            v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v493, 4));
            v174 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningConstraints](v167, "screeningConstraints"));
            v175 = v21;
            v176 = v174;
            objc_msgSend(v174, "setConstraintsStatePrimary:", v173);

            v21 = v175;
            v177 = v357;

            v178 = v355;
            goto LABEL_66;
          }
        }
        else
        {

        }
        v195 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v195, "bounds");
        v197 = v196;
        v199 = v198;

        if (v197 >= v199)
          v200 = v199;
        else
          v200 = v197;
        if (v197 >= v199)
          v199 = v197;
        v201 = v200 * 0.102;
        if (+[PHUIConfiguration usesMiddleCenteringView](PHUIConfiguration, "usesMiddleCenteringView"))
        {
          v202 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController middleSizingView](self, "middleSizingView"));
          v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "centerYAnchor"));
        }
        else
        {
          v202 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
          v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "view"));
          v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "bottomAnchor"));

        }
        v216 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v217 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningConstraints](self, "screeningConstraints"));
        objc_msgSend(v217, "setView:", v216);

        v178 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v218 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "trailingAnchor"));
        v391 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v388 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v391, "view"));
        v402 = v218;
        v386 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v388, "trailingAnchor"));
        v384 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v218, "constraintEqualToAnchor:constant:", v201));
        v492[0] = v384;
        v382 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v380 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v382, "view"));
        v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v380, "leadingAnchor"));
        v376 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v378 = v219;
        v374 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v376, "leadingAnchor"));
        v372 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "constraintEqualToAnchor:constant:", v201));
        v492[1] = v372;
        v370 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        v368 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v370, "mainButtonLayoutGuide"));
        v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v368, "topAnchor"));
        v364 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v362 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v364, "view"));
        v366 = v220;
        v361 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v362, "bottomAnchor"));
        v359 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v220, "constraintEqualToAnchor:constant:", v199 * 0.0425));
        v492[2] = v359;
        v164 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "view"));
        v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "topAnchor"));
        v221 = self;
        v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "constraintEqualToAnchor:constant:", v177, v199 * 0.0475));
        v492[3] = v168;
        v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v492, 4));
        v170 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningConstraints](v221, "screeningConstraints"));
        objc_msgSend(v170, "setConstraintsStatePrimary:", v169);
LABEL_66:

        self = v389;
        LOWORD(v5) = v407;
        v46 = v396;
LABEL_67:
        -[PHAudioCallViewController hideOrShowScreeningBackgroundView](self, "hideOrShowScreeningBackgroundView");
        v222 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController screeningViewController](self, "screeningViewController"));
        v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v222, "view"));

        CGAffineTransformMakeScale(&v427, 0.100000001, 0.100000001);
        v426 = v427;
        objc_msgSend(v223, "setTransform:", &v426);
        objc_msgSend(v223, "setAlpha:", 0.0);
        v423[0] = _NSConcreteStackBlock;
        v423[1] = 3221225472;
        v423[2] = sub_1000E1008;
        v423[3] = &unk_100285158;
        v224 = v21;
        v424 = v224;
        v45 = v223;
        v425 = v45;
        v44 = objc_retainBlock(v423);
        v419[0] = _NSConcreteStackBlock;
        v419[1] = 3221225472;
        v419[2] = sub_1000E1098;
        v419[3] = &unk_100287B48;
        v420 = v224;
        v22 = v412;
        v421 = self;
        v422 = v412;
        v23 = objc_retainBlock(v419);

        v135 = v424;
        goto LABEL_68;
      default:
        v45 = 0;
        v44 = 0;
        goto LABEL_195;
    }
  }
  v44 = 0;
  v45 = 0;
LABEL_196:

}

- (void)updateViewsForHeldCallControlsViewIfNeeded
{
  void *v3;

  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
    objc_msgSend(v3, "removeFromSuperview");

    -[PHAudioCallViewController setHeldCallControlsView:](self, "setHeldCallControlsView:", 0);
    -[PHAudioCallViewController setupHeldCallControlsViewIfNeeded](self, "setupHeldCallControlsViewIfNeeded");
    -[PHAudioCallViewController constrainButtonsViewBottom](self, "constrainButtonsViewBottom");
    -[PHAudioCallViewController constrainBottomBarBottom](self, "constrainBottomBarBottom");
  }
}

- (void)constrainButtonsViewBottom
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewBottomConstraintToUse](self, "buttonsViewBottomConstraintToUse"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewBottomConstraint](self, "buttonsViewBottomConstraint"));
    objc_msgSend(v3, "setActive:", 0);

    -[PHAudioCallViewController setButtonsViewBottomConstraint:](self, "setButtonsViewBottomConstraint:", v4);
    objc_msgSend(v4, "setActive:", 1);
  }

}

- (void)constrainBottomBarBottom
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController bottomBarBottomConstraintToUse](self, "bottomBarBottomConstraintToUse"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController bottomBarBottomConstraint](self, "bottomBarBottomConstraint"));
    objc_msgSend(v3, "setActive:", 0);

    -[PHAudioCallViewController setBottomBarBottomConstraint:](self, "setBottomBarBottomConstraint:", v4);
    objc_msgSend(v4, "setActive:", 1);
  }

}

- (id)buttonsViewBottomConstraintToUse
{
  void *v2;
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
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  if (!v6)
    goto LABEL_29;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyPhotoPickerGrabberView](self, "emergencyPhotoPickerGrabberView"));

  if (!v7)
  {
    v17 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      if (objc_msgSend(v19, "callDisplayStyle") == (id)3)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        v21 = objc_msgSend(v20, "isDominoEnabled");

        if ((v21 & 1) != 0)
          goto LABEL_9;
      }
      else
      {

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
LABEL_16:
      v12 = (void *)v25;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      v14 = objc_msgSend(v13, "callDisplayStyle");
      v26 = 20.0;
      if (v14 == (id)3)
      {
        v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        if (objc_msgSend(v2, "isDominoEnabled"))
        {
          +[PHUIConfiguration ambientVerticalPadding](PHUIConfiguration, "ambientVerticalPadding");
          v26 = v27 + 32.0;
        }
      }
      v16 = -v26;
      goto LABEL_20;
    }
LABEL_9:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v22, "callDisplayStyle") == (id)3)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v24 = objc_msgSend(v23, "isDominoEnabled");

      if (v24)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
        goto LABEL_16;
      }
    }
    else
    {

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v30 = objc_msgSend(v29, "isButtonLayoutEnabled");

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v31, "bounds");
      v33 = v32;
      v35 = v34;

      if (v33 >= v35)
        v35 = v33;
      +[PHUIConfiguration inComingCallAndInCallControlsBottomPaddingRatio](PHUIConfiguration, "inComingCallAndInCallControlsBottomPaddingRatio");
      v37 = v36;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -(v35 * v37)));
      goto LABEL_23;
    }
LABEL_29:
    v28 = 0;
    return v28;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyPhotoPickerGrabberView](self, "emergencyPhotoPickerGrabberView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v14 = objc_msgSend(v13, "callDisplayStyle");
  if (v14 == (id)3)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    if (objc_msgSend(v2, "isDominoEnabled"))
    {
      +[PHUIConfiguration ambientVerticalPadding](PHUIConfiguration, "ambientVerticalPadding");
      v16 = (v15 + 32.0) * -2.5;
    }
    else
    {
      v16 = -50.0;
    }
  }
  else
  {
    v16 = -50.0;
  }
LABEL_20:
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, v16));
  if (v14 == (id)3)

LABEL_23:
  return v28;
}

- (id)bottomBarBottomConstraintToUse
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;

  v4 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v6, "callDisplayStyle") == (id)3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v8 = objc_msgSend(v7, "isDominoEnabled");

      if ((v8 & 1) != 0)
        goto LABEL_4;
    }
    else
    {

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    goto LABEL_8;
  }
LABEL_4:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 != (id)1)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v22, "callDisplayStyle") == (id)3)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v24 = objc_msgSend(v23, "isDominoEnabled");

      if (v24)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
LABEL_8:
        v14 = (void *)v17;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v18 = objc_msgSend(v15, "callDisplayStyle");
        v19 = 20.0;
        if (v18 == (id)3)
        {
          v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
          if (objc_msgSend(v2, "isDominoEnabled"))
          {
            +[PHUIConfiguration ambientVerticalPadding](PHUIConfiguration, "ambientVerticalPadding");
            v19 = v20 + 32.0;
          }
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -v19));
        if (v18 == (id)3)

        goto LABEL_13;
      }
    }
    else
    {

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    objc_msgSend(v25, "isButtonLayoutEnabled");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    goto LABEL_14;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "safeAreaLayoutGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v15));
LABEL_13:

LABEL_14:
  return v16;
}

- (void)setupHeldCallControlsViewIfNeeded
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
  unsigned int v13;
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
  uint64_t v25;
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
  void *v37;
  _QWORD v38[3];
  _QWORD v39[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController makeHeldCallControlsViewWithCallCenter:style:](self, "makeHeldCallControlsViewWithCallCenter:style:", v4, objc_msgSend(v5, "callDisplayStyle")));
    -[PHAudioCallViewController setHeldCallControlsView:](self, "setHeldCallControlsView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
      objc_msgSend(v8, "addSubview:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      if (objc_msgSend(v11, "callDisplayStyle") == (id)3)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        v13 = objc_msgSend(v12, "isDominoEnabled");

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 10.0));
          v39[0] = v18;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "safeAreaLayoutGuide"));
          v36 = v19;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:"));
          v39[1] = v32;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController leadingSideLayoutGuide](self, "leadingSideLayoutGuide"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 20.0));
          v39[2] = v23;
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 3));
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);
LABEL_8:

          return;
        }
      }
      else
      {

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layoutMarginsGuide"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v25));
      v38[0] = v37;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layoutMarginsGuide"));
      v35 = v26;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:"));
      v38[1] = v31;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController heldCallControlsView](self, "heldCallControlsView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "safeAreaLayoutGuide"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v24));
      v38[2] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

      v18 = (void *)v25;
      v14 = v30;
      v15 = v29;
      goto LABEL_8;
    }
  }
}

- (void)updateShareNameAndPhotoHUDPresentationIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v4 = objc_msgSend(v3, "isNameAndPhotoC3Enabled");

  if (v4
    && (-[PHCallViewController currentState](self, "currentState") == 4
     || -[PHCallViewController currentState](self, "currentState") == 5))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v6 = objc_msgSend(v5, "callDisplayStyle");

    if (v6 == (id)2)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bannerPresentationManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      -[PHAudioCallViewController showNameAndPhotoHUDIfNecessaryWithBannerPresentationManager:callCenter:](self, "showNameAndPhotoHUDIfNecessaryWithBannerPresentationManager:callCenter:", v8, v9);

    }
  }
}

- (PHAudioCallControlsViewController)buttonsViewController
{
  PHAudioCallControlsViewController *buttonsViewController;
  PHAudioCallControlsViewController *v4;
  void *v5;
  PHAudioCallControlsViewController *v6;
  PHAudioCallControlsViewController *v7;

  buttonsViewController = self->_buttonsViewController;
  if (!buttonsViewController)
  {
    v4 = [PHAudioCallControlsViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v6 = -[PHAudioCallControlsViewController initWithCallDisplayStyleManager:](v4, "initWithCallDisplayStyleManager:", v5);
    v7 = self->_buttonsViewController;
    self->_buttonsViewController = v6;

    -[PHAudioCallViewController addChildViewController:](self, "addChildViewController:", self->_buttonsViewController);
    -[PHAudioCallControlsViewController setDelegate:](self->_buttonsViewController, "setDelegate:", self);
    buttonsViewController = self->_buttonsViewController;
  }
  return buttonsViewController;
}

- (PHInCallKeypadViewController)keypadViewController
{
  PHInCallKeypadViewController *keypadViewController;
  PHInCallKeypadViewController *v4;
  PHInCallKeypadViewController *v5;

  keypadViewController = self->_keypadViewController;
  if (!keypadViewController)
  {
    v4 = objc_alloc_init(PHInCallKeypadViewController);
    v5 = self->_keypadViewController;
    self->_keypadViewController = v4;

    -[PHAudioCallViewController addChildViewController:](self, "addChildViewController:", self->_keypadViewController);
    keypadViewController = self->_keypadViewController;
  }
  return keypadViewController;
}

- (UIViewController)screeningViewController
{
  UIViewController *screeningViewController;
  void *v4;
  UIViewController *v5;
  UIViewController *v6;

  screeningViewController = self->_screeningViewController;
  if (!screeningViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNKTranscriptionViewComposerFactory makeViewComposer](self->_screeningViewControllerFactory, "makeViewComposer"));
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compose"));
    v6 = self->_screeningViewController;
    self->_screeningViewController = v5;

    -[PHAudioCallViewController addChildViewController:](self, "addChildViewController:", self->_screeningViewController);
    screeningViewController = self->_screeningViewController;
  }
  return screeningViewController;
}

- (PHAudioCallControlsSupplementalButton)useRTTButton
{
  PHAudioCallControlsSupplementalButton *useRTTButton;
  id v4;
  void *v5;
  PHAudioCallControlsSupplementalButton *v6;
  PHAudioCallControlsSupplementalButton *v7;
  void *v8;
  void *v9;
  PHAudioCallControlsSupplementalButton *v10;
  void *v11;

  useRTTButton = self->_useRTTButton;
  if (!useRTTButton)
  {
    v4 = sub_1000F8B14();
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    v6 = -[PHAudioCallControlsSupplementalButton initWithFrame:]([PHAudioCallControlsSupplementalButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = self->_useRTTButton;
    self->_useRTTButton = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localSenderIdentityUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rttDisplayName:forSubscriptionContextUUID:", 0, v8));

    -[PHAudioCallControlsSupplementalButton setTitle:forState:](self->_useRTTButton, "setTitle:forState:", v9, 0);
    v10 = self->_useRTTButton;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage symbolImageNamed:](UIImage, "symbolImageNamed:", CFSTR("teletype")));
    -[PHAudioCallControlsSupplementalButton setImage:forState:](v10, "setImage:forState:", v11, 0);

    -[PHAudioCallControlsSupplementalButton addTarget:action:forEvents:](self->_useRTTButton, "addTarget:action:forEvents:", self, "useRTTButtonTapped", 64);
    useRTTButton = self->_useRTTButton;
  }
  return useRTTButton;
}

- (PHAudioCallControlsSupplementalButton)extensionNumberButton
{
  PHAudioCallControlsSupplementalButton *extensionNumberButton;
  PHAudioCallControlsSupplementalButton *v4;
  PHAudioCallControlsSupplementalButton *v5;

  extensionNumberButton = self->_extensionNumberButton;
  if (!extensionNumberButton)
  {
    v4 = -[PHAudioCallControlsSupplementalButton initWithFrame:]([PHAudioCallControlsSupplementalButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_extensionNumberButton;
    self->_extensionNumberButton = v4;

    -[PHAudioCallControlsSupplementalButton addTarget:action:forEvents:](self->_extensionNumberButton, "addTarget:action:forEvents:", self, "extensionNumberButtonTapped", 64);
    extensionNumberButton = self->_extensionNumberButton;
  }
  return extensionNumberButton;
}

- (PHAudioCallControlsSupplementalButton)callTransferButton
{
  PHAudioCallControlsSupplementalButton *callTransferButton;
  PHAudioCallControlsSupplementalButton *v4;
  PHAudioCallControlsSupplementalButton *v5;
  PHAudioCallControlsSupplementalButton *v6;
  void *v7;
  void *v8;
  PHAudioCallControlsSupplementalButton *v9;
  void *v10;

  callTransferButton = self->_callTransferButton;
  if (!callTransferButton)
  {
    v4 = -[PHAudioCallControlsSupplementalButton initWithFrame:]([PHAudioCallControlsSupplementalButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_callTransferButton;
    self->_callTransferButton = v4;

    -[PHAudioCallControlsSupplementalButton addTarget:action:forEvents:](self->_callTransferButton, "addTarget:action:forEvents:", self, "callTransferButtonTapped", 64);
    v6 = self->_callTransferButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TRANSFER"), &stru_10028DC20, CFSTR("InCallService")));
    -[PHAudioCallControlsSupplementalButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    v9 = self->_callTransferButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage symbolImageNamed:](UIImage, "symbolImageNamed:", CFSTR("phone.arrow.right.fill")));
    -[PHAudioCallControlsSupplementalButton setImage:forState:](v9, "setImage:forState:", v10, 0);

    callTransferButton = self->_callTransferButton;
  }
  return callTransferButton;
}

- (SOSEmergencyCallVoiceLoopManager)voiceLoopManager
{
  SOSEmergencyCallVoiceLoopManager *voiceLoopManager;
  SOSEmergencyCallVoiceLoopManager *v4;
  SOSEmergencyCallVoiceLoopManager *v5;

  voiceLoopManager = self->_voiceLoopManager;
  if (!voiceLoopManager)
  {
    v4 = (SOSEmergencyCallVoiceLoopManager *)objc_msgSend(objc_alloc((Class)SOSEmergencyCallVoiceLoopManager), "initWithReason:", 2);
    v5 = self->_voiceLoopManager;
    self->_voiceLoopManager = v4;

    -[SOSEmergencyCallVoiceLoopManager setDelegate:](self->_voiceLoopManager, "setDelegate:", self);
    voiceLoopManager = self->_voiceLoopManager;
  }
  return voiceLoopManager;
}

- (PHAudioCallVoiceLoopViewController)voiceLoopViewController
{
  PHAudioCallVoiceLoopViewController *voiceLoopViewController;
  PHAudioCallVoiceLoopViewController *v4;
  PHAudioCallVoiceLoopViewController *v5;

  voiceLoopViewController = self->_voiceLoopViewController;
  if (!voiceLoopViewController)
  {
    v4 = objc_alloc_init(PHAudioCallVoiceLoopViewController);
    v5 = self->_voiceLoopViewController;
    self->_voiceLoopViewController = v4;

    -[PHAudioCallViewController addChildViewController:](self, "addChildViewController:", self->_voiceLoopViewController);
    -[PHAudioCallVoiceLoopViewController setDelegate:](self->_voiceLoopViewController, "setDelegate:", self);
    voiceLoopViewController = self->_voiceLoopViewController;
  }
  return voiceLoopViewController;
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
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));

  if (v8 == v7)
  {
    -[PHAudioCallViewController performBottomBarActionType:](self, "performBottomBarActionType:", a3);
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
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
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
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  unsigned __int8 v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  _BOOL4 v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  unsigned int v107;
  id v108;
  NSObject *v109;
  _BOOL4 v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  _QWORD v117[4];
  id v118;
  uint8_t buf[4];
  void *v120;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameForActionType:", a3));
    *(_DWORD *)buf = 138412290;
    v120 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BottomBarActionPerformed: %@", buf, 0xCu);

  }
  switch(a3)
  {
    case 1:
      goto LABEL_15;
    case 2:
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController inCallRootViewController](self, "inCallRootViewController"));
      objc_msgSend(v31, "requestInCallSceneTransitionToFullScreen");

LABEL_15:
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
      if (objc_msgSend(v32, "wantsHoldMusic"))
      {
        objc_msgSend(v32, "resetWantsHoldMusic");
        -[PHAudioCallViewController updateCurrentState](self, "updateCurrentState");
      }
      else
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "screeningCall"));

        if (-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
          v75 = objc_msgSend(v73, "isEqualToCall:", v74);

          v76 = v75 ^ 1;
        }
        else
        {
          v76 = 0;
        }
        if (!v73 || (v76 & 1) != 0)
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "incomingCall"));

          v91 = sub_1000C5588();
          v92 = objc_claimAutoreleasedReturnValue(v91);
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v120 = v88;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "Answering incoming call: %@", buf, 0xCu);
          }

          if (-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI")
            && (v93 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter")),
                v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "currentCallGroups")),
                v95 = (unint64_t)objc_msgSend(v94, "count") > 1,
                v94,
                v93,
                v95))
          {
            v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController answerRequestForCall:](self, "answerRequestForCall:", v88));
            v96 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
            v97 = v96;
            if (v73)
              objc_msgSend(v96, "endActiveOrHeldAndAnswerWithRequest:", v89);
            else
              objc_msgSend(v96, "holdActiveAndAnswerWithRequest:", v89);

            v112 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController analyticsReporter](self, "analyticsReporter"));
            objc_msgSend(v112, "reportMultipleCallsWaitingUIAction:", 3);
          }
          else
          {
            v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
            v112 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController answerRequestForCall:](self, "answerRequestForCall:", v88));
            objc_msgSend(v89, "answerWithRequest:", v112);
          }

        }
        else
        {
          v86 = sub_1000C5588();
          v87 = objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v120 = v73;
            _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Answering screened call: %@", buf, 0xCu);
          }

          v88 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController answerRequestForCall:](self, "answerRequestForCall:", v73));
          objc_msgSend(v88, "setBehavior:", 4);
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
          objc_msgSend(v89, "answerWithRequest:", v88);
        }

      }
      return;
    case 4:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "incomingCall"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController answerRequestForCall:](self, "answerRequestForCall:", v34));

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "activeVideoCall"));

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v39 = v38;
      if (v37)
      {
        objc_msgSend(v38, "endActiveOrHeldAndAnswerWithRequest:", v35);
      }
      else
      {
        v107 = objc_msgSend(v38, "isEndAndAnswerAllowed");

        v108 = sub_1000C5588();
        v109 = objc_claimAutoreleasedReturnValue(v108);
        v110 = os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
        if (v107)
        {
          if (v110)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "BottomBar: Ending active and answering incoming call", buf, 2u);
          }

          v111 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
          objc_msgSend(v111, "endActiveOrHeldAndAnswerWithRequest:", v35);
        }
        else
        {
          if (v110)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "BottomBar: Disconnecting all calls", buf, 2u);
          }

          v111 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
          objc_msgSend(v111, "disconnectAllCalls");
        }

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController analyticsReporter](self, "analyticsReporter"));
        objc_msgSend(v39, "reportMultipleCallsWaitingUIAction:", 2);
      }

      return;
    case 5:
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "incomingCall"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController answerRequestForCall:](self, "answerRequestForCall:", v42));
      objc_msgSend(v40, "endHeldAndAnswerWithRequest:", v43);

      return;
    case 6:
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "incomingCall"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController answerRequestForCall:](self, "answerRequestForCall:", v46));
      objc_msgSend(v44, "holdActiveAndAnswerWithRequest:", v47);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController analyticsReporter](self, "analyticsReporter"));
      objc_msgSend(v48, "reportMultipleCallsWaitingUIAction:", 3);

      return;
    case 7:
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController declineCallService](self, "declineCallService"));
      objc_msgSend(v49, "declineAnsweringFrontMostCallViaUserActionWithCompletionHandler:", &stru_100287B68);

      return;
    case 10:
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "handle"));
      -[PHAudioCallViewController showBlockAlertForHandle:](self, "showBlockAlertForHandle:", v51);

      return;
    case 13:
    case 18:
    case 34:
      -[PHAudioCallViewController setCurrentState:](self, "setCurrentState:", 0);
      return;
    case 14:
      if (-[PHCallViewController currentState](self, "currentState") != 10)
        goto LABEL_13;
      -[PHAudioCallViewController handleCancelPressedInCallBufferScreen](self, "handleCancelPressedInCallBufferScreen");
      break;
    case 15:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      objc_msgSend(v9, "disconnectAllCalls");

      return;
    case 16:
      -[PHAudioCallViewController setMiddleViewState:animated:](self, "setMiddleViewState:animated:", 1, 1);
      return;
    case 17:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mostRecentlyDisconnectedAudioCall"));

      if (v12)
      {
        v13 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dialRequestForRedial"));
        -[NSObject launchAppForDialRequest:completion:](v13, "launchAppForDialRequest:completion:", v14, 0);

      }
      else
      {
        v98 = sub_1000C5588();
        v13 = objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1001AAA18();
      }
      goto LABEL_81;
    case 21:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routeController"));
      v17 = objc_msgSend(v16, "areAuxiliaryRoutesAvailable");

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "delegate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentInCallScene"));
        objc_msgSend(v20, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:", 2, 0, CFSTR("SBSUIInCallTransitionAnalyticsSourceAudioRouteButtonPress"));

        -[PHAudioCallViewController setWaitingForFullScreenAudioRoutes:](self, "setWaitingForFullScreenAudioRoutes:", 1);
      }
      else
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "routeController"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "pickedRoute"));
        v80 = objc_msgSend(v79, "isSpeaker");

        v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "routeController"));
        v83 = v82;
        if (v80)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "routeForSpeakerDisable"));

          if (v12)
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "routeController"));
            objc_msgSend(v85, "pickRoute:", v12);

            v13 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
            -[NSObject setBannerAudioRouteButtonSelected:](v13, "setBannerAudioRouteButtonSelected:", 0);
          }
          else
          {
            v115 = sub_1000C5588();
            v13 = objc_claimAutoreleasedReturnValue(v115);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find available route to pick for speaker disable", buf, 2u);
            }
          }
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "routeForSpeakerEnable"));

          if (v12)
          {
            v113 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
            v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "routeController"));
            objc_msgSend(v114, "pickRoute:", v12);

            v13 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
            -[NSObject setBannerAudioRouteButtonSelected:](v13, "setBannerAudioRouteButtonSelected:", 1);
          }
          else
          {
            v116 = sub_1000C5588();
            v13 = objc_claimAutoreleasedReturnValue(v116);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find available route to pick for speaker enable", buf, 2u);
            }
          }
        }
LABEL_81:

      }
      break;
    case 22:
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
      objc_msgSend(v52, "sendHardPauseDigits");

      return;
    case 23:
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v54 = (unint64_t)objc_msgSend(v53, "currentCallCount") > 1;

      if (v54)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController analyticsReporter](self, "analyticsReporter"));
        objc_msgSend(v55, "reportMultipleCallsWaitingUIAction:", 4);

      }
      goto LABEL_29;
    case 24:
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](self, "featureFlags"));
      v60 = TUCallScreeningEnabledM3(v59);

      if (!v60)
        return;
      if (-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI")
        && (v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter")),
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "currentCallGroups")),
            v63 = (unint64_t)objc_msgSend(v62, "count") > 1,
            v62,
            v61,
            v63))
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v65 = (unint64_t)objc_msgSend(v64, "currentCallCount") > 1;

        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController analyticsReporter](self, "analyticsReporter"));
          objc_msgSend(v66, "reportMultipleCallsWaitingUIAction:", 4);

        }
LABEL_29:
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "incomingCall"));
        objc_msgSend(v56, "disconnectCall:withReason:", v58, 2);

      }
      else
      {
        v99 = sub_1000C5588();
        v100 = objc_claimAutoreleasedReturnValue(v99);
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          v101 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
          *(_DWORD *)buf = 138412290;
          v120 = v101;
          _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Answering screened call: %@", buf, 0xCu);

        }
        v102 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
        if (v102)
        {
          v103 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "delegate"));
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "answeringMachine"));
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "callUUID"));
          objc_msgSend(v105, "screenCallWithUUID:manualScreening:completion:", v106, 1, &stru_100287B88);

        }
      }
      break;
    case 26:
      -[PHAudioCallViewController _leaveMessage](self, "_leaveMessage");
      return;
    case 29:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
      objc_msgSend(v21, "setTTYType:forCall:", 1, v22);

      return;
    case 32:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "delegate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mostRecentlyDisconnectedAudioCall"));

      objc_initWeak((id *)buf, self);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController inCallRootViewController](self, "inCallRootViewController"));
      v117[0] = _NSConcreteStackBlock;
      v117[1] = 3221225472;
      v117[2] = sub_1000E337C;
      v117[3] = &unk_100284F60;
      objc_copyWeak(&v118, (id *)buf);
      objc_msgSend(v26, "presentBlockAndReportAlertToBlockCall:forViewController:completion:", v25, self, v117);

      objc_destroyWeak(&v118);
      objc_destroyWeak((id *)buf);

      return;
    case 33:
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "delegate"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "mostRecentlyDisconnectedAudioCall"));

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController inCallRootViewController](self, "inCallRootViewController"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "handle"));
      objc_msgSend(v70, "presentCreateContactViewControllerWithHandle:forViewController:", v71, self);

      return;
    case 35:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "delegate"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "alertCoordinator"));
      objc_msgSend(v29, "invokeAlertWithRequestUnlock:automaticallyInvoked:", -[PHAudioCallViewController alertTriggeredByAutoCountdown](self, "alertTriggeredByAutoCountdown") ^ 1, -[PHAudioCallViewController alertTriggeredByAutoCountdown](self, "alertTriggeredByAutoCountdown"));

      return;
    case 36:
LABEL_13:
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      objc_msgSend(v30, "disconnectCurrentCallAndActivateHeld");

      break;
    default:
      return;
  }
}

- (BOOL)shouldShowHardPauseNumbers
{
  return 1;
}

- (BOOL)shouldShowAnswerRTT
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  if ((objc_msgSend(v2, "isRTT") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isTTY");

  return v3;
}

- (BOOL)shouldShowUseRTT
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  id v14;
  int v16;
  void *v17;
  __int16 v18;
  NSObject *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v4 = objc_msgSend(v3, "currentCallCount");

  if (v4 != (id)1)
  {
    v14 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Multiple calls are currently active; Use RTT button should not be presented.",
        (uint8_t *)&v16,
        2u);
    }
    goto LABEL_16;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
  if ((-[NSObject isRTT](v5, "isRTT") & 1) != 0
    || (-[NSObject isTTY](v5, "isTTY") & 1) != 0
    || !-[NSObject supportsTTYWithVoice](v5, "supportsTTYWithVoice"))
  {
LABEL_16:
    LOBYTE(v10) = 0;
    goto LABEL_17;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localSenderIdentityUUID](v5, "localSenderIdentityUUID"));
  if (!v6)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Could not retrieve a sender identity UUID from the frontmost call %@; checking if RTT is available anyway.",
        (uint8_t *)&v16,
        0xCu);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController senderIdentityClient](self, "senderIdentityClient"));
  v10 = objc_msgSend(v9, "isRTTAvailableForSenderIdentityUUID:", v6);

  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("should not");
    if (v10)
      v13 = CFSTR("should");
    v16 = 138412546;
    v17 = (void *)v13;
    v18 = 2112;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Determined that the Use RTT button %@ be presented for the frontmost call %@.", (uint8_t *)&v16, 0x16u);
  }

LABEL_17:
  return v10;
}

- (BOOL)shouldShowCallTransfer
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v3, "callDisplayStyle") != (id)3)
  {

LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "callsPassingTest:", &stru_100287BA8));

    if (objc_msgSend(v8, "count") == (id)2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
      if (objc_msgSend(v9, "isConferenced"))
      {

      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "provider"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "provider"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));

        if (v12 == v15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
          v18 = objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v17));

          v32 = (void *)v18;
          v19 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", CFSTR("4")));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactMatchingPhoneNumber:](CNContact, "predicateForContactMatchingPhoneNumber:", v20));

          v40 = CNPhoneNumberStringValueKey;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
          v33 = 0;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "unifiedContactsMatchingPredicate:keysToFetch:error:", v21, v22, &v33));
          v24 = v33;

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localSenderIdentity"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "accountUUID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
          v6 = +[PHInCallUIUtilities isExplicitTransferSupportedForSubscriptionLabelIdentifier:](PHInCallUIUtilities, "isExplicitTransferSupportedForSubscriptionLabelIdentifier:", v28);

          v29 = sub_1000C5588();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = objc_msgSend(v23, "count");
            *(_DWORD *)buf = 134218498;
            v35 = v31;
            v36 = 1024;
            v37 = v6;
            v38 = 2112;
            v39 = v24;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "CallTransferButton: contacts with number 4 have count of %lu,  carrierWantsShowCallTransferButton = %d, error is %@", buf, 0x1Cu);
          }

          if (v24)
          {
            LOBYTE(v6) = 0;
          }
          else if (objc_msgSend(v23, "count"))
          {
            LOBYTE(v6) = 1;
          }

          goto LABEL_10;
        }
      }
    }
    LOBYTE(v6) = 0;
LABEL_10:

    return v6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v5 = objc_msgSend(v4, "isDominoEnabled");

  if ((v5 & 1) == 0)
    goto LABEL_5;
  LOBYTE(v6) = 0;
  return v6;
}

- (id)customizedTitleForItemInBar:(id)a3 withActionType:(int64_t)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));

  v8 = 0;
  if (a4 == 22 && v7 == v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    if (objc_msgSend(v9, "hardPauseDigitsState") == 2)
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hardPauseDigitsDisplayString"));
    else
      v8 = &stru_10028DC20;

  }
  return v8;
}

- (int64_t)bottomBarCallStateInBar:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter", a3));
  v4 = objc_msgSend(v3, "bottomBarCallState");

  return (int64_t)v4;
}

- (void)showBlockAlertForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BLOCK_UNKNOWN_CALLER_ALERT_TITLE"), &stru_10028DC20, CFSTR("InCallService")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BLOCK_UNKNOWN_CALLER_ALERT_ACTION_BLOCK"), &stru_10028DC20, CFSTR("InCallService")));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E3D18;
  v15[3] = &unk_100287BD0;
  objc_copyWeak(&v17, &location);
  v10 = v4;
  v16 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 2, v15));
  objc_msgSend(v7, "addAction:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("BLOCK_UNKNOWN_CALLER_ALERT_ACTION_CANCEL"), &stru_10028DC20, CFSTR("InCallService")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 1, &stru_100287BF0));
  objc_msgSend(v7, "addAction:", v14);

  -[PHAudioCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

- (id)answerRequestForCall:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned __int8 v13;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)TUAnswerRequest), "initWithCall:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pickedRoute"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v9, "callDisplayStyle") == (id)3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v11 = objc_msgSend(v10, "isDominoEnabled");
    if (v11 && v8)
    {
      if (-[PHAudioCallViewController isPickedRouteSpeaker](self, "isPickedRouteSpeaker"))
      {

      }
      else
      {
        v13 = -[PHAudioCallViewController isPickedRouteReceiver](self, "isPickedRouteReceiver");

        if ((v13 & 1) == 0)
          return v5;
      }
      goto LABEL_8;
    }

    if (v11)
LABEL_8:
      objc_msgSend(v5, "setSourceIdentifier:", TUCallSourceIdentifierSpeakerRoute);
  }
  else
  {

  }
  return v5;
}

- (void)_leaveMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mostRecentlyDisconnectedAudioCall"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](self, "featureFlags"));
  LODWORD(v4) = TUCallScreeningEnabled(v6, 0);

  if ((_DWORD)v4 && !v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screeningCall"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "handle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));

  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412546;
    v22 = v5;
    v23 = 2112;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call %@; Destination ID %@",
      (uint8_t *)&v21,
      0x16u);
  }

  if (objc_msgSend(v9, "destinationIdIsPhoneNumber"))
  {
    v12 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage(0);
    if (!v12)
    {
      v13 = TUActiveCountryCode();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
    }
    v14 = TUNetworkCountryCode();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = TUNumberToDial(v9, v15, v12, 0, 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);

    v9 = (void *)v17;
  }
  if (v9 && objc_msgSend(v9, "length"))
  {
    v18 = objc_alloc_init((Class)MFMessageComposeViewController);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v9));
    -[NSObject setRecipients:](v18, "setRecipients:", v19);

    -[NSObject setBody:](v18, "setBody:", &stru_10028DC20);
    -[NSObject setMessageComposeDelegate:](v18, "setMessageComposeDelegate:", self);
    -[NSObject _setCanEditRecipients:](v18, "_setCanEditRecipients:", 0);
    -[PHAudioCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
  }
  else
  {
    v20 = sub_1000C5588();
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1001AAA44();
  }

}

- (BOOL)allowsOrientationChangeEvents
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if ((objc_opt_respondsToSelector(v2, "userInterfaceIdiom") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    v5 = v4 == (id)1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E424C;
  v4[3] = &unk_100284898;
  v4[4] = self;
  -[PHAudioCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (BOOL)allowsMenuButtonDismissal
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "incomingCall"));
  v4 = v3 == 0;

  return v4;
}

- (BOOL)allowsBanners
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "incomingCall"));
  v4 = v3 == 0;

  return v4;
}

- (BOOL)desiresLockButtonEvents
{
  PHAudioCallViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  LOBYTE(v2) = -[PHAudioCallViewController desiresLockButtonEventsForCallContainer:](v2, "desiresLockButtonEventsForCallContainer:", v3);

  return (char)v2;
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
    v6 = -[PHAudioCallViewController isPickedRouteReceiver](self, "isPickedRouteReceiver");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setPrioritizedCall:(id)a3
{
  id v4;
  id WeakRetained;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  id v13;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedCall);
  v6 = objc_msgSend(WeakRetained, "isEqualToCall:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring our own call management, told to take in prioritizedCall %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = objc_storeWeak((id *)&self->_prioritizedCall, v4);
    -[PHCallParticipantsViewController setPrioritizedCall:](self->_callParticipantsViewController, "setPrioritizedCall:", v4);

    -[PHAudioCallViewController updateCurrentState](self, "updateCurrentState");
    if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
      v11 = objc_loadWeakRetained((id *)&self->_prioritizedCall);
      -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v10, 1, objc_msgSend(v11, "status") == 4);

    }
    -[PHAudioCallViewController _updatePosterStatusLabelForState:](self, "_updatePosterStatusLabelForState:", -[PHCallViewController currentState](self, "currentState"));
  }

}

- (TUCall)activeCall
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall")),
        v3,
        v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callWithStatus:", 1));

    if (!v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callWithStatus:", 4));

      if (!v4)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "callWithStatus:", 3));

        if (!v4)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
          v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callWithStatus:", 2));

        }
      }
    }
  }
  return (TUCall *)v4;
}

- (TUCall)frontmostCall
{
  void *v3;
  void *v4;

  if (-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController activeCall](self, "activeCall"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "frontmostCall"));

  }
  return (TUCall *)v3;
}

- (void)hardwareButtonEventNotification:(id)a3
{
  NSObject *v3;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unsigned int v14;
  char v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  __CFString *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  _BYTE v39[10];
  void *v40;

  v5 = a3;
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v38 = 138412290;
    *(_QWORD *)v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController received a hardware button event (%@)", (uint8_t *)&v38, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController activeCall](self, "activeCall"));
  if ((objc_msgSend(v9, "isRTT") & 1) != 0 || objc_msgSend(v9, "isTTY"))
  {
    v10 = sub_1000F8A50();
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController navigationController](self, "navigationController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "visibleViewController"));
      LOBYTE(v10) = objc_opt_isKindOfClass(v12, v10);

      v13 = sub_1000C5588();
      v3 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v38 = 67109120;
        *(_DWORD *)v39 = v10 & 1;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "setting isShowingRTTConversationViewController: %d", (uint8_t *)&v38, 8u);
      }

    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  v14 = -[PHAudioCallViewController isViewLoaded](self, "isViewLoaded");
  v15 = v14;
  if (v14)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject window](v3, "window"));
    if ((v16 != 0) | v10 & 1)
    {

      goto LABEL_19;
    }
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_19;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController inCallRootViewController](self, "inCallRootViewController"));
  v18 = objc_msgSend(v17, "isDisplayStyleMiniWindow");

  if ((v15 & 1) != 0)
  {

    if ((v18 & 1) == 0)
      goto LABEL_16;
LABEL_19:
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKey:", CFSTR("kPHHardwareButtonEventType")));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "incomingCall"));

    if (v20 == CFSTR("kPHHardwareButtonEventTypeLockButton"))
    {
      -[PHAudioCallViewController handleDeviceLockEventWithSourceType:](self, "handleDeviceLockEventWithSourceType:", 1);
    }
    else
    {
      if (v20 == CFSTR("kPHHardwareButtonEventTypeVolumeDownButton")
        || v20 == CFSTR("kPHHardwareButtonEventTypeVolumeUpButton"))
      {
        v32 = sub_1000C5588();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v38) = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling kPHHardwareButtonEventTypeVolumeDownButton || kPHHardwareButtonEventTypeVolumeUpButton buttonType", (uint8_t *)&v38, 2u);
        }

        objc_msgSend(v26, "suppressRingtone");
        goto LABEL_35;
      }
      if (v20 == CFSTR("kPHHardwareButtonEventTypeHeadsetButton"))
      {
        v34 = sub_1000C5588();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "incomingCall"));
          v38 = 138412546;
          *(_QWORD *)v39 = v37;
          *(_WORD *)&v39[8] = 2112;
          v40 = v9;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling kPHHardwareButtonEventTypeHeadsetButton buttonType (incoming call = %@, active call = %@)", (uint8_t *)&v38, 0x16u);

        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        objc_msgSend(v31, "handleActionForWiredHeadsetMiddleButtonPress");
        goto LABEL_34;
      }
      if (v20 == CFSTR("kPHHardwareButtonEventTypeHeadsetButtonLongPress"))
      {
        v27 = sub_1000C5588();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "incomingCall"));
          v38 = 138412290;
          *(_QWORD *)v39 = v30;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling kPHHardwareButtonEventTypeHeadsetButtonLongPress buttonType (incoming call = %@)", (uint8_t *)&v38, 0xCu);

        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
        objc_msgSend(v31, "handleActionForWiredHeadsetMiddleButtonLongPress");
LABEL_34:

      }
    }
LABEL_35:

    goto LABEL_36;
  }
  if (v18)
    goto LABEL_19;
LABEL_16:
  v19 = sub_1000C5588();
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = -[PHAudioCallViewController isViewLoaded](self, "isViewLoaded");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "window"));
    v38 = 67109376;
    *(_DWORD *)v39 = v21;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v23 != 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "[WARN] PHAudioCallViewController will not handle the hardware button event as the view is not loaded (viewLoaded = %d) or we have no window (window exists = %d)", (uint8_t *)&v38, 0xEu);

  }
LABEL_36:

}

- (void)handleDeviceLockEventWithSourceType:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint8_t v24[16];
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PHAudioCallViewController;
  -[PHCallViewController handleDeviceLockEventWithSourceType:](&v25, "handleDeviceLockEventWithSourceType:");
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling device lock event", v24, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController activeCall](self, "activeCall"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingCall"));

  if (a3 == 2)
  {
    if (v9 || -[PHAudioCallViewController isPickedRouteReceiver](self, "isPickedRouteReceiver"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController declineCallService](self, "declineCallService"));
      objc_msgSend(v10, "declineAnsweringCallDueToLockEventWithCurrentActiveCall:completionHandler:", v7, &stru_100287C10);
LABEL_23:

      goto LABEL_24;
    }
    goto LABEL_10;
  }
  if (!v9)
    goto LABEL_10;
  if ((objc_msgSend(v9, "shouldSuppressRingtone") & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentInCallScene"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "callAnalyticsLogger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueProxyIdentifierUUID"));
    objc_msgSend(v18, "ringerMutedForCallUUID:", v19);

    objc_msgSend(v9, "suppressRingtone");
    goto LABEL_18;
  }
  if ((objc_msgSend(v9, "shouldSuppressRingtone") & 1) == 0)
  {
LABEL_10:
    if (!v7 || !-[PHAudioCallViewController isPickedRouteReceiver](self, "isPickedRouteReceiver"))
      goto LABEL_18;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
  v12 = objc_msgSend(v11, "isLockToEndCallEnabled");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController declineCallService](self, "declineCallService"));
    objc_msgSend(v13, "declineAnsweringCallDueToLockEventWithCurrentActiveCall:completionHandler:", v7, &stru_100287C30);

  }
  else
  {
    v20 = sub_1000C5588();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "... and requesting lock on next dismiss because Lock-to-End is disabled through accessibility setting.", v24, 2u);
    }

    +[PHInCallRootViewController setShouldLockDeviceOnNextDismiss](PHInCallRootViewController, "setShouldLockDeviceOnNextDismiss");
  }
LABEL_18:
  if (a3 == 1 && -[PHAudioCallViewController videoStreamingIsGoingOn](self, "videoStreamingIsGoingOn"))
  {
    v22 = sub_1000C5588();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: pause video if necessary when locking device", v24, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    objc_msgSend(v10, "handleDeviceLockEvent");
    goto LABEL_23;
  }
LABEL_24:

}

- (BOOL)isPickedRouteReceiver
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pickedRoute"));
  v5 = objc_msgSend(v4, "isReceiver");

  return v5;
}

- (BOOL)isPickedRouteSpeaker
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pickedRoute"));
  v5 = objc_msgSend(v4, "isSpeaker");

  return v5;
}

- (void)setupAmbientAudioRoutesControlViewIfNeeded
{
  void *v3;
  unsigned int v4;
  PHAmbientAudioRoutesControlView *v5;
  void *v6;
  UIView *ambientAudioRoutesControlView;
  PHAmbientAudioRoutesControlView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  if (!self->_ambientAudioRoutesControlView)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v19, "callDisplayStyle") == (id)3)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v4 = objc_msgSend(v3, "isDominoEnabled");

      if (!v4)
        return;
      v5 = objc_alloc_init(PHAmbientAudioRoutesControlView);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
      -[PHAmbientAudioRoutesControlView setDelegate:](v5, "setDelegate:", v6);

      -[PHAmbientAudioRoutesControlView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      ambientAudioRoutesControlView = self->_ambientAudioRoutesControlView;
      self->_ambientAudioRoutesControlView = &v5->super;
      v8 = v5;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      objc_msgSend(v9, "addSubview:", self->_ambientAudioRoutesControlView);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_ambientAudioRoutesControlView, "topAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
      +[PHUIConfiguration ambientAudioRoutesInset](PHUIConfiguration, "ambientAudioRoutesInset");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12));
      objc_msgSend(v13, "setActive:", 1);

      v19 = (id)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_ambientAudioRoutesControlView, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
      +[PHUIConfiguration ambientAudioRoutesInset](PHUIConfiguration, "ambientAudioRoutesInset");
      v17 = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v15, -v17));
      objc_msgSend(v18, "setActive:", 1);

    }
  }
}

- (void)updateAmbientAudioRoutesVisibility
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[PHAudioCallViewController setupAmbientAudioRoutesControlViewIfNeeded](self, "setupAmbientAudioRoutesControlViewIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v3, "callDisplayStyle") != (id)3)
    goto LABEL_7;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if ((objc_msgSend(v4, "isDominoEnabled") & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  v5 = -[PHAudioCallViewController middleViewState](self, "middleViewState");

  if (v5 != 1)
  {
LABEL_8:
    v11 = 1;
LABEL_9:
    v12 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientAudioRoutesControlView](self, "ambientAudioRoutesControlView"));
    objc_msgSend(v12, "setHidden:", v11);
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientAudioRoutesControlView](self, "ambientAudioRoutesControlView"));
  v7 = objc_msgSend(v6, "isHidden");

  if (!v7)
  {
    v11 = 0;
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientAudioRoutesControlView](self, "ambientAudioRoutesControlView"));
  +[AmbientAnimationCoordinator show:completion:](_TtC13InCallService27AmbientAnimationCoordinator, "show:completion:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientAudioRoutesControlView](self, "ambientAudioRoutesControlView"));
  objc_msgSend(v9, "setHidden:", 0);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientAudioRoutesControlView](self, "ambientAudioRoutesControlView"));
  objc_msgSend(v12, "bringSubviewToFront:", v10);

LABEL_10:
}

- (void)setViewsHiddenForAudioRoutes:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != (id)1)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000E52E8;
    v11[3] = &unk_100284C98;
    v12 = a3;
    v11[4] = self;
    v9 = objc_retainBlock(v11);
    v10 = v9;
    if (v4)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.25);
    else
      ((void (*)(_QWORD *))v9[2])(v9);

  }
}

- (void)revealAudioRoutingDeviceListAnimatedIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeController"));

  v4 = objc_msgSend(v9, "areNonRelayAuxiliaryRoutesAvailable");
  v5 = v9;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pickedRoute"));
    v7 = v6;
    if (!v6
      || (v8 = (unint64_t)objc_msgSend(v6, "deviceType"), v8 > 0x1D)
      || ((1 << v8) & 0x24140002) == 0
      || (objc_msgSend(v7, "isPreferredAndActive") & 1) == 0)
    {
      -[PHAudioCallViewController revealAudioRoutingDeviceListAnimated:](self, "revealAudioRoutingDeviceListAnimated:", 1);
    }

    v5 = v9;
  }

}

- (void)revealAudioRoutingDeviceListAnimated:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  _BYTE v46[14];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Revealing audio routing device list", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
  if ((objc_msgSend(v6, "isViewLoaded") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      if (objc_msgSend(v10, "callDisplayStyle") == (id)3)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
        if ((objc_msgSend(v11, "isDominoEnabled") & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientAudioRoutesControlView](self, "ambientAudioRoutesControlView"));

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController ambientAudioRoutesControlView](self, "ambientAudioRoutesControlView"));
            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "button"));
            goto LABEL_16;
          }
LABEL_14:
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
          v23 = objc_opt_respondsToSelector(v22, "buttonForControlType:");

          if ((v23 & 1) == 0)
          {
            v16 = 0;
LABEL_18:
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject interactions](v16, "interactions", 0));
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            if (v25)
            {
              v27 = v25;
              v28 = *(_QWORD *)v41;
LABEL_20:
              v29 = 0;
              while (1)
              {
                if (*(_QWORD *)v41 != v28)
                  objc_enumerationMutation(v24);
                v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v29);
                objc_opt_class(UIContextMenuInteraction, v26);
                if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
                  break;
                if (v27 == (id)++v29)
                {
                  v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
                  if (v27)
                    goto LABEL_20;
                  goto LABEL_26;
                }
              }
              v17 = v30;

              if (!v17)
                goto LABEL_29;
              -[NSObject bounds](v16, "bounds");
              v33 = v32;
              -[NSObject bounds](v16, "bounds");
              v35 = v33 + v34 * 0.5;
              -[NSObject bounds](v16, "bounds");
              v37 = v36;
              -[NSObject bounds](v16, "bounds");
              -[NSObject _presentMenuAtLocation:](v17, "_presentMenuAtLocation:", v35, v37 + v38 * 0.5);
            }
            else
            {
LABEL_26:

LABEL_29:
              v39 = sub_1000C5588();
              v17 = objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v46 = v16;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find menu interaction for audio routes button: %@", buf, 0xCu);
              }
            }
            goto LABEL_31;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController currentMiddleView](self, "currentMiddleView"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "buttonForControlType:", 3));
LABEL_16:
          v16 = v14;

          goto LABEL_18;
        }

      }
      goto LABEL_14;
    }
  }
  else
  {

  }
  v15 = sub_1000C5588();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
    v18 = -[NSObject isViewLoaded](v17, "isViewLoaded");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v46 = v18;
    *(_WORD *)&v46[4] = 2112;
    *(_QWORD *)&v46[6] = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not presenting audio routing device list since isViewLoaded: %d; window: %@",
      buf,
      0x12u);

LABEL_31:
  }

}

- (id)audioRouteMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController routeListController](self, "routeListController"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioRoutingMenuController menuControllerWithCallStyle:dataSource:delegate:](PHAudioRoutingMenuController, "menuControllerWithCallStyle:dataSource:delegate:", 1, self, self));
    -[PHAudioCallViewController setRouteListController:](self, "setRouteListController:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController routeListController](self, "routeListController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "menu"));

  return v6;
}

- (id)routesForAudioRoutingMenuController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedRoutes"));

  return v5;
}

- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeController"));
  objc_msgSend(v7, "pickRoute:", v5);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v12, "isEnhancedEmergencyEnabled"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      v11 = objc_msgSend(v10, "eedRTTState");

      if (!v11)
        return;
      v12 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      objc_msgSend(v12, "updateRTTAudioRouteButton");
    }
  }

}

- (void)routesChangedForRouteController:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t v19[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController get notified audio routes changed", v19, 2u);
  }

  -[PHAudioCallViewController updateCurrentState](self, "updateCurrentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController routeListController](self, "routeListController"));
  objc_msgSend(v7, "reload");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentInCallScene"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "callAnalyticsLogger"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pickedRoute"));

  objc_msgSend(v12, "audioRouteIsHandsfree:", objc_msgSend(v13, "isReceiver") ^ 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  if (objc_msgSend(v14, "isEnhancedEmergencyEnabled"))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    if (v15)
    {
      v16 = (void *)v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      v18 = objc_msgSend(v17, "eedRTTState");

      if (!v18)
        return;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      objc_msgSend(v14, "updateRTTAudioRouteButton");
    }
  }

}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  void (**v12)(void);
  void *v13;
  void *v14;
  unsigned int v15;
  double v16;
  dispatch_time_t v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char HasChinaSKU;
  void *v30;
  char *v31;
  void *v32;
  BOOL IsReduceMotionEnabled;
  void *v34;
  _QWORD block[4];
  id v36;
  id buf[2];
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PHAudioCallViewController;
  -[PHCallViewController callDisplayStyleDidChangeFromStyle:toStyle:](&v38, "callDisplayStyleDidChangeFromStyle:toStyle:");
  if (a4 == 4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v8 = objc_msgSend(v7, "hasCurrentCalls");

    if ((v8 & 1) == 0)
    {
      v9 = sub_1000C5588();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController was dismissed with no current calls", (uint8_t *)buf, 2u);
      }

      +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHFailureAlertShowingAssertionReason"));
      -[PHAudioCallViewController setCurrentState:](self, "setCurrentState:", 0);
    }
  }
  if (!a3)
  {
    -[PHAudioCallViewController resetParticipantsViewConstraints](self, "resetParticipantsViewConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController pendingMiddleViewAnimations](self, "pendingMiddleViewAnimations"));

    if (v11)
    {
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController pendingMiddleViewAnimations](self, "pendingMiddleViewAnimations"));
      v12[2]();

      -[PHAudioCallViewController setPendingMiddleViewAnimations:](self, "setPendingMiddleViewAnimations:", 0);
    }
    if (-[PHAudioCallViewController waitingForFullScreenAudioRoutes](self, "waitingForFullScreenAudioRoutes"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routeController"));
      v15 = objc_msgSend(v14, "areAuxiliaryRoutesAvailable");

      if (v15)
      {
        objc_initWeak(buf, self);
        +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
        v17 = dispatch_time(0, (uint64_t)(v16 * *(double *)""));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000E6044;
        block[3] = &unk_100285F88;
        objc_copyWeak(&v36, buf);
        dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v36);
        objc_destroyWeak(buf);
      }
    }
    -[PHAudioCallViewController setWaitingForFullScreenAudioRoutes:](self, "setWaitingForFullScreenAudioRoutes:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v19 = objc_msgSend(v18, "isButtonLayoutEnabled");

    if ((v19 & 1) == 0)
      -[PHAudioCallViewController fadeInBottomBar](self, "fadeInBottomBar");
    -[PHAudioCallViewController updateBottomBarAlphaWithCurrentState:](self, "updateBottomBarAlphaWithCurrentState:", -[PHCallViewController currentState](self, "currentState"));
    if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
      goto LABEL_17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v20, "callDisplayStyle") != (id)3)
    {
LABEL_18:

      goto LABEL_19;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v22 = objc_msgSend(v21, "isDominoEnabled");

    if (v22)
    {
LABEL_17:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
      -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v20, 0, 1);
      -[PHAudioCallViewController updateCallParticipantsViewControllerCallGroups](self, "updateCallParticipantsViewControllerCallGroups");
      goto LABEL_18;
    }
  }
LABEL_19:
  if (a3 == 1 || a4 != 1)
  {
    if (a3 == 2 && a4 == 4)
    {
      if (-[PHAudioCallViewController videoStreamingIsGoingOn](self, "videoStreamingIsGoingOn"))
        -[PHAudioCallViewController audioCallControlsViewControllerDidTapVideoStreamingButton](self, "audioCallControlsViewControllerDidTapVideoStreamingButton");
      goto LABEL_31;
    }
  }
  else
  {
    v23 = sub_1000C5588();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController handling lock event due to mini window attached", (uint8_t *)buf, 2u);
    }

    -[PHAudioCallViewController handleDeviceLockEventWithSourceType:](self, "handleDeviceLockEventWithSourceType:", 1);
  }
  if (a3 != 4)
  {
    if (a4 != 4)
      goto LABEL_40;
LABEL_31:
    -[PHAudioCallViewController handleViewWillDisappear:](self, "handleViewWillDisappear:", 1);
    -[PHAudioCallViewController handleViewDidDisappear:](self, "handleViewDidDisappear:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "incomingCall"));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "provider"));
      if (objc_msgSend(v27, "supportsDynamicSystemUI"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](self, "featureFlags"));
        if ((objc_msgSend(v28, "groupConversations") & 1) != 0)
        {
          HasChinaSKU = TUDeviceHasChinaSKU();

          if ((HasChinaSKU & 1) != 0)
            goto LABEL_39;
          goto LABEL_38;
        }

      }
    }
LABEL_38:
    -[PHAudioCallViewController suppressRingtoneForIncomingCall](self, "suppressRingtoneForIncomingCall");
LABEL_39:

    goto LABEL_40;
  }
  -[PHAudioCallViewController handleViewWillAppear:](self, "handleViewWillAppear:", 1);
  -[PHAudioCallViewController handleViewDidAppear:](self, "handleViewDidAppear:", 1);
LABEL_40:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v31 = (char *)objc_msgSend(v30, "orientation");

  if (a3 || a4 != 2 || (unint64_t)(v31 - 3) > 1)
  {
    if (!UIAccessibilityIsReduceMotionEnabled())
      goto LABEL_50;
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v32, "userInterfaceIdiom"))
    {
      IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

      if (!IsReduceMotionEnabled)
        goto LABEL_50;
    }
    else
    {

    }
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
  +[ICSBannerTransitionAnimation performBannerToFullScreenCrossFadeAnimationWithView:](ICSBannerTransitionAnimation, "performBannerToFullScreenCrossFadeAnimationWithView:", v34);

LABEL_50:
  -[PHAudioCallViewController showCallDetailsIfNecessary](self, "showCallDetailsIfNecessary");
  -[PHAudioCallViewController refreshCallDetailsViewButton](self, "refreshCallDetailsViewButton");
  -[PHAudioCallViewController setupAmbientAudioRoutesControlViewIfNeeded](self, "setupAmbientAudioRoutesControlViewIfNeeded");
  -[PHAudioCallViewController updateShareNameAndPhotoHUDPresentationIfNeeded](self, "updateShareNameAndPhotoHUDPresentationIfNeeded");
  -[PHAudioCallViewController updateCallRecordingIfNeeded](self, "updateCallRecordingIfNeeded");
}

- (void)suppressRingtoneForIncomingCall
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callCenter](self, "callCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "incomingCall"));

  v3 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, "shouldSuppressRingtone");
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "suppressRingtone");
      v3 = v5;
    }
  }

}

- (void)showCallDetailsIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsCoordinator](self, "callDetailsCoordinator"));
  if (v3)
  {
    v9 = (id)v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bannerPresentationManager"));
    if (!objc_msgSend(v6, "shouldShowCallDetailsWhenReady"))
    {

      goto LABEL_7;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v8 = objc_msgSend(v7, "callDisplayStyle");

    if (v8 == (id)2)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsCoordinator](self, "callDetailsCoordinator"));
      objc_msgSend(v9, "startWithReason:", CFSTR("Controls manager requested deferred call details presentation"));
LABEL_7:

    }
  }
}

- (void)fadeInBottomBar
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000E6230;
  v2[3] = &unk_100284898;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.5);
}

- (void)setMiddleViewButtonsIfNecessary
{
  _QWORD v3[4];
  id v4;
  id location;

  if (-[PHCallViewController currentState](self, "currentState") == 4
    || -[PHCallViewController currentState](self, "currentState") == 5)
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000E6330;
    v3[3] = &unk_100284F60;
    objc_copyWeak(&v4, &location);
    -[PHAudioCallViewController setMiddleViewState:animated:completion:](self, "setMiddleViewState:animated:completion:", 1, 1, v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)callParticipantsViewController:(id)a3 didPerformActionType:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  int64_t v11;
  __int16 v12;
  id v13;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));

  if (v7 == v6)
  {
    -[PHAudioCallViewController performBottomBarActionType:](self, "performBottomBarActionType:", a4);
  }
  else
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = a4;
      v12 = 2112;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot perform bottom bar action %ld from unknown call participants viewcontroller object %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)callParticipantsViewControllerDidTapCallDetailsGestureRecognizer:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));

  if (v5 == v4)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDetailsCoordinator](self, "callDetailsCoordinator"));
    -[NSObject startWithReason:](v7, "startWithReason:", CFSTR("Call participant view requested call details"));
  }
  else
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot handle call details disclosure button tap from unknown call participants viewcontroller object %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)callParticipantsViewController:(id)a3 willShowMultipleLabel:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));

  if (v7 == v6)
  {
    self->_participantsViewIsShowingMultipleLabel = a4 & ~-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI");
    -[PHAudioCallViewController _updatePosterNameAlpha](self, "_updatePosterNameAlpha");
    -[PHAudioCallViewController _updateStatusLabelVisibility](self, "_updateStatusLabelVisibility");
    v11 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_WaitingOrNot](self, "getParticipantsView_WaitingOrNot"));
    -[PHAudioCallViewController updateParticipantConstraintsForPosterName:](self, "updateParticipantConstraintsForPosterName:");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v8, "callDisplayStyle") == (id)3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v10 = objc_msgSend(v9, "isDominoEnabled");

      if (!v10)
      {
LABEL_6:

        return;
      }
      -[PHAudioCallViewController layoutParticipantsViewAnimated:](self, "layoutParticipantsViewAnimated:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
      -[PHAudioCallViewController setCallForBackgroundImage:animated:callDisplayStyleChanged:](self, "setCallForBackgroundImage:animated:callDisplayStyleChanged:", v8, 1, 0);
    }

    goto LABEL_6;
  }
}

- (void)callParticipantsViewController:(id)a3 didShowMultipleLabel:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v8, "callDisplayStyle") == (id)3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
      v10 = objc_msgSend(v9, "isDominoEnabled");

      if ((v10 & 1) != 0 || a4)
        return;
    }
    else
    {

      if (a4)
        return;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController posterNameViewModel](self, "posterNameViewModel"));

    if (v11)
      -[PHAudioCallViewController _updateStatusLabelVisibility](self, "_updateStatusLabelVisibility");
  }
}

- (BOOL)callParticipantsViewControllerShouldShowLargeAvatar:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));

  if (v5 == v4)
  {
    v8 = -[PHAudioCallViewController shouldShowLargeAvatar](self, "shouldShowLargeAvatar");
LABEL_6:
    v7 = v8;
    goto LABEL_7;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callWaitingParticipantsViewController](self, "callWaitingParticipantsViewController"));

  if (v6 == v4)
  {
    v8 = -[PHAudioCallViewController shouldShowLargeAvatarForCallWaiting](self, "shouldShowLargeAvatarForCallWaiting");
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)shouldRenderAlertTextColor
{
  id v3;
  NSObject *v4;
  _DWORD v6[2];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[PHCallViewController currentState](self, "currentState") == 8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController shouldRenderAlertTextColor = %d", (uint8_t *)v6, 8u);
  }

  return -[PHCallViewController currentState](self, "currentState") == 8;
}

- (BOOL)shouldRenderAlertTextFont
{
  id v3;
  NSObject *v4;
  _DWORD v6[2];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[PHCallViewController currentState](self, "currentState") == 8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController shouldRenderAlertTextFont = %d", (uint8_t *)v6, 8u);
  }

  return -[PHCallViewController currentState](self, "currentState") == 8;
}

- (BOOL)shouldShowLargeAvatarForCall:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;
  double v12;

  v4 = a3;
  if (-[PHAudioCallViewController callStateCanShowNewPoster:](self, "callStateCanShowNewPoster:", v4)
    || !-[PHAudioCallViewController prefersShowingCachedLastSeenPosterBeforeCallConnected:](self, "prefersShowingCachedLastSeenPosterBeforeCallConnected:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactWallpaperForCall:](self, "contactWallpaperForCall:", v4));
    v6 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTypeForCNWallpaper:](self, "wallpaperTypeForCNWallpaper:", v5));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController lastSeenPosterIMWallpaperMetadataForCall:](self, "lastSeenPosterIMWallpaperMetadataForCall:", v4));
    v6 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTypeForIMWallpaperMetadata:](self, "wallpaperTypeForIMWallpaperMetadata:", v5));
  }
  v7 = (void *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v8, "callDisplayStyle") != (id)3)
  {
    v11 = 0;
    goto LABEL_11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v10 = objc_msgSend(v9, "isDominoEnabled");

  if (!v10)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v11 = 1;
  if (v7 != (void *)CNWallpaperTypeMemoji && v7 != (void *)CNWallpaperTypeMonogram)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactImageForCall:](self, "contactImageForCall:", v4));
    objc_msgSend(v8, "size");
    v11 = v12 > 300.0;
LABEL_11:

  }
LABEL_13:

  return v11;
}

- (void)updateShouldShowLargeAvatar
{
  void *v3;
  unsigned int v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v11, "callDisplayStyle") != (id)3)
  {
LABEL_12:

    return;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v4 = objc_msgSend(v3, "isDominoEnabled");

  if (v4)
  {
    if (-[PHAudioCallViewController participantsViewIsShowingMultipleLabel](self, "participantsViewIsShowingMultipleLabel")|| -[PHAudioCallViewController middleViewState](self, "middleViewState") == 4)
    {
      -[PHAudioCallViewController setShouldShowLargeAvatar:](self, "setShouldShowLargeAvatar:", 0);
      return;
    }
    if (-[PHAudioCallViewController usesCompactMulticallUI](self, "usesCompactMulticallUI")
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall")),
          v5,
          v5))
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController prioritizedCall](self, "prioritizedCall"));
      v6 = -[PHAudioCallViewController shouldShowLargeAvatarForCall:](self, "shouldShowLargeAvatarForCall:", v11);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callParticipantsViewController](self, "callParticipantsViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentCallGroups"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calls"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

      v6 = -[PHAudioCallViewController shouldShowLargeAvatarForCall:](self, "shouldShowLargeAvatarForCall:", v11);
    }
    -[PHAudioCallViewController setShouldShowLargeAvatar:](self, "setShouldShowLargeAvatar:", v6);
    goto LABEL_12;
  }
}

- (id)customColorForStatusLabelWithCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  if (-[PHAudioCallViewController shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
    goto LABEL_2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v5, "callDisplayStyle") != (id)3)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v8 = objc_msgSend(v7, "isDominoEnabled");

  if (v8)
  {
LABEL_2:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTitleStyleAttributesForCall:](self, "wallpaperTitleStyleAttributesForCall:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleColor"));
LABEL_7:

    goto LABEL_8;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (id)customColorForParticipantLabelWithCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v5, "callDisplayStyle") == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v7 = objc_msgSend(v6, "isDominoEnabled");

    if (!v7)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTitleStyleAttributesForCall:](self, "wallpaperTitleStyleAttributesForCall:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleColor"));
  }
  else
  {
    v8 = 0;
  }

LABEL_7:
  return v8;
}

- (id)customFontForParticipantLabelWithCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v5, "callDisplayStyle") == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
    v7 = objc_msgSend(v6, "isDominoEnabled");

    if (!v7)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController wallpaperTitleStyleAttributesForCall:](self, "wallpaperTitleStyleAttributesForCall:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleFont"));
  }
  else
  {
    v8 = 0;
  }

LABEL_7:
  return v8;
}

- (void)setParticipantsViewShouldShowParticipantLabel:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  if (self->_participantsViewShouldShowParticipantLabel != a3)
  {
    v3 = a3;
    self->_participantsViewShouldShowParticipantLabel = a3;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController getParticipantsView_NotWaiting](self, "getParticipantsView_NotWaiting"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "singleCallLabelView"));
    v5 = (double)v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "participantMarqueeLabel"));
    objc_msgSend(v6, "setAlpha:", v5);

  }
}

- (void)startSuppressionOfSTKAlerts
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting Suppression of STK Alerts", v4, 2u);
  }

  if (!byte_1002DCC4C && !notify_register_check("MPInCallAlertStateChangeNotification", &dword_1002DCC48))
  {
    byte_1002DCC4C = 1;
    if (!notify_set_state(dword_1002DCC48, 1uLL))
      notify_post("MPInCallAlertStateChangeNotification");
  }
}

- (void)stopSuppressionOfSTKAlerts
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping Suppression of STK Alerts", v4, 2u);
  }

  if (byte_1002DCC4C)
  {
    notify_set_state(dword_1002DCC48, 0);
    notify_post("MPInCallAlertStateChangeNotification");
    notify_cancel(dword_1002DCC48);
    byte_1002DCC4C = 0;
  }
}

- (BOOL)shouldShowEnableWiFiCallingAlertForCall:(id)a3
{
  id v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isEmergency") & 1) == 0
    && objc_msgSend(v3, "disconnectedReason") == 14
    && objc_msgSend(v3, "service") == 1
    && sub_100086C7C();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localSenderIdentityUUID"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCapabilities senderIdentityCapabilitiesWithUUID:](TUCallCapabilities, "senderIdentityCapabilitiesWithUUID:", v5));
    v7 = v6;
    if (v6)
      LOBYTE(v8) = 0;
    else
      LOBYTE(v8) = v4;
    if (v6 && v4)
      v8 = objc_msgSend(v6, "isWiFiCallingEnabled") ^ 1;

    LOBYTE(v4) = v8;
  }

  return v4;
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  AVSpeechSynthesizer *speechSynthesizer;
  AVSpeechSynthesizer *v4;
  AVSpeechSynthesizer *v5;

  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    v4 = (AVSpeechSynthesizer *)objc_alloc_init((Class)AVSpeechSynthesizer);
    v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    speechSynthesizer = self->_speechSynthesizer;
  }
  return speechSynthesizer;
}

- (void)alertWillInvoke
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PHAlertDisconnectingCallsNotification"), 0);

}

- (void)updatePresentationStateWithAllowed:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  v3 = a3;
  if (-[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton") != a3)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController is about to set shouldPresentAlertButton to %d", (uint8_t *)v7, 8u);
    }

    -[PHAudioCallViewController setShouldPresentAlertButton:](self, "setShouldPresentAlertButton:", v3);
    -[PHAudioCallViewController updateCurrentState](self, "updateCurrentState");
    -[PHAudioCallViewController triggerAutoCountdownIfAvailable](self, "triggerAutoCountdownIfAvailable");
  }
}

- (void)startAutoCountdownAlert
{
  -[PHAudioCallViewController setShouldAutoCountdownAlert:](self, "setShouldAutoCountdownAlert:", 1);
  -[PHAudioCallViewController triggerAutoCountdownIfAvailable](self, "triggerAutoCountdownIfAvailable");
}

- (void)triggerAutoCountdownIfAvailable
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id location;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;

  if (-[PHAudioCallViewController shouldAutoCountdownAlert](self, "shouldAutoCountdownAlert")
    && (-[PHCallViewController currentState](self, "currentState") == 9
     || -[PHCallViewController currentState](self, "currentState") == 8))
  {
    if (-[PHAudioCallViewController didTriggerAutoCountdownAlertBefore](self, "didTriggerAutoCountdownAlertBefore"))
    {
      v3 = sub_1000C5588();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Not triggering auto-countdown alert since we already triggered once before", buf, 2u);
      }

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController alertCountDownTimer](self, "alertCountDownTimer"));

      if (!v5)
      {
        v6 = sub_1000C5588();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting auto-countdown for alert", buf, 2u);
        }

        -[PHAudioCallViewController setDidTriggerAutoCountdownAlertBefore:](self, "setDidTriggerAutoCountdownAlertBefore:", 1);
        *(_QWORD *)buf = 0;
        v25 = buf;
        v26 = 0x2020000000;
        v27 = 0;
        +[AlertCoordinator countdownDuration](_TtC13InCallService16AlertCoordinator, "countdownDuration");
        v27 = v8;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "alertCoordinator"));
        v12 = objc_msgSend(v11, "isBackgroundCountdownRunning");

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "alertCoordinator"));
          objc_msgSend(v15, "currentBackgroundCountdownDuration");
          *((_QWORD *)v25 + 3) = v16;

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "alertCoordinator"));
          objc_msgSend(v19, "stopBackgroundCountdown");

        }
        objc_initWeak(&location, self);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000E755C;
        v21[3] = &unk_100285650;
        objc_copyWeak(&v22, &location);
        v21[4] = buf;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v21, 1.0));
        -[PHAudioCallViewController setAlertCountDownTimer:](self, "setAlertCountDownTimer:", v20);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
        _Block_object_dispose(buf, 8);
      }
    }
  }
}

- (void)speakAlertUtteranceIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  if (-[PHAudioCallViewController shouldPresentAlertButton](self, "shouldPresentAlertButton"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController frontmostCall](self, "frontmostCall"));
    if (objc_msgSend(v3, "originatingUIType") == 11
      && !-[PHAudioCallViewController didRequestToSpeakAlertUtterance](self, "didRequestToSpeakAlertUtterance"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      if (v4)
        v7 = CFSTR("ALERT_ACTION_TEXT_BUTTON_UTTERANCE_CARPLAY");
      else
        v7 = CFSTR("ALERT_ACTION_TEXT_BUTTON_UTTERANCE");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10028DC20, CFSTR("Localizable-Stewie")));

      v9 = sub_1000C5588();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting to speak alert utterance: %@", (uint8_t *)&v15, 0xCu);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController speechSynthesizer](self, "speechSynthesizer"));
      objc_msgSend(v12, "setUsesApplicationAudioSession:", v11 != 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[AVSpeechUtterance speechUtteranceWithString:](AVSpeechUtterance, "speechUtteranceWithString:", v8));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController speechSynthesizer](self, "speechSynthesizer"));
      objc_msgSend(v14, "speakUtterance:", v13);

      -[PHAudioCallViewController setDidRequestToSpeakAlertUtterance:](self, "setDidRequestToSpeakAlertUtterance:", 1);
    }

  }
}

- (BOOL)isReadyToShowCallDetails
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle") == (id)2;

  return v3;
}

- (void)audioDeviceControllerMutedTalkerDidStart:(id)a3
{
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (-[PHAudioCallViewController audioCallMutedTalkerIsSupported](self, "audioCallMutedTalkerIsSupported", a3))
  {
    v4 = -[PHAudioCallViewController didNotifyMutedCaller](self, "didNotifyMutedCaller");
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if ((v4 & 1) != 0)
    {
      if (v7)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: received audioDeviceControllerMutedTalkerDidStart callback, but banner was presented before, skips updating", v9, 2u);
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController: received audioDeviceControllerMutedTalkerDidStart callback, presenting banner", buf, 2u);
      }

      -[PHAudioCallViewController setDidNotifyMutedCaller:](self, "setDidNotifyMutedCaller:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController mutedTalkerBannerViewController](self, "mutedTalkerBannerViewController"));
      objc_msgSend(v8, "showBanner");

      v6 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController mutedTalkerBannerViewController](self, "mutedTalkerBannerViewController"));
      -[NSObject playBannerSound](v6, "playBannerSound");
    }

  }
}

- (void)bannerDidGetTap
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (-[PHAudioCallViewController audioCallMutedTalkerIsSupported](self, "audioCallMutedTalkerIsSupported"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController buttonsViewController](self, "buttonsViewController"));
    objc_msgSend(v3, "handleMutedTalkerBannerTap");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v5 = objc_msgSend(v4, "callDisplayStyle");

    if (v5 == (id)2)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController mutedTalkerBannerViewController](self, "mutedTalkerBannerViewController"));
      objc_msgSend(v6, "dismissBanner");

    }
  }
}

- (BOOL)audioCallMutedTalkerIsSupported
{
  return 0;
}

- (void)contactDidChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int isKindOfClass;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  _BYTE v36[10];
  void *v37;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wallpaper"));
    v35 = 138412546;
    *(_QWORD *)v36 = v4;
    *(_WORD *)&v36[8] = 2112;
    v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "contactDidChange: %@ wallpaper: %@", (uint8_t *)&v35, 0x16u);

  }
  if (-[PHAudioCallViewController shouldUpdateBackgroundForEmergencyCall](self, "shouldUpdateBackgroundForEmergencyCall"))
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "we are in emergency call, ignore contact change", (uint8_t *)&v35, 2u);
    }

    -[PHAudioCallViewController updateViewForEmergencyCallIfNecessary](self, "updateViewForEmergencyCallIfNecessary");
    goto LABEL_25;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
  v15 = objc_msgSend(v14, "isShowingIncomingNameUpdate");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController presentedViewController](self, "presentedViewController"));
  objc_opt_class(UINavigationController, v17);
  if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topViewController"));
    if (v20)
    {
      objc_opt_class(CNContactViewController, v19);
      isKindOfClass = objc_opt_isKindOfClass(v20, v21);
    }
    else
    {
      isKindOfClass = 0;
    }

    if (!v12)
      goto LABEL_22;
  }
  else
  {
    isKindOfClass = 0;
    v20 = v16;
    if (!v12)
      goto LABEL_22;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactsCache](self, "contactsCache"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  objc_msgSend(v23, "setObject:forKey:", v4, v24);

  if (((v15 | isKindOfClass) & 1) != 0)
  {
    v25 = sub_1000C5588();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 67109376;
      *(_DWORD *)v36 = v15;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = isKindOfClass & 1;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SNAP: going to render poster again since contact did change, isBannerPresented = %d, isContactCardPresented = %d", (uint8_t *)&v35, 0xEu);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController configurationCache](self, "configurationCache"));
    objc_msgSend(v27, "removeAllObjects");

    -[PHAudioCallViewController updateLayeredBackgroundWallpaper](self, "updateLayeredBackgroundWallpaper");
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v28, "callDisplayStyle") != (id)3)
    goto LABEL_21;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController features](self, "features"));
  v30 = objc_msgSend(v29, "isDominoEnabled");

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callToUseForWallpaper](self, "callToUseForWallpaper"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController contactImageDataForCall:](self, "contactImageDataForCall:", v31));

    v32 = objc_msgSend(objc_alloc((Class)UIImage), "initWithData:", v28);
    -[PHAudioCallViewController setBackgroundImage:](self, "setBackgroundImage:", v32);

LABEL_21:
  }
LABEL_22:
  if (v15)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "delegate"));
    objc_msgSend(v34, "setIsShowingIncomingNameUpdate:", 0);

  }
LABEL_25:

}

- (void)presentDisconnectionAlert:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v6 = objc_msgSend(v5, "isEnhancedEmergencyEnabled");

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController emergencyCoordinator](self, "emergencyCoordinator"));
      v10 = objc_msgSend(v9, "videoStreamingIsOnScreen");

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("STOP_SHARING_LIVE_VIDEO_TITLE"), &stru_10028DC20, CFSTR("InCallService")));
        objc_msgSend(v4, "setTitle:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("STOP_SHARING_LIVE_VIDEO_SUBTITLE"), &stru_10028DC20, CFSTR("InCallService")));
        objc_msgSend(v4, "setMessage:", v14);

        objc_initWeak(&location, self);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("STOP_SHARING_CAMERA"), &stru_10028DC20, CFSTR("InCallService")));
        v18 = _NSConcreteStackBlock;
        v19 = 3221225472;
        v20 = sub_1000E8008;
        v21 = &unk_1002872C8;
        objc_copyWeak(&v22, &location);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, &v18));
        objc_msgSend(v4, "addAction:", v17, v18, v19, v20, v21);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
    }
    -[PHAudioCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  }

}

- (BOOL)isShowSOSConfirmationSupported
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle") == (id)2;

  return v3;
}

- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController featureFlags](self, "featureFlags", a3));
  v7 = objc_msgSend(v6, "screenSharingRemoteControlEnabled");

  v8 = sub_1000C5668();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = CFSTR("NO");
      if (v4)
        v10 = CFSTR("YES");
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating layer mask for remote control, remote control state is %@", (uint8_t *)&v11, 0xCu);
    }
    -[PHAudioCallViewController updateScreenSharingDisableUpdateMask](self, "updateScreenSharingDisableUpdateMask");
  }
  else if (v9)
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not updating layer mask for remote control, screen sharing remote control feature flag is disabled", (uint8_t *)&v11, 2u);
  }
}

- (void)handleCancelPressedInCallBufferScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[5];
  _QWORD v20[6];

  -[PHAudioCallViewController pauseCallBufferTimer](self, "pauseCallBufferTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("InCallService")));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000E83E4;
  v20[3] = &unk_100286098;
  v20[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v5, 1, v20));
  objc_msgSend(v3, "addAction:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("END_CALL_SOS"), &stru_10028DC20, CFSTR("InCallService")));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000E8450;
  v19[3] = &unk_100286098;
  v19[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 2, v19));
  objc_msgSend(v3, "addAction:", v9);

  -[PHAudioCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000E85CC;
  v15 = &unk_1002860C0;
  v10 = v3;
  v16 = v10;
  objc_copyWeak(&v17, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v12, 5.0));
  -[PHAudioCallViewController setConfirmationTimeoutTimer:](self, "setConfirmationTimeoutTimer:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (BOOL)shouldPlayAudioInCallBufferScreen
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("PHSliderSwipeCallBufferScreenAssertionReason"));

  return v3 ^ 1;
}

- (void)startMessagePlayback
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  -[PHAudioCallViewController stopMessagePlayback](self, "stopMessagePlayback");
  if (+[SOSUtilities shouldPlayAudioDuringCountdown](SOSUtilities, "shouldPlayAudioDuringCountdown"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceMessageManager](self, "voiceMessageManager"));
    if (v3)
    {

    }
    else if (-[PHAudioCallViewController shouldPlayAudioInCallBufferScreen](self, "shouldPlayAudioInCallBufferScreen"))
    {
      v4 = objc_msgSend(objc_alloc((Class)SOSVoiceMessageManager), "initWithMessageType:", 101);
      -[PHAudioCallViewController setVoiceMessageManager:](self, "setVoiceMessageManager:", v4);

      v5 = sub_1000C5588();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "startMessagePlayback,starting call buffer voice message", v8, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceMessageManager](self, "voiceMessageManager"));
      objc_msgSend(v7, "startMessagePlayback");

    }
  }
}

- (void)stopMessagePlayback
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceMessageManager](self, "voiceMessageManager"));

  if (v3)
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stopMessagePlayback", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController voiceMessageManager](self, "voiceMessageManager"));
    objc_msgSend(v6, "stopMessagePlayback");

    -[PHAudioCallViewController setVoiceMessageManager:](self, "setVoiceMessageManager:", 0);
  }
}

- (void)startCallBufferScreenCountdown
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[4];
  id location;

  -[PHAudioCallViewController stopCallBufferTimer](self, "stopCallBufferTimer");
  -[PHAudioCallViewController startMessagePlayback](self, "startMessagePlayback");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callBufferTimer](self, "callBufferTimer"));

  if (!v3)
  {
    objc_initWeak(&location, self);
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 5;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000E89A4;
    v5[3] = &unk_100285650;
    objc_copyWeak(&v6, &location);
    v5[4] = v7;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v5, 1.0));
    -[PHAudioCallViewController setCallBufferTimer:](self, "setCallBufferTimer:", v4);

    objc_destroyWeak(&v6);
    _Block_object_dispose(v7, 8);
    objc_destroyWeak(&location);
  }
}

- (void)stopCallBufferTimer
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callBufferTimer](self, "callBufferTimer"));
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHAudioCallViewController,stopCallBufferTimer", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callBufferTimer](self, "callBufferTimer"));
    objc_msgSend(v7, "invalidate");

    -[PHAudioCallViewController setCallBufferTimer:](self, "setCallBufferTimer:", 0);
  }
}

- (void)pauseCallBufferTimer
{
  -[PHAudioCallViewController setShouldPauseSOSCallBufferTimer:](self, "setShouldPauseSOSCallBufferTimer:", 1);
}

- (void)resumeCallBufferTimer
{
  -[PHAudioCallViewController setShouldPauseSOSCallBufferTimer:](self, "setShouldPauseSOSCallBufferTimer:", 0);
}

- (void)restartCallBufferTimer
{
  -[PHAudioCallViewController setShouldPauseSOSCallBufferTimer:](self, "setShouldPauseSOSCallBufferTimer:", 0);
  -[PHAudioCallViewController startCallBufferScreenCountdown](self, "startCallBufferScreenCountdown");
}

- (void)displayDialledNumberDetailsForCallBufferScreen
{
  PHSingleCallParticipantLabelView *v3;
  void *v4;
  PHSingleCallParticipantLabelView *v5;
  PHSingleCallParticipantLabelView *bufferSingleCallLabelView;
  id v7;
  NSObject *v8;
  PHSingleCallParticipantLabelView *v9;
  void *v10;
  PHSingleCallParticipantLabelView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PHSingleCallParticipantLabelView *v16;
  void *v17;
  CNKCallParticipantLabelDescriptorFactory *labelDescriptorFactory;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  uint8_t buf[4];
  PHSingleCallParticipantLabelView *v45;

  if (!self->_bufferSingleCallLabelView)
  {
    v3 = [PHSingleCallParticipantLabelView alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v5 = -[PHSingleCallParticipantLabelView initWithCallDisplayStyleManager:](v3, "initWithCallDisplayStyleManager:", v4);
    bufferSingleCallLabelView = self->_bufferSingleCallLabelView;
    self->_bufferSingleCallLabelView = v5;

    -[PHSingleCallParticipantLabelView setPreservesSuperviewLayoutMargins:](self->_bufferSingleCallLabelView, "setPreservesSuperviewLayoutMargins:", 1);
    -[PHSingleCallParticipantLabelView setTranslatesAutoresizingMaskIntoConstraints:](self->_bufferSingleCallLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHSingleCallParticipantLabelView setOverrideUserInterfaceStyle:](self->_bufferSingleCallLabelView, "setOverrideUserInterfaceStyle:", 2);
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_bufferSingleCallLabelView;
      *(_DWORD *)buf = 138412290;
      v45 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding a new single-participant view to the view hierarchy: %@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    objc_msgSend(v10, "addSubview:", self->_bufferSingleCallLabelView);

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", UIFontTextStyleLargeTitle));
    v11 = self->_bufferSingleCallLabelView;
    objc_msgSend(v42, "pointSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    -[PHSingleCallParticipantLabelView setParticipantMarqueeLabelFont:](v11, "setParticipantMarqueeLabelFont:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SOS_CALL_BUFFER_TITLE"), &stru_10028DC20, CFSTR("InCallService")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self->_bufferSingleCallLabelView, "participantMarqueeLabel"));
    objc_msgSend(v15, "setText:", v14);

    v16 = self->_bufferSingleCallLabelView;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[PHSingleCallParticipantLabelView setStatusLabelTextColor:](v16, "setStatusLabelTextColor:", v17);

    labelDescriptorFactory = self->_labelDescriptorFactory;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SOS_CALL_BUFFER_SUBTITLE"), &stru_10028DC20, CFSTR("InCallService")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CNKCallParticipantLabelDescriptorFactory makeLabelWithString:](labelDescriptorFactory, "makeLabelWithString:", v20));

    -[PHSingleCallParticipantLabelView setLabelDescriptor:](self->_bufferSingleCallLabelView, "setLabelDescriptor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView topAnchor](self->_bufferSingleCallLabelView, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
    +[TPIncomingCallMetricsProvider sixPercentOfDeviceHeight](TPIncomingCallMetricsProvider, "sixPercentOfDeviceHeight");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v25));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerXAnchor](self->_bufferSingleCallLabelView, "centerXAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerXAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView leadingAnchor](self->_bufferSingleCallLabelView, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "readableContentGuide"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v34));

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingAnchor](self->_bufferSingleCallLabelView, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallViewController view](self, "view"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "readableContentGuide"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v39));

    v43[0] = v26;
    v43[1] = v30;
    v43[2] = v35;
    v43[3] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

  }
}

+ (BOOL)wallpaperContentIsSensitive:(id)a3
{
  id v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  id v7;
  _DWORD v9[2];

  v3 = a3;
  if (+[SensitivityFeatureFlags isContactNudityDetectionEnabled](_TtC13InCallService23SensitivityFeatureFlags, "isContactNudityDetectionEnabled"))
  {
    v4 = objc_msgSend(v3, "contentIsSensitive");
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SNAP: IMWallpaper.contentIsSensitive returning %d", (uint8_t *)v9, 8u);
    }
  }
  else
  {
    v7 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SNAP: IMWallpaper.contentIsSensitive not performing check", (uint8_t *)v9, 2u);
    }
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (IMNicknameProvider)imNicknameProvider
{
  IMNicknameProvider *imNicknameProvider;
  IMNicknameProvider *v4;
  IMNicknameProvider *v5;

  imNicknameProvider = self->_imNicknameProvider;
  if (!imNicknameProvider)
  {
    v4 = (IMNicknameProvider *)objc_alloc_init((Class)IMNicknameProvider);
    v5 = self->_imNicknameProvider;
    self->_imNicknameProvider = v4;

    imNicknameProvider = self->_imNicknameProvider;
  }
  return imNicknameProvider;
}

- (void)addPosterBlurToPosterVC:(id)a3 nameLabelWrapper:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  id v8;
  NSObject *v9;
  _TtC13InCallService35PHContactWallpaperSensitiveBlurView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v20 = v6;
    v7 = +[SensitivityFeatureFlags isCommunicationSafetyEnabled](_TtC13InCallService23SensitivityFeatureFlags, "isCommunicationSafetyEnabled");
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating posterSensitiveBlurView with isCommunicationSafetyEnabled: %d", buf, 8u);
    }

    v10 = -[PHContactWallpaperSensitiveBlurView initWithIsCommunicationSafety:]([_TtC13InCallService35PHContactWallpaperSensitiveBlurView alloc], "initWithIsCommunicationSafety:", v7);
    -[PHContactWallpaperSensitiveBlurView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (!v7)
    {
      objc_initWeak((id *)buf, v10);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000E9568;
      v30[3] = &unk_100285F88;
      objc_copyWeak(&v31, (id *)buf);
      -[PHContactWallpaperSensitiveBlurView setDidTapRevealButton:](v10, "setDidTapRevealButton:", v30);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v11, "addSubview:", v10);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactWallpaperSensitiveBlurView topAnchor](v10, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v32[0] = v26;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactWallpaperSensitiveBlurView bottomAnchor](v10, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
    v32[1] = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactWallpaperSensitiveBlurView trailingAnchor](v10, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v13));
    v32[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactWallpaperSensitiveBlurView leadingAnchor](v10, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
    v32[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

    +[TPIncomingCallMetricsProvider addCallerNameView:toContainerView:](TPIncomingCallMetricsProvider, "addCallerNameView:toContainerView:", v20, v10);
    v6 = v20;
  }

}

- (BOOL)shouldEnableShareMediaButton
{
  return self->_shouldEnableShareMediaButton;
}

- (void)setShouldEnableShareMediaButton:(BOOL)a3
{
  self->_shouldEnableShareMediaButton = a3;
}

- (BOOL)shouldEnableVideoStreamingButton
{
  return self->_shouldEnableVideoStreamingButton;
}

- (void)setShouldEnableVideoStreamingButton:(BOOL)a3
{
  self->_shouldEnableVideoStreamingButton = a3;
}

- (UILabel)enhancedEmergencyIntermittentStateLabel
{
  return (UILabel *)objc_getProperty(self, a2, 128, 1);
}

- (void)setEnhancedEmergencyIntermittentStateLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (UILabel)enhancedEmergencySecondaryLabel
{
  return (UILabel *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEnhancedEmergencySecondaryLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (UIScrollView)enhancedEmergencyIntermittentStateScrollView
{
  return (UIScrollView *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEnhancedEmergencyIntermittentStateScrollView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (BOOL)participantsViewIsShowingMultipleLabel
{
  return self->_participantsViewIsShowingMultipleLabel;
}

- (void)setParticipantsViewIsShowingMultipleLabel:(BOOL)a3
{
  self->_participantsViewIsShowingMultipleLabel = a3;
}

- (NSMutableArray)callUUIDsThatPresentedSNaPHUD
{
  return self->_callUUIDsThatPresentedSNaPHUD;
}

- (void)setImNicknameProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imNicknameProvider, a3);
}

- (TUCall)prioritizedCall
{
  return (TUCall *)objc_loadWeakRetained((id *)&self->_prioritizedCall);
}

- (void)setButtonsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsViewController, a3);
}

- (PHCallParticipantsViewController)callParticipantsViewController
{
  return (PHCallParticipantsViewController *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCallParticipantsViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void)setKeypadViewController:(id)a3
{
  objc_storeStrong((id *)&self->_keypadViewController, a3);
}

- (UIView)emergencyPhotoPickerGrabberView
{
  return self->_emergencyPhotoPickerGrabberView;
}

- (void)setEmergencyPhotoPickerGrabberView:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyPhotoPickerGrabberView, a3);
}

- (UIButton)callDetailsViewButton
{
  return (UIButton *)objc_getProperty(self, a2, 232, 1);
}

- (void)setCallDetailsViewButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (UIView)ambientAudioRoutesControlView
{
  return (UIView *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAmbientAudioRoutesControlView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (UIViewController)callRecordingButtonViewController
{
  return self->_callRecordingButtonViewController;
}

- (void)setCallRecordingButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_callRecordingButtonViewController, a3);
}

- (UIViewController)callRecordingPillViewController
{
  return self->_callRecordingPillViewController;
}

- (void)setCallRecordingPillViewController:(id)a3
{
  objc_storeStrong((id *)&self->_callRecordingPillViewController, a3);
}

- (NSLayoutConstraint)callRecordingLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 264, 1);
}

- (void)setCallRecordingLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (UILayoutGuide)recordingIndicatorLayoutGuide
{
  return self->_recordingIndicatorLayoutGuide;
}

- (void)setRecordingIndicatorLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_recordingIndicatorLayoutGuide, a3);
}

- (unsigned)middleViewState
{
  return self->_middleViewState;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (PHDeclineCallServiceProtocol)declineCallService
{
  return self->_declineCallService;
}

- (void)setDeclineCallService:(id)a3
{
  objc_storeStrong((id *)&self->_declineCallService, a3);
}

- (CNKCoreAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReporter, a3);
}

- (PHPosterNameViewModel)posterNameViewModel
{
  return self->_posterNameViewModel;
}

- (PHPosterNameViewModel)keypadPosterNameViewModel
{
  return self->_keypadPosterNameViewModel;
}

- (PHPosterNameViewModel)screeningPosterNameViewModel
{
  return self->_screeningPosterNameViewModel;
}

- (PHCallParticipantsViewController)callWaitingParticipantsViewController
{
  return (PHCallParticipantsViewController *)objc_getProperty(self, a2, 328, 1);
}

- (void)setCallWaitingParticipantsViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSArray)callWaitingLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setCallWaitingLayoutConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSLayoutConstraint)participantsViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 344, 1);
}

- (void)setParticipantsViewBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSLayoutConstraint)participantsViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 352, 1);
}

- (void)setParticipantsViewTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSLayoutConstraint)participantsViewCenterYConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 360, 1);
}

- (void)setParticipantsViewCenterYConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSLayoutConstraint)participantsViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 368, 1);
}

- (void)setParticipantsViewLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSLayoutConstraint)participantsViewTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 376, 1);
}

- (void)setParticipantsViewTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSLayoutConstraint)participantsViewCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 384, 1);
}

- (void)setParticipantsViewCenterXConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSLayoutConstraint)participantsViewVerticalPosterNameTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 392, 1);
}

- (void)setParticipantsViewVerticalPosterNameTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (BOOL)participantsViewShouldShowParticipantLabel
{
  return self->_participantsViewShouldShowParticipantLabel;
}

- (UILayoutGuide)leadingSideLayoutGuide
{
  return self->_leadingSideLayoutGuide;
}

- (void)setLeadingSideLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSideLayoutGuide, a3);
}

- (UILayoutGuide)trailingSideLayoutGuide
{
  return self->_trailingSideLayoutGuide;
}

- (void)setTrailingSideLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSideLayoutGuide, a3);
}

- (BOOL)shouldShowLargeAvatar
{
  return self->_shouldShowLargeAvatar;
}

- (void)setShouldShowLargeAvatar:(BOOL)a3
{
  self->_shouldShowLargeAvatar = a3;
}

- (BOOL)shouldShowLargeAvatarForCallWaiting
{
  return self->_shouldShowLargeAvatarForCallWaiting;
}

- (void)setShouldShowLargeAvatarForCallWaiting:(BOOL)a3
{
  self->_shouldShowLargeAvatarForCallWaiting = a3;
}

- (BOOL)hasKeypadUpdated
{
  return self->_hasKeypadUpdated;
}

- (void)setHasKeypadUpdated:(BOOL)a3
{
  self->_hasKeypadUpdated = a3;
}

- (void)setScreeningViewController:(id)a3
{
  objc_storeStrong((id *)&self->_screeningViewController, a3);
}

- (UIViewController)screeningBackgroundViewController
{
  return self->_screeningBackgroundViewController;
}

- (void)setScreeningBackgroundViewController:(id)a3
{
  objc_storeStrong((id *)&self->_screeningBackgroundViewController, a3);
}

- (void)setUseRTTButton:(id)a3
{
  objc_storeStrong((id *)&self->_useRTTButton, a3);
}

- (void)setExtensionNumberButton:(id)a3
{
  objc_storeStrong((id *)&self->_extensionNumberButton, a3);
}

- (void)setCallTransferButton:(id)a3
{
  objc_storeStrong((id *)&self->_callTransferButton, a3);
}

- (CNKTranscriptionViewComposerFactory)screeningViewControllerFactory
{
  return self->_screeningViewControllerFactory;
}

- (void)setScreeningViewControllerFactory:(id)a3
{
  objc_storeStrong((id *)&self->_screeningViewControllerFactory, a3);
}

- (void)setVoiceLoopManager:(id)a3
{
  objc_storeStrong((id *)&self->_voiceLoopManager, a3);
}

- (void)setVoiceLoopViewController:(id)a3
{
  objc_storeStrong((id *)&self->_voiceLoopViewController, a3);
}

- (UIView)currentMiddleView
{
  return (UIView *)objc_getProperty(self, a2, 480, 1);
}

- (void)setCurrentMiddleView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (UIView)middleSizingView
{
  return (UIView *)objc_getProperty(self, a2, 488, 1);
}

- (void)setMiddleSizingView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (id)pendingMiddleViewAnimations
{
  return self->_pendingMiddleViewAnimations;
}

- (void)setPendingMiddleViewAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSLayoutConstraint)buttonsViewBottomConstraint
{
  return self->_buttonsViewBottomConstraint;
}

- (void)setButtonsViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsViewBottomConstraint, a3);
}

- (NSLayoutConstraint)bottomBarBottomConstraint
{
  return self->_bottomBarBottomConstraint;
}

- (void)setBottomBarBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBarBottomConstraint, a3);
}

- (FTConstraintsToggle)screeningConstraints
{
  return self->_screeningConstraints;
}

- (void)setScreeningConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_screeningConstraints, a3);
}

- (UIView)heldCallControlsView
{
  return self->_heldCallControlsView;
}

- (void)setHeldCallControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_heldCallControlsView, a3);
}

- (TUCall)callForBackgroundImage
{
  return self->_callForBackgroundImage;
}

- (void)setCallForBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_callForBackgroundImage, a3);
}

- (PHBackgroundGradientBlurView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (UIImageView)unblurredBackgroundImageView
{
  return self->_unblurredBackgroundImageView;
}

- (void)setUnblurredBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_unblurredBackgroundImageView, a3);
}

- (UIVisualEffectView)keypadBackgroundView
{
  return self->_keypadBackgroundView;
}

- (void)setKeypadBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_keypadBackgroundView, a3);
}

- (UIView)screeningBackgroundView
{
  return self->_screeningBackgroundView;
}

- (void)setScreeningBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_screeningBackgroundView, a3);
}

- (PRUISPosterRenderingViewController)renderingViewController
{
  return self->_renderingViewController;
}

- (void)setRenderingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_renderingViewController, a3);
}

- (UIImage)snapshottedPosterImageToUseForColorInversion
{
  return self->_snapshottedPosterImageToUseForColorInversion;
}

- (void)setSnapshottedPosterImageToUseForColorInversion:(id)a3
{
  objc_storeStrong((id *)&self->_snapshottedPosterImageToUseForColorInversion, a3);
}

- (BOOL)hasInvertedUIElementColorsBasedOnPoster
{
  return self->_hasInvertedUIElementColorsBasedOnPoster;
}

- (void)setHasInvertedUIElementColorsBasedOnPoster:(BOOL)a3
{
  self->_hasInvertedUIElementColorsBasedOnPoster = a3;
}

- (id)suspendPosterAfterDelayBlock
{
  return self->_suspendPosterAfterDelayBlock;
}

- (void)setSuspendPosterAfterDelayBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (UIView)alwaysOnDisplayDimmingView
{
  return self->_alwaysOnDisplayDimmingView;
}

- (void)setAlwaysOnDisplayDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_alwaysOnDisplayDimmingView, a3);
}

- (PHPosterNameViewModel)alwaysOnDisplayPosterNameViewModel
{
  return self->_alwaysOnDisplayPosterNameViewModel;
}

- (void)setAlwaysOnDisplayPosterNameViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_alwaysOnDisplayPosterNameViewModel, a3);
}

- (UIView)defaultBackgroundGradientView
{
  return self->_defaultBackgroundGradientView;
}

- (void)setDefaultBackgroundGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBackgroundGradientView, a3);
}

- (PHAudioRoutingMenuController)routeListController
{
  return self->_routeListController;
}

- (void)setRouteListController:(id)a3
{
  objc_storeStrong((id *)&self->_routeListController, a3);
}

- (CNKMutedTalkerBannerViewControllerProtocol)mutedTalkerBannerViewController
{
  return self->_mutedTalkerBannerViewController;
}

- (void)setMutedTalkerBannerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mutedTalkerBannerViewController, a3);
}

- (BOOL)didNotifyMutedCaller
{
  return self->_didNotifyMutedCaller;
}

- (void)setDidNotifyMutedCaller:(BOOL)a3
{
  self->_didNotifyMutedCaller = a3;
}

- (BOOL)participantsViewControllersShouldIgnoreUpdates
{
  return self->_participantsViewControllersShouldIgnoreUpdates;
}

- (BOOL)waitingForFullScreenAudioRoutes
{
  return self->_waitingForFullScreenAudioRoutes;
}

- (void)setWaitingForFullScreenAudioRoutes:(BOOL)a3
{
  self->_waitingForFullScreenAudioRoutes = a3;
}

- (BOOL)wasPresentedAsBanner
{
  return self->_wasPresentedAsBanner;
}

- (void)setWasPresentedAsBanner:(BOOL)a3
{
  self->_wasPresentedAsBanner = a3;
}

- (UIView)posterBadgeView
{
  return (UIView *)objc_getProperty(self, a2, 640, 1);
}

- (void)setPosterBadgeView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (void)setSpeechSynthesizer:(id)a3
{
  objc_storeStrong((id *)&self->_speechSynthesizer, a3);
}

- (CNKCallDetailsCoordinatorProtocol)callDetailsCoordinator
{
  return self->_callDetailsCoordinator;
}

- (void)setCallDetailsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_callDetailsCoordinator, a3);
}

- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory
{
  return self->_labelDescriptorFactory;
}

- (BOOL)canDumpHierarchy
{
  return self->_canDumpHierarchy;
}

- (void)setCanDumpHierarchy:(BOOL)a3
{
  self->_canDumpHierarchy = a3;
}

- (CNKMutedTalkerBannerViewControllerFactory)mutedTalkerViewControllerFactory
{
  return self->_mutedTalkerViewControllerFactory;
}

- (void)setMutedTalkerViewControllerFactory:(id)a3
{
  objc_storeStrong((id *)&self->_mutedTalkerViewControllerFactory, a3);
}

- (NSCache)contactsCache
{
  return self->_contactsCache;
}

- (void)setContactsCache:(id)a3
{
  objc_storeStrong((id *)&self->_contactsCache, a3);
}

- (NSCache)configurationCache
{
  return self->_configurationCache;
}

- (void)setConfigurationCache:(id)a3
{
  objc_storeStrong((id *)&self->_configurationCache, a3);
}

- (BOOL)shouldPresentAlertButton
{
  return self->_shouldPresentAlertButton;
}

- (void)setShouldPresentAlertButton:(BOOL)a3
{
  self->_shouldPresentAlertButton = a3;
}

- (BOOL)shouldAutoCountdownAlert
{
  return self->_shouldAutoCountdownAlert;
}

- (void)setShouldAutoCountdownAlert:(BOOL)a3
{
  self->_shouldAutoCountdownAlert = a3;
}

- (BOOL)didTriggerAutoCountdownAlertBefore
{
  return self->_didTriggerAutoCountdownAlertBefore;
}

- (void)setDidTriggerAutoCountdownAlertBefore:(BOOL)a3
{
  self->_didTriggerAutoCountdownAlertBefore = a3;
}

- (BOOL)alertTriggeredByAutoCountdown
{
  return self->_alertTriggeredByAutoCountdown;
}

- (void)setAlertTriggeredByAutoCountdown:(BOOL)a3
{
  self->_alertTriggeredByAutoCountdown = a3;
}

- (BOOL)didRequestToSpeakAlertUtterance
{
  return self->_didRequestToSpeakAlertUtterance;
}

- (void)setDidRequestToSpeakAlertUtterance:(BOOL)a3
{
  self->_didRequestToSpeakAlertUtterance = a3;
}

- (NSTimer)alertCountDownTimer
{
  return self->_alertCountDownTimer;
}

- (void)setAlertCountDownTimer:(id)a3
{
  objc_storeStrong((id *)&self->_alertCountDownTimer, a3);
}

- (UILabel)emergencyTextViaSatelliteLabel
{
  return (UILabel *)objc_getProperty(self, a2, 704, 1);
}

- (void)setEmergencyTextViaSatelliteLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 704);
}

- (PHEnhancedEmergencyCoordinator)emergencyCoordinator
{
  return self->_emergencyCoordinator;
}

- (void)setEmergencyCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyCoordinator, a3);
}

- (NSTimer)callBufferTimer
{
  return self->_callBufferTimer;
}

- (void)setCallBufferTimer:(id)a3
{
  objc_storeStrong((id *)&self->_callBufferTimer, a3);
}

- (NSTimer)confirmationTimeoutTimer
{
  return self->_confirmationTimeoutTimer;
}

- (void)setConfirmationTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationTimeoutTimer, a3);
}

- (BOOL)shouldPauseSOSCallBufferTimer
{
  return self->_shouldPauseSOSCallBufferTimer;
}

- (void)setShouldPauseSOSCallBufferTimer:(BOOL)a3
{
  self->_shouldPauseSOSCallBufferTimer = a3;
}

- (PHSingleCallParticipantLabelView)bufferSingleCallLabelView
{
  return (PHSingleCallParticipantLabelView *)objc_getProperty(self, a2, 736, 1);
}

- (void)setBufferSingleCallLabelView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (SOSVoiceMessageManager)voiceMessageManager
{
  return self->_voiceMessageManager;
}

- (void)setVoiceMessageManager:(id)a3
{
  objc_storeStrong((id *)&self->_voiceMessageManager, a3);
}

- (CNKScreenSharingInteractionControllerFactory)screenSharingInteractionControllerFactory
{
  return self->_screenSharingInteractionControllerFactory;
}

- (NSString)UUIDForLocallyDisconnectedCall
{
  return self->_UUIDForLocallyDisconnectedCall;
}

- (void)setUUIDForLocallyDisconnectedCall:(id)a3
{
  objc_storeStrong((id *)&self->_UUIDForLocallyDisconnectedCall, a3);
}

- (NSObject)stateChangeLockObservation
{
  return self->_stateChangeLockObservation;
}

- (void)setStateChangeLockObservation:(id)a3
{
  objc_storeStrong((id *)&self->_stateChangeLockObservation, a3);
}

- (id)stateDisplayChangedObservation
{
  return self->_stateDisplayChangedObservation;
}

- (void)setStateDisplayChangedObservation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateDisplayChangedObservation, 0);
  objc_storeStrong((id *)&self->_stateChangeLockObservation, 0);
  objc_storeStrong((id *)&self->_UUIDForLocallyDisconnectedCall, 0);
  objc_storeStrong((id *)&self->_screenSharingInteractionControllerFactory, 0);
  objc_storeStrong((id *)&self->_voiceMessageManager, 0);
  objc_storeStrong((id *)&self->_bufferSingleCallLabelView, 0);
  objc_storeStrong((id *)&self->_confirmationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_callBufferTimer, 0);
  objc_storeStrong((id *)&self->_emergencyCoordinator, 0);
  objc_storeStrong((id *)&self->_emergencyTextViaSatelliteLabel, 0);
  objc_storeStrong((id *)&self->_alertCountDownTimer, 0);
  objc_storeStrong((id *)&self->_configurationCache, 0);
  objc_storeStrong((id *)&self->_contactsCache, 0);
  objc_storeStrong((id *)&self->_mutedTalkerViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_labelDescriptorFactory, 0);
  objc_storeStrong((id *)&self->_callDetailsCoordinator, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_posterBadgeView, 0);
  objc_storeStrong((id *)&self->_mutedTalkerBannerViewController, 0);
  objc_storeStrong((id *)&self->_routeListController, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundGradientView, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisplayPosterNameViewModel, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisplayDimmingView, 0);
  objc_storeStrong(&self->_suspendPosterAfterDelayBlock, 0);
  objc_storeStrong((id *)&self->_snapshottedPosterImageToUseForColorInversion, 0);
  objc_storeStrong((id *)&self->_renderingViewController, 0);
  objc_storeStrong((id *)&self->_screeningBackgroundView, 0);
  objc_storeStrong((id *)&self->_keypadBackgroundView, 0);
  objc_storeStrong((id *)&self->_unblurredBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_callForBackgroundImage, 0);
  objc_storeStrong((id *)&self->_heldCallControlsView, 0);
  objc_storeStrong((id *)&self->_screeningConstraints, 0);
  objc_storeStrong((id *)&self->_bottomBarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonsViewBottomConstraint, 0);
  objc_storeStrong(&self->_pendingMiddleViewAnimations, 0);
  objc_storeStrong((id *)&self->_middleSizingView, 0);
  objc_storeStrong((id *)&self->_currentMiddleView, 0);
  objc_storeStrong((id *)&self->_voiceLoopViewController, 0);
  objc_storeStrong((id *)&self->_voiceLoopManager, 0);
  objc_storeStrong((id *)&self->_screeningViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_callTransferButton, 0);
  objc_storeStrong((id *)&self->_extensionNumberButton, 0);
  objc_storeStrong((id *)&self->_useRTTButton, 0);
  objc_storeStrong((id *)&self->_screeningBackgroundViewController, 0);
  objc_storeStrong((id *)&self->_screeningViewController, 0);
  objc_storeStrong((id *)&self->_trailingSideLayoutGuide, 0);
  objc_storeStrong((id *)&self->_leadingSideLayoutGuide, 0);
  objc_storeStrong((id *)&self->_participantsViewVerticalPosterNameTopConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_callWaitingLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_callWaitingParticipantsViewController, 0);
  objc_storeStrong((id *)&self->_screeningPosterNameViewModel, 0);
  objc_storeStrong((id *)&self->_keypadPosterNameViewModel, 0);
  objc_storeStrong((id *)&self->_posterNameViewModel, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_declineCallService, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorLayoutGuide, 0);
  objc_storeStrong((id *)&self->_callRecordingLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_callRecordingPillViewController, 0);
  objc_storeStrong((id *)&self->_callRecordingButtonViewController, 0);
  objc_storeStrong((id *)&self->_ambientAudioRoutesControlView, 0);
  objc_storeStrong((id *)&self->_callDetailsViewButton, 0);
  objc_storeStrong((id *)&self->_emergencyPhotoPickerGrabberView, 0);
  objc_storeStrong((id *)&self->_keypadViewController, 0);
  objc_storeStrong((id *)&self->_callParticipantsViewController, 0);
  objc_storeStrong((id *)&self->_buttonsViewController, 0);
  objc_destroyWeak((id *)&self->_prioritizedCall);
  objc_storeStrong((id *)&self->_imNicknameProvider, 0);
  objc_storeStrong((id *)&self->_callUUIDsThatPresentedSNaPHUD, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_enhancedEmergencyIntermittentStateScrollView, 0);
  objc_storeStrong((id *)&self->_enhancedEmergencySecondaryLabel, 0);
  objc_storeStrong((id *)&self->_enhancedEmergencyIntermittentStateLabel, 0);
}

- (id)makeLockObserverWithHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  PHAudioCallViewController *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD v11[3];
  uint64_t v12;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100289070, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  PHAudioCallViewController.makeLockObserver(with:)((uint64_t)sub_10011ACA8, v5);

  swift_release(v5);
  v7 = v12;
  v8 = sub_10011ACB0(v11, v12);
  v9 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v8, v7);
  sub_100110DC0(v11);
  return v9;
}

- (id)makeCallDetailsCoordinatorWithBannerPresentationManager:(id)a3 existingCoordinator:(id)a4 deferredPresentationManager:(id)a5
{
  id v8;
  PHAudioCallViewController *v9;
  id v10;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  v9 = self;
  v10 = PHAudioCallViewController.makeCallDetailsCoordinator(bannerPresentationManager:existingCoordinator:deferredPresentationManager:)((uint64_t)v8, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a5);

  return v10;
}

- (id)makeHeldCallControlsViewWithCallCenter:(id)a3 style:(int64_t)a4
{
  id v6;
  PHAudioCallViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)PHAudioCallViewController.makeHeldCallControls(callCenter:style:)(v6, a4);

  return v8;
}

- (void)showNameAndPhotoHUDIfNecessaryWithBannerPresentationManager:(id)a3 callCenter:(id)a4
{
  id v6;
  id v7;
  PHAudioCallViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001129D4((uint64_t)v8);

}

- (void)presentShareCard:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  PHAudioCallViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001132EC((uint64_t)v6);

}

- (id)currentIMNicknameMatchingContact:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_100113A64();
  v7 = v6;

  return v7;
}

- (BOOL)hasLastSeenPosterForCall:(id)a3
{
  id v3;
  id v5;
  PHAudioCallViewController *v6;

  v3 = a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_100113C94(v3);

  return v3 & 1;
}

- (BOOL)lastSeenPosterDataIsSensitiveForCall:(id)a3
{
  id v3;
  id v5;
  PHAudioCallViewController *v6;

  v3 = a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_100113E2C(v3);

  return v3 & 1;
}

- (id)readCachedLastSeenPosterDataForCall:(id)a3
{
  PHAudioCallViewController *v4;
  id v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  Class isa;

  v4 = self;
  v5 = a3;
  v6 = sub_100113F18(a3);
  v8 = v7;

  if (v8 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10011AB8C((uint64_t)v6, v8);
  }
  return isa;
}

- (id)lastSeenPosterIMWallpaperMetadataForCall:(id)a3
{
  id v5;
  PHAudioCallViewController *v6;
  _QWORD *v7;

  v5 = a3;
  v6 = self;
  v7 = sub_100114274(a3);

  return v7;
}

+ (BOOL)posterSourceIsSyncedWithContacts:(unint64_t)a3
{
  return sub_1001143F8(a3);
}

- (unint64_t)suggestedNewPosterSourceAfterCallConnects:(id)a3
{
  id v5;
  PHAudioCallViewController *v6;
  unint64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_100114424(a3);

  return v7;
}

- (BOOL)prefersShowingCachedLastSeenPosterBeforeCallConnected:(id)a3
{
  id v3;
  id v5;
  PHAudioCallViewController *v6;

  v3 = a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_100114A68(v3);

  return v3 & 1;
}

- (void)writeToLastSeenPosterCacheIfNecessaryForCall:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100114E10();

}

- (void)deleteAllUnarchivedPosterDirectories
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100116F7C();

}

- (TUCall)callToUseForWallpaper
{
  PHAudioCallViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100117950((uint64_t)v2);

  return (TUCall *)v3;
}

- (BOOL)hasNoCallsOrOnlyEndedCalls
{
  PHAudioCallViewController *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1001181B8();
  v4 = v3;

  return v4 & 1;
}

- (void)blockWithHandle:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100118E00(v4);

}

- (void)reportWithCall:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100119170(v4);

}

- (void)createContactWithHandle:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001193C0((uint64_t)v4);

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  id v7;
  PHAudioCallViewController *v8;
  CNContact_optional v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PHAudioCallViewController.contactViewController(_:didCompleteWith:)((CNContactViewController)v8, v9);

}

- (BOOL)shouldUpdateBackgroundForEmergencyCall
{
  PHAudioCallViewController *v2;
  char v3;
  char v4;

  v2 = self;
  sub_100119A28((uint64_t)v2);
  v4 = v3;

  return v4 & 1;
}

- (void)updateBackgroundForEmergencyCall
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100119BC0();

}

- (void)updateCallRecordingIfNeeded
{
  PHAudioCallViewController *v2;

  v2 = self;
  PHAudioCallViewController.updateCallRecordingIfNeeded()();

}

- (BOOL)conditions
{
  PHAudioCallViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_10011DE80();

  return v3 & 1;
}

- (void)invertColorCallRecordingButtonColor:(BOOL)a3
{
  PHAudioCallViewController *v4;

  v4 = self;
  PHAudioCallViewController.invertColorCallRecordingButtonColor(_:)(a3);

}

- (void)addCallRecordingIfNeeded
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10011E364();

}

- (void)addRecordingIndicator
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10011E418();

}

- (void)addButton
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10011EDE0();

}

- (void)updateCallRecordingPositionIfNeeded
{
  PHAudioCallViewController *v2;

  v2 = self;
  PHAudioCallViewController.updateCallRecordingPositionIfNeeded()();

}

- (void)startTracking
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10015CA0C((uint64_t (*)(uint64_t))&ObjectTracker.Tracker.startTracking(object:));

}

- (void)stopTracking
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10015CA0C((uint64_t (*)(uint64_t))&ObjectTracker.Tracker.stopTracking(object:));

}

- (void)addWebRTCViewController:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10015EA40();

}

- (void)removeWebRTCViewController:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10015F248();

}

- (void)requestToEnableVideoStreamingButton
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10015F510((SEL *)&selRef_setShouldEnableVideoStreamingButton_, 1);

}

- (void)requestToDisableVideoStreamingButton
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10015F510((SEL *)&selRef_setShouldEnableVideoStreamingButton_, 0);

}

- (void)requestToEnableMediaUploadButton
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10015F510((SEL *)&selRef_setShouldEnableShareMediaButton_, 1);

}

- (void)requestToDisableMediaUploadButton
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10015F510((SEL *)&selRef_setShouldEnableShareMediaButton_, 0);

}

- (void)hideWebRTCViewController:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10015F5E4();

}

- (void)removeWebRTCViewControllerForPIP:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10015F768(v4);

}

- (void)addMediaRequestViewController:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10015F8C4();

}

- (void)removeMediaRequestViewController:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10015FD94();

}

- (void)insertWebViewUnderButtonControls:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10015FF3C();

}

- (void)bringWebRTCViewControllerToFront:(id)a3
{
  id v4;
  PHAudioCallViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001604FC();

}

- (void)requestAnimationToFullScreenWebView
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100160650();

}

- (void)requestToRemoveEnhancedEmergencyIntermittentStateLabel
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10016083C();

}

- (void)requestToPresentMediaUploadRequestBanner
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100160C1C("EnhancedEmergency: PHAudioCallViewController trying to request mediaUploadRequest banner", (void (*)(void))&BannerPresentationManager.showEnhancedEmergenctMediaUploadHUD(), (void (*)(void))&BannerPresentationManager.showEnhancedEmergencyRTTMediaUploadHUD());

}

- (void)requestToPresentMediaUploadRequestBannerDuringStreaming
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10016098C();

}

- (void)requestHapticForRequest
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100160B8C();

}

- (void)requestToPresentVideoStreamingRequestBanner
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100160C1C("EnhancedEmergency: PHAudioCallViewController trying to request videoStreaming banner", (void (*)(void))&BannerPresentationManager.showEnhancedEmergenctVideoStreamingHUD(), (void (*)(void))&BannerPresentationManager.showEnhancedEmergencyRTTVideoStreamingHUD());

}

- (void)requestToAddErrorLabelWithRetryable:(BOOL)a3
{
  PHAudioCallViewController *v3;

  v3 = self;
  sub_100160EFC();

}

- (void)requestToAddResumeCameraLabel
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100160F4C();

}

- (void)requestToAddLiveCameraLabel
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100161134();

}

- (void)requestToAddMitigationLabel
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100161370(2, (uint64_t)&unk_10028B050, (uint64_t)sub_100162F68, (uint64_t)&unk_10028B068);

}

- (void)requestToAddPhotoMitigationLabel
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100161370(3, (uint64_t)&unk_10028B000, (uint64_t)sub_100162F68, (uint64_t)&unk_10028B018);

}

- (void)updateEnhancedEmergencyViewWhenKeypadPresented
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100161564();

}

- (void)addEnhancedEmergencyIntermittentStateLabelWithState:(int64_t)a3
{
  PHAudioCallViewController *v4;

  v4 = self;
  sub_100161628((char **)a3);

}

- (void)removeEnhancedEmergencyIntermittentStateLabel
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_10016268C();

}

- (void)showCallControls
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100162790();

}

- (void)hideCallControls
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100162908();

}

- (id)getCurrentCall
{
  PHAudioCallViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100162B58();

  return v3;
}

- (void)showRTTConversation
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100162BAC((uint64_t)v2);

}

- (void)hideRTTConversationIfNeeded
{
  PHAudioCallViewController *v2;

  v2 = self;
  sub_100162C80((uint64_t)v2);

}

- (id)getAudioRouteMenu
{
  PHAudioCallViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100162D68();

  return v3;
}

@end
