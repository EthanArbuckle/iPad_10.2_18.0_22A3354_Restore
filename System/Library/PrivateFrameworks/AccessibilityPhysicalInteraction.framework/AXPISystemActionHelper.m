@implementation AXPISystemActionHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  return (id)sharedInstance__shared_0;
}

void __40__AXPISystemActionHelper_sharedInstance__block_invoke()
{
  AXPISystemActionHelper *v0;
  void *v1;

  v0 = objc_alloc_init(AXPISystemActionHelper);
  v1 = (void *)sharedInstance__shared_0;
  sharedInstance__shared_0 = (uint64_t)v0;

}

- (AXPISystemActionHelper)init
{
  AXPISystemActionHelper *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *sysdiagnoseCancelCountQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXPISystemActionHelper;
  v2 = -[AXPISystemActionHelper init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AXPISystemActionHelperSysdiagnoseCancelCountQueue", 0);
    sysdiagnoseCancelCountQueue = v2->_sysdiagnoseCancelCountQueue;
    v2->_sysdiagnoseCancelCountQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)activateSiri
{
  -[AXPISystemActionHelper activateSiriFromClient:](self, "activateSiriFromClient:", 0);
}

- (void)activateSiriFromClient:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getSiriSimpleActivationSourceClass_softClass;
  v12 = getSiriSimpleActivationSourceClass_softClass;
  if (!getSiriSimpleActivationSourceClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getSiriSimpleActivationSourceClass_block_invoke;
    v8[3] = &unk_24F478958;
    v8[4] = &v9;
    __getSiriSimpleActivationSourceClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  v6 = objc_alloc_init(v5);
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXPISystemActionHelperClientBackTap")))
    v7 = 33;
  else
    v7 = 27;
  objc_msgSend(v6, "activateFromSource:", v7);

}

- (void)activateTypeToSiri
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openTypeToSiri");

}

- (void)activateVoiceControl
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openVoiceControl");

}

- (void)activateHomeButton
{
  id v3;

  if (objc_msgSend(MEMORY[0x24BE005E0], "isAvailable"))
  {
    objc_msgSend(MEMORY[0x24BE005E0], "server");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "goHome");

  }
  else
  {
    -[AXPISystemActionHelper pressHomeButtonDown](self, "pressHomeButtonDown");
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __44__AXPISystemActionHelper_activateHomeButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liftHomeButtonUp");
}

- (void)pressHomeButtonDown
{
  -[AXPISystemActionHelper _handleHomeButtonDispatch:](self, "_handleHomeButtonDispatch:", 1);
}

- (void)liftHomeButtonUp
{
  -[AXPISystemActionHelper _handleHomeButtonDispatch:](self, "_handleHomeButtonDispatch:", 0);
}

- (void)toggleReachability
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleReachability");

}

- (void)toggleCommandAndControl
{
  _AXSCommandAndControlEnabled();
  _AXSCommandAndControlSetEnabled();
}

- (void)armApplePay
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "armApplePay");

}

- (void)confirmApplePay
{
  objc_msgSend(MEMORY[0x24BDDA938], "notifyEvent:", 1);
}

- (void)toggleDock
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleDock");

}

- (BOOL)isRingerSwitchOn
{
  return BKSHIDServicesGetRingerState() != 0;
}

- (void)toggleAppSwitcher
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppSwitcherVisible");

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "dismissAppSwitcher");
  else
    objc_msgSend(v4, "openAppSwitcher");

}

- (void)toggleAppLibrary
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleAppLibrary");

}

- (void)toggleQuickNote
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleQuickNote");

}

- (void)activateLockButton
{
  -[AXPISystemActionHelper pressLockButtonDown](self, "pressLockButtonDown");
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __44__AXPISystemActionHelper_activateLockButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liftLockButtonUp");
}

- (void)pressLockButtonDown
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1010);
}

- (void)liftLockButtonUp
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1011);
}

- (void)toggleRingerSwitch:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1013;
  else
    v3 = 1012;
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", v3);
}

- (void)pressStaccato
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1043);
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __39__AXPISystemActionHelper_pressStaccato__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendButtonEvent:", 1042);
}

- (void)toggleMute
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1025);
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1026);
}

- (void)decreaseVolume
{
  -[AXPISystemActionHelper pressVolumeDownButtonDown](self, "pressVolumeDownButtonDown");
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __40__AXPISystemActionHelper_decreaseVolume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liftVolumeDownButtonUp");
}

- (void)increaseVolume
{
  -[AXPISystemActionHelper pressVolumeUpButtonDown](self, "pressVolumeUpButtonDown");
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __40__AXPISystemActionHelper_increaseVolume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liftVolumeUpButtonUp");
}

- (void)pressVolumeDownButtonDown
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1008);
}

- (void)liftVolumeDownButtonUp
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1009);
}

- (void)pressVolumeUpButtonDown
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1006);
}

- (void)liftVolumeUpButtonUp
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1007);
}

- (void)pressTVMenuButton
{
  -[AXPISystemActionHelper pressTVMenuButtonDown](self, "pressTVMenuButtonDown");
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __43__AXPISystemActionHelper_pressTVMenuButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liftTVMenuButtonUp");
}

