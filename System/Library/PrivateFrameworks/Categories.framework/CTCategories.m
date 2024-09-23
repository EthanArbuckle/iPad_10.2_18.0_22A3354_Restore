@implementation CTCategories

+ (id)systemUnblockableBundleIdentifiersForDeviceFamily:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.systempreferences"), CFSTR("com.apple.finder"), CFSTR("com.apple.Home"), CFSTR("com.apple.appleseed.FeedbackAssistant"), CFSTR("com.apple.SpotlightService"), CFSTR("com.apple.dock"), CFSTR("com.apple.Siri"), CFSTR("com.apple.exposelauncher"), CFSTR("com.apple.launchpad.launcher"), CFSTR("com.apple.RaftCode-3"), CFSTR("com.apple.AccessibilityInspector"), CFSTR("com.apple.ScreenTimeWidgetApplication"), 0);
      goto LABEL_18;
    case 2:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.mobilephone"), CFSTR("com.apple.Preferences"), CFSTR("com.apple.TapToRadar"), CFSTR("com.apple.appleseed.FeedbackAssistant"), CFSTR("com.apple.Bridge"), CFSTR("com.apple.Home"), CFSTR("com.apple.Health"), CFSTR("com.apple.compass"), 0, v17, v18, v19, v20);
      goto LABEL_18;
    case 5:
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 6:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.NanoPhone"), CFSTR("com.apple.NanoSettings"), CFSTR("com.apple.TapToRadar.watchkitapp"), CFSTR("com.apple.NanoHome"), CFSTR("com.apple.NanoCompass.watchkitapp"), CFSTR("com.apple.NanoSleep.watchkitapp"), CFSTR("com.apple.NanoNowPlaying"), 0, v16, v17, v18, v19, v20);
LABEL_18:
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    default:
      if (a3 == 101)
      {
        objc_msgSend(a1, "systemUnblockableBundleIdentifiersForDeviceFamily:", objc_msgSend(a1, "currentIOSDevice"));
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v6 = v5;
        v5 = (void *)v13;
      }
      else
      {
        if (a3 != 102)
          return v5;
        objc_msgSend(a1, "systemUnblockableBundleIdentifiersForDeviceFamily:", 2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemUnblockableBundleIdentifiersForDeviceFamily:", 6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemUnblockableBundleIdentifiersForDeviceFamily:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemUnblockableBundleIdentifiersForDeviceFamily:", 5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v6)
          objc_msgSend(v10, "unionSet:", v6);
        if (v7)
          objc_msgSend(v11, "unionSet:", v7);
        if (v8)
          objc_msgSend(v11, "unionSet:", v8);
        if (v9)
          objc_msgSend(v11, "unionSet:", v9);
        if (v11)
        {
          v12 = v11;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v12;

        v5 = v15;
      }

      return v5;
  }
}

+ (id)systemBlockableBundleIdentifiersForDeviceFamily:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.clock"), CFSTR("com.apple.Safari"), CFSTR("com.apple.ist.Radar7"), CFSTR("com.apple.SystemProfiler"), CFSTR("com.apple.DemoWebBrowser"), 0, v16, v17, v18, v19, v20, v21);
      goto LABEL_18;
    case 2:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.mobiletimer"), CFSTR("com.apple.Passbook"), CFSTR("com.apple.findmy"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.Fitness"), CFSTR("com.apple.DocumentsApp"), CFSTR("com.apple.mobileme.fmip1"), CFSTR("com.apple.mobileme.fmf1"), CFSTR("com.apple.DemoWebBrowser"), 0, v20, v21);
      goto LABEL_18;
    case 5:
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 6:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.HeartRate"), CFSTR("com.apple.NanoHeartRhythm"), CFSTR("com.apple.ActivityMonitorApp"), CFSTR("com.apple.NanoAlarm"), CFSTR("com.apple.DeepBreathing"), CFSTR("com.apple.NanoStopwatch"), CFSTR("com.apple.private.NanoTimer"), CFSTR("com.apple.NanoWorldClock"), CFSTR("com.apple.NanoPassbook"), CFSTR("com.apple.findmy"), CFSTR("com.apple.mobileme.fmf1.watchkitapp"), 0);
LABEL_18:
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    default:
      if (a3 == 101)
      {
        objc_msgSend(a1, "systemBlockableBundleIdentifiersForDeviceFamily:", objc_msgSend(a1, "currentIOSDevice"));
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v6 = v5;
        v5 = (void *)v13;
      }
      else
      {
        if (a3 != 102)
          return v5;
        objc_msgSend(a1, "systemBlockableBundleIdentifiersForDeviceFamily:", 2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemBlockableBundleIdentifiersForDeviceFamily:", 6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemBlockableBundleIdentifiersForDeviceFamily:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemBlockableBundleIdentifiersForDeviceFamily:", 5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v6)
          objc_msgSend(v10, "unionSet:", v6);
        if (v7)
          objc_msgSend(v11, "unionSet:", v7);
        if (v8)
          objc_msgSend(v11, "unionSet:", v8);
        if (v9)
          objc_msgSend(v11, "unionSet:", v9);
        if (v11)
        {
          v12 = v11;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v12;

        v5 = v15;
      }

      return v5;
  }
}

