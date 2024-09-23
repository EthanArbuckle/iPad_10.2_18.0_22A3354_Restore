@implementation SpringBoardAccessibility

- (BOOL)_accessibilityIsSystemAppServer
{
  return 1;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SpringBoard");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_isDim"), "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("_AXSpringBoardServerInstance"), CFSTR("springBoardServerInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("handleDoubleHeightStatusBarTapWithStyleOverride:"), "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_keyboardOrCaseLatchWantsToAttemptUnlock:"), "v", "i", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBControlCenterController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMediaController"), CFSTR("isPlaying"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMediaController"), CFSTR("isPaused"), "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBConferenceManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBConferenceManager"), CFSTR("faceTimeInvitationExists"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBConferenceManager"), CFSTR("inFaceTime"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBConferenceManager"), CFSTR("endFaceTime"), "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBControlCenterController"), CFSTR("_viewController"), "UIViewController<CCUIMainViewController>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIMainViewController"), CFSTR("_statusLabelViewContainerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIStatusBar"), CFSTR("_compactTrailingStatusBar"), "UIStatusBar");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIStatusBar"), CFSTR("_expandedStatusBar"), "UIStatusBar");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerViewController"), CFSTR("setGridSizeClass:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIHeaderPocketView"), CFSTR("statusBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("isInternalApplication"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppSwitcherPageView"), CFSTR("_overlayClippingView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBAssistantWindow"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBSceneManagerCoordinator"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIController"), CFSTR("_activateApplicationFromAccessibility:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("applicationWithBundleIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("unlockUIFromSource:withOptions:"), "B", "i", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("lockScreenEnvironment"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBLockScreenEnvironment"), CFSTR("rootViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBLockScreenViewControllerBase"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBLockScreenViewControllerBase"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("notificationDispatcher"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBNCNotificationDispatcher"), CFSTR("_alertingController"), "SBNCAlertingController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCAlertingController"), CFSTR("soundController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCNotificationDispatcher"), CFSTR("bannerDestination"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCNotificationDispatcher"), CFSTR("dashBoardDestination"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNotificationBannerDestination"), CFSTR("isPresentingBannerInLongLook"), "B", 0);
  objc_msgSend(v3, "validateProtocol:conformsToProtocol:", CFSTR("SBNotificationDestination"), CFSTR("SBFNotificationLongLookPresenting"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBFNotificationLongLookPresenting"), CFSTR("isPresentingNotificationInLongLook"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBMainDisplaySceneManager"), CFSTR("SBSceneManager"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneManager"), CFSTR("windowScene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindowScene"), CFSTR("keyWindow"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleItemContainers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherItemContainer"), CFSTR("_pageView"), "SBAppSwitcherPageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SpringBoard"), CFSTR("_extendedDisplayControllerProvider"), "SBSceneHostingDisplayControllerProvider");
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBSceneManagerCoordinator"), CFSTR("mainDisplaySceneManager"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBMainSwitcherControllerCoordinator"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFluidSwitcherViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBSwitcherController"), CFSTR("contentViewController"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFullScreenSwitcherSceneLiveContentOverlay"), CFSTR("deviceApplicationSceneViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBAppContainerViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainWorkspace"), CFSTR("pipCoordinator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBPIPControllerCoordinator"), CFSTR("_controllersByType"), "NSMutableDictionary");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("brightnessControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPController"), CFSTR("_leadingWindowForWindowScene:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPController"), CFSTR("_windowScenesDisplayingPIPContent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("applicationDidFinishLaunching:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SpringBoard"), CFSTR("_hasFinishedLaunching"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("restartManagerWillReboot:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_axIsFloatingSwitcherVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBHomeGrabberView"), CFSTR("_pillView"), "MTLumaDodgePillView");
  objc_msgSend(v3, "validateClass:", CFSTR("SBMainWorkspace"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMainWorkspace"), CFSTR("_instanceIfExists"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("ringerControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBMainWorkspace"), CFSTR("_keyboardFocusCoordinator"), "<SBKeyboardFocusControlling>");
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBKeyboardFocusControlling"), CFSTR("inputUISceneController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBInputUISceneController"), CFSTR("_inputUIScene"), "FBScene");
  objc_msgSend(v3, "validateClass:", CFSTR("SBRingerControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRingerControl"), CFSTR("_accessibilityIsRingerMuted"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBLayoutState"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutState"), CFSTR("elementWithRole:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBLayoutElement"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBApplicationSceneEntity"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationSceneEntity"), CFSTR("application"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBApplication"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleUnderlayAccessoryViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherSpaceUnderlayAccessoryView"), CFSTR("_resizeGrabber"), "SBSeparatorView");
  objc_msgSend(v3, "validateClass:", CFSTR("SiriPresentationSpringBoardMainScreenViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SiriPresentationSpringBoardMainScreenViewController"), CFSTR("SiriPresentationViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriPresentationViewController"), CFSTR("siriViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("AFUISiriViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AFUISiriViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriViewController"), CFSTR("_siriView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriViewController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("AFUISiriView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AFUISiriView"), CFSTR("_siriStatusView"), "UIView<SiriUISiriStatusViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScreenEdgePanGestureRecognizer"), CFSTR("_touchInterfaceOrientation"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBCommandTabController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBCommandTabController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCommandTabController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCommandTabController"), CFSTR("next"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("UIStatusBar_Modern"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarAccessibility"), CFSTR("_axSetIsHitTesting:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("bannerManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBannerManager"), CFSTR("isDisplayingBannerInWindowScene:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBBrightnessControl"), CFSTR("_displayBrightnessController"), "SBDisplayBrightnessController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayBrightnessController"), CFSTR("handleBrightnessKeyPressEvent:"), "v", "^{__IOHIDEvent=}", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBTopAffordanceDotsView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBTopAffordanceViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIApplicationAccessibility"), CFSTR("_accessibilityActiveScenes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("deviceOrientationUpdateDeferralAssertionWithReason:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBSystemApertureController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("systemApertureControllerForMainDisplay"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBSystemApertureViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureController"), CFSTR("_systemApertureViewController"), "SBSystemApertureViewController");
  objc_msgSend(v3, "validateClass:", CFSTR("SAUISystemApertureManager"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureViewController"), CFSTR("_systemApertureManager"), "SAUISystemApertureManager");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemApertureViewController"), CFSTR("minimumSensorRegionFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureViewController"), CFSTR("_orderedContainerViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBSystemApertureViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SAUISystemApertureManager"), CFSTR("_elementsToElementViewControllers"), "NSMapTable");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUIElementViewController"), CFSTR("_elementView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureViewController"), CFSTR("_indicatorContainerView"), "_SBSystemApertureIndicatorContainerView");
  objc_msgSend(v3, "validateClass:", CFSTR("SAUIIndicatorElementViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemApertureSceneElement"), CFSTR("elementIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowSceneManager"), CFSTR("connectedWindowScenes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("floatingDockController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("isFloatingDockFullyPresented"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("floatingDockViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFloatingDockViewController"), CFSTR("_dockView"), "SBFloatingDockView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconListView"), CFSTR("_iconViews"), "NSMapTable");
  objc_msgSend(v3, "validateClass:", CFSTR("SBStatusBarWindow"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBStatusBarWindow"), CFSTR("statusBar"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBTransientOverlayWindow"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SpringBoard"), CFSTR("_orientationAggregator"), "SBMainDisplayInterfaceOrientationAggregator");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayInterfaceOrientationAggregator"), CFSTR("interfaceOrientationSources"), "@", 0);

}

- (id)_accessibilityStatusBarElements:(BOOL)a3 sorted:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  void *v64;
  double v65;
  CGFloat x;
  double v67;
  CGFloat y;
  double v69;
  CGFloat width;
  double v71;
  CGFloat height;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  objc_class *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t n;
  void *v92;
  double v93;
  unint64_t v94;
  id v95;
  unint64_t v96;
  void *v97;
  void *v99;
  void *v100;
  char v101;
  void *v102;
  void *v103;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  id obj;
  id obja;
  void *v113;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  CGAffineTransform v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  CGAffineTransform v124;
  _QWORD v125[9];
  id v126;
  id v127;
  BOOL v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;

  v4 = a3;
  v151 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBADC8], "options");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setShouldUseAllSubviews:", 1);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v142;
    v107 = *(_QWORD *)v142;
    do
    {
      v11 = 0;
      v109 = v9;
      do
      {
        if (*(_QWORD *)v142 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v11);
        if (v4)
        {
          v13 = v4;
          objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * v11), "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v138;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v138 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * i), "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_551);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
            }
            while (v16);
          }
          objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v14);

          v4 = v13;
          v10 = v107;
          v9 = v109;
        }
        NSClassFromString(CFSTR("SBStatusBarWindow"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "safeUIViewForKey:", CFSTR("statusBar"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "_accessibilityViewIsVisible"))
            objc_msgSend(v113, "axSafelyAddObject:", v20);

        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
    }
    while (v9);
  }

  AXSBMainSwitcherControllerCoordinatorSharedInstance();
  obja = (id)objc_claimAutoreleasedReturnValue();
  AXSwitcherController(CFSTR("activeDisplayWindowScene"), obja);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "safeValueForKey:", CFSTR("contentViewController"));
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "safeDictionaryForKey:", CFSTR("visibleItemContainers"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v133, v148, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v134;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v134 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * j), "safeUIViewForKey:", CFSTR("_pageView"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "safeUIViewForKey:", CFSTR("_overlayClippingView"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_555);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "axSafelyAddObjectsFromArray:", v29);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v133, v148, 16);
    }
    while (v24);
  }

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBControlCenterController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "safeBoolForKey:", CFSTR("isVisible")))
  {
    objc_msgSend(v30, "safeValueForKey:", CFSTR("_viewController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "safeValueForKey:", CFSTR("_statusLabelViewContainerView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "safeValueForKey:", CFSTR("statusBar"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "safeValueForKey:", CFSTR("_compactTrailingStatusBar"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "axSafelyAddObject:", v34);

    objc_msgSend(v33, "safeValueForKey:", CFSTR("_expandedStatusBar"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "axSafelyAddObject:", v35);

  }
  v102 = v30;
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v36 = v113;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
  v38 = MEMORY[0x24BDAC760];
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v130;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v130 != v40)
          objc_enumerationMutation(v36);
        v42 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * k);
        if (objc_msgSend(v42, "_accessibilityViewIsVisible"))
        {
          objc_msgSend(v42, "safeValueForKey:", CFSTR("statusBar"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "_accessibilityViewIsVisible"))
          {
            v125[5] = v38;
            v125[6] = 3221225472;
            v125[7] = __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_4;
            v125[8] = &unk_250368690;
            v126 = v43;
            v128 = a4;
            v127 = v5;
            AXPerformSafeBlock();

          }
        }
      }
      v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
    }
    while (v39);
  }

  v125[0] = v38;
  v125[1] = 3221225472;
  v125[2] = __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_7;
  v125[3] = &__block_descriptor_40_e27_q24__0__UIView_8__UIView_16lu32l8;
  v125[4] = NSClassFromString(CFSTR("SBTopAffordanceDotsView"));
  objc_msgSend(v5, "sortUsingComparator:", v125);
  if (AXDeviceHasJindo())
  {
    -[SpringBoardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("systemApertureControllerForMainDisplay"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "safeValueForKey:", CFSTR("_systemApertureViewController"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "safeValueForKey:", CFSTR("_systemApertureManager"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v44, "safeBoolForKey:", CFSTR("_systemApertureContainsAnyContent"));
    objc_msgSend(v44, "safeCGRectForKey:", CFSTR("minimumSensorRegionFrame"));
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    objc_msgSend(v44, "safeUIViewForKey:", CFSTR("view"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v54;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      memset(&v124, 0, sizeof(v124));
      objc_msgSend(v54, "window");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      v57 = v45;
      if (v55)
        objc_msgSend(v55, "transform");
      else
        memset(&v124, 0, sizeof(v124));

      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      objc_msgSend(v44, "safeArrayForKey:", CFSTR("_orderedContainerViews"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v120, v146, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v121;
        do
        {
          for (m = 0; m != v60; ++m)
          {
            if (*(_QWORD *)v121 != v61)
              objc_enumerationMutation(v58);
            v63 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * m);
            objc_msgSend(v63, "window");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "bounds");
            objc_msgSend(v64, "convertRect:fromView:", v63);
            x = v65;
            y = v67;
            width = v69;
            height = v71;

            v152.origin.x = x;
            v152.origin.y = y;
            v152.size.width = width;
            v152.size.height = height;
            if (!CGRectIsEmpty(v152))
            {
              v119 = v124;
              if (!CGAffineTransformIsIdentity(&v119))
              {
                v119 = v124;
                v153.origin.x = x;
                v153.origin.y = y;
                v153.size.width = width;
                v153.size.height = height;
                v154 = CGRectApplyAffineTransform(v153, &v119);
                x = v154.origin.x;
                y = v154.origin.y;
                width = v154.size.width;
                height = v154.size.height;
              }
              v155.origin.x = v47;
              v155.origin.y = v49;
              v155.size.width = v51;
              v155.size.height = v53;
              v157.origin.x = x;
              v157.origin.y = y;
              v157.size.width = width;
              v157.size.height = height;
              v156 = CGRectUnion(v155, v157);
              v47 = v156.origin.x;
              v49 = v156.origin.y;
              v51 = v156.size.width;
              v53 = v156.size.height;
            }
          }
          v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v120, v146, 16);
        }
        while (v60);
      }

      v45 = v57;
    }
    v73 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    LOBYTE(v124.a) = 0;
    objc_msgSend(v45, "safeValueForKey:", CFSTR("_elementsToElementViewControllers"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (LOBYTE(v124.a))
      abort();
    v100 = v75;
    if (objc_msgSend(v75, "count"))
    {
      objc_msgSend(v75, "objectEnumerator");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "nextObject");
      v77 = objc_claimAutoreleasedReturnValue();
      if (v77)
      {
        v78 = (void *)v77;
        do
        {
          v79 = (objc_class *)objc_opt_class();
          if (v79 != NSClassFromString(CFSTR("SAUIIndicatorElementViewController")))
          {
            objc_msgSend(v78, "safeUIViewForKey:", CFSTR("_elementView"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "axSafelyAddObject:", v80);

          }
          objc_msgSend(v76, "nextObject");
          v81 = objc_claimAutoreleasedReturnValue();

          v78 = (void *)v81;
        }
        while (v81);
      }
      objc_msgSend(v73, "sortedArrayUsingComparator:", &__block_literal_global_573);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "mutableCopy");

      v73 = (id)v83;
    }
    objc_msgSend(v44, "safeValueForKey:", CFSTR("_indicatorContainerView"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "accessibilityLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
      objc_msgSend(v73, "axSafelyAddObject:", v84);
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v86 = v5;
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v115, v145, 16);
    if (v87)
    {
      v88 = v87;
      v99 = v44;
      v89 = v45;
      v90 = *(_QWORD *)v116;
      while (2)
      {
        for (n = 0; n != v88; ++n)
        {
          if (*(_QWORD *)v116 != v90)
            objc_enumerationMutation(v86);
          v92 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * n);
          objc_msgSend(v92, "frame");
          if (v93 > v47)
          {
            v94 = objc_msgSend(v86, "indexOfObject:", v92);
            goto LABEL_78;
          }
        }
        v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v115, v145, 16);
        if (v88)
          continue;
        break;
      }
      v94 = 0;
LABEL_78:
      v45 = v89;
      v44 = v99;
    }
    else
    {
      v94 = 0;
    }

    if ((v101 & 1) == 0)
      objc_msgSend(v73, "axSafelyAddObject:", v44);
    v95 = objc_alloc_init(MEMORY[0x24BDD1698]);
    if (v94 < objc_msgSend(v73, "count") + v94)
    {
      v96 = v94;
      do
        objc_msgSend(v95, "addIndex:", v96++);
      while (v96 < objc_msgSend(v73, "count") + v94);
    }
    objc_msgSend(v86, "insertObjects:atIndexes:", v73, v95);

  }
  -[SpringBoardAccessibility _accessibilityGeometrySortedElements:](self, "_accessibilityGeometrySortedElements:", v5);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  return v97;
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBTopAffordanceViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "accessibilityTraits");
  return (*MEMORY[0x24BEBB180] & v2) != 0;
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_axSetIsHitTesting:", 1);
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v2, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_559);
  else
    objc_msgSend(v2, "_accessibilityFindUnsortedSubviewDescendantsPassingTest:", &__block_literal_global_559);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_axSetIsHitTesting:", 0);
  return result;
}

