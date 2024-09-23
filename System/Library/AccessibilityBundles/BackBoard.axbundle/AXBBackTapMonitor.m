@implementation AXBBackTapMonitor

+ (void)initializeMonitor
{
  id v2;

  v2 = (id)objc_msgSend(a1, "controller");
}

+ (id)controller
{
  if (controller_onceToken != -1)
    dispatch_once(&controller_onceToken, &__block_literal_global_0);
  return (id)controller__sMonitor;
}

void __31__AXBBackTapMonitor_controller__block_invoke()
{
  AXBBackTapMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(AXBBackTapMonitor);
  v1 = (void *)controller__sMonitor;
  controller__sMonitor = (uint64_t)v0;

}

- (AXBBackTapMonitor)init
{
  AXBBackTapMonitor *v2;
  AXBBackTapMonitor *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  void *v7;
  uint64_t v8;
  VOSCommandManager *commandManager;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AXBBackTapMonitor;
  v2 = -[AXBBackTapMonitor init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXBBackTapMonitor _backTapSettingsDidUpdate](v2, "_backTapSettingsDidUpdate");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_updateBackTap, (CFStringRef)*MEMORY[0x24BED2708], 0, (CFNotificationSuspensionBehavior)1028);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)_updateBackTap, (CFStringRef)*MEMORY[0x24BED2970], 0, (CFNotificationSuspensionBehavior)1028);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v3, (CFNotificationCallback)_updateBackTap, (CFStringRef)*MEMORY[0x24BED26F8], 0, (CFNotificationSuspensionBehavior)1028);
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__magnifierBackTapSettingsDidSetBackTap, *MEMORY[0x24BED28A0], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__backTapSettingsDidUpdate, *MEMORY[0x24BED2898], 0);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEC0D58]), "initPreferringUserProfileWithoutShortcuts");
    commandManager = v3->_commandManager;
    v3->_commandManager = (VOSCommandManager *)v8;

    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __25__AXBBackTapMonitor_init__block_invoke;
    v17[3] = &unk_250187950;
    objc_copyWeak(&v18, &location);
    v12 = objc_loadWeakRetained(&location);
    objc_msgSend(v10, "registerUpdateBlock:forRetrieveSelector:withListener:", v17, sel_voiceOverCustomCommandProfile, v12);

    objc_destroyWeak(&v18);
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __25__AXBBackTapMonitor_init__block_invoke_3;
    v15[3] = &unk_250187950;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v13, "registerUpdateBlock:forRetrieveSelector:withListener:", v15, sel_assistiveTouchSwitches, v3);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __25__AXBBackTapMonitor_init__block_invoke(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __25__AXBBackTapMonitor_init__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "commandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadPreferringUserProfile");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "_backTapSettingsDidUpdate");

}

void __25__AXBBackTapMonitor_init__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void __25__AXBBackTapMonitor_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_backTapSettingsDidUpdate");

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BED2708], 0);
  v4.receiver = self;
  v4.super_class = (Class)AXBBackTapMonitor;
  -[AXBBackTapMonitor dealloc](&v4, sel_dealloc);
}

- (void)_backTapSettingsDidUpdate
{
  if (-[AXBBackTapMonitor _shouldEnableBackTap](self, "_shouldEnableBackTap"))
  {
    -[AXBBackTapMonitor _registerForBackTap](self, "_registerForBackTap");
  }
  else if (self->_backTapClient)
  {
    -[AXBBackTapMonitor _unregisterForBackTap](self, "_unregisterForBackTap");
  }
}

- (void)_registerForBackTapFromMagnifier
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[AXBBackTapMonitor _policyOption](self, "_policyOption") | 1;
  -[AXBBackTapMonitor backTapClient](self, "backTapClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDFFE68];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v6, 10000, v7, &__block_literal_global_193);

}

uint64_t __53__AXBBackTapMonitor__registerForBackTapFromMagnifier__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
    return _AXLogWithFacility();
  return result;
}

