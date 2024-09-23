@implementation AXBHomeClickController

- (void)_updateHomeClickEnabled
{
  _HomeClickEnabled = _AXSHomeClickEnabled() != 0;
  -[AXBHomeClickController _updateEventTapSettings](self, "_updateEventTapSettings");
}

- (void)_updateHomeClickSpeed
{
  int v2;

  _AXSHomeClickSpeed();
  _HomeClickTimeout = v2;
}

- (id)_writeLoginNoteTimer
{
  AXDispatchTimer *writeLoginNoteTimer;
  AXDispatchTimer *v4;
  AXDispatchTimer *v5;

  writeLoginNoteTimer = self->_writeLoginNoteTimer;
  if (!writeLoginNoteTimer)
  {
    v4 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x24BDFE490]);
    v5 = self->_writeLoginNoteTimer;
    self->_writeLoginNoteTimer = v4;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](self->_writeLoginNoteTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    writeLoginNoteTimer = self->_writeLoginNoteTimer;
  }
  return writeLoginNoteTimer;
}

- (void)_writeNoteToNewUserSession
{
  id v2;

  -[AXBHomeClickController _writeLoginNoteTimer](self, "_writeLoginNoteTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "afterDelay:processBlock:", &__block_literal_global_13, 0.5);

}

void __52__AXBHomeClickController__writeNoteToNewUserSession__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  if (AXSessionIsLoginSession())
  {
    v5[0] = *MEMORY[0x24BE00270];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSVoiceOverTouchEnabled());
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v0;
    v5[1] = *MEMORY[0x24BE00278];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSZoomTouchEnabled());
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v6[1] = v1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v2, 200, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFDD80], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:toFileAtAccessibilityContainerPath:completion:", v3, *MEMORY[0x24BE00268], &__block_literal_global_181_0);

  }
}

uint64_t __52__AXBHomeClickController__writeNoteToNewUserSession__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    return _AXLogWithFacility();
  return result;
}

- (void)clearNoteToUserSession
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFDD80], "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteFileAtAccessibilityContainerPath:completion:", *MEMORY[0x24BE00268], &__block_literal_global_184_0);

}

uint64_t __48__AXBHomeClickController_clearNoteToUserSession__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    return _AXLogWithFacility();
  return result;
}

- (void)_promptToDisableBrightnessFilters:(id)a3 data:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BE006F0];
  v7 = a4;
  objc_msgSend(v6, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__AXBHomeClickController__promptToDisableBrightnessFilters_data___block_invoke;
  v10[3] = &unk_2501882B8;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "showAlert:withHandler:withData:", 7, v10, v7);

}

uint64_t __65__AXBHomeClickController__promptToDisableBrightnessFilters_data___block_invoke(uint64_t result, uint64_t a2)
{
  if ((_DWORD)a2 == 1)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(result + 32) + 16))(*(_QWORD *)(result + 32), a2);
    return _AXSScreenFilterSetShowInitialAlert();
  }
  return result;
}

- (id)_votExistsBreadCrumbFile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("VoiceOverToggled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_voiceOverWasToggledSinceBoot
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBHomeClickController _votExistsBreadCrumbFile](self, "_votExistsBreadCrumbFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  return v6;
}

- (void)_setVoiceOverWasToggledSinceBoot:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBHomeClickController _votExistsBreadCrumbFile](self, "_votExistsBreadCrumbFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createFileAtPath:contents:attributes:", v7, 0, 0);

  }
  else
  {
    objc_msgSend(v8, "removeItemAtURL:error:", v5, 0);
  }

}

- (void)_toggleVoiceOver
{
  int v3;
  id v4;

  if (!_AXSVoiceOverTouchUsageConfirmed())
    _AXSVoiceOverTouchSetUsageConfirmed();
  v3 = _AXSVoiceOverTouchEnabled();
  v4 = (id)_AXSTripleClickCopyOptions();
  if (v3)
  {
    if (_AXSTripleClickContainsOption())
      goto LABEL_13;
LABEL_10:
    if (!_IsBuddyRunning && !AXSessionIsLoginSession() || !v3)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (_AXSCanDisableApplicationAccessibility())
    _AXSApplicationAccessibilitySetEnabled();
  if (!_AXSTripleClickContainsOption())
    goto LABEL_10;
  _AXSApplicationAccessibilitySetEnabled();
LABEL_13:
  _AXSSetTripleClickOptions();
  _AXSAccessibilitySetiTunesPreference();
LABEL_14:
  _AXSVoiceOverTouchSetEnabled();
  _AXSVoiceOverTouchSetUIEnabled();
  if (_AXSVoiceOverTouchEnabled())
    -[AXBHomeClickController _setVoiceOverWasToggledSinceBoot:](self, "_setVoiceOverWasToggledSinceBoot:", 1);

}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  AXUIClient *v4;
  AXUIClient *v5;

  v4 = (AXUIClient *)a3;
  if (self->_displayFilterUIClient == v4)
  {
    self->_displayFilterUIClient = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (id)displayFilterUIClient
{
  AXUIClient *displayFilterUIClient;
  id v4;
  AXUIClient *v5;
  AXUIClient *v6;

  displayFilterUIClient = self->_displayFilterUIClient;
  if (!displayFilterUIClient)
  {
    v4 = objc_alloc(MEMORY[0x24BDFF8F0]);
    v5 = (AXUIClient *)objc_msgSend(v4, "initWithIdentifier:serviceBundleName:", CFSTR("HomeClickController"), *MEMORY[0x24BE00040]);
    v6 = self->_displayFilterUIClient;
    self->_displayFilterUIClient = v5;

    -[AXUIClient setDelegate:](self->_displayFilterUIClient, "setDelegate:", self);
    displayFilterUIClient = self->_displayFilterUIClient;
  }
  return displayFilterUIClient;
}

- (void)_toggleMagnifier
{
  id v2;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startMagnifier");

}

- (void)_toggleDetectionMode
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (_AXSVoiceOverTouchEnabled())
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "liveRecognitionActive");

    objc_msgSend(MEMORY[0x24BE00770], "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (v3)
      v5 = 51;
    else
      v5 = 50;
    objc_msgSend(v4, "triggerCommand:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleDetectionMode");
  }

}