- (void)pressTVMenuButtonDown
{
  -[AXPISystemActionHelper _sendButtonEvent:postHIDEventDirectly:](self, "_sendButtonEvent:postHIDEventDirectly:", 1216, 1);
}

- (void)liftTVMenuButtonUp
{
  -[AXPISystemActionHelper _sendButtonEvent:postHIDEventDirectly:](self, "_sendButtonEvent:postHIDEventDirectly:", 1217, 1);
}

- (void)pressTVSelectButton
{
  -[AXPISystemActionHelper pressTVSelectButtonDown](self, "pressTVSelectButtonDown");
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __45__AXPISystemActionHelper_pressTVSelectButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liftTVSelectButtonUp");
}

- (void)pressTVSelectButtonDown
{
  -[AXPISystemActionHelper _sendButtonEvent:postHIDEventDirectly:](self, "_sendButtonEvent:postHIDEventDirectly:", 1218, 1);
}

- (void)liftTVSelectButtonUp
{
  -[AXPISystemActionHelper _sendButtonEvent:postHIDEventDirectly:](self, "_sendButtonEvent:postHIDEventDirectly:", 1219, 1);
}

- (void)toggleSpotlight
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleSpotlight");

}

- (void)hideSpotlight
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpotlightVisible");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE006E8], "server");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleSpotlight");

  }
}

- (void)revealSpotlight
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "revealSpotlight");

}

- (void)toggleBackgroundSounds
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00728], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleBackgroundSounds");

}

- (void)toggleLiveCaptions
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleLiveTranscription");

}

- (void)toggleLiveSpeech
{
  objc_msgSend(MEMORY[0x24BE00740], "toggleLiveSpeech");
}

- (void)toggleNearbyDeviceControlPicker
{
  objc_msgSend(MEMORY[0x24BE00740], "attemptToPresentNearbyDeviceControlPicker");
}

- (void)toggleTorch
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleTorch");

}

- (void)_toggleClassicInvertColors
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "classicInvertColors") ^ 1;
  objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClassicInvertColors:", v2);

}

- (void)_toggleHoverTextTyping
{
  objc_msgSend(MEMORY[0x24BE00740], "toggleHoverTextTyping");
}

- (void)_toggleVoiceOver
{
  if (!_AXSVoiceOverTouchUsageConfirmed())
    _AXSVoiceOverTouchSetUsageConfirmed();
  if (!_AXSVoiceOverTouchEnabled() && _AXSCanDisableApplicationAccessibility())
    _AXSApplicationAccessibilitySetEnabled();
  _AXSVoiceOverTouchSetEnabled();
  _AXSVoiceOverTouchSetUIEnabled();
}

- (void)_toggleSmartInvert
{
  int v2;
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  double Current;
  id v8;

  v2 = _AXSInvertColorsEnabled();
  objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "classicInvertColors");

  if (v4)
    v5 = v2 == 0;
  else
    v5 = 0;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClassicInvertColors:", 0);

    _AXSInvertColorsSetEnabled();
    goto LABEL_8;
  }
  _AXSInvertColorsSetEnabled();
  if (!v2)
  {
LABEL_8:
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastSmartInvertColorsEnablement:", Current);

  }
}

- (void)_toggleZoom
{
  _AXSZoomTouchEnabled();
  _AXSZoomTouchSetEnabled();
}

- (void)_toggleZoomController
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "zoomShouldShowSlug") ^ 1;
  objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setZoomShouldShowSlug:", v2);

}

- (void)startMagnifier
{
  id v2;

  objc_msgSend(MEMORY[0x24BEC64F0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startMagnifierChangeTripleClickMenu:", 0);

}

- (BOOL)_hasScreenSwitch
{
  void *v2;
  void *v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistiveTouchSwitches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__AXPISystemActionHelper__hasScreenSwitch__block_invoke;
  v6[3] = &unk_24F478738;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__AXPISystemActionHelper__hasScreenSwitch__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x24BE00788]);

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (void)_toggleSwitchControl
{
  int v3;
  BOOL v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  v3 = _AXSAssistiveTouchScannerEnabled();
  v4 = v3 != 0;
  if (v3 && !-[AXPISystemActionHelper _hasScreenSwitch](self, "_hasScreenSwitch"))
  {
    objc_msgSend(MEMORY[0x24BE006E8], "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__AXPISystemActionHelper__toggleSwitchControl__block_invoke;
    v6[3] = &__block_descriptor_33_e8_v16__0q8l;
    v7 = v4;
    objc_msgSend(v5, "showAlert:withHandler:", 9, v6);

  }
  else
  {
    _AXSAssistiveTouchScannerSetEnabled();
  }
}

uint64_t __46__AXPISystemActionHelper__toggleSwitchControl__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return _AXSAssistiveTouchScannerSetEnabled();
  return result;
}

- (void)_toggleAssistiveTouch
{
  int v2;

  v2 = _AXSAssistiveTouchEnabled();
  _AXSAssistiveTouchSetEnabled();
  if (!v2)
    _AXSAssistiveTouchSetUIEnabled();
}

- (void)_toggleFullKeyboardAccess
{
  objc_msgSend(MEMORY[0x24BE00740], "toggleFullKeyboardAccess");
}

- (void)activateDetectionMode
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __CFString *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("com.apple.voiceovertouch");
  }
  v4 = (void *)MEMORY[0x24BE38478];
  v18[0] = *MEMORY[0x24BE382F8];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("apple-magnifier://detectionMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE38320];
  v19[0] = v5;
  v19[1] = MEMORY[0x24BDBD1C8];
  v7 = *MEMORY[0x24BE38310];
  v18[1] = v6;
  v18[2] = v7;
  v19[2] = MEMORY[0x24BDBD1C8];
  v18[3] = *MEMORY[0x24BE382F0];
  v16 = *MEMORY[0x24BEBDFB8];
  v17 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionsWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BED2688];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__AXPISystemActionHelper_activateDetectionMode__block_invoke;
  v14[3] = &unk_24F478780;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "openApplication:withOptions:completion:", v12, v13, v14);

}