BOOL __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "isAccessibilityElement"))
  {
    objc_msgSend(v2, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_561, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

uint64_t __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "accessibilityFrame");
    v8 = v7;
    objc_msgSend(v5, "accessibilityFrame");
    if (v8 <= v9)
    {
      v6 = -1;
    }
    else
    {
      objc_msgSend(v4, "accessibilityFrame");
      v11 = v10;
      objc_msgSend(v5, "accessibilityFrame");
      v6 = v11 >= v12;
    }
  }

  return v6;
}

BOOL __67__SpringBoardAccessibility__accessibilityStatusBarElements_sorted___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "frame");
  v6 = v5;
  objc_msgSend(v4, "frame");
  v8 = v7;

  return v6 < v8;
}

- (id)_firstStatusBarElement
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SpringBoardAccessibility;
  -[SpringBoardAccessibility _firstStatusBarElement](&v8, sel__firstStatusBarElement);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SpringBoardAccessibility _accessibilityStatusBarElements:sorted:](self, "_accessibilityStatusBarElements:sorted:", 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_lastStatusBarElement
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SpringBoardAccessibility;
  -[SpringBoardAccessibility _lastStatusBarElement](&v8, sel__lastStatusBarElement);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SpringBoardAccessibility _accessibilityStatusBarElements:sorted:](self, "_accessibilityStatusBarElements:sorted:", 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)_accessibilityShouldHitTestStatusBarWindow
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  AXFrontBoardFocusedAppProcesses();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    AXFrontBoardSystemAppProcess();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqual:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_accessibilityStatusBar
{
  void *v3;
  void *v4;
  objc_super v6;

  -[SpringBoardAccessibility _accessibilityMainWindow](self, "_accessibilityMainWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBAssistantWindow"));
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v3, "_accessibilityDescendantOfType:", objc_opt_class()),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)SpringBoardAccessibility;
    -[SpringBoardAccessibility _accessibilityStatusBar](&v6, sel__accessibilityStatusBar);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)_accessibilitySystemAppServerIsReady
{
  void *v2;
  BOOL v3;

  if (!-[SpringBoardAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_hasFinishedLaunching")))return 0;
  AXSBLockScreenViewController();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = NSClassFromString(CFSTR("AXSpringBoardServerHelper")) != 0;
  else
    v3 = 0;

  return v3;
}

- (void)_accessibilityHandleOrientationChange
{
  +[AXSpringBoardGlue handleOrientationChange](AXSpringBoardGlue, "handleOrientationChange");
}

- (void)_legacy_noteInterfaceOrientationChanged:(int64_t)a3 duration:(double)a4 updateMirroredDisplays:(BOOL)a5 force:(BOOL)a6 logMessage:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SpringBoardAccessibility;
  -[SpringBoardAccessibility _legacy_noteInterfaceOrientationChanged:duration:updateMirroredDisplays:force:logMessage:](&v8, sel__legacy_noteInterfaceOrientationChanged_duration_updateMirroredDisplays_force_logMessage_, a3, a5, a6, a7, a4);
  if (_legacy_noteInterfaceOrientationChanged_duration_updateMirroredDisplays_force_logMessage___LastPostedOrientation != a3)
  {
    _legacy_noteInterfaceOrientationChanged_duration_updateMirroredDisplays_force_logMessage___LastPostedOrientation = a3;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __117__SpringBoardAccessibility__legacy_noteInterfaceOrientationChanged_duration_updateMirroredDisplays_force_logMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityHandleOrientationChange");
}

- (id)_accessibilitySoftwareMimicKeyboard
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasscodeLockVisible");

  if (v4)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBLockScreenManager")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_lockScreenEnvironment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKeyPath:", CFSTR("rootViewController.view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilityFindDescendant:", &__block_literal_global_593);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SpringBoardAccessibility;
    -[SpringBoardAccessibility _accessibilitySoftwareMimicKeyboard](&v10, sel__accessibilitySoftwareMimicKeyboard);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __63__SpringBoardAccessibility__accessibilitySoftwareMimicKeyboard__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityIsSoftwareKeyboardMimic");
}

- (void)accessibilityInitialize
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  if ((SpringBoardAccessibility *)_SBAXInstance != self)
  {
    objc_storeStrong((id *)&_SBAXInstance, self);
    +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_VOTConnection;
    _VOTConnection = v3;

    *(double *)&_SBAXPhoneCallLastEnded = CFAbsoluteTimeGetCurrent() + -10.0;
    _AXStatusEnabled = _AXSApplicationAccessibilityEnabled() != 0;
    if ((accessibilityInitialize_DidEnable & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *MEMORY[0x24BEB4AB8];
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, v7, &__block_literal_global_600);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BEB0F28];
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x24BDAC760];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke_602;
      v19[3] = &unk_250368778;
      v19[4] = self;
      v13 = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, 0, v11, v19);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x24BDF7340];
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke_2;
      v18[3] = &unk_250368778;
      v18[4] = self;
      v17 = (id)objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v15, 0, v16, v18);

      accessibilityInitialize_DidEnable = 1;
    }
    -[SpringBoardAccessibility _accessibilityUpdateSpeakScreenGestureRecognizer](self, "_accessibilityUpdateSpeakScreenGestureRecognizer");
  }
}

