@implementation AXBackBoardServerInstance

+ (id)backBoardServerInstance
{
  if (backBoardServerInstance_onceToken != -1)
    dispatch_once(&backBoardServerInstance_onceToken, &__block_literal_global_24);
  return (id)ServerInstance;
}

void __52__AXBackBoardServerInstance_backBoardServerInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXBackBoardServerInstance _initServer]([AXBackBoardServerInstance alloc], "_initServer");
  v1 = (void *)ServerInstance;
  ServerInstance = (uint64_t)v0;

}

+ (id)backBoardServerInstanceIfExists
{
  return (id)ServerInstance;
}

- (void)_initializeHandlers
{
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRegisterZoomConflict_, 2000, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleZoomAdjustment_, 2024, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleConvertFrameFromContextId_, 2007, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleConvertFrameToContextId_, 2008, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleConvertFrameFromContextIdToContextId_, 2042, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleContextHostingIdForContextId_, 2031, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleContextIdForPosition_, 2032, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handlePostEvent_, 2009, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.physicalinteraction.client"), CFSTR("com.apple.accessibility.api"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleUserEventOccurred_, 2011, CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetCapsLockLightOn_, 2043, CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleEventListenerRegistration_, 2012, CFSTR("com.apple.ax.eventlisten"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRegisterAssistiveTouchPID_, 2014, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRegisterLiveCaptionsPID_, 2018, CFSTR("com.apple.livetranscriptionui"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRegisterAccessibilityUIServerPID_, 2015, CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRegisterSiriViewServicePID_, 2016, CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRegisterHearingAidServerPID_, 2017, CFSTR("com.apple.hearingaids"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleAXUIServerPID_, 2033, CFSTR("com.apple.accessibility.automation.client"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleAssistiveTouchPID_, 2063, CFSTR("com.apple.accessibility.automation.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleHearingAidServerPID_, 2073, CFSTR("com.apple.accessibility.SpringBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleFullKeyboardAccessDaemonPID_, 2070, CFSTR("com.apple.accessibility.automation.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRegisterFullKeyboardAccessDaemonPID_, 2071, CFSTR("com.apple.fullkeyboardaccess"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleLockScreenDimTimerEnabled_, 2019, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGetGuidedAccessAvailability_, 2020, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetInPreBoardMode_, 2028, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.backboard.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleInPreBoardMode_, 2029, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetInCheckerBoardMode_, 2064, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.backboard.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleInCheckerBoardMode_, 2065, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSessionIsLoginSession_, 2045, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetSessionIsLoginSession_, 2044, CFSTR("com.apple.accessibility.SpringBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsGuidedAccessActive_, 2030, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.entitled.guidedaccess.enable"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsGuidedAccessInWorkspace_, 2034, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.entitled.guidedaccess.enable"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGuidedAccessEffectiveAppBundleIdentifier_, 2060, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.entitled.guidedaccess.enable"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGuidedAccessIgnoredRegions_, 2035, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:async:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:async:forKey:possibleRequiredEntitlements:", self, sel__handleGuidedAccessAutomationCommand_completion_, 1, 2037, CFSTR("com.apple.accessibility.api"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGuidedAccessCurrentModeAndSessionApp_, 2061, CFSTR("com.apple.GAX.SPI"), CFSTR("com.apple.accessibility.SpringBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsGuidedAccessSelfLockedToRequestingApp_, 2021, 0);
  -[AXIPCServer setHandlerWithTarget:selector:async:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:async:forKey:possibleRequiredEntitlements:", self, sel__handleSetGuidedAccessEnabledByRequestingApp_completion_, 1, 2022, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:](self->_server, "setHandlerWithTarget:selector:forKey:", self, sel__handleIsGuidedAccessUnmanagedSelfLocked_, 2054);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:](self->_server, "setHandlerWithTarget:selector:forKey:", self, sel__handleIsRestrictedForAAC_, 2072);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleInvertColorsChange_, 2025, CFSTR("com.apple.invert.colors.write.access"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__setAXPreferenceAsMobile_, 2027, CFSTR("com.apple.accessibility.api"), CFSTR("com.apple.private.iamlockdown"), CFSTR("com.apple.accessibility.axctl"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__axPreferenceAsMobile_, 2067, CFSTR("com.apple.accessibility.api"), CFSTR("com.apple.private.iamlockdown"), CFSTR("com.apple.accessibility.axctl"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetSwitchControlRendersDeviceUnusable_, 2036, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetSwitchControlHasScreenSwitch_, 2062, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:async:forKey:](self->_server, "setHandlerWithTarget:selector:async:forKey:", self, sel__handleSetZoomInitialFocusRect_, 0, 2040);
  -[AXIPCServer setHandlerWithTarget:selector:async:forKey:](self->_server, "setHandlerWithTarget:selector:async:forKey:", self, sel__handleGetZoomInitialFocusRect_, 0, 2041);
  -[AXIPCServer setHandlerWithTarget:selector:async:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:async:forKey:possibleRequiredEntitlements:", self, sel__handleTripleClickHomeButtonFired_, 0, 2055, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.backboard.client"), CFSTR("com.apple.backboard.client"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.fullkeyboardaccess"), CFSTR("com.apple.commandandcontrol"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleHomeClickSwallowedForGuidedAccess_, 2056, CFSTR("com.apple.accessibility.SpringBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsHearingControlEnabled_, 2023, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleDisableBrightnessFilters_, 2047, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleBrightnessFiltersEnabled_, 2048, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleBlueLightStatusEnabled_, 2049, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRestoreCachedBrightnessFilters_, 2050, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleAdaptationEnabled_, 2051, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSupportsAdaptation_, 2052, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:](self->_server, "setHandlerWithTarget:selector:forKey:", self, sel__handleLoadGAXBundleForUnmanagedASAM_, 2053);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleResetAccessibilityFeatures_, 2057, *MEMORY[0x24BED26A8], 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleToggleGuidedAccess_, 2058, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.entitled.guidedaccess.enable"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGetLastSetColorFilter_, 2066, CFSTR("com.apple.AXApp"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleConvertPointFromContextId_, 2068, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleConvertPointToContextId_, 2069, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetIsSpeakScreenHighlightVisible_, 2074, CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__setDeviceOrientation_, 2075, CFSTR("com.apple.accessibility.SpringBoard"), CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetClarityUIAdminPasscode_, 2076, CFSTR("com.apple.CoreRoutine.preferences"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleValidateClarityUIAdminPasscode_, 2077, CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.ClarityBoard"), 0);
}

- (id)_initServer
{
  AXBackBoardServerInstance *v2;
  NSMutableArray *v3;
  NSMutableArray *eventListeners;
  NSMutableArray *v5;
  NSMutableArray *zoomListeners;
  CGSize v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  AXIPCServer *server;
  AXIPCServer *v12;
  id v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  id v22;
  objc_super v23;
  size_t v24;
  uint8_t buf[24];
  int v26[2];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)AXBackBoardServerInstance;
  v2 = -[AXBackBoardServerInstance init](&v23, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    zoomListeners = v2->_zoomListeners;
    v2->_zoomListeners = v5;

    v7 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v2->_initialZoomFocusRect.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v2->_initialZoomFocusRect.size = v7;
    AXLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232455000, v8, OS_LOG_TYPE_DEFAULT, "Initialize AX backboard server", buf, 2u);
    }

    v9 = objc_alloc(MEMORY[0x24BE00650]);
    v10 = objc_msgSend(v9, "initWithServiceName:perPidService:", *MEMORY[0x24BDFFE58], 0);
    server = v2->_server;
    v2->_server = (AXIPCServer *)v10;

    v12 = v2->_server;
    v22 = 0;
    -[AXIPCServer startServerWithError:](v12, "startServerWithError:", &v22);
    v13 = v22;
    AXLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_232455000, v14, OS_LOG_TYPE_DEFAULT, "Started AX Backboard server %@", buf, 0xCu);
    }

    -[AXIPCServer setQueueSize:](v2->_server, "setQueueSize:", 100);
    -[AXBackBoardServerInstance _initializeHandlers](v2, "_initializeHandlers");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v16;
    v18 = AXBSystemBootTime___boottime;
    if (!AXBSystemBootTime___boottime)
    {
      v27 = 0;
      *(_QWORD *)v26 = 0x1500000001;
      *(_OWORD *)buf = 0uLL;
      v24 = 16;
      v19 = sysctl(v26, 2u, buf, &v24, 0, 0);
      v18 = *(_QWORD *)buf;
      if (v19 == -1)
        v18 = 0;
      AXBSystemBootTime___boottime = v18;
    }
    v20 = (uint64_t)v17 - v18;

    if (v20 <= 99)
      _AXSSetAutomationEnabled();
    if (v13)
      NSLog(CFSTR("error: %@"), v13);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AXIPCServer removeAllHandlersForTarget:](self->_server, "removeAllHandlersForTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)AXBackBoardServerInstance;
  -[AXBackBoardServerInstance dealloc](&v3, sel_dealloc);
}

