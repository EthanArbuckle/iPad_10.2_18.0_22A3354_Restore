@implementation AXSBSettingsLoader

+ (void)_setVoiceOverTouchSettings:(unsigned __int8)a3
{
  if (a3 || _AXSCanDisableApplicationAccessibility())
    _AXSApplicationAccessibilitySetEnabled();
  _AXSVoiceOverTouchSetUsageConfirmed();
  _AXSVoiceOverTouchSetEnabled();
}

+ (void)_checkVoiceOverTouchSetByiTunes
{
  int v3;
  int v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  char v8;

  v3 = _AXSVoiceOverTouchEnabled();
  v8 = 0;
  v4 = MEMORY[0x220755824](*MEMORY[0x24BED2968], &v8);
  if (v8)
  {
    if (v4)
      v5 = v3 == 0;
    else
      v5 = 0;
    if (v5)
    {
      v7 = 1;
      goto LABEL_12;
    }
    if (v4)
      v6 = 1;
    else
      v6 = v3 == 0;
    if (!v6)
    {
      v7 = 0;
LABEL_12:
      objc_msgSend(a1, "_setVoiceOverTouchSettings:", v7);
    }
  }
}

+ (void)_checkZoomTouchSetByiTunes
{
  int v2;
  int v3;
  BOOL v4;
  BOOL v5;
  char v6;

  v2 = _AXSZoomTouchEnabled();
  v6 = 0;
  v3 = MEMORY[0x220755824](*MEMORY[0x24BED29B8], &v6);
  if (v6)
  {
    v4 = v3 && v2 == 0;
    if (v4 || (!v3 ? (v5 = v2 == 0) : (v5 = 1), !v5))
      _AXSZoomTouchSetEnabled();
  }
}

+ (void)_checkInvertColorsSetByiTunes
{
  int v2;
  int v3;
  int v4;
  BOOL v5;
  BOOL v6;
  char v7;

  v7 = 0;
  v2 = MEMORY[0x220755824](*MEMORY[0x24BED2868], &v7);
  if (v7)
  {
    v3 = v2;
    v4 = _AXSInvertColorsEnabled();
    v5 = v3 && v4 == 0;
    if (v5 || (!v3 ? (v6 = v4 == 0) : (v6 = 1), !v6))
      _AXSInvertColorsSetEnabled();
  }
}

+ (void)_checkAssistiveTouchSetByiTunes
{
  int v2;
  int v3;
  int v4;
  BOOL v5;
  BOOL v6;
  char v7;

  v7 = 0;
  v2 = MEMORY[0x220755824](*MEMORY[0x24BED26E8], &v7);
  if (v7)
  {
    v3 = v2;
    v4 = _AXSAssistiveTouchEnabled();
    if (v3)
      v5 = v4 == 0;
    else
      v5 = 0;
    if (v5)
    {
      _AXSAssistiveTouchSetEnabled();
      _AXSAssistiveTouchSetUIEnabled();
    }
    else
    {
      if (v3)
        v6 = 1;
      else
        v6 = v4 == 0;
      if (!v6)
        _AXSAssistiveTouchSetEnabled();
    }
  }
}

+ (void)_checkMonoAudioSetByiTunes
{
  int v2;
  int v3;
  BOOL v4;
  BOOL v5;
  char v6;

  v2 = _AXSMonoAudioEnabled();
  v6 = 0;
  v3 = MEMORY[0x220755824](*MEMORY[0x24BED28A8], &v6);
  if (v6)
  {
    v4 = v3 && v2 == 0;
    if (v4 || (!v3 ? (v5 = v2 == 0) : (v5 = 1), !v5))
      _AXSMonoAudioSetEnabled();
  }
}

+ (void)_checkClosedCaptioningSetByiTunes
{
  char v2;

  v2 = 0;
  MEMORY[0x220755824](*MEMORY[0x24BED2728], &v2);
  if (v2)
    _AXSClosedCaptionsSetEnabled();
}

+ (void)_checkSpeakAutofillSetByiTunes
{
  void *v2;
  int v3;
  int v4;
  char v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "speakCorrectionsEnabled");

  v10 = 0;
  v4 = MEMORY[0x220755824](*MEMORY[0x24BED2918], &v10);
  if (v10)
  {
    if (v4)
      v5 = v3;
    else
      v5 = 1;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
      goto LABEL_12;
    }
    if (v4)
      v6 = 0;
    else
      v6 = v3;
    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
LABEL_12:
      objc_msgSend(v7, "setSpeakCorrectionsEnabled:", v9);

    }
  }
}

+ (void)_checkContrastSetting
{
  float v2;
  float v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  _AXSScreenContrast();
  if (v2 > 0.0)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displays");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    *(float *)&v5 = v3;
    objc_msgSend(v6, "setContrast:", v5);
    NSLog(CFSTR("Setting screen contrast to %.0f on display %@"), (float)(v3 * 100.0), v6);

  }
}

+ (void)checkScreenContrast
{
  void *v3;

  v3 = (void *)MEMORY[0x220755D4C](a1, a2);
  objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__checkContrastSetting, a1, 0);
  objc_autoreleasePoolPop(v3);
}

+ (void)checkAccessibilityOptions
{
  _QWORD v3[5];

  if (checkAccessibilityOptions_onceToken != -1)
    dispatch_once(&checkAccessibilityOptions_onceToken, &__block_literal_global_4);
  objc_msgSend((id)CheckOptionsTimer, "cancel");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__AXSBSettingsLoader_checkAccessibilityOptions__block_invoke_2;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  objc_msgSend((id)CheckOptionsTimer, "afterDelay:processBlock:", v3, 0.25);
}

void __47__AXSBSettingsLoader_checkAccessibilityOptions__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDFE490]);
  v1 = (void *)CheckOptionsTimer;
  CheckOptionsTimer = (uint64_t)v0;

}

uint64_t __47__AXSBSettingsLoader_checkAccessibilityOptions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkAccessibilityOptionsSetByiTunes");
}