void __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentCalls");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
  {
    AXLogSpringboardServer();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = 134217984;
      v4 = _SBAXPhoneCallLastEnded;
      _os_log_impl(&dword_232A0A000, v2, OS_LOG_TYPE_INFO, "marking last call at %f", (uint8_t *)&v3, 0xCu);
    }

    _SBAXPhoneCallLastEnded = CFAbsoluteTimeGetCurrent();
  }
}

uint64_t __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke_602(uint64_t a1)
{
  UIAccessibilityPostNotification(0x7EBu, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityUpdateRingerState");
}

uint64_t __51__SpringBoardAccessibility_accessibilityInitialize__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityUpdateSpeakScreenGestureRecognizer");
}

- (void)accessibilityDisable
{
  void *v2;

  v2 = (void *)_SBAXInstance;
  _SBAXInstance = 0;

  objc_msgSend((id)_VOTConnection, "tearDownVoiceOverTouchConnection");
}

- (BOOL)_accessibilityShouldLoadAXInfoOnAppLaunchFinish
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetShouldLoadAXInfoOnAppLaunchFinish:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_accessibilityShouldCallAXStatusChangedOnAppLaunchFinish
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetShouldCallAXStatusChangedOnAppLaunchFinish:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (-[SpringBoardAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_hasFinishedLaunching")))
  {
    v6.receiver = self;
    v6.super_class = (Class)SpringBoardAccessibility;
    -[SpringBoardAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBControlCenterController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBWallpaperController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");

    -[SpringBoardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_extendedDisplayControllerProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibilityLoadAccessibilityInformation");

    -[SpringBoardAccessibility accessibilityInitialize](self, "accessibilityInitialize");
  }
  else
  {
    -[SpringBoardAccessibility _accessibilitySetShouldLoadAXInfoOnAppLaunchFinish:](self, "_accessibilitySetShouldLoadAXInfoOnAppLaunchFinish:", 1);
  }
}

- (void)_accessibilityLoadPIPInfo
{
  void *v3;
  id v4;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainWorkspace")), "safeValueForKey:", CFSTR("_instanceIfExists"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SpringBoardAccessibility _accessibilityPIPCoordinator](self, "_accessibilityPIPCoordinator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");

  }
}

- (void)_accessibilityStatusChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SpringBoardAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXReenabledTimer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDFE490]);
    v5 = (void *)objc_msgSend(v6, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    -[SpringBoardAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("AXReenabledTimer"));
    objc_msgSend(v5, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__SpringBoardAccessibility__accessibilityStatusChanged___block_invoke;
  v8[3] = &unk_250367F90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "afterDelay:processBlock:", v8, 0.3);

}

uint64_t __56__SpringBoardAccessibility__accessibilityStatusChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processAccessibilityStatusChange:", *(_QWORD *)(a1 + 40));
}

