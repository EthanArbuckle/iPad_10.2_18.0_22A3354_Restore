@implementation AXBackBoardGlue

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__AXBackBoardGlue_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

void __29__AXBackBoardGlue_initialize__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("BBAXLoadingQueue", v3);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__AXBackBoardGlue_initialize__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, block);

}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  AXBackBoardGlue *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  int IsPhone;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  void *v20;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogBackboardServer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "Loading AXBackBoardGlue", buf, 2u);
  }

  v3 = objc_alloc_init(AXBackBoardGlue);
  v4 = (void *)SharedInstance;
  SharedInstance = (uint64_t)v3;

  _AXSSetWriteableClient();
  v5 = SharedInstance;
  +[AXBackBoardServerInstance backBoardServerInstance](AXBackBoardServerInstance, "backBoardServerInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  BKAccessibilityClass = (uint64_t)NSClassFromString(CFSTR("BKAccessibility"));
  objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInstallationGSCallback:", &__block_literal_global_7);

  objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInstallationHIDCallback:", &__block_literal_global_190_0);

  objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInstallationEventRepPost:", &__block_literal_global_192_0);

  +[AXBLocalizationCaptionController controller](AXBLocalizationCaptionController, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "initializeMonitor");

  if (AXIsLookingGlassAvailable())
    +[AXBLookingGlassManager initializeMonitor](AXBLookingGlassManager, "initializeMonitor");
  +[AXBSpeakThisManager initializeMonitor](AXBSpeakThisManager, "initializeMonitor");
  +[AXBHomeClickController initializeMonitor](AXBHomeClickController, "initializeMonitor");
  +[AXBZoomTouchManager initializeZoomMonitor](AXBZoomTouchManager, "initializeZoomMonitor");
  +[AXBHoverTextManager initializeMonitor](AXBHoverTextManager, "initializeMonitor");
  +[AXBMotionCuesManager initializeMonitor](AXBMotionCuesManager, "initializeMonitor");
  if (AXDeviceSupportsHapticMusic())
  {
    +[AXBHapticMusicManager initializeMonitor](AXBHapticMusicManager, "initializeMonitor");
  }
  else
  {
    AXLogHapticMusic();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232455000, v11, OS_LOG_TYPE_INFO, "Device doesn't support Haptic Music", buf, 2u);
    }

  }
  +[AXBLiveSpeechManager initializeMonitor](AXBLiveSpeechManager, "initializeMonitor");
  +[AXBLiveCaptionsManager initializeMonitor](AXBLiveCaptionsManager, "initializeMonitor");
  +[AXBGuidedAccessManager initializeMonitor](AXBGuidedAccessManager, "initializeMonitor");
  +[AXBAssistiveTouchManager initializeMonitor](AXBAssistiveTouchManager, "initializeMonitor");
  +[AXBTouchAccommodationsController initializeMonitor](AXBTouchAccommodationsController, "initializeMonitor");
  +[AXBHardwareManager initializeMonitor](AXBHardwareManager, "initializeMonitor");
  v12 = +[AXBBlueLightManager sharedManager](AXBBlueLightManager, "sharedManager");
  +[AXBOpaqueTouchSettingsManager sharedInstance](AXBOpaqueTouchSettingsManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "start");

  IsPhone = AXDeviceIsPhone();
  AXLogBackTap();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (IsPhone)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232455000, v15, OS_LOG_TYPE_DEFAULT, "Device is phone; initializing back tap monitor",
        buf,
        2u);
    }

    +[AXBBackTapMonitor initializeMonitor](AXBBackTapMonitor, "initializeMonitor");
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232455000, v15, OS_LOG_TYPE_DEFAULT, "Device is not phone; not initializing back tap monitor",
        buf,
        2u);
    }

  }
  +[AXBSoundDetectionManager initializeManager](AXBSoundDetectionManager, "initializeManager");
  +[AXBAVSDetectionManager initializeManager](AXBAVSDetectionManager, "initializeManager");
  if (AXIsInternalInstall())
    +[AXBInternalBundleLoaderManager initializeMonitor](AXBInternalBundleLoaderManager, "initializeMonitor");
  if (_AXSTwiceRemoteScreenEnabled())
  {
    AXLogTwiceRemoteScreen();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __29__AXBackBoardGlue_initialize__block_invoke_2_cold_1(v17);

    _AXSTwiceRemoteScreenSetEnabled();
  }
  +[AXBTwiceRemoteScreenManager initializeMonitor](AXBTwiceRemoteScreenManager, "initializeMonitor");
  v18 = dispatch_time(0, 900000000000);
  dispatch_get_global_queue(0, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__AXBackBoardGlue_initialize__block_invoke_215;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v18, v19, block);

  +[AXBDisplayFilterManager initializeMonitor](AXBDisplayFilterManager, "initializeMonitor");
  +[AXBAccessibilityManager initializeAccessibilityMonitor](AXBAccessibilityManager, "initializeAccessibilityMonitor");
  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_221, &__block_literal_global_230, &__block_literal_global_237_0, &__block_literal_global_240);

  return AXBeginListeningToUserDefaultsChanges();
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_184()
{
  return AXPerformSafeBlock();
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_2_186(uint64_t a1)
{
  return -[objc_class _accessibilitySetEventTapCallback:](NSClassFromString(CFSTR("BKAccessibility")), "_accessibilitySetEventTapCallback:", *(_QWORD *)(a1 + 32));
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_3()
{
  return AXPerformSafeBlock();
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_4(uint64_t a1)
{
  return -[objc_class _accessibilitySetHIDEventTapCallback:](NSClassFromString(CFSTR("BKAccessibility")), "_accessibilitySetHIDEventTapCallback:", *(_QWORD *)(a1 + 32));
}

void __29__AXBackBoardGlue_initialize__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchEventRepresentationToClient:", v2);

}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_215(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "kickoffAggregateStatistics");
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_2_219(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("CMDeviceOrientationManager"));
  objc_msgSend(v2, "validateClass:", CFSTR("BKUserEventTimer"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("BKUserEventTimer"), CFSTR("sharedInstance"), "@", 0);

  return 1;
}

uint64_t __29__AXBackBoardGlue_initialize__block_invoke_3_229(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AX Backboard"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Backboard"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __29__AXBackBoardGlue_initialize__block_invoke_5_238(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKAccelerometerInterfaceAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUserEventTimerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUIProgressWindowAccessibility"), 1);

}

+ (void)_repeatAggregateStatistics
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 86400000000000);
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__AXBackBoardGlue__repeatAggregateStatistics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_after(v3, v4, block);

}

void __45__AXBackBoardGlue__repeatAggregateStatistics__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFDD20], "updateStatistics");
  objc_msgSend(*(id *)(a1 + 32), "_repeatAggregateStatistics");
  objc_msgSend(MEMORY[0x24BDFE498], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE498], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      AXColorizeFormatLog();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, v6))
      {
        v9 = 138543362;
        v10 = v8;
        _os_log_impl(&dword_232455000, v5, v6, "%{public}@", (uint8_t *)&v9, 0xCu);
      }

    }
  }
}

