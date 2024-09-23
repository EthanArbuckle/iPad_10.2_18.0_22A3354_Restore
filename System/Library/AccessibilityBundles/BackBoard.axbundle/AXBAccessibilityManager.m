@implementation AXBAccessibilityManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_SharedManager;
}

- (BOOL)accelerometerDisabled
{
  return self->_accelerometerDisabled;
}

+ (void)updateAccessibilitySettings
{
  int v2;
  void *v3;
  id v4;

  v2 = _AXSApplicationAccessibilityEnabled();
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "initializeAccessibility");
  else
    objc_msgSend(v3, "disableAccessibility");

}

+ (void)initializeAccessibilityMonitor
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v8;
  _QWORD v9[5];

  objc_msgSend(a1, "updateAccessibilitySettings");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BED26E0];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__AXBAccessibilityManager_initializeAccessibilityMonitor__block_invoke;
  v9[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v9[4] = a1;
  v6 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, v9);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v8 = (const void *)objc_opt_class();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)updateGizmoAccessibilitySettings, CFSTR("NanoAccessibilityDefaultsChanged"), 0, (CFNotificationSuspensionBehavior)0);
}

uint64_t __57__AXBAccessibilityManager_initializeAccessibilityMonitor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAccessibilitySettings");
}

void __40__AXBAccessibilityManager_sharedManager__block_invoke()
{
  AXBAccessibilityManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBAccessibilityManager);
  v1 = (void *)sharedManager_SharedManager;
  sharedManager_SharedManager = (uint64_t)v0;

}

- (AXBAccessibilityManager)init
{
  AXBAccessibilityManager *v2;
  void *v3;
  void *v4;
  AXBAccessibilityManager *v5;
  AXBAccessibilityManager *v6;
  _QWORD v8[4];
  AXBAccessibilityManager *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXBAccessibilityManager;
  v2 = -[AXBAccessibilityManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_resetAssistiveTouchHitPort, *MEMORY[0x24BED26F0], 0);

    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __31__AXBAccessibilityManager_init__block_invoke;
    v8[3] = &unk_250187618;
    v5 = v2;
    v9 = v5;
    objc_msgSend(v4, "registerUpdateBlock:forRetrieveSelector:withListener:", v8, sel_voiceOverIgnoreTrackpad, v5);

    -[AXBAccessibilityManager _updateVoiceOverIgnoresTrackpad](v5, "_updateVoiceOverIgnoresTrackpad");
    v6 = v5;
  }

  return v2;
}

uint64_t __31__AXBAccessibilityManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVoiceOverIgnoresTrackpad");
}

- (void)_updateVoiceOverIgnoresTrackpad
{
  id v3;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_voiceOverIgnoresTrackpad = objc_msgSend(v3, "voiceOverIgnoreTrackpad");

}

- (id)_axElementForUID:(id)a3
{
  return (id)_AXElementForAXUIElementUniqueId();
}

- (void)initializeAccessibility
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke;
  block[3] = &unk_250187618;
  block[4] = self;
  if (initializeAccessibility_onceToken != -1)
    dispatch_once(&initializeAccessibility_onceToken, block);
}

void __50__AXBAccessibilityManager_initializeAccessibility__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t, double, double);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  _AXBValidateMethods();
  objc_msgSend(MEMORY[0x24BDFEA88], "sharedManager");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSystemWideServer:", 1);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_2;
  v21[3] = &unk_250187640;
  objc_copyWeak(&v22, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAttributeCallback:", v21);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_3;
  v19[3] = &unk_250187668;
  objc_copyWeak(&v20, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setParameterizedAttributeCallback:", v19);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_4;
  v17[3] = &unk_250187690;
  objc_copyWeak(&v18, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSetAttributeCallback:", v17);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_5;
  v15[3] = &unk_2501876B8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPerformActionCallback:", v15);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_6;
  v13[3] = &unk_2501876E0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setClientObserverCallback:", v13);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_7;
  v11[3] = &unk_250187708;
  objc_copyWeak(&v12, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setApplicationElementCallback:", v11);
  v6 = v5;
  v7 = 3221225472;
  v8 = __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_8;
  v9 = &unk_250187730;
  objc_copyWeak(&v10, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setHitTestCallback:", &v6);
  _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "start", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

id __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;

  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axElementForUID:", a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained(v7);
  objc_msgSend(v10, "_iosAccessibilityAttributeValue:element:", a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;

  v6 = (id *)(a1 + 32);
  v7 = a5;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_iosAccessibilityAttributeValue:forParameter:", a4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a5;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_iosAccessibilitySetValue:forAttribute:", v7, a4);

}

uint64_t __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id *v8;
  id v9;
  id WeakRetained;
  uint64_t v11;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  WeakRetained = objc_loadWeakRetained(v8);
  v11 = objc_msgSend(WeakRetained, "_iosAccessibilityPerformAction:withValue:fencePort:", a4, v9, a6);

  return v11;
}

void __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "observerClientDied");

}

id __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_7(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 32));
}

id __50__AXBAccessibilityManager_initializeAccessibility__block_invoke_8(uint64_t a1, double a2, double a3)
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityHitTest:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_showingBootUI
{
  void *v2;
  char v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BKBootUIPresenter")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isShowingBootUI"));

  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AXBAccessibilityManager _showingBootUI](self, "_showingBootUI", a3.x, a3.y))
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BKBootUIPresenter")), "safeValueForKey:", CFSTR("sharedInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_overlay"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("BKDisplayRenderOverlayAppleLogo"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "safeValueForKey:", CFSTR("_puiProgressWindow"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)resetAccessibilityUIHitPort
{
  AccessibilityUITouchPort = 0;
}

- (void)resetAssistiveTouchHitPort
{
  AssistiveTouchPort = 0;
}

- (void)observerClientDied
{
  double v2;
  void *v4;

  LODWORD(v2) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBAccessibilityManager _iosAccessibilitySetValue:forAttribute:](self, "_iosAccessibilitySetValue:forAttribute:", v4, 1003);

  -[AXBAccessibilityManager setAccelerometerDisabled:](self, "setAccelerometerDisabled:", 0);
  if ((_SBAXCaptureMode & 1) != 0 && !_AXSVoiceOverTouchEnabled())
  {
    unsetCaptureMode(1);
    -[AXBAccessibilityManager _setDeviceOrientationCapability:](self, "_setDeviceOrientationCapability:", 1);
  }
  if ((_SBAXCaptureMode & 2) != 0 && !_AXSAssistiveTouchEnabled())
    unsetCaptureMode(2);
  if ((_SBAXCaptureMode & 8) != 0 && !_AXSGuidedAccessEnabled())
    unsetCaptureMode(8);
  if ((_SBAXCaptureMode & 0x10) != 0)
    unsetCaptureMode(16);
}