void __47__AXPISystemActionHelper_activateDetectionMode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  AXLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_22A6C8000, v7, OS_LOG_TYPE_DEFAULT, "DetectionMode gesture launched process: %@, launch error: %@ (options: %@)", (uint8_t *)&v10, 0x20u);

  }
}

- (void)activateMagnifierFromStaccato
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  __CFString *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("com.apple.voiceovertouch");
  }
  v4 = (void *)MEMORY[0x24BE38478];
  v19[0] = *MEMORY[0x24BE382F8];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("apple-magnifier://staccato"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE38320];
  v20[0] = v5;
  v20[1] = MEMORY[0x24BDBD1C8];
  v7 = *MEMORY[0x24BE38310];
  v19[1] = v6;
  v19[2] = v7;
  v20[2] = MEMORY[0x24BDBD1C8];
  v19[3] = *MEMORY[0x24BE382F0];
  v17 = *MEMORY[0x24BEBDFB8];
  v18 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = *MEMORY[0x24BE382E0];
  v9 = *MEMORY[0x24BEB0CD8];
  v20[3] = v8;
  v20[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionsWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BED2688];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__AXPISystemActionHelper_activateMagnifierFromStaccato__block_invoke;
  v15[3] = &unk_24F478780;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "openApplication:withOptions:completion:", v13, v14, v15);

}

void __55__AXPISystemActionHelper_activateMagnifierFromStaccato__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  AXLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_22A6C8000, v7, OS_LOG_TYPE_DEFAULT, "Magnifier Staccato gesture launched process: %@, launch error: %@ (options: %@)", (uint8_t *)&v10, 0x20u);

  }
}

- (void)_openCamera:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("camera://configuration?capturemode=photo&capturedevice=front"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openSensitiveURL:withOptions:", v3, 0);

  }
  else
  {
    v4 = (void *)MEMORY[0x24BE38478];
    v9 = *MEMORY[0x24BE38320];
    v10[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optionsWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openApplication:withOptions:completion:", *MEMORY[0x24BDFE3D0], v6, 0);

  }
}

- (void)_cameraAction:(BOOL)a3
{
  void *v3;
  int v4;

  -[AXPISystemActionHelper _openCamera:](self, "_openCamera:", a3);
  objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assistiveTouchMouseOnDeviceEyeTrackingEnabled");

  if (v4)
    AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __40__AXPISystemActionHelper__cameraAction___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "increaseVolume");
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __40__AXPISystemActionHelper__cameraAction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateHomeButton");
}

- (void)_toggleColorFilters
{
  MADisplayFilterPrefGetCategoryEnabled();
  MADisplayFilterPrefSetCategoryEnabled();
}

- (void)turnDigitalCrown:(int64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_time_t v11;
  _QWORD block[5];

  if (turnDigitalCrown__onceToken != -1)
    dispatch_once(&turnDigitalCrown__onceToken, &__block_literal_global_235);
  if (a3 >= 0)
    v4 = a3;
  else
    v4 = -a3;
  if (a3)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0.0;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v7 = v7 + 0.01;
      v9 = v4 - v5;
      if (v9 >= 10)
        v9 = 10;
      if (a3 >= 0)
        v10 = v9;
      else
        v10 = -v9;
      v11 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __43__AXPISystemActionHelper_turnDigitalCrown___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v10;
      dispatch_after(v11, (dispatch_queue_t)turnDigitalCrown__digitalCrownHIDQueue, block);
      v6 += v10;
      if (v6 >= 0)
        v5 = v6;
      else
        v5 = -v6;
    }
    while (v5 < v4);
  }
}

void __43__AXPISystemActionHelper_turnDigitalCrown___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.axpi.digital.crown.scroll.queue", v2);
  v1 = (void *)turnDigitalCrown__digitalCrownHIDQueue;
  turnDigitalCrown__digitalCrownHIDQueue = (uint64_t)v0;

}

void __43__AXPISystemActionHelper_turnDigitalCrown___block_invoke_2()
{
  const void *ScrollEvent;
  void *v1;

  mach_absolute_time();
  ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
  +[AXPIEventSender sharedInstance](AXPIEventSender, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendIOHIDEventRef:", ScrollEvent);

  if (ScrollEvent)
    CFRelease(ScrollEvent);
}

- (void)turnDigitalCrownFullRevolution:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = -200;
  else
    v3 = 200;
  -[AXPISystemActionHelper turnDigitalCrown:](self, "turnDigitalCrown:", v3);
}