- (void)_processAccessibilityStatusChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogLoading();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = -[SpringBoardAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_hasFinishedLaunching"));
    _os_log_impl(&dword_232A0A000, v5, OS_LOG_TYPE_DEFAULT, "SB AX Status change (finished: %d), ", buf, 8u);
  }

  if (-[SpringBoardAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_hasFinishedLaunching")))
  {
    v10.receiver = self;
    v10.super_class = (Class)SpringBoardAccessibility;
    -[SpringBoardAccessibility _accessibilityStatusChanged:](&v10, sel__accessibilityStatusChanged_, v4);
    v6 = _AXSApplicationAccessibilityEnabled();
    AXLogLoading();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v12 = v6 != 0;
      _os_log_impl(&dword_232A0A000, v7, OS_LOG_TYPE_INFO, "SB new status: %d, ", buf, 8u);
    }

    if (_AXStatusEnabled || !v6)
    {
      if (_AXStatusEnabled == (v6 != 0))
        objc_msgSend(MEMORY[0x24BEBADF8], "_accessibilityReenabled");
      _AXStatusEnabled = v6 != 0;
      if (!v6)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BDFEDB0], 0, 0, 1u);
        AXLogLoading();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_232A0A000, v9, OS_LOG_TYPE_INFO, "Posted kAXAccessibilityTurnedOff notification", buf, 2u);
        }

      }
    }
    else
    {
      -[SpringBoardAccessibility accessibilityInitialize](self, "accessibilityInitialize");
      -[SpringBoardAccessibility _accessibilityLoadPIPInfo](self, "_accessibilityLoadPIPInfo");
      _AXStatusEnabled = v6 != 0;
    }
  }
  else
  {
    -[SpringBoardAccessibility _accessibilitySetShouldCallAXStatusChangedOnAppLaunchFinish:](self, "_accessibilitySetShouldCallAXStatusChangedOnAppLaunchFinish:", 1);
  }

}

- (void)applicationDidFinishLaunching:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SpringBoardAccessibility;
  -[SpringBoardAccessibility applicationDidFinishLaunching:](&v4, sel_applicationDidFinishLaunching_, a3);
  if (-[SpringBoardAccessibility _accessibilityShouldCallAXStatusChangedOnAppLaunchFinish](self, "_accessibilityShouldCallAXStatusChangedOnAppLaunchFinish"))
  {
    -[SpringBoardAccessibility _accessibilityStatusChanged:](self, "_accessibilityStatusChanged:", 0);
  }
  if (-[SpringBoardAccessibility _accessibilityShouldLoadAXInfoOnAppLaunchFinish](self, "_accessibilityShouldLoadAXInfoOnAppLaunchFinish"))
  {
    -[SpringBoardAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  }
}

- (void)restartManagerWillReboot:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  accessibilityLocalizedString(CFSTR("rebooting.format"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", v5, v8);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)SpringBoardAccessibility;
  -[SpringBoardAccessibility restartManagerWillReboot:](&v10, sel_restartManagerWillReboot_, v4);

}

- (BOOL)_isDim
{
  objc_super v5;

  if (UIAccessibilityIsVoiceOverRunning() && _SBAXScreenCurtainEnabled && *(float *)&_SBAXRealBacklightFactor == 1.0)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)SpringBoardAccessibility;
  return -[SpringBoardAccessibility _isDim](&v5, sel__isDim);
}

- (void)_accessibilityDeactivationAnimationWillBegin
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SpringBoardAccessibility;
  -[SpringBoardAccessibility _accessibilityDeactivationAnimationWillBegin](&v2, sel__accessibilityDeactivationAnimationWillBegin);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB0D8], 0);
}

- (int64_t)_accessibilityApplicationOrientation
{
  int64_t result;

  LODWORD(result) = +[AXSpringBoardGlue applicationOrientation](AXSpringBoardGlue, "applicationOrientation");
  if (result >= 7)
    return 1;
  else
    return result;
}