- (void)_setDeviceOrientationCapability:(BOOL)a3
{
  _SBAXDeviceOrientationCapabilityEnabled = a3;
}

- (void)_accessibilityRepostEvent:(id)a3
{
  if (a3)
    AXBSendEventRepresentationUntapped(a3);
}

- (int)_accessibilityApplicationForContextId:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "taskNamePortOfContextId:", v3);

  if (!(_DWORD)v6)
    return 0;
  +[AXBackBoardGlue hidClientConnectionManager](AXBackBoardGlue, "hidClientConnectionManager");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  if (!v11[3]
    || (v8 = objc_msgSend((id)IOHIDEventSystemConnectionGetAttribute(), "intValue"),
        CFRelease((CFTypeRef)v11[3]),
        v8 <= 0))
  {
    v8 = -[AXBAccessibilityManager _handlePidForSpecialCases:](self, "_handlePidForSpecialCases:", v6);
  }

  _Block_object_dispose(&v10, 8);
  return v8;
}

uint64_t __65__AXBAccessibilityManager__accessibilityApplicationForContextId___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "copyClientForTaskPort:", *(unsigned int *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_handlePidForSpecialCases:(unsigned int)a3
{
  int v5;
  int result;
  int v7;
  void *v8;
  int v9;

  if (!_AXSAssistiveTouchEnabled())
    goto LABEL_9;
  v5 = AssistiveTouchPort;
  if (!AssistiveTouchPort)
  {
    bootstrap_look_up(*MEMORY[0x24BDAD2F0], "com.apple.assistivetouchd", (mach_port_t *)&AssistiveTouchPort);
    v5 = AssistiveTouchPort;
  }
  if (v5 != a3
    || (result = +[AXBackBoardGlue assistiveTouchPid](AXBackBoardGlue, "assistiveTouchPid")) == 0)
  {
    if (!+[AXBackBoardGlue accessibilityUIServerPid](AXBackBoardGlue, "accessibilityUIServerPid"))
      goto LABEL_11;
LABEL_9:
    v7 = AccessibilityUITouchPort;
    if (!AccessibilityUITouchPort)
    {
      bootstrap_look_up(*MEMORY[0x24BDAD2F0], "com.apple.accessibility.AccessibilityUIServer.gsEvents", (mach_port_t *)&AccessibilityUITouchPort);
      v7 = AccessibilityUITouchPort;
    }
    if (v7 == a3)
    {
      return +[AXBackBoardGlue accessibilityUIServerPid](AXBackBoardGlue, "accessibilityUIServerPid");
    }
    else
    {
LABEL_11:
      if (-[AXBAccessibilityManager _showingBootUI](self, "_showingBootUI"))
      {
        return 0;
      }
      else
      {
        -[AXBAccessibilityManager _accessibilitySystemAppApplicationPid](self, "_accessibilitySystemAppApplicationPid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "intValue");

        return v9;
      }
    }
  }
  return result;
}

- (BOOL)_accessibilityIsInternalInstall
{
  if (_accessibilityIsInternalInstall_onceToken != -1)
    dispatch_once(&_accessibilityIsInternalInstall_onceToken, &__block_literal_global_229);
  return _accessibilityIsInternalInstall_IsInternal;
}

uint64_t __58__AXBAccessibilityManager__accessibilityIsInternalInstall__block_invoke()
{
  uint64_t result;

  result = AXIsInternalInstall();
  _accessibilityIsInternalInstall_IsInternal = result;
  return result;
}

- (id)allJobLabels
{
  _launch_data *v2;
  _launch_data *v3;
  void *v4;

  v2 = (_launch_data *)MEMORY[0x2349083B0]("GetJobs", a2);
  v3 = launch_msg(v2);
  MEMORY[0x234908398](v2);
  if (v3)
  {
    if (launch_data_get_type(v3) == LAUNCH_DATA_DICTIONARY)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      launch_data_dict_iterate(v3, (launch_data_dict_iterator_t)copyKeysToArray, v4);
    }
    else
    {
      v4 = 0;
    }
    MEMORY[0x234908398](v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_accessibilitySystemApp
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BKSystemShellSentinel")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("systemApplications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_237);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    if (objc_msgSend(v4, "count"))
      goto LABEL_9;
    AXLogSystemApp();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXBAccessibilityManager _accessibilitySystemApp].cold.1(v6);

    v7 = (void *)MEMORY[0x24BDBCE30];
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BKSystemShellSentinel")), "safeValueForKey:", CFSTR("sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject safeValueForKey:](v5, "safeValueForKey:", CFSTR("primarySystemShell"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axArrayByIgnoringNilElementsWithCount:", 1, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  else
  {
    AXLogSystemApp();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, "Found more than one non-CarPlay system app, returning first object: %@", buf, 0xCu);
    }
  }

LABEL_9:
  objc_msgSend(v4, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogSystemApp();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl(&dword_232455000, v11, OS_LOG_TYPE_INFO, "Determined system app: %@", buf, 0xCu);
  }

  return v10;
}

uint64_t __50__AXBAccessibilityManager__accessibilitySystemApp__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDFE3D8]) ^ 1;

  return v3;
}

- (id)_accessibilityCarPlayApp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BKSystemShellSentinel")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("systemApplications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_243);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __51__AXBAccessibilityManager__accessibilityCarPlayApp__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDFE3D8]);

  return v3;
}

- (id)_accessibilitySystemAppApplicationBundleId
{
  void *v2;
  void *v3;

  -[AXBAccessibilityManager _accessibilitySystemApp](self, "_accessibilitySystemApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityCarPlayApplicationPid
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[AXBAccessibilityManager _accessibilityCarPlayApp](self, "_accessibilityCarPlayApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("pid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  if ((int)v4 < 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_accessibilitySystemAppApplicationPid
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  -[AXBAccessibilityManager _accessibilitySystemApp](self, "_accessibilitySystemApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("pid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  if ((int)v4 <= 0)
  {
    AXLogSystemApp();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXBAccessibilityManager _accessibilitySystemAppApplicationPid].cold.1((uint64_t)v2, v4, v6);

    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_accessibilityUIServerApplication
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[AXBackBoardGlue accessibilityUIServerPid](AXBackBoardGlue, "accessibilityUIServerPid"));
}

- (id)_accessibilityAssistiveTouchApplication
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[AXBackBoardGlue assistiveTouchPid](AXBackBoardGlue, "assistiveTouchPid"));
}

- (id)_accessibilityLiveCaptionsApplication
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[AXBackBoardGlue liveCaptionsPid](AXBackBoardGlue, "liveCaptionsPid"));
}