+ (void)_checkAccessibilityOptionsSetByiTunes
{
  objc_msgSend(a1, "_checkVoiceOverTouchSetByiTunes");
  objc_msgSend(a1, "_checkZoomTouchSetByiTunes");
  objc_msgSend(a1, "_checkInvertColorsSetByiTunes");
  objc_msgSend(a1, "_checkMonoAudioSetByiTunes");
  objc_msgSend(a1, "_checkSpeakAutofillSetByiTunes");
  objc_msgSend(a1, "_checkClosedCaptioningSetByiTunes");
  objc_msgSend(a1, "_checkAssistiveTouchSetByiTunes");
  objc_msgSend(a1, "_checkContrastSetting");
}

+ (void)_updateSpringBoardHelper
{
  void *v2;
  unsigned int v3;

  if ((_updateSpringBoardHelper_isInitialized & 1) == 0)
  {
    if (AXIsInternalInstall())
    {
      v2 = (void *)_AXSTripleClickCopyOptions();
      v3 = _AXSAccessibilityEnabled();
      NSLog(CFSTR("AX: Update SB Server(%d, %lu) {{ Internal Logging }}"), v3, objc_msgSend(v2, "count"));

    }
    +[AXSpringBoardServerHelper initialize](AXSpringBoardServerHelper, "initialize");
    _updateSpringBoardHelper_isInitialized = 1;
  }
}

- (void)_updateAXSettings
{
  objc_msgSend((id)objc_opt_class(), "_updateAXSettings");
}

+ (void)_updateAXSettings
{
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __39__AXSBSettingsLoader__updateAXSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSpringBoardHelper");
}

+ (void)_registerForNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void (**v16)(_QWORD);
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[5];

  if ((ListeningForNotifications & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_accessibilityiTunesSettings, (CFStringRef)*MEMORY[0x24BED29D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, a1, (CFNotificationCallback)_accessibilityCheckContrast, (CFStringRef)*MEMORY[0x24BED28F8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, a1, (CFNotificationCallback)_accessibilityVisualAlertChanged, (CFStringRef)*MEMORY[0x24BED2958], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, a1, (CFNotificationCallback)_accessibilitySpeakTypingChanged, (CFStringRef)*MEMORY[0x24BED29A8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, a1, (CFNotificationCallback)_accessibilitySpeakTypingChanged, (CFStringRef)*MEMORY[0x24BED2878], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, a1, (CFNotificationCallback)_accessibilitySpeakTypingChanged, (CFStringRef)*MEMORY[0x24BED28C0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, a1, (CFNotificationCallback)_accessibilityEnhanceTextLegibilityChanged, (CFStringRef)*MEMORY[0x24BED2768], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v10 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__AXSBSettingsLoader__registerForNotifications__block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = a1;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerUpdateBlock:forRetrieveSelector:withListener:", v11, sel_startupSoundEnabled, a1);

    v11[2](v11);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BEBDF60];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __47__AXSBSettingsLoader__registerForNotifications__block_invoke_2;
    v18[3] = &unk_24DDE6CC0;
    v19 = v11;
    v16 = v11;
    v17 = (id)objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v14, 0, v15, v18);

    ListeningForNotifications = 1;
  }
}

uint64_t __47__AXSBSettingsLoader__registerForNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processStartupSoundEnabled");
}

uint64_t __47__AXSBSettingsLoader__registerForNotifications__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_processStartupSoundEnabled
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  AXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21AC77000, v2, OS_LOG_TYPE_INFO, "Processing change for startup sound", v6, 2u);
  }

  if (AXAssetAndDataClient_onceToken != -1)
    dispatch_once(&AXAssetAndDataClient_onceToken, &__block_literal_global_531);
  v3 = (void *)MEMORY[0x24BDFE478];
  v4 = (id)AXAssetAndDataClient_Client;
  objc_msgSend(v3, "mainAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x24BDBD1B8], 13, v5, 0);

}

+ (void)_findNoteFromLoginSessionWithCompletion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  if ((AXCurrentProcessExistsInLoginSessionSBOnly() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFDD80], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BE00268];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62__AXSBSettingsLoader__findNoteFromLoginSessionWithCompletion___block_invoke;
    v6[3] = &unk_24DDE6CE8;
    v7 = v3;
    objc_msgSend(v4, "readDataForFileAtAccessibilityContainerPath:completion:", v5, v6);

  }
}

void __62__AXSBSettingsLoader__findNoteFromLoginSessionWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a2;
  if (a3)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE00270]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE00278]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v9, v11);
    }
    else
    {
      _AXLogWithFacility();
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0);
    }

  }
  else
  {
    _AXLogWithFacility();
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0);
    v7 = v5;
  }

}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__AXSBSettingsLoader_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, block);
}

uint64_t __32__AXSBSettingsLoader_initialize__block_invoke()
{
  AXSBSettingsLoader *v0;
  void *v1;

  v0 = objc_alloc_init(AXSBSettingsLoader);
  v1 = (void *)_AXSettingsLoaderDelegate;
  _AXSettingsLoaderDelegate = (uint64_t)v0;

  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __32__AXSBSettingsLoader_initialize__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeDelayedSpringBoardSettings");
}

