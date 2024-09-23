@implementation AXSpringBoardServerHelper

- (BOOL)shouldOverrideInterfaceOrientation
{
  return self->_shouldOverrideInterfaceOrientation;
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_frontMostAppOrientation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9)
    v10 = a3;
  else
    v10 = 0;
  v16[0] = *MEMORY[0x24BE003B0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v16[1] = *MEMORY[0x24BE003B8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "springBoardActionOccurred:withPayload:", 4, v13);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", CFSTR("AXSBServerOrientationChange"), 0);

}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_1);
}

void __39__AXSpringBoardServerHelper_initialize__block_invoke()
{
  AXSpringBoardServerHelper *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  if (AXProcessIsSpringBoard())
  {
    v0 = objc_alloc_init(AXSpringBoardServerHelper);
    v1 = (void *)SBServerHelper;
    SBServerHelper = (uint64_t)v0;

    +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDelegate:", SBServerHelper);

    v3 = SBServerHelper;
    +[AXSpringBoardServerSideAppManager sharedInstance](AXSpringBoardServerSideAppManager, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v3);

  }
}

+ (id)sharedServerHelper
{
  return (id)SBServerHelper;
}

- (void)_performValidation
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_525, &__block_literal_global_1099, 0, &__block_literal_global_1103);

}

uint64_t __47__AXSpringBoardServerHelper__performValidation__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("SBTelephonyManager"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBPrototypeController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBConferenceManager"));
  objc_msgSend(v2, "validateClass:", CFSTR("UIApplicationRotationFollowingWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBHomeScreenWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SpringBoard"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainWorkspace"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMainWorkspace"), CFSTR("_instanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainWorkspace"), CFSTR("inCallTransientOverlayManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("ringerControl"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBMainWorkspace"), CFSTR("_keyboardFocusCoordinator"), "<SBKeyboardFocusControlling>");
  objc_msgSend(v2, "validateClass:", CFSTR("SBKeyboardFocusCoordinator"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBKeyboardFocusArbitrationReason"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBKeyboardFocusArbitrationReason"), CFSTR("_initWithLabel:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBKeyboardFocusCoordinator"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:conformsToProtocol:", CFSTR("SBKeyboardFocusCoordinator"), CFSTR("SBKeyboardFocusControlling"));
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBKeyboardFocusControlling"), CFSTR("focusLockSpringBoardWindowScene:forReason:"));
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBKeyboardFocusControlling"), CFSTR("requestArbitrationForSBWindowScene:forReason:"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBInCallTransientOverlayManager"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBInCallTransientOverlayManager"), CFSTR("presentTransientOverlay"), "v", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBRingerControl"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRingerControl"), CFSTR("_accessibilityIsRingerMuted"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBReachabilityManager"), CFSTR("_reachabilityModeActive"), "B");
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMediaController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBOrientationLockManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBReachabilityManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("sharedTelephonyManagerCreatingIfNecessary:"), "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBPrototypeController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBConferenceManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemGestureManager"), CFSTR("isGestureWithTypeAllowed:"), "B", "Q", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSystemGestureManager"), CFSTR("mainDisplayManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBVoiceControlController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBVoiceControlController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBVoiceControlController"), CFSTR("handleHomeButtonHeld"), "B", 0);
  objc_msgSend(v2, "validateClass:hasProperty:withType:", CFSTR("SBSwitcherController"), CFSTR("contentViewController"), "@");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("isClassic"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("_classicMode"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainWorkspace"), CFSTR("transientOverlayPresentationManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTransientOverlayPresentationManager"), CFSTR("topmostPresentedViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleShelves"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherShelfViewController"), CFSTR("dismissShelfForAccessibilityTransition"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRemoteTransientOverlayViewController"), CFSTR("_hostContentAdapter"), "SBRemoteTransientOverlayHostContentAdapter");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRemoteTransientOverlayHostContentAdapter"), CFSTR("serviceBundleIdentifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBContinuitySessionManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBContinuitySessionManager"), CFSTR("currentSession"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSPageViewController"), CFSTR("view"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBDefaults"), CFSTR("localDefaults"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("coverSheetViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("coverSheetView"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("CSCoverSheetViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("activatePage:animated:withCompletion:"), "v", "Q", "B", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("_indexOfMainPage"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("suppressesControlCenter"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("_allowedPageViewControllers"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFPagedScrollView"), CFSTR("currentPageIndex"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("processState"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationProcessState"), CFSTR("pid"), 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("_updateProcess:withState:"), "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationProcessState"), CFSTR("taskState"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationProcessState"), CFSTR("visibility"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("_internalProcessState"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("lockUIFromSource:withOptions:"), "v", "i", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("_authenticationStateChanged:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIdleTimerGlobalCoordinator"), CFSTR("resetIdleTimerForReason:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("shouldTurnOnScreenForBacklightSource:"), "B", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("setBacklightState:source:"), "v", "q", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCombinedListViewController"), CFSTR("notificationStructuredListViewControllerShouldAllowNotificationHistoryReveal:"), "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("presentedBanner"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("isPresentingBanner"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("notificationDispatcher"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCNotificationDispatcher"), CFSTR("bannerDestination"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCNotificationDispatcher"), CFSTR("dashBoardDestination"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("isPresentingBannerInLongLook"), "B", 0);
  objc_msgSend(v2, "validateProtocol:conformsToProtocol:", CFSTR("SBNotificationDestination"), CFSTR("SBFNotificationLongLookPresenting"));
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBFNotificationLongLookPresenting"), CFSTR("isPresentingNotificationInLongLook"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_handleOpenAppSwitcherShortcut:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSceneManagerCoordinator"), CFSTR("mainDisplaySceneManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplaySceneManager"), CFSTR("policyAggregator"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayPolicyAggregator"), CFSTR("allowsCapability:"), "B", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("dismissAssistantViewIfNecessaryInWindowScene:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBSceneManager"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainDisplaySceneManager"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBMainDisplaySceneManager"), CFSTR("SBSceneManager"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMediaController"), CFSTR("isPlaying"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMediaController"), CFSTR("nowPlayingApplication"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBOrientationLockManager"), CFSTR("isUserLocked"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBOrientationLockManager"), CFSTR("lock"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBOrientationLockManager"), CFSTR("unlock"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBOrientationLockManager"), CFSTR("userLockOrientation"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBOrientationLockManager"), CFSTR("lockOverrideEnabled"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_frontMostAppOrientation"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("addActiveOrientationObserver:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("applicationOpenURL:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("removeActiveOrientationObserver:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_toggleSearch"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("toggleSearchOnWindowScene:fromBreadcrumbSource:withWillBeginHandler:completionHandler:"), "v", "@", "B", "@?", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindow"), CFSTR("_setRotatableViewOrientation:duration:force:"), "v", "q", "d", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBVolumeControl"), CFSTR("_effectiveVolumeChanged:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBVolumeControl"), CFSTR("_presentVolumeHUDWithVolume:"), "v", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBLockScreenCallHandling"), CFSTR("isMakingEmergencyCall"));
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBLockScreenPasscodeViewPresenting"), CFSTR("isPasscodeLockVisible"));
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBLockScreenEnvironment"), CFSTR("passcodeViewPresenter"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenViewControllerBase"), CFSTR("isMakingEmergencyCall"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenViewControllerBase"), CFSTR("isPasscodeLockVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_activeDisplaySwitcherController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("dismissMainSwitcherWithSource:animated:"), "B", "q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("dismissMainAndFloatingSwitchersWithSource:animated:"), "B", "q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("canBePresented"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("allowShowTransitionSystemGesture"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("inCall"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("isEndpointOnCurrentDevice"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("applicationWithPid:"), "@", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilityManager"), CFSTR("reachabilityModeActive"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPrototypeController"), CFSTR("rootSettings"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBReachabilityDomain"), CFSTR("rootSettings"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilitySettings"), CFSTR("yOffsetFactor"), "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBConferenceManager"), CFSTR("inFaceTime"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("presentAnimated:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("applicationWithBundleIdentifier:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilityManager"), CFSTR("toggleReachability"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBReachabilityManager"), CFSTR("setReachabilityEnabled:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIController"), CFSTR("_activateApplicationFromAccessibility:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("homeScreenAppLayout"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleItemContainers"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("layoutContext"), "@", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBWindowScene"), CFSTR("UIWindowScene"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("sceneManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManager"), CFSTR("allScenes"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManager"), CFSTR("displayIdentity"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBScene"), CFSTR("identifier"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBElasticHUDViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHUDController"), CFSTR("_presentHUD:animated:"), "v", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("unlockUIFromSource:withOptions:"), "B", "i", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBLockScreenUnlockRequest"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenUnlockRequest"), CFSTR("setName:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenUnlockRequest"), CFSTR("setSource:"), "v", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenUnlockRequest"), CFSTR("setIntent:"), "v", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("unlockWithRequest:completion:"), "B", "@", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("coverSheetViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CSCoverSheetViewController"), CFSTR("_scrollGestureController"), "CSScrollGestureController");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("isPasscodeEntryTransientOverlayVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("isLockScreenVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBIconController"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("floatingDockController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("presentLibraryForIconManager:windowScene:animated:"), "v", "@", "@", "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBCoverSheetPresentationManager"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBCoverSheetPresentationManager"), CFSTR("_coverSheetSlidingViewController"), "SBCoverSheetSlidingViewController");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCoverSheetSlidingViewController"), CFSTR("systemGesturesDelegate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCoverSheetSystemGesturesDelegate"), CFSTR("gestureRecognizerShouldBegin:"), "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCoverSheetSystemGesturesDelegate"), CFSTR("presentGestureRecognizer"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCoverSheetSystemGesturesDelegate"), CFSTR("dismissGestureRecognizer"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBCoverSheetPresentationManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCoverSheetPresentationManager"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCoverSheetPresentationManager"), CFSTR("setCoverSheetPresented:animated:withCompletion:"), "v", "B", "B", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCoverSheetPresentationManager"), CFSTR("coverSheetSlidingViewControllerIfLoaded"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("_appearState"), "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCoverSheetPresentationManager"), CFSTR("isInSecureApp"), "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("CSMainPageContentViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("CSCombinedListViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("mainPageContentViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSMainPageContentViewController"), CFSTR("combinedListViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListSectionRevealHintView"), CFSTR("revealHintTitle"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CSCombinedListViewController"), CFSTR("_structuredListViewController"), "NCNotificationStructuredListViewController");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredListViewController"), CFSTR("revealNotificationHistory:animated:"), "v", "B", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredListViewController"), CFSTR("listModel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRootList"), CFSTR("isNotificationHistoryRevealed"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CSCombinedListViewController"), CFSTR("_listPresentingContent"), "B");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCombinedListViewController"), CFSTR("_allowNotificationsRevealPolicy"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCombinedListViewController"), CFSTR("_shouldPreventNotificationHistoryRevealForActiveDNDState"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("noteMenuButtonDoublePress"), "v", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainScreenActiveInterfaceOrientationWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBSecureMainScreenActiveInterfaceOrientationWindow"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBSecureMainScreenActiveInterfaceOrientationWindow"), CFSTR("SBMainScreenActiveInterfaceOrientationWindow"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainScreenActiveInterfaceOrientationWindow"), CFSTR("contentViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainScreenActiveInterfaceOrientationWindow"), CFSTR("initWithRole:debugName:"), "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainScreenActiveInterfaceOrientationWindow"), CFSTR("setContentViewController:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("isShowingHomescreen"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIAlertControllerActionView"), CFSTR("setHighlighted:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBControlCenterController"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("isPresented"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("iconManager"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBHIconManager"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("isIconDragging"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("isOverlayTodayOrLibraryViewVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemGestureManager"), CFSTR("isAnyTouchGestureRunning"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SpringBoard"), CFSTR("_screenCapturer"), "SSScreenCapturer");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SSScreenCapturer"), CFSTR("_serviceWindow"), "SSScreenshotsWindow");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSScreenshotsWindow"), CFSTR("_hostViewControllerIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBApplication"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBSceneManagerCoordinator"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBDeviceApplicationSceneHandle"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSceneManagerCoordinator"), CFSTR("mainDisplaySceneManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManager"), CFSTR("sceneIdentityForApplication:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBMainDisplaySceneManager"), CFSTR("SBSceneManager"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManager"), CFSTR("sceneIdentityForApplication:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplaySceneManager"), CFSTR("fetchOrCreateApplicationSceneHandleForRequest:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("bestSnapshotWithImageName:sceneHandle:variantID:scale:referenceSize:requireExactSize:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:"), "@", "@", "@", "@", "d", "{CGSize=dd}", "B", "Q", "Q", "q", "@", "q", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBApplicationSceneHandleRequest"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBApplicationSceneHandleRequest"), CFSTR("defaultRequestForApplication:sceneIdentity:displayIdentity:"), "@", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDeviceApplicationSceneHandle"), CFSTR("displayEdgeInfoForLayoutEnvironment:"), "@", "q", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBSpotlightMultiplexingViewController"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSpotlightMultiplexingViewController"), CFSTR("sharedRemoteSearchViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SPUIRemoteSearchViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUIRemoteSearchViewController"), CFSTR("revealProgress"), "d", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBVoiceControlTransientOverlayViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainSwitcherWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBWorkspace"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBWorkspace"), CFSTR("mainWorkspace"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainWorkspace"), CFSTR("pipCoordinator"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPControllerCoordinator"), CFSTR("isAnyPictureInPictureWindowVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("bannerManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("windowSceneManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowSceneManager"), CFSTR("activeDisplayWindowScene"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBannerManager"), CFSTR("isDisplayingBannerInWindowScene:"), "B", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainSwitcherControllerCoordinator"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"), CFSTR("_topAffordanceViewController"), "SBTopAffordanceViewController");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTopAffordanceViewController"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBFloatingDockController"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("isFloatingDockSupported"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_toggleAppLibraryVisibility:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_handleSystemNotesPIPKeyShortcut:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainDisplayLayoutState"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("peekConfiguration"), "q", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBMainDisplayLayoutState"), CFSTR("SBLayoutState"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowSceneManager"), CFSTR("connectedWindowScenes"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("switcherController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("isChamoisWindowingUIEnabled"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_currentMainAppLayout"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("leafAppLayouts"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_itemContainerForAppLayoutIfExists:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherItemContainer"), CFSTR("isSelectable"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("itemsToLayoutAttributesMap"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayItem"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayItem"), CFSTR("uniqueIdentifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("unlockedEnvironmentMode"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_currentLayoutState"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_activeDisplaySwitcherController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("contentViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBSystemApertureController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("systemApertureControllerForMainDisplay"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBSystemApertureViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureController"), CFSTR("_systemApertureViewController"), "SBSystemApertureViewController");
  objc_msgSend(v2, "validateClass:", CFSTR("SAUISystemApertureManager"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureViewController"), CFSTR("_systemApertureManager"), "SAUISystemApertureManager");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SAUISystemApertureManager"), CFSTR("_elementsToElementViewControllers"), "NSMapTable");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUILayoutSpecifyingElementViewController"), CFSTR("_axCollapseIfExpandedByUserInteraction"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureViewController"), CFSTR("_orderedContainerViews"), "NSMutableArray");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemApertureViewController"), CFSTR("_elementForContainerView:"), "@", "@", 0);
  objc_msgSend(v2, "validateProtocol:conformsToProtocol:", CFSTR("SAElement"), CFSTR("SAElementIdentifying"));
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SAElementIdentifying"), CFSTR("clientIdentifier"));

  return 1;
}

uint64_t __47__AXSpringBoardServerHelper__performValidation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AXSpringBoardServerHelper"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AXSpringBoardServerHelper"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __47__AXSpringBoardServerHelper__performValidation__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_UIScreenSafeCategory"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_UIAlertControllerActionViewSafeCategory"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_UIAlertControllerSafeCategory"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSBUIWindow"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSBServerHelperSBControlCenterController"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSBServerVolumeControl"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSBServerSBHUDController"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSBServerUIApplication"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSpringBoardAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSBLockScreenManager"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSBReachabilityManagerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_SBApplicationSafeCategory"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_SBRestartManagerSafeCategory"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXCSScrollGestureControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_SBSceneManagerSafeCategory"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_SBAssistantControllerSafeCategory"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_SBSystemNotesInteractionManager"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXSB_SBSpotlightMultiplexingViewController"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride"), 1);

}

- (void)_createAlertWindowSubclass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_21AC77000, v0, v1, "Could not find SBSecureMainScreenActiveInterfaceOrientationWindow", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (AXSpringBoardServerHelper)init
{
  AXSpringBoardServerHelper *v2;
  NSMutableArray *v3;
  NSMutableArray *visibleTripleClickItems;
  void *v5;
  id v6;
  AXSpringBoardServerHelper *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSMutableArray *v9;
  NSMutableArray *notificationObservers;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  AXSpringBoardServerAlertManager *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  AXSSMotionTrackingInputManager *motionTrackingInputManager;
  void *v45;
  void *v46;
  AXSpringBoardServerHelper *v47;
  AXSpringBoardServerHelper *v49;
  _QWORD v50[4];
  id v51;
  id location[5];
  id v53;
  AXSpringBoardServerHelper *v54;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)AXSpringBoardServerHelper;
  v2 = -[AXSpringBoardServerHelper init](&v55, sel_init);
  if (v2)
  {
    AXSessionIsLoginSession();
    -[AXSpringBoardServerHelper _createAlertWindowSubclass](v2, "_createAlertWindowSubclass");
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    visibleTripleClickItems = v2->_visibleTripleClickItems;
    v2->_visibleTripleClickItems = v3;

    -[AXSpringBoardServerHelper _performValidation](v2, "_performValidation");
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    location[1] = (id)MEMORY[0x24BDAC760];
    location[2] = (id)3221225472;
    location[3] = __33__AXSpringBoardServerHelper_init__block_invoke;
    location[4] = &unk_24DDE5830;
    v6 = v5;
    v53 = v6;
    v7 = v2;
    v54 = v7;
    AXPerformSafeBlock();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_appTransitionOccurred, CFSTR("com.apple.mobile.SubstantialTransition"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    notificationObservers = v7->_notificationObservers;
    v7->_notificationObservers = v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("SBOrientationLockChangedNotification"), 0, v12, &__block_literal_global_1153);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](v7->_notificationObservers, "addObject:", v13);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", CFSTR("SBMediaNowPlayingChangedNotification"), 0, v15, &__block_literal_global_1154);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](v7->_notificationObservers, "addObject:", v16);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BEB0F28];
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v18, 0, v19, &__block_literal_global_1155);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](v7->_notificationObservers, "addObject:", v20);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BEB0F40];
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserverForName:object:queue:usingBlock:", v22, 0, v23, &__block_literal_global_1156);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](v7->_notificationObservers, "addObject:", v24);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserverForName:object:queue:usingBlock:", CFSTR("AXVisualAlertEvent"), 0, v26, &__block_literal_global_1159);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](v7->_notificationObservers, "addObject:", v27);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserverForName:object:queue:usingBlock:", CFSTR("AXVisualAlertEventEnded"), 0, v29, &__block_literal_global_1169);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](v7->_notificationObservers, "addObject:", v30);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x24BEB0F00];
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserverForName:object:queue:usingBlock:", v32, 0, v33, &__block_literal_global_1171);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](v7->_notificationObservers, "addObject:", v34);
    objc_initWeak(location, v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BEB0F08];
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __33__AXSpringBoardServerHelper_init__block_invoke_3_1172;
    v50[3] = &unk_24DDE5A78;
    objc_copyWeak(&v51, location);
    objc_msgSend(v35, "addObserverForName:object:queue:usingBlock:", v37, 0, v36, v50);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](v7->_notificationObservers, "addObject:", v38);
    v39 = objc_alloc_init(AXSpringBoardServerAlertManager);
    -[AXSpringBoardServerHelper setAlertManager:](v7, "setAlertManager:", v39);

    v40 = +[AXSBHearingAidDeviceController sharedController](AXSBHearingAidDeviceController, "sharedController");
    v41 = objc_alloc_init(MEMORY[0x24BDFF760]);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_24DDF4EE0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAllowedTrackingTypes:", v42);

    v43 = objc_msgSend(objc_alloc(MEMORY[0x24BDFF768]), "initWithConfiguration:", v41);
    motionTrackingInputManager = v7->_motionTrackingInputManager;
    v7->_motionTrackingInputManager = (AXSSMotionTrackingInputManager *)v43;

    -[AXSpringBoardServerHelper motionTrackingInputManager](v7, "motionTrackingInputManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setDelegate:", v7);

    -[AXSpringBoardServerHelper motionTrackingInputManager](v7, "motionTrackingInputManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "startMonitoring");

    -[AXSpringBoardServerHelper _monitorContinuityDisplayChanges](v7, "_monitorContinuityDisplayChanges");
    v49 = v7;
    AXPerformBlockOnMainThreadAfterDelay();
    v47 = v49;

    objc_destroyWeak(&v51);
    objc_destroyWeak(location);

  }
  return v2;
}

uint64_t __33__AXSpringBoardServerHelper_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addActiveOrientationObserver:", *(_QWORD *)(a1 + 40));
}

void __33__AXSpringBoardServerHelper_init__block_invoke_2()
{
  id v0;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "springBoardActionOccurred:", 2);

}

void __33__AXSpringBoardServerHelper_init__block_invoke_3()
{
  id v0;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "springBoardActionOccurred:", 5);

}

void __33__AXSpringBoardServerHelper_init__block_invoke_4()
{
  id v0;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "springBoardActionOccurred:", 2);

}

void __33__AXSpringBoardServerHelper_init__block_invoke_5()
{
  id v0;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "springBoardActionOccurred:", 1);

}