+ (id)systemHiddenBundleIdentifiersForDeviceFamily:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.SetupAssistant"), CFSTR("com.apple.MigrateAssistant"), CFSTR("com.apple.VoiceOverUtility"), CFSTR("com.apple.SoftwareUpdate"), CFSTR("com.apple.installer"), CFSTR("com.apple.bni.AppleNetInstall"), CFSTR("com.apple.InstallAssistant.Seed.macOS1015Seed1"), CFSTR("com.apple.InstallAssistant.Catalina"), CFSTR("com.apple.InstallAssistant.Jazz"), CFSTR("com.apple.InstallAssistant.macOS1016"), CFSTR("com.apple.siri"), CFSTR("com.apple.siri.launcher"), CFSTR("com.apple.Installer-Progress"), CFSTR("com.apple.dt.XcodePreviews"), CFSTR("com.apple.PreviewShellMac"), CFSTR("com.apple.keychainaccess"), CFSTR("com.apple.quicklook.QuickLook"),
        CFSTR("com.apple.VNCGuestRequest"),
        CFSTR("com.apple.screencaptureui"),
        CFSTR("com.apple.quicklook.QuickLookUIService"),
        CFSTR("com.apple.AvatarUI.AvatarPickerMemojiEditor"),
        CFSTR("com.apple.ScreenSaver.Engine.legacyScreenSaver"),
        CFSTR("com.apple.Trackpad-Settings.extension"),
        CFSTR("com.apple.BTMNotificationAgent"),
        CFSTR("com.apple.notificationcenter.askpermissions"),
        CFSTR("com.apple.controlcenter.notifications.focus"),
        CFSTR("com.apple.Mouse-Settings.extension"),
        0);
      goto LABEL_18;
    case 2:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.purplebuddy"), CFSTR("com.apple.SOSBuddy"), CFSTR("com.apple.ChargingViewService"), CFSTR("com.apple.Magnifier"), CFSTR("com.apple.InCallService"), CFSTR("com.apple.sidecar"), CFSTR("com.apple.webapp"), CFSTR("com.apple.BarcodeScanner"), CFSTR("com.apple.assistivetouchd"), CFSTR("com.apple.SiriNCService"), CFSTR("com.apple.SleepLockScreen"), CFSTR("com.apple.fullkeyboardaccess"), CFSTR("com.apple.BluetoothUIService"), CFSTR("com.apple.CarPlayTemplateUIHost"), CFSTR("com.apple.commandandcontrol"), CFSTR("com.apple.DeviceOMatic"), CFSTR("com.apple.EscrowSecurityAlert"),
        CFSTR("com.apple.SharingViewService"),
        CFSTR("com.apple.PeopleViewService"),
        CFSTR("com.apple.PosterBoard"),
        CFSTR("com.apple.PreviewShell"),
        CFSTR("com.apple.Memoji"),
        0,
        v28,
        v29,
        v30,
        v31,
        v32);
      goto LABEL_18;
    case 5:
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 6:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.nanobuddy"), CFSTR("com.apple.clockface"), CFSTR("com.apple.NanoDemo"), CFSTR("com.apple.PreBoard"), CFSTR("com.apple.ReBoard"), CFSTR("com.apple.NanoSafari"), CFSTR("com.apple.PreviewShell"), CFSTR("com.apple.Mandrake"), 0, v14, v15, v16, v17, v18, v19, v20, v21,
        v22,
        v23,
        v24,
        v25,
        v26,
        v27,
        v28,
        v29,
        v30,
        v31,
        v32);