- (void)_showLookingGlassMenu
{
  +[AXBLookingGlassManager showLookingGlassMenu](AXBLookingGlassManager, "showLookingGlassMenu");
}

- (void)_toggleGuidedAccessBlock:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)_AXSTripleClickCopyOptions();
  objc_msgSend(v4, "count");
  AXPerformBlockOnMainThreadAfterDelay();

}

- (void)_toggleOnDeviceEyeTracking
{
  _BOOL8 v2;
  id v3;

  v2 = _AXSOnDeviceEyeTrackingEnabled() == 0;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:", v2);

}

- (void)_setHearingAidControlVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHearingAidControlVisible:", v3);

}

- (void)_didHideAlert
{
  if (-[AXBHomeClickController didShowHoldDurationTripleClickHelp](self, "didShowHoldDurationTripleClickHelp"))
  {
    +[AXBTouchAccommodationsController hideHoldDurationTripleClickHelp](AXBTouchAccommodationsController, "hideHoldDurationTripleClickHelp");
    -[AXBHomeClickController setDidShowHoldDurationTripleClickHelp:](self, "setDidShowHoldDurationTripleClickHelp:", 0);
  }
}

- (void)_willShowAlert
{
  id v3;

  if (-[AXBHomeClickController didShowHoldDurationTripleClickHelp](self, "didShowHoldDurationTripleClickHelp"))
    _AXAssert();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "touchAccommodationsEnabled")
    && objc_msgSend(v3, "touchAccommodationsHoldDurationEnabled"))
  {
    +[AXBTouchAccommodationsController showHoldDurationTripleClickHelp](AXBTouchAccommodationsController, "showHoldDurationTripleClickHelp");
    -[AXBHomeClickController setDidShowHoldDurationTripleClickHelp:](self, "setDidShowHoldDurationTripleClickHelp:", 1);
  }

}

- (void)_toggleDisplayAskSheet
{
  _BOOL4 isAlertVisible;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;
  _QWORD v11[5];
  uint8_t buf[16];

  isAlertVisible = self->_isAlertVisible;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  if (isAlertVisible)
  {
    objc_msgSend(v4, "hideAlert");

  }
  else
  {
    v5 = objc_msgSend(v4, "isShowingAXAlert");

    if ((v5 & 1) == 0)
    {
      if (_AXSTwiceRemoteScreenEnabled())
      {
        v9 = CFSTR("[TWICE] Dismiss AppleWatchMirroring card before showing the AX Shortcut sheet");
        LOBYTE(v8) = 1;
        _AXLogWithFacility();
        _AXSTwiceRemoteScreenSetEnabled();
      }
      self->_isAlertVisible = 1;
      -[AXBHomeClickController _willShowAlert](self, "_willShowAlert", v8, v9);
      AXLogBackboardServer();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_232455000, v6, OS_LOG_TYPE_DEFAULT, "Triple click: presenting from backboardd.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __48__AXBHomeClickController__toggleDisplayAskSheet__block_invoke;
      v11[3] = &unk_2501882E0;
      v11[4] = self;
      objc_msgSend(v7, "showAlert:withHandler:", 0, v11);

    }
  }
}

uint64_t __48__AXBHomeClickController__toggleDisplayAskSheet__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  AXLogBackboardServer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_232455000, v4, OS_LOG_TYPE_DEFAULT, "Triple click: handling from backboardd with %ld.", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE00738], "registerObserverForTripleClickOption:", a2);
  if ((int)a2 > 15)
  {
    if ((_DWORD)a2 == 16)
    {
      objc_msgSend(*(id *)(a1 + 32), "_showLookingGlassMenu");
      goto LABEL_13;
    }
    if ((_DWORD)a2 == 22)
    {
      objc_msgSend(*(id *)(a1 + 32), "_toggleDetectionMode");
      goto LABEL_13;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x24BE00738], "toggleTripleClickOption:", a2);
    goto LABEL_13;
  }
  if ((_DWORD)a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startVoiceOverSequence");
    goto LABEL_13;
  }
  if ((_DWORD)a2 != 12)
    goto LABEL_12;
  objc_msgSend(*(id *)(a1 + 32), "_toggleMagnifier");
LABEL_13:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_didHideAlert");
}