void __33__AXSpringBoardServerHelper_init__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("bundleId");
  objc_msgSend(v2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleId"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_24DDEA460;
  if (v5)
    v7 = (const __CFString *)v5;
  v13[1] = CFSTR("visualAlertType");
  v14[0] = v7;
  objc_msgSend(v2, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visualAlertType"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &unk_24DDF4EC8;
  if (v9)
    v11 = (void *)v9;
  v14[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "springBoardActionOccurred:withPayload:", 9, v12);

}

void __33__AXSpringBoardServerHelper_init__block_invoke_1168()
{
  id v0;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "springBoardActionOccurred:withPayload:", 10, 0);

}

void __33__AXSpringBoardServerHelper_init__block_invoke_2_1170()
{
  id v0;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "springBoardActionOccurred:", 8);

}

void __33__AXSpringBoardServerHelper_init__block_invoke_3_1172(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sideAppManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisplayingApp");

  if ((v3 & 1) == 0)
  {
    +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "springBoardActionOccurred:", 3);

  }
}

uint64_t __33__AXSpringBoardServerHelper_init__block_invoke_1179(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restoreSecurePayFeaturesIfNeeded");
}

- (void)dealloc
{
  void *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  AXSpringBoardServerHelper *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __36__AXSpringBoardServerHelper_dealloc__block_invoke;
  v21 = &unk_24DDE5830;
  v4 = v3;
  v22 = v4;
  v23 = self;
  AXPerformSafeBlock();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_notificationObservers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObserver:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    }
    while (v7);
  }

  -[AXSpringBoardServerHelper motionTrackingInputManager](self, "motionTrackingInputManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopMonitoring");

  v13.receiver = self;
  v13.super_class = (Class)AXSpringBoardServerHelper;
  -[AXSpringBoardServerHelper dealloc](&v13, sel_dealloc);
}

uint64_t __36__AXSpringBoardServerHelper_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeActiveOrientationObserver:", *(_QWORD *)(a1 + 40));
}

- (AXSpringBoardServerSideAppManager)sideAppManager
{
  return +[AXSpringBoardServerSideAppManager sharedInstance](AXSpringBoardServerSideAppManager, "sharedInstance");
}

- (void)_restoreSecurePayFeaturesIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21AC77000, v0, v1, "Error unarchiving data blob for secure pay: %@", v2);
  OUTLINED_FUNCTION_2();
}

+ (id)_uiController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_uiController_AX_SBUIController;
  if (!_uiController_AX_SBUIController)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBUIController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_uiController_AX_SBUIController;
    _uiController_AX_SBUIController = v3;

    v2 = (void *)_uiController_AX_SBUIController;
  }
  return v2;
}

+ (id)_globalIdleTimeCoordinator
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_globalIdleTimeCoordinator_AX_SBIdleTimeController;
  if (!_globalIdleTimeCoordinator_AX_SBIdleTimeController)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBIdleTimerGlobalCoordinator")), "safeValueForKey:", CFSTR("sharedInstance"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_globalIdleTimeCoordinator_AX_SBIdleTimeController;
    _globalIdleTimeCoordinator_AX_SBIdleTimeController = v3;

    v2 = (void *)_globalIdleTimeCoordinator_AX_SBIdleTimeController;
  }
  return v2;
}

+ (id)_backlightController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_backlightController_AX_SBBacklightController;
  if (!_backlightController_AX_SBBacklightController)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBBacklightController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_backlightController_AX_SBBacklightController;
    _backlightController_AX_SBBacklightController = v3;

    v2 = (void *)_backlightController_AX_SBBacklightController;
  }
  return v2;
}

+ (id)_awayController
{
  void *v2;
  uint64_t v3;
  void *v4;
  char isKindOfClass;

  v2 = (void *)_awayController_AX_LockScreenController;
  if (!_awayController_AX_LockScreenController)
  {
    AXSBLockScreenViewController();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_awayController_AX_LockScreenController;
    _awayController_AX_LockScreenController = v3;

    NSClassFromString(CFSTR("SBLockScreenViewControllerBase"));
    isKindOfClass = objc_opt_isKindOfClass();
    v2 = (void *)_awayController_AX_LockScreenController;
    if ((isKindOfClass & 1) == 0)
    {
      _awayController_AX_LockScreenController = 0;

      v2 = (void *)_awayController_AX_LockScreenController;
    }
  }
  return v2;
}

+ (id)_lockScreenManager
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_lockScreenManager_AX_SBLockScreenManager;
  if (!_lockScreenManager_AX_SBLockScreenManager)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBLockScreenManager")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_lockScreenManager_AX_SBLockScreenManager;
    _lockScreenManager_AX_SBLockScreenManager = v3;

    v2 = (void *)_lockScreenManager_AX_SBLockScreenManager;
  }
  return v2;
}

+ (id)_iconController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_iconController_AX_SBIconController;
  if (!_iconController_AX_SBIconController)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBIconController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_iconController_AX_SBIconController;
    _iconController_AX_SBIconController = v3;

    v2 = (void *)_iconController_AX_SBIconController;
  }
  return v2;
}

+ (id)_assistantController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_assistantController_AX_SBAssistantController;
  if (!_assistantController_AX_SBAssistantController)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBAssistantController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_assistantController_AX_SBAssistantController;
    _assistantController_AX_SBAssistantController = v3;

    v2 = (void *)_assistantController_AX_SBAssistantController;
  }
  return v2;
}

+ (id)_syncController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_syncController_AX_SBSyncController;
  if (!_syncController_AX_SBSyncController)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSyncController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_syncController_AX_SBSyncController;
    _syncController_AX_SBSyncController = v3;

    v2 = (void *)_syncController_AX_SBSyncController;
  }
  return v2;
}

+ (id)_wallpaperController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_wallpaperController_AX_SBWallpaperController;
  if (!_wallpaperController_AX_SBWallpaperController)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBWallpaperController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_wallpaperController_AX_SBWallpaperController;
    _wallpaperController_AX_SBWallpaperController = v3;

    v2 = (void *)_wallpaperController_AX_SBWallpaperController;
  }
  return v2;
}

+ (id)_axActiveWindowScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("windowSceneManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("activeDisplayWindowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)serverInstance:(id)a3 showAlertType:(int)a4 withHandler:(id)a5 withData:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id alertHandler;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  int v21;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  -[AXSpringBoardServerHelper dismissAlertWithCancel](self, "dismissAlertWithCancel");
  v13 = (void *)objc_msgSend(v12, "copy");

  alertHandler = self->_alertHandler;
  self->_alertHandler = v13;

  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __79__AXSpringBoardServerHelper_serverInstance_showAlertType_withHandler_withData___block_invoke;
  v18[3] = &unk_24DDE5AA0;
  v21 = a4;
  v18[4] = self;
  v19 = v11;
  v20 = v10;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v15, "performAsynchronousWritingBlock:", v18);

}

uint64_t __79__AXSpringBoardServerHelper_serverInstance_showAlertType_withHandler_withData___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  switch(*(_DWORD *)(result + 56))
  {
    case 0:
      return objc_msgSend(*(id *)(result + 32), "_handleTripleClickAskAlert");
    case 1:
      return objc_msgSend(*(id *)(result + 32), "_handleZoomInBuddyAlert");
    case 2:
      return objc_msgSend(*(id *)(result + 32), "_handleZoomConflictAlert:", *(_QWORD *)(result + 40));
    case 3:
      return objc_msgSend(*(id *)(result + 32), "_handleZoomTripleClickAfterConflict");
    case 4:
      return objc_msgSend(*(id *)(result + 32), "_handleSwitchUsageConfirmed");
    case 5:
      return objc_msgSend(*(id *)(result + 32), "_handleVoiceOverUsageConfirmation");
    case 6:
      return objc_msgSend(*(id *)(result + 32), "_handleTouchAccommodationsUsageConfirmed");
    case 7:
      return objc_msgSend(*(id *)(result + 32), "_handleDisableBrightnessFiltersAlert:", *(_QWORD *)(result + 40));
    case 8:
      return objc_msgSend(*(id *)(result + 32), "handleBrokenHomeButtonAlert");
    case 9:
      return objc_msgSend(*(id *)(result + 32), "_handleDisableSwitchControlConfirmation");
    case 0xA:
      return objc_msgSend(*(id *)(result + 32), "_handleDisableAssistiveTouchConfirmation");
    case 0xB:
      return objc_msgSend(*(id *)(result + 32), "_handleConfirmRebootDevice");
    case 0xC:
      return objc_msgSend(*(id *)(result + 32), "_handleVONoHomeButtonGestureAlert");
    case 0xD:
      v1 = *(void **)(result + 32);
      v2 = 0;
      return objc_msgSend(v1, "_handleDisallowUSBRestrictedModeVOInformativeOnly:", v2);
    case 0xE:
      v3 = *(void **)(result + 32);
      v4 = 0;
      return objc_msgSend(v3, "_handleDisallowUSBRestrictedModeSCInformativeOnly:", v4);
    case 0xF:
      v1 = *(void **)(result + 32);
      v2 = 1;
      return objc_msgSend(v1, "_handleDisallowUSBRestrictedModeVOInformativeOnly:", v2);
    case 0x10:
      v3 = *(void **)(result + 32);
      v4 = 1;
      return objc_msgSend(v3, "_handleDisallowUSBRestrictedModeSCInformativeOnly:", v4);
    case 0x11:
      return objc_msgSend(*(id *)(result + 32), "_handleAlwaysOnBluetoothModeForVoiceOver");
    case 0x12:
      return objc_msgSend(*(id *)(result + 32), "_handleDisableFKAConfirmation");
    case 0x13:
      return objc_msgSend(*(id *)(result + 32), "_handleASTMenuFullForInstance:", *(_QWORD *)(result + 48));
    case 0x14:
      v5 = *(void **)(result + 32);
      v6 = 1;
      v7 = 0;
      goto LABEL_25;
    case 0x15:
      v5 = *(void **)(result + 32);
      v6 = 0;
      goto LABEL_28;
    case 0x16:
      v5 = *(void **)(result + 32);
      v6 = 1;
LABEL_28:
      v7 = 1;
LABEL_25:
      result = objc_msgSend(v5, "_handleASTMenuCustomizeAddDwell:addScroll:", v6, v7);
      break;
    case 0x17:
      result = objc_msgSend(*(id *)(result + 32), "_handleConnectedDevicesHaveAssistiveTouchCustomActions");
      break;
    case 0x18:
      result = objc_msgSend(*(id *)(result + 32), "_handleSecureItentAlertForSwitchAST");
      break;
    case 0x19:
      result = objc_msgSend(*(id *)(result + 32), "_handleLiveTranscriptionConfirmation");
      break;
    case 0x1A:
      result = objc_msgSend(*(id *)(result + 32), "_handleDisableOnDeviceEyeTrackingConfirmation");
      break;
    default:
      return result;
  }
  return result;
}

- (void)hideAlertWithServerInstance:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__AXSpringBoardServerHelper_hideAlertWithServerInstance___block_invoke;
  v5[3] = &unk_24DDE5710;
  v5[4] = self;
  objc_msgSend(v4, "performAsynchronousWritingBlock:", v5);

}

uint64_t __57__AXSpringBoardServerHelper_hideAlertWithServerInstance___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAlertController");
}

- (id)_serviceForRemoteViewType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 6)
    return 0;
  objc_msgSend(**((id **)&unk_24DDE63C0 + a3), "sharedInstance", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)serverInstance:(id)a3 showRemoteViewType:(int64_t)a4 withData:(id)a5
{
  -[AXSpringBoardServerHelper serverInstance:showRemoteViewType:withData:withPreviousViewDismissal:](self, "serverInstance:showRemoteViewType:withData:withPreviousViewDismissal:", a3, a4, a5, 1);
}

- (void)serverInstance:(id)a3 showRemoteViewType:(int64_t)a4 withData:(id)a5 withPreviousViewDismissal:(BOOL)a6
{
  _BOOL8 v6;
  void *v9;
  void *v10;
  id v11;

  v6 = a6;
  v11 = a5;
  -[AXSpringBoardServerHelper _serviceForRemoteViewType:](self, "_serviceForRemoteViewType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[AXSpringBoardServerHelper alertManager](self, "alertManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "showAXUIViewService:withData:withPreviousViewDismissal:", v9, v11, v6);

  }
}

- (void)serverInstance:(id)a3 hideRemoteViewType:(int64_t)a4
{
  void *v5;
  id v6;

  -[AXSpringBoardServerHelper _serviceForRemoteViewType:](self, "_serviceForRemoteViewType:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[AXSpringBoardServerHelper alertManager](self, "alertManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hideAXUIViewService:", v6);

  }
}

- (BOOL)serverInstance:(id)a3 isShowingRemoteViewType:(int64_t)a4
{
  void *v5;
  void *v6;
  char v7;

  -[AXSpringBoardServerHelper _serviceForRemoteViewType:](self, "_serviceForRemoteViewType:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AXSpringBoardServerHelper alertManager](self, "alertManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isShowingAXUIViewService:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isVoiceControlRunningWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__AXSpringBoardServerHelper_isVoiceControlRunningWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __69__AXSpringBoardServerHelper_isVoiceControlRunningWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (-[objc_class safeBoolForKey:](NSClassFromString(CFSTR("SBAssistantController")), "safeBoolForKey:", CFSTR("isVisible")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    if (!_UIActionSheetDismissDuration_block_invoke_SBVoiceControlOverlayClass)
      _UIActionSheetDismissDuration_block_invoke_SBVoiceControlOverlayClass = (uint64_t)NSClassFromString(CFSTR("SBVoiceControlTransientOverlayViewController"));
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainWorkspace")), "safeValueForKey:", CFSTR("_instanceIfExists"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("transientOverlayPresentationManager"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safeValueForKey:", CFSTR("topmostPresentedViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_opt_isKindOfClass() & 1;

  }
}

- (double)volumeLevelWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  double v5;
  _QWORD v7[5];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__AXSpringBoardServerHelper_volumeLevelWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE5AC8;
  v7[4] = &v8;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __59__AXSpringBoardServerHelper_volumeLevelWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  float v5;

  if (CFAbsoluteTimeGetCurrent() - *(double *)&_LastVolumeDisplay >= 1.0)
  {
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0.0;
    v4 = 0;
    objc_msgSend(v2, "getActiveCategoryVolume:andName:", &v5, &v4);
    v3 = v4;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;

  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(float *)&_CurrentVolume;
  }
}

- (BOOL)isReachabilityActive
{
  void *v2;
  char v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBReachabilityManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("reachabilityModeActive"));

  return v3;
}

- (void)setReachabilityActive:(BOOL)a3
{
  int v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[16];

  v3 = a3;
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBReachabilityManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("_reachabilityModeActive")) == v3)
  {
    AXLogSpringboardServer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AC77000, v5, OS_LOG_TYPE_INFO, "reachability state same as desired change, doing nothing", buf, 2u);
    }
  }
  else
  {
    v6 = v4;
    AXPerformSafeBlock();
    v5 = v6;
  }

}

uint64_t __51__AXSpringBoardServerHelper_setReachabilityActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleReachability");
}

- (BOOL)isRingerMutedWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__AXSpringBoardServerHelper_isRingerMutedWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __61__AXSpringBoardServerHelper_isRingerMutedWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("ringerControl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "safeBoolForKey:", CFSTR("_accessibilityIsRingerMuted"));
}

- (BOOL)isOrientationLockedWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__AXSpringBoardServerHelper_isOrientationLockedWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __67__AXSpringBoardServerHelper_isOrientationLockedWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBOrientationLockManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isUserLocked"));

}

- (void)serverInstance:(id)a3 setOrientation:(int64_t)a4
{
  objc_msgSend(MEMORY[0x24BDFFAB0], "setOrientation:", a4);
}

- (void)serverInstance:(id)a3 setOrientationLocked:(BOOL)a4
{
  AXPerformSafeBlock();
}

void __65__AXSpringBoardServerHelper_serverInstance_setOrientationLocked___block_invoke()
{
  id v0;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBOrientationLockManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lock");

}

void __65__AXSpringBoardServerHelper_serverInstance_setOrientationLocked___block_invoke_2()
{
  id v0;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBOrientationLockManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "unlock");

}

- (void)openCustomGestureCreationForASTWithServerInstance:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __79__AXSpringBoardServerHelper_openCustomGestureCreationForASTWithServerInstance___block_invoke(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=TOUCH_REACHABILITY_TITLE/AIR_TOUCH_TITLE/CreateCustomGesture"));
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "applicationOpenURL:", v1);

  }
}

- (void)openMenuCustomizationForASTWithServerInstance:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __75__AXSpringBoardServerHelper_openMenuCustomizationForASTWithServerInstance___block_invoke(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=TOUCH_REACHABILITY_TITLE/AIR_TOUCH_TITLE/AssistiveTouchCustomize"));
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "applicationOpenURL:", v1);

  }
}

- (void)openCustomGestureCreationForSCATWithServerInstance:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __80__AXSpringBoardServerHelper_openCustomGestureCreationForSCATWithServerInstance___block_invoke(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=ScannerSwitchTitle/CustomGesturesIdentifier/CreateCustomGesture"));
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "applicationOpenURL:", v1);

  }
}

- (void)openCommandAndControlSettingsWithServerInstance:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __77__AXSpringBoardServerHelper_openCommandAndControlSettingsWithServerInstance___block_invoke(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=CommandAndControlTitle"));
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "applicationOpenURL:", v1);

  }
}

- (void)openCommandAndControlCommandsWithServerInstance:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __77__AXSpringBoardServerHelper_openCommandAndControlCommandsWithServerInstance___block_invoke(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=CommandAndControlTitle/COMMAND_AND_CONTROL_COMMANDS"));
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "applicationOpenURL:", v1);

  }
}

- (void)openCommandAndControlVocabularyWithServerInstance:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __79__AXSpringBoardServerHelper_openCommandAndControlVocabularyWithServerInstance___block_invoke(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=CommandAndControlTitle/COMMAND_AND_CONTROL_VOCABULARY/VOCABULARY"));
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "applicationOpenURL:", v1);

  }
}

- (BOOL)isScreenLockedWithServerInstance:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE006F0], "server", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScreenLockedWithPasscode:", 0);

  return v4;
}

- (BOOL)isCarPlayConnected
{
  CARSessionStatus *carSessionStatus;
  CARSessionStatus *v4;
  CARSessionStatus *v5;
  void *v6;
  BOOL v7;

  carSessionStatus = self->_carSessionStatus;
  if (!carSessionStatus)
  {
    v4 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x24BE15240]);
    v5 = self->_carSessionStatus;
    self->_carSessionStatus = v4;

    carSessionStatus = self->_carSessionStatus;
  }
  -[CARSessionStatus currentSession](carSessionStatus, "currentSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (BOOL)isSystemSleepingWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__AXSpringBoardServerHelper_isSystemSleepingWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE57E0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v7);

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __64__AXSpringBoardServerHelper_isSystemSleepingWithServerInstance___block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  SBAXBacklightControllerInstance();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("screenIsOn")) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(*(id *)(a1 + 32), "isCarPlayConnected") ^ 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (BOOL)isMakingEmergencyCallWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__AXSpringBoardServerHelper_isMakingEmergencyCallWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __69__AXSpringBoardServerHelper_isMakingEmergencyCallWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  AXSBLockScreenEnvironment();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("callController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isMakingEmergencyCall"));

}

- (BOOL)isPasscodeRequiredOnLockWithServerInstance:(id)a3
{
  void *v3;
  BOOL v5;

  v5 = 0;
  objc_msgSend(MEMORY[0x24BE006F0], "server", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isScreenLockedWithPasscode:", &v5);

  return v5;
}

- (void)isMediaPlayingWithServerInstance:(id)a3 forBundleId:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a5;
  if (isMediaPlayingWithServerInstance_forBundleId_completion__onceToken != -1)
    dispatch_once(&isMediaPlayingWithServerInstance_forBundleId_completion__onceToken, &__block_literal_global_1222);
  MRMediaRemoteGetLocalOrigin();
  v10 = v6;
  v11 = v7;
  v8 = v7;
  v9 = v6;
  MRMediaRemoteGetNowPlayingClientForOrigin();

}

void __85__AXSpringBoardServerHelper_isMediaPlayingWithServerInstance_forBundleId_completion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("media-retrieval-ax-queue", 0);
  v1 = (void *)isMediaPlayingWithServerInstance_forBundleId_completion__queue;
  isMediaPlayingWithServerInstance_forBundleId_completion__queue = (uint64_t)v0;

}

void __85__AXSpringBoardServerHelper_isMediaPlayingWithServerInstance_forBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  if (!a3)
  {
    MRNowPlayingClientGetBundleIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0
      || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDFE410])
      && ((objc_msgSend(v4, "hasPrefix:", *MEMORY[0x24BDFE428]) & 1) != 0
       || (objc_msgSend(v4, "hasPrefix:", *MEMORY[0x24BDFE430]) & 1) != 0)
      || !objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      MRMediaRemoteGetLocalOrigin();
      v5 = *(id *)(a1 + 40);
      MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

uint64_t __85__AXSpringBoardServerHelper_isMediaPlayingWithServerInstance_forBundleId_completion___block_invoke_3(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1);
}

- (void)resetDimTimerWithServerInstance:(id)a3
{
  AXPerformBlockOnMainThread();
}

uint64_t __61__AXSpringBoardServerHelper_resetDimTimerWithServerInstance___block_invoke()
{
  return AXPerformSafeBlock();
}

void __61__AXSpringBoardServerHelper_resetDimTimerWithServerInstance___block_invoke_2()
{
  id v0;

  objc_msgSend((id)objc_opt_class(), "_globalIdleTimeCoordinator");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resetIdleTimerForReason:", CFSTR("AccessibilityTimerReset"));

}