- (void)_activateSpeakScreen
{
  id v2;

  if (!_AXSSpeakThisEnabled())
  {
    _AXSSetSpeakThisEnabled();
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x24BDBD5A0], 0.5, 0);
  }
  objc_msgSend(MEMORY[0x24BEAFE98], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakThisWithOptions:errorHandler:", 12, &__block_literal_global_241);

}

uint64_t __46__AXPISystemActionHelper__activateSpeakScreen__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    return _AXLogWithFacility();
  return result;
}

- (void)activateTripleClick
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BE16E08], "sharedSystemShellSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isClarityBoardEnabled");

  if (v4)
  {
    if (AXDeviceHasHomeButton())
      -[AXPISystemActionHelper activateHomeButton](self, "activateHomeButton");
    else
      -[AXPISystemActionHelper activateLockButton](self, "activateLockButton");
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    _AXSHandleTripleClickHomeButtonPress();
  }
}

uint64_t __45__AXPISystemActionHelper_activateTripleClick__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "activateHomeButton");
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __45__AXPISystemActionHelper_activateTripleClick__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateHomeButton");
}

uint64_t __45__AXPISystemActionHelper_activateTripleClick__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "activateLockButton");
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __45__AXPISystemActionHelper_activateTripleClick__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateLockButton");
}

- (void)shake
{
  if (_AXSShakeToUndoDisabled())
    _AXSSetShakeToUndoDisabled();
  -[AXPISystemActionHelper _sendShakeEvent](self, "_sendShakeEvent");
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __31__AXPISystemActionHelper_shake__block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 32))
    return _AXSSetShakeToUndoDisabled();
  return result;
}

- (void)_sendShakeEvent
{
  unint64_t v2;
  id v3;
  _DWORD *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  BOOL v10;

  v2 = 0;
  do
  {
    v3 = objc_alloc_init(MEMORY[0x24BE00600]);
    v4 = (_DWORD *)((char *)&unk_22A6DBFEC + 4 * v2);
    LODWORD(v5) = *v4;
    objc_msgSend(v3, "setX:", v5);
    LODWORD(v6) = v4[1];
    objc_msgSend(v3, "setY:", v6);
    LODWORD(v7) = v4[2];
    objc_msgSend(v3, "setZ:", v7);
    objc_msgSend(v3, "setType:", 1);
    objc_msgSend(MEMORY[0x24BE00628], "accelerometerRepresentation:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPostHIDEventDirectly:", 1);
    +[AXPIEventSender sharedInstance](AXPIEventSender, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendEventRepresentation:", v8);

    v10 = v2 >= 0x1E;
    v2 += 3;
  }
  while (!v10);
}

- (void)takeScreenshot
{
  void *v2;
  char v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  NSObject *v9;
  void *v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;

  objc_msgSend(MEMORY[0x24BE005C8], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGuidedAccessActive");

  if ((v3 & 1) == 0)
  {
    if (_AXSCommandAndControlEnabled())
    {
      ct_green_tea_logger_create();
      getCTGreenTeaOsLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (!v4 || !os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        goto LABEL_14;
      v13 = 0;
      v6 = "Voice Control took screenshot";
      v7 = (uint8_t *)&v13;
    }
    else
    {
      v8 = _AXSAssistiveTouchEnabled();
      ct_green_tea_logger_create();
      getCTGreenTeaOsLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      v5 = v9;
      if (v8)
      {
        if (!v9 || !os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          goto LABEL_14;
        v12 = 0;
        v6 = "AssistiveTouch took screenshot";
        v7 = (uint8_t *)&v12;
      }
      else
      {
        if (!v9 || !os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          goto LABEL_14;
        v11 = 0;
        v6 = "Switch Control took screenshot";
        v7 = (uint8_t *)&v11;
      }
    }
    _os_log_impl(&dword_22A6C8000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
LABEL_14:

    ct_green_tea_logger_destroy();
    objc_msgSend(MEMORY[0x24BE006E8], "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "takeScreenshot");

  }
}

- (void)toggleControlCenter
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE00728], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControlCenterVisible");

  objc_msgSend(MEMORY[0x24BE00728], "server");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showControlCenter:", v3 ^ 1u);

}

- (void)toggleAssistiveAccess
{
  objc_msgSend(MEMORY[0x24BE00740], "attemptToEnterClarityBoard");
}

- (void)toggleWatchRemoteScreen
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22A6C8000, v0, v1, "Can't start remote screen on this device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)toggleNotificationCenter
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNotificationCenterVisible");

  AXLogPhysicalInteraction();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_22A6C8000, v4, OS_LOG_TYPE_INFO, "NC is visible: %d", (uint8_t *)v6, 8u);
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE006E8], "server", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showNotificationCenter:", 0);

  }
  AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXPISystemActionHelper_toggleNotificationCenter__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "toggleNotificationCenter");

}

- (void)adjustSystemZoom:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE005C8], "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (a3)
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(v4, "adjustSystemZoom:", v5);

}

- (void)rotatePortrait
{
  -[AXPISystemActionHelper _sendDeviceOrientationChange:](self, "_sendDeviceOrientationChange:", 1);
}

