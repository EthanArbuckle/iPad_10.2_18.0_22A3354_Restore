@implementation AXSpringBoardGlue

+ (BOOL)canShowAXInfoPanel
{
  return CanShowAXInfoPanel;
}

+ (void)resetCanShowAXInfoPanel
{
  void *v3;

  if ((CanShowAXInfoPanel & 1) == 0)
  {
    CanShowAXInfoPanel = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_toggleVoiceOverInfoPanel, *MEMORY[0x24BDF7458], 0);

    objc_msgSend(a1, "toggleVoiceOverInfoPanel");
  }
}

+ (void)removeVoiceOverInfoPanel:(double)a3
{
  void *v3;

  objc_msgSend((id)__axClient, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x24BDBD1B8], 10001, 0, 0, a3);
  v3 = (void *)__axClient;
  __axClient = 0;

}

+ (BOOL)isBuddyRunning
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runningAppProcesses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__AXSpringBoardGlue_isBuddyRunning__block_invoke;
  v5[3] = &unk_2503678C0;
  v5[4] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __35__AXSpringBoardGlue_isBuddyRunning__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFE408]);

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (BOOL)_showingBuddyLockScreen
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v11;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBApplicationController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("setupApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("processState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("taskState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v5, "safeValueForKey:", CFSTR("visibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v11 = v9 == 2 && v7 == 2;
  return v11;
}

+ (void)toggleVoiceOverInfoPanel
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (CanShowAXInfoPanel == 1)
  {
    v3 = objc_msgSend(a1, "isBuddyRunning");
    v4 = objc_msgSend(a1, "_isSessionLoginSession");
    v5 = objc_msgSend(a1, "_showingBuddyLockScreen");
    v6 = v3 | v5 | v4;
    if (UIAccessibilityIsVoiceOverRunning() && v6)
    {
      if (!__axClient)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDFF8F0]), "initWithIdentifier:serviceBundleName:", CFSTR("AXSpringBoardBundle"), CFSTR("VoiceOver"));
        v8 = (void *)__axClient;
        __axClient = v7;

      }
      VOTLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_232A0A000, v9, OS_LOG_TYPE_DEFAULT, "Will show vot-enabled banner. buddyIsRunnig=%@ showingBuddyScreen=%@ sessionIsLoginSession=%@", buf, 0x20u);

      }
      objc_msgSend((id)__axClient, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x24BDBD1B8], 10000, 0, 0);
    }
    else
    {
      objc_msgSend(a1, "removeVoiceOverInfoPanel:", 0.5);
      if ((v6 & 1) == 0)
      {
        CanShowAXInfoPanel = 0;
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObserver:name:object:", a1, *MEMORY[0x24BDF7458], 0);

      }
    }
  }
  else if (__axClient)
  {
    objc_msgSend(a1, "removeVoiceOverInfoPanel:", 0.5);
  }
}