- (void)openAppSwitcherWithServerInstance:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  BOOL v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _BYTE buf[24];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AXLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AC77000, v4, OS_LOG_TYPE_DEFAULT, "AXSBServer handling openAppSwitcher", buf, 2u);
  }

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSystemGestureManager")), "safeValueForKey:", CFSTR("mainDisplayManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v17 = 0;
  v6 = v5;
  AXPerformSafeBlock();
  v7 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0;

  _Block_object_dispose(buf, 8);
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v17 = 0;
    v15 = v6;
    AXPerformSafeBlock();
    v8 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isGuidedAccessActive");

  if (v10 | !v8)
  {
    AXLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_21AC77000, v11, OS_LOG_TYPE_DEFAULT, "AXSBServer: will not perform openAppSwitcher. gaxActive=%@ generallyAllowed=%@", buf, 0x16u);

    }
  }
  else
  {
    v14 = v3;
    AXPerformBlockOnMainThread();

  }
}

uint64_t __63__AXSpringBoardServerHelper_openAppSwitcherWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isGestureWithTypeAllowed:", 45);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__AXSpringBoardServerHelper_openAppSwitcherWithServerInstance___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isGestureWithTypeAllowed:", 2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __63__AXSpringBoardServerHelper_openAppSwitcherWithServerInstance___block_invoke_1229(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    AXLogCommon();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_21AC77000, v1, OS_LOG_TYPE_DEFAULT, "AXSBServer: will not perform openAppSwitcher. screen appears to be locked", v2, 2u);
    }

  }
  else
  {
    AXPerformSafeBlock();
  }
}

void __63__AXSpringBoardServerHelper_openAppSwitcherWithServerInstance___block_invoke_2_1230()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  AXLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21AC77000, v0, OS_LOG_TYPE_DEFAULT, "AXSBServer: Will ask app to invoke _handleOpenAppSwitcherShortcut: to reveal app switcher", v2, 2u);
  }

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_handleOpenAppSwitcherShortcut:", 0);

}

- (void)simulateEdgePressHaptics:(id)a3
{
  AXPerformBlockOnMainThread();
}

void __54__AXSpringBoardServerHelper_simulateEdgePressHaptics___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_tapticEngine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "actuateFeedback:", 0);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_tapticEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actuateFeedback:", 1);

}

- (void)toggleAppLibraryWithServerInstance:(id)a3
{
  AXPerformSafeBlock();
}

void __64__AXSpringBoardServerHelper_toggleAppLibraryWithServerInstance___block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  if (-[objc_class safeBoolForKey:](NSClassFromString(CFSTR("SBFloatingDockController")), "safeBoolForKey:", CFSTR("isFloatingDockSupported")))
  {
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "_toggleAppLibraryVisibility:", 0);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_iconController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safeValueForKey:", CFSTR("iconManager"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXSpringBoardServerHelper _axActiveWindowScene](AXSpringBoardServerHelper, "_axActiveWindowScene");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentLibraryForIconManager:windowScene:animated:", v0, v1, 1);

  }
}

- (void)toggleQuickNoteWithServerInstance:(id)a3
{
  AXPerformSafeBlock();
}

uint64_t __63__AXSpringBoardServerHelper_toggleQuickNoteWithServerInstance___block_invoke()
{
  return objc_msgSend((id)*MEMORY[0x24BEBDF78], "_handleSystemNotesPIPKeyShortcut:", 0);
}

- (BOOL)dismissSiriWithServerInstance:(id)a3
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v3 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  AXPerformBlockOnMainThread();
  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

uint64_t __59__AXSpringBoardServerHelper_dismissSiriWithServerInstance___block_invoke()
{
  return AXPerformSafeBlock();
}

void __59__AXSpringBoardServerHelper_dismissSiriWithServerInstance___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  +[AXSpringBoardServerHelper _assistantController](AXSpringBoardServerHelper, "_assistantController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[AXSpringBoardServerHelper _axActiveWindowScene](AXSpringBoardServerHelper, "_axActiveWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAssistantViewIfNecessaryInWindowScene:", v2);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (void)openVoiceControlWithServerInstance:(id)a3
{
  id v3;
  id v4;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBVoiceControlController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[objc_class safeBoolForKey:](NSClassFromString(CFSTR("SBVoiceControlController")), "safeBoolForKey:", CFSTR("isVisible")) & 1) == 0)v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("handleHomeButtonHeld"));

}

- (void)openTypeToSiriWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getSiriSimpleActivationSourceClass_softClass;
  v11 = getSiriSimpleActivationSourceClass_softClass;
  if (!getSiriSimpleActivationSourceClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getSiriSimpleActivationSourceClass_block_invoke;
    v7[3] = &unk_24DDE5AC8;
    v7[4] = &v8;
    __getSiriSimpleActivationSourceClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "activateFromSource:", 47);

}

- (void)armApplePayWithServerInstance:(id)a3
{
  AXPerformBlockOnMainThread();
}

void __59__AXSpringBoardServerHelper_armApplePayWithServerInstance___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPKPassLibraryClass_softClass;
  v7 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPKPassLibraryClass_block_invoke;
    v3[3] = &unk_24DDE5AC8;
    v3[4] = &v4;
    __getPKPassLibraryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  objc_msgSend(v1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentContactlessInterfaceForDefaultPassFromSource:completion:", 0, 0);

}

- (BOOL)isScreenshotWindowVisibleWithServerInstance:(id)a3
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v3 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  AXPerformBlockOnMainThread();
  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

void __73__AXSpringBoardServerHelper_isScreenshotWindowVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("_screenCapturer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_serviceWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_hostViewControllerIfExists"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _SBAXIsViewVisible(v6);

}

- (BOOL)isNotificationVisibleWithServerInstance:(id)a3
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v3 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  AXPerformBlockOnMainThread();
  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

uint64_t __69__AXSpringBoardServerHelper_isNotificationVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "accessibilityIsNotificationVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isBannerVisibleWithServerInstance:(id)a3
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v3 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  AXPerformBlockOnMainThread();
  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

uint64_t __63__AXSpringBoardServerHelper_isBannerVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "accessibilityIsBannerVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isLongLookNotificationVisibleWithServerInstance:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("notificationDispatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("bannerDestination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "safeBoolForKey:", CFSTR("isPresentingBannerInLongLook")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("dashBoardDestination"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("isPresentingNotificationInLongLook"));

  }
  return v5;
}

- (BOOL)isRemoteTransientOverlayVisibleWithServerInstance:(id)a3
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v3 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  AXPerformBlockOnMainThread();
  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v4;
}

uint64_t __79__AXSpringBoardServerHelper_isRemoteTransientOverlayVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "accessibilityIsRemoteTransientOverlayVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)toggleNotificationCenterWithServerInstance:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

uint64_t __72__AXSpringBoardServerHelper_toggleNotificationCenterWithServerInstance___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  AXLogSpringboardServer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isNotificationCenterVisibleWithServerInstance:", *(_QWORD *)(a1 + 40));
    v5[0] = 67109120;
    v5[1] = v3 ^ 1;
    _os_log_impl(&dword_21AC77000, v2, OS_LOG_TYPE_INFO, "toggle NC: will show %d", (uint8_t *)v5, 8u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityShowNotificationCenter:serverInstance:", objc_msgSend(*(id *)(a1 + 32), "isNotificationCenterVisibleWithServerInstance:", *(_QWORD *)(a1 + 40)) ^ 1, *(_QWORD *)(a1 + 40));
}

- (BOOL)isNotificationCenterVisibleWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__AXSpringBoardServerHelper_isNotificationCenterVisibleWithServerInstance___block_invoke;
  v11[3] = &unk_24DDE5C20;
  v11[4] = self;
  v13 = &v14;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v11);

  AXLogSpringboardServer();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *((unsigned __int8 *)v15 + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v8;
    _os_log_impl(&dword_21AC77000, v7, OS_LOG_TYPE_INFO, "NC center is visible: %d", buf, 8u);
  }

  v9 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __75__AXSpringBoardServerHelper_isNotificationCenterVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "coverSheetViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("mainPageContentViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("combinedListViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_structuredListViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("listModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isNotificationHistoryRevealed"));

  if (objc_msgSend(*(id *)(a1 + 32), "isCoverSheetVisibleWithServerInstance:", *(_QWORD *)(a1 + 40))
    && (v6 & 1) != 0)
  {
    objc_msgSend(v10, "safeValueForKey:", CFSTR("coverSheetView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("scrollView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "safeUnsignedIntegerForKey:", CFSTR("currentPageIndex"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9 == objc_msgSend(v10, "safeUnsignedIntegerForKey:", CFSTR("_indexOfMainPage"));

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (BOOL)isCoverSheetVisibleWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__AXSpringBoardServerHelper_isCoverSheetVisibleWithServerInstance___block_invoke;
  v10[3] = &unk_24DDE5C48;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v10);

  AXLogSpringboardServer();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *((unsigned __int8 *)v12 + 24);
    *(_DWORD *)buf = 67109120;
    v16 = v7;
    _os_log_impl(&dword_21AC77000, v6, OS_LOG_TYPE_INFO, "CS is visible: %d", buf, 8u);
  }

  v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __67__AXSpringBoardServerHelper_isCoverSheetVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityCoverSheetPresentationManagerSharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("coverSheetSlidingViewControllerIfLoaded"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "safeIntForKey:", CFSTR("_appearState")) != 0;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isInSecureApp")) ^ 1;

}

- (BOOL)serverInstance:(id)a3 showNotificationCenter:(BOOL)a4
{
  id v4;
  dispatch_semaphore_t v5;
  char v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = dispatch_semaphore_create(0);
  v8 = v4;
  v9 = v5;
  AXPerformBlockOnMainThread();
  dispatch_semaphore_wait(v9, 5uLL);

  v6 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v6;
}

intptr_t __67__AXSpringBoardServerHelper_serverInstance_showNotificationCenter___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_accessibilityShowNotificationCenter:serverInstance:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)serverInstance:(id)a3 setReachabilityEnabled:(BOOL)a4
{
  AXPerformSafeBlock();
}

void __67__AXSpringBoardServerHelper_serverInstance_setReachabilityEnabled___block_invoke(uint64_t a1)
{
  id v2;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBReachabilityManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReachabilityEnabled:", *(unsigned __int8 *)(a1 + 32));

}

- (BOOL)serverInstance:(id)a3 showControlCenter:(BOOL)a4
{
  id v4;
  char v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7 = dispatch_semaphore_create(0);
  AXPerformBlockOnMainThread();
  dispatch_semaphore_wait(v7, 5uLL);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

intptr_t __62__AXSpringBoardServerHelper_serverInstance_showControlCenter___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "accessibilityShowControlCenter:", *(unsigned __int8 *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)isControlCenterVisibleWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__AXSpringBoardServerHelper_isControlCenterVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __70__AXSpringBoardServerHelper_isControlCenterVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBControlCenterController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isPresented"));

}

- (void)toggleDockWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (!-[AXSpringBoardServerHelper isScreenLockedWithServerInstance:](self, "isScreenLockedWithServerInstance:", v4))
  {
    objc_msgSend(MEMORY[0x24BE005C0], "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isGuidedAccessActive");

    if (v6)
    {
      GAXLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AC77000, v7, OS_LOG_TYPE_DEFAULT, "Can't toggle dock. GAX is active.", buf, 2u);
      }

    }
    else
    {
      v8 = v4;
      AXPerformBlockOnMainThread();

    }
  }

}

void __58__AXSpringBoardServerHelper_toggleDockWithServerInstance___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

}

void __58__AXSpringBoardServerHelper_toggleDockWithServerInstance___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_axFloatingDockController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("_allowGestureRecognizers")))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isDockVisibleWithServerInstance:", *(_QWORD *)(a1 + 40)))
      objc_msgSend(v2, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, 0);
    else
      objc_msgSend(v2, "presentFloatingDockIfDismissedAnimated:completionHandler:", 1, 0);
  }

}

- (BOOL)isStatusBarNativeFocusableWithServerInstance:(id)a3 includingNonDismissableElements:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  BOOL v12;

  if (!_AXSApplicationAccessibilityEnabled())
    return 0;
  if (!isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements__HasLoadedUIAccessibility)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements__HasLoadedUIAccessibility = objc_opt_respondsToSelector() & 1;

    if (!isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements__HasLoadedUIAccessibility)
      return 0;
  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityStatusBarElements:sorted:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __106__AXSpringBoardServerHelper_isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements___block_invoke;
  v11[3] = &__block_descriptor_33_e11_B24__0_8Q16l;
  v12 = a4;
  objc_msgSend(v7, "axFilterObjectsUsingBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count") != 0;
  return v9;
}

BOOL __106__AXSpringBoardServerHelper_isStatusBarNativeFocusableWithServerInstance_includingNonDismissableElements___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "_accessibilityIsNonDismissableStatusBarElement");
  v5 = objc_msgSend(v3, "accessibilityRespondsToUserInteraction");

  if ((_DWORD)v5 && v4)
    return *(_BYTE *)(a1 + 32) != 0;
  return v5;
}

- (BOOL)isSiriVisibleWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__AXSpringBoardServerHelper_isSiriVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

uint64_t __61__AXSpringBoardServerHelper_isSiriVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[objc_class safeBoolForKey:](NSClassFromString(CFSTR("SBAssistantController")), "safeBoolForKey:", CFSTR("isVisible"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)_axFloatingDockController
{
  void *v2;
  void *v3;

  +[AXSpringBoardServerHelper _axActiveWindowScene](AXSpringBoardServerHelper, "_axActiveWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("floatingDockController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isDockVisibleWithServerInstance:(id)a3
{
  id v3;
  char v5;

  v3 = a3;
  v5 = 0;
  AXSessionIsLoginSession();

  return 0;
}

void __61__AXSpringBoardServerHelper_isDockVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_axFloatingDockController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isFloatingDockFullyPresented")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPresentingFolder"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (BOOL)isShowingNonSystemAppWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__AXSpringBoardServerHelper_isShowingNonSystemAppWithServerInstance___block_invoke;
  v8[3] = &unk_24DDE5D00;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v8);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

uint64_t __69__AXSpringBoardServerHelper_isShowingNonSystemAppWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isShowingHomescreenWithServerInstance:", *(_QWORD *)(a1 + 40));
  if ((result & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)),
        (result & 1) != 0)
    || (result = objc_msgSend(*(id *)(a1 + 32), "isSystemAppShowingAnAlertWithServerInstance:", *(_QWORD *)(a1 + 40)),
        (result & 1) != 0)
    || (result = objc_msgSend(*(id *)(a1 + 32), "isControlCenterVisibleWithServerInstance:", *(_QWORD *)(a1 + 40)),
        (result & 1) != 0))
  {
    v3 = 0;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isAppSwitcherVisibleWithServerInstance:", *(_QWORD *)(a1 + 40));
    v3 = result ^ 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (BOOL)isPasscodeLockVisibleWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__AXSpringBoardServerHelper_isPasscodeLockVisibleWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE57E0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v7);

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __69__AXSpringBoardServerHelper_isPasscodeLockVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isPasscodeLockVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isLockScreenVisibleWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__AXSpringBoardServerHelper_isLockScreenVisibleWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE57E0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v7);

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __67__AXSpringBoardServerHelper_isLockScreenVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isLockScreenVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isShowingHomescreenWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;
  char v8;

  v4 = a3;
  if (-[AXSpringBoardServerHelper isSystemAppShowingAnAlertWithServerInstance:](self, "isSystemAppShowingAnAlertWithServerInstance:", v4))
  {
    AXFrontBoardSystemAppAlertWindow();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SBHomeScreenWindow"));
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 1;
  }
  v7 = -[AXSpringBoardServerHelper isAppSwitcherPeekingWithServerInstance:](self, "isAppSwitcherPeekingWithServerInstance:", v4);
  v8 = objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeBoolForKey:", CFSTR("isShowingHomescreen")) & isKindOfClass | v7;

  return v8;
}

- (BOOL)isContinuitySessionActiveWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__AXSpringBoardServerHelper_isContinuitySessionActiveWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE57E0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v7);

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __73__AXSpringBoardServerHelper_isContinuitySessionActiveWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "contintuityDisplayIsActive");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_monitorContinuityDisplayChanges
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BE38448], "configurationForContinuityDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUserInteractivePriority:", 1);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__AXSpringBoardServerHelper__monitorContinuityDisplayChanges__block_invoke;
  v5[3] = &unk_24DDE5D28;
  v5[4] = self;
  objc_msgSend(v3, "setTransitionHandler:", v5);
  objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpringBoardServerHelper setContinuityDisplayMonitor:](self, "setContinuityDisplayMonitor:", v4);

}

void __61__AXSpringBoardServerHelper__monitorContinuityDisplayChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _BOOL8 v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4 != 0;
  v6 = v5 ^ objc_msgSend(*(id *)(a1 + 32), "contintuityDisplayIsActive");
  objc_msgSend(*(id *)(a1 + 32), "setContintuityDisplayIsActive:", v5);
  AXLogSpringboardServer();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_21AC77000, v7, OS_LOG_TYPE_INFO, "Continuity state changed, is active: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BED2738], 0, 0, 1u);
  }

}

- (BOOL)isTypeToSiriVisibleWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__AXSpringBoardServerHelper_isTypeToSiriVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __67__AXSpringBoardServerHelper_isTypeToSiriVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  char v7;
  char v8;
  id v9;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBAssistantController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("currentSession"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("presentationContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v9, "safeBoolForKey:", CFSTR("isSystemAssistantExperienceEnabled"));
  v5 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isAssistantPresented"));
  v6 = objc_msgSend(v3, "safeIntForKey:", CFSTR("modality"));
  v7 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isKeyboardVisible"));
  if (v6 == 2)
    v8 = v7;
  else
    v8 = 0;
  if (!v5)
    v8 = 0;
  if (!v4)
    v8 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;

}

- (BOOL)isAppSwitcherVisibleWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__AXSpringBoardServerHelper_isAppSwitcherVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __68__AXSpringBoardServerHelper_isAppSwitcherVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isAnySwitcherVisible"));

}

- (BOOL)isAppSwitcherPeekingWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__AXSpringBoardServerHelper_isAppSwitcherPeekingWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __68__AXSpringBoardServerHelper_isAppSwitcherPeekingWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("_activeDisplaySwitcherController._currentLayoutState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "safeIntegerForKey:", CFSTR("peekConfiguration")) >= 2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

- (BOOL)isShelfSwitcherVisibleWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__AXSpringBoardServerHelper_isShelfSwitcherVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __70__AXSpringBoardServerHelper_isShelfSwitcherVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("_activeDisplaySwitcherController.contentViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeDictionaryForKey:", CFSTR("visibleShelves"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "count") != 0;

}

- (BOOL)isStageManagerSwitcherVisibleWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__AXSpringBoardServerHelper_isStageManagerSwitcherVisibleWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __77__AXSpringBoardServerHelper_isStageManagerSwitcherVisibleWithServerInstance___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("windowSceneManager"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v2;
  objc_msgSend(v2, "safeSetForKey:", CFSTR("connectedWindowScenes"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "safeValueForKey:", CFSTR("switcherController"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "safeBoolForKey:", CFSTR("isChamoisWindowingUIEnabled")))
        {
          objc_msgSend(v8, "safeValueForKey:", CFSTR("_currentLayoutState"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "safeIntegerForKey:", CFSTR("unlockedEnvironmentMode"));

          if (v10 == 3)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

            goto LABEL_12;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)dismissAppSwitcherWithServerInstance:(id)a3
{
  AXPerformBlockOnMainThread();
}

uint64_t __66__AXSpringBoardServerHelper_dismissAppSwitcherWithServerInstance___block_invoke()
{
  return AXPerformSafeBlock();
}

void __66__AXSpringBoardServerHelper_dismissAppSwitcherWithServerInstance___block_invoke_2()
{
  id v0;

  -[objc_class safeValueForKeyPath:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKeyPath:", CFSTR("sharedInstance._activeDisplaySwitcherController"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dismissMainAndFloatingSwitchersWithSource:animated:", 18, 1);

}

- (void)dismissShelfSwitcherWithServerInstance:(id)a3
{
  AXPerformBlockOnMainThread();
}

uint64_t __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke()
{
  return AXPerformSafeBlock();
}

void __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeValueForKeyPath:", CFSTR("_activeDisplaySwitcherController.contentViewController"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeDictionaryForKey:", CFSTR("visibleShelves"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v1, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v21 = v6;
        v22 = 3221225472;
        v23 = __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_3;
        v24 = &unk_24DDE5710;
        v25 = v8;
        AXPerformSafeBlock();
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v4);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  AXUIApplicationWindows();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        NSClassFromString(CFSTR("SBMainSwitcherWindow"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_1277);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "enumerateObjectsUsingBlock:", &__block_literal_global_1279);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
    }
    while (v11);
  }

  UIAccessibilityPostNotification(*MEMORY[0x24BEBDE88], 0);
}

uint64_t __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissShelfForAccessibilityTransition");
}

uint64_t __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __68__AXSpringBoardServerHelper_dismissShelfSwitcherWithServerInstance___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_topAffordanceViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("isExpanded")))
    objc_msgSend(v2, "dismissAnimated:", 1);

}

- (BOOL)isSyncingRestoringResettingOrUpdatingWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __85__AXSpringBoardServerHelper_isSyncingRestoringResettingOrUpdatingWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __85__AXSpringBoardServerHelper_isSyncingRestoringResettingOrUpdatingWithServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSyncController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("isInUse"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

- (BOOL)isSystemGestureActiveWithServerInstance:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "_iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("iconManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "safeBoolForKey:", CFSTR("isIconDragging")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSystemGestureManager")), "safeValueForKey:", CFSTR("mainDisplayManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("isAnyTouchGestureRunning"));

  }
  return v5;
}

- (BOOL)isSpeakThisTemporarilyDisabledWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__AXSpringBoardServerHelper_isSpeakThisTemporarilyDisabledWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __78__AXSpringBoardServerHelper_isSpeakThisTemporarilyDisabledWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "_accessibilityIsSpeakThisTemporarilyDisabled");

}