- (id)_accessibilityInputUIApplication
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[AXBackBoardGlue inputUIPid](AXBackBoardGlue, "inputUIPid"));
}

- (id)_deliveryManager
{
  void *v2;
  void *v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BKHIDSystemInterface")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("deliveryManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityNativeFocusedApplication
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (_AXSAutomationEnabled() || AXRequestingClient() == 11)
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "nativeFocusedApplication"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AXBAccessibilityManager _deliveryManager](self, "_deliveryManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (_accessibilityNativeFocusedApplication_onceToken != -1)
      dispatch_once(&_accessibilityNativeFocusedApplication_onceToken, &__block_literal_global_249);
    v8 = (void *)objc_opt_new();
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    v12 = v7;
    v13 = v8;
    AXPerformSafeBlock();
    v9 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "safeUnsignedIntForKey:", CFSTR("pid"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __65__AXBAccessibilityManager__accessibilityNativeFocusedApplication__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BE00630], "keyRepresentationWithType:", 10);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setKeyCode:", 4);

  _accessibilityNativeFocusedApplication_DummyKeyboardEventRef = objc_msgSend(v1, "newHIDEventRef");
}

void __65__AXBAccessibilityManager__accessibilityNativeFocusedApplication__block_invoke_252(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "destinationsForEvent:sender:", _accessibilityNativeFocusedApplication_DummyKeyboardEventRef, *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilitySpringBoardApplication
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!_AXSClarityBoardEnabled())
  {
    +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "systemAppPid");

    if ((int)v4 > 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
    NSLog(CFSTR("ACCESSIBILITY: SB has not checked in. No SB Pid!"));
  }
  v2 = 0;
  return v2;
}

- (void)_iosAccessibilitySetValue:(id)a3 forAttribute:(int64_t)a4
{
  id v6;
  float v7;
  id v8;
  id v9;

  v6 = a3;
  switch(a4)
  {
    case 1002:
      v8 = v6;
      if (objc_msgSend(v6, "BOOLValue"))
        setCaptureMode(32);
      else
        unsetCaptureMode(32);
      goto LABEL_9;
    case 1003:
      v9 = v6;
      objc_msgSend(v6, "floatValue");
      v6 = v9;
      *(double *)&_SBAXPassiveListenDelay = v7;
      break;
    case 1004:
      v8 = v6;
      -[AXBAccessibilityManager setAccelerometerDisabled:](self, "setAccelerometerDisabled:", objc_msgSend(v6, "BOOLValue"));
LABEL_9:
      v6 = v8;
      break;
  }

}

- (void)_sendEventRep:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (_sendEventRep__registerOnce != -1)
    dispatch_once(&_sendEventRep__registerOnce, &__block_literal_global_256);
  v4 = _sendEventRep__DifferentQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__AXBAccessibilityManager__sendEventRep___block_invoke_2;
  block[3] = &unk_250187618;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __41__AXBAccessibilityManager__sendEventRep___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("ax-send-event-queue", 0);
  v1 = (void *)_sendEventRep__DifferentQueue;
  _sendEventRep__DifferentQueue = (uint64_t)v0;

}

void __41__AXBAccessibilityManager__sendEventRep___block_invoke_2(uint64_t a1)
{
  AXBSendEventRepresentationUntapped(*(void **)(a1 + 32));
}

- (id)_commonEventRepForTouchEventWithType:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 flags:(unsigned int)a6 contextId:(unsigned int)a7
{
  uint64_t v7;
  double y;
  double x;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;

  v7 = *(_QWORD *)&a7;
  y = a4.y;
  x = a4.x;
  v12 = *(_QWORD *)&a3;
  if (!a7)
  {
    +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v14, "contextIdForPosition:displayId:", 0, x, y);

  }
  objc_msgSend(MEMORY[0x24BE00630], "touchRepresentationWithHandType:location:", v12, x, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "paths");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPathWindowContextID:", v7);

  objc_msgSend(v15, "setPid:", -[AXBAccessibilityManager _accessibilityApplicationForContextId:](self, "_accessibilityApplicationForContextId:", v7));
  -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v7, 0, x, y);
  v20 = v19;
  v22 = v21;
  objc_msgSend(v15, "handInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "paths");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPathLocation:", v20, v22);

  objc_msgSend(v15, "handInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "paths");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTransducerType:", 2);

  objc_msgSend(v15, "setContextId:", v7);
  objc_msgSend(v15, "setAdditionalFlags:", objc_msgSend(v15, "additionalFlags") | a6);
  objc_msgSend(v15, "handInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "paths");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstPath");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = a5;
  *(float *)&v33 = v29;
  objc_msgSend(v32, "setOrbValue:", v33);

  return v15;
}

- (void)_sendFingerEvent:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 flags:(unsigned int)a6 contextId:(unsigned int)a7
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[AXBAccessibilityManager _commonEventRepForTouchEventWithType:location:force:flags:contextId:](self, "_commonEventRepForTouchEventWithType:location:force:flags:contextId:", *(_QWORD *)&a3, *(_QWORD *)&a6, *(_QWORD *)&a7, a4.x, a4.y, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTransducerType:", 3);

  -[AXBAccessibilityManager _sendEventRep:](self, "_sendEventRep:", v11);
}