- (void)disableBrightnessFilters
{
  id v2;

  +[AXBBlueLightManager sharedManager](AXBBlueLightManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableBrightnessFilters");

}

- (BOOL)brightnessFiltersEnabled
{
  void *v2;
  char v3;

  +[AXBBlueLightManager sharedManager](AXBBlueLightManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "brightnessFiltersEnabled");

  return v3;
}

- (BOOL)blueLightStatusEnabled
{
  void *v2;
  char v3;

  +[AXBBlueLightManager sharedManager](AXBBlueLightManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blueLightStatusEnabled");

  return v3;
}

- (void)restoreCachedBrightnessFilters
{
  id v2;

  +[AXBBlueLightManager sharedManager](AXBBlueLightManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreCachedBrightnessFilters");

}

- (BOOL)adaptationEnabled
{
  void *v2;
  char v3;

  +[AXBBlueLightManager sharedManager](AXBBlueLightManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "adaptationEnabled");

  return v3;
}

- (BOOL)supportsAdaptation
{
  void *v2;
  char v3;

  +[AXBBlueLightManager sharedManager](AXBBlueLightManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsAdaptation");

  return v3;
}

- (void)forceLoadGAXBundle
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x24BED2790], 0);

  objc_msgSend(MEMORY[0x24BE006A8], "replayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replayWithName:attempts:interval:async:queue:replayBlock:completion:", CFSTR("Ping SpringBoard for unmanaged ASAM"), 10, 1, MEMORY[0x24BDAC9B8], &__block_literal_global_366, &__block_literal_global_369, 0.5);

}

uint64_t __47__AXBackBoardServerInstance_forceLoadGAXBundle__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "loadGAXBundleForUnmanagedASAM");

  return v1;
}