+ (void)kickoffAggregateStatistics
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFE498], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE498], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_232455000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDFDD20], "updateStatistics");
  objc_msgSend(a1, "_repeatAggregateStatistics");
}

+ (id)hidClientConnectionManager
{
  return (id)objc_msgSend((id)BKAccessibilityClass, "safeValueForKey:", CFSTR("_eventRoutingClientConnectionManager"));
}

+ (void)sendUserEventOccurred
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  if (sendUserEventOccurred_onceToken != -1)
    dispatch_once(&sendUserEventOccurred_onceToken, &__block_literal_global_255);
  objc_msgSend((id)sendUserEventOccurred_BKUserEventTimerClass, "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_currentMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 == 1)
  {
    v8 = v2;
    AXPerformSafeBlock();
    v5 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("notifyOnNextUserEvent"));

  }
  v7 = v2;
  v6 = v2;
  AXPerformSafeBlock();

}

Class __40__AXBackBoardGlue_sendUserEventOccurred__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("BKUserEventTimer"));
  sendUserEventOccurred_BKUserEventTimerClass = (uint64_t)result;
  return result;
}

uint64_t __40__AXBackBoardGlue_sendUserEventOccurred__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetTimer:mode:", *(unsigned int *)(a1 + 40), 8.0);
}