- (BOOL)areSystemGesturesDisabledNativelyWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__AXSpringBoardServerHelper_areSystemGesturesDisabledNativelyWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __81__AXSpringBoardServerHelper_areSystemGesturesDisabledNativelyWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "_accessibilityIsSystemGestureActive");

}

- (BOOL)areSystemGesturesDisabledByAccessibilityWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __88__AXSpringBoardServerHelper_areSystemGesturesDisabledByAccessibilityWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __88__AXSpringBoardServerHelper_areSystemGesturesDisabledByAccessibilityWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "_accessibilitySystemGesturesDisabledByAccessibility");

}

- (id)serverInstance:(id)a3 springBoardSystemInfoQuery:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  AXSpringBoardServerHelper *v16;
  id v17;
  unint64_t v18;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__AXSpringBoardServerHelper_serverInstance_springBoardSystemInfoQuery___block_invoke;
  v14[3] = &unk_24DDE5E50;
  v18 = a4;
  v9 = v7;
  v15 = v9;
  v16 = self;
  v17 = v6;
  v10 = v6;
  objc_msgSend(v8, "performSynchronousReadingBlock:", v14);

  v11 = v17;
  v12 = v9;

  return v12;
}

void __71__AXSpringBoardServerHelper_serverInstance_springBoardSystemInfoQuery___block_invoke(uint64_t a1)
{
  uint64_t v2;
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
  id v19;

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "areSystemGesturesDisabledNativelyWithServerInstance:", *(_QWORD *)(a1 + 48)));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, &unk_24DDF4EF8);

    v2 = *(_QWORD *)(a1 + 56);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "areSystemGesturesDisabledByAccessibilityWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, &unk_24DDF4EF8);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(*(id *)(a1 + 40), "installedAppsWithServerInstance:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, &unk_24DDF4F10);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isPasscodeRequiredOnLockWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, &unk_24DDF4F28);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x10) == 0)
  {
LABEL_6:
    if ((v2 & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isAppSwitcherVisibleWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, &unk_24DDF4F40);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x10000) == 0)
  {
LABEL_7:
    if ((v2 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isTypeToSiriVisibleWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, &unk_24DDF4F58);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x20) == 0)
  {
LABEL_8:
    if ((v2 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSiriVisibleWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, &unk_24DDF4F70);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x40) == 0)
  {
LABEL_9:
    if ((v2 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, &unk_24DDF4F88);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x80) == 0)
  {
LABEL_10:
    if ((v2 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMakingEmergencyCallWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, &unk_24DDF4FA0);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x100) == 0)
  {
LABEL_11:
    if ((v2 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isNotificationCenterVisibleWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, &unk_24DDF4FB8);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x200) == 0)
  {
LABEL_12:
    if ((v2 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "purpleBuddyPIDWithServerInstance:", *(_QWORD *)(a1 + 48)) != -1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, &unk_24DDF4FD0);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x400) == 0)
  {
LABEL_13:
    if ((v2 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemAppFrontmostExcludingSiri:withServerInstance:", 0, *(_QWORD *)(a1 + 48)));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, &unk_24DDF4FE8);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x800) == 0)
  {
LABEL_14:
    if ((v2 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemSleepingWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, &unk_24DDF5000);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x1000) == 0)
  {
LABEL_15:
    if ((v2 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSyncingRestoringResettingOrUpdatingWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, &unk_24DDF5018);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x2000) == 0)
  {
LABEL_16:
    if ((v2 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemAppFrontmostExcludingSiri:withServerInstance:", 1, *(_QWORD *)(a1 + 48)));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, &unk_24DDF5030);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x4000) == 0)
  {
LABEL_17:
    if ((v2 & 0x8000) == 0)
      return;
LABEL_35:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSystemGestureActiveWithServerInstance:", *(_QWORD *)(a1 + 48)));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v19, &unk_24DDF5060);

    return;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSyncingRestoringResettingOrUpdatingWithServerInstance:", *(_QWORD *)(a1 + 48)));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, &unk_24DDF5048);

  if ((*(_QWORD *)(a1 + 56) & 0x8000) != 0)
    goto LABEL_35;
}

- (id)serverInstance:(id)a3 appWithIdentifier:(id)a4
{
  return AXSBApplicationWithIdentifier(a4);
}

- (id)installedAppsWithServerInstance:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;
  id obj;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  +[AXSpringBoardServerHelper _iconController](AXSpringBoardServerHelper, "_iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXSpringBoardServerHelper _applicationController](AXSpringBoardServerHelper, "_applicationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("allApplications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "safeValueForKey:", CFSTR("bundleIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safeValueForKey:", CFSTR("displayName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safeValueForKey:", CFSTR("isInternalApplication"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v13, "BOOLValue");

        v20 = 0;
        v21 = &v20;
        v22 = 0x2020000000;
        v23 = 0;
        v19 = v4;
        v14 = v11;
        AXPerformSafeBlock();
        if ((v10 & 1) == 0 && *((_BYTE *)v21 + 24) && v14 && v12)
          objc_msgSend(v17, "setObject:forKey:", v12, v14);

        _Block_object_dispose(&v20, 8);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  return v17;
}

void __61__AXSpringBoardServerHelper_installedAppsWithServerInstance___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "applicationIconForBundleIdentifier:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "isIconVisible:", v3);

}

- (id)internalAppsWithServerInstance:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;
  id obj;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  +[AXSpringBoardServerHelper _iconController](AXSpringBoardServerHelper, "_iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXSpringBoardServerHelper _applicationController](AXSpringBoardServerHelper, "_applicationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("allApplications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "safeValueForKey:", CFSTR("bundleIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safeValueForKey:", CFSTR("displayName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safeValueForKey:", CFSTR("isInternalApplication"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v13, "BOOLValue");

        v20 = 0;
        v21 = &v20;
        v22 = 0x2020000000;
        v23 = 0;
        v19 = v4;
        v14 = v11;
        AXPerformSafeBlock();
        if ((_DWORD)v10 && *((_BYTE *)v21 + 24) && v14 && v12)
          objc_msgSend(v17, "setObject:forKey:", v12, v14);

        _Block_object_dispose(&v20, 8);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  return v17;
}

void __60__AXSpringBoardServerHelper_internalAppsWithServerInstance___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "applicationIconForBundleIdentifier:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "isIconVisible:", v3);

}

- (void)_unlockWithIntent:(int)a3
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __47__AXSpringBoardServerHelper__unlockWithIntent___block_invoke()
{
  return AXPerformSafeBlock();
}

void __47__AXSpringBoardServerHelper__unlockWithIntent___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  NSClassFromString(CFSTR("SBLockScreenUnlockRequest"));
  v2 = (void *)objc_opt_new();
  v3 = 0;
  v10[0] = sel_setName_;
  v10[1] = sel_setSource_;
  v10[2] = sel_setIntent_;
  do
  {
    v4 = (const char *)v10[v3];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      sel_getName(v4);
      _AXLogWithFacility();
    }
    ++v3;
  }
  while (v3 != 3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "setName:", CFSTR("Accessibility screen unlock"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "setSource:", 30);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "setIntent:", *(unsigned int *)(a1 + 40));
  AXLogSystemApp();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned int *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    v9 = v6;
    _os_log_impl(&dword_21AC77000, v5, OS_LOG_TYPE_DEFAULT, "Requesting screen unlock. intent: %ld", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "_lockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlockWithRequest:completion:", v2, &__block_literal_global_1323);

}

void __47__AXSpringBoardServerHelper__unlockWithIntent___block_invoke_1321(uint64_t a1, unsigned int a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  AXLogSystemApp();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = a2;
    _os_log_impl(&dword_21AC77000, v3, OS_LOG_TYPE_DEFAULT, "Screen unlock request finished: %ld", (uint8_t *)&v4, 0xCu);
  }

}

- (void)wakeUpDeviceIfNecessaryWithServerInstance:(id)a3
{
  -[AXSpringBoardServerHelper _unlockWithIntent:](self, "_unlockWithIntent:", 0);
}

- (void)unlockDeviceWithServerInstance:(id)a3
{
  -[AXSpringBoardServerHelper _unlockWithIntent:](self, "_unlockWithIntent:", 3);
}

- (void)serverInstance:(id)a3 showSpeechPlaybackControls:(BOOL)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotImplemented"), CFSTR("showSpeechPlaybackControls not implemented"));
}

- (void)serverInstance:(id)a3 pauseMedia:(BOOL)a4 forBundleId:(id)a5
{
  id v5;
  id v6;

  v6 = a5;
  v5 = v6;
  AXPerformBlockOnMainThread();

}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 32);
  MRMediaRemoteGetNowPlayingApplicationPID();

}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)SBSCopyInfoForApplicationWithProcessID();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEB0B68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDFE410])
    && ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFE428]) & 1) != 0
     || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFE430]) & 1) != 0)
    || (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || !*(_QWORD *)(a1 + 32))
  {
    v4 = v3;
    MRMediaRemoteGetNowPlayingApplicationPlaybackState();

  }
}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_3(uint64_t a1, int a2)
{
  id *v2;
  _QWORD *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (a2 != 1)
  {
    if (*(_BYTE *)(a1 + 40))
      return;
    goto LABEL_5;
  }
  if (!*(_BYTE *)(a1 + 40))
  {
LABEL_5:
    v2 = (id *)(a1 + 32);
    MRMediaRemoteSendCommandToApp();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_6;
    v4[3] = &unk_24DDE5710;
    v3 = v4;
    goto LABEL_6;
  }
  v2 = (id *)(a1 + 32);
  MRMediaRemoteSendCommandToApp();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_4;
  v5[3] = &unk_24DDE5710;
  v3 = v5;
LABEL_6:
  v3[4] = *v2;
  AXPerformBlockOnMainThreadAfterDelay();
  _AXLogWithFacility();

}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_4(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();

}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_5(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    MRMediaRemoteSendCommandToApp();
    _AXLogWithFacility();
  }
}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_6(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();

}

void __67__AXSpringBoardServerHelper_serverInstance_pauseMedia_forBundleId___block_invoke_7(uint64_t a1, int a2)
{
  if (a2 != 1)
  {
    MRMediaRemoteSendCommandToApp();
    _AXLogWithFacility();
  }
}

- (BOOL)hasActiveCallWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__AXSpringBoardServerHelper_hasActiveCallWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __61__AXSpringBoardServerHelper_hasActiveCallWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  v8 = 0;
  AXPerformSafeBlock();
  v2 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "safeBoolForKey:", CFSTR("inCall"));
}

void __61__AXSpringBoardServerHelper_hasActiveCallWithServerInstance___block_invoke_1342(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[objc_class sharedTelephonyManagerCreatingIfNecessary:](NSClassFromString(CFSTR("SBTelephonyManager")), "sharedTelephonyManagerCreatingIfNecessary:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasActiveEndpointCallWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__AXSpringBoardServerHelper_hasActiveEndpointCallWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __69__AXSpringBoardServerHelper_hasActiveEndpointCallWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__0;
  v8 = __Block_byref_object_dispose__0;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("inCall"));
  if (v3)
    LOBYTE(v3) = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isEndpointOnCurrentDevice"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;

}

void __69__AXSpringBoardServerHelper_hasActiveEndpointCallWithServerInstance___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[objc_class sharedTelephonyManagerCreatingIfNecessary:](NSClassFromString(CFSTR("SBTelephonyManager")), "sharedTelephonyManagerCreatingIfNecessary:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasActiveOrPendingCallWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__AXSpringBoardServerHelper_hasActiveOrPendingCallWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __70__AXSpringBoardServerHelper_hasActiveOrPendingCallWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  AXPerformSafeBlock();
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("incomingCallExists"));
  v4 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("outgoingCallExists"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3 | v4 | objc_msgSend(v2, "safeBoolForKey:", CFSTR("inCall"));

}

void __70__AXSpringBoardServerHelper_hasActiveOrPendingCallWithServerInstance___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[objc_class sharedTelephonyManagerCreatingIfNecessary:](NSClassFromString(CFSTR("SBTelephonyManager")), "sharedTelephonyManagerCreatingIfNecessary:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasActiveOrPendingCallOrFaceTimeWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__AXSpringBoardServerHelper_hasActiveOrPendingCallOrFaceTimeWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __80__AXSpringBoardServerHelper_hasActiveOrPendingCallOrFaceTimeWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  char v4;
  char v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  AXPerformSafeBlock();
  v2 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("incomingCallExists"));
  v4 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("outgoingCallExists"));
  v5 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("inCall"));
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBConferenceManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("inFaceTime"));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3 | v4 | v5 | v7;
}

void __80__AXSpringBoardServerHelper_hasActiveOrPendingCallOrFaceTimeWithServerInstance___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[objc_class sharedTelephonyManagerCreatingIfNecessary:](NSClassFromString(CFSTR("SBTelephonyManager")), "sharedTelephonyManagerCreatingIfNecessary:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (double)reachabilityOffsetWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  double v6;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__AXSpringBoardServerHelper_reachabilityOffsetWithServerInstance___block_invoke;
  v8[3] = &unk_24DDE5C48;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __66__AXSpringBoardServerHelper_reachabilityOffsetWithServerInstance___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isReachabilityActive"))
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v3 = v2 * 0.5;
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBReachabilityDomain")), "safeValueForKey:", CFSTR("rootSettings"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeCGFloatForKey:", CFSTR("yOffsetFactor"));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 + v5;

  }
}

- (id)allowedMedusaGesturesWithServerInstance:(id)a3
{
  void *v3;
  void *v4;

  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowedMedusaGestures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)toggleBackgroundSoundsWithServerInstance:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(getHUComfortSoundsSettingsClass(), "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHUComfortSoundsSettingsClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComfortSoundsEnabled:", objc_msgSend(v3, "comfortSoundsEnabled") ^ 1);

}

- (BOOL)serverInstance:(id)a3 performMedusaGesture:(unint64_t)a4
{
  void *v5;

  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "performMedusaGesture:", a4);

  return a4;
}

- (id)medusaAppsWithServerInstance:(id)a3
{
  void *v3;
  void *v4;

  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medusaApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)serverInstance:(id)a3 setDockIconActivationMode:(unint64_t)a4
{
  id v5;

  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDockIconActivationMode:", a4);

}

- (BOOL)canSetDockIconActivationModeForServerInstance:(id)a3
{
  void *v3;
  char v4;

  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canActivateMedusaForDock");

  return v4;
}

- (id)medusaBundleIDsToLayoutRoles
{
  void *v2;
  void *v3;

  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "medusaAppBundleIdsToLayoutRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)toggleSpotlightWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXDeviceIsPad())
  {
    v10 = MEMORY[0x24BDAC760];
    v6 = __63__AXSpringBoardServerHelper_toggleSpotlightWithServerInstance___block_invoke;
    v7 = &v10;
  }
  else
  {
    if (-[AXSpringBoardServerHelper isAppSwitcherVisibleWithServerInstance:](self, "isAppSwitcherVisibleWithServerInstance:", v4))
    {
      -[AXSpringBoardServerHelper dismissAppSwitcherWithServerInstance:](self, "dismissAppSwitcherWithServerInstance:", v4);
    }
    v9 = MEMORY[0x24BDAC760];
    v6 = __63__AXSpringBoardServerHelper_toggleSpotlightWithServerInstance___block_invoke_2;
    v7 = &v9;
  }
  v7[1] = 3221225472;
  v7[2] = (uint64_t)v6;
  v7[3] = (uint64_t)&unk_24DDE5710;
  v7[4] = (uint64_t)v5;
  v8 = v5;
  AXPerformSafeBlock();

}

uint64_t __63__AXSpringBoardServerHelper_toggleSpotlightWithServerInstance___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleSearchOnWindowScene:fromBreadcrumbSource:withWillBeginHandler:completionHandler:", 0, 1, 0, 0);
}

uint64_t __63__AXSpringBoardServerHelper_toggleSpotlightWithServerInstance___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_toggleSearch");
}

- (void)revealSpotlightWithServerInstance:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[AXSpringBoardServerHelper isSpotlightVisibleWithServerInstance:](self, "isSpotlightVisibleWithServerInstance:"))-[AXSpringBoardServerHelper toggleSpotlightWithServerInstance:](self, "toggleSpotlightWithServerInstance:", v4);

}

- (BOOL)isGuidedAccessActiveWithServerInstance:(id)a3
{
  void *v3;
  char v4;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("GAXSpringboard")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isActive"));

  return v4;
}

- (BOOL)toggleDarkModeWithServerInstance:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BEBDAE8], "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleCurrentStyle");

  return 1;
}

- (BOOL)isSpotlightVisibleWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSpotlightMultiplexingViewController")), "safeValueForKey:", CFSTR("sharedRemoteSearchViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_appearState");

  return (v6 - 1) < 2;
}

- (BOOL)isTodayViewOrAppLibraryVisibleWithServerInstance:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "_iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("iconManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isOverlayTodayOrLibraryViewVisible"));

  return v5;
}

- (BOOL)isPIPWindowVisibleWithServerInstance:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBWorkspace")), "safeValueForKey:", CFSTR("mainWorkspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("pipCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isAnyPictureInPictureWindowVisible"));

  return v5;
}

- (void)forceLoadGAXBundleWithServerInstance:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BED2790], 0);

}

- (void)reactivateInCallServiceWithServerInstance:(id)a3
{
  void *v3;
  id v4;
  id v5;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainWorkspace")), "safeValueForKey:", CFSTR("_instanceIfExists"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("inCallTransientOverlayManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("presentTransientOverlay"));

}

- (void)launchMagnifierAppWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[AXSpringBoardServerHelper serverInstance:appWithIdentifier:](self, "serverInstance:appWithIdentifier:", v4, *MEMORY[0x24BED2688]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !-[AXSpringBoardServerHelper isPasscodeLockVisible](self, "isPasscodeLockVisible"))
  {
    objc_msgSend((id)objc_opt_class(), "_uiController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = v7;
      v9 = v6;
      AXPerformSafeBlock();

    }
    else
    {
      _AXLogWithFacility();
    }

  }
}

uint64_t __66__AXSpringBoardServerHelper_launchMagnifierAppWithServerInstance___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateApplicationFromAccessibility:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isMagnifierVisibleWithServerInstance:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXFrontBoardRunningAppProcesses();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = (_QWORD *)MEMORY[0x24BED2688];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", *v9);

        if (v13)
        {
          objc_msgSend(v11, "state");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "visibility");

          if (v15 == 2)
          {
            LOBYTE(v16) = 1;
            goto LABEL_14;
          }
          if (v15 == 3)
          {
            v16 = !-[AXSpringBoardServerHelper isScreenLockedWithServerInstance:](self, "isScreenLockedWithServerInstance:", v4);
            goto LABEL_14;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  LOBYTE(v16) = 0;
LABEL_14:

  return v16;
}

- (void)updateFrontMostApplicationWithServerInstance:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  AXPerformSafeBlock();
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  v6 = v4;
  v5 = v4;
  AXPerformSafeBlock();

}

void __74__AXSpringBoardServerHelper_updateFrontMostApplicationWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[objc_class accessibility:](NSClassFromString(CFSTR("SBKeyboardFocusArbitrationReason")), "accessibility:", CFSTR("Accessibility-FKA"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __74__AXSpringBoardServerHelper_updateFrontMostApplicationWithServerInstance___block_invoke_2(uint64_t a1)
{
  id v2;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBKeyboardFocusCoordinator")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestArbitrationForSBWindowScene:forReason:", 0, *(_QWORD *)(a1 + 32));

}

- (void)diminishJindoWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("systemApertureControllerForMainDisplay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_systemApertureViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_systemApertureManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_elementsToElementViewControllers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      do
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "_axCollapseIfExpandedByUserInteraction");
        objc_msgSend(v10, "nextObject");
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v13;
      }
      while (v13);
    }

  }
}

- (id)jindoAppBundleIndentifiersWithServerInstance:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeValueForKey:", CFSTR("systemApertureControllerForMainDisplay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeValueForKey:", CFSTR("_systemApertureViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("_orderedContainerViews"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v27;
    v6 = *MEMORY[0x24BDFE420];
    v17 = *MEMORY[0x24BDFE400];
    v16 = *MEMORY[0x24BDFE078];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(obj);
        v20 = 0;
        v21 = &v20;
        v22 = 0x3032000000;
        v23 = __Block_byref_object_copy__0;
        v24 = __Block_byref_object_dispose__0;
        v25 = 0;
        v19 = v3;
        AXPerformSafeBlock();
        v8 = (id)v21[5];

        _Block_object_dispose(&v20, 8);
        if (v8)
        {
          objc_msgSend(v8, "safeStringForKey:", CFSTR("clientIdentifier"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqualToString:", v6) & 1) == 0
            && (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.chronod")) & 1) == 0
            && (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.CoreAuthUI")) & 1) == 0
            && (objc_msgSend(v9, "isEqualToString:", v17) & 1) == 0
            && (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.accessibility.MagnifierAngel")) & 1) == 0
            && (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ShortcutsUI")) & 1) == 0
            && (!objc_msgSend(v9, "isEqualToString:", v16)
             || !-[AXSpringBoardServerHelper isInCallServiceFrontmost](self, "isInCallServiceFrontmost")))
          {
            objc_msgSend(v15, "axSafelyAddObject:", v9);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v4);
  }

  return v15;
}

void __74__AXSpringBoardServerHelper_jindoAppBundleIndentifiersWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_elementForContainerView:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)launchOnboardingViewServiceWithServerInstance:(id)a3 data:(id)a4
{
  -[AXSpringBoardServerHelper serverInstance:showRemoteViewType:withData:withPreviousViewDismissal:](self, "serverInstance:showRemoteViewType:withData:withPreviousViewDismissal:", a3, 6, a4, 0);
}

- (void)launchVoiceOverQuickSettingsViewServiceWithServerInstance:(id)a3 data:(id)a4
{
  -[AXSpringBoardServerHelper serverInstance:showRemoteViewType:withData:withPreviousViewDismissal:](self, "serverInstance:showRemoteViewType:withData:withPreviousViewDismissal:", a3, 1, a4, 1);
}

- (void)launchVoiceOverImageExplorerViewServiceWithServerInstance:(id)a3 forData:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE00470];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE00470]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v11)
  {
    AXLogSpringboardServer();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v22;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      _os_log_fault_impl(&dword_21AC77000, v13, OS_LOG_TYPE_FAULT, "%@ - elementInfo must be type AXSBImageExplorerData. was actually %@. error:%@ ", buf, 0x20u);

    }
    goto LABEL_20;
  }
  if (!v10)
  {
    AXLogSpringboardServer();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[AXSpringBoardServerHelper launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:].cold.1((uint64_t)self, v13);
LABEL_20:
    v17 = v9;
    goto LABEL_21;
  }
  objc_msgSend(v10, "hostAppBundleID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    AXSBApplicationWithIdentifier(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SBApplication"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "safeValueForKey:", CFSTR("displayName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHostAppName:", v15);

      AXLogSpringboardServer();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[AXSpringBoardServerHelper launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:].cold.3(v10, v16);

    }
  }
  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;

  if (v18 || !v17)
  {
    AXLogSpringboardServer();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[AXSpringBoardServerHelper launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:].cold.2();

  }
  v20 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, v8);
  -[AXSpringBoardServerHelper serverInstance:showRemoteViewType:withData:withPreviousViewDismissal:](self, "serverInstance:showRemoteViewType:withData:withPreviousViewDismissal:", v6, 2, v20, 1);