uint64_t __47__AXBackBoardServerInstance_forceLoadGAXBundle__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return _AXLogWithFacility();
  return result;
}

- (void)resetAccessibilityFeatures
{
  _AXSVoiceOverTouchSetEnabled();
  _AXSAssistiveTouchSetEnabled();
  _AXSAssistiveTouchScannerSetEnabled();
  _AXSZoomTouchSetEnabled();
  _AXSInvertColorsSetEnabled();
  _AXSGrayscaleSetEnabled();
  _AXSSetReduceWhitePointEnabled();
  _AXSFullKeyboardAccessSetEnabled();
}

- (AXBColorFilterDescription)colorFilterFromLastUpdate
{
  void *v4;
  AXBColorFilterDescription *result;

  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayFilterFromLastUpdate");

  result = (AXBColorFilterDescription *)MADisplayFilterGetMatrix();
  *(_OWORD *)&retstr->var0[0][0] = 0u;
  *(_OWORD *)&retstr->var0[0][2] = 0u;
  *(_OWORD *)&retstr->var0[1][1] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  retstr->var0[2][2] = 0.0;
  return result;
}

- (id)_handleRegisterZoomConflict:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIAXZoomRegisterConflict"), 0, v6);
  return 0;
}

- (id)_handleZoomAdjustment:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE007A0];
  objc_msgSend(v4, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, 0, v7);
  return 0;
}

- (id)_handleContextIdForPosition:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSPoint v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBackBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("displayPoint"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSPointFromString(v6);
  v8 = objc_msgSend(v5, "contextIdForDisplayPoint:", v7.x, v7.y);

  v9 = objc_alloc(MEMORY[0x24BE00648]);
  v14 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithKey:payload:", 2032, v11);

  return v12;
}

- (id)_handleContextHostingIdForContextId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBackBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("contextId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "contextIdHosterForContextId:", objc_msgSend(v6, "unsignedIntValue"));

  v8 = objc_alloc(MEMORY[0x24BE00648]);
  v13 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithKey:payload:", 2031, v10);

  return v11;
}