+ (void)_checkForDataResetFile
{
  OUTLINED_FUNCTION_0_0(&dword_21AC77000, a2, a3, "Could not remove data settings file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_initializeDelayedSpringBoardSettings
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[8];
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;

  objc_msgSend(a1, "_updateSpringBoardHelper");
  v3 = MEMORY[0x24BDAC760];
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke;
  v18 = &__block_descriptor_40_e5_v8__0l;
  v19 = a1;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_msgSend(a1, "_registerForNotifications");
  if (_AXSVisualAlertEnabled() && _accessibilityHasCameraFlash())
    AXPerformBlockOnMainThreadAfterDelay();
  AXPerformBlockOnMainThreadAfterDelay();
  _accessibilityInitializeSpeakTypingServer();
  if (AXIsBuddyCompleted())
  {
    v4 = (void *)_AXSTripleClickCopyOptions();
    if (_AXSTripleClickContainsOption())
    {
      AXLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AC77000, v5, OS_LOG_TYPE_DEFAULT, "Triple click buddy still in settings, need to remove", buf, 2u);
      }

      _AXSTripleClickRemoveOption();
    }

  }
  if (AXIsInternalInstall())
    NSLog(CFSTR("AX: Registering for SBAX server launch {{ Internal Logging }}"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", _AXSettingsLoaderDelegate, sel__updateAXSettings, CFSTR("AccessibilitySettingsLoaderDidUpdateSettings"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", _AXSettingsLoaderDelegate, sel__updateAXSettings, *MEMORY[0x24BED26B0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", _AXSettingsLoaderDelegate, sel__handleGuidedAccessManagedConfigurationDidChange_, *MEMORY[0x24BE63B78], 0);

  AXPerformBlockOnMainThreadAfterDelay();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)_AXSettingsLoaderDelegate, (CFNotificationCallback)_accessibilityTripleHomeEnabled, (CFStringRef)*MEMORY[0x24BED2938], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_msgSend(MEMORY[0x24BE00590], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");

  objc_msgSend((id)_AXSettingsLoaderDelegate, "_bootstrapSoundDetection");
  objc_msgSend(a1, "_registerForHomeButtonBreakage");
  objc_msgSend(a1, "_performValidations");
  objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateHearingFeatureUsage");

  if (AXDeviceHasJindo())
  {
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_2_237;
    v13[3] = &__block_descriptor_40_e11_v20__0d8B16l;
    v13[4] = a1;
    objc_msgSend(v12, "registerListener:forLiveListenLevelsHandler:", a1, v13);

  }
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_checkForDataResetFile");
  if (_AXSVoiceOverTouchEnabled())
    _AXSVoiceOverTouchSetEnabled();
  if (_AXSAssistiveTouchEnabled())
    _AXSAssistiveTouchSetEnabled();
  if (_AXSAssistiveTouchScannerEnabled())
    _AXSAssistiveTouchScannerSetEnabled();
  if (_AXSCommandAndControlEnabled())
    _AXSCommandAndControlSetEnabled();
  if (_AXSCommandAndControlCarPlayEnabled())
    _AXSCommandAndControlCarPlaySetEnabled();
  if (_AXSFullKeyboardAccessEnabled())
    _AXSFullKeyboardAccessSetEnabled();
  if (_AXSSpeakThisEnabled())
    _AXSSetSpeakThisEnabled();
  if (_AXSWordFeedbackEnabled())
    _AXSSetWordFeedbackEnabled();
  if (_AXSLetterFeedbackEnabled())
    _AXSSetLetterFeedbackEnabled();
  if (_AXSPhoneticFeedbackEnabled())
    _AXSSetPhoneticFeedbackEnabled();
  if (_AXSInvertColorsEnabled())
    _AXSInvertColorsSetEnabled();
  _AXSHomeButtonRestingUnlock();
  _AXSPearlRestingUnlock();
  if (!_AXSHomeButtonRestingUnlockEverSet() && _AXSAssistiveTouchEnabled())
  {
    _AXSHomeButtonSetRestingUnlock();
    _AXLogWithFacility();
  }
  result = AXDeviceIsMultiUser();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_findNoteFromLoginSessionWithCompletion:", &__block_literal_global_221);
  return result;
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_2(uint64_t a1, int a2, int a3)
{
  uint64_t result;

  if (a2)
    result = _AXSVoiceOverTouchSetEnabled();
  if (a3)
    return _AXSZoomTouchSetEnabled();
  return result;
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_4()
{
  return objc_msgSend((id)_AXSettingsLoaderDelegate, "_initializeRemoteSettingsListener");
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_232()
{
  return +[AXSBSettingsLoader bootstrapGuidedAccessIfNeeded](AXSBSettingsLoader, "bootstrapGuidedAccessIfNeeded");
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_2_237()
{
  return AXPerformBlockOnMainThread();
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_3_238(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLiveListenEventIsListening:audioLevel:", *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));
}

+ (void)_handleLiveListenEventIsListening:(BOOL)a3 audioLevel:(double)a4
{
  _BOOL4 v4;
  void *v5;
  _TtC27AXSpringBoardServerInstance20HearingActivityProxy *v6;
  void *v7;

  v4 = a3;
  if (AXDeviceHasJindo())
  {
    if (!v4 || _handleLiveListenEventIsListening_audioLevel___IsLiveListenRunning)
    {
      if (!v4 && _handleLiveListenEventIsListening_audioLevel___IsLiveListenRunning)
        objc_msgSend((id)_handleLiveListenEventIsListening_audioLevel___ActivityProxy, "finishWithCompletionHandler:", &__block_literal_global_244);
    }
    else
    {
      v5 = (void *)_handleLiveListenEventIsListening_audioLevel___ActivityProxy;
      if (!_handleLiveListenEventIsListening_audioLevel___ActivityProxy)
      {
        v6 = objc_alloc_init(_TtC27AXSpringBoardServerInstance20HearingActivityProxy);
        v7 = (void *)_handleLiveListenEventIsListening_audioLevel___ActivityProxy;
        _handleLiveListenEventIsListening_audioLevel___ActivityProxy = (uint64_t)v6;

        v5 = (void *)_handleLiveListenEventIsListening_audioLevel___ActivityProxy;
      }
      objc_msgSend(v5, "startWithCompletionHandler:", &__block_literal_global_243);
    }
    _handleLiveListenEventIsListening_audioLevel___IsLiveListenRunning = v4;
  }
}

- (void)_ensureUltronAppVisibility:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x24BDAC8D0];
  CFPreferencesSetAppValue(CFSTR("SBIconVisibility"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:"), CFSTR("com.apple.imgaudio.UltronApp"));
  CFPreferencesSynchronize(CFSTR("com.apple.imgaudio.UltronApp"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  notify_post("com.apple.springboard.appIconVisibilityPreferencesChanged");
  AXLogUltron();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_21AC77000, v4, OS_LOG_TYPE_DEFAULT, "Writing visiblity for ultron app: %d", (uint8_t *)v5, 8u);
  }

}

- (void)_bootstrapSoundDetection
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__AXSBSettingsLoader__bootstrapSoundDetection__block_invoke;
  v4[3] = &unk_24DDE6E30;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerUpdateBlock:forRetrieveSelector:withListener:", v4, sel_ultronSupportEnabled, self);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__AXSBSettingsLoader__bootstrapSoundDetection__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_ensureUltronAppVisibility:", objc_msgSend(v1, "ultronSupportEnabled"));

}

+ (void)_performValidations
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_255, &__block_literal_global_267, 0);

}

uint64_t __41__AXSBSettingsLoader__performValidations__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SpringBoard"), CFSTR("_restartManager"), "SBRestartManager");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRestartManager"), CFSTR("rebootForReason:"), "v", "@", 0);

  return 1;
}