- (void)_sendStylusEvent:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 altitude:(double)a6 azimuth:(double)a7 flags:(unsigned int)a8 contextId:(unsigned int)a9
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;

  -[AXBAccessibilityManager _commonEventRepForTouchEventWithType:location:force:flags:contextId:](self, "_commonEventRepForTouchEventWithType:location:force:flags:contextId:", *(_QWORD *)&a3, *(_QWORD *)&a8, *(_QWORD *)&a9, a4.x, a4.y, a5);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTransducerType:", 0);

  objc_msgSend(v23, "handInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "paths");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a6 = a6;
  LODWORD(v18) = LODWORD(a6);
  objc_msgSend(v17, "setAltitude:", v18);

  objc_msgSend(v23, "handInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "paths");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a7 = a7;
  LODWORD(v22) = LODWORD(a7);
  objc_msgSend(v21, "setAzimuth:", v22);

  -[AXBAccessibilityManager _sendEventRep:](self, "_sendEventRep:", v23);
}

- (CGRect)accessibilityConvertHostedViewFrame:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  double MaxX;
  double MaxY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    v9 = *(_QWORD *)&a5;
    v10 = *(_QWORD *)&a4;
    MaxX = CGRectGetMaxX(a3);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MaxY = CGRectGetMaxY(v22);
    v13 = AXConvertFromContextHostedPoint(v10, v9, x, y);
    v15 = v14;
    v16 = AXConvertFromContextHostedPoint(v10, v9, MaxX, MaxY);
    if (v16 >= v13)
      x = v13;
    else
      x = v16;
    if (v16 < v13)
      v16 = v13;
    if (v17 >= v15)
      y = v15;
    else
      y = v17;
    if (v17 < v15)
      v17 = v15;
    width = v16 - x;
    height = v17 - y;
  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGPoint)_accessibilityConvertHostedViewPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  double v5;
  double v6;
  CGPoint result;

  if (a4)
    v5 = AXConvertFromContextHostedPoint(*(uint64_t *)&a4, *(uint64_t *)&a5, a3.x, a3.y);
  else
    -[AXBAccessibilityManager _accessibilityViewPointFromHostedViewContext:displayId:](self, "_accessibilityViewPointFromHostedViewContext:displayId:", *(_QWORD *)&a5, a3.x, a3.y);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)_accessibilityViewPointFromHostedViewContext:(CGPoint)a3 displayId:(unsigned int)a4
{
  uint64_t v4;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  CGPoint result;

  v4 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  v7 = AXRotateToScreen();
  v9 = v8;
  +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "contextIdAtPosition:", v7, v9);

  v13 = AXConvertFromContextHostedPoint(v12, v4, x, y);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)accessibilityConvertHostedViewFrame:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxY = CGRectGetMaxY(v26);
  -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v6, v5, MinX, MinY);
  v17 = v16;
  v19 = v18;
  -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v6, v5, MaxX, MaxY);
  v22 = vabdd_f64(v20, v17);
  v23 = vabdd_f64(v21, v19);
  if (v20 >= v17)
    v20 = v17;
  if (v21 >= v19)
    v21 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGPoint)accessibilityConvertHostedViewPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGPoint result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  if (!a4)
  {
    +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v10, "contextIdAtPosition:", x, y);
  }
  v11 = AXConvertFromContextHostedPoint(v6, v5, x, y);
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)accessibilityConvertHostedViewPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  if (!a4)
  {
    +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v10, "contextIdAtPosition:", x, y);
  }
  +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:toContextId:displayId:", v6, v5, x, y);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)_sendPressFingerEvent:(BOOL)a3 location:(CGPoint)a4 force:(double)a5 flags:(unsigned int)a6 contextId:(unsigned int)a7 secureName:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  double y;
  double x;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  id v28;

  LODWORD(v8) = a8;
  v9 = *(_QWORD *)&a7;
  y = a4.y;
  x = a4.x;
  v14 = a3;
  if (!a7)
  {
    +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v15, "contextIdForPosition:displayId:", 0, x, y);

  }
  if (v14)
    v16 = 1;
  else
    v16 = 6;
  if (v14)
    v8 = 0;
  else
    v8 = v8;
  objc_msgSend(MEMORY[0x24BE00630], "touchRepresentationWithHandType:location:", v16, x, y);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSenderID:", 0x8000000817319380);
  objc_msgSend(v28, "handInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "paths");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPathWindowContextID:", v9);

  objc_msgSend(v28, "handInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "paths");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTransducerType:", 2);

  objc_msgSend(v28, "setAdditionalFlags:", objc_msgSend(v28, "additionalFlags") | a6);
  objc_msgSend(v28, "setContextId:", v9);
  objc_msgSend(v28, "handInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "paths");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a5;
  *(float *)&v27 = v23;
  objc_msgSend(v26, "setOrbValue:", v27);

  objc_msgSend(v28, "setSecureName:", v8);
  if ((objc_msgSend(v28, "additionalFlags") & 0x1000000) != 0)
    AXBSendEventRepresentationUntapped(v28);

}

- (void)simulatePressAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4 withDelay:(float)a5 withForce:(double)a6 withSecureName:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v9;
  double y;
  double x;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  -[AXBAccessibilityManager _sendPressFingerEvent:location:force:flags:contextId:secureName:](self, "_sendPressFingerEvent:location:force:flags:contextId:secureName:", 1, 0x1000000, *(_QWORD *)&a4, *(_QWORD *)&a7, a3.x, a3.y, a6);
  if (a5 > 0.0)
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", a5);
  -[AXBAccessibilityManager _sendPressFingerEvent:location:force:flags:contextId:secureName:](self, "_sendPressFingerEvent:location:force:flags:contextId:secureName:", 0, 0x1000000, v9, v7, x, y, 0.0);
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 element:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;

  v6 = a4;
  v7 = 0;
  if (a3 > 2000)
  {
    switch(a3)
    {
      case 2001:
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "accessibilityLabel");
          v8 = objc_claimAutoreleasedReturnValue();
LABEL_23:
          v7 = (void *)v8;
          goto LABEL_24;
        }
        break;
      case 2004:
        goto LABEL_21;
      case 2006:
        break;
      default:
        goto LABEL_24;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "accessibilityValue");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_21:
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "accessibilityTraits"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  switch(a3)
  {
    case 1000:
      -[AXBAccessibilityManager _accessibilitySpringBoardApplication](self, "_accessibilitySpringBoardApplication");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 1001:
      -[AXBAccessibilityManager _accessibilitySystemAppApplicationPid](self, "_accessibilitySystemAppApplicationPid");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 1002:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (_SBAXCaptureMode >> 5) & 1);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 1003:
      HIDWORD(v9) = HIDWORD(_SBAXPassiveListenDelay);
      *(float *)&v9 = *(double *)&_SBAXPassiveListenDelay;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 1005:
      -[AXBAccessibilityManager _accessibilityUIServerApplication](self, "_accessibilityUIServerApplication");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 1006:
      -[AXBAccessibilityManager _accessibilityAssistiveTouchApplication](self, "_accessibilityAssistiveTouchApplication");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 1007:
      -[AXBAccessibilityManager _accessibilityNativeFocusedApplication](self, "_accessibilityNativeFocusedApplication");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 1009:
      -[AXBAccessibilityManager _accessibilityCarPlayApplicationPid](self, "_accessibilityCarPlayApplicationPid");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 1010:
      -[AXBAccessibilityManager _accessibilityLiveCaptionsApplication](self, "_accessibilityLiveCaptionsApplication");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 1011:
      -[AXBAccessibilityManager _accessibilityInputUIApplication](self, "_accessibilityInputUIApplication");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    default:
      break;
  }