- (id)_handleConvertFrameToContextId:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSRect v28;
  NSRect v29;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBackBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("frame"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v28 = NSRectFromString(v6);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  objc_msgSend(v4, "objectForKey:", CFSTR("contextId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertFrame:toContextId:displayId:", v12, objc_msgSend(v13, "unsignedIntValue"), x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = objc_alloc(MEMORY[0x24BE00648]);
  v23 = (void *)MEMORY[0x24BDBCE70];
  v29.origin.x = v15;
  v29.origin.y = v17;
  v29.size.width = v19;
  v29.size.height = v21;
  NSStringFromRect(v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionaryWithObject:forKey:", v24, CFSTR("frame"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v22, "initWithKey:payload:", 2007, v25);

  return v26;
}

- (id)_handleConvertFrameFromContextId:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSRect v28;
  NSRect v29;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBackBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("frame"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v28 = NSRectFromString(v6);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  objc_msgSend(v4, "objectForKey:", CFSTR("contextId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertFrame:fromContextId:displayId:", v12, objc_msgSend(v13, "unsignedIntValue"), x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = objc_alloc(MEMORY[0x24BE00648]);
  v23 = (void *)MEMORY[0x24BDBCE70];
  v29.origin.x = v15;
  v29.origin.y = v17;
  v29.size.width = v19;
  v29.size.height = v21;
  NSStringFromRect(v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionaryWithObject:forKey:", v24, CFSTR("frame"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v22, "initWithKey:payload:", 2007, v25);

  return v26;
}

- (id)_handleConvertFrameFromContextIdToContextId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v44;
  _QWORD v45[2];
  NSRect v46;
  NSRect v47;

  v45[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXBackBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("frame"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v46 = NSRectFromString(v7);
  x = v46.origin.x;
  y = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;
  objc_msgSend(v4, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("fromContextId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");
  objc_msgSend(v4, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("displayId"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertFrame:fromContextId:displayId:", v14, objc_msgSend(v16, "unsignedIntValue"), x, y, width, height);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("toContextId"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedIntValue");
  objc_msgSend(v4, "payload");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("displayId"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertFrame:toContextId:displayId:", v28, objc_msgSend(v30, "unsignedIntValue"), v18, v20, v22, v24);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v39 = objc_alloc(MEMORY[0x24BE00648]);
  v44 = CFSTR("frame");
  v47.origin.x = v32;
  v47.origin.y = v34;
  v47.size.width = v36;
  v47.size.height = v38;
  NSStringFromRect(v47);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v39, "initWithKey:payload:", 2042, v41);

  return v42;
}

- (id)_handleConvertPointFromContextId:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *v9;
  NSPoint v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSPoint v22;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("contextId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("displayId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("point"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = NSPointFromString(v9);

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromContextId:displayId:", v6, v8, v10.x, v10.y);
  v13 = v12;
  v15 = v14;

  v16 = objc_alloc(MEMORY[0x24BE00648]);
  v17 = (void *)MEMORY[0x24BDBCE70];
  v22.x = v13;
  v22.y = v15;
  NSStringFromPoint(v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryWithObject:forKey:", v18, CFSTR("point"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithKey:payload:", 2068, v19);

  return v20;
}

- (id)_handleConvertPointToContextId:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *v9;
  NSPoint v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSPoint v22;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("contextId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("displayId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("point"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = NSPointFromString(v9);

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:toContextId:displayId:", v6, v8, v10.x, v10.y);
  v13 = v12;
  v15 = v14;

  v16 = objc_alloc(MEMORY[0x24BE00648]);
  v17 = (void *)MEMORY[0x24BDBCE70];
  v22.x = v13;
  v22.y = v15;
  NSStringFromPoint(v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryWithObject:forKey:", v18, CFSTR("point"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithKey:payload:", 2069, v19);

  return v20;
}

- (id)_handlePostEvent:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v7[4];
  id v8;
  AXBackBoardServerInstance *v9;

  v4 = a3;
  if (_handlePostEvent__onceToken != -1)
    dispatch_once(&_handlePostEvent__onceToken, &__block_literal_global_392);
  v5 = _handlePostEvent__postQueue;
  if (_handlePostEvent__postQueue)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__AXBackBoardServerInstance__handlePostEvent___block_invoke_2;
    v7[3] = &unk_250187868;
    v8 = v4;
    v9 = self;
    dispatch_async(v5, v7);

  }
  return 0;
}

void __46__AXBackBoardServerInstance__handlePostEvent___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("axbackboard-post", 0);
  v1 = (void *)_handlePostEvent__postQueue;
  _handlePostEvent__postQueue = (uint64_t)v0;

}

void __46__AXBackBoardServerInstance__handlePostEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("record"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("systemEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("afterNamedTap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("namedTaps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:systemEvent:afterNamedTap:namedTaps:", v11, v5, v8, v10);

}

- (id)_handleUserEventOccurred:(id)a3
{
  void *v3;

  -[AXBackBoardServerInstance delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userEventOccurred");

  return 0;
}

- (id)_handleSetCapsLockLightOn:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("on"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCapsLockLightOn:", v6);

  return 0;
}

- (id)_handleEventListenerRegistration:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *eventListeners;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  int v17;
  _QWORD v18[4];
  int v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "clientPort");
  v6 = MEMORY[0x24BDAC760];
  eventListeners = self->_eventListeners;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke;
  v18[3] = &__block_descriptor_36_e15_B32__0_8Q16_B24l;
  v19 = v5;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](eventListeners, "indexOfObjectPassingTest:", v18);
  objc_msgSend(v4, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("start"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00640]), "initWithPort:", v5);
      objc_msgSend(v12, "connectWithError:", 0);
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke_2;
      v16[3] = &unk_250187EC8;
      v16[4] = self;
      v17 = v5;
      objc_msgSend(v12, "setPortDeathHandler:", v16);
      -[NSMutableArray addObject:](self->_eventListeners, "addObject:", v12);
      -[AXBackBoardServerInstance delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "registerEventListener:", 1);

    }
  }
  else if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_eventListeners, "removeObjectAtIndex:", v8);
    if (!-[NSMutableArray count](self->_eventListeners, "count"))
    {
      -[AXBackBoardServerInstance delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "registerEventListener:", 0);

    }
  }
  return 0;
}

BOOL __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceMachPort") == *(_DWORD *)(a1 + 32);
}

void __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  int v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke_3;
  v5[3] = &__block_descriptor_36_e15_B32__0_8Q16_B24l;
  v6 = *(_DWORD *)(a1 + 40);
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", v5);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectAtIndex:", v3);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "registerEventListener:", 0);

    }
  }
}

BOOL __62__AXBackBoardServerInstance__handleEventListenerRegistration___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceMachPort") == *(_DWORD *)(a1 + 32);
}

- (id)_handleRegisterLiveCaptionsPID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  BSProcessDeathWatcher *v9;
  BSProcessDeathWatcher *lcDeathWatcher;
  _QWORD v12[5];
  int v13;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLiveCaptionsPid:", v6);

  v8 = objc_alloc(MEMORY[0x24BE0BE78]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__AXBackBoardServerInstance__handleRegisterLiveCaptionsPID___block_invoke;
  v12[3] = &unk_250187EC8;
  v12[4] = self;
  v13 = v6;
  v9 = (BSProcessDeathWatcher *)objc_msgSend(v8, "initWithPID:queue:deathHandler:", v6, MEMORY[0x24BDAC9B8], v12);
  lcDeathWatcher = self->_lcDeathWatcher;
  self->_lcDeathWatcher = v9;

  return 0;
}

void __60__AXBackBoardServerInstance__handleRegisterLiveCaptionsPID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  uint8_t v7[16];

  AXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "LC process went away, resetting pid", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityLiveCaptionsPid");
  v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLiveCaptionsPid:", 0);

  }
}