- (void)_startVoiceOverSequence
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  CFNotificationName *v7;
  uint8_t v8[16];

  if (_AXSVoiceOverTouchEnabled())
    goto LABEL_2;
  if (!_isBuddyRunning()
    || !-[AXBHomeClickController _accessibilityIsFactoryDiskImagePresent](self, "_accessibilityIsFactoryDiskImagePresent"))
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "voiceOverActivationWorkaround");

    switch(v5)
    {
      case 1:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v7 = (CFNotificationName *)MEMORY[0x24BE003E8];
        break;
      case 3:
        return;
      case 2:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v7 = (CFNotificationName *)MEMORY[0x24BE003E0];
        break;
      default:
LABEL_2:
        objc_msgSend((id)_Controller, "_toggleVoiceOver");
        return;
    }
    CFNotificationCenterPostNotification(DarwinNotifyCenter, *v7, 0, 0, 1u);
    return;
  }
  AXLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_232455000, v3, OS_LOG_TYPE_DEFAULT, "User activated VoiceOver gesture during setup, but FDI present so VoiceOver gesture will be suppressed", v8, 2u);
  }

}

- (void)_updateTripleHomeSettings:(BOOL)a3
{
  id v5;

  v5 = (id)_AXSTripleClickCopyOptions();
  if (objc_msgSend(v5, "count"))
  {
    _TripleHomeEnabled = 1;
  }
  else
  {
    _TripleHomeEnabled = 0;
    if (!a3
      && _AXSApplicationAccessibilityEnabled()
      && _AXSCanDisableApplicationAccessibility())
    {
      _AXSApplicationAccessibilitySetEnabled();
    }
  }
  -[AXBHomeClickController _updateEventTapSettings](self, "_updateEventTapSettings");

}