LABEL_21:
}

- (id)coverSheetViewController
{
  void *v2;
  void *v3;
  void *v4;

  AXSpringBoardGlueSBLockScreenControllerInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("coverSheetViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDashBoardSystemGesturesEnabled:(BOOL)a3 withServerInstance:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = a4;
  -[AXSpringBoardServerHelper coverSheetViewController](self, "coverSheetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_scrollGestureController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "accessibilitySetSystemDashBoardGesturesEnabled:", v4);
}

- (void)setSecurePayAccessibilityFeaturesDisabled:(BOOL)a3 withServerInstance:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  AccessibilityFeatureCache *v9;
  AccessibilityFeatureCache *axFeatureCache;
  void *v11;
  void *v12;
  AccessibilityFeatureCache *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];
  uint8_t buf[8];
  id v23;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "securePayAssertionActive");

  if (v4)
  {
    if ((v8 & 1) == 0)
    {
      v9 = (AccessibilityFeatureCache *)objc_opt_new();
      axFeatureCache = self->_axFeatureCache;
      self->_axFeatureCache = v9;

      -[AccessibilityFeatureCache setAssistiveTouch:](self->_axFeatureCache, "setAssistiveTouch:", _AXSAssistiveTouchEnabled() != 0);
      -[AccessibilityFeatureCache setLiveCaptions:](self->_axFeatureCache, "setLiveCaptions:", _AXSLiveTranscriptionEnabled() != 0);
      -[AccessibilityFeatureCache setLiveSpeech:](self->_axFeatureCache, "setLiveSpeech:", _AXSLiveSpeechEnabled() != 0);
      -[AccessibilityFeatureCache setSpeakScreen:](self->_axFeatureCache, "setSpeakScreen:", _AXSSpeakThisEnabled() != 0);
      -[AccessibilityFeatureCache setZoom:](self->_axFeatureCache, "setZoom:", _AXSZoomTouchEnabled() != 0);
      -[AccessibilityFeatureCache setVoiceControl:](self->_axFeatureCache, "setVoiceControl:", _AXSCommandAndControlEnabled() != 0);
      -[AccessibilityFeatureCache setBackTap:](self->_axFeatureCache, "setBackTap:", _AXSBackTapEnabled() != 0);
      v11 = (void *)_AXSTripleClickCopyOptions();
      -[AccessibilityFeatureCache setTripleClickOptions:](self->_axFeatureCache, "setTripleClickOptions:", v11);

      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSecurePayAssertionActive:", 1);

      _AXSSetTripleClickOptions();
      _AXSBackTapSetEnabled();
      _AXSAssistiveTouchSetEnabled();
      _AXSLiveTranscriptionSetEnabled();
      _AXSLiveSpeechSetEnabled();
      _AXSSetSpeakThisEnabled();
      _AXSZoomTouchSetEnabled();
      _AXSCommandAndControlSetEnabled();
      v13 = self->_axFeatureCache;
      v23 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;
      if (v15)
      {
        AXLogAssertions();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[AXSpringBoardServerHelper setSecurePayAccessibilityFeaturesDisabled:withServerInstance:].cold.1();

      }
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v14, CFSTR("AXSecurePayFeatureCache"));

      }
      AXLogAssertions();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AC77000, v18, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for ax secure pay feature disablement", buf, 2u);
      }

LABEL_15:
    }
  }
  else if (v8)
  {
    -[AXSpringBoardServerHelper _restoreAccessibilityFeatureFromSecurePayCache:](self, "_restoreAccessibilityFeatureFromSecurePayCache:", self->_axFeatureCache);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("AXSecurePayFeatureCache"));

    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSecurePayAssertionActive:", 0);

    AXLogAssertions();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21AC77000, v15, OS_LOG_TYPE_DEFAULT, "Release assertion for ax secure pay feature disablement", v21, 2u);
    }
    goto LABEL_15;
  }

}

- (void)_restoreAccessibilityFeatureFromSecurePayCache:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "assistiveTouch");
    _AXSAssistiveTouchSetEnabled();
    objc_msgSend(v3, "liveCaptions");
    _AXSLiveTranscriptionSetEnabled();
    objc_msgSend(v3, "liveSpeech");
    _AXSLiveSpeechSetEnabled();
    objc_msgSend(v3, "speakScreen");
    _AXSSetSpeakThisEnabled();
    objc_msgSend(v3, "zoom");
    _AXSZoomTouchSetEnabled();
    objc_msgSend(v3, "voiceControl");
    _AXSCommandAndControlSetEnabled();
    objc_msgSend(v3, "backTap");
    _AXSBackTapSetEnabled();
    objc_msgSend(v3, "tripleClickOptions");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    _AXSSetTripleClickOptions();
  }
}

- (void)activateSOSModeWithServerInstance:(id)a3
{
  NSObject *v3;

  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, &__block_literal_global_1367);

}

uint64_t __63__AXSpringBoardServerHelper_activateSOSModeWithServerInstance___block_invoke()
{
  void *v0;
  id v1;
  uint64_t v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  LOBYTE(v3) = 1;
  _AXLogWithFacility();
  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getSOSManagerClass_softClass;
  v8 = getSOSManagerClass_softClass;
  if (!getSOSManagerClass_softClass)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getSOSManagerClass_block_invoke;
    v4[3] = &unk_24DDE5AC8;
    v4[4] = &v5;
    __getSOSManagerClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  return objc_msgSend(v1, "triggerSOS", v3, CFSTR("SOS: triggering SOS"));
}

- (BOOL)connectedDevicesRequireAssistiveTouch
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AXSpringBoardServerHelper motionTrackingInputManager](self, "motionTrackingInputManager", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compatibleInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isHIDDevice") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)currentDevicesHaveAssistiveTouchCustomActions
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE00670], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentDevicesHaveAssistiveTouchCustomActions");

  return v3;
}

- (void)cancelSiriDismissalForAssistiveTouchWithServerInstance:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t buf[16];

  v3 = a3;
  ASTLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AC77000, v4, OS_LOG_TYPE_INFO, "Canceling Siri dismissal (if pending) due to AssistiveTouch handling an up event.", buf, 2u);
  }

  objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "_assistantController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_axCancelDismissSiriForAssistiveTouch");
}

- (id)appNameFromPid:(int)a3 withServerInstance:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id *v17;
  uint64_t *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  __CFString *v23;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v4 = (void *)MEMORY[0x24BE80C78];
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", *(_QWORD *)&a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v4, "handleForIdentifier:error:", v5, &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;

  if (!v7)
  {
    objc_msgSend(v6, "bundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "hostProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = objc_claimAutoreleasedReturnValue();

    AXLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:].cold.4();

    AXLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:].cold.3();

    if (v13)
    {
      v16 = objc_alloc(MEMORY[0x24BDC1540]);
      v26 = 0;
      v17 = (id *)&v26;
      v18 = &v26;
      v19 = v13;
    }
    else
    {
      if (!v8)
      {
        AXLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:].cold.1();
        v7 = 0;
        goto LABEL_23;
      }
      v16 = objc_alloc(MEMORY[0x24BDC1540]);
      v25 = 0;
      v17 = (id *)&v25;
      v18 = &v25;
      v19 = v8;
    }
    v20 = objc_msgSend(v16, "initWithBundleIdentifier:allowPlaceholder:error:", v19, 0, v18);
    v7 = *v17;
    if (!v20)
    {
      v9 = &stru_24DDEA460;
LABEL_25:

      goto LABEL_26;
    }
    -[NSObject localizedName](v20, "localizedName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[NSObject localizedName](v20, "localizedName");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    AXLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:].cold.2(v7, v22);

LABEL_23:
    v9 = &stru_24DDEA460;
    goto LABEL_24;
  }
  AXLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[AXSpringBoardServerHelper appNameFromPid:withServerInstance:].cold.5(v7, v8);
  v9 = &stru_24DDEA460;
LABEL_26:

  v23 = v9;
  return v23;
}

- (void)toggleLiveTranscriptionWithServerInstance:(id)a3
{
  int v3;
  BOOL v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  v3 = _AXSLiveTranscriptionEnabled();
  v4 = v3 == 0;
  if (v3)
  {
    _AXSLiveTranscriptionSetEnabled();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __71__AXSpringBoardServerHelper_toggleLiveTranscriptionWithServerInstance___block_invoke;
    v6[3] = &__block_descriptor_33_e8_v16__0q8l;
    v7 = v4;
    objc_msgSend(v5, "showAlert:withHandler:", 25, v6);

  }
}

uint64_t __71__AXSpringBoardServerHelper_toggleLiveTranscriptionWithServerInstance___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 == 1)
    return _AXSLiveTranscriptionSetEnabled();
  return result;
}

- (void)freezeClarityUILoadingScreenWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x24BE0B678]);
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithName:display:", CFSTR("ClarityUI"), v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B670]), "initWithDescriptor:", v6);
  objc_msgSend(v5, "present");
  objc_msgSend(v5, "freeze");

}

- (void)presentNearbyDeviceControlPickerWithServerInstance:(id)a3
{
  SBSRequestPasscodeUnlockUI();
}

void __80__AXSpringBoardServerHelper_presentNearbyDeviceControlPickerWithServerInstance___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (a2)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2050000000;
    v2 = (void *)getAXRemoteViewServiceAdaptorClass_softClass;
    v9 = getAXRemoteViewServiceAdaptorClass_softClass;
    if (!getAXRemoteViewServiceAdaptorClass_softClass)
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __getAXRemoteViewServiceAdaptorClass_block_invoke;
      v5[3] = &unk_24DDE5AC8;
      v5[4] = &v6;
      __getAXRemoteViewServiceAdaptorClass_block_invoke((uint64_t)v5);
      v2 = (void *)v7[3];
    }
    v3 = objc_retainAutorelease(v2);
    _Block_object_dispose(&v6, 8);
    objc_msgSend(v3, "presentRemoteNearbyDevicesViewControllerWithPresentationHandler:dismissalHandler:", 0, 0);
  }
  else
  {
    AXLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__AXSpringBoardServerHelper_presentNearbyDeviceControlPickerWithServerInstance___block_invoke_cold_1();

  }
}

- (void)toggleDetectionModeWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  Class (*v12)(uint64_t);
  void *v13;
  uint64_t *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
  {
    v11 = xmmword_24DDE63A8;
    v12 = 0;
    AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2050000000;
    v4 = (void *)getAXPISystemActionHelperClass_softClass;
    v10 = getAXPISystemActionHelperClass_softClass;
    if (!getAXPISystemActionHelperClass_softClass)
    {
      *(_QWORD *)&v11 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v11 + 1) = 3221225472;
      v12 = __getAXPISystemActionHelperClass_block_invoke;
      v13 = &unk_24DDE5AC8;
      v14 = &v7;
      __getAXPISystemActionHelperClass_block_invoke((uint64_t)&v11);
      v4 = (void *)v8[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v7, 8);
    objc_msgSend(v5, "sharedInstance", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateDetectionMode");

  }
}

- (void)toggleConversationBoostWithServerInstance:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  id v15;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length")
    && paCurrentRouteSupportsTransparencyAccommodations()
    && paBluetoothDeviceSupportsSSL())
  {
    objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "personalMediaEnabled"))
    {
      v5 = objc_msgSend(v15, "listeningMode");

      if (v5 == 3)
      {
        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "transparencyCustomizedForAddress:", v3);

        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTransparencyCustomized:forAddress:", v7 ^ 1u, v3);
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sslEnabledForAddress:", v3);

    v11 = v10 ^ 1u;
    v12 = objc_msgSend(v15, "listeningMode");
    if ((v10 & 1) != 0 || v12 == 3)
    {
      if (v12 == 3)
        v14 = v10;
      else
        v14 = 0;
      if (v14 != 1)
        goto LABEL_17;
      v13 = 1;
    }
    else
    {
      v13 = 3;
    }
    objc_msgSend(v15, "setListeningMode:", v13);
LABEL_17:
    objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSslEnabled:forAddress:", v11, v3);
    goto LABEL_18;
  }
LABEL_19:

}

- (void)toggleTorchWithServerInstance:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEB0EE0], "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "level");

  objc_msgSend(MEMORY[0x24BEB0EE0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "turnFlashlightOffForReason:", CFSTR("Accessibility"));
  else
    objc_msgSend(v5, "turnFlashlightOnForReason:", CFSTR("Accessibility"));

}

- (id)serverInstance:(id)a3 splashImageForAppWithBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v6 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  AXSBApplicationWithIdentifier(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBApplication"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    AXPerformSafeBlock();

  }
  v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __82__AXSpringBoardServerHelper_serverInstance_splashImageForAppWithBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  Class v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  -[objc_class mainDisplaySceneManager](NSClassFromString(CFSTR("SBSceneManagerCoordinator")), "mainDisplaySceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBMainDisplaySceneManager"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "sceneIdentityForApplication:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = NSClassFromString(CFSTR("SBApplicationSceneHandleRequest"));
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "safeValueForKey:", CFSTR("displayIdentity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class defaultRequestForApplication:sceneIdentity:displayIdentity:](v4, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v5, v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v30 = v2;
    v8 = v7;
    AXPerformSafeBlock();
    v9 = (id)v32[5];

    _Block_object_dispose(&v31, 8);
    NSClassFromString(CFSTR("SBDeviceApplicationSceneHandle"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v8;
      v28 = v3;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__0;
      v35 = __Block_byref_object_dispose__0;
      v36 = 0;
      v29 = v9;
      AXPerformSafeBlock();
      v10 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
      v26 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scale");
      v13 = v12;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v16 = v15;
      v18 = v17;
      objc_msgSend((id)*MEMORY[0x24BEBDF78], "windows");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bestSnapshotWithImageName:sceneHandle:variantID:scale:referenceSize:requireExactSize:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:", CFSTR("SBSuspendSnapshot"), v29, CFSTR("downscaled"), 1, -1, -5, v13, v16, v18, 1, 0, objc_msgSend(v21, "userInterfaceStyle"), v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "imageForInterfaceOrientation:", 1);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

      v8 = v27;
      v3 = v28;
    }

  }
}

void __82__AXSpringBoardServerHelper_serverInstance_splashImageForAppWithBundleIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "fetchOrCreateApplicationSceneHandleForRequest:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __82__AXSpringBoardServerHelper_serverInstance_splashImageForAppWithBundleIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "displayEdgeInfoForLayoutEnvironment:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)rebootDeviceWithServerInstance:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showAlert:withHandler:", 11, &__block_literal_global_1390);

}

uint64_t __60__AXSpringBoardServerHelper_rebootDeviceWithServerInstance___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return AXFrontBoardRebootDevice();
  return result;
}

- (void)launchApplication:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchApplication:", v4);

}

- (void)launchApplicationWithFullConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchApplicationWithFullConfiguration:", v4);

}

- (void)launchPinnedApplication:(id)a3 onLeadingSide:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "launchPinnedApplication:onLeadingSide:", v6, v4);

}

- (void)launchFloatingApplication:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchFloatingApplication:", v4);

}

- (BOOL)canLaunchAsPinnedApplicationForIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canLaunchAsPinnedApplicationForIconView:", v4);

  return v6;
}

- (BOOL)canLaunchAsFloatingApplicationForIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canLaunchAsFloatingApplicationForIconView:", v4);

  return v6;
}

- (id)sceneLayoutState
{
  void *v2;
  void *v3;

  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneLayoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appForLayoutRole:(int64_t)a3
{
  void *v4;
  void *v5;

  -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appForLayoutRole:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_accessibilityNotificationSummary:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AXSpringBoardServerHelper coverSheetViewController](self, "coverSheetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("mainPageContentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("combinedListViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_structuredListViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityNotificationSummary:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)_accessibilityNotificationCount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[AXSpringBoardServerHelper coverSheetViewController](self, "coverSheetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("mainPageContentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("combinedListViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_structuredListViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityNotificationCount");

  return v6;
}

- (int)nativeFocusedApplication
{
  void *v2;
  void *v3;
  int v4;
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
  NSObject *v15;
  NSObject *v16;
  id v18;
  char v19;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBWorkspace")), "safeValueForKey:", CFSTR("mainWorkspace"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("keyboardFocusController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "safeIntForKey:", CFSTR("_axPrimaryKeyboardFocusOverridePid"));
  if (!v4)
  {
    v19 = 0;
    objc_opt_class();
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBWorkspace")), "safeValueForKey:", CFSTR("mainWorkspace"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("keyboardFocusController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("sceneWithFocusIncludingSpringBoard"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "definition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BE80C78];
      objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingIdentity:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v12, "handleForPredicate:error:", v13, &v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18;

      if (v15)
      {
        AXLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[AXSpringBoardServerHelper nativeFocusedApplication].cold.2();

        v4 = 0;
      }
      else
      {
        v4 = objc_msgSend(v14, "pid");
      }

    }
    else
    {
      AXLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AXSpringBoardServerHelper nativeFocusedApplication].cold.1();
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)_accessibilityIsUILocked
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScreenLockedWithPasscode:", 0);

  return v3;
}

- (BOOL)accessibilityIsNotificationVisible
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("notificationDispatcher"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("bannerDestination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("presentedBanner"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "safeBoolForKey:", CFSTR("isPresentingBanner")))
  {
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _SBAXIsViewVisible(v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)accessibilityIsBannerVisible
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("bannerManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXSpringBoardServerHelper _axActiveWindowScene](AXSpringBoardServerHelper, "_axActiveWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isDisplayingBannerInWindowScene:", v4);

  return v5;
}

- (BOOL)accessibilityIsRemoteTransientOverlayVisible
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[AXSpringBoardServerHelper _axActiveWindowScene](AXSpringBoardServerHelper, "_axActiveWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("windows"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        NSClassFromString(CFSTR("SBMainSwitcherWindow"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_1403, (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "count");

          if (v10)
          {
            v11 = 1;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

uint64_t __73__AXSpringBoardServerHelper_accessibilityIsRemoteTransientOverlayVisible__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBDeviceApplicationRemoteTransientOverlayContainerViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityShowCoverSheet:(BOOL)a3 serverInstance:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  uint64_t v22;
  id v23;
  int v24;
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _QWORD *v32;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  __int128 *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  void *v45;
  NSObject *v46;
  __int128 *p_buf;
  _QWORD v48[11];
  __int128 buf;
  uint64_t v50;
  int v51;
  uint64_t v52;

  v6 = a3;
  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[AXSpringBoardServerHelper setReachabilityActive:](self, "setReachabilityActive:", 0);
  -[AXSpringBoardServerHelper _accessibilityCoverSheetPresentationManagerSharedInstance](self, "_accessibilityCoverSheetPresentationManagerSharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("_coverSheetSlidingViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("systemGesturesDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v6)
  {
    if (-[AXSpringBoardServerHelper isCoverSheetVisibleWithServerInstance:](self, "isCoverSheetVisibleWithServerInstance:", v8))
    {
      -[AXSpringBoardServerHelper coverSheetViewController](self, "coverSheetViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safeValueForKey:", CFSTR("mainPageContentViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeValueForKey:", CFSTR("combinedListViewController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v50 = 0x2020000000;
      LOBYTE(v51) = 0;
      v42 = MEMORY[0x24BDAC760];
      v43 = 3221225472;
      v44 = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2;
      v45 = &unk_24DDE57E0;
      p_buf = &buf;
      v17 = v16;
      v46 = v17;
      AXPerformSafeBlock();
      v18 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

      _Block_object_dispose(&buf, 8);
      AXLogSpringboardServer();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if (v18)
      {
        if (v20)
        {
          LOWORD(buf) = 0;
          v21 = "Revealing more recent notifications";
LABEL_26:
          _os_log_impl(&dword_21AC77000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&buf, 2u);
        }
      }
      else if (v20)
      {
        LOWORD(buf) = 0;
        v21 = "Not revealing more recent notifications";
        goto LABEL_26;
      }

      goto LABEL_28;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v50 = 0x2020000000;
    v28 = MEMORY[0x24BDAC760];
    LOBYTE(v51) = 0;
    v48[5] = MEMORY[0x24BDAC760];
    v48[6] = 3221225472;
    v48[7] = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke;
    v48[8] = &unk_24DDE57E0;
    v48[10] = &buf;
    v29 = v13;
    v48[9] = v29;
    AXPerformSafeBlock();
    v30 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) == 0;

    _Block_object_dispose(&buf, 8);
    AXLogSpringboardServer();
    v17 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v30)
    {
      if (v31)
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v29;
        _os_log_impl(&dword_21AC77000, v17, OS_LOG_TYPE_INFO, "Not showing CoverSheet because system gesture delegate said no: %@", (uint8_t *)&buf, 0xCu);
      }
      LOBYTE(v18) = 0;
      goto LABEL_28;
    }
    if (v31)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21AC77000, v17, OS_LOG_TYPE_INFO, "Showing CoverSheet and revealing more notifications", (uint8_t *)&buf, 2u);
    }

    v48[0] = v28;
    v48[1] = 3221225472;
    v48[2] = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_1406;
    v48[3] = &unk_24DDE6060;
    v32 = v48;
    v48[4] = v9;
    objc_msgSend(v10, "setCoverSheetPresented:animated:withCompletion:", 1, 1, v48);
LABEL_19:
    v17 = v32[4];
    LOBYTE(v18) = 1;
LABEL_28:

    goto LABEL_29;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v50 = 0x2020000000;
  v22 = MEMORY[0x24BDAC760];
  v51 = 0;
  v36 = MEMORY[0x24BDAC760];
  v37 = 3221225472;
  v38 = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_1407;
  v39 = &unk_24DDE57E0;
  v41 = &buf;
  v23 = v12;
  v40 = v23;
  AXPerformSafeBlock();
  v24 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  v25 = v24 == 0;
  AXLogSpringboardServer();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21AC77000, v27, OS_LOG_TYPE_INFO, "Hiding CS with completion", (uint8_t *)&buf, 2u);
    }

    v34[0] = v22;
    v34[1] = 3221225472;
    v34[2] = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_1408;
    v34[3] = &unk_24DDE6088;
    v32 = v34;
    v34[4] = v10;
    v35 = v9;
    AXPerformSafeBlock();

    goto LABEL_19;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v23;
    _os_log_impl(&dword_21AC77000, v27, OS_LOG_TYPE_DEFAULT, "Not hiding CS because system gesture delegate said no: %@", (uint8_t *)&buf, 0xCu);
  }

  if (-[AXSpringBoardServerHelper isCoverSheetVisibleWithServerInstance:](self, "isCoverSheetVisibleWithServerInstance:", v8))
  {
    AXLogSpringboardServer();
    v17 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = 1;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21AC77000, v17, OS_LOG_TYPE_INFO, "trying to hide recent notifications", (uint8_t *)&buf, 2u);
    }
    goto LABEL_28;
  }
  LOBYTE(v18) = 0;
LABEL_29:

  return v18;
}

void __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "safeValueForKey:", CFSTR("presentGestureRecognizer"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "gestureRecognizerShouldBegin:", v3);

}

uint64_t __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_1406(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "notificationStructuredListViewControllerShouldAllowNotificationHistoryReveal:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_1407(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "safeValueForKey:", CFSTR("dismissGestureRecognizer"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "gestureRecognizerShouldBegin:", v3) ^ 1;

}

void __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_1408(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2_1409;
  v2[3] = &unk_24DDE6060;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "setCoverSheetPresented:animated:withCompletion:", 0, 1, v2);

}

void __84__AXSpringBoardServerHelper__accessibilityShowCoverSheet_serverInstance_completion___block_invoke_2_1409(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBDEC8], 0);
}