LABEL_18:
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    default:
      if (a3 == 101)
      {
        objc_msgSend(a1, "systemHiddenBundleIdentifiersForDeviceFamily:", objc_msgSend(a1, "currentIOSDevice"));
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v12 = (void *)v11;
      }
      else if (a3 == 102)
      {
        objc_msgSend(a1, "systemHiddenBundleIdentifiersForDeviceFamily:", 2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemHiddenBundleIdentifiersForDeviceFamily:", 6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemHiddenBundleIdentifiersForDeviceFamily:", 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "systemHiddenBundleIdentifiersForDeviceFamily:", 5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v4)
          objc_msgSend(v8, "unionSet:", v4);
        if (v5)
          objc_msgSend(v9, "unionSet:", v5);
        if (v6)
          objc_msgSend(v9, "unionSet:", v6);
        if (v7)
          objc_msgSend(v9, "unionSet:", v7);
        if (v9)
        {
          v10 = v9;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v10;

      }
      else
      {
        v12 = 0;
      }
      return v12;
  }
}

+ (void)initialize
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  NSObject *v7;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.framework.ctcategories.bundle-id-categories", v2);
  v4 = (void *)_bundle_queue;
  _bundle_queue = (uint64_t)v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("com.apple.framework.ctcategories.domain-categories", v7);
  v6 = (void *)_domain_queue;
  _domain_queue = (uint64_t)v5;

}

- (CTCategories)init
{
  CTCategories *v2;
  NSLock *v3;
  NSLock *lookupLock;
  _QWORD block[4];
  CTCategories *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTCategories;
  v2 = -[CTCategories init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lookupLock = v2->_lookupLock;
    v2->_lookupLock = v3;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __20__CTCategories_init__block_invoke;
    block[3] = &unk_24C1BBC58;
    v7 = v2;
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, block);

  }
  return v2;
}

void __20__CTCategories_init__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__emptySharedCache_, CTCategoriesDidChangeNotification, 0);

}

- (void)dealloc
{
  objc_super v3;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__CTCategories_dealloc__block_invoke;
  block[3] = &unk_24C1BBC58;
  block[4] = self;
  if (dealloc_onceToken != -1)
    dispatch_once(&dealloc_onceToken, block);
  v3.receiver = self;
  v3.super_class = (Class)CTCategories;
  -[CTCategories dealloc](&v3, sel_dealloc);
}

void __23__CTCategories_dealloc__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CTCategoriesDidChangeNotification, 0);

}

+ (CTCategories)sharedCategories
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__CTCategories_sharedCategories__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCategories_onceToken != -1)
    dispatch_once(&sharedCategories_onceToken, block);
  return (CTCategories *)(id)ctSharedInstance;
}

void __32__CTCategories_sharedCategories__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)ctSharedInstance;
  ctSharedInstance = (uint64_t)v1;
  v5 = v1;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v4 = (void *)_ctSharedCache;
  _ctSharedCache = (uint64_t)v3;

}

- (void)emptyCache
{
  -[CTCategories _emptySharedCache:](self, "_emptySharedCache:", 0);
}

- (void)_emptySharedCache:(id)a3
{
  -[NSLock lock](self->_lookupLock, "lock", a3);
  objc_msgSend((id)_ctSharedCache, "removeAllObjects");
  -[NSLock unlock](self->_lookupLock, "unlock");
}