- (BOOL)captureHomeClick:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  int HasHomeButton;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __CFNotificationCenter *LocalCenter;
  id v22;
  void *v23;
  void *v24;
  double v25;
  _QWORD v26[4];
  id v27;
  id location[6];

  v4 = a3;
  if (captureHomeClick__onceToken != -1)
    dispatch_once(&captureHomeClick__onceToken, &__block_literal_global_213);
  if (_HomeClickEnabled)
  {
    if (!v4)
      goto LABEL_70;
  }
  else
  {
    LOBYTE(v5) = 0;
    if (!v4 || (_TripleHomeEnabled & 1) == 0)
      goto LABEL_71;
  }
  if (AXDeviceHasHomeButton())
    v6 = 1000;
  else
    v6 = 1010;
  if (captureHomeClick__RequiresReachability
    && objc_msgSend(v4, "type") == 1000
    && (AXInPreboardScenario() & 1) == 0
    && (AXInCheckerBoardScenario() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelReachabilityDetection");

  }
  if (_TripleHomeEnabled != 1 || !self->_isAlertVisible)
    goto LABEL_34;
  if (objc_msgSend(v4, "type") == 50)
  {
    v5 = AXDeviceIsPad() ^ 1;
    goto LABEL_71;
  }
  if (objc_msgSend(v4, "type") != 1001
    && objc_msgSend(v4, "type") != 1011
    && objc_msgSend(v4, "type") != 1104)
  {
    if (objc_msgSend(v4, "type") == 1010 || objc_msgSend(v4, "type") == 1103)
    {
      _LockButtonDown = 1;
    }
    else if (objc_msgSend(v4, "type") == v6)
    {
      -[NSLock lock](self->_menuButtonLock, "lock");
      -[NSMutableArray addObject:](self->_menuButtonClientIds, "addObject:", v4);
      -[NSLock unlock](self->_menuButtonLock, "unlock");
      ++qword_255FC6A20;
      if (_LockButtonDown != 1)
        goto LABEL_91;
      goto LABEL_90;
    }
LABEL_34:
    if (objc_msgSend(v4, "type") == 1011 || objc_msgSend(v4, "type") == 1104)
    {
      v8 = 0;
    }
    else
    {
      if (objc_msgSend(v4, "type") != 1010 && objc_msgSend(v4, "type") != 1103)
      {
LABEL_41:
        if ((objc_msgSend(v4, "type", CFAbsoluteTimeGetCurrent()) == 1001
           || objc_msgSend(v4, "type") == 1000)
          && (+[AXBackBoardGlue isDisplayBacklightOff](AXBackBoardGlue, "isDisplayBacklightOff")
           || CFAbsoluteTimeGetCurrent() - *(double *)&_LastHomeButtonPressWithBacklightOff < 0.25)
          && (AXInPreboardScenario() & 1) == 0
          && (AXInCheckerBoardScenario() & 1) == 0)
        {
          CFAbsoluteTimeGetCurrent();
          LOBYTE(v5) = 0;
          _LastHomeButtonPressWithBacklightOff = CFAbsoluteTimeGetCurrent();
          goto LABEL_71;
        }
        if (AXDeviceHasHomeButton()
          && (objc_msgSend(v4, "type") == 1000 && (_LockButtonDown & 1) != 0
           || (objc_msgSend(v4, "type") == 1010 || objc_msgSend(v4, "type") == 1103)
           && qword_255FC6A20 == 1))
        {
          -[AXBHomeClickController _fireHomeButtons:](self, "_fireHomeButtons:", 0);
          LOBYTE(v5) = 0;
          _LastScreenshotTake = CFAbsoluteTimeGetCurrent();
          goto LABEL_71;
        }
        if (-[AXBHomeClickController isHearingAidControlVisible](self, "isHearingAidControlVisible")
          && objc_msgSend(v4, "type") == 1001
          && CFAbsoluteTimeGetCurrent() - *(double *)&_LastScreenshotTake > 0.5)
        {
          -[NSMutableArray removeAllObjects](self->_menuButtonClientIds, "removeAllObjects");
          qword_255FC6A20 = 0;
          -[AXBHomeClickController _setHearingAidControlVisible:](self, "_setHearingAidControlVisible:", 0);
          objc_msgSend((id)_HomeClickTimer, "cancel");
          v9 = (void *)_HomeClickTimer;
          _HomeClickTimer = 0;

LABEL_70:
          LOBYTE(v5) = 0;
          goto LABEL_71;
        }
        if ((_IsBuddyRunning || AXSessionIsLoginSession())
          && objc_msgSend(v4, "type") == 3001)
        {
          LOBYTE(location[0]) = 0;
          -[AXBHomeClickController _checkIfZoomWasActivated:stealEvent:](self, "_checkIfZoomWasActivated:stealEvent:", v4, location);
          LOBYTE(v5) = LOBYTE(location[0]) != 0;
          goto LABEL_71;
        }
        HasHomeButton = AXDeviceHasHomeButton();
        v11 = objc_msgSend(v4, "type");
        if (HasHomeButton)
          v12 = 1000;
        else
          v12 = 1010;
        if (AXDeviceHasHomeButton())
          v13 = 1000;
        else
          v13 = 1011;
        v14 = objc_msgSend(v4, "type");
        v15 = v14;
        if (v11 != v12 && v14 != v13)
          goto LABEL_70;
        if (v11 == v12)
        {
          objc_msgSend((id)_HomeClickTimer, "cancel");
          v17 = (void *)_HomeClickTimer;
          _HomeClickTimer = 0;

        }
        v18 = &qword_255FC6A20;
        v19 = qword_255FC6A20;
        if (v15 == v13)
        {
          if (!qword_255FC6A20)
            goto LABEL_70;
          v18 = &_MergedGlobals;
          v19 = _MergedGlobals;
        }
        *v18 = v19 + 1;
        -[NSLock lock](self->_menuButtonLock, "lock");
        -[NSMutableArray addObject:](self->_menuButtonClientIds, "addObject:", v4);
        -[NSLock unlock](self->_menuButtonLock, "unlock");
        v20 = _MergedGlobals;
        if (_MergedGlobals != 2)
          goto LABEL_82;
        if ((_TripleHomeEnabled & 1) != 0 || _IsBuddyRunning)
        {
LABEL_85:
          LOBYTE(v5) = 1;
          if (_HomeClickTimer || v11 != v12)
            goto LABEL_71;
          v22 = objc_alloc_init(MEMORY[0x24BDFE490]);
          v23 = (void *)_HomeClickTimer;
          _HomeClickTimer = (uint64_t)v22;

          objc_initWeak(location, self);
          v24 = (void *)_HomeClickTimer;
          v25 = *(float *)&_HomeClickTimeout;
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __43__AXBHomeClickController_captureHomeClick___block_invoke_3;
          v26[3] = &unk_250187950;
          objc_copyWeak(&v27, location);
          objc_msgSend(v24, "afterDelay:processBlock:", v26, v25);
          objc_destroyWeak(&v27);
          objc_destroyWeak(location);
LABEL_91:
          LOBYTE(v5) = 1;
          goto LABEL_71;
        }
        if (AXSessionIsLoginSession())
        {
          v20 = _MergedGlobals;
LABEL_82:
          if (v20 == 3)
          {
            _MergedGlobals = 0;
            qword_255FC6A20 = 0;
            -[NSLock lock](self->_menuButtonLock, "lock");
            -[NSMutableArray removeAllObjects](self->_menuButtonClientIds, "removeAllObjects");
            -[NSLock unlock](self->_menuButtonLock, "unlock");
            LocalCenter = CFNotificationCenterGetLocalCenter();
            LOBYTE(v5) = 1;
            CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)*MEMORY[0x24BED2940], 0, 0, 1u);
            goto LABEL_71;
          }
          goto LABEL_85;
        }
LABEL_90:
        -[AXBHomeClickController _fireHomeButtons:](self, "_fireHomeButtons:", 0);
        goto LABEL_91;
      }
      v8 = 1;
    }
    _LockButtonDown = v8;
    goto LABEL_41;
  }
  objc_msgSend((id)_HomeClickTimer, "cancel");
  if (objc_msgSend(v4, "type") == 1001 && (_LockButtonDown & 1) == 0)
  {
    _MergedGlobals = 0;
    qword_255FC6A20 = 0;
    -[NSLock lock](self->_menuButtonLock, "lock");
    -[NSMutableArray removeAllObjects](self->_menuButtonClientIds, "removeAllObjects");
    -[NSLock unlock](self->_menuButtonLock, "unlock");
    LOBYTE(v5) = 1;
  }
  else
  {
    -[AXBHomeClickController _fireHomeButtons:](self, "_fireHomeButtons:", 0);
    LOBYTE(v5) = 0;
  }
  if (objc_msgSend(v4, "type") == 1011 || objc_msgSend(v4, "type") == 1104)
    _LockButtonDown = 0;
  -[AXBHomeClickController _toggleDisplayAskSheet](self, "_toggleDisplayAskSheet");
  location[1] = (id)MEMORY[0x24BDAC760];
  location[2] = (id)3221225472;
  location[3] = __43__AXBHomeClickController_captureHomeClick___block_invoke_2;
  location[4] = &unk_250187618;
  location[5] = self;
  AXPerformBlockOnMainThreadAfterDelay();