- (id)_handleRegisterAssistiveTouchPID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  BSProcessDeathWatcher *v9;
  BSProcessDeathWatcher *astDeathWatcher;
  _QWORD v12[5];
  int v13;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssistiveTouchPid:", v6);

  v8 = objc_alloc(MEMORY[0x24BE0BE78]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__AXBackBoardServerInstance__handleRegisterAssistiveTouchPID___block_invoke;
  v12[3] = &unk_250187EC8;
  v12[4] = self;
  v13 = v6;
  v9 = (BSProcessDeathWatcher *)objc_msgSend(v8, "initWithPID:queue:deathHandler:", v6, MEMORY[0x24BDAC9B8], v12);
  astDeathWatcher = self->_astDeathWatcher;
  self->_astDeathWatcher = v9;

  return 0;
}

void __62__AXBackBoardServerInstance__handleRegisterAssistiveTouchPID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  uint8_t v7[16];

  AXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "AST process went away, resetting pid", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityAssistiveTouchPid");
  v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAssistiveTouchPid:", 0);

  }
}

- (id)_handleAXUIServerPID:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityUIServerPid");

  v5 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKey:payload:", 2033, v7);

  return v8;
}

- (id)_handleAssistiveTouchPID:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityAssistiveTouchPid");

  v5 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKey:payload:", 2063, v7);

  return v8;
}

- (id)_handleHearingAidServerPID:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hearingAidServerPid");

  v5 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKey:payload:", 2073, v7);

  return v8;
}

- (id)_handleFullKeyboardAccessDaemonPID:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityFullKeyboardAccessDaemonPid");

  v5 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKey:payload:", 2070, v7);

  return v8;
}

- (id)_handleRegisterAccessibilityUIServerPID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  BSProcessDeathWatcher *v9;
  BSProcessDeathWatcher *uiServerDeathWatcher;
  _QWORD v12[5];
  int v13;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityUIServerPid:", v6);

  v8 = objc_alloc(MEMORY[0x24BE0BE78]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__AXBackBoardServerInstance__handleRegisterAccessibilityUIServerPID___block_invoke;
  v12[3] = &unk_250187EC8;
  v12[4] = self;
  v13 = v6;
  v9 = (BSProcessDeathWatcher *)objc_msgSend(v8, "initWithPID:queue:deathHandler:", v6, MEMORY[0x24BDAC9B8], v12);
  uiServerDeathWatcher = self->_uiServerDeathWatcher;
  self->_uiServerDeathWatcher = v9;

  return 0;
}

void __69__AXBackBoardServerInstance__handleRegisterAccessibilityUIServerPID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  uint8_t v7[16];

  AXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "UIServer process went away, resetting pid", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityUIServerPid");
  v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityUIServerPid:", 0);

  }
}

- (id)_handleRegisterFullKeyboardAccessDaemonPID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  BSProcessDeathWatcher *v9;
  BSProcessDeathWatcher *fkaDeathWatcher;
  _QWORD v12[5];
  int v13;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFullKeyboardAccessDaemonPID:", v6);

  v8 = objc_alloc(MEMORY[0x24BE0BE78]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__AXBackBoardServerInstance__handleRegisterFullKeyboardAccessDaemonPID___block_invoke;
  v12[3] = &unk_250187EC8;
  v12[4] = self;
  v13 = v6;
  v9 = (BSProcessDeathWatcher *)objc_msgSend(v8, "initWithPID:queue:deathHandler:", v6, MEMORY[0x24BDAC9B8], v12);
  fkaDeathWatcher = self->_fkaDeathWatcher;
  self->_fkaDeathWatcher = v9;

  return 0;
}

void __72__AXBackBoardServerInstance__handleRegisterFullKeyboardAccessDaemonPID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  uint8_t v7[16];

  AXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "FKA process went away, resetting pid", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityFullKeyboardAccessDaemonPid");
  v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFullKeyboardAccessDaemonPID:", 0);

  }
}

- (id)_handleRegisterSiriViewServicePID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AXBackBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSiriViewServicePid:", objc_msgSend(v7, "intValue"));

  return 0;
}

- (id)_handleRegisterHearingAidServerPID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  BSProcessDeathWatcher *v9;
  BSProcessDeathWatcher *heardDeathWatcher;
  _QWORD v12[5];
  int v13;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHearingAidServerPid:", v6);

  v8 = objc_alloc(MEMORY[0x24BE0BE78]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__AXBackBoardServerInstance__handleRegisterHearingAidServerPID___block_invoke;
  v12[3] = &unk_250187EC8;
  v12[4] = self;
  v13 = v6;
  v9 = (BSProcessDeathWatcher *)objc_msgSend(v8, "initWithPID:queue:deathHandler:", v6, MEMORY[0x24BDAC9B8], v12);
  heardDeathWatcher = self->_heardDeathWatcher;
  self->_heardDeathWatcher = v9;

  return 0;
}

void __64__AXBackBoardServerInstance__handleRegisterHearingAidServerPID___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hearingAidServerPid");
  v4 = *(_DWORD *)(a1 + 40);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHearingAidServerPid:", 0);

  }
}

- (id)_handleInvertColorsChange:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "BOOLValue");
    _AXSInvertColorsSetEnabled();
  }

  return 0;
}

- (id)_handleLockScreenDimTimerEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AXBackBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLockScreenDimTimerEnabled:", objc_msgSend(v7, "BOOLValue"));

  return 0;
}