- (BOOL)_accessibilityIsVoiceControlRunning
{
  void *v2;
  void *v3;
  BOOL v4;

  if (!_accessibilityIsVoiceControlRunning_VoiceControlClass)
    _accessibilityIsVoiceControlRunning_VoiceControlClass = (uint64_t)NSClassFromString(CFSTR("SBVoiceControlViewController"));
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindSubviewDescendant:", &__block_literal_global_627);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __63__SpringBoardAccessibility__accessibilityIsVoiceControlRunning__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityIsBatteryLow
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[objc_class safeValueForKey:](AXSpringBoardGlueSBUIControllerClass(), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("batteryCapacityAsPercentage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4 < 21;
}

- (BOOL)_accessibilityIsSystemLocked
{
  void *v2;
  char v3;

  +[AXSpringBoardGlue sharedInstance](AXSpringBoardGlue, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUILocked");

  return v3;
}

- (BOOL)_accessibilityIsAlarmRinging
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SpringBoardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("notificationDispatcher"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_alertingController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("soundController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityIsAlarmRinging");

  return v5;
}

- (BOOL)_accessibilityIsSystemSleeping
{
  void *v2;
  char v3;
  void *v5;
  char v6;

  -[SpringBoardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityObjectWithinProximity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) != 0)
    return 1;
  +[AXSpringBoardGlue sharedInstance](AXSpringBoardGlue, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDimmed");

  return v6;
}

- (BOOL)_accessibilitySystemWideGestureInProgress
{
  void *v2;
  char v3;

  -[SpringBoardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityIsSystemGestureActive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)_accessibilityLaunchableApps
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v15;
  id obj;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBIconController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBApplicationController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("allApplications"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "safeValueForKey:", CFSTR("bundleIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safeValueForKey:", CFSTR("displayName"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safeValueForKey:", CFSTR("isInternalApplication"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v12, "BOOLValue");

        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v21 = 0;
        v17 = v3;
        v13 = v10;
        AXPerformSafeBlock();
        if ((v9 & 1) == 0 && *((_BYTE *)v19 + 24) && v13 && v11)
          objc_msgSend(v15, "setObject:forKey:", v13, v11);

        _Block_object_dispose(&v18, 8);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  return v15;
}

void __56__SpringBoardAccessibility__accessibilityLaunchableApps__block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "applicationIconForBundleIdentifier:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "isIconVisible:", v3);

}

- (id)_accessibilityCenterPointOfScreen
{
  void *v2;
  void *v3;
  double MidX;
  void *v5;
  CGRect v7;
  CGRect v8;

  -[SpringBoardAccessibility _accessibilityMainWindow](self, "_accessibilityMainWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v7);
  objc_msgSend(v3, "bounds");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", MidX, CGRectGetMidY(v8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_accessibilityIsAppSwitcherVisible
{
  void *v2;
  char v3;

  AXSBMainSwitcherControllerCoordinatorSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isAnySwitcherVisible"));

  return v3;
}

- (id)_accessibilityAppSwitcherApps
{
  return 0;
}

- (BOOL)_accessibilityHitTestsStatusBar
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("bannerManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXWindowScene(CFSTR("activeDisplayWindowScene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isDisplayingBannerInWindowScene:", v5);

  return (char)v3;
}

- (BOOL)_accessibilityIsBuddyRunning
{
  return +[AXSpringBoardGlue isBuddyRunning](AXSpringBoardGlue, "isBuddyRunning");
}

- (id)_accessibilitySideAppDividerElement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  AXSBMainSwitcherControllerCoordinatorSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXSwitcherController(CFSTR("activeDisplayWindowScene"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("contentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "safeDictionaryForKey:", CFSTR("visibleUnderlayAccessoryViews"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "safeUIViewForKey:", CFSTR("_resizeGrabber"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "_accessibilityViewIsVisible") & 1) != 0)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (id)_accessibilityHomeAffordanceView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBSceneManagerCoordinator")), "safeValueForKey:", CFSTR("mainDisplaySceneManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("windowScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("keyWindow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityFindSubviewDescendant:", &__block_literal_global_646);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeUIViewForKey:", CFSTR("_pillView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __60__SpringBoardAccessibility__accessibilityHomeAffordanceView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SBHomeGrabberView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityPIPCoordinator
{
  void *v2;
  void *v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainWorkspace")), "safeValueForKey:", CFSTR("_instanceIfExists"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("pipCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPictureInPictureWindow
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[SpringBoardAccessibility _accessibilityPIPCoordinator](self, "_accessibilityPIPCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeDictionaryForKey:", CFSTR("_controllersByType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", &unk_250381828);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  objc_opt_class();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  v30 = 0;
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __64__SpringBoardAccessibility__accessibilityPictureInPictureWindow__block_invoke;
  v22 = &unk_250367C18;
  v24 = &v25;
  v5 = v4;
  v23 = v5;
  AXPerformSafeBlock();
  v6 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
    abort();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v32, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v8);
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__8;
      v29 = __Block_byref_object_dispose__8;
      v30 = 0;
      v14 = v5;
      AXPerformSafeBlock();
      v12 = (id)v26[5];

      _Block_object_dispose(&v25, 8);
      if (v12)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v32, 16);
        if (v9)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v12 = 0;
  }

  return v12;
}

void __64__SpringBoardAccessibility__accessibilityPictureInPictureWindow__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_windowScenesDisplayingPIPContent");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __64__SpringBoardAccessibility__accessibilityPictureInPictureWindow__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_leadingWindowForWindowScene:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  void *v3;
  uint64_t IsAssistantVisible;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  objc_super v13;

  if (a3 > 5039)
  {
    if (a3 == 5040)
    {
      -[SpringBoardAccessibility _accessibilitySideAppDividerElement](self, "_accessibilitySideAppDividerElement");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 5065)
    {
      -[SpringBoardAccessibility _accessibilityHomeAffordanceView](self, "_accessibilityHomeAffordanceView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_9:
      v13.receiver = self;
      v13.super_class = (Class)SpringBoardAccessibility;
      -[SpringBoardAccessibility _iosAccessibilityAttributeValue:](&v13, sel__iosAccessibilityAttributeValue_);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    switch(a3)
    {
      case 1500:
        v3 = (void *)MEMORY[0x24BDD16E0];
        IsAssistantVisible = -[SpringBoardAccessibility _accessibilityIsSystemLocked](self, "_accessibilityIsSystemLocked");
        goto LABEL_29;
      case 1501:
        v3 = (void *)MEMORY[0x24BDD16E0];
        if (-[SpringBoardAccessibility _accessibilityIsVoiceControlRunning](self, "_accessibilityIsVoiceControlRunning"))
        {
          v12 = 1;
        }
        else
        {
          IsAssistantVisible = AXSpringBoardIsAssistantVisible();
LABEL_29:
          v12 = IsAssistantVisible;
        }
        objc_msgSend(v3, "numberWithBool:", v12);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 1502:
      case 1511:
        goto LABEL_9;
      case 1503:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[SpringBoardAccessibility _accessibilityApplicationOrientation](self, "_accessibilityApplicationOrientation"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      case 1504:
        v3 = (void *)MEMORY[0x24BDD16E0];
        IsAssistantVisible = -[SpringBoardAccessibility _accessibilityIsBatteryLow](self, "_accessibilityIsBatteryLow");
        goto LABEL_29;
      case 1505:
        v6 = (void *)MEMORY[0x24BDD16E0];
        v7 = -[SpringBoardAccessibility _accessibilityCurrentCallState](self, "_accessibilityCurrentCallState");
        goto LABEL_23;
      case 1506:
        v3 = (void *)MEMORY[0x24BDD16E0];
        IsAssistantVisible = -[SpringBoardAccessibility _accessibilitySystemWideGestureInProgress](self, "_accessibilitySystemWideGestureInProgress");
        goto LABEL_29;
      case 1507:
        v3 = (void *)MEMORY[0x24BDD16E0];
        IsAssistantVisible = -[SpringBoardAccessibility _accessibilityIsSystemSleeping](self, "_accessibilityIsSystemSleeping");
        goto LABEL_29;
      case 1508:
        -[SpringBoardAccessibility _accessibilityLaunchableApps](self, "_accessibilityLaunchableApps");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      case 1509:
        -[SpringBoardAccessibility _accessibilityAppSwitcherApps](self, "_accessibilityAppSwitcherApps");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      case 1510:
        v3 = (void *)MEMORY[0x24BDD16E0];
        IsAssistantVisible = -[SpringBoardAccessibility _accessibilityIsAppSwitcherVisible](self, "_accessibilityIsAppSwitcherVisible");
        goto LABEL_29;
      case 1512:
        -[SpringBoardAccessibility _accessibilityCenterPointOfScreen](self, "_accessibilityCenterPointOfScreen");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      case 1513:
        -[SpringBoardAccessibility _accessibilityPictureInPictureWindow](self, "_accessibilityPictureInPictureWindow");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      case 1514:
        v3 = (void *)MEMORY[0x24BDD16E0];
        IsAssistantVisible = -[SpringBoardAccessibility _accessibilitySpringBoardIsModal](self, "_accessibilitySpringBoardIsModal");
        goto LABEL_29;
      case 1515:
        v3 = (void *)MEMORY[0x24BDD16E0];
        IsAssistantVisible = -[SpringBoardAccessibility _accessibilityIsAlarmRinging](self, "_accessibilityIsAlarmRinging");
        goto LABEL_29;
      case 1516:
        v8 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(MEMORY[0x24BE006F0], "server");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "isControlCenterVisible"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        return v10;
      case 1517:
        -[SpringBoardAccessibility _accessibilityFocusActiveActivityName](self, "_accessibilityFocusActiveActivityName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      default:
        if (a3 != 1107)
          goto LABEL_9;
        v6 = (void *)MEMORY[0x24BDD16E0];
        v7 = -[SpringBoardAccessibility _accessibilityRemoteKeyboardApp](self, "_accessibilityRemoteKeyboardApp");
LABEL_23:
        objc_msgSend(v6, "numberWithInt:", v7);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  return v5;
}

- (id)_accessibilityNextDockElementStartingAtDisplayID:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  unsigned int v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("windowSceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeSetForKey:", CFSTR("connectedWindowScenes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    v7 = 0;
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = v6;
    v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v39;
      v27 = v6;
      v28 = v5;
      v26 = a3;
      v29 = v8;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v39 != v33)
            objc_enumerationMutation(v8);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v10, "safeValueForKey:", CFSTR("floatingDockController"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "safeBoolForKey:", CFSTR("isFloatingDockFullyPresented")))
          {
            objc_msgSend(v10, "screen");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "displayIdentity");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "displayID");

            if (v14 != a3)
            {
              objc_msgSend(v11, "safeValueForKey:", CFSTR("floatingDockViewController"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "safeValueForKey:", CFSTR("_dockView"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "safeValueForKey:", CFSTR("_userIconListView"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = 0;
              objc_msgSend(v15, "safeValueForKey:", CFSTR("_iconViews"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              __UIAccessibilitySafeClass();
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
LABEL_28:
                abort();
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v18 = v17;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v35;
                while (2)
                {
                  for (j = 0; j != v20; ++j)
                  {
                    if (*(_QWORD *)v35 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
                    v42 = 0;
                    objc_msgSend(v18, "objectForKey:", v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    __UIAccessibilitySafeClass();
                    v7 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v42)
                      goto LABEL_28;
                    if (v7)
                    {

                      v6 = v27;
                      v5 = v28;
                      v8 = v29;
                      goto LABEL_26;
                    }
                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
                  if (v20)
                    continue;
                  break;
                }
              }

              a3 = v26;
              v8 = v29;
            }
          }

        }
        v7 = 0;
        v6 = v27;
        v5 = v28;
        v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v32);
    }
    else
    {
      v7 = 0;
    }
LABEL_26:

  }
  return v7;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v9;
  objc_super v11;

  if (a3 == 91513)
  {
    v5 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    -[SpringBoardAccessibility _accessibilityNextDockElementStartingAtDisplayID:](self, "_accessibilityNextDockElementStartingAtDisplayID:", objc_msgSend(v6, "unsignedIntValue"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SpringBoardAccessibility;
    v5 = a4;
    -[SpringBoardAccessibility _iosAccessibilityAttributeValue:forParameter:](&v11, sel__iosAccessibilityAttributeValue_forParameter_, a3, v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

  return v9;
}

- (id)_accessibilityFocusActiveActivityName
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getFCActivityManagerClass_softClass;
  v12 = getFCActivityManagerClass_softClass;
  if (!getFCActivityManagerClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getFCActivityManagerClass_block_invoke;
    v8[3] = &unk_250367CE0;
    v8[4] = &v9;
    __getFCActivityManagerClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v3, "sharedActivityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)_accessibilityRemoteKeyboardApp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SpringBoardAccessibility _axKeyboardFocusCoordinator](self, "_axKeyboardFocusCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_inputUISceneController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_inputUIScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "clientHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "pid");

  return (int)v4;
}

- (id)_accessibilityOrientationDeferralAssertion
{
  JUMPOUT(0x23491F7D4);
}

- (void)_setAccessibilityOrientationDeferralAssertion:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  const void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char isKindOfClass;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v61;
  objc_super v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t);
  void *v66;
  SpringBoardAccessibility *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t);
  void *v78;
  id v79;
  const void *v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t);
  void *v84;
  id v85;
  id v86;
  id v87;
  uint64_t *v88;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = v8;
  if ((int)v6 > 5300)
  {
    if ((_DWORD)v6 != 5301)
    {
      if ((_DWORD)v6 != 5303)
      {
LABEL_40:
        v62.receiver = self;
        v62.super_class = (Class)SpringBoardAccessibility;
        v16 = -[SpringBoardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:](&v62, sel__iosAccessibilityPerformAction_withValue_fencePort_, v6, v9, v5);
        goto LABEL_57;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        if ((unint64_t)objc_msgSend(v9, "count") < 2)
        {
          v13 = 0;
        }
        else
        {
          objc_msgSend(v9, "lastObject");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = -[SpringBoardAccessibility _accessibilitySwitchNativeFocusedApplicationWithPID:identifier:](self, "_accessibilitySwitchNativeFocusedApplicationWithPID:identifier:", v12, v13);
LABEL_49:

        goto LABEL_57;
      }
      FKALogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[SpringBoardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:].cold.4(v25, v51, v52, v53, v54, v55, v56, v57);
LABEL_42:

LABEL_56:
      v16 = 1;
      goto LABEL_57;
    }
    if (!v8)
    {
      v34 = 0;
      v33 = 0;
LABEL_55:
      LOBYTE(v69) = 0;
      objc_opt_class();
      -[SpringBoardAccessibility _axKeyboardFocusCoordinator](self, "_axKeyboardFocusCoordinator");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsSafeCategory();
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v59, "_accessibilitySetPrimaryKeyboardFocusOverridePid:sceneID:", v33, v34);
      goto LABEL_56;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "lastObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "intValue");

          objc_msgSend(v9, "lastObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!(_DWORD)v33)
          {
            FKALogCommon();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              -[SpringBoardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:].cold.2(v35, v36, v37, v38, v39, v40, v41, v42);

          }
          if (objc_msgSend(v34, "length"))
            goto LABEL_55;
          FKALogCommon();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            -[SpringBoardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:].cold.1(v43, v44, v45, v46, v47, v48, v49, v50);
          goto LABEL_54;
        }
      }
      else
      {

      }
    }
    FKALogCommon();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      -[SpringBoardAccessibility _iosAccessibilityPerformAction:withValue:fencePort:].cold.3((uint64_t)v9, v43);
    v34 = 0;
    v33 = 0;
LABEL_54:

    goto LABEL_55;
  }
  switch((int)v6)
  {
    case 5009:
      if (objc_msgSend(v8, "BOOLValue"))
      {
        -[SpringBoardAccessibility _accessibilityOrientationDeferralAssertion](self, "_accessibilityOrientationDeferralAssertion");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidate");
      }
      else
      {
        v69 = 0;
        v70 = &v69;
        v71 = 0x3032000000;
        v72 = __Block_byref_object_copy__8;
        v73 = __Block_byref_object_dispose__8;
        v74 = 0;
        v63 = MEMORY[0x24BDAC760];
        v64 = 3221225472;
        v65 = __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_675;
        v66 = &unk_250367C18;
        v67 = self;
        v68 = &v69;
        AXPerformSafeBlock();
        v10 = (id)v70[5];
        _Block_object_dispose(&v69, 8);

        -[SpringBoardAccessibility _setAccessibilityOrientationDeferralAssertion:](self, "_setAccessibilityOrientationDeferralAssertion:", v10);
      }

      goto LABEL_40;
    case 5010:
    case 5011:
      goto LABEL_40;
    case 5012:
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBUIController")), "safeValueForKey:", CFSTR("sharedInstance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBApplicationController")), "safeValueForKey:", CFSTR("sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      v70 = &v69;
      v71 = 0x2020000000;
      LOBYTE(v72) = 0;
      v81 = MEMORY[0x24BDAC760];
      v82 = 3221225472;
      v83 = __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke;
      v84 = &unk_250368800;
      v19 = v18;
      v85 = v19;
      v86 = v9;
      v13 = v17;
      v87 = v13;
      v88 = &v69;
      AXPerformSafeBlock();
      v16 = *((_BYTE *)v70 + 24) != 0;

      _Block_object_dispose(&v69, 8);
      goto LABEL_49;
    case 5013:
      LOBYTE(v69) = 0;
      objc_msgSend(MEMORY[0x24BDF6800], "safeValueForKeyPath:", CFSTR("brightnessControl._displayBrightnessController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v16 = objc_opt_isKindOfClass();
      if ((v16 & 1) != 0)
      {
        v21 = v9;
        v22 = objc_msgSend(v21, "newHIDEventRef");
        if (v22)
        {
          v23 = (const void *)v22;
          v75 = MEMORY[0x24BDAC760];
          v76 = 3221225472;
          v77 = __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_2;
          v78 = &unk_250368828;
          v79 = v14;
          v80 = v23;
          AXPerformSafeBlock();
          CFRelease(v23);

        }
      }
      goto LABEL_46;
    case 5014:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || -[SpringBoardAccessibility _accessibilityIsBuddyRunning](self, "_accessibilityIsBuddyRunning"))
      {
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "showControlCenter:", objc_msgSend(v9, "BOOLValue"));
      goto LABEL_45;
    case 5015:
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "voiceOverHandwritingWasNativeAutocorrectEnabled");
      v25 = objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        LOBYTE(v61) = 1;
        _AXLogWithFacility();
        objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController", v61, CFSTR("Restoring preferences changed by VOT Handwriting now"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setValue:forKey:", v25, 8);

        objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "synchronizePreferences");

        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setVoiceOverHandwritingWasNativeAutocorrectEnabled:", 0);

      }
      else
      {
        _AXAssert();
        _AXLogWithFacility();
      }
      goto LABEL_42;
    default:
      if ((_DWORD)v6 != 5000)
        goto LABEL_40;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || -[SpringBoardAccessibility _accessibilityIsBuddyRunning](self, "_accessibilityIsBuddyRunning"))
      {
LABEL_17:
        v16 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE006F0], "server");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "showNotificationCenter:", objc_msgSend(v9, "BOOLValue"));
LABEL_45:
        v16 = v15;
LABEL_46:

      }
      break;
  }
LABEL_57:

  return v16 & 1;
}

void __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "applicationWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 48), "_activateApplicationFromAccessibility:", v2);
    v2 = v3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

uint64_t __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrightnessKeyPressEvent:", *(_QWORD *)(a1 + 40));
}

void __79__SpringBoardAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_675(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("Accessibility"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityFocusableScenes
{
  void *v2;
  void *v3;

  -[SpringBoardAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_accessibilityActiveScenes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axFilterObjectsUsingBlock:", &__block_literal_global_681);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __57__SpringBoardAccessibility__accessibilityFocusableScenes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SBWindowScene"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axKeyboardFocusCoordinator
{
  void *v2;
  void *v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainWorkspace")), "safeValueForKey:", CFSTR("_instanceIfExists"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_keyboardFocusCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilitySwitchNativeFocusedApplicationWithPID:(int)a3 identifier:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_opt_class();
  -[SpringBoardAccessibility _axKeyboardFocusCoordinator](self, "_axKeyboardFocusCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v8, "_accessibilitySwitchNativeFocusedApplicationWithPID:identifier:", v4, v6);
  return v4;
}

- (int)_accessibilityCurrentCallState
{
  id v2;
  void *v3;
  char v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  AXPerformSafeBlock();
  v2 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  objc_msgSend(v2, "safeValueForKey:", CFSTR("incomingCallExists"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("activeCallExists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v2, "safeValueForKey:", CFSTR("outgoingCallExists"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if (v9)
        v5 = 3;
      else
        v5 = 0;
    }
  }

  return v5;
}

void __58__SpringBoardAccessibility__accessibilityCurrentCallState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[objc_class sharedTelephonyManagerCreatingIfNecessary:](AXSpringBoardGlueSBTelephonyManagerClass(), "sharedTelephonyManagerCreatingIfNecessary:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)accessibilityStartStopToggle
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  char v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  char v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  NSObject *v38;
  os_log_type_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  NSObject *v45;
  os_log_type_t v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  NSObject *v52;
  os_log_type_t v53;
  void *v54;
  void *v55;
  void *v56;
  os_log_type_t v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  os_log_type_t v62;
  void *v63;
  objc_super v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t);
  void *v69;
  NSObject *v70;
  uint8_t buf[4];
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  AXSBHIconManagerFromSharedIconController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEditing"));

  if (!v4)
  {
    if (AXSpringBoardIsAssistantVisible())
    {
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMediaController")), "safeValueForKey:", CFSTR("sharedInstance"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject safeBoolForKey:](v8, "safeBoolForKey:", CFSTR("isPlaying"))
        && (-[NSObject safeBoolForKey:](v8, "safeBoolForKey:", CFSTR("isPaused")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "ignoreLogging");

        if ((v50 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v52 = objc_claimAutoreleasedReturnValue();

          v53 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v52, v53))
          {
            AXColorizeFormatLog();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            _AXStringForArgs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, v53))
            {
              *(_DWORD *)buf = 138543362;
              v72 = v55;
              _os_log_impl(&dword_232A0A000, v52, v53, "%{public}@", buf, 0xCu);
            }

          }
        }
        v66 = MEMORY[0x24BDAC760];
        v67 = 3221225472;
        v68 = __56__SpringBoardAccessibility_accessibilityStartStopToggle__block_invoke;
        v69 = &unk_250367AD0;
        v8 = v8;
        v70 = v8;
        AXPerformSafeBlock();
        v7 = 1;
        v16 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "ignoreLogging");

        if ((v10 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v12 = objc_claimAutoreleasedReturnValue();

          v13 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v12, v13))
          {
            AXColorizeFormatLog();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            _AXStringForArgs();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, v13))
            {
              *(_DWORD *)buf = 138543362;
              v72 = v15;
              _os_log_impl(&dword_232A0A000, v12, v13, "%{public}@", buf, 0xCu);
            }

          }
        }
        -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBAssistantController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject safeValueForKey:](v16, "safeValueForKey:", CFSTR("_presentedMainScreenSiriPresentation"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "safeValueForKey:", CFSTR("siriViewController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "safeUIViewForKey:", CFSTR("_siriView"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "safeUIViewForKey:", CFSTR("siriStatusView"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v20, "accessibilityPerformMagicTap");

      }
      goto LABEL_63;
    }
    v65.receiver = self;
    v65.super_class = (Class)SpringBoardAccessibility;
    if (-[SpringBoardAccessibility accessibilityStartStopToggle](&v65, sel_accessibilityStartStopToggle))
    {
      objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "ignoreLogging");

      if ((v25 & 1) != 0)
        return 1;
      objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = 1;
      v57 = AXOSLogLevelFromAXLogLevel();
      if (!os_log_type_enabled(v8, v57))
        goto LABEL_64;
      AXColorizeFormatLog();
      v16 = objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v57))
      {
        *(_DWORD *)buf = 138543362;
        v72 = v58;
        _os_log_impl(&dword_232A0A000, v8, v57, "%{public}@", buf, 0xCu);
      }
      goto LABEL_62;
    }
    -[SpringBoardAccessibility _iosAccessibilityAttributeValue:](self, "_iosAccessibilityAttributeValue:", 1500);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    if (v27)
    {
      objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "ignoreLogging");

      if ((v29 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v31 = objc_claimAutoreleasedReturnValue();

        v32 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v31, v32))
        {
          AXColorizeFormatLog();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, v32))
          {
            *(_DWORD *)buf = 138543362;
            v72 = v34;
            _os_log_impl(&dword_232A0A000, v31, v32, "%{public}@", buf, 0xCu);
          }

        }
      }
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMediaController")), "safeValueForKey:", CFSTR("sharedInstance"));
      v8 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject safeBoolForKey:](v8, "safeBoolForKey:", CFSTR("isPlaying")) & 1) == 0
        && (-[NSObject safeBoolForKey:](v8, "safeBoolForKey:", CFSTR("isPaused")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "ignoreLogging");

        if ((v60 & 1) != 0)
        {
          v7 = 1;
          goto LABEL_64;
        }
        objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v16 = objc_claimAutoreleasedReturnValue();

        v7 = 1;
        v62 = AXOSLogLevelFromAXLogLevel();
        if (!os_log_type_enabled(v16, v62))
        {
LABEL_63:

          goto LABEL_64;
        }
        AXColorizeFormatLog();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, v62))
        {
          *(_DWORD *)buf = 138543362;
          v72 = v63;
          _os_log_impl(&dword_232A0A000, v16, v62, "%{public}@", buf, 0xCu);
        }

