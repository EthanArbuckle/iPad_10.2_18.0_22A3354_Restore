@implementation AXBHardwareManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_5 != -1)
    dispatch_once(&initializeMonitor_onceToken_5, &__block_literal_global_11);
}

void __39__AXBHardwareManager_initializeMonitor__block_invoke()
{
  AXBHardwareManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBHardwareManager);
  v1 = (void *)_SharedManager_2;
  _SharedManager_2 = (uint64_t)v0;

}

- (AXBHardwareManager)init
{
  AXBHardwareManager *v2;
  AXBHardwareManager *v3;
  _QWORD block[4];
  AXBHardwareManager *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXBHardwareManager;
  v2 = -[AXBHardwareManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__AXBHardwareManager_init__block_invoke;
    block[3] = &unk_250187618;
    v6 = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v3;
}

void __26__AXBHardwareManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_queue_t v8;
  uint64_t v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD *v12;
  NSObject *v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "_updateEventTap");
  objc_msgSend(*(id *)(a1 + 32), "_updateIgnoreTrackpadSettings");
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __26__AXBHardwareManager_init__block_invoke_2;
  v22[3] = &unk_250187950;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v2, "registerUpdateBlock:forRetrieveSelector:withListener:", v22, sel_stickyKeysEnabled, *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v23);
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = 3221225472;
  v20[2] = __26__AXBHardwareManager_init__block_invoke_3;
  v20[3] = &unk_250187950;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v4, "registerUpdateBlock:forRetrieveSelector:withListener:", v20, sel_stickyKeysShiftToggleEnabled, *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v21);
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __26__AXBHardwareManager_init__block_invoke_4;
  v18[3] = &unk_250187950;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v5, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_ignoreTrackpad, *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v19);
  if (AXDeviceSupportsCameraButton())
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v3;
    v16[1] = 3221225472;
    v16[2] = __26__AXBHardwareManager_init__block_invoke_5;
    v16[3] = &unk_250187950;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v6, "registerUpdateBlock:forRetrieveSelector:withListener:", v16, sel_cameraButtonSensitivity, *(_QWORD *)(a1 + 32));

    objc_destroyWeak(&v17);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__slowKeysEnabledChanged, *MEMORY[0x24BED2908], 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__slowKeysAcceptanceDelayChanged, *MEMORY[0x24BED2900], 0);
  v8 = dispatch_queue_create("com.apple.AXBackBoard.ContinuitySessionCheck", 0);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v8;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleContinuityDisplayStateChanged, (CFStringRef)*MEMORY[0x24BED2738], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v12 = *(_QWORD **)(a1 + 32);
  v13 = v12[4];
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __26__AXBHardwareManager_init__block_invoke_6;
  v14[3] = &unk_250187618;
  v15 = v12;
  dispatch_async(v13, v14);

  objc_destroyWeak(&location);
}

void __26__AXBHardwareManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stickyKeysEnabledChanged");

}

void __26__AXBHardwareManager_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stickyKeysShiftToggleChanged");

}

void __26__AXBHardwareManager_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateIgnoreTrackpadSettings");

}

void __26__AXBHardwareManager_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCameraButtonSensitivity");

}

uint64_t __26__AXBHardwareManager_init__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForContinuityStateChange");
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BED2908], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BED2900], 0);
  -[AXUIClient setDelegate:](self->_stickyKeysClient, "setDelegate:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

  v5.receiver = self;
  v5.super_class = (Class)AXBHardwareManager;
  -[AXBHardwareManager dealloc](&v5, sel_dealloc);
}

- (void)_updateCameraButtonSensitivity
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraButtonSensitivity");
  v4 = v3;

  objc_msgSend(MEMORY[0x24BE0B6B0], "build:", &__block_literal_global_195);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_232455000, v6, OS_LOG_TYPE_DEFAULT, "CameraButton: Setting sensitivty: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4, CFSTR("HalfPressThresholdModifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BKSHIDServicesSetPersistentServiceProperties();

}

uint64_t __52__AXBHardwareManager__updateCameraButtonSensitivity__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrimaryPage:primaryUsage:", 65280, 102);
}