- (NSArray)availableCategoryIDs
{
  void *v2;
  void *v3;

  +[CTCategory _DHIDtoCategoryDisplayNameMap](CTCategory, "_DHIDtoCategoryDisplayNameMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)bundleIDForPlatform:(id)a3 fromBundleID:(id)a4 platform:(id)a5
{
  return +[CTCategory bundleIDForPlatform:fromBundleID:platform:](CTCategory, "bundleIDForPlatform:fromBundleID:platform:", a3, a4, a5);
}

- (void)categoryForBundleID:(id)a3 platform:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v16[0] = a3;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__CTCategories_categoryForBundleID_platform_completionHandler___block_invoke;
  v14[3] = &unk_24C1BBCA0;
  v15 = v8;
  v13 = v8;
  -[CTCategories categoriesForBundleIDs:platform:completionHandler:](self, "categoriesForBundleIDs:platform:completionHandler:", v12, v10, v14);

}

void __63__CTCategories_categoryForBundleID_platform_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(a2, "allValues");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

- (void)categoryForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v13[0] = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__CTCategories_categoryForBundleID_completionHandler___block_invoke;
  v11[3] = &unk_24C1BBCA0;
  v12 = v6;
  v10 = v6;
  -[CTCategories categoriesForBundleIDs:platform:completionHandler:](self, "categoriesForBundleIDs:platform:completionHandler:", v9, CFSTR("CTOSPlatformAll"), v11);

}

void __54__CTCategories_categoryForBundleID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(a2, "allValues");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

- (void)categoriesForBundleIDs:(id)a3 platform:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CTCategories *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  _QWORD v20[4];
  id v21;
  CTCategories *v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  v29 = 0;
  v14 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke;
  v25[3] = &unk_24C1BBCC8;
  v15 = v13;
  v26 = v15;
  v16 = v12;
  v27 = v16;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v25);
  if (objc_msgSend(v16, "count"))
  {
    v17 = (__CFString *)v9;
    v18 = v17;
    if (v17 == CFSTR("CTOSPlatformCurrent"))
      v19 = CFSTR("CTOSPlatformiOS");
    else
      v19 = v17;
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke_2;
    v20[3] = &unk_24C1BBD18;
    v21 = v15;
    v24 = v28;
    v22 = v11;
    v23 = v10;
    +[CTCategory categoryForBundleIdentifiers:platform:withCompletionHandler:](CTCategory, "categoryForBundleIdentifiers:platform:withCompletionHandler:", v16, v18, v20);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v10 + 2))(v10, v15, 0);
  }

  _Block_object_dispose(v28, 8);
}

void __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_msgSend((id)_ctSharedCache, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v5);
  }
  else
  {
    v4 = *(id *)(a1 + 40);
    objc_sync_enter(v4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  objc_sync_exit(v4);

}

void __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  v5 = a3;
  if (!v11 || v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_QWORD *)(v7 + 40))
      goto LABEL_7;
    v8 = v5;
    v6 = *(id *)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v11);
    objc_sync_exit(v6);
  }

LABEL_7:
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke_3;
    v12[3] = &unk_24C1BBCF0;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    v10 = 0;
  else
    v10 = *(_QWORD *)(a1 + 32);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v10);

}

uint64_t __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "lock");
  objc_msgSend((id)_ctSharedCache, "setObject:forKey:", v6, v7);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
}

- (void)categoriesForBundleIDs:(id)a3 completionHandler:(id)a4
{
  -[CTCategories categoriesForBundleIDs:platform:completionHandler:](self, "categoriesForBundleIDs:platform:completionHandler:", a3, CFSTR("CTOSPlatformAll"), a4);
}

- (void)categoryForDomainName:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v13[0] = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__CTCategories_categoryForDomainName_completionHandler___block_invoke;
  v11[3] = &unk_24C1BBCA0;
  v12 = v6;
  v10 = v6;
  -[CTCategories categoriesForDomainNames:completionHandler:](self, "categoriesForDomainNames:completionHandler:", v9, v11);

}

void __56__CTCategories_categoryForDomainName_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(a2, "allValues");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

- (void)categoryForDomainURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v13[0] = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__CTCategories_categoryForDomainURL_completionHandler___block_invoke;
  v11[3] = &unk_24C1BBCA0;
  v12 = v6;
  v10 = v6;
  -[CTCategories categoriesForDomainURLs:completionHandler:](self, "categoriesForDomainURLs:completionHandler:", v9, v11);

}