LABEL_24:

  return v7;
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  float v34;
  double v35;
  void *v36;
  uint64_t v37;
  AXBAccessibilityManager *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  int v62;
  int v63;
  float v64;
  double v65;
  uint64_t v66;
  double v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  float v77;
  double v78;
  void *v79;
  float v80;
  double v81;
  void *v82;
  float v83;
  double v84;
  void *v85;
  uint64_t v86;
  AXBAccessibilityManager *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  float v96;
  void *v97;
  float v98;
  void *v99;
  float v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  uint64_t v108;
  id v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint8_t buf[4];
  void *v131;
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = v7;
  v9 = 0;
  switch(a3)
  {
    case 5001:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "doubleValue");
        -[AXBAccessibilityManager _releasePendingEvents:](self, "_releasePendingEvents:");
        goto LABEL_43;
      }
      v9 = 0;
      break;
    case 5002:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BE00630], "representationWithData:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXBAccessibilityManager _accessibilityRepostEvent:](self, "_accessibilityRepostEvent:", v13);
LABEL_20:

LABEL_43:
        v9 = 1;
      }
      else
      {
        v9 = 1;
        _AXLogWithFacility();
      }
      break;
    case 5003:
      setCaptureMode(objc_msgSend(v7, "intValue"));
      goto LABEL_43;
    case 5004:
      buf[0] = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 != 3)
        goto LABEL_43;
      objc_msgSend(v8, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pointValue");
      v18 = v17;
      v20 = v19;

      v9 = 1;
      objc_msgSend(v8, "objectAtIndex:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v23 = v22;

      objc_msgSend(v8, "objectAtIndex:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "unsignedIntValue");

      -[AXBAccessibilityManager _sendFingerEvent:location:force:flags:contextId:](self, "_sendFingerEvent:location:force:flags:contextId:", 1, 0, v25, v18, v20, v23);
      break;
    case 5005:
      buf[0] = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27 != 3)
        goto LABEL_43;
      objc_msgSend(v8, "objectAtIndex:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "pointValue");
      v30 = v29;
      v32 = v31;

      objc_msgSend(v8, "objectAtIndex:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "floatValue");
      v35 = v34;

      objc_msgSend(v8, "objectAtIndex:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "unsignedIntValue");

      v38 = self;
      v39 = 2;
      v40 = v30;
      v41 = v32;
      v42 = v35;
      goto LABEL_15;
    case 5006:
      buf[0] = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "count");

      if (v44 != 2)
        goto LABEL_43;
      objc_msgSend(v8, "objectAtIndex:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "pointValue");
      v47 = v46;
      v49 = v48;

      objc_msgSend(v8, "objectAtIndex:", 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v50, "unsignedIntValue");

      v42 = 0.0;
      v38 = self;
      v39 = 6;
      v40 = v47;
      v41 = v49;
LABEL_15:
      -[AXBAccessibilityManager _sendFingerEvent:location:force:flags:contextId:](v38, "_sendFingerEvent:location:force:flags:contextId:", v39, 0, v37, v40, v41, v42);
      goto LABEL_31;
    case 5007:
      -[AXBAccessibilityManager _sendCancelTouchEvent](self, "_sendCancelTouchEvent");
      goto LABEL_43;
    case 5008:
      buf[0] = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDFEFA8]);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "pointValue");
      v53 = v52;
      v55 = v54;

      objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDFEFA0]);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDFEFB8]);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDFEF98]);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDFEFB0]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogCommon();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v131 = v8;
        _os_log_impl(&dword_232455000, v60, OS_LOG_TYPE_INFO, "Simulating press: %@", buf, 0xCu);
      }

      v61 = objc_msgSend(v57, "unsignedIntValue");
      objc_msgSend(v58, "floatValue");
      v63 = v62;
      objc_msgSend(v56, "floatValue");
      v65 = v64;
      v66 = objc_msgSend(v59, "unsignedIntValue");
      LODWORD(v67) = v63;
      -[AXBAccessibilityManager simulatePressAtPoint:withContextId:withDelay:withForce:withSecureName:](self, "simulatePressAtPoint:withContextId:withDelay:withForce:withSecureName:", v61, v66, v53, v55, v67, v65);

      goto LABEL_20;
    case 5009:
      -[AXBAccessibilityManager _setDeviceOrientationCapability:](self, "_setDeviceOrientationCapability:", objc_msgSend(v7, "BOOLValue"));
      goto LABEL_43;
    case 5010:
      objc_msgSend(MEMORY[0x24BE00748], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userEventOccurred");
LABEL_42:

      goto LABEL_43;
    case 5011:
    case 5012:
    case 5013:
    case 5014:
    case 5015:
    case 5016:
    case 5020:
    case 5021:
      break;
    case 5017:
      buf[0] = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "count");

      if (v69 != 5)
        goto LABEL_43;
      v70 = v8;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "pointValue");
      v73 = v72;
      v75 = v74;

      objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "floatValue");
      v78 = v77;

      objc_msgSend(v70, "objectAtIndexedSubscript:", 2);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "floatValue");
      v81 = v80;

      objc_msgSend(v70, "objectAtIndexedSubscript:", 3);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "floatValue");
      v84 = v83;

      objc_msgSend(v70, "objectAtIndexedSubscript:", 4);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v86 = objc_msgSend(v85, "unsignedIntValue");
      v87 = self;
      v88 = 1;
      goto LABEL_27;
    case 5018:
      buf[0] = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v89, "count");

      if (v90 != 5)
        goto LABEL_43;
      v91 = v8;
      objc_msgSend(v91, "objectAtIndexedSubscript:", 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "pointValue");
      v73 = v93;
      v75 = v94;

      objc_msgSend(v91, "objectAtIndexedSubscript:", 1);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "floatValue");
      v78 = v96;

      objc_msgSend(v91, "objectAtIndexedSubscript:", 2);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "floatValue");
      v81 = v98;

      objc_msgSend(v91, "objectAtIndexedSubscript:", 3);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "floatValue");
      v84 = v100;

      objc_msgSend(v91, "objectAtIndexedSubscript:", 4);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      v86 = objc_msgSend(v101, "unsignedIntValue");
      v87 = self;
      v88 = 2;
LABEL_27:
      v102 = v73;
      v103 = v75;
      v104 = v78;
      v105 = v81;
      v106 = v84;
      goto LABEL_30;
    case 5019:
      buf[0] = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend(v107, "count");

      if (v108 != 2)
        goto LABEL_43;
      v109 = v8;
      objc_msgSend(v109, "objectAtIndexedSubscript:", 0);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "pointValue");
      v112 = v111;
      v114 = v113;

      objc_msgSend(v109, "objectAtIndexedSubscript:", 1);
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      v86 = objc_msgSend(v115, "unsignedIntValue");
      v104 = 0.0;
      v105 = 0.0;
      v106 = 0.0;
      v87 = self;
      v88 = 6;
      v102 = v112;
      v103 = v114;