- (void)_updateIgnoreTrackpadSettings
{
  uint64_t v2;
  __IOHIDEventSystemClient *v3;
  const __CFArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __IOHIDServiceClient *v9;
  void *v10;
  void *v11;
  void *v12;
  __IOHIDEventSystemClient *cf;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[2];
  _QWORD v20[4];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v2 = IOHIDEventSystemClientCreate();
  if (v2)
  {
    v3 = (__IOHIDEventSystemClient *)v2;
    v19[0] = CFSTR("PrimaryUsagePage");
    v19[1] = CFSTR("PrimaryUsage");
    v20[0] = &unk_25018EDD8;
    v20[1] = &unk_25018EDF0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientSetMatching();
    cf = v3;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = IOHIDEventSystemClientCopyServices(v3);
    v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(__IOHIDServiceClient **)(*((_QWORD *)&v14 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance", v12, cf, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          IOHIDServiceClientSetProperty(v9, CFSTR("PrimaryTrackpadCanBeDisabled"), (CFTypeRef)objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "ignoreTrackpad") ^ 1));

          ++v8;
        }
        while (v6 != v8);
        v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    CFRelease(cf);
  }
}

- (void)_updateStateForKeyboardEvent:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "flags");
  if ((v5 & 0xE0000) != 0)
  {
    objc_msgSend(v9, "keyInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "keyCode");
    objc_msgSend(v9, "keyInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBHardwareManager _notifyServerStickyKeyUpdatedForKeycode:usagePage:down:up:locked:](self, "_notifyServerStickyKeyUpdatedForKeycode:usagePage:down:up:locked:", v7, objc_msgSend(v8, "usagePage"), (v5 >> 17) & 1, (v5 >> 19) & 1, (v5 >> 18) & 1);

  }
  if ((v5 & 0x200000) != 0 && (objc_msgSend(v4, "stickyKeysEnabled") & 1) == 0)
  {
    -[AXBHardwareManager setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:](self, "setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:", 1);
    objc_msgSend(v4, "setStickyKeysEnabled:", 1);
    -[AXBHardwareManager _notifyServerStickyKeysToggledViaShift](self, "_notifyServerStickyKeysToggledViaShift");
  }
  else if ((v5 & 0x400000) != 0 && objc_msgSend(v4, "stickyKeysEnabled"))
  {
    -[AXBHardwareManager setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:](self, "setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:", 1);
    objc_msgSend(v4, "setStickyKeysEnabled:", 0);
    -[AXBHardwareManager _notifyServerStickyKeysToggledViaShift](self, "_notifyServerStickyKeysToggledViaShift");
    -[AXBHardwareManager _notifyServerStickyKeysDisabled](self, "_notifyServerStickyKeysDisabled");
  }

}

- (void)_updateKeyboardService:(__IOHIDServiceClient *)a3
{
  char v4;
  CFTypeRef *v5;
  CFTypeRef *v6;
  CFTypeRef *v7;
  int v8;
  CFTypeRef v9;
  CFTypeRef v10;
  const void *v11;
  const void *v12;
  double v13;
  unint64_t v14;
  id v15;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v15, "stickyKeysEnabled");
  v5 = (CFTypeRef *)MEMORY[0x24BDBD268];
  v6 = (CFTypeRef *)MEMORY[0x24BDBD270];
  v7 = (CFTypeRef *)MEMORY[0x24BDBD268];
  if ((v4 & 1) == 0)
  {
    if (objc_msgSend(v15, "stickyKeysShiftToggleEnabled"))
      v7 = v5;
    else
      v7 = v6;
  }
  IOHIDServiceClientSetProperty(a3, CFSTR("HIDStickyKeysDisabled"), *v7);
  v8 = objc_msgSend(v15, "stickyKeysEnabled");
  v9 = *v6;
  v10 = *v5;
  if (v8)
    v11 = v9;
  else
    v11 = v10;
  IOHIDServiceClientSetProperty(a3, CFSTR("HIDStickyKeysOn"), v11);
  if (objc_msgSend(v15, "stickyKeysShiftToggleEnabled"))
    v12 = v9;
  else
    v12 = v10;
  IOHIDServiceClientSetProperty(a3, CFSTR("HIDStickyKeysShiftToggles"), v12);
  if (_AXSSlowKeysEnabled())
  {
    _AXSSlowKeysAcceptanceDelay();
    v14 = (unint64_t)(v13 * 1000.0);
  }
  else
  {
    v14 = 0;
  }
  IOHIDServiceClientSetProperty(a3, CFSTR("HIDSlowKeysDelay"), (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14));

}

- (void)_updateEventTap
{
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
  _QWORD v14[5];
  _QWORD v15[5];

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_AXSSlowKeysEnabled()
    || (objc_msgSend(v3, "stickyKeysEnabled") & 1) != 0
    || objc_msgSend(v3, "stickyKeysShiftToggleEnabled"))
  {
    -[AXBHardwareManager eventTapIdentifier](self, "eventTapIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      -[AXBHardwareManager eventTapIdentifier](self, "eventTapIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "runMatchingServiceHandlerForEventTap:", v7);
    }
    else
    {
      v14[4] = self;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __37__AXBHardwareManager__updateEventTap__block_invoke;
      v15[3] = &unk_250188110;
      v15[4] = self;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __37__AXBHardwareManager__updateEventTap__block_invoke_2;
      v14[3] = &unk_250188138;
      objc_msgSend(v5, "installKeyboardEventTap:identifier:matchingServiceHandler:", v15, 0, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBHardwareManager setEventTapIdentifier:](self, "setEventTapIdentifier:", v8);

      objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBHardwareManager eventTapIdentifier](self, "eventTapIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEventTapPriority:priority:", v7, 22);
    }

  }
  else
  {
    -[AXBHardwareManager eventTapIdentifier](self, "eventTapIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBHardwareManager eventTapIdentifier](self, "eventTapIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "runMatchingServiceHandlerForEventTap:", v11);

      objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBHardwareManager eventTapIdentifier](self, "eventTapIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeEventTap:", v13);

      -[AXBHardwareManager setEventTapIdentifier:](self, "setEventTapIdentifier:", 0);
    }
  }

}