uint64_t __41__AXSBSettingsLoader__performValidations__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AXSBSettingsLoader"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AXSBSettingsLoader"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

+ (void)_registerForHomeButtonBreakageNotification
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  IONotificationPort *v20;
  io_object_t notification;
  _QWORD v22[2];
  __int128 buf;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
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
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_21AC77000, v5, v6, "%{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  notification = 0;
  v22[0] = CFSTR("DeviceUsagePage");
  v22[1] = CFSTR("DeviceUsage");
  *(_QWORD *)&buf = &unk_24DDF5330;
  *((_QWORD *)&buf + 1) = &unk_24DDF5348;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  deviceUsagePairs(v9, v10, v11, v12, v13, v14, v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("DeviceUsagePairs");
  *(_QWORD *)&buf = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v19, "setObject:forKey:", CFSTR("AppleSPUHIDDevice"), CFSTR("IOProviderClass"));
  LODWORD(v18) = *MEMORY[0x24BDD8B18];
  LODWORD(v19) = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], (CFDictionaryRef)v19);
  v20 = IONotificationPortCreate((mach_port_t)v18);
  IOServiceAddInterestNotification(v20, (io_service_t)v19, "IOGeneralInterest", (IOServiceInterestCallback)_homeButtonBreakageMessageHandler, 0, &notification);
  IONotificationPortSetDispatchQueue(v20, MEMORY[0x24BDAC9B8]);

}

+ (BOOL)_alreadyRebootedGracefullyOnce
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("AXBrokenHomeButtonAlreadyRebootedOnce"));

  return v3;
}

+ (void)_setRebootedGracefullyOnce
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
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
        v11 = 138543362;
        v12 = v8;
        _os_log_impl(&dword_21AC77000, v5, v6, "%{public}@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBool:forKey:", 1, CFSTR("AXBrokenHomeButtonAlreadyRebootedOnce"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronize");

}

+ (void)_gracefulRebootForBrokenHomeButton
{
  objc_msgSend(a1, "_setRebootedGracefullyOnce");
  AnalyticsSendEventLazy();
  AXPerformBlockOnMainThreadAfterDelay();
}

void *__56__AXSBSettingsLoader__gracefulRebootForBrokenHomeButton__block_invoke()
{
  return &unk_24DDF5650;
}

uint64_t __56__AXSBSettingsLoader__gracefulRebootForBrokenHomeButton__block_invoke_2()
{
  void *v0;
  char v1;
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "ignoreLogging");

  if ((v1 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v3, v4))
    {
      AXColorizeFormatLog();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, v4))
      {
        v8 = 138543362;
        v9 = v6;
        _os_log_impl(&dword_21AC77000, v3, v4, "%{public}@", (uint8_t *)&v8, 0xCu);
      }

    }
  }
  return AXPerformSafeBlock();
}

void __56__AXSBSettingsLoader__gracefulRebootForBrokenHomeButton__block_invoke_295()
{
  id v0;

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("_restartManager"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "rebootForReason:", CFSTR("MESA FAILURE: Home button broke, rebooting"));

}

+ (void)_startAssistiveTouchForBrokenHomeButton
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (_AXSAssistiveTouchEnabled())
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "ignoreLogging");

    if ((v3 & 1) != 0)
      return;
    objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (!os_log_type_enabled(v5, v6))
      goto LABEL_17;
    AXColorizeFormatLog();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _AXStringForArgs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, v6))
      goto LABEL_16;
    v16 = 138543362;
    v17 = v8;
    goto LABEL_15;
  }
  if (UIAccessibilityIsSwitchControlRunning())
  {
    +[AXSpringBoardServerHelper sharedServerHelper](AXSpringBoardServerHelper, "sharedServerHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleBrokenHomeButtonAlert");

    objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ignoreLogging");

    if ((v11 & 1) != 0)
      return;
    objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (!os_log_type_enabled(v5, v6))
      goto LABEL_17;
    AXColorizeFormatLog();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _AXStringForArgs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, v6))
      goto LABEL_16;
    v16 = 138543362;
    v17 = v8;
    goto LABEL_15;
  }
  _AXSAssistiveTouchSetRepairIncarnationModeEnabled();
  objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "ignoreLogging");

  if ((v14 & 1) != 0)
    return;
  objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AXLoggerForFacility();
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = AXOSLogLevelFromAXLogLevel();
  if (os_log_type_enabled(v5, v6))
  {
    AXColorizeFormatLog();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _AXStringForArgs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, v6))
    {
LABEL_16:

      goto LABEL_17;
    }
    v16 = 138543362;
    v17 = v8;
LABEL_15:
    _os_log_impl(&dword_21AC77000, v5, v6, "%{public}@", (uint8_t *)&v16, 0xCu);
    goto LABEL_16;
  }
LABEL_17:

}