LABEL_62:
        v7 = 1;
        goto LABEL_63;
      }

    }
    objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "ignoreLogging");

    if ((v36 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v38 = objc_claimAutoreleasedReturnValue();

      v39 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v38, v39))
      {
        AXColorizeFormatLog();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        CFAbsoluteTimeGetCurrent();
        _AXStringForArgs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, v39))
        {
          *(_DWORD *)buf = 138543362;
          v72 = v41;
          _os_log_impl(&dword_232A0A000, v38, v39, "%{public}@", buf, 0xCu);
        }

      }
    }
    if (CFAbsoluteTimeGetCurrent() - *(double *)&_SBAXPhoneCallLastEnded <= 10.0)
      return 0;
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMediaController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "ignoreLogging");

    if ((v43 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v45 = objc_claimAutoreleasedReturnValue();

      v46 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v45, v46))
      {
        AXColorizeFormatLog();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, v46))
        {
          *(_DWORD *)buf = 138543362;
          v72 = v48;
          _os_log_impl(&dword_232A0A000, v45, v46, "%{public}@", buf, 0xCu);
        }

      }
    }
    v7 = 1;
    v16 = v8;
    goto LABEL_63;
  }
  objc_msgSend(MEMORY[0x24BDFE4C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4C0], "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v22 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v22))
    {
      AXColorizeFormatLog();
      v16 = objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v22))
      {
        *(_DWORD *)buf = 138543362;
        v72 = v23;
        _os_log_impl(&dword_232A0A000, v8, v22, "%{public}@", buf, 0xCu);
      }

      v7 = 0;
      goto LABEL_63;
    }
    v7 = 0;