uint64_t __37__AXBHardwareManager__updateEventTap__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "senderID") != 0x8000000817319378)
    objc_msgSend(*(id *)(a1 + 32), "_updateStateForKeyboardEvent:", v3);

  return 0;
}

uint64_t __37__AXBHardwareManager__updateEventTap__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateKeyboardService:", a2);
}

- (void)_updateForContinuityStateChange
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContinuitySessionActive");

  objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIgnoreEventsForContinuitySession:", v3);

  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if ((_DWORD)v3)
      v6 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[AXBHardwareManager _updateForContinuityStateChange]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, "%s isContinuitySessionActive: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (id)_stickyKeysClient
{
  AXUIClient *stickyKeysClient;
  AXUIClient *v4;
  AXUIClient *v5;

  stickyKeysClient = self->_stickyKeysClient;
  if (!stickyKeysClient)
  {
    v4 = (AXUIClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDFF8F0]), "initWithIdentifier:serviceBundleName:", CFSTR("AXBHardwareManager"), CFSTR("StickyKeys"));
    v5 = self->_stickyKeysClient;
    self->_stickyKeysClient = v4;

    -[AXUIClient setDelegate:](self->_stickyKeysClient, "setDelegate:", self);
    stickyKeysClient = self->_stickyKeysClient;
  }
  return stickyKeysClient;
}

- (void)_stickyKeysEnabledChanged
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stickyKeysEnabled");

  if ((v4 & 1) == 0)
    -[AXBHardwareManager _notifyServerStickyKeysDisabled](self, "_notifyServerStickyKeysDisabled");
  if (-[AXBHardwareManager shouldNotUpdateHIDClientForNextStickyKeysEnabledChange](self, "shouldNotUpdateHIDClientForNextStickyKeysEnabledChange"))
  {
    -[AXBHardwareManager setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:](self, "setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:", 0);
  }
  else
  {
    -[AXBHardwareManager _updateEventTap](self, "_updateEventTap");
  }
}

- (void)_notifyServerStickyKeysToggledViaShift
{
  void *v2;
  id v3;

  -[AXBHardwareManager _stickyKeysClient](self, "_stickyKeysClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, 10000, v2, &__block_literal_global_231);

}

uint64_t __60__AXBHardwareManager__notifyServerStickyKeysToggledViaShift__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
    return _AXLogWithFacility();
  return result;
}

- (void)_notifyServerStickyKeysDisabled
{
  void *v2;
  id v3;

  -[AXBHardwareManager _stickyKeysClient](self, "_stickyKeysClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, 10001, v2, &__block_literal_global_234);

}

uint64_t __53__AXBHardwareManager__notifyServerStickyKeysDisabled__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
    return _AXLogWithFacility();
  return result;
}

- (void)_notifyServerStickyKeyUpdatedForKeycode:(unsigned __int16)a3 usagePage:(unsigned int)a4 down:(BOOL)a5 up:(BOOL)a6 locked:(BOOL)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v18[3] = *MEMORY[0x24BDAC8D0];
  v9 = 1;
  if (!a6)
    v9 = 2;
  if (a5)
    v10 = 0;
  else
    v10 = v9;
  -[AXBHardwareManager _stickyKeysClient](self, "_stickyKeysClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *MEMORY[0x24BE003F8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v17[1] = *MEMORY[0x24BE00400];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  v17[2] = *MEMORY[0x24BE003F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v15, 10002, v16, &__block_literal_global_237_1);

}

uint64_t __87__AXBHardwareManager__notifyServerStickyKeyUpdatedForKeycode_usagePage_down_up_locked___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
    return _AXLogWithFacility();
  return result;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__AXBHardwareManager_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke;
  block[3] = &unk_250187618;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __80__AXBHardwareManager_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (NSString)eventTapIdentifier
{
  return self->_eventTapIdentifier;
}

- (void)setEventTapIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldNotUpdateHIDClientForNextStickyKeysEnabledChange
{
  return self->_shouldNotUpdateHIDClientForNextStickyKeysEnabledChange;
}

- (void)setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:(BOOL)a3
{
  self->_shouldNotUpdateHIDClientForNextStickyKeysEnabledChange = a3;
}

- (OS_dispatch_queue)springboardContinuityCheckQueue
{
  return self->_springboardContinuityCheckQueue;
}

- (void)setSpringboardContinuityCheckQueue:(id)a3
{
  objc_storeStrong((id *)&self->_springboardContinuityCheckQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springboardContinuityCheckQueue, 0);
  objc_storeStrong((id *)&self->_eventTapIdentifier, 0);
  objc_storeStrong((id *)&self->_stickyKeysClient, 0);
}

@end