+ (void)_checkForHomeButtonBreakage:(BOOL)a3
{
  _BOOL4 v3;
  const __CFDictionary *v5;
  io_object_t v6;
  io_registry_entry_t v7;
  const __CFAllocator *v8;
  void *CFProperty;
  unsigned int v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  NSObject *v36;
  os_log_type_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  io_iterator_t existing;
  mach_port_t mainPort;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v3 = a3;
  v48 = *MEMORY[0x24BDAC8D0];
  mainPort = 0;
  MEMORY[0x220755674](*MEMORY[0x24BDAD2F0], &mainPort);
  existing = 0;
  v5 = IOServiceMatching("AppleSPUHIDDevice");
  IOServiceGetMatchingServices(mainPort, v5, &existing);
  v6 = IOIteratorNext(existing);
  if (v6)
  {
    v7 = v6;
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    while (1)
    {
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v7, CFSTR("button-err-state"), v8, 0);
      if (CFProperty)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
      IOObjectRelease(v7);

      v7 = IOIteratorNext(existing);
      if (!v7)
        goto LABEL_6;
    }
    v10 = objc_msgSend(CFProperty, "BOOLValue");
    objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ignoreLogging");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        AXColorizeFormatLog();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v10;
        _AXStringForArgs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v17;
          _os_log_impl(&dword_21AC77000, v14, v15, "%{public}@", buf, 0xCu);
        }

      }
    }

  }
  else
  {
LABEL_6:
    v10 = 0;
  }
  v18 = objc_msgSend(a1, "_alreadyRebootedGracefullyOnce", v40);
  objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "ignoreLogging");

  if ((v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v22, v23))
    {
      AXColorizeFormatLog();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v3;
      v43 = v18;
      v41 = v10;
      _AXStringForArgs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 138543362;
        v47 = v25;
        _os_log_impl(&dword_21AC77000, v22, v23, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (v10)
  {
    if ((v3 | v18) == 1)
    {
      objc_msgSend(a1, "_startAssistiveTouchForBrokenHomeButton");
      AXPerformBlockOnMainThreadAfterDelay();
    }
    else
    {
      objc_msgSend(a1, "_gracefulRebootForBrokenHomeButton");
    }
  }
  else if (_AXSAssistiveTouchRepairIncarnationModeEnabled())
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "ignoreLogging");

    if ((v27 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v29 = objc_claimAutoreleasedReturnValue();

      v30 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v30))
      {
        AXColorizeFormatLog();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v32;
          _os_log_impl(&dword_21AC77000, v29, v30, "%{public}@", buf, 0xCu);
        }

      }
    }
    _AXSAssistiveTouchSetRepairIncarnationModeEnabled();
  }
  objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance", v41, v42, v43);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "ignoreLogging");

  if ((v34 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v36, v37))
    {
      AXColorizeFormatLog();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      _AXSAssistiveTouchRepairIncarnationModeEnabled();
      _AXStringForArgs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, v37))
      {
        *(_DWORD *)buf = 138543362;
        v47 = v39;
        _os_log_impl(&dword_21AC77000, v36, v37, "%{public}@", buf, 0xCu);
      }

    }
  }
}

uint64_t __50__AXSBSettingsLoader__checkForHomeButtonBreakage___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "brokenHomeButtonCount") + 1;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBrokenHomeButtonCount:", v1);

  objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
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
        *(_DWORD *)buf = 138543362;
        v12 = v9;
        _os_log_impl(&dword_21AC77000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  return AnalyticsSendEventLazy();
}

id __50__AXSBSettingsLoader__checkForHomeButtonBreakage___block_invoke_317()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("resetCount");
  v0 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithInteger:", objc_msgSend(v1, "brokenHomeButtonCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_registerForHomeButtonBreakage
{
  if (MGGetBoolAnswer())
  {
    objc_msgSend(a1, "_registerForHomeButtonBreakageNotification");
    objc_msgSend(a1, "_checkForHomeButtonBreakage:", 1);
  }
}

- (void)_handleGuidedAccessManagedConfigurationDidChange:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __71__AXSBSettingsLoader__handleGuidedAccessManagedConfigurationDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDFE490]);
    v4 = objc_msgSend(v3, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(v2, "cancel");
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__AXSBSettingsLoader__handleGuidedAccessManagedConfigurationDidChange___block_invoke_2;
  v9[3] = &unk_24DDE5710;
  v10 = v7;
  objc_msgSend(v8, "afterDelay:processBlock:", v9, 0.5);

}

uint64_t __71__AXSBSettingsLoader__handleGuidedAccessManagedConfigurationDidChange___block_invoke_2()
{
  _AXLogWithFacility();
  return +[AXSBSettingsLoader bootstrapGuidedAccessIfNeeded](AXSBSettingsLoader, "bootstrapGuidedAccessIfNeeded");
}

+ (void)bootstrapGuidedAccessIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!_AXSGuidedAccessEnabledByManagedConfiguration())
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "effectiveWhitelistedAppsAndOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "autonomousSingleAppModePermittedBundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "count") || objc_msgSend(v5, "count"))
    {
      GAXLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 138543618;
        v9 = v3;
        v10 = 2114;
        v11 = v5;
        _os_log_impl(&dword_21AC77000, v6, OS_LOG_TYPE_INFO, "allowedApps (%{public}@) or appSelfLockIDs (%{public}@) exist. WIll enable GAX (Single App Mode) now", (uint8_t *)&v8, 0x16u);
      }

      _AXSGuidedAccessSetEnabledByManagedConfiguration();
    }
    else
    {
      GAXLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_21AC77000, v7, OS_LOG_TYPE_INFO, "allowedApps and appSelfLockIDs both nil.  No need to enable GAX (Single App Mode)", (uint8_t *)&v8, 2u);
      }

    }
  }
}