uint64_t __40__AXBackBoardGlue_sendUserEventOccurred__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userEventOccurredOnDisplay:", 0);
}

+ (CGPoint)displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CGPoint result;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDE57F8], "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displays");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayId");

  }
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x3010000000;
  v15 = 0;
  v16 = 0;
  v14 = "";
  AXPerformSafeBlock();
  v7 = v12[4];
  v8 = v12[5];
  _Block_object_dispose(&v11, 8);
  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

uint64_t __67__AXBackBoardGlue_displayConvertFromCAScreen_withDisplayIntegerId___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    result = objc_msgSend((id)BKAccessibilityClass, "_displayConvertFromCAScreen:withDisplayIntegerId:", *(unsigned int *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  else
    result = objc_msgSend((id)BKAccessibilityClass, "_displayConvertFromCAScreen:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  return result;
}

+ (CGPoint)displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CGPoint result;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDE57F8], "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displays");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayId");

  }
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x3010000000;
  v15 = 0;
  v16 = 0;
  v14 = "";
  AXPerformSafeBlock();
  v7 = v12[4];
  v8 = v12[5];
  _Block_object_dispose(&v11, 8);
  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

uint64_t __65__AXBackBoardGlue_displayConvertToCAScreen_withDisplayIntegerId___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    result = objc_msgSend((id)BKAccessibilityClass, "_displayConvertToCAScreen:withDisplayIntegerId:", *(unsigned int *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  else
    result = objc_msgSend((id)BKAccessibilityClass, "_displayConvertToCAScreen:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  return result;
}

+ (void)processExternalHIDEvent:(__IOHIDEvent *)a3
{
  objc_msgSend((id)BKAccessibilityClass, "_accessibilityProcessExternHIDEvent:", a3);
}

+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = a4;
  v13 = a5;
  v14 = a7;
  v10 = v14;
  v11 = v13;
  v12 = v9;
  AXPerformSafeBlock();

}

uint64_t __132__AXBackBoardGlue__applyExtendedHitTestInformationForCAScreenCoordinates_displayUUID_toPathAttributes_secureName_excludeContextIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)BKAccessibilityClass, "_applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setAssistiveTouchPid:(int)a3
{
  id v3;

  AssistiveTouchPID = a3;
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetAssistiveTouchHitPort");

}

- (int)accessibilityAssistiveTouchPid
{
  return AssistiveTouchPID;
}

- (void)setLiveCaptionsPid:(int)a3
{
  LiveCaptionsPID = a3;
}

- (int)accessibilityLiveCaptionsPid
{
  return LiveCaptionsPID;
}

- (void)setFullKeyboardAccessDaemonPID:(int)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  FKALogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_impl(&dword_232455000, v4, OS_LOG_TYPE_INFO, "FKA pid: %d", (uint8_t *)v5, 8u);
  }

  FullKeyboardAccessDaemonPID = a3;
}

- (int)accessibilityFullKeyboardAccessDaemonPid
{
  return FullKeyboardAccessDaemonPID;
}