LABEL_30:
      -[AXBAccessibilityManager _sendStylusEvent:location:force:altitude:azimuth:flags:contextId:](v87, "_sendStylusEvent:location:force:altitude:azimuth:flags:contextId:", v88, 0, v86, v102, v103, v104, v105, v106);
LABEL_31:
      v9 = 1;
      break;
    case 5022:
      unsetCaptureMode(objc_msgSend(v7, "intValue"));
      goto LABEL_43;
    default:
      switch(a3)
      {
        case 5100:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1218);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BE00630];
          v12 = 1219;
          goto LABEL_41;
        case 5101:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1032);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BE00630];
          v12 = 1033;
          goto LABEL_41;
        case 5102:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1200);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BE00630];
          v12 = 1201;
          goto LABEL_41;
        case 5103:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1202);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BE00630];
          v12 = 1203;
          goto LABEL_41;
        case 5104:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1204);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BE00630];
          v12 = 1205;
          goto LABEL_41;
        case 5105:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1206);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BE00630];
          v12 = 1207;
          goto LABEL_41;
        case 5106:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1216);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BE00630];
          v12 = 1217;
          goto LABEL_41;
        case 5107:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1222);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BE00630];
          v12 = 1223;
          goto LABEL_41;
        case 5108:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1224);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x24BE00630];
          v12 = 1224;
LABEL_41:
          objc_msgSend(v11, "buttonRepresentationWithType:", v12);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:", v10, 0, 0x8000000817319375);
          objc_msgSend(v117, "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:", v116, 0, 0x8000000817319375);

          goto LABEL_42;
        case 5109:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1216);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1217);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:", v10, 0, 0x8000000817319375);
          v128 = v120;
          v129 = v119;
          v121 = v119;
          v122 = v120;
          AXPerformBlockOnMainThreadAfterDelay();

          v123 = v128;
          goto LABEL_47;
        case 5110:
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1222);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", 1223);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:", v10, 0, 0x8000000817319375);
          v126 = v125;
          v127 = v124;
          v121 = v124;
          v122 = v125;
          AXPerformBlockOnMainThreadAfterDelay();

          v123 = v126;
LABEL_47:

          goto LABEL_42;
        default:
          goto LABEL_44;
      }
  }
LABEL_44:

  return v9;
}

uint64_t __78__AXBAccessibilityManager__iosAccessibilityPerformAction_withValue_fencePort___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:", *(_QWORD *)(a1 + 40), 0, 0x8000000817319375);
}

uint64_t __78__AXBAccessibilityManager__iosAccessibilityPerformAction_withValue_fencePort___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:", *(_QWORD *)(a1 + 40), 0, 0x8000000817319375);
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  unint64_t v39;
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
  uint64_t v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  unint64_t v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  double v87;
  void *v88;
  uint64_t v89;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  switch(a3)
  {
    case 91500:
      v8 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");
      objc_msgSend(v7, "objectForKey:", CFSTR("point"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pointValue");

      objc_msgSend(v7, "objectForKey:", CFSTR("displayId"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntValue");

      -[AXBAccessibilityManager windowServerDisplayForDisplayId:](self, "windowServerDisplayForDisplayId:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "contextIdAtPosition:", AXRotateToScreen());
      v14 = -[AXBAccessibilityManager _accessibilityApplicationForContextId:](self, "_accessibilityApplicationForContextId:", v13);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("pid"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("contextId"));

      goto LABEL_44;
    case 91501:
      objc_msgSend(v6, "pointValue");
      v17 = (void *)MEMORY[0x24BDD1968];
      -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", 0, 0);
      objc_msgSend(v17, "valueWithPoint:");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 91503:
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 < 2)
        goto LABEL_28;
      v12 = v7;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_42;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_43;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pointValue");
      v26 = v25;
      v28 = v27;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedIntValue");

      if ((unint64_t)objc_msgSend(v12, "count") < 3)
      {
        v32 = 0;
      }
      else
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "unsignedIntValue");

      }
      v91 = (void *)MEMORY[0x24BDD1968];
      -[AXBAccessibilityManager _accessibilityConvertHostedViewPoint:fromContextId:displayId:](self, "_accessibilityConvertHostedViewPoint:fromContextId:displayId:", v30, v32, v26, v28);
      goto LABEL_53;
    case 91504:
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34 < 2)
        goto LABEL_28;
      v12 = v7;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_42;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_42:
        goto LABEL_43;
      }
      if ((unint64_t)objc_msgSend(v12, "count") < 3)
      {

        goto LABEL_49;
      }
      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v37 = objc_opt_isKindOfClass();

      if ((v37 & 1) == 0)
      {
LABEL_43:
        v8 = 0;
        goto LABEL_44;
      }
LABEL_49:
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "pointValue");
      v94 = v93;
      v96 = v95;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "unsignedIntValue");

      if ((unint64_t)objc_msgSend(v12, "count") < 3)
      {
        v100 = 0;
      }
      else
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v99, "unsignedIntValue");

      }
      v91 = (void *)MEMORY[0x24BDD1968];
      -[AXBAccessibilityManager accessibilityConvertHostedViewPoint:toContextId:displayId:](self, "accessibilityConvertHostedViewPoint:toContextId:displayId:", v98, v100, v94, v96);
LABEL_53:
      objc_msgSend(v91, "valueWithPoint:");
      v89 = objc_claimAutoreleasedReturnValue();
LABEL_40:
      v8 = (void *)v89;
LABEL_44:

LABEL_45:
      return v8;
    case 91505:
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");

      if (v39 < 2)
        goto LABEL_28;
      v12 = v7;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "rectValue");
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "unsignedIntValue");

      if ((unint64_t)objc_msgSend(v12, "count") < 3)
      {
        v52 = 0;
      }
      else
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "unsignedIntValue");

      }
      v88 = (void *)MEMORY[0x24BDD1968];
      -[AXBAccessibilityManager accessibilityConvertHostedViewFrame:fromContextId:displayId:](self, "accessibilityConvertHostedViewFrame:fromContextId:displayId:", v50, v52, v42, v44, v46, v48);
      goto LABEL_39;
    case 91506:
      objc_msgSend(v6, "pointValue");
      v54 = v53;
      v56 = v55;
      if (-[AXBAccessibilityManager _accessibilityDisplayRequiresRotateForPoints:](self, "_accessibilityDisplayRequiresRotateForPoints:", 0))
      {
        v54 = AXRotateToScreen();
        v56 = v57;
      }
      +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "windowServer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "contextIdAtPosition:", v54, v56);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v60);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 91507:
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v61, "count");

      if (!v8)
        goto LABEL_45;
      v12 = v7;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "pointValue");
      v64 = v63;
      v66 = v65;

      if (objc_msgSend(v12, "count") == 2)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "unsignedIntValue");

      }
      else
      {
        v68 = 0;
      }
      -[AXBAccessibilityManager windowServerDisplayForDisplayId:](self, "windowServerDisplayForDisplayId:", v68);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[AXBAccessibilityManager _accessibilityDisplayRequiresRotateForPoints:](self, "_accessibilityDisplayRequiresRotateForPoints:", v86))
      {
        v64 = AXRotateToScreen();
        v66 = v87;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v86, "contextIdAtPosition:", v64, v66));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_44;
    case 91508:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_28;
      objc_msgSend(v7, "objectForKey:", CFSTR("contextId"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "unsignedIntValue");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[AXBAccessibilityManager _accessibilityApplicationForContextId:](self, "_accessibilityApplicationForContextId:", v70));
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v8 = (void *)v18;
      goto LABEL_45;
    case 91511:
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "count");

      if (v72 < 2)
      {
LABEL_28:
        v8 = 0;
        goto LABEL_45;
      }
      v12 = v7;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "rectValue");
      v75 = v74;
      v77 = v76;
      v79 = v78;
      v81 = v80;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "unsignedIntValue");

      if ((unint64_t)objc_msgSend(v12, "count") < 3)
      {
        v85 = 0;
      }
      else
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "unsignedIntValue");

      }
      v88 = (void *)MEMORY[0x24BDD1968];
      -[AXBAccessibilityManager accessibilityConvertHostedViewFrame:toContextId:displayId:](self, "accessibilityConvertHostedViewFrame:toContextId:displayId:", v83, v85, v75, v77, v79, v81);
LABEL_39:
      objc_msgSend(v88, "valueWithRect:");
      v89 = objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    default:
      goto LABEL_45;
  }
}

- (BOOL)_accessibilityDisplayRequiresRotateForPoints:(id)a3
{
  void *v3;
  void *v5;
  int v6;
  int v7;
  void *v8;

  objc_msgSend(a3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("TVOut"));
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isExternal") & 1) != 0)
    {
      LOBYTE(v7) = 0;
LABEL_9:

      goto LABEL_10;
    }
    if (a3)
    {
      LOBYTE(v7) = 1;
      goto LABEL_9;
    }
  }
  else if (a3)
  {
    LOBYTE(v7) = 1;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isExternal") ^ 1;

  if (v6)
    goto LABEL_9;
LABEL_10:

  return v7;
}

- (id)windowServerDisplayForDisplayId:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayWithDisplayId:", v3);
  }
  else
  {
    +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowServer");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_userEventOccurred
{
  +[AXBackBoardGlue sendUserEventOccurred](AXBackBoardGlue, "sendUserEventOccurred");
}

- (double)_processPassiveEventQueue
{
  void *v3;
  double Current;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double *v11;
  void *v12;
  double v13;

  objc_msgSend((id)_PassiveEventLock, "lock");
  if (objc_msgSend((id)_SBAXPassiveEventQueue, "count"))
  {
    objc_msgSend((id)_SBAXPassiveEventQueue, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v3, "fireTime");
    if (Current >= v5)
    {
      objc_msgSend((id)_SBAXPassiveEventQueue, "removeObjectAtIndex:", 0);
      objc_msgSend((id)_PassiveEventLock, "unlock");
      objc_msgSend(v3, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dispatchEventRepresentationToClient:", v9);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (double *)malloc_type_calloc(1uLL, objc_msgSend(v9, "length"), 0x448D5955uLL);
          objc_msgSend(v9, "getBytes:length:", v11, objc_msgSend(v9, "length"));
          +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "machPortForPoint:", v11[1], v11[2]);

          GSSendEvent();
          free(v11);
        }
      }
      -[AXBAccessibilityManager _processPassiveEventQueue](self, "_processPassiveEventQueue");
      v7 = v13;

    }
    else
    {
      objc_msgSend((id)_PassiveEventLock, "unlock");
      objc_msgSend(v3, "fireTime");
      v7 = v6 - CFAbsoluteTimeGetCurrent();
    }
  }
  else
  {
    objc_msgSend((id)_PassiveEventLock, "unlock");
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceNow");
    v7 = v8;
  }

  return v7;
}

- (void)_releasePendingEvents:(double)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)_PassiveEventLock, "lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)_SBAXPassiveEventQueue;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "fireTime", (_QWORD)v12);
        if (v10 <= a3)
        {
          objc_msgSend(v9, "fireTime");
          objc_msgSend(v9, "setFireTime:", v11 - *(double *)&_SBAXPassiveListenDelay);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  if (_SBAXPassiveRunLoopRef)
    CFRunLoopStop((CFRunLoopRef)_SBAXPassiveRunLoopRef);
  objc_msgSend((id)_PassiveEventLock, "unlock", (_QWORD)v12);
}

- (void)_startPassiveResendThread
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  CFTimeInterval v7;
  CFRunLoopSourceContext v8;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", CFSTR("AXPassiveResentThread"));

  objc_msgSend((id)_PassiveEventLock, "lock", 0, self, 0, 0, 0, 0, 0, 0, 0, _passiveEventHandler);
  _SBAXPassiveSourceRef = (uint64_t)CFRunLoopSourceCreate(0, 0, &v8);
  _SBAXPassiveRunLoopRef = (uint64_t)CFRunLoopGetCurrent();
  v4 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  CFRunLoopAddSource((CFRunLoopRef)_SBAXPassiveRunLoopRef, (CFRunLoopSourceRef)_SBAXPassiveSourceRef, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  CFRunLoopSourceSignal((CFRunLoopSourceRef)_SBAXPassiveSourceRef);
  v5 = objc_msgSend((id)_PassiveEventLock, "unlock");
  while (1)
  {
    v6 = (void *)MEMORY[0x23490841C](v5);
    -[AXBAccessibilityManager _processPassiveEventQueue](self, "_processPassiveEventQueue");
    CFRunLoopRunInMode(v4, v7, 1u);
    objc_autoreleasePoolPop(v6);
  }
}

- (BOOL)_handleItemChooserVisible:(unsigned int)a3
{
  return 0;
}