- (BOOL)_accessibilityShowNotificationCenter:(BOOL)a3 serverInstance:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD);
  id v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  _BOOL4 v28;
  _QWORD aBlock[4];
  id v30;
  AXSpringBoardServerHelper *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  void *v41;
  id v42;
  uint8_t *v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[8];
  uint8_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;

  v4 = a3;
  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[AXSpringBoardServerHelper isControlCenterVisibleWithServerInstance:](self, "isControlCenterVisibleWithServerInstance:", v6))
  {
    -[AXSpringBoardServerHelper accessibilityShowControlCenter:](self, "accessibilityShowControlCenter:", 0);
  }
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSystemGestureManager")), "safeValueForKey:", CFSTR("mainDisplayManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v47 = buf;
  v48 = 0x2020000000;
  v49 = 0;
  v38 = MEMORY[0x24BDAC760];
  v39 = 3221225472;
  v40 = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke;
  v41 = &unk_24DDE57E0;
  v43 = buf;
  v8 = v7;
  v42 = v8;
  AXPerformSafeBlock();
  v9 = v47[24] == 0;

  _Block_object_dispose(buf, 8);
  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isGuidedAccessActive");

  if (!(v9 | v11))
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBBulletinWindowController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v12 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[NSObject safeValueForKey:](v12, "safeValueForKey:", CFSTR("_accessibilityAllowsShowNotificationsGestureFromThreeFingerSwipe"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      AXLogSpringboardServer();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v14;
        _os_log_impl(&dword_21AC77000, v15, OS_LOG_TYPE_INFO, "BB window allows: %d", buf, 8u);
      }

      v16 = !v4;
      if ((!v4 | v14) != 1)
        goto LABEL_10;
    }
    else
    {
      v16 = !v4;
    }
    v28 = -[AXSpringBoardServerHelper isCoverSheetVisibleWithServerInstance:](self, "isCoverSheetVisibleWithServerInstance:", v6);
    -[AXSpringBoardServerHelper coverSheetViewController](self, "coverSheetViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "safeValueForKey:", CFSTR("mainPageContentViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safeValueForKey:", CFSTR("combinedListViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "safeBoolForKey:", CFSTR("_allowNotificationsRevealPolicy"))
      && ((v16 | objc_msgSend(v20, "safeBoolForKey:", CFSTR("_shouldPreventNotificationHistoryRevealForActiveDNDState"))) & 1) == 0)
    {
      v32 = MEMORY[0x24BDAC760];
      v33 = 3221225472;
      v34 = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_1416;
      v35 = &unk_24DDE5F58;
      v36 = v20;
      v37 = v4;
      AXPerformSafeBlock();
      v22 = objc_alloc(MEMORY[0x24BDD1458]);
      SBAXLocalizedString(CFSTR("notification.center.showing"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *MEMORY[0x24BDFEAD8];
      v45 = &unk_24DDF5090;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v24);

      UIAccessibilityPostNotification(*MEMORY[0x24BEBDDB0], v25);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_1421;
      aBlock[3] = &unk_24DDE5830;
      v30 = v36;
      v31 = self;
      v21 = (void (**)(_QWORD))_Block_copy(aBlock);

    }
    else
    {
      v21 = 0;
    }
    if (v4)
    {
      if (v28)
      {
        if (v21)
          v21[2](v21);
        v17 = 1;
        goto LABEL_24;
      }
      v26 = -[AXSpringBoardServerHelper _accessibilityShowCoverSheet:serverInstance:completion:](self, "_accessibilityShowCoverSheet:serverInstance:completion:", 1, v6, v21);
    }
    else
    {
      v26 = -[AXSpringBoardServerHelper _accessibilityShowCoverSheet:serverInstance:completion:](self, "_accessibilityShowCoverSheet:serverInstance:completion:", 0, v6, v21);
    }
    v17 = v26;
LABEL_24:

    goto LABEL_25;
  }
  AXLogSpringboardServer();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AC77000, v12, OS_LOG_TYPE_INFO, "GAX active or generally not allowed", buf, 2u);
  }
LABEL_10:
  v17 = 0;
LABEL_25:

  return v17;
}

uint64_t __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isGestureWithTypeAllowed:", 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_1416(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_structuredListViewController"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "revealNotificationHistory:animated:", *(unsigned __int8 *)(a1 + 40), 0);

}

void __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_1421(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

}

void __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);
  _QWORD aBlock[4];
  id v10;

  v2 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_3;
  aBlock[3] = &unk_24DDE5710;
  v10 = *(id *)(a1 + 32);
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 40), "coverSheetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeUnsignedIntegerForKey:", CFSTR("_indexOfMainPage"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3[2](v3);
  }
  else
  {
    v6 = v5;
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_4;
    v7[3] = &unk_24DDE6060;
    v8 = v3;
    objc_msgSend(v4, "activatePage:animated:withCompletion:", v6, 1, v7);

  }
}

void __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_structuredListViewController"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

  objc_msgSend(v4, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  LODWORD(v2) = *MEMORY[0x24BEBDE88];
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v3);

}

uint64_t __81__AXSpringBoardServerHelper__accessibilityShowNotificationCenter_serverInstance___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_accessibilityCoverSheetPresentationManagerSharedInstance
{
  if (_accessibilityCoverSheetPresentationManagerSharedInstance_onceToken != -1)
    dispatch_once(&_accessibilityCoverSheetPresentationManagerSharedInstance_onceToken, &__block_literal_global_1422);
  return (id)objc_msgSend((id)_accessibilityCoverSheetPresentationManagerSharedInstance_SBCoverSheetPresentationManager, "safeValueForKey:", CFSTR("sharedInstance"));
}

Class __86__AXSpringBoardServerHelper__accessibilityCoverSheetPresentationManagerSharedInstance__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SBCoverSheetPresentationManager"));
  _accessibilityCoverSheetPresentationManagerSharedInstance_SBCoverSheetPresentationManager = (uint64_t)result;
  return result;
}

- (void)_accessibilitySetAllowShowNotificationGestureOverride:(BOOL)a3
{
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "_accessibilitySetBoolValue:forKey:", a3, CFSTR("AXSBAllowShowNotificationGesture"));
}

- (BOOL)_accessibilityAllowShowNotificationGestureOverride
{
  return objc_msgSend((id)*MEMORY[0x24BEBDF78], "_accessibilityBoolValueForKey:", CFSTR("AXSBAllowShowNotificationGesture"));
}

- (BOOL)accessibilityShowControlCenter:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  NSObject *v21;
  id *v22;
  const char *v23;
  BOOL v24;
  _QWORD v26[5];
  id v27[7];
  uint8_t buf[8];
  __int128 v29;
  char v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  ASTLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_impl(&dword_21AC77000, v5, OS_LOG_TYPE_INFO, "Show CC: %d", buf, 8u);
  }

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSystemGestureManager")), "safeValueForKey:", CFSTR("mainDisplayManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v29 = buf;
  *((_QWORD *)&v29 + 1) = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v30 = 0;
  v27[1] = (id)MEMORY[0x24BDAC760];
  v27[2] = (id)3221225472;
  v27[3] = __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke;
  v27[4] = &unk_24DDE57E0;
  v27[6] = buf;
  v8 = v6;
  v27[5] = v8;
  AXPerformSafeBlock();
  v9 = *(unsigned __int8 *)(v29 + 24);
  v10 = *(_BYTE *)(v29 + 24) == 0;

  _Block_object_dispose(buf, 8);
  if (!v10 || !v3)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BE005C0], "server");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isGuidedAccessActive");

      if (v14)
      {
        ASTLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          goto LABEL_29;
        *(_WORD *)buf = 0;
        v12 = "Show CC: No because GA is active";
        goto LABEL_6;
      }
    }
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBControlCenterController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServerHelper _accessibilitySetAllowShowNotificationGestureOverride:](self, "_accessibilitySetAllowShowNotificationGestureOverride:", 1);
    if (-[AXSpringBoardServerHelper _accessibilityIsUILocked](self, "_accessibilityIsUILocked"))
    {
      if (!v3)
      {
        v15 = 1;
        goto LABEL_23;
      }
      v15 = -[NSObject safeBoolForKey:](v11, "safeBoolForKey:", CFSTR("allowShowTransitionSystemGesture"));
      ASTLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
LABEL_22:

LABEL_23:
        ASTLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v15;
          LOWORD(v29) = 2114;
          *(_QWORD *)((char *)&v29 + 2) = v11;
          _os_log_impl(&dword_21AC77000, v20, OS_LOG_TYPE_INFO, "Show CC: Allow transition: %d %{public}@", buf, 0x12u);
        }

        if ((v3 & v15) == 1)
        {
          -[AXSpringBoardServerHelper _accessibilitySetAllowShowNotificationGestureOverride:](self, "_accessibilitySetAllowShowNotificationGestureOverride:", 0);
          -[NSObject _accessibilitySetBoolValue:forKey:](v11, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("IsAXActivating"));
          v26[1] = v7;
          v26[2] = 3221225472;
          v26[3] = __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke_1427;
          v26[4] = &unk_24DDE5710;
          v27[0] = v11;
          AXPerformSafeBlock();
          objc_msgSend(v27[0], "_accessibilitySetBoolValue:forKey:", 0, CFSTR("IsAXActivating"));
          ASTLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v27;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v23 = "Show CC: Presenting CC";
LABEL_32:
            _os_log_impl(&dword_21AC77000, v21, OS_LOG_TYPE_INFO, v23, buf, 2u);
          }
        }
        else
        {
          -[AXSpringBoardServerHelper _accessibilitySetAllowShowNotificationGestureOverride:](self, "_accessibilitySetAllowShowNotificationGestureOverride:", 0);
          if (((v3 | v15 ^ 1) & 1) != 0)
            goto LABEL_29;
          v26[0] = v11;
          AXPerformSafeBlock();
          ASTLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (id *)v26;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v23 = "Show CC: Dismiss CC";
            goto LABEL_32;
          }
        }

        v24 = 1;
        goto LABEL_34;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v9;
      LOWORD(v29) = 1024;
      *(_DWORD *)((char *)&v29 + 2) = v15;
      v17 = "Show CC: UI is locked, generally allowed: %d, ccAllows: %d";
      v18 = v16;
      v19 = 14;
    }
    else
    {
      if (v3)
        v15 = -[NSObject safeBoolForKey:](v11, "safeBoolForKey:", CFSTR("canBePresented"));
      else
        v15 = 1;
      ASTLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v15;
      v17 = "Show CC: controller allows transition: %d";
      v18 = v16;
      v19 = 8;
    }
    _os_log_impl(&dword_21AC77000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
    goto LABEL_22;
  }
  ASTLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v12 = "Show CC: Gesture manager said not generally allowed";
LABEL_6:
    _os_log_impl(&dword_21AC77000, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
  }
LABEL_29:
  v24 = 0;
LABEL_34:

  return v24;
}

uint64_t __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isGestureWithTypeAllowed:", 6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke_1427(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentAnimated:", 1);
}

uint64_t __60__AXSpringBoardServerHelper_accessibilityShowControlCenter___block_invoke_1428(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAnimated:", 1);
}

- (BOOL)isSystemAppShowingAnAlertWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__AXSpringBoardServerHelper_isSystemAppShowingAnAlertWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

uint64_t __73__AXSpringBoardServerHelper_isSystemAppShowingAnAlertWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AXFrontBoardIsSystemAppShowingAlert();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)focusedAppPIDWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__AXSpringBoardServerHelper_focusedAppPIDWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE5AC8;
  v7[4] = &v8;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __61__AXSpringBoardServerHelper_focusedAppPIDWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  AXFrontBoardFocusedAppPID();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int)purpleBuddyPIDWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__AXSpringBoardServerHelper_purpleBuddyPIDWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LODWORD(v4) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);

  return (int)v4;
}

uint64_t __62__AXSpringBoardServerHelper_purpleBuddyPIDWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AXFrontBoardPurpleBuddyPID();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)runningAppPIDsWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__AXSpringBoardServerHelper_runningAppPIDsWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE5AC8;
  v7[4] = &v8;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __62__AXSpringBoardServerHelper_runningAppPIDsWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  AXFrontBoardRunningAppPIDs();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isSystemAppFrontmostExcludingSiri:(BOOL)a3 withServerInstance:(id)a4
{
  id v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__AXSpringBoardServerHelper_isSystemAppFrontmostExcludingSiri_withServerInstance___block_invoke;
  v11[3] = &unk_24DDE60D0;
  v14 = a3;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  objc_msgSend(v7, "performSynchronousReadingBlock:", v11);

  v9 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __82__AXSpringBoardServerHelper_isSystemAppFrontmostExcludingSiri_withServerInstance___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  AXFrontBoardSystemAppProcess();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AXFrontBoardFocusedAppProcessesForGuidedAccess();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3
    || objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)isSettingsAppFrontmostWithServerInstance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__AXSpringBoardServerHelper_isSettingsAppFrontmostWithServerInstance___block_invoke;
  v8[3] = &unk_24DDE60F8;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __70__AXSpringBoardServerHelper_isSettingsAppFrontmostWithServerInstance___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  AXFrontBoardSystemAppProcess();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AXFrontBoardFocusedAppProcess();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == v2
    || objc_msgSend(*(id *)(a1 + 32), "isScreenLockedWithServerInstance:", *(_QWORD *)(a1 + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (id)focusedAppsWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__AXSpringBoardServerHelper_focusedAppsWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE5AC8;
  v7[4] = &v8;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __59__AXSpringBoardServerHelper_focusedAppsWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  AXFrontBoardFocusedApps();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)displayIdentifierForSceneIdentifier:(id)a3 serverInstance:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[AXSpringBoardServerHelper _axActiveWindowScene](AXSpringBoardServerHelper, "_axActiveWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("sceneManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeSetForKey:", CFSTR("allScenes"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "safeValueForKey:", CFSTR("identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v5);

        if (v15)
        {
          objc_opt_class();
          objc_msgSend(v8, "safeValueForKey:", CFSTR("displayIdentity"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v18, "displayID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)focusedOccludedAppScenesWithServerInstance:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t k;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;
  id obj;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t j;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  LOBYTE(v41) = 0;
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("windowSceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "safeSetForKey:", CFSTR("connectedWindowScenes"));
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v52 != v18)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "safeValueForKey:", CFSTR("switcherController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "safeBoolForKey:", CFSTR("isChamoisWindowingUIEnabled")))
        {
          objc_msgSend(v22, "safeValueForKey:", CFSTR("contentViewController"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "safeValueForKey:", CFSTR("_currentMainAppLayout"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v19, "safeArrayForKey:", CFSTR("leafAppLayouts"));
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          if (v26)
          {
            v24 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v48 != v24)
                  objc_enumerationMutation(v23);
                v5 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                v41 = 0;
                v42 = &v41;
                v43 = 0x3032000000;
                v44 = __Block_byref_object_copy__0;
                v45 = __Block_byref_object_dispose__0;
                v46 = 0;
                v34 = MEMORY[0x24BDAC760];
                v35 = 3221225472;
                v36 = __72__AXSpringBoardServerHelper_focusedOccludedAppScenesWithServerInstance___block_invoke;
                v37 = &unk_24DDE5D00;
                v40 = &v41;
                v38 = v25;
                v39 = v5;
                AXPerformSafeBlock();
                v28 = (id)v42[5];

                _Block_object_dispose(&v41, 8);
                if (objc_msgSend(v28, "safeBoolForKey:", CFSTR("isSelectable")))
                {
                  objc_msgSend(v5, "safeDictionaryForKey:", CFSTR("itemsToLayoutAttributesMap"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = 0u;
                  v33 = 0u;
                  v30 = 0u;
                  v31 = 0u;
                  objc_msgSend(v27, "allKeys");
                  v6 = (void *)objc_claimAutoreleasedReturnValue();
                  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v55, 16);
                  if (v7)
                  {
                    v8 = *(_QWORD *)v31;
                    do
                    {
                      for (k = 0; k != v7; ++k)
                      {
                        if (*(_QWORD *)v31 != v8)
                          objc_enumerationMutation(v6);
                        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
                        objc_msgSend(v10, "safeStringForKey:", CFSTR("bundleIdentifier"));
                        v11 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v10, "safeStringForKey:", CFSTR("uniqueIdentifier"));
                        v12 = (void *)objc_claimAutoreleasedReturnValue();
                        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE005A0]), "initWithBundleIdentifier:fbSceneIdentifier:", v11, v12);
                        objc_msgSend(v3, "addObject:", v13);

                      }
                      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v55, 16);
                    }
                    while (v7);
                  }

                }
              }
              v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            }
            while (v26);
          }

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v20);
  }

  return v3;
}

void __72__AXSpringBoardServerHelper_focusedOccludedAppScenesWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_itemContainerForAppLayoutIfExists:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isPurpleBuddyAppFrontmostWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__AXSpringBoardServerHelper_isPurpleBuddyAppFrontmostWithServerInstance___block_invoke;
  v6[3] = &unk_24DDE5AC8;
  v6[4] = &v7;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

uint64_t __73__AXSpringBoardServerHelper_isPurpleBuddyAppFrontmostWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AXIsPurpleBuddyFrontmost();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)frontmostAppProcessWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__AXSpringBoardServerHelper_frontmostAppProcessWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE5AC8;
  v7[4] = &v8;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __67__AXSpringBoardServerHelper_frontmostAppProcessWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  AXFrontBoardFocusedAppProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)focusedAppProcessWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__AXSpringBoardServerHelper_focusedAppProcessWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE5AC8;
  v7[4] = &v8;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __65__AXSpringBoardServerHelper_focusedAppProcessWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  AXFrontBoardFocusedAppProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)runningAppProcessesWithServerInstance:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__AXSpringBoardServerHelper_runningAppProcessesWithServerInstance___block_invoke;
  v7[3] = &unk_24DDE5AC8;
  v7[4] = &v8;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __67__AXSpringBoardServerHelper_runningAppProcessesWithServerInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  AXFrontBoardRunningAppProcesses();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_visibleTripleClickItems
{
  -[AXSpringBoardServerHelper _updateVisibleTripleClickItems](self, "_updateVisibleTripleClickItems");
  return self->_visibleTripleClickItems;
}

- (void)_updateVisibleTripleClickItems
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray removeAllObjects](self->_visibleTripleClickItems, "removeAllObjects");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)_AXSTripleClickCopyOptions();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (-[AXSpringBoardServerHelper _shouldShowTCOption:](self, "_shouldShowTCOption:", objc_msgSend(v8, "intValue", (_QWORD)v9)))
        {
          -[NSMutableArray addObject:](self->_visibleTripleClickItems, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[AXSpringBoardServerHelper _sortVisibleItems](self, "_sortVisibleItems");
}

- (BOOL)isBuddyRunning
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[AXSpringBoardServerHelper runningAppProcessesWithServerInstance:](self, "runningAppProcessesWithServerInstance:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__AXSpringBoardServerHelper_isBuddyRunning__block_invoke;
  v5[3] = &unk_24DDE6120;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__AXSpringBoardServerHelper_isBuddyRunning__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isPreferencesFrontmost
{
  void *v2;
  void *v3;
  char v4;

  AXFrontBoardFocusedAppProcess();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFE400]);

  return v4;
}