- (void)setAccessibilityUIServerPid:(int)a3
{
  void *v3;

  AccessibilityUIServerPID = a3;
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetAccessibilityUIHitPort");

  +[AXBSpeakThisManager didUpdateAccessibilityUIServerPID](AXBSpeakThisManager, "didUpdateAccessibilityUIServerPID");
}

- (int)accessibilityUIServerPid
{
  return AccessibilityUIServerPID;
}

- (void)setSiriViewServicePid:(int)a3
{
  SiriViewServicePID = a3;
}

- (int)hearingAidServerPid
{
  return HearingAidServerPID;
}

- (void)setHearingAidServerPid:(int)a3
{
  HearingAidServerPID = a3;
}

- (void)setLockScreenDimTimerEnabled:(BOOL)a3
{
  objc_msgSend((id)objc_opt_class(), "setLockScreenDimTimerEnabled:", a3);
}

+ (void)setLockScreenDimTimerEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BKUserEventTimer")), "safeValueForKey:", CFSTR("sharedInstance"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axSetTimerDisabled:", !v3);

}

+ (int)inputUIPid
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingBundleIdentifier:", CFSTR("com.apple.InputUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80C78], "handleForPredicate:error:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pid");

  return v4;
}

+ (int)accessibilityUIServerPid
{
  return AccessibilityUIServerPID;
}

+ (int)assistiveTouchPid
{
  return AssistiveTouchPID;
}

+ (int)liveCaptionsPid
{
  return LiveCaptionsPID;
}

+ (int)siriViewServicePid
{
  return SiriViewServicePID;
}

+ (BOOL)isDisplayBacklightOff
{
  return objc_msgSend((id)BKAccessibilityClass, "_isDisplayBacklightOff");
}

- (void)registerEventListener:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerEventListener:", v3);

}

- (void)zoomListenerRegistered
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ZoomListenerRegistered"), 0);

}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityConvertHostedViewFrame:fromContextId:displayId:", v6, v5, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityConvertHostedViewFrame:toContextId:displayId:", v6, v5, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityConvertHostedViewPoint:fromContextId:displayId:", v6, v5, x, y);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v6, v5, x, y);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)postEvent:(id)a3 systemEvent:(BOOL)a4 afterNamedTap:(id)a5 namedTaps:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postEvent:systemEvent:afterNamedTap:namedTaps:", v11, v7, v10, v9);

}

- (unsigned)contextIdForDisplayPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  unsigned int v6;

  y = a3.y;
  x = a3.x;
  +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contextIdForPosition:displayId:", 0, x, y);

  return v6;
}

- (unsigned)contextIdHosterForContextId:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "contextIdHosterForContextId:", v3);

  return v3;
}

- (void)userEventOccurred
{
  objc_msgSend((id)objc_opt_class(), "sendUserEventOccurred");
}

- (void)setDisableSystemGestureRecognitionInEvents:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableSystemGestureRecognitionInEvents:", v3);

}

- (void)setCapsLockLightOn:(BOOL)a3
{
  AXPerformSafeBlock();
}

uint64_t __38__AXBackBoardGlue_setCapsLockLightOn___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)BKAccessibilityClass, "_setCapsLockLightOn:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setIsSpeakScreenHighlightVisible:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v4 = -[AXBackBoardGlue accessibilityUIServerPid](self, "accessibilityUIServerPid");
  AXLogSpeakScreen();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = 67109120;
      v8 = v3;
      _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, "Setting highlight state to visible: %i.", (uint8_t *)&v7, 8u);
    }
  }
  else if (v6)
  {
    v7 = 67109120;
    v8 = v3;
    _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set highlight state to visible %i, but AXUIServer PID wasn't registered. Clearing highlight state.", (uint8_t *)&v7, 8u);
  }

  _AXSSpeakThisSetHighlightVisible();
}

void __29__AXBackBoardGlue_initialize__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_232455000, log, OS_LOG_TYPE_ERROR, "Watch Mirroring was not disabled properly. Disable it now.", v1, 2u);
}

@end