- (void)rotateUpsideDown
{
  -[AXPISystemActionHelper _sendDeviceOrientationChange:](self, "_sendDeviceOrientationChange:", 2);
}

- (void)rotateLeft
{
  -[AXPISystemActionHelper _sendDeviceOrientationChange:](self, "_sendDeviceOrientationChange:", 3);
}

- (void)rotateRight
{
  -[AXPISystemActionHelper _sendDeviceOrientationChange:](self, "_sendDeviceOrientationChange:", 4);
}

- (void)activateSOSMode
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateSOSMode");

}

- (void)rebootDevice
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00728], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rebootDevice");

}

- (void)performSysdiagnoseWithStatusUpdateHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  AXLogPhysicalInteraction();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A6C8000, v5, OS_LOG_TYPE_DEFAULT, "Generating sysdiagnose.", buf, 2u);
  }

  dispatch_get_global_queue(9, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke;
  v8[3] = &unk_24F4788E0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke(uint64_t a1)
{
  int v2;
  id v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  uint8_t *v38;
  _QWORD v39[5];
  id v40;
  uint8_t *v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD block[4];
  id v58;
  id v59;
  id v60;
  uint8_t v61[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v60 = 0;
  v2 = objc_msgSend(MEMORY[0x24BEDE3A8], "isSysdiagnoseInProgressWithError:", &v60);
  v3 = v60;
  v4 = v3;
  if (v2)
  {
    v59 = v3;
    v5 = objc_msgSend(MEMORY[0x24BEDE3A8], "cancelActiveSysdiagnoseWithError:", &v59);
    v6 = v59;

    AXLogPhysicalInteraction();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A6C8000, v8, OS_LOG_TYPE_DEFAULT, "Interrupting current sysdiagnose before generating.", buf, 2u);
      }

      v9 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_252;
      block[3] = &unk_24F478868;
      v10 = &v58;
      v58 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(NSObject **)(v11 + 24);
      v56[0] = v9;
      v56[1] = 3221225472;
      v56[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2;
      v56[3] = &unk_24F4785E8;
      v56[4] = v11;
      dispatch_sync(v12, v56);
      goto LABEL_14;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_cold_1((uint64_t)v6, v8, v20, v21, v22, v23, v24, v25);

    v26 = *(_QWORD *)(a1 + 32);
    v27 = MEMORY[0x24BDAC760];
    v28 = *(NSObject **)(v26 + 24);
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_257;
    v55[3] = &unk_24F4785E8;
    v55[4] = v26;
    dispatch_sync(v28, v55);
    v53[0] = v27;
    v53[1] = 3221225472;
    v53[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2_258;
    v53[3] = &unk_24F478868;
    v54 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v53);

  }
  else
  {
    if (!v3)
    {
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2_264;
      v49[3] = &unk_24F478868;
      v10 = &v50;
      v50 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], v49);
      v6 = 0;
LABEL_14:

      v48 = v6;
      objc_msgSend(MEMORY[0x24BEDE3A8], "sysdiagnoseWithMetadata:withError:", &unk_24F47CA00, &v48);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v48;

      *(_QWORD *)buf = 0;
      v43 = buf;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__0;
      v46 = __Block_byref_object_dispose__0;
      v47 = 0;
      if (v29)
      {
        AXLogPhysicalInteraction();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v61 = 138543362;
          v62 = v29;
          _os_log_impl(&dword_22A6C8000, v31, OS_LOG_TYPE_DEFAULT, "Sysdiagnose completed. File path: %{public}@", v61, 0xCu);
        }

        AXPILocalizedString(CFSTR("SYSDIAGNOSE_COMPLETED"));
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)*((_QWORD *)v43 + 5);
        *((_QWORD *)v43 + 5) = v32;

      }
      else
      {
        v34 = *(_QWORD *)(a1 + 32);
        v35 = *(NSObject **)(v34 + 24);
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_272;
        v39[3] = &unk_24F478890;
        v39[4] = v34;
        v40 = v30;
        v41 = buf;
        dispatch_sync(v35, v39);

      }
      if (*((_QWORD *)v43 + 5))
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_273;
        v36[3] = &unk_24F4788B8;
        v37 = *(id *)(a1 + 40);
        v38 = buf;
        dispatch_async(MEMORY[0x24BDAC9B8], v36);

      }
      _Block_object_dispose(buf, 8);

      v6 = v30;
      goto LABEL_22;
    }
    AXLogPhysicalInteraction();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_cold_2((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);

    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_261;
    v51[3] = &unk_24F478868;
    v52 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v51);

    v6 = v4;
  }