void __55__CTCategories_categoryForDomainURL_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(a2, "allValues");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

- (void)categoriesForDomainNames:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CTCategories *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  CTCategories *v22;
  id v23;
  _BYTE *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t v28[4];
  uint64_t v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CTCategories categoriesForDomainNames:completionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "START %s :: %ld", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke;
  v25[3] = &unk_24C1BBCC8;
  v12 = v10;
  v26 = v12;
  v13 = v9;
  v27 = v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
  v14 = objc_msgSend(v13, "count");
  v15 = MEMORY[0x24BDACB70];
  v16 = MEMORY[0x24BDACB70];
  v17 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v17)
    {
      v18 = objc_msgSend(v13, "count");
      *(_DWORD *)v28 = 134217984;
      v29 = v18;
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "categoriesForDomainNames unCachedDomains :%lu", v28, 0xCu);
    }

    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke_33;
    v20[3] = &unk_24C1BBD18;
    v21 = v12;
    v24 = buf;
    v22 = v8;
    v23 = v7;
    +[CTCategory categoryForDomainNames:withCompletionHandler:](CTCategory, "categoryForDomainNames:withCompletionHandler:", v6, v20);

  }
  else
  {
    if (v17)
    {
      v19 = objc_msgSend(v12, "count");
      *(_DWORD *)v28 = 134217984;
      v29 = v19;
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DONE categoriesForDomainNames cachedCategories :%lu", v28, 0xCu);
    }

    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v12, 0);
  }

  _Block_object_dispose(buf, 8);
}

void __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_msgSend((id)_ctSharedCache, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v5);
  }
  else
  {
    v4 = *(id *)(a1 + 40);
    objc_sync_enter(v4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  objc_sync_exit(v4);

}

void __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_QWORD *)(v7 + 40))
      goto LABEL_7;
    v8 = v6;
    v9 = *(id *)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v5);
    objc_sync_exit(v9);
  }

LABEL_7:
  if (*(_QWORD *)(a1 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134217984;
      v17 = v10;
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "_ctSharedCache add %lu", buf, 0xCu);
    }
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke_34;
    v14[3] = &unk_24C1BBCF0;
    v11 = *(void **)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v17 = v12;
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DONE categoriesForDomainNames :%lu", buf, 0xCu);
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    v13 = 0;
  else
    v13 = *(_QWORD *)(a1 + 32);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v13);

}

uint64_t __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "lock");
  objc_msgSend((id)_ctSharedCache, "setObject:forKey:", v6, v7);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
}

- (void)categoriesForDomainURLs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CTCategories *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  CTCategories *v22;
  id v23;
  _BYTE *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t v28[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CTCategories categoriesForDomainURLs:completionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "START %s :: %ld", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke;
  v25[3] = &unk_24C1BBD40;
  v12 = v10;
  v26 = v12;
  v13 = v9;
  v27 = v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
  v14 = objc_msgSend(v13, "count");
  v15 = MEMORY[0x24BDACB70];
  v16 = MEMORY[0x24BDACB70];
  v17 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v17)
    {
      v18 = objc_msgSend(v13, "count");
      *(_DWORD *)v28 = 134217984;
      v29 = (const char *)v18;
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "categoriesForDomainURLs unCachedDomainURLs :%lu", v28, 0xCu);
    }

    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke_36;
    v20[3] = &unk_24C1BBD18;
    v21 = v12;
    v24 = buf;
    v22 = v8;
    v23 = v7;
    +[CTCategory categoryForDomainURLs:withCompletionHandler:](CTCategory, "categoryForDomainURLs:withCompletionHandler:", v13, v20);

  }
  else
  {
    if (v17)
    {
      v19 = objc_msgSend(v12, "count");
      *(_DWORD *)v28 = 136315394;
      v29 = "-[CTCategories categoriesForDomainURLs:completionHandler:]";
      v30 = 2048;
      v31 = v19;
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DONE %s :: cachedCategories %lu", v28, 0x16u);
    }

    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v12, 0);
  }

  _Block_object_dispose(buf, 8);
}