- (id)_handleSetSwitchControlRendersDeviceUnusable:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE00738];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("result"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSwitchControlRendersDeviceUnusable:", objc_msgSend(v5, "BOOLValue"));

  return 0;
}

- (id)_handleSetSwitchControlHasScreenSwitch:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE00738];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("result"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSwitchControlHasScreenSwitch:", objc_msgSend(v5, "BOOLValue"));

  return 0;
}

- (id)_handleSetZoomInitialFocusRect:(id)a3
{
  void *v4;
  NSString *v5;
  double x;
  double y;
  double width;
  double height;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  NSRect v19;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rect"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = NSRectFromString(v5);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertFrame:fromContextId:displayId:", v11, objc_msgSend(v13, "unsignedIntValue"), x, y, width, height);
  self->_initialZoomFocusRect.origin.x = v14;
  self->_initialZoomFocusRect.origin.y = v15;
  self->_initialZoomFocusRect.size.width = v16;
  self->_initialZoomFocusRect.size.height = v17;

  return 0;
}

- (id)_handleGetZoomInitialFocusRect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v23;
  _QWORD v24[2];
  NSRect v25;

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contextId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  -[AXBackBoardServerInstance delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("displayId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFrame:toContextId:displayId:", v7, objc_msgSend(v10, "unsignedIntValue"), self->_initialZoomFocusRect.origin.x, self->_initialZoomFocusRect.origin.y, self->_initialZoomFocusRect.size.width, self->_initialZoomFocusRect.size.height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v23 = CFSTR("rect");
  v25.origin.x = v12;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v18;
  NSStringFromRect(v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 2041, v20);
  return v21;
}

- (id)_gaxBackboard
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_gaxBackboard_gaxBackboard;
  if (!_gaxBackboard_gaxBackboard)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("GAXBackboard")), "safeValueForKey:", CFSTR("sharedInstance"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_gaxBackboard_gaxBackboard;
    _gaxBackboard_gaxBackboard = v3;

    v2 = (void *)_gaxBackboard_gaxBackboard;
  }
  return v2;
}

- (BOOL)_inPreBoardMode
{
  return InPreBoardMode;
}

- (BOOL)_inCheckerBoardMode
{
  return InCheckerBoardMode;
}

- (BOOL)_sessionIsLoginSession
{
  return SessionIsLoginSession;
}

- (id)_handleInPreBoardMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXBackBoardServerInstance _inPreBoardMode](self, "_inPreBoardMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 2029, v6);

  return v7;
}

- (id)_handleSetInPreBoardMode:(id)a3
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("inPreboardMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  InPreBoardMode = objc_msgSend(v4, "BOOLValue");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE00188], 0, 0, 1u);
  return 0;
}

- (id)_handleInCheckerBoardMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXBackBoardServerInstance _inCheckerBoardMode](self, "_inCheckerBoardMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 2065, v6);

  return v7;
}

- (id)_handleSetInCheckerBoardMode:(id)a3
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("inCheckerBoardMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  InCheckerBoardMode = objc_msgSend(v4, "BOOLValue");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE00180], 0, 0, 1u);
  return 0;
}

- (id)_handleTripleClickHomeButtonFired:(id)a3
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)*MEMORY[0x24BED2940], 0, 0, 1u);
  return 0;
}

- (id)_handleHomeClickSwallowedForGuidedAccess:(id)a3
{
  void *v3;
  id v5;

  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v3;
    AXPerformSafeBlock();

  }
  return 0;
}

uint64_t __70__AXBackBoardServerInstance__handleHomeClickSwallowedForGuidedAccess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeClickSwallowedInSpringBoard");
}

- (id)_handleSessionIsLoginSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXBackBoardServerInstance _sessionIsLoginSession](self, "_sessionIsLoginSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 2045, v6);

  return v7;
}

- (id)_handleSetSessionIsLoginSession:(id)a3
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sesionIsLoginSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SessionIsLoginSession = objc_msgSend(v4, "BOOLValue");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE00190], 0, 0, 1u);
  if (SessionIsLoginSession)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRotorOptionsForLoginSession");

    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configureZoomForLoginSession");

  }
  return 0;
}

- (id)_handleGetGuidedAccessAvailability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 12;
  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v12 = v5;
    v13 = v4;
    AXPerformSafeBlock();

  }
  v7 = objc_alloc(MEMORY[0x24BE00648]);
  v18 = CFSTR("availability");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15[3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithKey:payload:", 2020, v9);

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __64__AXBackBoardServerInstance__handleGetGuidedAccessAvailability___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "payload");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "availabilityForExternalRequestWithSpringboardParameters:", v3);

}