LABEL_64:

    return v7;
  }
  return 0;
}

uint64_t __56__SpringBoardAccessibility_accessibilityStartStopToggle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "togglePlayPauseForEventSource:", 1);
}

uint64_t __56__SpringBoardAccessibility_accessibilityStartStopToggle__block_invoke_713(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "togglePlayPauseForEventSource:", 1);
}

- (BOOL)_axWasRingerMuted
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetWasRingerMuted:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_accessibilityUpdateRingerState
{
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;
  id v7;

  if (!-[SpringBoardAccessibility _accessibilityIsSystemSleeping](self, "_accessibilityIsSystemSleeping"))
  {
    -[SpringBoardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("ringerControl"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("_accessibilityIsRingerMuted"));

    if (v4 != -[SpringBoardAccessibility _axWasRingerMuted](self, "_axWasRingerMuted"))
    {
      if (v4)
        v5 = CFSTR("silent.mode");
      else
        v5 = CFSTR("ring.mode");
      accessibilityLocalizedString(v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFECA8]);
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v6);

    }
  }
}

- (void)_updateRingerState:(int)a3 reason:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[SpringBoardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("ringerControl"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("_accessibilityIsRingerMuted"));

  -[SpringBoardAccessibility _axSetWasRingerMuted:](self, "_axSetWasRingerMuted:", v8);
  v9.receiver = self;
  v9.super_class = (Class)SpringBoardAccessibility;
  -[SpringBoardAccessibility _updateRingerState:reason:](&v9, sel__updateRingerState_reason_, v4, v6);

}

- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3
{
  BOOL v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SpringBoardAccessibility;
  v4 = -[SpringBoardAccessibility handleDoubleHeightStatusBarTapWithStyleOverride:](&v7, sel_handleDoubleHeightStatusBarTapWithStyleOverride_);
  v5 = _AXSHearingAidsPaired();
  if (a3 != 1024 && v5)
    AXPerformSafeBlock();
  return v4;
}

void __76__SpringBoardAccessibility_handleDoubleHeightStatusBarTapWithStyleOverride___block_invoke()
{
  id v0;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("AXSBHearingAidDeviceController")), "safeValueForKey:", CFSTR("sharedController"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "showHearingAidControl:", 0);

}

- (void)_keyboardOrCaseLatchWantsToAttemptUnlock:(int)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *(_QWORD *)&a3;
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB090], 0);
  v5.receiver = self;
  v5.super_class = (Class)SpringBoardAccessibility;
  -[SpringBoardAccessibility _keyboardOrCaseLatchWantsToAttemptUnlock:](&v5, sel__keyboardOrCaseLatchWantsToAttemptUnlock_, v3);
}