- (AXSBSettingsLoader)init
{
  AXSBSettingsLoader *v2;
  AXAssetsService *v3;
  AXAssetsService *assetsService;
  AXSBSettingsLoader *v5;
  AXSBSettingsLoader *v7;
  AXSBSettingsLoader *v8;
  AXSBSettingsLoader *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXSBSettingsLoader;
  v2 = -[AXSBSettingsLoader init](&v10, sel_init);
  if (v2)
  {
    v3 = (AXAssetsService *)objc_alloc_init(MEMORY[0x24BDFDD40]);
    assetsService = v2->_assetsService;
    v2->_assetsService = v3;

    AXPerformBlockOnMainThreadAfterDelay();
    v9 = v2;
    AXPerformBlockOnMainThreadAfterDelay();
    v8 = v9;
    AXPerformBlockOnMainThreadAfterDelay();
    v7 = v8;
    AXPerformBlockOnMainThreadAfterDelay();
    v5 = v7;

  }
  return v2;
}

id __26__AXSBSettingsLoader_init__block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  AXLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21AC77000, v0, OS_LOG_TYPE_INFO, "Initializing AXSpeechAssetMonitorHelper so that we check for assets if we need to.", v2, 2u);
  }

  return (id)objc_msgSend(MEMORY[0x24BDFF288], "sharedInstance");
}

void __26__AXSBSettingsLoader_init__block_invoke_335(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "physicalMemory") <= 0x773593FF)
    goto LABEL_4;
  v3 = AXRuntimeCheck_HasANE();

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(MEMORY[0x24BDFDD60], "policy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateAssetForPolicy:", v2);
LABEL_4:

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "physicalMemory") > 0x773593FF && AXRuntimeCheck_HasANE())
  {

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "physicalMemory") <= 0x773593FF)
  {

    goto LABEL_12;
  }
  v7 = AXRuntimeCheck_HasANE();

  if (v7)
  {
LABEL_10:
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(MEMORY[0x24BDFDD50], "policy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateAssetForPolicy:", v5);
LABEL_12:

  }
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x24BDFDD58], "policy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateAssetForPolicy:", v10);

}

void __26__AXSBSettingsLoader_init__block_invoke_341(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x24BDFDD68], "policy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateAssetForPolicy:", v2);

}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  AXDispatchTimer *managedConfigurationNotificationCoalesceTimer;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  managedConfigurationNotificationCoalesceTimer = self->_managedConfigurationNotificationCoalesceTimer;
  self->_managedConfigurationNotificationCoalesceTimer = 0;

  v6.receiver = self;
  v6.super_class = (Class)AXSBSettingsLoader;
  -[AXSBSettingsLoader dealloc](&v6, sel_dealloc);
}

- (void)_initializeRemoteSettingsListener
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  void *v5;
  void *v6;

  if (-[AXSBSettingsLoader _isDeviceAffectedByVOActivationWorkaround](self, "_isDeviceAffectedByVOActivationWorkaround"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_voiceOverVibrateEnable, (CFStringRef)*MEMORY[0x24BE003E0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_voiceOverSwipeEnable, (CFStringRef)*MEMORY[0x24BE003E8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__remoteAccessibilitySettingsChanged_, *MEMORY[0x24BE047C8], 0);

    objc_msgSend(MEMORY[0x24BE04780], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerNetworkDefaultsForAppID:", CFSTR("com.apple.accessibility.remote"));

    _AXLogWithFacility();
  }
  -[AXSBSettingsLoader _updateRemoteAccessibilitySettings](self, "_updateRemoteAccessibilitySettings");
}

- (void)_voiceOverEnabled:(id)a3
{
  if (_AXSVoiceOverTouchEnabled())
    -[AXSBSettingsLoader _hideVoiceOverEnabler](self, "_hideVoiceOverEnabler");
}

- (void)_hideVoiceOverEnabler
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = 1;
  _AXLogWithFacility();

  -[AXAccessQueueTimer cancel](self->_voiceOverActivationCanceler, "cancel", v4, CFSTR("VOWORK: HIDE ENABLER %@"), v5);
  if (!_AXSVoiceOverTouchEnabled())
    -[AXSBSettingsLoader _playVOActivationSoundEnded](self, "_playVOActivationSoundEnded");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__AXSBSettingsLoader__hideVoiceOverEnabler__block_invoke;
  v7[3] = &unk_24DDE5710;
  v7[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__AXSBSettingsLoader__hideVoiceOverEnabler__block_invoke_2;
  v6[3] = &unk_24DDE6620;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v7, v6, 0.25);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BED2970], 0);

}

void __43__AXSBSettingsLoader__hideVoiceOverEnabler__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  CGRect v15;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceOverActivationWorkaround");

  if (v3 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAlpha:", 0.0);
  }
  else if (v3 == 1)
  {
    objc_getAssociatedObject(*(id *)(*(_QWORD *)(a1 + 32) + 8), &AXActivationRotationKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (int)objc_msgSend(v4, "intValue");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "frame");
    v9 = v8;
    v11 = v10;
    v12 = v6;
    v13 = v7;
    switch(v5)
    {
      case 1:
        v11 = v7;
        break;
      case 2:
        v11 = -v7;
        break;
      case 3:
        v9 = -v6;
        break;
      case 4:
        v9 = v6;
        break;
      default:
        break;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setFrame:", v9, v11, v6, v7);
    v15.origin.x = v9;
    v15.origin.y = v11;
    v15.size.width = v12;
    v15.size.height = v13;
    NSStringFromCGRect(v15);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    _AXLogWithFacility();

  }
}

uint64_t __43__AXSBSettingsLoader__hideVoiceOverEnabler__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

  return _AXLogWithFacility();
}