- (id)_handleIsGuidedAccessInWorkspace:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v11 = CFSTR("result");
    v5 = (void *)MEMORY[0x24BDD16E0];
    if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isInWorkspace")) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isPasscodeViewVisible"));
    objc_msgSend(v5, "numberWithInt:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 2034, v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_handleGuidedAccessEffectiveAppBundleIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("effectiveAppBundleIdentifier"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v9 = CFSTR("result");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 2060, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_handleGuidedAccessAutomationCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD, _QWORD);
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __77__AXBackBoardServerInstance__handleGuidedAccessAutomationCommand_completion___block_invoke;
  v20[3] = &unk_250188768;
  v10 = v7;
  v21 = v10;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x23490859C](v20);
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "payload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("command"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __77__AXBackBoardServerInstance__handleGuidedAccessAutomationCommand_completion___block_invoke_2;
      v18[3] = &unk_250188790;
      v19 = v11;
      objc_msgSend(v8, "handleGuidedAccessAutomationCommand:completion:", v13, v18);

      v14 = 0;
      goto LABEL_9;
    }
    v14 = CFSTR("GAX Backbaord instance does not respond to handleGuidedAccessAutomationCommand:");
    v16 = CFSTR("%@");
    v17 = CFSTR("GAX Backbaord instance does not respond to handleGuidedAccessAutomationCommand:");
    LOBYTE(v15) = 1;
    _AXLogWithFacility();
  }
  else
  {
    v14 = CFSTR("Guided Access is not loaded");
  }
  if ((-[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("ERROR:"), v15, v16, v17) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: %@"), v14);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v22 = CFSTR("error");
  v23[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v13);
LABEL_9:

}

void __77__AXBackBoardServerInstance__handleGuidedAccessAutomationCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x24BE00648];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithKey:payload:", 2037, v4);

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void __77__AXBackBoardServerInstance__handleGuidedAccessAutomationCommand_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("result"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_handleIsGuidedAccessActive:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BE00648]);
    v9 = CFSTR("result");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "safeBoolForKey:", CFSTR("isActive")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 2030, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_handleSetGuidedAccessEnabledByRequestingApp:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  NSObject *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "senderBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE00120]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v6, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BE00100]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke;
  v30[3] = &unk_2501887B8;
  v15 = v7;
  v31 = v15;
  v16 = (void *)MEMORY[0x23490859C](v30);
  v17 = v16;
  if (v8)
  {
    -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v23[1] = v14;
      v23[2] = 3221225472;
      v23[3] = __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_2;
      v23[4] = &unk_2501887E0;
      v20 = &v24;
      v24 = v18;
      v29 = v11;
      v25 = v8;
      v26 = v6;
      v27 = v13;
      v28 = v17;
      AXPerformSafeBlock();

    }
    else
    {
      GAXLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v33 = v11;
        _os_log_impl(&dword_232455000, v21, OS_LOG_TYPE_INFO, "Received request to set Guided Access enabled=%i, but GAXBackboard was nil.", buf, 8u);
      }

      v20 = (id *)v23;
      v23[0] = v17;
      AXPerformBlockAsynchronouslyOnMainThread();
    }

  }
  else
  {
    v22 = v16;
    AXPerformBlockAsynchronouslyOnMainThread();
    v19 = v22;
  }

}

void __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = *MEMORY[0x24BE00120];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = *MEMORY[0x24BE00110];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 2022, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _OWORD v9[2];

  v2 = *(unsigned __int8 *)(a1 + 72);
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  if (v5)
    objc_msgSend(v5, "auditToken");
  else
    memset(v9, 0, sizeof(v9));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_3;
  v7[3] = &unk_2501887B8;
  v6 = *(_QWORD *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "setEnabled:fromAppWithIdentifier:withAuditToken:configuration:completion:", v2 != 0, v3, v9, v6, v7);

}

uint64_t __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_460(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__AXBackBoardServerInstance__handleSetGuidedAccessEnabledByRequestingApp_completion___block_invoke_2_461(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_handleIsGuidedAccessSelfLockedToRequestingApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(v4, "senderBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v13 = v6;
      v14 = v5;
      AXPerformSafeBlock();

    }
  }
  v8 = objc_alloc(MEMORY[0x24BE00648]);
  v19 = *MEMORY[0x24BE00118];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v16 + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithKey:payload:", 2022, v10);

  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t __76__AXBackBoardServerInstance__handleIsGuidedAccessSelfLockedToRequestingApp___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSelfLockedToAppWithIdentifier:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_handleIsGuidedAccessUnmanagedSelfLocked:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("result");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isUnmanagedSelfLocked"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 2054, v6);
  return v7;
}

- (id)_handleIsRestrictedForAAC:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("result");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isRestrictedForAAC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 2072, v6);
  return v7;
}

- (id)_handleGuidedAccessIgnoredRegions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const __CFString *v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_12;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_accessIgnoredTouchRegions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)AX_CGPathCopyDataRepresentation();
        objc_msgSend(v6, "addObject:", v12, v16);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v9);
  }

  v20 = CFSTR("result");
  v21 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 2035, v13);

LABEL_13:
  return v14;
}

- (id)_handleGuidedAccessCurrentModeAndSessionApp:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance _gaxBackboard](self, "_gaxBackboard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "currentGuidedAccessModeForBackboardServer");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE00108]);

    if (v5)
    {
      objc_msgSend(v3, "currentSessionApp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE00128]);

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 2061, v4);

  }
  else
  {
    v9 = objc_alloc(MEMORY[0x24BE00648]);
    v12 = *MEMORY[0x24BE00108];
    v13[0] = &unk_25018EEC8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithKey:payload:", 2061, v10);

  }
  return v8;
}