- (BOOL)isInCallServiceFrontmost
{
  void *v2;
  void *v3;
  char v4;

  AXFrontBoardFocusedAppProcess();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFE078]);

  return v4;
}

- (BOOL)isPasscodeLockVisible
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;

  AXSpringBoardGlueSBLockScreenControllerInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isPasscodeEntryTransientOverlayVisible"));
  AXSBLockScreenEnvironment();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("passcodeViewPresenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isPasscodeLockVisible"));

  return v3 | v6;
}

- (BOOL)isLockScreenVisible
{
  void *v2;
  char v3;

  AXSpringBoardGlueSBLockScreenControllerInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isLockScreenVisible"));

  return v3;
}

- (BOOL)_shouldShowTCOption:(int)a3
{
  uint64_t v3;
  int v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v23;
  int v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  uint8_t v30[16];
  uint8_t buf[16];

  v3 = *(_QWORD *)&a3;
  LOBYTE(v5) = 0;
  switch(a3)
  {
    case 5:
      return v5;
    case 6:
    case 9:
    case 10:
    case 11:
    case 13:
    case 14:
    case 15:
      goto LABEL_13;
    case 7:
      if (!-[AXSpringBoardServerHelper isSystemAppFrontmostExcludingSiri:withServerInstance:](self, "isSystemAppFrontmostExcludingSiri:withServerInstance:", 0, 0))goto LABEL_8;
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "guidedAccessEnableExperimentalUI");

      if ((v7 & 1) != 0)
        goto LABEL_8;
      v8 = -[AXSpringBoardServerHelper hasActiveOrPendingCallOrFaceTimeWithServerInstance:](self, "hasActiveOrPendingCallOrFaceTimeWithServerInstance:", 0);
      GAXLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (!v8)
      {
        if (v10)
        {
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_21AC77000, v9, OS_LOG_TYPE_DEFAULT, "Not showing Guided Access in triple click: system app is frontmost.", v30, 2u);
        }
LABEL_32:

        goto LABEL_41;
      }
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AC77000, v9, OS_LOG_TYPE_DEFAULT, "Showing Guided Access in triple click due to call.", buf, 2u);
      }

LABEL_8:
      if (-[AXSpringBoardServerHelper isAppSwitcherVisibleWithServerInstance:](self, "isAppSwitcherVisibleWithServerInstance:", 0))
      {
        GAXLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 0;
          v12 = "Not showing Guided Access in triple click: app switcher is active.";
          v13 = (uint8_t *)&v29;
LABEL_39:
          _os_log_impl(&dword_21AC77000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      -[AXSpringBoardServerHelper sideAppManager](self, "sideAppManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "hasMultipleApps");

      if (v24)
      {
        GAXLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 0;
          v12 = "Not showing Guided Access in triple click: multiple apps are active.";
          v13 = (uint8_t *)&v28;
          goto LABEL_39;
        }
LABEL_40:

LABEL_41:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (-[AXSpringBoardServerHelper isMakingEmergencyCallWithServerInstance:](self, "isMakingEmergencyCallWithServerInstance:", 0))
      {
        GAXLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 0;
          v12 = "Not showing Guided Access in triple click: emergency call.";
          v13 = (uint8_t *)&v27;
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      if (-[AXSpringBoardServerHelper isBuddyRunning](self, "isBuddyRunning"))
      {
        GAXLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 0;
          v12 = "Not showing Guided Access in triple click: setup.";
          v13 = (uint8_t *)&v26;
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      if (-[AXSpringBoardServerHelper isPreferencesFrontmost](self, "isPreferencesFrontmost"))
      {
        GAXLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 0;
          v12 = "Not showing Guided Access in triple click: Settings is frontmost.";
          v13 = (uint8_t *)&v25;
          goto LABEL_39;
        }
        goto LABEL_40;
      }
LABEL_13:
      objc_msgSend(MEMORY[0x24BE00738], "titleForTripleClickOption:", v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v16, "length") != 0;
LABEL_23:

      return v5;
    case 8:
      objc_msgSend(MEMORY[0x24BE4BE50], "sharedInstance");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject pairedHearingAids](v9, "pairedHearingAids");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_32;
      v18 = (void *)v17;
      objc_msgSend(MEMORY[0x24BE4BE50], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isiCloudPaired");

      if ((v20 & 1) != 0)
        goto LABEL_41;
      if (-[AXSpringBoardServerHelper isScreenLockedWithServerInstance:](self, "isScreenLockedWithServerInstance:", 0))
      {
        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v21, "allowHearingAidControlOnLockScreen");

        if (!v5)
          return v5;
      }
LABEL_12:
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "voiceOverActivationWorkaround");

      if (v15 != 3)
        goto LABEL_13;
      goto LABEL_41;
    case 12:
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isMagnifierVisible") & 1) != 0)
        LOBYTE(v5) = 0;
      else
        v5 = !-[AXSpringBoardServerHelper isPasscodeLockVisible](self, "isPasscodeLockVisible");
      goto LABEL_23;
    case 16:
      return AXDeviceIsUnlocked();
    default:
      if (a3 == 1)
        goto LABEL_12;
      goto LABEL_13;
  }
}

- (void)_sortVisibleItems
{
  void *v3;
  void *v4;
  NSMutableArray *visibleTripleClickItems;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tripleClickOrderedOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  visibleTripleClickItems = self->_visibleTripleClickItems;
  if (v4)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __46__AXSpringBoardServerHelper__sortVisibleItems__block_invoke;
    v13[3] = &unk_24DDE6148;
    v14 = v4;
    -[NSMutableArray sortUsingComparator:](visibleTripleClickItems, "sortUsingComparator:", v13);
    objc_msgSend(MEMORY[0x24BDFE4A0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "ignoreLogging");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4A0], "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        AXColorizeFormatLog();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_impl(&dword_21AC77000, v9, v10, "%{public}@", buf, 0xCu);
        }

      }
    }

  }
  else
  {
    -[NSMutableArray sortUsingComparator:](visibleTripleClickItems, "sortUsingComparator:", &__block_literal_global_1440);
  }

}

uint64_t __46__AXSpringBoardServerHelper__sortVisibleItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

uint64_t __46__AXSpringBoardServerHelper__sortVisibleItems__block_invoke_1439(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "intValue") == 1)
  {
    v6 = -1;
  }
  else if (objc_msgSend(v5, "intValue") == 1)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE00738], "titleForTripleClickOption:", objc_msgSend(v4, "intValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE00738], "titleForTripleClickOption:", objc_msgSend(v5, "intValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "localizedCompare:", v8);

  }
  return v6;
}

- (void)_handleAlertActionPress:(id)a3
{
  void (**alertHandler)(id, uint64_t);
  id v5;

  alertHandler = (void (**)(id, uint64_t))self->_alertHandler;
  if (alertHandler)
  {
    alertHandler[2](alertHandler, objc_msgSend(a3, "buttonIndex"));
    v5 = self->_alertHandler;
  }
  else
  {
    v5 = 0;
  }
  self->_alertHandler = 0;

  -[AXSpringBoardServerHelper _cleanupAlertController](self, "_cleanupAlertController");
}

- (void)_toggleTripleClickDisplay
{
  AXSpringBoardServerHelper *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  AXSpringBoardServerHelper *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSMutableArray *obj;
  _QWORD v33[5];
  _QWORD v34[4];
  __CFString *v35;
  AXSpringBoardServerHelper *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  const __CFString *v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v2 = self;
  v45 = *MEMORY[0x24BDAC8D0];
  -[UIWindow rootViewController](self->_presentationWindow, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AXSpringBoardServerHelper _dismissAlertController](v2, "_dismissAlertController");
    AXLogSpringboardServer();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AC77000, v6, OS_LOG_TYPE_DEFAULT, "Triple click: dismissed.", buf, 2u);
    }
  }
  else
  {
    if (_AXSLiveSpeechEnabled())
      _AXSLiveSpeechSetEnabled();
    SBAXLocalizedString(CFSTR("ask.sheet.title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXTripleClickAlertController alertControllerWithTitle:message:preferredStyle:](AXTripleClickAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, 0, AXDeviceIsPad());
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSObject _accessibilitySetBoolValue:forKey:](v6, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("IsTripleClick"));
    -[AXSpringBoardServerHelper _updateVisibleTripleClickItems](v2, "_updateVisibleTripleClickItems");
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v2->_visibleTripleClickItems;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          v12 = v6;
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "intValue");
          objc_msgSend(MEMORY[0x24BE00738], "titleForTripleClickOption:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = &stru_24DDEA460;
          if (v15)
            v16 = (__CFString *)v15;
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke;
          v34[3] = &unk_24DDE61B0;
          v35 = v16;
          v36 = v2;
          v17 = v16;
          +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v17, 0, v34);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setButtonIndex:", objc_msgSend(v13, "integerValue"));
          v19 = v2;
          v20 = (void *)MEMORY[0x24BE00738];
          v21 = objc_msgSend(v13, "intValue");
          v22 = v20;
          v2 = v19;
          objc_msgSend(v18, "_setChecked:", objc_msgSend(v22, "valueForTripleClickOption:", v21));
          v6 = v12;
          -[NSObject addAction:](v12, "addAction:", v18);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v9);
    }

    AXParameterizedLocalizedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke_1448;
    v33[3] = &unk_24DDE61D8;
    v33[4] = v2;
    +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v23, 1, v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject addAction:](v6, "addAction:", v24);
    if (-[NSMutableArray count](v2->_visibleTripleClickItems, "count"))
    {
      if (-[NSMutableArray count](v2->_visibleTripleClickItems, "count") == 1)
      {
        -[NSObject actions](v6, "actions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSpringBoardServerHelper _handleAlertActionPress:](v2, "_handleAlertActionPress:", v26);

      }
      else
      {
        v2->_shouldOverrideInterfaceOrientation = 1;
        -[AXSpringBoardServerHelper _displayAlertController:](v2, "_displayAlertController:", v6);
        AXLogSpringboardServer();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AC77000, v27, OS_LOG_TYPE_DEFAULT, "Triple click: presented.", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *MEMORY[0x24BE00350];
        v42 = CFSTR("windowContextID");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[UIWindow _contextId](v2->_presentationWindow, "_contextId"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v30;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "postNotificationName:object:userInfo:", v29, 0, v31);

        AXPerformBlockOnMainThreadAfterDelay();
      }
    }
    else
    {
      -[AXSpringBoardServerHelper _handleAlertActionPress:](v2, "_handleAlertActionPress:", v24);
    }

  }
}

void __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AXLogSpringboardServer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_21AC77000, v4, OS_LOG_TYPE_DEFAULT, "Triple click: selected %@.", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_handleAlertActionPress:", v3);
}

void __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke_1448(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  AXLogSpringboardServer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21AC77000, v4, OS_LOG_TYPE_DEFAULT, "Triple click: canceled.", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", v3);
}