void __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)_ctSharedCache, "objectForKey:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (id)v4;
      v6 = *(id *)(a1 + 32);
      objc_sync_enter(v6);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v7);
      objc_sync_exit(v6);

    }
    else
    {
      v5 = *(id *)(a1 + 40);
      objc_sync_enter(v5);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      objc_sync_exit(v5);
    }

  }
}

void __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_QWORD *)(v7 + 40))
      goto LABEL_7;
    v8 = v6;
    v9 = *(id *)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v5);
    objc_sync_exit(v9);
  }

LABEL_7:
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke_2;
    v12[3] = &unk_24C1BBD68;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 136315394;
    v15 = "-[CTCategories categoriesForDomainURLs:completionHandler:]_block_invoke";
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DONE %s :: %lu", buf, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "lock");
  v8 = (void *)_ctSharedCache;
  objc_msgSend(v7, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v6, v9);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
}

- (void)unCategorizedDomainsFromDomains:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id obj;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t *v21;
  _QWORD block[5];
  id v23;
  dispatch_group_t v24;
  uint8_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "domainOfType:fromDomains:withCompletionHandler:", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = dispatch_group_create();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        dispatch_group_enter(v8);
        v13 = _domain_queue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke;
        block[3] = &unk_24C1BBDB8;
        block[4] = v12;
        v23 = v7;
        v25 = buf;
        v24 = v8;
        dispatch_group_async(v24, v13, block);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v9);
  }

  v14 = _domain_queue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke_3;
  v18[3] = &unk_24C1BBDE0;
  v20 = v6;
  v21 = buf;
  v19 = v7;
  v15 = v7;
  v16 = v6;
  dispatch_group_notify(v8, v14, v18);

  _Block_object_dispose(buf, 8);
}

void __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  __int128 v10;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_24C1BBD90;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v10 = v6;
  +[CTCategory _getCategoryTypeForDomainName:withCompletionHandler:](CTCategory, "_getCategoryTypeForDomainName:withCompletionHandler:", v2, v7);

}

void __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (a2 == 5001 && !v5)
  {
    v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v6);
LABEL_6:

    goto LABEL_7;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_QWORD *)(v7 + 40))
  {
    v8 = v5;
    v6 = *(id *)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
    goto LABEL_6;
  }
LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[5];
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    v3 = 0;
  else
    v3 = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

+ (id)supportedWebBrowserBundleIdentifiersForDeviceFamily:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.Safari"), CFSTR("com.apple.DemoWebBrowser"), 0);
      goto LABEL_16;
    case 2:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.DemoWebBrowser"), 0);
LABEL_16:
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 5:
    case 6:
      v10 = objc_opt_new();
      goto LABEL_17;
    default:
      if (a3 == 101)
      {
        objc_msgSend(a1, "supportedWebBrowserBundleIdentifiersForDeviceFamily:", objc_msgSend(a1, "currentIOSDevice"));
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v9 = (void *)v10;
      }
      else if (a3 == 102)
      {
        objc_msgSend(a1, "supportedWebBrowserBundleIdentifiersForDeviceFamily:", 2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "supportedWebBrowserBundleIdentifiersForDeviceFamily:", 6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "supportedWebBrowserBundleIdentifiersForDeviceFamily:", 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "supportedWebBrowserBundleIdentifiersForDeviceFamily:", 5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_opt_new();
        v9 = v8;
        if (v4)
          objc_msgSend(v8, "unionSet:", v4);
        if (v5)
          objc_msgSend(v9, "unionSet:", v5);
        if (v6)
          objc_msgSend(v9, "unionSet:", v6);
        if (v7)
          objc_msgSend(v9, "unionSet:", v7);

      }
      else
      {
        v9 = 0;
      }
      return v9;
  }
}

+ (int64_t)currentIOSDevice
{
  void *v2;
  int64_t v3;

  v2 = (void *)MGCopyAnswer();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
  {
    v3 = 4;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("iPod touch")))
  {
    v3 = 3;
  }
  else
  {
    v3 = 2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupLock, 0);
  objc_storeStrong((id *)&self->_indexVersionId, 0);
}

@end