LABEL_71:

  return v5;
}

uint64_t __43__AXBHomeClickController_captureHomeClick___block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  captureHomeClick__RequiresReachability = result;
  return result;
}

uint64_t __43__AXBHomeClickController_captureHomeClick___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    LOBYTE(v2) = 1;
    _AXLogWithFacility();
    result = objc_msgSend(*(id *)(v1 + 32), "_didHideAlert", v2, CFSTR("ARGH! We didn't get a message back from SB that the alert should be dismissed"));
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 8) = 0;
  }
  return result;
}

void __43__AXBHomeClickController_captureHomeClick___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fireHomeButtons:", 1);

}

- (void)_updateBuddyVoiceOverStatus
{
  id v2;

  if (!_IsBuddyRunning && (AXSessionIsLoginSession() & 1) == 0)
  {
    v2 = (id)_AXSTripleClickCopyOptions();
    if (_AXSTripleClickContainsOption())
    {
      _AXSTripleClickRemoveOption();
      if (_AXSVoiceOverTouchEnabled())
      {
        _AXSTripleClickAddOption();
LABEL_10:

        return;
      }
    }
    else if (!_AXSCanDisableApplicationAccessibility()
           || !_AXSApplicationAccessibilityEnabled())
    {
      goto LABEL_10;
    }
    _AXSApplicationAccessibilitySetEnabled();
    goto LABEL_10;
  }
}

- (void)_appTransition
{
  int v3;
  int v4;
  int isBuddyRunning;
  int IsLoginSession;
  NSObject *v7;
  NSObject *v8;
  int IsMultiUser;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t buf[4];
  _BYTE v25[10];
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    _AXAssert();
  v3 = _IsBuddyRunning;
  v4 = _IsLoginUIRunning;
  isBuddyRunning = _isBuddyRunning();
  IsLoginSession = AXSessionIsLoginSession();
  if ((isBuddyRunning & 1) == 0
    && !-[AXBHomeClickController _purpleBuddySetupComplete](self, "_purpleBuddySetupComplete")
    && (IsLoginSession & 1) == 0)
  {
    AXPerformBlockOnMainThreadAfterDelay();
    return;
  }
  VOTLogLifeCycle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v25 = isBuddyRunning;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = IsLoginSession;
    v26 = 1024;
    v27 = 0;
    _os_log_impl(&dword_232455000, v7, OS_LOG_TYPE_DEFAULT, "Home click controller transition %d %d %d", buf, 0x14u);
  }

  _IsBuddyRunning = isBuddyRunning;
  _IsLoginUIRunning = IsLoginSession;
  -[AXBHomeClickController _updateBuddyVoiceOverStatus](self, "_updateBuddyVoiceOverStatus");
  if ((!v3 || !_IsBuddyRunning) && (!v4 || !_IsLoginUIRunning))
  {
    if (_IsBuddyRunning || AXSessionIsLoginSession())
    {
      _PreBuddyOptions = _AXSTripleClickCopyOptions();
      VOTLogLifeCycle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v25 = _PreBuddyOptions;
        _os_log_impl(&dword_232455000, v8, OS_LOG_TYPE_DEFAULT, "Prebuddy options: %@", buf, 0xCu);
      }

      IsMultiUser = AXDeviceIsMultiUser();
      if (_PreBuddyOptions
        && objc_msgSend((id)_PreBuddyOptions, "containsObject:", &unk_25018EE08)
        && ((objc_msgSend((id)_PreBuddyOptions, "containsObject:", &unk_25018EE20) ^ 1 | IsMultiUser) & 1) == 0
        && !-[AXBHomeClickController _voiceOverWasToggledSinceBoot](self, "_voiceOverWasToggledSinceBoot"))
      {
        _AXSVoiceOverTouchSetEnabled();
        if (_AXSCanDisableApplicationAccessibility())
          _AXSApplicationAccessibilitySetEnabled();
        objc_msgSend(MEMORY[0x24BDFE4E8], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "ignoreLogging");

        if ((v11 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFE4E8], "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v13 = objc_claimAutoreleasedReturnValue();

          v14 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v13, v14))
          {
            AXColorizeFormatLog();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            _AXStringForArgs();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, v14))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v25 = v16;
              _os_log_impl(&dword_232455000, v13, v14, "%{public}@", buf, 0xCu);
            }

          }
        }
      }
      v17 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayWithObject:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      _AXSSetTripleClickOptions();
      goto LABEL_30;
    }
    if ((!v3 || _IsBuddyRunning) && (!v4 || _IsLoginUIRunning))
    {
      if (_IsBuddyRunning || (AXSessionIsLoginSession() & 1) != 0)
        goto LABEL_30;
    }
    else if (_AXSVoiceOverTouchEnabled())
    {
      _AXSTripleClickRemoveOption();
      _AXSTripleClickAddOption();
    }
    else
    {
      if (_AXSCanDisableApplicationAccessibility())
        _AXSApplicationAccessibilitySetEnabled();
      _AXSSetTripleClickOptions();
      if (_PreBuddyOptions)
      {
        CFRelease((CFTypeRef)_PreBuddyOptions);
        _PreBuddyOptions = 0;
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobile.SubstantialTransition"), 0);
LABEL_30:
    if (!_IsBuddyRunning && (AXSessionIsLoginSession() & 1) == 0)
    {
      _AXSTripleClickRemoveOption();
      if (_AXSCanDisableApplicationAccessibility() || _AXSVoiceOverTouchEnabled())
        _AXSApplicationAccessibilitySetEnabled();
    }
    if (!v4 && _IsLoginUIRunning)
    {
      _AXSZoomTouchSetEnabled();
      _AXSVoiceOverTouchSetEnabled();
      v20 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "arrayWithObject:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      _AXSSetTripleClickOptions();
      if (_AXSCanDisableApplicationAccessibility())
        _AXSApplicationAccessibilitySetEnabled();
      -[AXBHomeClickController clearNoteToUserSession](self, "clearNoteToUserSession");

    }
  }
}