- (BOOL)_screenReaderCapture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char voiceOverIgnoresTrackpad;
  int v8;
  _BOOL4 v9;
  char IsKeyboardKey;
  double Current;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "originalType");
    if (-[AXBAccessibilityManager _handleItemChooserVisible:](self, "_handleItemChooserVisible:", v6))
    {
      objc_msgSend(v5, "setAdditionalFlags:", objc_msgSend(v5, "additionalFlags") | 0x2000000);
      BKPostAXEvent(v5, 0);
LABEL_7:
      voiceOverIgnoresTrackpad = 1;
      goto LABEL_25;
    }
    if ((_DWORD)v6 == 50 && !_SBAXDeviceOrientationCapabilityEnabled)
      goto LABEL_7;
    if ((v6 - 1000) >= 2)
    {
      if ((_DWORD)v6 == 3200)
      {
        voiceOverIgnoresTrackpad = self->_voiceOverIgnoresTrackpad;
        goto LABEL_25;
      }
      IsKeyboardKey = AXEventTypeIsKeyboardKey();
      v8 = 0;
      v9 = 1;
      if ((_DWORD)v6 != 3001 && (IsKeyboardKey & 1) == 0)
      {
        if ((v6 - 10) >= 3)
        {
          if ((v6 - 1025) <= 3)
            v9 = (((_BYTE)v6 - 1) & 0xF) == 2;
        }
        else
        {
          v9 = 0;
        }
        v8 = 1;
      }
    }
    else
    {
      v8 = 1;
      v9 = 1;
    }
    Current = CFAbsoluteTimeGetCurrent();
    if ((_DWORD)v6 == 3001 && Current - *(double *)&_screenReaderCapture__LastUserEventSent > 4.0)
    {
      -[AXBAccessibilityManager _userEventOccurred](self, "_userEventOccurred");
      _screenReaderCapture__LastUserEventSent = CFAbsoluteTimeGetCurrent();
    }
    if (v8)
    {
      objc_msgSend(v5, "setAdditionalFlags:", objc_msgSend(v5, "additionalFlags") | 0x2000000);
      BKPostAXEvent(v5, v9);
    }
    voiceOverIgnoresTrackpad = !v9;
  }
  else
  {
    voiceOverIgnoresTrackpad = 0;
  }
LABEL_25:

  return voiceOverIgnoresTrackpad;
}

- (BOOL)_assistiveTouchCapture:(id)a3
{
  return 0;
}

- (BOOL)_inspectorCapture:(id)a3
{
  return 0;
}

- (BOOL)_gaxCapture:(id)a3
{
  return 0;
}

- (BOOL)_axMenuCapture:(id)a3
{
  return 0;
}

- (void)_undoContextShiftedPoints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "type") == 3001)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "handInfo", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "pathWindowContextID");
          objc_msgSend(v11, "pathLocation");
          -[AXBAccessibilityManager _accessibilityConvertHostedViewPoint:fromContextId:displayId:](self, "_accessibilityConvertHostedViewPoint:fromContextId:displayId:", v12, 0);
          objc_msgSend(v11, "setPathLocation:");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(v4, "location");
    -[AXBAccessibilityManager _accessibilityConvertHostedViewPoint:fromContextId:displayId:](self, "_accessibilityConvertHostedViewPoint:fromContextId:displayId:", v12, 0);
    objc_msgSend(v4, "setLocation:");
    objc_msgSend(v4, "windowLocation");
    -[AXBAccessibilityManager _accessibilityConvertHostedViewPoint:fromContextId:displayId:](self, "_accessibilityConvertHostedViewPoint:fromContextId:displayId:", v12, 0);
    objc_msgSend(v4, "setWindowLocation:");
  }

}

- (BOOL)_accessibilityEventTapCallback:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  char v12;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  -[AXBAccessibilityManager _undoContextShiftedPoints:](self, "_undoContextShiftedPoints:", v5);
  if ((_SBAXCaptureMode & 0x20) != 0
    && (objc_msgSend(v5, "dataRepresentation"),
        AXPushNotificationToSystemForBroadcast(),
        *(double *)&_SBAXPassiveListenDelay != 0.0)
    && objc_msgSend(v5, "type", *(double *)&_SBAXPassiveListenDelay) == 3001)
  {
    if (!_SBAXPassiveEventQueue)
    {
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), "init");
      v7 = (void *)_PassiveEventLock;
      _PassiveEventLock = v6;

      v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
      v9 = (void *)_SBAXPassiveEventQueue;
      _SBAXPassiveEventQueue = v8;

      objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__startPassiveResendThread, self, 0);
    }
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setValue:", v4);
    objc_msgSend(v10, "setFireTime:", CFAbsoluteTimeGetCurrent() + *(double *)&_SBAXPassiveListenDelay);
    objc_msgSend((id)_PassiveEventLock, "lock");
    objc_msgSend((id)_SBAXPassiveEventQueue, "addObject:", v10);
    if (_SBAXPassiveRunLoopRef)
      CFRunLoopStop((CFRunLoopRef)_SBAXPassiveRunLoopRef);
    objc_msgSend((id)_PassiveEventLock, "unlock");

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  v12 = _SBAXCaptureMode;
  if ((_SBAXCaptureMode & 8) != 0)
  {
    v11 = -[AXBAccessibilityManager _gaxCapture:](self, "_gaxCapture:", v5);
    v12 = _SBAXCaptureMode;
  }
  if ((v12 & 4) != 0 && !v11)
  {
    v11 = -[AXBAccessibilityManager _inspectorCapture:](self, "_inspectorCapture:", v5);
    v12 = _SBAXCaptureMode;
  }
  if ((v12 & 2) != 0 && !v11)
  {
    v11 = -[AXBAccessibilityManager _assistiveTouchCapture:](self, "_assistiveTouchCapture:", v5);
    v12 = _SBAXCaptureMode;
  }
  if ((v12 & 1) != 0 && !v11)
  {
    v11 = -[AXBAccessibilityManager _screenReaderCapture:](self, "_screenReaderCapture:", v5);
    v12 = _SBAXCaptureMode;
  }
  if ((v12 & 0x10) != 0 && !v11)
    v11 = -[AXBAccessibilityManager _axMenuCapture:](self, "_axMenuCapture:", v5);

  return v11;
}

- (void)setAccelerometerDisabled:(BOOL)a3
{
  self->_accelerometerDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtimeManager, 0);
}

- (void)_accessibilitySystemApp
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_232455000, log, OS_LOG_TYPE_ERROR, "Did not find any non-CarPlay system apps, returning systemApp from backboard.", v1, 2u);
}

- (void)_accessibilitySystemAppApplicationPid
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_232455000, a3, OS_LOG_TYPE_ERROR, "Pid from system app was not valid: %@ %@", (uint8_t *)&v6, 0x16u);

}

@end