- (void)_makeVoiceOverVibrateWindow
{
  id v3;
  void *v4;
  UIWindow *v5;
  void *v6;
  id v7;
  void *v8;
  UIWindow *voiceOverVibrateWindow;
  id v10;

  v3 = objc_allocWithZone(MEMORY[0x24BEBDB58]);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UIWindow *)objc_msgSend(v3, "initWithContentRect:");

  -[UIWindow setWindowLevel:](v5, "setWindowLevel:", 10000013.0);
  -[UIWindow setOpaque:](v5, "setOpaque:", 0);
  -[UIWindow setAlpha:](v5, "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow setBackgroundColor:](v5, "setBackgroundColor:", v6);

  v7 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  -[UIWindow bounds](v5, "bounds");
  v10 = (id)objc_msgSend(v7, "initWithFrame:");
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v8);

  objc_msgSend(v10, "setAlpha:", 1.0);
  objc_msgSend(v10, "setUserInteractionEnabled:", 0);
  objc_msgSend(v10, "setOpaque:", 0);
  -[UIWindow setContentView:](v5, "setContentView:", v10);
  voiceOverVibrateWindow = self->_voiceOverVibrateWindow;
  self->_voiceOverVibrateWindow = v5;

}

- (void)_playVOActivationSoundEnded
{
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  if (_playVOActivationSoundEnded_onceToken != -1)
    dispatch_once(&_playVOActivationSoundEnded_onceToken, &__block_literal_global_363);
  v2 = *MEMORY[0x24BDB6D30];
  v3[0] = &unk_24DDF5360;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  AudioServicesPlaySystemSoundWithOptions();
}

void __49__AXSBSettingsLoader__playVOActivationSoundEnded__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFURL *inFileURL;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF48]);
  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/CoreServices/VoiceOverTouch.app"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@/%@"), v3, CFSTR("Sounds/FolderClosed.aiff"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  inFileURL = (const __CFURL *)objc_msgSend(v0, "initFileURLWithPath:isDirectory:", v4, 0);

  AudioServicesCreateSystemSoundID(inFileURL, (SystemSoundID *)&_playVOActivationSoundEnded_SoundID);
}

- (void)_playVOActivationSoundStarted
{
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  if (_playVOActivationSoundStarted_onceToken != -1)
    dispatch_once(&_playVOActivationSoundStarted_onceToken, &__block_literal_global_372);
  v2 = *MEMORY[0x24BDB6D30];
  v3[0] = &unk_24DDF5360;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  AudioServicesPlaySystemSoundWithOptions();
}

void __51__AXSBSettingsLoader__playVOActivationSoundStarted__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFURL *inFileURL;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF48]);
  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/CoreServices/VoiceOverTouch.app"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@/%@"), v3, CFSTR("Sounds/FolderOpened.aiff"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  inFileURL = (const __CFURL *)objc_msgSend(v0, "initFileURLWithPath:isDirectory:", v4, 0);

  AudioServicesCreateSystemSoundID(inFileURL, (SystemSoundID *)&_playVOActivationSoundStarted_SoundID);
}

- (void)swipeDetectorDetectedSwipe
{
  if (!_AXSApplicationAccessibilityEnabled())
    _AXSApplicationAccessibilitySetEnabled();
  _AXSVoiceOverTouchSetEnabled();
  -[AXSBSettingsLoader _hideVoiceOverEnabler](self, "_hideVoiceOverEnabler");
}

- (void)_showSwipeDetectionEnablerView
{
  void *v3;
  uint64_t v4;
  UIWindow *voiceOverVibrateWindow;
  void *v6;
  void *v7;
  void *v8;
  AXSBVoiceOverSwipeDetectorView *v9;
  AXSBVoiceOverSwipeDetectorView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  double v21;
  double v22;
  uint64_t v23;
  AXAccessQueueTimer *voiceOverActivationCanceler;
  double v25;
  _QWORD v26[5];
  _QWORD v27[6];
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;

  if (!self->_voiceOverVibrateWindow)
  {
    -[AXSBSettingsLoader _playVOActivationSoundStarted](self, "_playVOActivationSoundStarted");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__voiceOverEnabled_, *MEMORY[0x24BED2970], 0);

    -[AXSBSettingsLoader _makeVoiceOverVibrateWindow](self, "_makeVoiceOverVibrateWindow");
    v4 = objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeIntegerForKey:", CFSTR("activeInterfaceOrientation"));
    voiceOverVibrateWindow = self->_voiceOverVibrateWindow;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(voiceOverVibrateWindow, &AXActivationRotationKey, v6, (void *)1);

    -[UIWindow subviews](self->_voiceOverVibrateWindow, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setUserInteractionEnabled:", 1);
    v9 = [AXSBVoiceOverSwipeDetectorView alloc];
    objc_msgSend(v8, "bounds");
    v10 = -[AXSBVoiceOverSwipeDetectorView initWithFrame:](v9, "initWithFrame:");
    objc_msgSend(v8, "addSubview:", v10);
    -[AXSBVoiceOverSwipeDetectorView setDelegate:](v10, "setDelegate:", self);
    -[UIWindow frame](self->_voiceOverVibrateWindow, "frame");
    v14 = v13;
    v16 = v15;
    v17 = v12;
    switch(v4)
    {
      case 1:
        v14 = v12;
        goto LABEL_4;
      case 2:
        v14 = -v12;
        v18 = 565.486678;
        break;
      case 3:
        -[AXSBVoiceOverSwipeDetectorView bounds](v10, "bounds");
        -[AXSBVoiceOverSwipeDetectorView setBounds:](v10, "setBounds:");
        -[AXSBVoiceOverSwipeDetectorView setCenter:](v10, "setCenter:", 1.0, 0.0);
        v11 = -v16;
        v18 = 282.743339;
        break;
      case 4:
        -[AXSBVoiceOverSwipeDetectorView frame](v10, "frame");
        -[AXSBVoiceOverSwipeDetectorView setFrame:](v10, "setFrame:");
        v18 = -282.743339;
        v11 = v16;
        break;
      default:
LABEL_4:
        v18 = 0.0;
        break;
    }
    -[UIWindow setFrame:](self->_voiceOverVibrateWindow, "setFrame:", v11, v14, v16, v17);
    v19 = *MEMORY[0x24BDBD8B8];
    v20 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&v30.c = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v30.tx = v20;
    *(_OWORD *)&v29.a = v19;
    *(_OWORD *)&v29.c = *(_OWORD *)&v30.c;
    *(_OWORD *)&v29.tx = v20;
    *(_OWORD *)&v30.a = v19;
    -[AXSBVoiceOverSwipeDetectorView setTransform:](v10, "setTransform:", &v29);
    CGAffineTransformMakeRotation(&v30, v18 / 180.0);
    v28 = v30;
    UIIntegralTransform();
    v30 = v29;
    -[AXSBVoiceOverSwipeDetectorView setTransform:](v10, "setTransform:", &v29);
    -[AXSBVoiceOverSwipeDetectorView frame](v10, "frame");
    if ((unint64_t)(v4 - 2) < 3)
    {
      v21 = 0.0;
      v22 = 0.0;
    }
    -[AXSBVoiceOverSwipeDetectorView setFrame:](v10, "setFrame:", v21, v22);
    v23 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __52__AXSBSettingsLoader__showSwipeDetectionEnablerView__block_invoke;
    v27[3] = &unk_24DDE5808;
    v27[4] = self;
    v27[5] = v4;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v27, 0.25);
    voiceOverActivationCanceler = self->_voiceOverActivationCanceler;
    v25 = *MEMORY[0x24BE00480];
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __52__AXSBSettingsLoader__showSwipeDetectionEnablerView__block_invoke_2;
    v26[3] = &unk_24DDE5710;
    v26[4] = self;
    -[AXAccessQueueTimer afterDelay:processBlock:](voiceOverActivationCanceler, "afterDelay:processBlock:", v26, v25);

  }
}