uint64_t __40__AXBHomeClickController__appTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_triggerAppTransition");
}

- (void)_triggerAppTransition
{
  _QWORD block[5];

  if (_triggerAppTransition_onceToken != -1)
    dispatch_once(&_triggerAppTransition_onceToken, &__block_literal_global_232);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__AXBHomeClickController__triggerAppTransition__block_invoke_2;
  block[3] = &unk_250187618;
  block[4] = self;
  dispatch_async((dispatch_queue_t)_triggerAppTransition_AppTransitionQueue, block);
}

void __47__AXBHomeClickController__triggerAppTransition__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("AXAppAccessQueue", 0);
  v1 = (void *)_triggerAppTransition_AppTransitionQueue;
  _triggerAppTransition_AppTransitionQueue = (uint64_t)v0;

}

uint64_t __47__AXBHomeClickController__triggerAppTransition__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appTransition");
}

- (BOOL)_captureKeyboardCommands:(id *)a3
{
  return 0;
}

- (BOOL)_checkIfZoomWasActivated:(id)a3 stealEvent:(BOOL *)a4
{
  id v6;
  double Current;
  void *v8;
  unsigned int v9;

  v6 = a3;
  if (!_AXSZoomTouchEnabled() && !_AXSVoiceOverTouchEnabled())
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v6, "handInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "eventType");
    if (v9 <= 0xA && ((1 << v9) & 0x640) != 0)
    {
      if ((v9 & 0xFFFFFFFB) != 1)
      {
        if (objc_msgSend(v8, "currentFingerCount")
          || _checkIfZoomWasActivated_stealEvent__FingerCount < 1)
        {
          goto LABEL_33;
        }
        if (*(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo == 0.0
          || Current - *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo >= 0.2)
        {
          if (*(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne == 0.0
            || Current - *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne >= 0.2)
          {
            _checkIfZoomWasActivated_stealEvent__TapCount = 0;
            _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = 0;
            _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = 0;
            goto LABEL_32;
          }
          if ((_checkIfZoomWasActivated_stealEvent__TapCount & 1) != 0)
          {
LABEL_32:
            _checkIfZoomWasActivated_stealEvent__FingerCount = 0;
LABEL_33:

            goto LABEL_34;
          }
          _checkIfZoomWasActivated_stealEvent__TapCount = 1;
        }
        else
        {
          if (_checkIfZoomWasActivated_stealEvent__TapCount == 1
            && *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo
             - *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne < 0.65)
          {
            -[AXBHomeClickController _handleZoomActivationDuringBuddy](self, "_handleZoomActivationDuringBuddy", *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo- *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne);
          }
          _checkIfZoomWasActivated_stealEvent__TapCount = 0;
          _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = 0;
          _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = 0;
        }
        *a4 = 1;
        BKSHIDServicesCancelTouchesOnMainDisplay();
        goto LABEL_32;
      }
    }
    else if ((v9 & 0xFFFFFFFB) != 1)
    {
      if (objc_msgSend(v8, "eventType") == 8 && _checkIfZoomWasActivated_stealEvent__FingerCount >= 1)
      {
        _checkIfZoomWasActivated_stealEvent__TapCount = 0;
        _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = 0;
        _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = 0;
      }
      goto LABEL_33;
    }
    if (objc_msgSend(v8, "currentFingerCount") == 3)
    {
      if (_checkIfZoomWasActivated_stealEvent__TapCount == 1
        && Current - *(double *)&_checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne <= 0.5)
      {
        _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = *(_QWORD *)&Current;
      }
      else
      {
        _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = *(_QWORD *)&Current;
      }
    }
    else if (objc_msgSend(v8, "currentFingerCount") >= 4)
    {
      _checkIfZoomWasActivated_stealEvent__TapCount = 0;
      _checkIfZoomWasActivated_stealEvent__ThreeDownTimeTwo = 0;
      _checkIfZoomWasActivated_stealEvent__ThreeDownTimeOne = 0;
    }
    _checkIfZoomWasActivated_stealEvent__FingerCount = objc_msgSend(v8, "currentFingerCount");
    goto LABEL_33;
  }
LABEL_34:

  return 0;
}

- (BOOL)_accessibilityIsFactoryDiskImagePresent
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)MobileStorageCopyDevices();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *MEMORY[0x24BE67698];
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", v5, (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("/private/var/personalized_factory"));

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_handleZoomActivationDuringBuddy
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __58__AXBHomeClickController__handleZoomActivationDuringBuddy__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_accessibilityIsFactoryDiskImagePresent"))
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "User activated Zoom gesture during setup, but FDI present so Zoom gesture will be suppressed", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __58__AXBHomeClickController__handleZoomActivationDuringBuddy__block_invoke_236;
    v4[3] = &unk_2501882E0;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "showAlert:withHandler:", 1, v4);

  }
}