LABEL_22:

}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_252(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  AXPILocalizedString(CFSTR("SYSDIAGNOSE_BEGAN_AFTER_CANCEL"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_257(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
    *(_QWORD *)(v1 + 16) = v2 - 1;
  return result;
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2_258(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  AXPILocalizedString(CFSTR("SYSDIAGNOSE_IN_PROGRESS"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_261(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  AXPILocalizedString(CFSTR("SYSDIAGNOSE_FAILED"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2_264(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  AXPILocalizedString(CFSTR("SYSDIAGNOSE_BEGAN"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_272(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  AXLogPhysicalInteraction();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
      __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_272_cold_2(a1, v3, v5, v6, v7, v8, v9, v10);

    --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (v4)
      __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_272_cold_1(a1, v3, v5, v6, v7, v8, v9, v10);

    if (objc_msgSend(*(id *)(a1 + 40), "code") == -56)
      v11 = CFSTR("SYSDIAGNOSE_IN_PROGRESS");
    else
      v11 = CFSTR("SYSDIAGNOSE_FAILED");
    AXPILocalizedString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);

  }
}

uint64_t __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_273(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)_showAlertForReboot
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_22A6C8000, a2, OS_LOG_TYPE_ERROR, "Failed to create notification with error code: %i", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)pressCameraButton
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1044);
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __43__AXPISystemActionHelper_pressCameraButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendButtonEvent:", 1045);
}

- (void)lightPressCameraButton
{
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1046);
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1047);
  -[AXPISystemActionHelper _sendButtonEvent:](self, "_sendButtonEvent:", 1048);
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __48__AXPISystemActionHelper_lightPressCameraButton__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendButtonEvent:", 1051);
  objc_msgSend(*(id *)(a1 + 32), "_sendButtonEvent:", 1050);
  return objc_msgSend(*(id *)(a1 + 32), "_sendButtonEvent:", 1049);
}

- (void)doubleLightPressCameraButton
{
  -[AXPISystemActionHelper lightPressCameraButton](self, "lightPressCameraButton");
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __54__AXPISystemActionHelper_doubleLightPressCameraButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lightPressCameraButton");
}

- (void)warm
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22A6C8000, v0, v1, "Could not create _homeButtonUserDevice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __30__AXPISystemActionHelper_warm__block_invoke()
{
  CFRunLoopGetMain();
  return IOHIDUserDeviceScheduleWithRunLoop();
}

- (void)_handleHomeButtonDispatch:(BOOL)a3
{
  NSObject *v5;
  const __CFAllocator *v6;
  CFAbsoluteTime Current;
  __CFRunLoopTimer *v8;
  __CFRunLoop *Main;
  _QWORD v10[5];
  BOOL v11;

  if (self->_homeButtonUserDevice)
    goto LABEL_5;
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[AXPISystemActionHelper _handleHomeButtonDispatch:].cold.1();

  if (self->_homeButtonUserDevice)
  {
LABEL_5:
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Current = CFAbsoluteTimeGetCurrent();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__AXPISystemActionHelper__handleHomeButtonDispatch___block_invoke;
    v10[3] = &unk_24F478908;
    v11 = a3;
    v10[4] = self;
    v8 = CFRunLoopTimerCreateWithHandler(v6, Current, 0.0, 0, 0, v10);
    Main = CFRunLoopGetMain();
    CFRunLoopAddTimer(Main, v8, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    CFRelease(v8);
  }
}

uint64_t __52__AXPISystemActionHelper__handleHomeButtonDispatch___block_invoke(uint64_t a1)
{
  NSObject *v2;

  AXLogPhysicalInteraction();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__AXPISystemActionHelper__handleHomeButtonDispatch___block_invoke_cold_1(a1, v2);

  return IOHIDUserDeviceHandleReport();
}

- (void)_sendButtonEvent:(unsigned int)a3
{
  -[AXPISystemActionHelper _sendButtonEvent:postHIDEventDirectly:](self, "_sendButtonEvent:postHIDEventDirectly:", *(_QWORD *)&a3, 0);
}

- (void)_sendButtonEvent:(unsigned int)a3 postHIDEventDirectly:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BE00628], "buttonRepresentationWithType:", *(_QWORD *)&a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdditionalFlags:", objc_msgSend(v6, "additionalFlags") | 0x4000);
  objc_msgSend(v6, "setPostHIDEventDirectly:", v4);
  +[AXPIEventSender sharedInstance](AXPIEventSender, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEventRepresentation:", v6);

}

- (void)_sendDeviceOrientationChange:(int64_t)a3
{
  id *v4;
  void *v5;
  char v6;
  id v7;

  v4 = (id *)0x24BE005E0;
  if ((objc_msgSend(MEMORY[0x24BE005E0], "isAvailable") & 1) != 0
    || (v4 = (id *)0x24BE006E8,
        objc_msgSend(MEMORY[0x24BE006E8], "server"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isControlCenterVisible"),
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(*v4, "server");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOrientation:", a3);

  }
}

- (void)performActionForSystemAction:(id)a3
{
  -[AXPISystemActionHelper performActionForSystemAction:fromClient:](self, "performActionForSystemAction:fromClient:", a3, 0);
}

- (void)performActionForSystemAction:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AXPISystemActionHelper *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  AXPISystemActionHelper *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFE08]))
  {
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCB8]))
    {
      -[AXPISystemActionHelper toggleAppSwitcher](self, "toggleAppSwitcher");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD20]))
    {
      -[AXPISystemActionHelper toggleControlCenter](self, "toggleControlCenter");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD50]))
    {
      -[AXPISystemActionHelper activateHomeButton](self, "activateHomeButton");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD70]))
    {
      -[AXPISystemActionHelper activateLockButton](self, "activateLockButton");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD88]))
    {
      -[AXPISystemActionHelper toggleRingerSwitch:](self, "toggleRingerSwitch:", -[AXPISystemActionHelper isRingerSwitchOn](self, "isRingerSwitchOn") ^ 1);
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD98]))
    {
      -[AXPISystemActionHelper toggleNotificationCenter](self, "toggleNotificationCenter");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDA8]))
    {
      -[AXPISystemActionHelper toggleReachability](self, "toggleReachability");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDB8]))
    {
      -[AXPISystemActionHelper takeScreenshot](self, "takeScreenshot");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDD0]))
    {
      -[AXPISystemActionHelper shake](self, "shake");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDD8]))
    {
      -[AXPISystemActionHelper activateSiriFromClient:](self, "activateSiriFromClient:", v7);
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFE10]))
    {
      -[AXPISystemActionHelper activateTypeToSiri](self, "activateTypeToSiri");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDB0]))
    {
      -[AXPISystemActionHelper activateSOSMode](self, "activateSOSMode");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDF0]))
    {
      -[AXPISystemActionHelper toggleSpotlight](self, "toggleSpotlight");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD10]))
    {
      -[AXPISystemActionHelper toggleCommandAndControl](self, "toggleCommandAndControl");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFE28]))
    {
      -[AXPISystemActionHelper increaseVolume](self, "increaseVolume");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFE20]))
    {
      -[AXPISystemActionHelper decreaseVolume](self, "decreaseVolume");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCC0]))
    {
      -[AXPISystemActionHelper armApplePay](self, "armApplePay");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD58]))
    {
      -[AXPISystemActionHelper _toggleHoverTextTyping](self, "_toggleHoverTextTyping");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD18]))
    {
      -[AXPISystemActionHelper confirmApplePay](self, "confirmApplePay");
      goto LABEL_48;
    }
    v8 = *MEMORY[0x24BDFFC48];
    if (objc_msgSend(v6, "hasPrefix:", *MEMORY[0x24BDFFC48]))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "rangeOfString:", v9);
      objc_msgSend(v6, "substringFromIndex:", v10 + v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE006D8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortcutForIdentifier:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE006D8], "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "performShortcut:", v14);

      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDC8]))
    {
      v16 = self;
      v17 = 0;
LABEL_47:
      -[AXPISystemActionHelper _performScrollAction:](v16, "_performScrollAction:", v17);
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDC0]))
    {
      v16 = self;
      v17 = 1;
      goto LABEL_47;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCD0]))
    {
      -[AXPISystemActionHelper _toggleAssistiveTouch](self, "_toggleAssistiveTouch");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFE18]))
    {
      -[AXPISystemActionHelper _toggleVoiceOver](self, "_toggleVoiceOver");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD00]))
    {
      -[AXPISystemActionHelper _toggleClassicInvertColors](self, "_toggleClassicInvertColors");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD08]))
    {
      -[AXPISystemActionHelper _toggleColorFilters](self, "_toggleColorFilters");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDE0]))
    {
      -[AXPISystemActionHelper _toggleSmartInvert](self, "_toggleSmartInvert");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFE38]))
    {
      -[AXPISystemActionHelper _toggleZoom](self, "_toggleZoom");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFE40]))
    {
      -[AXPISystemActionHelper _toggleZoomController](self, "_toggleZoomController");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD78]))
    {
      -[AXPISystemActionHelper startMagnifier](self, "startMagnifier");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDF8]))
    {
      -[AXPISystemActionHelper _toggleSwitchControl](self, "_toggleSwitchControl");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD40]))
    {
      -[AXPISystemActionHelper _toggleFullKeyboardAccess](self, "_toggleFullKeyboardAccess");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDE8]))
    {
      -[AXPISystemActionHelper _activateSpeakScreen](self, "_activateSpeakScreen");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFE00]))
    {
      -[AXPISystemActionHelper toggleTorch](self, "toggleTorch");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCD8]))
    {
      -[AXPISystemActionHelper toggleBackgroundSounds](self, "toggleBackgroundSounds");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD60]))
    {
      -[AXPISystemActionHelper toggleLiveCaptions](self, "toggleLiveCaptions");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD68]))
    {
      -[AXPISystemActionHelper toggleLiveSpeech](self, "toggleLiveSpeech");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD30]))
    {
      v18 = (void *)MEMORY[0x24BE00740];
      v19 = 35;
LABEL_85:
      objc_msgSend(v18, "toggleTripleClickOption:", v19);
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD80]))
    {
      v18 = (void *)MEMORY[0x24BE00740];
      v19 = 36;
      goto LABEL_85;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD48]))
    {
      v18 = (void *)MEMORY[0x24BE00740];
      v19 = 38;
      goto LABEL_85;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD90]))
    {
      -[AXPISystemActionHelper toggleNearbyDeviceControlPicker](self, "toggleNearbyDeviceControlPicker");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD28]))
    {
      if (!_AXSVoiceOverTouchEnabled())
      {
        -[AXPISystemActionHelper activateDetectionMode](self, "activateDetectionMode");
        goto LABEL_48;
      }
      objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "liveRecognitionActive");

      objc_msgSend(MEMORY[0x24BE00768], "server");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v21)
        v24 = 51;
      else
        v24 = 50;
      -[NSObject triggerCommand:](v22, "triggerCommand:", v24);