uint64_t __54__AXSpringBoardServerHelper__toggleTripleClickDisplay__block_invoke_1451(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

- (void)_displayAlertController:(id)a3
{
  id v4;

  -[AXSpringBoardServerHelper _displayViewController:withCompletion:](self, "_displayViewController:withCompletion:", a3, 0);
  objc_msgSend(MEMORY[0x24BE005B0], "assertionWithType:identifier:", *MEMORY[0x24BDFFCA8], CFSTR("AXSpringBoardServerHelper"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSpringBoardServerHelper setDisableSystemGesturesAssertionForAlert:](self, "setDisableSystemGesturesAssertionForAlert:", v4);

}

- (void)_displayViewController:(id)a3
{
  -[AXSpringBoardServerHelper _displayViewController:withCompletion:](self, "_displayViewController:withCompletion:", a3, 0);
}

- (void)_displayViewController:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  UIWindow *presentationWindow;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  UIWindow *v16;
  UIWindow *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  if (!-[AXSpringBoardServerHelper _isDisplayingAlertController](self, "_isDisplayingAlertController"))
  {
    presentationWindow = self->_presentationWindow;
    if (!presentationWindow)
    {
      v9 = NSClassFromString(CFSTR("AX_SBSecureMainScreenActiveInterfaceOrientationWindow"));
      if (!v9)
      {
        AXLogValidations();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[AXSpringBoardServerHelper _displayViewController:withCompletion:].cold.2();

        v9 = (void *)objc_opt_class();
      }
      v11 = objc_msgSend(v9, "isEqual:", NSClassFromString(CFSTR("AX_SBSecureMainScreenActiveInterfaceOrientationWindow")));
      v12 = objc_alloc_init(MEMORY[0x24BEBDB08]);
      v13 = v12;
      if (v11)
      {
        v22 = v12;
        AXPerformSafeBlock();

      }
      else
      {
        v14 = objc_alloc((Class)v9);
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bounds");
        v16 = (UIWindow *)objc_msgSend(v14, "initWithFrame:");
        v17 = self->_presentationWindow;
        self->_presentationWindow = v16;

        -[UIWindow setRootViewController:](self->_presentationWindow, "setRootViewController:", v13);
      }
      -[UIWindow setAutorotates:](self->_presentationWindow, "setAutorotates:", 1);
      -[UIWindow setAccessibilityViewIsModal:](self->_presentationWindow, "setAccessibilityViewIsModal:", 1);
      -[UIWindow setHidden:](self->_presentationWindow, "setHidden:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        AXSBPrepareWindowForTripleClickSpeaking(self->_presentationWindow);
      -[UIWindow setWindowLevel:](self->_presentationWindow, "setWindowLevel:", 10000009.0);
      -[AXSpringBoardServerHelper presentationWindowFocusAssertion](self, "presentationWindowFocusAssertion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        AXLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          -[AXSpringBoardServerHelper _displayViewController:withCompletion:].cold.1();

      }
      -[AXSpringBoardServerHelper presentationWindowFocusAssertion](self, "presentationWindowFocusAssertion");

      if ((v11 & 1) != 0)
      {
        objc_opt_class();
        -[UIWindow safeValueForKey:](self->_presentationWindow, "safeValueForKey:", CFSTR("contentViewController"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:
        objc_msgSend(v21, "presentViewController:animated:completion:", v6, 1, &__block_literal_global_1462);
        goto LABEL_20;
      }
      presentationWindow = self->_presentationWindow;
    }
    -[UIWindow rootViewController](presentationWindow, "rootViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_20;
    goto LABEL_19;
  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __67__AXSpringBoardServerHelper__displayViewController_withCompletion___block_invoke;
  v23[3] = &unk_24DDE6200;
  v23[4] = self;
  v24 = v6;
  v25 = v7;
  -[AXSpringBoardServerHelper _dismissAlertControllerWithCompletion:](self, "_dismissAlertControllerWithCompletion:", v23);

LABEL_21:
}

uint64_t __67__AXSpringBoardServerHelper__displayViewController_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayViewController:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __67__AXSpringBoardServerHelper__displayViewController_withCompletion___block_invoke_1455(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithRole:debugName:", CFSTR("SBTraitsParticipantRoleAlert"), CFSTR("AccessibilityShortcut"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setContentViewController:", *(_QWORD *)(a1 + 40));
}

void __67__AXSpringBoardServerHelper__displayViewController_withCompletion___block_invoke_1461()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setNeedsFocusUpdate");

}

- (BOOL)_isDisplayingAlertController
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIWindow rootViewController](self->_presentationWindow, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_dismissAlertController
{
  -[AXSpringBoardServerHelper _dismissAlertControllerWithCompletion:](self, "_dismissAlertControllerWithCompletion:", 0);
}

- (void)_dismissAlertControllerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  AXSpringBoardServerHelper *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __67__AXSpringBoardServerHelper__dismissAlertControllerWithCompletion___block_invoke;
  v10 = &unk_24DDE6088;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = _Block_copy(&v7);
  -[AXSpringBoardServerHelper _dismissViewControllerWithCompletion:](self, "_dismissViewControllerWithCompletion:", v6, v7, v8, v9, v10, v11);

}

uint64_t __67__AXSpringBoardServerHelper__dismissAlertControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "dismissAlertWithCancel");
  objc_msgSend(*(id *)(a1 + 32), "_cleanupAlertController");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_dismissViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[UIWindow rootViewController](self->_presentationWindow, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__AXSpringBoardServerHelper__dismissViewControllerWithCompletion___block_invoke;
  v8[3] = &unk_24DDE6088;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);

}

uint64_t __66__AXSpringBoardServerHelper__dismissViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupPresentationWindow");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_cleanupAlertController
{
  -[AXSpringBoardServerHelper _cleanupPresentationWindow](self, "_cleanupPresentationWindow");
  -[AXSpringBoardServerHelper setDisableSystemGesturesAssertionForAlert:](self, "setDisableSystemGesturesAssertionForAlert:", 0);
}

- (void)_cleanupPresentationWindow
{
  UIWindow *presentationWindow;
  void *v4;

  -[UIWindow setHidden:](self->_presentationWindow, "setHidden:", 1);
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = 0;

  -[AXSpringBoardServerHelper presentationWindowFocusAssertion](self, "presentationWindowFocusAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[AXSpringBoardServerHelper setPresentationWindowFocusAssertion:](self, "setPresentationWindowFocusAssertion:", 0);
}

- (void)dismissAlertWithCancel
{
  void (**alertHandler)(id, uint64_t);

  alertHandler = (void (**)(id, uint64_t))self->_alertHandler;
  if (alertHandler)
  {
    alertHandler[2](alertHandler, 0x7FFFFFFFFFFFFFFFLL);
    alertHandler = (void (**)(id, uint64_t))self->_alertHandler;
  }
  self->_alertHandler = 0;

}

- (void)_handleTripleClickAskAlert
{
  void *v3;
  char v4;
  _BOOL4 v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_accessibilityObjectWithinProximity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = -[AXSpringBoardServerHelper isSystemSleepingWithServerInstance:](self, "isSystemSleepingWithServerInstance:", 0);
  if ((v4 & 1) != 0 || v5)
    -[AXSpringBoardServerHelper dismissAlertWithCancel](self, "dismissAlertWithCancel");
  else
    -[AXSpringBoardServerHelper _toggleTripleClickDisplay](self, "_toggleTripleClickDisplay");

}

- (void)_handleZoomConflictAlert:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  SBAXLocalizedString(CFSTR("ZoomConflictMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("ZoomConflictTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v7, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("No"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__AXSpringBoardServerHelper__handleZoomConflictAlert___block_invoke;
  v17[3] = &unk_24DDE61D8;
  v17[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v11, 1, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setButtonIndex:", 0);
  objc_msgSend(v10, "addAction:", v13);
  SBAXLocalizedString(CFSTR("Yes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __54__AXSpringBoardServerHelper__handleZoomConflictAlert___block_invoke_2;
  v16[3] = &unk_24DDE61D8;
  v16[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v14, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setButtonIndex:", 1);
  objc_msgSend(v10, "addAction:", v15);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v10);

}

uint64_t __54__AXSpringBoardServerHelper__handleZoomConflictAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __54__AXSpringBoardServerHelper__handleZoomConflictAlert___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleZoomTripleClickAfterConflict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  AXLocStringKeyForHomeButtonAndExclusiveModel();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedStringWithTable(v3, CFSTR("Accessibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("TripleClickEnableTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("No"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__AXSpringBoardServerHelper__handleZoomTripleClickAfterConflict__block_invoke;
  v14[3] = &unk_24DDE61D8;
  v14[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v8, 1, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setButtonIndex:", 0);
  objc_msgSend(v7, "addAction:", v10);
  SBAXLocalizedString(CFSTR("Yes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __64__AXSpringBoardServerHelper__handleZoomTripleClickAfterConflict__block_invoke_2;
  v13[3] = &unk_24DDE61D8;
  v13[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v11, 0, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setButtonIndex:", 1);
  objc_msgSend(v7, "addAction:", v12);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v7);

}

uint64_t __64__AXSpringBoardServerHelper__handleZoomTripleClickAfterConflict__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __64__AXSpringBoardServerHelper__handleZoomTripleClickAfterConflict__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleDisableBrightnessFiltersAlert:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = *MEMORY[0x24BED2750];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BED2758]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    SBAXLocalizedStringWithTable(v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BED2748]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    SBAXLocalizedStringWithTable(v10, v6);
  }
  else
  {
    SBAXLocalizedString(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BED2748]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    SBAXLocalizedString(v10);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(CFSTR("cancel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __66__AXSpringBoardServerHelper__handleDisableBrightnessFiltersAlert___block_invoke;
  v19[3] = &unk_24DDE61D8;
  v19[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v13, 1, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setButtonIndex:", 0);
  objc_msgSend(v12, "addAction:", v15);
  SBAXLocalizedString(CFSTR("enable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __66__AXSpringBoardServerHelper__handleDisableBrightnessFiltersAlert___block_invoke_2;
  v18[3] = &unk_24DDE61D8;
  v18[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v16, 0, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setButtonIndex:", 1);
  objc_msgSend(v12, "addAction:", v17);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v12);

}

uint64_t __66__AXSpringBoardServerHelper__handleDisableBrightnessFiltersAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __66__AXSpringBoardServerHelper__handleDisableBrightnessFiltersAlert___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (id)_handleConfirmationDialogWithMessage:(id)a3 confirmTitle:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[5];

  v6 = (void *)MEMORY[0x24BEBD3B0];
  v7 = a4;
  v8 = a3;
  SBAXLocalizedString(CFSTR("USAGE_CONFIRMED_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v9, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("cancel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__AXSpringBoardServerHelper__handleConfirmationDialogWithMessage_confirmTitle___block_invoke;
  v17[3] = &unk_24DDE61D8;
  v17[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v11, 1, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v13);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __79__AXSpringBoardServerHelper__handleConfirmationDialogWithMessage_confirmTitle___block_invoke_2;
  v16[3] = &unk_24DDE61D8;
  v16[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v7, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setButtonIndex:", 0);
  objc_msgSend(v10, "addAction:", v14);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v10);

  return v10;
}

uint64_t __79__AXSpringBoardServerHelper__handleConfirmationDialogWithMessage_confirmTitle___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __79__AXSpringBoardServerHelper__handleConfirmationDialogWithMessage_confirmTitle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (id)_handleVOConfirmationDialogWithMessage:(id)a3 confirmTitle:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", a3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("VO_USAGE_CONFIRMED_ALERT"));

  SBAXLocalizedString(CFSTR("VoiceOver.confirmation.launchTutorial"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke;
  v17[3] = &unk_24DDE61D8;
  v17[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v7, 0, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setButtonIndex:", 0);
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("VO_USAGE_CONFIRMED_TUTORIAL_BUTTON"));
  objc_msgSend(v5, "addAction:", v9);
  SBAXLocalizedString(CFSTR("VoiceOver.confirmation.useVO"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke_2;
  v16[3] = &unk_24DDE61D8;
  v16[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v10, 0, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v11);
  SBAXLocalizedString(CFSTR("cancel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke_3;
  v15[3] = &unk_24DDE61D8;
  v15[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v12, 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v13);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v5);

  return v5;
}

void __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchOnboardingViewService:", CFSTR("voiceover"));

}

uint64_t __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __81__AXSpringBoardServerHelper__handleVOConfirmationDialogWithMessage_confirmTitle___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (id)_handleUsageConfirmationDialogWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  SBAXLocalizedString(CFSTR("OK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpringBoardServerHelper _handleConfirmationDialogWithMessage:confirmTitle:](self, "_handleConfirmationDialogWithMessage:confirmTitle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_handleVOUsageConfirmationDialogWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  SBAXLocalizedString(CFSTR("OK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpringBoardServerHelper _handleVOConfirmationDialogWithMessage:confirmTitle:](self, "_handleVOConfirmationDialogWithMessage:confirmTitle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_handleVoiceOverUsageConfirmation
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  AXLocStringKeyForHomeButton();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocStringKeyForModel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[AXSpringBoardServerHelper _handleVOUsageConfirmationDialogWithMessage:](self, "_handleVOUsageConfirmationDialogWithMessage:", v6);
}

- (void)_handleVONoHomeButtonGestureAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("voiceover.home.gesture.alert.title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocStringKeyForModel();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__AXSpringBoardServerHelper__handleVONoHomeButtonGestureAlert__block_invoke;
  v10[3] = &unk_24DDE61D8;
  v10[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v8, 0, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v9);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v7);

}

uint64_t __62__AXSpringBoardServerHelper__handleVONoHomeButtonGestureAlert__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleAlwaysOnBluetoothModeForVoiceOver
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("vo.bluetooth.always.on.for.braille"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(CFSTR("vo.bluetooth.always.on.for.message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("OK"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__AXSpringBoardServerHelper__handleAlwaysOnBluetoothModeForVoiceOver__block_invoke;
  v13[3] = &unk_24DDE61D8;
  v13[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v7, 0, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setButtonIndex:", 0);
  objc_msgSend(v6, "addAction:", v9);
  SBAXLocalizedString(CFSTR("cancel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __69__AXSpringBoardServerHelper__handleAlwaysOnBluetoothModeForVoiceOver__block_invoke_2;
  v12[3] = &unk_24DDE61D8;
  v12[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v10, 1, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setButtonIndex:", 1);
  objc_msgSend(v6, "addAction:", v11);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v6);

}

uint64_t __69__AXSpringBoardServerHelper__handleAlwaysOnBluetoothModeForVoiceOver__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __69__AXSpringBoardServerHelper__handleAlwaysOnBluetoothModeForVoiceOver__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleDisallowUSBRestrictedModeVOInformativeOnly:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = a3;
  if ((AXDeviceIsPod() & 1) != 0)
  {
    v5 = CFSTR("vo.disallow.usb.restricted.mode.alert.message_IPOD");
    if (!v3)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (AXDeviceIsPad())
    v5 = CFSTR("vo.disallow.usb.restricted.mode.alert.message_IPAD");
  else
    v5 = CFSTR("vo.disallow.usb.restricted.mode.alert.message_IPHONE");
  if (v3)
  {
LABEL_8:
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(".informativeOnly"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v6 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("vo.disallow.usb.restricted.mode.alert.title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("OK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__AXSpringBoardServerHelper__handleDisallowUSBRestrictedModeVOInformativeOnly___block_invoke;
  v12[3] = &unk_24DDE61D8;
  v12[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v11);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v9);

}

uint64_t __79__AXSpringBoardServerHelper__handleDisallowUSBRestrictedModeVOInformativeOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleDisallowUSBRestrictedModeSCInformativeOnly:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = a3;
  if ((AXDeviceIsPod() & 1) != 0)
  {
    v5 = CFSTR("sc.disallow.usb.restricted.mode.alert.message_IPOD");
    if (!v3)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (AXDeviceIsPad())
    v5 = CFSTR("sc.disallow.usb.restricted.mode.alert.message_IPAD");
  else
    v5 = CFSTR("sc.disallow.usb.restricted.mode.alert.message_IPHONE");
  if (v3)
  {
LABEL_8:
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(".informativeOnly"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v6 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("sc.disallow.usb.restricted.mode.alert.title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("OK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__AXSpringBoardServerHelper__handleDisallowUSBRestrictedModeSCInformativeOnly___block_invoke;
  v12[3] = &unk_24DDE61D8;
  v12[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v11);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v9);

}

uint64_t __79__AXSpringBoardServerHelper__handleDisallowUSBRestrictedModeSCInformativeOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleASTMenuFullForInstance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("DWELL_CONTROL_CUSTOMIZE_MENU"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(CFSTR("DWELL_CONTROL_ADD_DWELL_SCROLL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("No"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__AXSpringBoardServerHelper__handleASTMenuFullForInstance___block_invoke;
  v17[3] = &unk_24DDE61D8;
  v17[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v9, 1, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setButtonIndex:", 0);
  objc_msgSend(v8, "addAction:", v11);
  SBAXLocalizedString(CFSTR("DWELL_CONTROL_CUSTOMIZE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __59__AXSpringBoardServerHelper__handleASTMenuFullForInstance___block_invoke_2;
  v15[3] = &unk_24DDE61B0;
  v15[4] = self;
  v16 = v4;
  v13 = v4;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v12, 0, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setButtonIndex:", 1);
  objc_msgSend(v8, "addAction:", v14);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v8);

}

uint64_t __59__AXSpringBoardServerHelper__handleASTMenuFullForInstance___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __59__AXSpringBoardServerHelper__handleASTMenuFullForInstance___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "openMenuCustomizationForASTWithServerInstance:", *(_QWORD *)(a1 + 40));
}

- (void)_handleASTMenuCustomizeAddDwell:(BOOL)a3 addScroll:(BOOL)a4
{
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v5 = CFSTR("DWELL_CONTROL_ADD_DWELL");
  if (a4)
    v5 = CFSTR("DWELL_CONTROL_ADD_DWELL_SCROLL");
  if (!a3)
    v5 = CFSTR("DWELL_CONTROL_ADD_SCROLL");
  v6 = (void *)MEMORY[0x24BEBD3B0];
  v7 = v5;
  SBAXLocalizedString(CFSTR("DWELL_CONTROL_CUSTOMIZE_MENU"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("cancel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__AXSpringBoardServerHelper__handleASTMenuCustomizeAddDwell_addScroll___block_invoke;
  v17[3] = &unk_24DDE61D8;
  v17[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v11, 1, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setButtonIndex:", 0);
  objc_msgSend(v10, "addAction:", v13);
  SBAXLocalizedString(CFSTR("Yes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __71__AXSpringBoardServerHelper__handleASTMenuCustomizeAddDwell_addScroll___block_invoke_2;
  v16[3] = &unk_24DDE61D8;
  v16[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v14, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setButtonIndex:", 1);
  objc_msgSend(v10, "addAction:", v15);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v10);

}

uint64_t __71__AXSpringBoardServerHelper__handleASTMenuCustomizeAddDwell_addScroll___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __71__AXSpringBoardServerHelper__handleASTMenuCustomizeAddDwell_addScroll___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleConnectedDevicesHaveAssistiveTouchCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedStringWithTable(CFSTR("devices.require.ast.title"), CFSTR("Accessibility-hello"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedStringWithTable(CFSTR("devices.have.ast.customActions"), CFSTR("Accessibility-hello"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("cancel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__AXSpringBoardServerHelper__handleConnectedDevicesHaveAssistiveTouchCustomActions__block_invoke;
  v13[3] = &unk_24DDE61D8;
  v13[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v7, 1, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setButtonIndex:", 0);
  objc_msgSend(v6, "addAction:", v9);
  SBAXLocalizedString(CFSTR("turn.off"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __83__AXSpringBoardServerHelper__handleConnectedDevicesHaveAssistiveTouchCustomActions__block_invoke_2;
  v12[3] = &unk_24DDE61D8;
  v12[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v10, 2, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setButtonIndex:", 1);
  objc_msgSend(v6, "addAction:", v11);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v6);

}

uint64_t __83__AXSpringBoardServerHelper__handleConnectedDevicesHaveAssistiveTouchCustomActions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __83__AXSpringBoardServerHelper__handleConnectedDevicesHaveAssistiveTouchCustomActions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleSecureItentAlertForSwitchAST
{
  int v3;
  BOOL v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = _AXSAssistiveTouchEnabled();
  v4 = v3 == 0;
  if (v3)
    v5 = CFSTR("SECURE_INTENT_ALERT_FIRST_USE_TITLE_AST");
  else
    v5 = CFSTR("SECURE_INTENT_ALERT_FIRST_USE_TITLE_SC");
  if (v4)
    v6 = CFSTR("SECURE_INTENT_ALERT_FIRST_USE_BODY_SC");
  else
    v6 = CFSTR("SECURE_INTENT_ALERT_FIRST_USE_BODY_AST");
  SBAXLocalizedString(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(CFSTR("OK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__AXSpringBoardServerHelper__handleSecureItentAlertForSwitchAST__block_invoke;
  v12[3] = &unk_24DDE61D8;
  v12[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v11);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v9);

}

uint64_t __64__AXSpringBoardServerHelper__handleSecureItentAlertForSwitchAST__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleSwitchUsageConfirmed
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  AXLocStringKeyForHomeButton();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocStringKeyForModel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[AXSpringBoardServerHelper _handleUsageConfirmationDialogWithMessage:](self, "_handleUsageConfirmationDialogWithMessage:", v6);
}

- (void)_handleDisableAssistiveTouchConfirmation
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  AXUILocalizedStringForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("Yes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXSpringBoardServerHelper _handleConfirmationDialogWithMessage:confirmTitle:](self, "_handleConfirmationDialogWithMessage:confirmTitle:", v6, v4);

}

- (void)_handleDisableSwitchControlConfirmation
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  AXUILocalizedStringForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("Yes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXSpringBoardServerHelper _handleConfirmationDialogWithMessage:confirmTitle:](self, "_handleConfirmationDialogWithMessage:confirmTitle:", v6, v4);

}

- (void)_handleDisableFKAConfirmation
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  AXUILocalizedStringForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("Yes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXSpringBoardServerHelper _handleConfirmationDialogWithMessage:confirmTitle:](self, "_handleConfirmationDialogWithMessage:confirmTitle:", v6, v4);

}

- (void)_handleLiveTranscriptionConfirmation
{
  void *v3;
  uint64_t v4;
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
  _QWORD v15[5];
  _QWORD v16[5];

  SBAXLocalizedString(CFSTR("OK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65__AXSpringBoardServerHelper__handleLiveTranscriptionConfirmation__block_invoke;
  v16[3] = &unk_24DDE61D8;
  v16[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v3, 0, v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setButtonIndex:", 1);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("kAXLiveTranscriptionConfirmationAlertDefaultsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v7, "isEqualToString:", CFSTR("AXLiveTranscriptionAlertShowed")))
  {
    -[AXSpringBoardServerHelper _handleAlertActionPress:](self, "_handleAlertActionPress:", v5);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BEBD3B0];
    AXUILocalizedStringForKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AXLocStringKeyForModel();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXUILocalizedStringForKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    SBAXLocalizedString(CFSTR("cancel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __65__AXSpringBoardServerHelper__handleLiveTranscriptionConfirmation__block_invoke_2;
    v15[3] = &unk_24DDE61D8;
    v15[4] = self;
    +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v13, 1, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setButtonIndex:", 0);
    objc_msgSend(v12, "addAction:", v14);
    objc_msgSend(v12, "addAction:", v5);
    -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v12);

  }
}

void __65__AXSpringBoardServerHelper__handleLiveTranscriptionConfirmation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v6 = a2;
  objc_msgSend(v3, "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("AXLiveTranscriptionAlertShowed"), CFSTR("kAXLiveTranscriptionConfirmationAlertDefaultsKey"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronize");

  objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", v6);
}

uint64_t __65__AXSpringBoardServerHelper__handleLiveTranscriptionConfirmation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleDisableOnDeviceEyeTrackingConfirmation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  SBAXLocalizedString(CFSTR("OK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__AXSpringBoardServerHelper__handleDisableOnDeviceEyeTrackingConfirmation__block_invoke;
  v13[3] = &unk_24DDE61D8;
  v13[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v3, 0, v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setButtonIndex:", 1);
  v6 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("USAGE_CONFIRMED_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXUILocalizedStringForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("cancel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __74__AXSpringBoardServerHelper__handleDisableOnDeviceEyeTrackingConfirmation__block_invoke_2;
  v12[3] = &unk_24DDE61D8;
  v12[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v10, 1, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setButtonIndex:", 0);
  objc_msgSend(v9, "addAction:", v11);
  objc_msgSend(v9, "addAction:", v5);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v9);

}

void __74__AXSpringBoardServerHelper__handleDisableOnDeviceEyeTrackingConfirmation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE006C0];
  v5 = a2;
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", v5);
}

uint64_t __74__AXSpringBoardServerHelper__handleDisableOnDeviceEyeTrackingConfirmation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleTouchAccommodationsUsageConfirmed
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  AXLocStringKeyForHomeButton();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocStringKeyForModel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[AXSpringBoardServerHelper _handleUsageConfirmationDialogWithMessage:](self, "_handleUsageConfirmationDialogWithMessage:", v6);
}

- (void)handleBrokenHomeButtonAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("broken.home.button.title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsSwitchControlRunning())
  {
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, &stru_24DDEA460, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBAXLocalizedString(CFSTR("broken.home.button.message"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  SBAXLocalizedString(CFSTR("OK"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__AXSpringBoardServerHelper_handleBrokenHomeButtonAlert__block_invoke;
  v9[3] = &unk_24DDE61D8;
  v9[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v7, 0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v8);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v5);

}

uint64_t __56__AXSpringBoardServerHelper_handleBrokenHomeButtonAlert__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleZoomInBuddyAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(CFSTR("enable.zoom.purple.buddy.title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBAXLocalizedString(CFSTR("enable.zoom.purple.buddy.message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("cancel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__AXSpringBoardServerHelper__handleZoomInBuddyAlert__block_invoke;
  v13[3] = &unk_24DDE61D8;
  v13[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v7, 1, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v9);
  SBAXLocalizedString(CFSTR("enable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __52__AXSpringBoardServerHelper__handleZoomInBuddyAlert__block_invoke_2;
  v12[3] = &unk_24DDE61D8;
  v12[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setButtonIndex:", 0);
  objc_msgSend(v6, "addAction:", v11);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v6);

}

uint64_t __52__AXSpringBoardServerHelper__handleZoomInBuddyAlert__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __52__AXSpringBoardServerHelper__handleZoomInBuddyAlert__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (void)_handleConfirmRebootDevice
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  if ((AXDeviceIsPad() & 1) != 0)
  {
    v3 = CFSTR("REBOOT_ALERT_MESSAGE_IPAD");
  }
  else if (AXDeviceIsPod())
  {
    v3 = CFSTR("REBOOT_ALERT_MESSAGE_IPOD");
  }
  else
  {
    v3 = CFSTR("REBOOT_ALERT_MESSAGE_IPHONE");
  }
  v4 = (void *)MEMORY[0x24BEBD3B0];
  SBAXLocalizedString(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", 0, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBAXLocalizedString(CFSTR("cancel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__AXSpringBoardServerHelper__handleConfirmRebootDevice__block_invoke;
  v13[3] = &unk_24DDE61D8;
  v13[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v7, 1, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v9);
  SBAXLocalizedString(CFSTR("REBOOT_ALERT_CONFIRM"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __55__AXSpringBoardServerHelper__handleConfirmRebootDevice__block_invoke_2;
  v12[3] = &unk_24DDE61D8;
  v12[4] = self;
  +[AXAlertAction actionWithTitle:style:handler:](AXAlertAction, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setButtonIndex:", 0);
  objc_msgSend(v6, "addAction:", v11);
  -[AXSpringBoardServerHelper _displayAlertController:](self, "_displayAlertController:", v6);

}

uint64_t __55__AXSpringBoardServerHelper__handleConfirmRebootDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

uint64_t __55__AXSpringBoardServerHelper__handleConfirmRebootDevice__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertActionPress:", a2);
}

- (BOOL)_accessibilityHandleHomeOrLockButtonPress
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;

  if (!UIAccessibilityIsGuidedAccessEnabled())
  {
    objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notifyZoomHomeButtonWasPressed");

  }
  v3 = objc_msgSend((id)SBServerHelper, "_isDisplayingAlertController");
  if (v3)
  {
    objc_msgSend((id)SBServerHelper, "_dismissAlertController");
  }
  else
  {
    +[AXSBHearingAidDeviceController sharedController](AXSBHearingAidDeviceController, "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isShowingHearingAidControl");

    if (v5)
    {
      +[AXSBHearingAidDeviceController sharedController](AXSBHearingAidDeviceController, "sharedController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "showHearingAidControl:", 0);

    }
  }
  return v3;
}

- (void)didFailToFloatAppForSideAppManager:(id)a3
{
  id v3;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "springBoardActionOccurred:", 12);

}

- (void)didFailToPinAppForSideAppManager:(id)a3
{
  id v3;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "springBoardActionOccurred:", 11);

}

- (AXSpringBoardServerAlertManager)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
  objc_storeStrong((id *)&self->_alertManager, a3);
}

- (UIWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_presentationWindow, a3);
}

- (BSInvalidatable)presentationWindowFocusAssertion
{
  return self->_presentationWindowFocusAssertion;
}

- (void)setPresentationWindowFocusAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_presentationWindowFocusAssertion, a3);
}

- (AXSSMotionTrackingInputManager)motionTrackingInputManager
{
  return self->_motionTrackingInputManager;
}

- (FBSDisplayLayoutMonitor)continuityDisplayMonitor
{
  return self->_continuityDisplayMonitor;
}

- (void)setContinuityDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_continuityDisplayMonitor, a3);
}

- (BOOL)contintuityDisplayIsActive
{
  return self->_contintuityDisplayIsActive;
}

- (void)setContintuityDisplayIsActive:(BOOL)a3
{
  self->_contintuityDisplayIsActive = a3;
}

- (AXAssertion)disableSystemGesturesAssertionForAlert
{
  return self->_disableSystemGesturesAssertionForAlert;
}

- (void)setDisableSystemGesturesAssertionForAlert:(id)a3
{
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertionForAlert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertionForAlert, 0);
  objc_storeStrong((id *)&self->_continuityDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_motionTrackingInputManager, 0);
  objc_storeStrong((id *)&self->_presentationWindowFocusAssertion, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_alertManager, 0);
  objc_storeStrong((id *)&self->_axFeatureCache, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_visibleTripleClickItems, 0);
  objc_storeStrong(&self->_alertHandler, 0);
}

- (void)launchVoiceOverImageExplorerViewServiceWithServerInstance:(uint64_t)a1 forData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_21AC77000, a2, v5, "%@ - Unable to unarchive AXSBImageExplorerData object from imageData", v6);

  OUTLINED_FUNCTION_3();
}

- (void)launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_21AC77000, v0, v1, "Failed to archive AXSBImageExplorerData. error: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)launchVoiceOverImageExplorerViewServiceWithServerInstance:(void *)a1 forData:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "hostAppName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_21AC77000, a2, v4, "displayName : %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)setSecurePayAccessibilityFeaturesDisabled:withServerInstance:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21AC77000, v0, v1, "Unable to encode feature cache map: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)appNameFromPid:withServerInstance:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_21AC77000, v0, v1, "Couldn't get appID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)appNameFromPid:(void *)a1 withServerInstance:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21AC77000, a2, v4, "Couldn't read appName from record, error = %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)appNameFromPid:withServerInstance:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_21AC77000, v0, v1, "Host AppID: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)appNameFromPid:withServerInstance:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_21AC77000, v0, v1, "Process AppID: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)appNameFromPid:(void *)a1 withServerInstance:(NSObject *)a2 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21AC77000, a2, v4, "Couldn't get process handle, error = %@", v5);

  OUTLINED_FUNCTION_3();
}

void __80__AXSpringBoardServerHelper_presentNearbyDeviceControlPickerWithServerInstance___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_21AC77000, v0, v1, "Failed to unlock device - do not present nearby devices UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)nativeFocusedApplication
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21AC77000, v0, v1, "Error getting process handle for native focused application: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_displayViewController:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_21AC77000, v0, v1, "Unexpectedly had a presentation window focus assertion, even though the presentation window was created from scratch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_displayViewController:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_21AC77000, v0, v1, "Could not find the class for SBSecureMainScreenActiveInterfaceOrientationWindow.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