+ (void)handleOrientationChange
{
  void *v2;
  id v3;

  UIAccessibilityPostNotification(0x3F3u, 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("SBAXStatusBarOrientationChange"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotification:", v2);

}

+ (int)applicationOrientation
{
  uint64_t v2;

  v2 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation");
  if ((unint64_t)(v2 - 1) >= 4)
    LODWORD(v2) = 0;
  return v2;
}

+ (void)accessibilityInitializeBundle
{
  __CFNotificationCenter *LocalCenter;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v11;
  void *v12;
  _QWORD v13[5];

  if (!_Failover)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_frontBoardCategoriesDidInstall, (CFStringRef)*MEMORY[0x24BDFE630], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_639, 0, &__block_literal_global_645);

    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_4;
    v13[3] = &__block_descriptor_40_e29_v16__0__AXValidationManager_8l;
    v13[4] = a1;
    objc_msgSend(v5, "installSafeCategories:afterDelay:validationTargetName:overrideProcessName:", v13, CFSTR("SpringBoard Framework (Delay)"), CFSTR("SB"), 0.5);

    v6 = objc_msgSend(objc_allocWithZone((Class)a1), "init");
    v7 = (void *)_Failover;
    _Failover = v6;

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addHandler:forBundleName:", &__block_literal_global_901, CFSTR("NowPlayingArtLockScreen.lockbundle"));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel_toggleVoiceOverInfoPanel, *MEMORY[0x24BDF7458], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_appTransitionOccurred, CFSTR("com.apple.mobile.SubstantialTransition"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v11 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v11, 0, (CFNotificationCallback)_StackshotTaken, (CFStringRef)*MEMORY[0x24BE0B708], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (_AXSFullKeyboardAccessEnabled())
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsFocusUpdate");

    }
  }
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("SBAlertItemWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainWorkspace"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMainWorkspace"), CFSTR("_instanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainWorkspace"), CFSTR("transientOverlayPresentationManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTransientOverlayPresentationManager"), CFSTR("topmostPresentedViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAmbientPresentationController"), CFSTR("isPresented"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("ambientPresentationController"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBInCallTransientOverlayViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBSpotlightTransientOverlayViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBRemoteTransientOverlayViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRemoteTransientOverlayHostContentAdapter"), CFSTR("_hostRemoteViewController"), "SBRemoteTransientOverlayHostViewController");
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBRemoteTransientOverlayHostViewController"), CFSTR("_UIRemoteViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("overlayLibraryViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("isTodayOverlayPresented"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("coverSheetTodayViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("isModalAppLibrarySupported"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("modalLibraryController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasProperty:withType:", CFSTR("SBModalLibraryController"), CFSTR("libraryViewController"), "@");
  objc_msgSend(v2, "validateClass:", CFSTR("SBTransientOverlayWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBAppSwitcherModel"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBHCalendarApplicationIcon"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBConferenceManager"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBFolder"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBFolderIcon"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBHUDController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBIcon"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBIconController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBApplicationController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBIconListModel"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBIconModel"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBIconScrollView"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBMediaController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBPlatformController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBScreenshotManager"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBTelephonyManager"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBUIController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SPDaemonQueryToken"));
  objc_msgSend(v2, "validateClass:", CFSTR("SSDownload"));
  objc_msgSend(v2, "validateClass:", CFSTR("SSDownloadStatus"));
  objc_msgSend(v2, "validateClass:", CFSTR("SpringBoard"));
  objc_msgSend(v2, "validateClass:", CFSTR("UITableViewCellAccessibilityElement"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBPIPContainerViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBAlertItemWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBAssistantController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainSwitcherControllerCoordinator"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("windowSceneManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("switcherControllerForWindowScene:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowSceneManager"), CFSTR("activeDisplayWindowScene"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("switcherViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBApplication"), CFSTR("_appInfo"), "SBApplicationInfo");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationIcon"), CFSTR("application"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutState"), CFSTR("appLayout"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayItem"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("rootModifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_appLayoutContainingDisplayItem:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("floatingAppLayout"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayoutAccessibility"), CFSTR("_axDisplayName"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinatorAccessibility"), CFSTR("_axFluidSwitcherViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinatorAccessibility"), CFSTR("_axIsAppSwitcherPeekingSlideOver"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinatorAccessibility"), CFSTR("_axIsAppSwitcherPeekingSplitView"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("isMainDisplayLibraryViewVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBApplicationController"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("applicationWithBundleIdentifier:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBDockSuggestionsIconListView"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBFloatingDockController"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFloatingDockController"), CFSTR("_viewController"), "SBFloatingDockRootViewController");
  objc_msgSend(v2, "validateClass:", CFSTR("SBFloatingDockRootViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockRootViewController"), CFSTR("floatingDockViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBFloatingDockSuggestionsViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("isMedusaCapable"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockSuggestionsViewController"), CFSTR("listView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("_rootFolderController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("_currentFolderController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("iconManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("areAnyIconViewContextMenusShowing"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("rootFolder"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("iconDragManager"), "@", 0);
  objc_msgSend(v2, "validateClass:conformsToProtocol:", CFSTR("SBFloatingDockSuggestionsViewController"), CFSTR("SBFloatingDockSuggestionsViewProviding"));
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBFloatingDockSuggestionsViewProviding"), CFSTR("floatingDockViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBLayoutState"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutState"), CFSTR("elementWithRole:"), "@", "q", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBLayoutElement"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutElement"), CFSTR("layoutAttributes"), "Q", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainDisplayLayoutState"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("spaceConfiguration"), "q", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBPlatformController"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBPlatformController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPlatformController"), CFSTR("medusaCapabilities"), "q", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBBluetoothController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBConferenceManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBMediaController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBModelessSyncController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBPlatformController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("sharedTelephonyManager"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("sharedTelephonyManagerCreatingIfNecessary:"), "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBUIController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("setupApplication"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("processState"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationProcessState"), CFSTR("visibility"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationProcessState"), CFSTR("taskState"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BBBulletin"), CFSTR("sectionID"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BBBulletin"), CFSTR("unlockActionLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAlertItemsController"), CFSTR("activateAlertItem:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAlertItemsController"), CFSTR("deactivateAlertItem:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("applicationWithBundleIdentifier:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBluetoothController"), CFSTR("batteryLevel"), "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("allIcons"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isFolderIcon"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("_cancelCloseFolderTimer"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("_closeFolderTimerFired"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("model"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("_setCloseFolderTimerIfNecessary"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("icons"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMediaController"), CFSTR("isPlaying"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMediaController"), CFSTR("togglePlayPauseForEventSource:"), "B", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBModelessSyncController"), CFSTR("isSyncing"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPlatformController"), CFSTR("isInternalInstall"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("incomingCallExists"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("outgoingCallExists"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIController"), CFSTR("batteryCapacity"), "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIController"), CFSTR("batteryCapacityAsPercentage"), "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIController"), CFSTR("headsetBatteryCapacity"), "C", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIController"), CFSTR("updateBatteryState:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownload"), CFSTR("metadata"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownload"), CFSTR("status"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownloadMetadata"), CFSTR("title"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownloadStatus"), CFSTR("isFailed"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownloadStatus"), CFSTR("isPausable"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownloadStatus"), CFSTR("isPaused"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_accessibilityDeactivationAnimationWillBegin"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_accessibilityTopDisplay"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("activeInterfaceOrientation"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("isLocked"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCellAccessibilityElement"), CFSTR("accessibilityScrollToVisibleWithChild:"), "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindow"), CFSTR("_updateToInterfaceOrientation: duration: force:"), "v", "q", "d", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("isUILocked"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("_setUILocked:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppToAppWorkspaceTransaction"), CFSTR("_setupAnimation"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDeleteNonAppIconAlertItem"), CFSTR("configure: requirePasscodeForActions:"), "v", "B", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("model"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconModel"), CFSTR("applicationIconForBundleIdentifier:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconModel"), CFSTR("isIconVisible:"), "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_takeScreenshotAndEdit:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("turnOnScreenFullyWithBacklightSource:"), "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_updateRingerState:reason:"), "v", "i", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("setBacklightState:source:animated:completion:"), "v", "q", "q", "B", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_legacy_noteInterfaceOrientationChanged: duration: updateMirroredDisplays: force: logMessage:"), "v", "q", "d", "B", "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownload"), CFSTR("metadata"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenViewControllerBase"), CFSTR("setInScreenOffMode:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("badgeNumberOrString"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeLockViewWithKeypad"), CFSTR("resetForFailedPasscode"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BBBulletin"), CFSTR("bulletinID"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_accessibilityHitTestSubviews"), "@", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBApplicationIcon"), CFSTR("SBIcon"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBBookmarkIcon"), CFSTR("SBIcon"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SBFolderIcon"), CFSTR("SBIcon"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBApplication"), CFSTR("_bundleIdentifier"), "NSString");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBLockScreenManager"), CFSTR("_lockScreenEnvironment"), "<SBLockScreenEnvironment>");
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBLockScreenEnvironment"), CFSTR("rootViewController"));
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBLockScreenEnvironment"), CFSTR("callController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("badgeNumberOrString"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconController"), CFSTR("_iconModel"), "SBIconModel");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("_currentFolderController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("iconListViews"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("currentPageIndex"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderView"), CFSTR("_scrollView"), "SBIconScrollView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderIcon"), CFSTR("_folder"), "SBFolder");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderController"), CFSTR("_closeFolderTimer"), "NSTimer");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIScreenEdgePanRecognizerEdgeSettings"), CFSTR("hysteresis"), "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIScreenEdgePanRecognizerEdgeSettings"), CFSTR("edgeRegionSize"), "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPanGestureRecognizer"), CFSTR("_removeHysteresisFromTranslation"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITouch"), CFSTR("_edgeType"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITouch"), CFSTR("_edgeAim"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPanGestureRecognizer"), CFSTR("setFailsPastMaxTouches:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("floatingDockController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("isUILocked"), "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBAssistantController"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBHTodayViewControlling"), CFSTR("listView"));
  objc_msgSend(v2, "validateClass:", CFSTR("NCNotificationListHeaderTitleView"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBCoverSheetWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBPIPController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBMainScreenActiveInterfaceOrientationWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBHomeScreenWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("SBVoiceControlViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("disconnectCallAndActivateHeld"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("disconnectIncomingCall"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTelephonyManager"), CFSTR("updateSpringBoard"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("_accessibilityObjectWithinProximity"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("sensorActivityDataProvider"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSensorActivityAttribution"), CFSTR("sensor"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_activeDisplaySwitcherController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_currentLayoutState"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SBWindowSceneStatusBarManager"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowSceneStatusBarManager"), CFSTR("statusBar"), "@", 0);

  return 1;
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("SpringBoard Framework AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("SpringBoardFramework"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBWorkspaceAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUILabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIAlertViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIApplicationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIImageViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAlertItemsControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDeleteNonAppIconAlertItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUISegmentedControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBBookmarkIconAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUITableViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBMainSwitcherControllerCoordinatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSwitcherViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBControlCenterWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBTelephonyManagerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBHUDControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBBacklightControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBElasticHUDViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDisplayBrightnessControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUITableViewCellAccessibilityElementAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBScreenshotManagerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAppToAppWorkspaceTransactionAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBLockScreenManagerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAppSwitcherPageViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBWallpaperControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBElasticSliderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIAnimationControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBControlCenterControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAssistantControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDashBoardSetupViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBIdleTimerPolicyAggregatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBProximitySensorManagerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBIconControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDashBoardLockScreenEnvironmentAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAppLayoutAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFluidSwitcherContentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFluidSwitcherTitledButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFluidSwitcherButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDisplayItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFluidSwitcherItemContainerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFluidSwitcherViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSwitcherShelfViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDragAndDropWorkspaceTransactionAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBPowerDownViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBRestartManagerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBLogoutProgressViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBPasscodeEntryTransientOverlayViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBRootSceneWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSwitcherAppSuggestionBannerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSwitcherAppSuggestionViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBMainScreenActiveInterfaceOrientationWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBPIPContainerViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBPIPControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBPictureInPictureWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBCommandTabViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBCommandTabControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BBBulletinAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIViewControllerWrapperViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUITextEffectsRemoteViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBMainSwitcherWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAssistantWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBHomeScreenWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBCoverSheetWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFloatingDockControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDashBoardSetupViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAppViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBHomeGrabberViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBCoverSheetPresentationManagerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBMoveGestureFloatingSwitcherModifierAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBUIRemoteKeyboardWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAlertItemWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBNotificationBannerDestinationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSeparatorViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSlideOverTongueViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAppSwitcherScrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBKeyboardFocusCoordinatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBRemoteTransientOverlayHostViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBTransientOverlayWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBIsolatedSceneOrientationFollowingWrapperViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBIsolatedSceneOrientationFollowingWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSyncControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFloatingDockWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFluidSwitcherTouchPassThroughScrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBNCSoundControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBHomeScreenOverlayControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBHomeScreenOverlayViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBRecordingIndicatorViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDeviceApplicationSceneViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAppClipOverlayViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDeviceApplicationSceneClassicAccessoryViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBTopAffordanceViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBInCallPresentationSessionAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSwitcherShelfViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBTopAffordanceDotsViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBCursiveTextViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SBWallpaperSecureWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBWindowSceneAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSystemApertureWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSystemApertureStatusBarPillElementAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SBSystemApertureIndicatorContainerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBDynamicFlashlightActivityElementViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBRingerAlertElementAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBPowerAlertElementAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFlashlightActivityElementAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSystemActionSimpleAccessibilityPreviewElementAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSystemApertureViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBContinuousExposeWindowDragSwitcherModifierAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBAppResizeGrabberViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSystemApertureTelemetryEmitterAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBStatusBarWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBBannerWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBActivityAmbientViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSystemActionCoachingHUDViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSystemActionCoachingControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBSwitcherControllerAccessibility"), 1);

}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBApplicationAccessibility"), 1);
  CanShowAXInfoPanel = 1;
  result = AXProcessIsSpringBoard();
  if ((_DWORD)result)
    return AXPerformBlockOnMainThreadAfterDelay();
  return result;
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1)
{
  char v2;
  int v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isBuddyRunning");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_showingBuddyLockScreen");
  if ((v2 & 1) != 0 || v3)
    _AXSForcePreferenceUpdate();
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleVoiceOverInfoPanel");
}

void __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_7()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "installSafeCategories:afterDelay:validationTargetName:overrideProcessName:", &__block_literal_global_902, CFSTR("NowPlayingLockScreen"), CFSTR("NowPlayingLockScreen"), 0.5);

}

uint64_t __50__AXSpringBoardGlue_accessibilityInitializeBundle__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_NowPlayingArtViewAccessibility"), 1);
}

+ (id)sharedInstance
{
  return (id)_Failover;
}

- (BOOL)isDimmed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemSleeping");

  return v3;
}

- (BOOL)isUILocked
{
  Class v2;
  void *v3;
  char v4;

  v2 = (Class)AXSpringBoardGlueSBLockScreenControllerInstance_class;
  if (!AXSpringBoardGlueSBLockScreenControllerInstance_class)
  {
    v2 = NSClassFromString(CFSTR("SBLockScreenManager"));
    AXSpringBoardGlueSBLockScreenControllerInstance_class = (uint64_t)v2;
  }
  -[objc_class safeValueForKey:](v2, "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isUILocked"));

  return v4;
}

- (void)_accessibilitySetAllowShowNotificationGestureOverride:(BOOL)a3
{
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetBoolValue:forKey:", a3, CFSTR("AXSBAllowShowNotificationGesture"));
}

- (BOOL)_accessibilityAllowShowNotificationGestureOverride
{
  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityBoolValueForKey:", CFSTR("AXSBAllowShowNotificationGesture"));
}

- (int)lastLockSource
{
  void *v2;
  int v3;

  AXSpringBoardFrameworkGlueSBLockScreenControllerInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntForKey:", CFSTR("_axLastLockSource"));

  return v3;
}

- (BOOL)_axIsAppLibraryOrTodayViewPresent
{
  void *v3;
  BOOL v4;
  void *v5;

  AXSBHIconManagerFromSharedIconController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isMainDisplayLibraryViewVisible")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    AXSBIconControllerSharedInstance();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "safeBoolForKey:", CFSTR("isTodayOverlayPresented")) & 1) != 0
      || -[AXSpringBoardGlue _axIsCoverSheetTodayViewControllerPresent](self, "_axIsCoverSheetTodayViewControllerPresent");

  }
  return v4;
}

- (BOOL)_axIsCoverSheetTodayViewControllerPresent
{
  void *v2;
  void *v3;
  BOOL v4;

  AXSBIconControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("coverSheetTodayViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "_appearState") == 2 || objc_msgSend(v3, "_appearState") == 1;
  return v4;
}

@end