- (id)_axPreferenceAsMobile:(id)a3
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

  v3 = a3;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("preference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("domain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {

    v9 = 0;
  }
  v10 = (void *)MEMORY[0x234907FCC](v6, v9, 0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("value"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 2067, v12);

  return v13;
}

- (id)_setAXPreferenceAsMobile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v3 = a3;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("preference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {

    v7 = 0;
  }
  objc_msgSend(v3, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("notification"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {

    v11 = 0;
  }
  _AXSetPreferenceWithNotification();

  return 0;
}

- (id)_handleIsHearingControlEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[AXBHomeClickController controller](AXBHomeClickController, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsHearingAidControlVisible:", objc_msgSend(v6, "BOOLValue"));

  return 0;
}

- (id)_handleDisableBrightnessFilters:(id)a3
{
  -[AXBackBoardServerInstance disableBrightnessFilters](self, "disableBrightnessFilters", a3);
  return 0;
}

- (id)_handleBrightnessFiltersEnabled:(id)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[AXBackBoardServerInstance brightnessFiltersEnabled](self, "brightnessFiltersEnabled", a3);
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 2048, v6);

  return v7;
}

- (id)_handleBlueLightStatusEnabled:(id)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[AXBackBoardServerInstance blueLightStatusEnabled](self, "blueLightStatusEnabled", a3);
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 2049, v6);

  return v7;
}

- (id)_handleRestoreCachedBrightnessFilters:(id)a3
{
  -[AXBackBoardServerInstance restoreCachedBrightnessFilters](self, "restoreCachedBrightnessFilters", a3);
  return 0;
}

- (id)_handleAdaptationEnabled:(id)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[AXBackBoardServerInstance adaptationEnabled](self, "adaptationEnabled", a3);
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 2051, v6);

  return v7;
}

- (id)_handleSupportsAdaptation:(id)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[AXBackBoardServerInstance supportsAdaptation](self, "supportsAdaptation", a3);
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 2052, v6);

  return v7;
}

- (id)_handleLoadGAXBundleForUnmanagedASAM:(id)a3
{
  -[AXBackBoardServerInstance forceLoadGAXBundle](self, "forceLoadGAXBundle", a3);
  return 0;
}

- (id)_handleResetAccessibilityFeatures:(id)a3
{
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "senderBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = 1;
  _AXLogWithFacility();

  -[AXBackBoardServerInstance resetAccessibilityFeatures](self, "resetAccessibilityFeatures", v5, CFSTR("Resetting accessibility features on behalf of %@"), v6);
  return 0;
}

- (id)_handleToggleGuidedAccess:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  GAXLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_232455000, v4, OS_LOG_TYPE_DEFAULT, "_handleToggleGuidedAccess: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x24BDFFE70], 0);

  return 0;
}

- (id)_handleGetLastSetColorFilter:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __int128 v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[AXBackBoardServerInstance colorFilterFromLastUpdate](self, "colorFilterFromLastUpdate", a3, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 72);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("filterData");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithKey:payload:", 2066, v5);

  return v6;
}

- (id)_handleSetIsSpeakScreenHighlightVisible:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("visible"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXBackBoardServerInstance delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsSpeakScreenHighlightVisible:", objc_msgSend(v5, "BOOLValue"));

  }
  return 0;
}

- (id)_setDeviceOrientation:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("deviceOrientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)(objc_msgSend(v4, "integerValue") - 1) <= 3)
    BKSHIDServicesSetDeviceOrientationForAutomation();

  return 0;
}

- (id)_handleSetClarityUIAdminPasscode:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("passcode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    +[AXBClarityUIManager sharedManager](AXBClarityUIManager, "sharedManager");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject setAdminPasscode:](v6, "setAdminPasscode:", v5);

  }
  else
  {
    CLFLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[AXBackBoardServerInstance _handleSetClarityUIAdminPasscode:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return 0;
}

- (id)_handleValidateClarityUIAdminPasscode:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("passcode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    +[AXBClarityUIManager sharedManager](AXBClarityUIManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "validateAdminPasscode:", v5);

    v8 = objc_alloc(MEMORY[0x24BE00648]);
    v20 = CFSTR("result");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithKey:payload:", 2077, v10);

  }
  else
  {
    CLFLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[AXBackBoardServerInstance _handleValidateClarityUIAdminPasscode:].cold.1(v9, v12, v13, v14, v15, v16, v17, v18);
    v11 = 0;
  }

  return v11;
}

- (AXBackBoardServerInstanceDelegate)delegate
{
  return (AXBackBoardServerInstanceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lcDeathWatcher, 0);
  objc_storeStrong((id *)&self->_fkaDeathWatcher, 0);
  objc_storeStrong((id *)&self->_astDeathWatcher, 0);
  objc_storeStrong((id *)&self->_uiServerDeathWatcher, 0);
  objc_storeStrong((id *)&self->_heardDeathWatcher, 0);
  objc_storeStrong((id *)&self->_eventTapClients, 0);
  objc_storeStrong((id *)&self->_zoomListeners, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (void)_handleSetClarityUIAdminPasscode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_232455000, a1, a3, "Attempted to set admin passcode to non-string value.", a5, a6, a7, a8, 0);
}

- (void)_handleValidateClarityUIAdminPasscode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_232455000, a1, a3, "Attempted to validate admin passcode that was a non-string value.", a5, a6, a7, a8, 0);
}

@end