void __52__AXSBSettingsLoader__showSwipeDetectionEnablerView__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  CGRect v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "frame");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  switch(*(_QWORD *)(a1 + 40))
  {
    case 1:
    case 2:
      v7 = 0.0;
      break;
    case 3:
    case 4:
      v5 = 0.0;
      break;
    default:
      break;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setFrame:", v5, v7, v2, v3);
  v11.origin.x = v5;
  v11.origin.y = v7;
  v11.size.width = v8;
  v11.size.height = v9;
  NSStringFromCGRect(v11);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  _AXLogWithFacility();

}

uint64_t __52__AXSBSettingsLoader__showSwipeDetectionEnablerView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideVoiceOverEnabler");
}

- (void)_showVibrationVoiceOverEnablerView
{
  void *v3;
  void *v4;
  void *v5;
  AXSBVoiceOverShakeMessage *v6;
  AXSBVoiceOverShakeMessage *v7;
  uint64_t v8;
  void *v9;
  AXSBVoiceOverShakeMessage *v10;
  AXAccessQueueTimer *voiceOverActivationCanceler;
  double v12;
  _QWORD v13[5];
  _QWORD v14[4];
  AXSBVoiceOverShakeMessage *v15;

  if (!self->_voiceOverVibrateWindow)
  {
    -[AXSBSettingsLoader _playVOActivationSoundStarted](self, "_playVOActivationSoundStarted");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__voiceOverEnabled_, *MEMORY[0x24BED2970], 0);

    -[AXSBSettingsLoader _makeVoiceOverVibrateWindow](self, "_makeVoiceOverVibrateWindow");
    -[UIWindow subviews](self->_voiceOverVibrateWindow, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [AXSBVoiceOverShakeMessage alloc];
    v7 = -[AXSBVoiceOverShakeMessage initWithFrame:](v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AXSBVoiceOverShakeMessage setAlpha:](v7, "setAlpha:", 0.0);
    objc_msgSend(v5, "addSubview:", v7);
    v8 = MEMORY[0x24BDAC760];
    v9 = (void *)MEMORY[0x24BEBDB00];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__AXSBSettingsLoader__showVibrationVoiceOverEnablerView__block_invoke;
    v14[3] = &unk_24DDE5710;
    v15 = v7;
    v10 = v7;
    objc_msgSend(v9, "animateWithDuration:animations:", v14, 0.25);
    voiceOverActivationCanceler = self->_voiceOverActivationCanceler;
    v12 = *MEMORY[0x24BE00480];
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __56__AXSBSettingsLoader__showVibrationVoiceOverEnablerView__block_invoke_2;
    v13[3] = &unk_24DDE5710;
    v13[4] = self;
    -[AXAccessQueueTimer afterDelay:processBlock:](voiceOverActivationCanceler, "afterDelay:processBlock:", v13, v12);

  }
}

uint64_t __56__AXSBSettingsLoader__showVibrationVoiceOverEnablerView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __56__AXSBSettingsLoader__showVibrationVoiceOverEnablerView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideVoiceOverEnabler");
}

- (BOOL)_isDeviceAffectedByVOActivationWorkaround
{
  return 0;
}

- (void)_reachabilityChanged:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE046E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  _AXLogWithFacility();
  if (v5)
    AXPerformBlockOnMainThreadAfterDelay();
}

void __43__AXSBSettingsLoader__reachabilityChanged___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE04780], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "registerNetworkDefaultsForAppIDs:forceUpdate:", &unk_24DDF54D0, 1);

  LOBYTE(v4) = 1;
  _AXLogWithFacility();
  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver", v4, CFSTR("VOWORK: force registration again: %d"), v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forHostname:", *(_QWORD *)(a1 + 32), CFSTR("configuration.apple.com"));

}

- (void)_registerReachability
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__AXSBSettingsLoader__registerReachability__block_invoke;
  block[3] = &unk_24DDE5710;
  block[4] = self;
  if (_registerReachability_onceToken[0] != -1)
    dispatch_once(_registerReachability_onceToken, block);
}

void __43__AXSBSettingsLoader__registerReachability__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = 1;
  _AXLogWithFacility();

  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver", v2, CFSTR("VOWORK: register for reachability changed %@"), v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:forHostname:", *(_QWORD *)(a1 + 32), sel__reachabilityChanged_, CFSTR("configuration.apple.com"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsService, 0);
  objc_storeStrong((id *)&self->_managedConfigurationNotificationCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_voiceOverActivationCanceler, 0);
  objc_storeStrong((id *)&self->_voiceOverVibrateWindow, 0);
}

@end