LABEL_102:

      goto LABEL_48;
    }
    if (AXDeviceSupportsWatchRemoteScreen()
      && objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFE30]))
    {
      -[AXPISystemActionHelper toggleWatchRemoteScreen](self, "toggleWatchRemoteScreen");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCC8]))
    {
      -[AXPISystemActionHelper toggleAssistiveAccess](self, "toggleAssistiveAccess");
      goto LABEL_48;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCE0]))
    {
      v25 = self;
      v26 = 0;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFD38]))
      {
        if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFDA0]))
        {
          objc_msgSend(MEMORY[0x24BE006E8], "server");
          v23 = objc_claimAutoreleasedReturnValue();
          -[NSObject setOrientationLocked:](v23, "setOrientationLocked:", -[NSObject isOrientationLocked](v23, "isOrientationLocked") ^ 1);
        }
        else
        {
          if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCE8]))
          {
            -[AXPISystemActionHelper pressCameraButton](self, "pressCameraButton");
            goto LABEL_48;
          }
          if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCF8]))
          {
            -[AXPISystemActionHelper lightPressCameraButton](self, "lightPressCameraButton");
            goto LABEL_48;
          }
          if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCF0]))
          {
            -[AXPISystemActionHelper doubleLightPressCameraButton](self, "doubleLightPressCameraButton");
            goto LABEL_48;
          }
          if (AXDeviceHasStaccato()
            && objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFFCB0]))
          {
            +[AXPISystemActionHelper sharedInstance](AXPISystemActionHelper, "sharedInstance");
            v23 = objc_claimAutoreleasedReturnValue();
            -[NSObject pressStaccato](v23, "pressStaccato");
          }
          else
          {
            if (!v6)
              goto LABEL_48;
            AXLogPhysicalInteraction();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[AXPISystemActionHelper performActionForSystemAction:fromClient:].cold.1((uint64_t)v6, v23, v27, v28, v29, v30, v31, v32);
          }
        }
        goto LABEL_102;
      }
      v25 = self;
      v26 = 1;
    }
    -[AXPISystemActionHelper _cameraAction:](v25, "_cameraAction:", v26);
    goto LABEL_48;
  }
  -[AXPISystemActionHelper activateTripleClick](self, "activateTripleClick");