- (void)_takeScreenshotAndEdit:(BOOL)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;
  char v12;

  +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "screenCurtainEnabled");

  if (v6)
  {
    +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScreenCurtainEnabled:animated:", 0, 0);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__SpringBoardAccessibility__takeScreenshotAndEdit___block_invoke;
  v10[3] = &unk_250368938;
  v11 = a3;
  v10[4] = self;
  v12 = v6;
  v8 = MEMORY[0x23491FAEC](v10);
  v9 = (void *)v8;
  if (v6)
    AXPerformBlockOnMainThreadAfterDelay();
  else
    (*(void (**)(uint64_t))(v8 + 16))(v8);

}

id __51__SpringBoardAccessibility__takeScreenshotAndEdit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  objc_super v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SpringBoardAccessibility;
  result = objc_msgSendSuper2(&v4, sel__takeScreenshotAndEdit_, v2);
  if (*(_BYTE *)(a1 + 41))
    return (id)AXPerformBlockOnMainThreadAfterDelay();
  return result;
}

void __51__SpringBoardAccessibility__takeScreenshotAndEdit___block_invoke_2()
{
  id v0;

  +[SBVoiceOverTouchConnection defaultConnection](SBVoiceOverTouchConnection, "defaultConnection");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setScreenCurtainEnabled:", 1);

}

- (BOOL)_accessibilitySpringBoardIsModal
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDockVisible") && (objc_msgSend(v3, "isShowingNonSystemApp") & 1) != 0
    || -[SpringBoardAccessibility _accessibilityIsShowingLongLookNotification](self, "_accessibilityIsShowingLongLookNotification");

  return v4;
}

- (BOOL)_accessibilityIsShowingLongLookNotification
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  -[SpringBoardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("notificationDispatcher"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("bannerDestination"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPresentingBannerInLongLook")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("dashBoardDestination"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isPresentingNotificationInLongLook"));

  }
  return v4;
}

- (id)_accessibilityNotificationSummary:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[SpringBoardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_orientationAggregator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("interfaceOrientationSources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        NSClassFromString(CFSTR("SBTransientOverlayWindow"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = 0;
          v11 = v6;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDFF2A0], "sharedServerHelper", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_accessibilityNotificationSummary:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
}

- (unint64_t)_accessibilityNotificationCount
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDFF2A0], "sharedServerHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityNotificationCount");

  return v3;
}

- (id)_accessibilitySpeakScreenGestureRecognizer
{
  JUMPOUT(0x23491F7D4);
}

- (void)_accessibilitySetSpeakScreenGestureRecognizer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilityHandleSpeakScreenGesture:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "locationInView:", 0);
  v5 = v4;
  v7 = v6;
  if (!_AXSSpeakThisEnabled())
    goto LABEL_11;
  if ((-[SpringBoardAccessibility _accessibilityIsSpeakThisTemporarilyDisabled](self, "_accessibilityIsSpeakThisTemporarilyDisabled") & 1) != 0)goto LABEL_11;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasActiveOrPendingCallOrFaceTime");

  if ((v9 & 1) != 0)
    goto LABEL_11;
  v10 = objc_msgSend(v14, "state");
  switch(v10)
  {
    case 5:
      v13 = CFSTR("Speak Screen gesture recognizer failed");
      LOBYTE(v12) = 1;
      _AXLogWithFacility();
      goto LABEL_9;
    case 4:
LABEL_9:
      objc_msgSend(MEMORY[0x24BEAFE90], "sharedInstance", v12, v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didCancelSpeakThisErrorHandler:", 0);
      goto LABEL_10;
    case 1:
      objc_msgSend(MEMORY[0x24BEAFE90], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "speakThisWithOptions:useAppAtPoint:errorHandler:", 12, &__block_literal_global_746, v5, v7);
LABEL_10:

      break;
  }
LABEL_11:

}

void __67__SpringBoardAccessibility__accessibilityHandleSpeakScreenGesture___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  AXLogSpeakScreen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_232A0A000, v3, OS_LOG_TYPE_INFO, "Error handler: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_accessibilityUpdateSpeakScreenGestureRecognizer
{
  if (AXSpringBoardIsReadyToBeProbed())
    -[SpringBoardAccessibility __accessibilityUpdateSpeakScreenGestureRecognizer](self, "__accessibilityUpdateSpeakScreenGestureRecognizer");
  else
    AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __76__SpringBoardAccessibility__accessibilityUpdateSpeakScreenGestureRecognizer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityUpdateSpeakScreenGestureRecognizer");
}

- (void)__accessibilityUpdateSpeakScreenGestureRecognizer
{
  _BOOL4 IsSpeakScreenEnabled;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SpeakScreenGestureRecognizer *v10;

  if (!AXSpringBoardIsReadyToBeProbed())
    _AXAssert();
  IsSpeakScreenEnabled = UIAccessibilityIsSpeakScreenEnabled();
  -[SpringBoardAccessibility _accessibilitySpeakScreenGestureRecognizer](self, "_accessibilitySpeakScreenGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (IsSpeakScreenEnabled)
  {
    if (!v4)
    {
      v10 = -[UIScreenEdgePanGestureRecognizer initWithTarget:action:]([SpeakScreenGestureRecognizer alloc], "initWithTarget:action:", self, sel__accessibilityHandleSpeakScreenGesture_);
      -[UIScreenEdgePanGestureRecognizer setMinimumNumberOfTouches:](v10, "setMinimumNumberOfTouches:", 2);
      -[SpeakScreenGestureRecognizer setMaximumNumberOfTouches:](v10, "setMaximumNumberOfTouches:", 2);
      -[UIScreenEdgePanGestureRecognizer setEdges:](v10, "setEdges:", 1);
      objc_msgSend(MEMORY[0x24BDF7170], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE38058], "mainIdentity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addGestureRecognizer:toDisplayWithIdentity:", v10, v6);

      -[SpringBoardAccessibility _accessibilitySetSpeakScreenGestureRecognizer:](self, "_accessibilitySetSpeakScreenGestureRecognizer:", v10);
    }
  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF7170], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SpringBoardAccessibility _accessibilitySpeakScreenGestureRecognizer](self, "_accessibilitySpeakScreenGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE38058], "mainIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:fromDisplayWithIdentity:", v8, v9);

    -[SpringBoardAccessibility _accessibilitySetSpeakScreenGestureRecognizer:](self, "_accessibilitySetSpeakScreenGestureRecognizer:", 0);
  }
}

- (BOOL)_axIsKeyUIEventCommandTab:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!AXDeviceIsPad())
    goto LABEL_13;
  v5 = _UIAccessibilityFullKeyboardAccessEnabled();
  LOBYTE(v6) = 0;
  if (!v4 || !v5)
    goto LABEL_14;
  if (!-[SpringBoardAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_hasFinishedLaunching")))
  {
LABEL_13:
    LOBYTE(v6) = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "_modifiedInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v6 = objc_msgSend(v4, "_hidEvent");
    if (v6)
    {
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBCommandTabController")), "safeValueForKey:", CFSTR("sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      LOBYTE(v6) = v8
                && objc_msgSend(v8, "safeBoolForKey:", CFSTR("isVisible"))
                && (BKSHIDEventGetSourceFromKeyboardEvent() & 0xFFFFFFFD) == 1
                && objc_msgSend(v4, "_isKeyDown")
                && (objc_msgSend(v7, "isEqualToString:", CFSTR("\t")) & 1) != 0;

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

LABEL_14:
  return v6;
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (-[SpringBoardAccessibility _axIsKeyUIEventCommandTab:](self, "_axIsKeyUIEventCommandTab:", v4))
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBCommandTabController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "next");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SpringBoardAccessibility;
    -[SpringBoardAccessibility _handleKeyUIEvent:](&v7, sel__handleKeyUIEvent_, v4);
  }

}

- (void)_iosAccessibilityPerformAction:(uint64_t)a3 withValue:(uint64_t)a4 fencePort:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_232A0A000, a1, a3, "Unexpected empty sceneID for kAXOverrideNativeFocusedApplicationAction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_iosAccessibilityPerformAction:(uint64_t)a3 withValue:(uint64_t)a4 fencePort:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_232A0A000, a1, a3, "Unexpected zero pid for kAXOverrideNativeFocusedApplicationAction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_iosAccessibilityPerformAction:(uint64_t)a1 withValue:(NSObject *)a2 fencePort:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_232A0A000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for kAXOverrideNativeFocusedApplicationAction: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_iosAccessibilityPerformAction:(uint64_t)a3 withValue:(uint64_t)a4 fencePort:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_232A0A000, a1, a3, "Did not receive direction argument for kAXSwitchNativeFocusedApplicationAction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