- (void)_registerForBackTap
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  AXLogBackTap();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_232455000, v3, OS_LOG_TYPE_DEFAULT, "Registering for Back Tap", v8, 2u);
  }

  -[AXBBackTapMonitor backTapClient](self, "backTapClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDFFE68];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXBBackTapMonitor _policyOption](self, "_policyOption"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v6, 10000, v7, &__block_literal_global_196);

}

uint64_t __40__AXBBackTapMonitor__registerForBackTap__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
    return _AXLogWithFacility();
  return result;
}

- (void)_unregisterForBackTap
{
  void *v3;
  void *v4;
  AXUIClient *backTapClient;

  -[AXBBackTapMonitor backTapClient](self, "backTapClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, 10001, v4, &__block_literal_global_197);

  backTapClient = self->_backTapClient;
  self->_backTapClient = 0;

}

uint64_t __42__AXBBackTapMonitor__unregisterForBackTap__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
    return _AXLogWithFacility();
  return result;
}

- (AXUIClient)backTapClient
{
  AXUIClient *backTapClient;
  id v4;
  AXUIClient *v5;
  AXUIClient *v6;

  backTapClient = self->_backTapClient;
  if (!backTapClient)
  {
    v4 = objc_alloc(MEMORY[0x24BDFF8F0]);
    v5 = (AXUIClient *)objc_msgSend(v4, "initWithIdentifier:serviceBundleName:", *MEMORY[0x24BDFFE60], CFSTR("BackTapUIServer"));
    v6 = self->_backTapClient;
    self->_backTapClient = v5;

    -[AXUIClient setDelegate:](self->_backTapClient, "setDelegate:", self);
    backTapClient = self->_backTapClient;
  }
  return backTapClient;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  if (self->_backTapClient == a3)
    AXPerformBlockOnMainThread();
}

uint64_t __79__AXBBackTapMonitor_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_backTapSettingsDidUpdate");
}

- (BOOL)_shouldEnableBackTap
{
  return -[AXBBackTapMonitor _policyOption](self, "_policyOption") != 0;
}

- (unint64_t)_policyOption
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backTapEnabled");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backTapDoubleTapAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backTapTripleTapAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7 | (2 * (v9 != 0));

  }
  else
  {
    v10 = 0;
  }
  if (_AXSAssistiveTouchScannerEnabled())
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assistiveTouchSwitches");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __34__AXBBackTapMonitor__policyOption__block_invoke;
    v23[3] = &unk_2501879F8;
    v23[4] = &v28;
    v23[5] = &v24;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v23);

    v10 |= *((unsigned __int8 *)v29 + 24) | (2 * *((unsigned __int8 *)v25 + 24));
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
  }
  if (_AXSVoiceOverTouchEnabled())
  {
    objc_msgSend(MEMORY[0x24BEC0D60], "resolverForCurrentHost");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBBackTapMonitor commandManager](self, "commandManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC0D68], "BackTapDoubleTap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "commandForTouchGesture:withResolver:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 != 0;

    -[AXBBackTapMonitor commandManager](self, "commandManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC0D68], "BackTapTripleTap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "commandForTouchGesture:withResolver:", v19, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 != 0;

    v10 |= v17 || 2 * v21;
  }
  return v10;
}

void __34__AXBBackTapMonitor__policyOption__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE00780]);

  if (v4)
  {
    if (objc_msgSend(v5, "accessibilityEventUsage") == 1)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    if (objc_msgSend(v5, "accessibilityEventUsage") == 2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)setBackTapClient:(id)a3
{
  objc_storeStrong((id *)&self->_backTapClient, a3);
}

- (VOSCommandManager)commandManager
{
  return self->_commandManager;
}

- (void)setCommandManager:(id)a3
{
  objc_storeStrong((id *)&self->_commandManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandManager, 0);
  objc_storeStrong((id *)&self->_backTapClient, 0);
}

@end