LABEL_48:

}

- (void)_performScrollAction:(BOOL)a3
{
  AXPerformBlockOnMainThread();
}

void __47__AXPISystemActionHelper__performScrollAction___block_invoke(uint64_t a1)
{
  AXPIFingerController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double Height;
  double v22;
  double v23;
  int v24;
  double Width;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  CGPoint v33;
  CGPoint v34;
  CGRect v35;
  CGRect v36;

  v32[2] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = objc_alloc_init(AXPIFingerController);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

  }
  objc_msgSend(MEMORY[0x24BE006E8], "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activeApplicationOrientation");

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  AX_CGRectGetCenter();
  if (v6)
  {
    v18 = v16;
    v19 = v17;
    if (v6 > 2)
    {
      if (v6 - 3 <= 1)
      {
        v24 = *(unsigned __int8 *)(a1 + 40);
        v36.origin.x = v9;
        v36.origin.y = v11;
        v36.size.width = v13;
        v36.size.height = v15;
        Width = CGRectGetWidth(v36);
        if (v24)
          Width = -Width;
        v26 = Width / 3.0;
        if (v6 != 4)
          v26 = -v26;
        v18 = v18 + v26;
      }
    }
    else
    {
      v20 = *(unsigned __int8 *)(a1 + 40);
      v35.origin.x = v9;
      v35.origin.y = v11;
      v35.size.width = v13;
      v35.size.height = v15;
      Height = CGRectGetHeight(v35);
      if (v20)
        Height = -Height;
      v22 = Height * 0.25;
      v23 = -(Height * 0.25);
      if (v6 == 1)
        v23 = v22;
      v19 = v19 + v23;
    }
    v27 = (void *)MEMORY[0x24BE00688];
    AX_CGRectGetCenter();
    NSStringFromCGPoint(v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v28;
    v34.x = v18;
    v34.y = v19;
    NSStringFromCGPoint(v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lineGestureBetweenPoints:duration:", v30, 0.25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "performGesture:", v31);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerController, 0);
  objc_storeStrong((id *)&self->_sysdiagnoseCancelCountQueue, 0);
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6C8000, a2, a3, "Failed to interrupt current sysdiagnose: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6C8000, a2, a3, "Failed to check status of current sysdiagnose: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_272_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6C8000, a2, a3, "Unable to complete sysdiagnose. Error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_272_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6C8000, a2, a3, "Ignoring error from failure to complete sysdiagnose, because we canceled one. Error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_handleHomeButtonDispatch:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_22A6C8000, v0, OS_LOG_TYPE_FAULT, "_homeButtonUserDevice expectedly nil. Need to call warm", v1, 2u);
  OUTLINED_FUNCTION_2();
}

void __52__AXPISystemActionHelper__handleHomeButtonDispatch___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_22A6C8000, a2, OS_LOG_TYPE_DEBUG, "send home button state down: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)performActionForSystemAction:(uint64_t)a3 fromClient:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6C8000, a2, a3, "Invalid system action requested: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