uint64_t __58__AXBHomeClickController__handleZoomActivationDuringBuddy__block_invoke_236(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleZoomInBuddyAlertResult:", a2);
}

- (id)_eventTapIdentifier
{
  return self->_eventTapIdentifier;
}

- (void)_fireHomeButtons:(BOOL)a3
{
  _BOOL4 v4;
  NSMutableArray **p_menuButtonClientIds;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = _MergedGlobals == 1 && a3;
  -[NSLock lock](self->_menuButtonLock, "lock", a3);
  p_menuButtonClientIds = &self->_menuButtonClientIds;
  v6 = -[NSMutableArray count](self->_menuButtonClientIds, "count");
  v7 = _MergedGlobals;
  v8 = qword_255FC6A20;
  if (v6 == qword_255FC6A20 + _MergedGlobals)
  {
    if (_MergedGlobals >= 1)
    {
      v9 = 0;
      do
      {
        if (-[NSMutableArray count](*p_menuButtonClientIds, "count") <= v9)
        {
          v10 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndex:](*p_menuButtonClientIds, "objectAtIndex:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (-[NSMutableArray count](*p_menuButtonClientIds, "count") <= ++v9)
        {
          v11 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndex:](*p_menuButtonClientIds, "objectAtIndex:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        _postHomeButtonPress(0, v4, v10);
        _postHomeButtonPress(1, v4, v11);

        v7 = _MergedGlobals;
      }
      while (_MergedGlobals > (uint64_t)v9);
      v8 = qword_255FC6A20;
    }
    if (v7 < v8)
    {
      if (v8 - 1 >= (unint64_t)-[NSMutableArray count](*p_menuButtonClientIds, "count"))
      {
        v12 = 0;
      }
      else
      {
        -[NSMutableArray objectAtIndex:](*p_menuButtonClientIds, "objectAtIndex:", qword_255FC6A20 - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      _postHomeButtonPress(0, v4, v12);

    }
    -[NSMutableArray removeAllObjects](self->_menuButtonClientIds, "removeAllObjects");
    -[NSLock unlock](self->_menuButtonLock, "unlock");
    _MergedGlobals = 0;
    qword_255FC6A20 = 0;
  }
  else
  {
    AXLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AXBHomeClickController _fireHomeButtons:].cold.1((uint64_t *)&self->_menuButtonClientIds, v13);

    -[NSLock unlock](self->_menuButtonLock, "unlock");
  }
}

- (void)_handleZoomInBuddyAlertResult:(int64_t)a3
{
  if (!a3)
  {
    _AXSZoomTouchSetEnabled();
    _AXSAccessibilitySetiTunesPreference();
  }
}

- (void)_springBoardDied:(id)a3
{
  id v4;

  -[AXBHomeClickController _didHideAlert](self, "_didHideAlert", a3);
  self->_isAlertVisible = 0;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanupAlertHandler");

}

- (BOOL)_sideButtonEnabled
{
  return 0;
}

- (void)_updateEventTapSettings
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  NSString *eventTapIdentifier;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  AXLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _HomeClickEnabled);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _TripleHomeEnabled);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXBHomeClickController _sideButtonEnabled](self, "_sideButtonEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_232455000, v3, OS_LOG_TYPE_DEFAULT, "Home click controller enabling tap: Home click: %@, triple click %@, side button: %@", (uint8_t *)&v14, 0x20u);

  }
  if (_HomeClickEnabled
    || (_TripleHomeEnabled & 1) != 0
    || -[AXBHomeClickController _sideButtonEnabled](self, "_sideButtonEnabled"))
  {
    if (self->_eventTapIdentifier)
      return;
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_232455000, v7, OS_LOG_TYPE_DEFAULT, "Installing home click event tap", (uint8_t *)&v14, 2u);
    }

    objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "installEventTap:identifier:type:", &__block_literal_global_241, CFSTR("HomeClick"), 0);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    eventTapIdentifier = self->_eventTapIdentifier;
    self->_eventTapIdentifier = v9;

    objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEventTapPriority:priority:", self->_eventTapIdentifier, 70);
    goto LABEL_10;
  }
  if (self->_eventTapIdentifier)
  {
    AXLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_232455000, v12, OS_LOG_TYPE_DEFAULT, "Removing home click event tap", (uint8_t *)&v14, 2u);
    }

    objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeEventTap:", self->_eventTapIdentifier);

    v11 = self->_eventTapIdentifier;
    self->_eventTapIdentifier = 0;
LABEL_10:

  }
}

uint64_t __49__AXBHomeClickController__updateEventTapSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 3001 || AXInCheckerBoardScenario())
    v3 = objc_msgSend((id)_Controller, "captureHomeClick:", v2);
  else
    v3 = 0;

  return v3;
}

+ (id)controller
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_Controller;
  if (!_Controller)
  {
    v3 = objc_msgSend(objc_allocWithZone((Class)AXBHomeClickController), "init");
    v4 = (void *)_Controller;
    _Controller = v3;

    objc_msgSend((id)_Controller, "_updateTripleHomeSettings:", 1);
    objc_msgSend((id)_Controller, "_updateHomeClickEnabled");
    objc_msgSend((id)_Controller, "_updateHomeClickSpeed");
    objc_msgSend((id)_Controller, "initialize");
    v2 = (void *)_Controller;
  }
  return v2;
}

- (void)initialize
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFString *v7;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v9;
  __CFNotificationCenter *v10;
  __CFNotificationCenter *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *menuButtonClientIds;
  NSLock *v15;
  NSLock *menuButtonLock;
  __CFNotificationCenter *v17;
  __CFNotificationCenter *v18;
  __CFNotificationCenter *v19;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_accessibilityTripleHomeStatusChange, (CFStringRef)*MEMORY[0x24BED2938], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)_accessibilityTripleHomeStatusChange, (CFStringRef)*MEMORY[0x24BED2970], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, 0, (CFNotificationCallback)_accessibilityTripleHomeStatusChange, (CFStringRef)*MEMORY[0x24BED29C0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE3D640]);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)_accessibilityTripleHomeStatusChange, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_accessibilityTripleHomeFired, (CFStringRef)*MEMORY[0x24BED2940], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, 0, (CFNotificationCallback)_accessibilityHomeClickEnabled, (CFStringRef)*MEMORY[0x24BED27C0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v10, 0, (CFNotificationCallback)_accessibilityHomeClickSpeedChanged, (CFStringRef)*MEMORY[0x24BED27C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (!-[AXBHomeClickController _purpleBuddySetupComplete](self, "_purpleBuddySetupComplete"))
  {
    -[AXBHomeClickController _triggerAppTransition](self, "_triggerAppTransition");
    v11 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v11, self, (CFNotificationCallback)_appTransitionOccurred, CFSTR("com.apple.mobile.SubstantialTransition"), 0, (CFNotificationSuspensionBehavior)1028);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__springBoardDied_, *MEMORY[0x24BE00408], 0);

  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  menuButtonClientIds = self->_menuButtonClientIds;
  self->_menuButtonClientIds = v13;

  v15 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  menuButtonLock = self->_menuButtonLock;
  self->_menuButtonLock = v15;

  _handleInPreBoardModeUpdate();
  v17 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v17, 0, (CFNotificationCallback)_handleInPreBoardModeUpdate, (CFStringRef)*MEMORY[0x24BE00158], 0, CFNotificationSuspensionBehaviorCoalesce);
  _handleInCheckerBoardModeUpdate();
  v18 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v18, 0, (CFNotificationCallback)_handleInCheckerBoardModeUpdate, (CFStringRef)*MEMORY[0x24BE00150], 0, CFNotificationSuspensionBehaviorCoalesce);
  if (AXSessionIsLoginSession())
  {
    -[AXBHomeClickController clearNoteToUserSession](self, "clearNoteToUserSession");
    -[AXBHomeClickController _triggerAppTransition](self, "_triggerAppTransition");
  }
  v19 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v19, 0, (CFNotificationCallback)_handleSessionIsLoginSessionUpdate, (CFStringRef)*MEMORY[0x24BE00388], 0, CFNotificationSuspensionBehaviorCoalesce);
}

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_7 != -1)
    dispatch_once(&initializeMonitor_onceToken_7, &__block_literal_global_249_0);
}

void __43__AXBHomeClickController_initializeMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AXBHomeClickController controller](AXBHomeClickController, "controller");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initializeMonitor__SharedHomeClickController;
  initializeMonitor__SharedHomeClickController = v0;

}

- (BOOL)isHearingAidControlVisible
{
  return self->isHearingAidControlVisible;
}

- (void)setIsHearingAidControlVisible:(BOOL)a3
{
  self->isHearingAidControlVisible = a3;
}

- (BOOL)didShowHoldDurationTripleClickHelp
{
  return self->_didShowHoldDurationTripleClickHelp;
}

- (void)setDidShowHoldDurationTripleClickHelp:(BOOL)a3
{
  self->_didShowHoldDurationTripleClickHelp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayFilterUIClient, 0);
  objc_storeStrong((id *)&self->_writeLoginNoteTimer, 0);
  objc_storeStrong((id *)&self->_menuButtonLock, 0);
  objc_storeStrong((id *)&self->_menuButtonClientIds, 0);
  objc_storeStrong((id *)&self->_eventTapIdentifier, 0);
}

- (void)_fireHomeButtons:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412802;
  v4 = v2;
  v5 = 1024;
  v6 = _MergedGlobals;
  v7 = 1024;
  v8 = qword_255FC6A20;
  _os_log_error_impl(&dword_232455000, a2, OS_LOG_TYPE_ERROR, "Our menu button ids are messed up: %@ != %d + %d", (uint8_t *)&v3, 0x18u);
}

@end
