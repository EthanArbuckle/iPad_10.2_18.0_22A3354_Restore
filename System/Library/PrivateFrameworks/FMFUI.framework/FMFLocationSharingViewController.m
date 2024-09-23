@implementation FMFLocationSharingViewController

- (FMFLocationSharingViewController)init
{
  FMFLocationSharingViewController *v2;
  NSString *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *specifiersQueue;
  uint64_t v7;
  NSArray *followersSpecifiers;
  uint64_t v9;
  NSArray *familySpecifiers;
  uint64_t v11;
  NSArray *deviceSpecifiers;
  uint64_t v13;
  NSMutableDictionary *dsidToFamilyPhoto;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FMFLocationSharingViewController;
  v2 = -[FMFLocationSharingViewController init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    v2->_isAccessibilitySize = UIContentSizeCategoryIsAccessibilityCategory(v3);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.icloud.fmfui.fmflocationsharingviewcontroller.specifiersqueue", v4);
    specifiersQueue = v2->_specifiersQueue;
    v2->_specifiersQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    followersSpecifiers = v2->_followersSpecifiers;
    v2->_followersSpecifiers = (NSArray *)v7;

    v9 = objc_opt_new();
    familySpecifiers = v2->_familySpecifiers;
    v2->_familySpecifiers = (NSArray *)v9;

    v11 = objc_opt_new();
    deviceSpecifiers = v2->_deviceSpecifiers;
    v2->_deviceSpecifiers = (NSArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    dsidToFamilyPhoto = v2->_dsidToFamilyPhoto;
    v2->_dsidToFamilyPhoto = (NSMutableDictionary *)v13;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_fmipStateChangeNotificationReceived, (CFStringRef)*MEMORY[0x24BE31CE0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v2;
}

- (BOOL)useFamilyCirclePhotos
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)FMFLocationSharingViewController;
  -[FMFLocationSharingViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMFLocationSharingViewController;
  -[FMFLocationSharingViewController viewDidLoad](&v9, sel_viewDidLoad);
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DD58000, v3, OS_LOG_TYPE_DEFAULT, "FMFLocationSharingViewController: viewDidLoad", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("APP_NAME_TITLE"), &stru_24C878158, CFSTR("LocalizableUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocationSharingViewController setTitle:](self, "setTitle:", v5);

  -[FMFLocationSharingViewController specifiersQueue](self, "specifiersQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__FMFLocationSharingViewController_viewDidLoad__block_invoke;
  block[3] = &unk_24C877CC8;
  block[4] = self;
  dispatch_async(v6, block);

}

void __47__FMFLocationSharingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", v1);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMFLocationSharingViewController;
  -[FMFLocationSharingViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20DD58000, v4, OS_LOG_TYPE_DEFAULT, "FMFLocationSharingViewController: viewWillAppear", v8, 2u);
  }

  objc_msgSend(MEMORY[0x24BE2FE38], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startMonitoring");

  -[FMFLocationSharingViewController updateFindMyDeviceStatus](self, "updateFindMyDeviceStatus");
  -[FMFLocationSharingViewController _loadFamilyMembers:](self, "_loadFamilyMembers:", 0);
  -[FMFLocationSharingViewController reloadSpecifiers](self, "reloadSpecifiers");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_contactStoreDidChange_, CFSTR("ContactStoreDidChange"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_updateFindMyDeviceStatus, CFSTR("FMFFindMyDeviceStateChanged"), 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMFLocationSharingViewController;
  -[FMFLocationSharingViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DD58000, v4, OS_LOG_TYPE_DEFAULT, "FMFLocationSharingViewController: viewDidAppear", v5, 2u);
  }

  -[FMFLocationSharingViewController emitNavigationEvent](self, "emitNavigationEvent");
}

- (void)emitNavigationEvent
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.AppleAccount/LOCATION_SHARING"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithKey:table:locale:bundleURL:", CFSTR("Find My"), 0, v5, v7);

  v9 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithKey:table:locale:bundleURL:", CFSTR("Apple Account"), 0, v10, v12);

  v15[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocationSharingViewController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.findmy"), v8, v14, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMFLocationSharingViewController;
  -[FMFLocationSharingViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("ContactStoreDidChange"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("FMFFindMyDeviceStateChanged"), 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMFLocationSharingViewController;
  -[FMFLocationSharingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BE2FE38], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitoring");

}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x24BE2FED0], "FMFAllowed"))
  {
    if (-[FMFLocationSharingViewController areSpecifiersLoaded](self, "areSpecifiersLoaded"))
    {
      -[FMFLocationSharingViewController _findMyDeviceSpecifiers](self, "_findMyDeviceSpecifiers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v4);

      -[FMFLocationSharingViewController deviceSpecifiers](self, "deviceSpecifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v5);

      -[FMFLocationSharingViewController familySpecifiers](self, "familySpecifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v6);

      -[FMFLocationSharingViewController followersSpecifiers](self, "followersSpecifiers");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[FMFLocationSharingViewController areMeDeviceInfoLoaded](self, "areMeDeviceInfoLoaded"))
      {
        -[FMFLocationSharingViewController _findMyDeviceSpecifiers](self, "_findMyDeviceSpecifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        -[FMFLocationSharingViewController deviceSpecifiers](self, "deviceSpecifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 15, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);
        objc_msgSend(v3, "addObject:", v11);

        goto LABEL_9;
      }
      -[FMFLocationSharingViewController _defaultSpecifiers](self, "_defaultSpecifiers");
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[FMFLocationSharingViewController _findMyDeviceSpecifiers](self, "_findMyDeviceSpecifiers");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;
  objc_msgSend(v3, "addObjectsFromArray:", v7);
LABEL_9:

  LogCategory_Daemon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_20DD58000, v12, OS_LOG_TYPE_DEFAULT, "FMFLocationSharingViewController: specifiers to show %ld", buf, 0xCu);
  }

  v13 = (int)*MEMORY[0x24BE756E0];
  v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v13);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)v3;
  v15 = v3;

  v16 = *(id *)((char *)&self->super.super.super.super.super.isa + v13);
  return v16;
}

- (void)_loadFamilyMembers:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[FMFLocationSharingViewController specifiersQueue](self, "specifiersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke;
  v6[3] = &unk_24C877D40;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

void __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;
  char v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2FE68]), "initWithDescription:andTimeout:", CFSTR("family-follower-display"), 2.0);
  v3 = objc_alloc_init(MEMORY[0x24BE30A88]);
  objc_msgSend(v3, "setForceServerFetch:", *(unsigned __int8 *)(a1 + 40));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_2;
  v6[3] = &unk_24C877D18;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  v6[4] = v4;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v3, "startRequestWithCompletionHandler:", v6);
  objc_msgSend(v5, "wait");

}

void __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_2_cold_1();

  }
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "members");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v9;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_20DD58000, v8, OS_LOG_TYPE_DEFAULT, "Family members received: %@ in circle: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "members");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v5, "members");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_61;
    v21 = &unk_24C877CF0;
    v14 = v10;
    v22 = v14;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v18);

    objc_msgSend(v14, "valueForKey:", CFSTR("hashedDSID"), v18, v19, v20, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setHashedFamilyDsids:", v15);

  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("appleID"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortUsingDescriptors:", v17);

  objc_msgSend(*(id *)(a1 + 32), "setFamilyMembers:", v10);
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "useFamilyCirclePhotos"))
    objc_msgSend(*(id *)(a1 + 32), "_loadFamilyMemberPhotos");
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersOnMainQueue");
  objc_msgSend(*(id *)(a1 + 40), "signal");

}

void __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "appleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_20DD58000, v4, OS_LOG_TYPE_DEFAULT, "Family member received: %@", (uint8_t *)&v6, 0xCu);

  }
  if ((objc_msgSend(v3, "isMe") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)_loadFamilyMemberPhotos
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id obj;
  _QWORD v14[8];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[FMFLocationSharingViewController familyMembers](self, "familyMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "count");
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x24BE30A90]);
        objc_msgSend(v9, "dsid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithFamilyMemberDSID:size:localFallback:", v11, 1, 1);

        objc_msgSend(v12, "setMonogramDiameter:", 36.0);
        objc_msgSend(v12, "setBackgroundType:", 1);
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __59__FMFLocationSharingViewController__loadFamilyMemberPhotos__block_invoke;
        v14[3] = &unk_24C877D68;
        v14[4] = self;
        v14[5] = v9;
        v14[6] = v19;
        v14[7] = v5;
        objc_msgSend(v12, "startRequestWithCompletionHandler:", v14);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v6);
  }

  _Block_object_dispose(v19, 8);
}

void __59__FMFLocationSharingViewController__loadFamilyMemberPhotos__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = a4;
  if (v12 && objc_msgSend(v12, "length"))
  {
    v7 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    objc_msgSend(v7, "imageWithData:scale:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "dsidToFamilyPhoto");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "dsid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    }
  }
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == *(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersOnMainQueue");

}

- (void)_loadSpecifiers
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke;
  v4[3] = &unk_24C877E30;
  v4[4] = self;
  objc_msgSend(v3, "getActiveLocationSharingDevice:", v4);

}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v3 = a2;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v6 = *MEMORY[0x24BDF7DE0];
  objc_msgSend(*(id *)(a1 + 32), "specifiersQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_2;
  v10[3] = &unk_24C877E08;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v8;
  v14 = IsAccessibilityCategory;
  v13 = v6;
  v9 = v3;
  dispatch_async(v7, v10);

}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  char v48;
  _QWORD block[5];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(MEMORY[0x24BE2FED0], "FMFRestricted") ^ 1;
  if ((objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled") & 1) != 0
    || (objc_msgSend(v5, "isThisDevice") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("SHARE_MY_LOCATION_FOOTER");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("SHARE_FOOTER_LOC_SVCS_OFF");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24C878158, CFSTR("LocalizableUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setProperty:forKey:", v10, *MEMORY[0x24BE75A68]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARE_MY_LOCATION"), &stru_24C878158, CFSTR("LocalizableUI"));
  v12 = objc_claimAutoreleasedReturnValue();

  v45 = (void *)v12;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, *(_QWORD *)(a1 + 40), sel__setShareSwitchEnabled_forSpecifier_, sel__shareSwitchEnabled_, 0, 6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BE75A18];
  v44 = v13;
  objc_msgSend(v13, "setProperty:forKey:", v14, *MEMORY[0x24BE75A18]);

  if (objc_msgSend(*(id *)(a1 + 40), "meDeviceChangePending"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v17)
    {
      v18 = v17;
      v42 = v10;
      v43 = v4;
      v19 = v6;
      v20 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v22, "isThisDevice"))
          {
            v23 = v22;

            v5 = v23;
            goto LABEL_16;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v18)
          continue;
        break;
      }
LABEL_16:
      LOBYTE(v6) = v19;
      v10 = v42;
      v4 = v43;
    }

  }
  if (!objc_msgSend(v4, "count"))
  {
    v28 = v46;
    objc_msgSend(v2, "addObject:", v46);
    goto LABEL_35;
  }
  objc_msgSend(v5, "deviceName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = CFSTR("NOT_SELECTED");
    goto LABEL_25;
  }
  if ((objc_msgSend(v5, "isThisDevice") & 1) != 0 || (objc_msgSend(*(id *)(a1 + 40), "meDeviceChangePending") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = CFSTR("THIS_DEVICE_SELECTION");
LABEL_25:
    objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_24C878158, CFSTR("LocalizableUI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_26;
  }
  objc_msgSend(v5, "deviceName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
  if (objc_msgSend(v5, "isAutoMeCapable"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("AND_WATCHES"), &stru_24C878158, CFSTR("LocalizableUI"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, *(_QWORD *)(a1 + 40), 0, 0, 0, -1, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v32, "setProperty:forKey:", v29, CFSTR("ActiveDeviceLinkNameKey"));
  objc_msgSend(v32, "setProperty:forKey:", v31, CFSTR("ActiveDeviceLinkDetailsKey"));
  objc_msgSend(v32, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v15);
  if (*(_BYTE *)(a1 + 56) || v31)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = &unk_24C87E728;
  }
  objc_msgSend(v32, "setProperty:forKey:", v33, *MEMORY[0x24BE75D10]);

  v28 = v46;
  objc_msgSend(v2, "addObject:", v46);
  if (v32)
  {
    objc_msgSend(v2, "addObject:", v32);

  }
LABEL_35:
  if ((objc_msgSend(v5, "isThisDevice") & 1) == 0 && (objc_msgSend(*(id *)(a1 + 40), "meDeviceChangePending") & 1) == 0)
  {
    v34 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("CHANGE_ME_DEVICE"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", v36, &stru_24C878158, CFSTR("LocalizableUI"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v37, *(_QWORD *)(a1 + 40), 0, 0, 0, 13, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v46;
    objc_msgSend(v38, "setButtonAction:", sel_saveActiveDeviceSelection);
    objc_msgSend(v2, "addObject:", v38);

  }
  objc_msgSend(v2, "addObject:", v44);
  objc_msgSend(*(id *)(a1 + 40), "setDeviceSpecifiers:", v2);
  v39 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_98;
  block[3] = &unk_24C877D90;
  block[4] = *(_QWORD *)(a1 + 40);
  v50 = v4;
  v40 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(*(id *)(a1 + 40), "specifiersQueue");
  v41 = objc_claimAutoreleasedReturnValue();
  v47[0] = v39;
  v47[1] = 3221225472;
  v47[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_2_99;
  v47[3] = &unk_24C877D40;
  v47[4] = *(_QWORD *)(a1 + 40);
  v48 = v6;
  dispatch_async(v41, v47);

}

uint64_t __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_98(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMeDevices:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setAreMeDeviceInfoLoaded:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_2_99(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD block[5];
  _QWORD v36[5];
  id v37;
  id v38;
  char v39;
  _QWORD v40[5];
  id v41;
  char v42;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getHandlesFollowingMyLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedFollowersWithCombinedRecords:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAllFollowersHandles:", v7);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FAMILY_HEADER"), &stru_24C878158, CFSTR("LocalizableUI"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FAMILY_FOOTER"), &stru_24C878158, CFSTR("LocalizableUI"));
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v9;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, 0, 0, 0, 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x24BE75A68];
  v34 = (void *)v11;
  objc_msgSend(v13, "setProperty:forKey:", v11);
  objc_msgSend(*(id *)(a1 + 32), "familyMembers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v16 = MEMORY[0x24BDAC760];
  if (v15)
  {
    objc_msgSend(v2, "addObject:", v13);
    objc_msgSend(*(id *)(a1 + 32), "familyMembers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    v40[0] = v16;
    v40[1] = 3221225472;
    v40[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_3;
    v40[3] = &unk_24C877DB8;
    v40[4] = *(_QWORD *)(a1 + 32);
    v42 = *(_BYTE *)(a1 + 40);
    v41 = v2;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v40);

  }
  objc_msgSend(*(id *)(a1 + 32), "setFamilySpecifiers:", v2);
  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allFollowersHandles");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v16;
  v23 = (void *)v21;
  v36[0] = v22;
  v36[1] = 3221225472;
  v36[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_4;
  v36[3] = &unk_24C877DE0;
  v36[4] = *(_QWORD *)(a1 + 32);
  v39 = *(_BYTE *)(a1 + 40);
  v24 = v19;
  v37 = v24;
  v25 = v20;
  v38 = v25;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v36);

  objc_msgSend(*(id *)(a1 + 32), "setFollowersHandles:", v25);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("FOLLOWERS_HEADER"), &stru_24C878158, CFSTR("LocalizableUI"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, 0, 0, 0, 0, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(v3, "addObject:", v28);
    objc_msgSend(v3, "addObjectsFromArray:", v24);
    v29 = v34;
  }
  else
  {
    v29 = v34;
    if (!objc_msgSend(v2, "count") && !objc_msgSend(v24, "count"))
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("NO_FOLLOWERS_HEADER"), &stru_24C878158, CFSTR("LocalizableUI"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setProperty:forKey:", v30, v33);

      objc_msgSend(v3, "addObject:", v32);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setFollowersSpecifiers:", v3);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_5;
  block[3] = &unk_24C877CC8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_specifierForFamilyMember:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v3, *MEMORY[0x24BE75A18]);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hashedFamilyDsids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hashedDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_specifierForHandle:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75A18]);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

  }
}

uint64_t __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAreSpecifiersLoaded:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)_defaultSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHARE_MY_LOCATION_FOOTER"), &stru_24C878158, CFSTR("LocalizableUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v5, *MEMORY[0x24BE75A68]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARE_MY_LOCATION"), &stru_24C878158, CFSTR("LocalizableUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, 0, 6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE75A18];
  v11 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v12, "setProperty:forKey:", v11, v10);
  objc_msgSend(v12, "setProperty:forKey:", &unk_24C87E728, *MEMORY[0x24BE75D10]);
  -[FMFLocationSharingViewController _findMyDeviceSpecifiers](self, "_findMyDeviceSpecifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  if (objc_msgSend(MEMORY[0x24BE2FED0], "FMFAllowed"))
  {
    objc_msgSend(v3, "addObject:", v6);
    objc_msgSend(v3, "addObject:", v9);
    objc_msgSend(v3, "addObject:", v12);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 15, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  return v3;
}

- (id)_findMyDeviceSpecifiers
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FIND_MY_DEVICE_FOOTER"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24C878158, CFSTR("LocalizableUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);
  v8 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FIND_MY_DEVICE_SWITCH"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_24C878158, CFSTR("LocalizableUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, sel__findMyDeviceStatus_, 0, 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setControllerLoadAction:", sel__findMyDeviceSpecifierWasTapped_);
  objc_msgSend(v12, "setIdentifier:", CFSTR("FindMyDevice-Settings"));
  objc_msgSend(v3, "addObject:", v7);
  objc_msgSend(v3, "addObject:", v12);

  return v3;
}

- (id)_findMyDeviceStatus:(id)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = -[FMFLocationSharingViewController isFindMyDeviceOn](self, "isFindMyDeviceOn", a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("FIND_MY_DEVICE_ON");
  else
    v6 = CFSTR("FIND_MY_DEVICE_OFF");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24C878158, CFSTR("LocalizableUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sortedFollowersWithCombinedRecords:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__FMFLocationSharingViewController_sortedFollowersWithCombinedRecords___block_invoke;
  v15[3] = &unk_24C877E58;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);

  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingSelector:", sel_prettyNameCompare_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __71__FMFLocationSharingViewController_sortedFollowersWithCombinedRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifierForHandle:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v5);
  else
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

}

- (BOOL)noMeDeviceSelected:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isActiveDevice", (_QWORD)v10) & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (id)_specifierForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  _BOOL4 IsAccessibilityCategory;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "prettyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  -[FMFLocationSharingViewController monogramForHandle:](self, "monogramForHandle:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75AC8]);

  objc_msgSend(v6, "setControllerLoadAction:", sel__showHandleDetails_);
  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getOfferExpirationForHandle:groupId:callerId:", v4, *MEMORY[0x24BE2FE88], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getOfferExpirationForHandle:groupId:callerId:", v4, *MEMORY[0x24BE2FE98], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getOfferExpirationForHandle:groupId:callerId:", v4, *MEMORY[0x24BE2FE90], 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "laterDate:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "laterDate:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "laterDate:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "compare:", v17) == -1)
  {
    objc_msgSend(v17, "timeIntervalSinceNow");
    -[FMFLocationSharingViewController offerTimeRemaining:](self, "offerTimeRemaining:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v18, *MEMORY[0x24BE75D28]);

  }
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "preferredContentSizeCategory");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v19);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7DE0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = &unk_24C87E728;
  }
  objc_msgSend(v6, "setProperty:forKey:", v21, *MEMORY[0x24BE75D10]);

  return v6;
}

- (id)_specifierForFamilyMember:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FollowerDetailsLinkCell *v20;
  id v21;
  FollowerDetailsLinkCell *v22;
  id v23;
  _QWORD block[4];
  FollowerDetailsLinkCell *v26;
  id v27;
  FMFLocationSharingViewController *v28;

  v4 = (void *)MEMORY[0x24BE2FEB0];
  v5 = a3;
  objc_msgSend(v5, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleWithId:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hashedDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHashedDSID:", v8);

  -[FMFLocationSharingViewController dsidToFamilyPhoto](self, "dsidToFamilyPhoto");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[FMFLocationSharingViewController monogramForHandle:](self, "monogramForHandle:", v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v7, "prettyName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setControllerLoadAction:", sel__showFamilyMemberDetails_);
  objc_msgSend(v16, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v16, "setProperty:forKey:", v14, *MEMORY[0x24BE75AC8]);
  if (!-[FMFLocationSharingViewController _isFamilyMemberAFollower:](self, "_isFamilyMemberAFollower:", v7))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "tableCellGrayTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v17, CFSTR("PSFollowerDetailsTitleTextColorKey"));

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FAMILY_HIDING"), &stru_24C878158, CFSTR("LocalizableUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v19, *MEMORY[0x24BE75D28]);

  }
  v20 = objc_alloc_init(FollowerDetailsLinkCell);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__FMFLocationSharingViewController__specifierForFamilyMember___block_invoke;
  block[3] = &unk_24C877E80;
  v26 = v20;
  v21 = v16;
  v27 = v21;
  v28 = self;
  v22 = v20;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v23 = v21;

  return v23;
}

void __62__FMFLocationSharingViewController__specifierForFamilyMember___block_invoke(id *a1)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  objc_msgSend(a1[4], "refreshCellContentsWithSpecifier:", a1[5]);
  v2 = a1[4];
  objc_msgSend(a1[6], "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "sizeThatFits:", v4, 3.40282347e38);
  v6 = v5;

  if ((objc_msgSend(a1[6], "isAccessibilitySize") & 1) != 0 || v6 > 52.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7DE0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &unk_24C87E728;
  }
  v8 = v7;
  objc_msgSend(a1[5], "setProperty:forKey:", v7, *MEMORY[0x24BE75D10]);

}

- (id)monogramForHandle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!monogramForHandle__monogrammer)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBAEC0]), "initWithStyle:diameter:", 0, 36.0);
    v5 = (void *)monogramForHandle__monogrammer;
    monogramForHandle__monogrammer = v4;

  }
  objc_msgSend(v3, "recordId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)monogramForHandle__monogrammer;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE2FEA0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBAEC0], "descriptorForRequiredKeysIncludingImage:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getContactForHandle:keysToFetch:", v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "monogramForContact:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)monogramForHandle__monogrammer, "silhouetteMonogram");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)offerTimeRemaining:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (uint64_t)a3;
  v5 = (uint64_t)a3 / 60 % 60;
  v6 = (uint64_t)a3 + 3599;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 >= 0x1C1F)
  {
    v14 = v4 / 3600;
    -[FMFLocationSharingViewController formatStringForHours:minutes:](self, "formatStringForHours:minutes:", v14, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v15, &stru_24C878158, CFSTR("LocalizableUI"));
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    FMFLocalizedStringForNumber(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    FMFLocalizedStringForNumber(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v17, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5 < 1)
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OFFER_TIME_REMAINING_LESS_THAN_A_MINUTE"), &stru_24C878158, CFSTR("LocalizableUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v5 == 1)
      v9 = CFSTR("OFFER_TIME_REMAINING_MINUTE");
    else
      v9 = CFSTR("OFFER_TIME_REMAINING_MINUTES");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24C878158, CFSTR("LocalizableUI"));
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FMFLocalizedStringForNumber(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = (void *)v10;
LABEL_10:

  return v13;
}

- (id)formatStringForHours:(int64_t)a3 minutes:(int64_t)a4
{
  if (a3 >= 2 && a4 > 1)
    return CFSTR("OFFER_TIME_REMAINING_HOURS_MINUTES");
  if (a3 == 1 && a4 > 1)
    return CFSTR("OFFER_TIME_REMAINING_HOUR_MINUTES");
  if (a4 != 1 || a3 <= 1)
    return CFSTR("OFFER_TIME_REMAINING_HOUR_MINUTE");
  else
    return CFSTR("OFFER_TIME_REMAINING_HOURS_MINUTE");
}

- (void)_setShareSwitchEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "BOOLValue") ^ 1;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__FMFLocationSharingViewController__setShareSwitchEnabled_forSpecifier___block_invoke;
  v9[3] = &unk_24C877EA8;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "setHideMyLocationEnabled:completion:", v7, v9);

}

void __72__FMFLocationSharingViewController__setShareSwitchEnabled_forSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__FMFLocationSharingViewController__setShareSwitchEnabled_forSpecifier___block_invoke_cold_1();

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "genericAlertController");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayAlertController:", v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_INFO, "Preferences setHideMyLocationEnabled: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersOnMainQueue");
}

- (id)genericAlertController
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE2FE38], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkUp");

  if ((v3 & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GENERIC_ALERT_TITLE"), &stru_24C878158, CFSTR("LocalizableUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GENERIC_ALERT_TEXT"), &stru_24C878158, CFSTR("LocalizableUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON"), &stru_24C878158, CFSTR("LocalizableUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v13);

  }
  else
  {
    v9 = +[FMFNoNetworkAlert newAlertController](FMFNoNetworkAlert, "newAlertController");
  }
  return v9;
}

- (void)displayAlertController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__FMFLocationSharingViewController_displayAlertController___block_invoke;
  v6[3] = &unk_24C877D90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __59__FMFLocationSharingViewController_displayAlertController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "genericErrorAlert");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "presentedViewController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "setGenericErrorAlert:", *(_QWORD *)(a1 + 40));
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "genericErrorAlert");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (id)_shareSwitchEnabled:(id)a3
{
  _BOOL8 v3;

  v3 = -[FMFLocationSharingViewController isMyLocationEnabled](self, "isMyLocationEnabled", a3);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
}

- (void)_showHandleDetails:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FMFLocationSharingViewController followersSpecifiers](self, "followersSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4) - 1;

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FMFLocationSharingViewController _showHandleDetails:].cold.1();
  }
  else
  {
    -[FMFLocationSharingViewController followersHandles](self, "followersHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    -[FMFLocationSharingViewController setLastSelectedHandle:](self, "setLastSelectedHandle:", v7);
    LogCategory_Daemon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject identifier](v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20DD58000, v9, OS_LOG_TYPE_DEFAULT, "_showHandleDetails: %@", (uint8_t *)&v11, 0xCu);

    }
    -[FMFLocationSharingViewController _pushAddressBookUIForHandle:](self, "_pushAddressBookUIForHandle:", v7);
  }

}

- (void)_showFamilyMemberDetails:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[FMFLocationSharingViewController familyMembers](self, "familyMembers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x24BE2FEB0];
        objc_msgSend(v10, "appleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleWithId:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "prettyName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqualToString:", v14))
        {
          v15 = (void *)MEMORY[0x24BE2FEB0];
          objc_msgSend(v10, "appleID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dsid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "familyHandleWithId:dsid:", v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "hashedDSID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setHashedDSID:", v19);

          -[FMFLocationSharingViewController setLastSelectedHandle:](self, "setLastSelectedHandle:", v18);
          LogCategory_Daemon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "hashedDSID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v28 = v21;
            v29 = 2112;
            v30 = v22;
            _os_log_impl(&dword_20DD58000, v20, OS_LOG_TYPE_DEFAULT, "_showFamilyMemberDetails: %@ %@", buf, 0x16u);

          }
          -[FMFLocationSharingViewController _pushAddressBookUIForHandle:](self, "_pushAddressBookUIForHandle:", v18);

          goto LABEL_13;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)_pushAddressBookUIForHandle:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  _BOOL4 v55;
  _BOOL4 IsEmail;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  void *v67;
  void *v68;
  uint8_t buf[4];
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _QWORD v73[5];

  v73[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[FMFLocationSharingViewController _isHandleAFollower:](self, "_isHandleAFollower:", v4);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsEmail = FMFSMLStringIsEmail(v6);

  v7 = objc_msgSend(v4, "isFamilyMember");
  objc_msgSend(v4, "recordId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE2FEA0], "sharedInstance");
    v55 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBAE88], "descriptorForRequiredKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x24BDBA288];
    v73[0] = v10;
    v73[1] = v11;
    v12 = (void *)*MEMORY[0x24BDBA348];
    v73[2] = *MEMORY[0x24BDBA348];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getContactForHandle:keysToFetch:", v4, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v55;
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDBAE88], "viewControllerForContact:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAllowsActions:", 0);
      -[FMFLocationSharingViewController allHandlesMatchingABCardForSelectedHandle:](self, "allHandlesMatchingABCardForSelectedHandle:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count") == 1)
        v17 = 1;
      else
        v17 = v7;
      if (v17 != 1)
        goto LABEL_45;
      v18 = v12;
      v19 = v18;
      if (IsEmail)
      {
        v57 = v15;
        v20 = v11;

        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(v14, "emailAddresses");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
        if (!v22)
        {
          v30 = 0;
LABEL_44:

          objc_msgSend(v15, "highlightPropertyWithKey:identifier:", v20, v30);
LABEL_45:
          objc_msgSend(v15, "contentViewController");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5)
            -[FMFLocationSharingViewController addRemoveActionToContactViewController:](self, "addRemoveActionToContactViewController:", v48);
          else
            -[FMFLocationSharingViewController addShareActionToContactViewController:](self, "addShareActionToContactViewController:", v48);

          LogCategory_Daemon();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v70 = v14;
            _os_log_impl(&dword_20DD58000, v49, OS_LOG_TYPE_DEFAULT, "_pushAddressBookUIForHandle: %@", buf, 0xCu);
          }

          -[FMFLocationSharingViewController navigationController](self, "navigationController");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          v39 = v15;
          goto LABEL_51;
        }
        v23 = v22;
        v50 = v20;
        v51 = v16;
        v53 = v14;
        v24 = *(_QWORD *)v64;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v64 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            objc_msgSend(v26, "value");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v27, "isEqualToString:", v28);

            if (v29)
            {
              objc_msgSend(v26, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_38;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
          if (v23)
            continue;
          break;
        }
        v30 = 0;
LABEL_38:
        v16 = v51;
        v14 = v53;
        v15 = v57;
        v5 = v55;
      }
      else
      {
        v50 = v18;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(v14, "phoneNumbers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
        if (v40)
        {
          v41 = v40;
          v52 = v16;
          v54 = v14;
          v58 = v15;
          v42 = *(_QWORD *)v60;
          while (2)
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(_QWORD *)v60 != v42)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "value");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "stringValue");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "identifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = -[FMFLocationSharingViewController phoneNumberMatches:phone2:](self, "phoneNumberMatches:phone2:", v45, v46);

              if (v47)
              {
                objc_msgSend(v4, "identifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_40;
              }

            }
            v41 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
            if (v41)
              continue;
            break;
          }
          v30 = 0;
LABEL_40:
          v20 = v50;
          v16 = v52;
          v14 = v54;
          v15 = v58;
          v5 = v55;
          goto LABEL_44;
        }
        v30 = 0;
      }
      v20 = v50;
      goto LABEL_44;
    }
  }
  v14 = objc_alloc_init(MEMORY[0x24BDBAD50]);
  objc_msgSend(v4, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (IsEmail)
    {
      v31 = objc_alloc(MEMORY[0x24BDBAD38]);
      v32 = (void *)objc_msgSend(v31, "initWithLabel:value:", *MEMORY[0x24BDBAB60], v15);
      v68 = v32;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEmailAddresses:", v33);
    }
    else
    {
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v15);
      if (!v32)
      {
LABEL_23:

        goto LABEL_24;
      }
      v34 = objc_alloc(MEMORY[0x24BDBAD38]);
      v33 = (void *)objc_msgSend(v34, "initWithLabel:value:", *MEMORY[0x24BDBAB60], v32);
      v67 = v33;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v67, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPhoneNumbers:", v35);

    }
    goto LABEL_23;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDBAE88], "viewControllerForUnknownContact:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAllowsActions:", 0);
  objc_msgSend(v16, "contentViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[FMFLocationSharingViewController addRemoveActionToContactViewController:](self, "addRemoveActionToContactViewController:", v36);
  else
    -[FMFLocationSharingViewController addShareActionToContactViewController:](self, "addShareActionToContactViewController:", v36);

  -[FMFLocationSharingViewController navigationController](self, "navigationController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  v39 = v16;
LABEL_51:
  objc_msgSend(v37, "pushViewController:animated:", v39, 1);

}

- (BOOL)_isHandleAFollower:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isFamilyMember"))
  {
    v5 = -[FMFLocationSharingViewController _isFamilyMemberAFollower:](self, "_isFamilyMemberAFollower:", v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BE2FEB0];
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleWithId:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "canShareLocationWithHandle:groupId:callerId:", v8, 0, 0);

    v4 = (id)v8;
  }

  return v5;
}

- (BOOL)_isFamilyMemberAFollower:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FMFLocationSharingViewController allFollowersHandles](self, "allFollowersHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("hashedDSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hashedDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "containsObject:", v7);
  return (char)v4;
}

- (BOOL)phoneNumberMatches:(id)a3 phone2:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;

  v6 = (void *)MEMORY[0x24BDD14A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "alphanumericCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocationSharingViewController stringByKeepingCharacterSet:inString:](self, "stringByKeepingCharacterSet:inString:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invertedSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocationSharingViewController stringByKeepingCharacterSet:inString:](self, "stringByKeepingCharacterSet:inString:", v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMFLocationSharingViewController reverseString:](self, "reverseString:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMFLocationSharingViewController reverseString:](self, "reverseString:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v15, "length") < 0xA || (unint64_t)objc_msgSend(v16, "length") < 0xA)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v15, "substringWithRange:", 0, 10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "substringWithRange:", 0, 10);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v17, "isEqualToString:", v18);
    v16 = (void *)v18;
    v15 = v17;
  }

  return v19;
}

- (id)stringByKeepingCharacterSet:(id)a3 inString:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v5);
  v9 = v6;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v7;
    v11 = v6;
    do
    {
      objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", v10, v8, &stru_24C878158);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v5);
      v11 = v9;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v9;
}

- (id)reverseString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  if (v5)
  {
    v6 = v5 - 1;
    do
    {
      objc_msgSend(v3, "substringWithRange:", v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v7);

      --v6;
    }
    while (v6 != -1);
  }

  return v4;
}

- (id)identifierForHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BE2FEA0];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getContactForHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addRemoveActionToContactViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x24BE2FED0], "FMFRestricted") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("REMOVE_FOLLOWER"), &stru_24C878158, CFSTR("LocalizableUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardBottomGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addActionWithTitle:target:selector:inGroup:destructive:", v5, self, sel_removeFollower_, v6, 1);

  }
}

- (void)addShareActionToContactViewController:(id)a3
{
  char v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(MEMORY[0x24BE2FED0], "FMFRestricted");
  v5 = objc_msgSend(MEMORY[0x24BE2FED0], "FMFAllowed");
  if ((v4 & 1) == 0 && v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARE_MY_LOCATION"), &stru_24C878158, CFSTR("LocalizableUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardBottomGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addActionWithTitle:target:selector:inGroup:destructive:", v7, self, sel_shareMyLocation_, v8, 0);

  }
}

- (void)removeFollower:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE2FED0], "FMFRestricted", a3))
  {
    LogCategory_Daemon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DD58000, v4, OS_LOG_TYPE_INFO, "Cannot remove follower due to restrictions.", buf, 2u);
    }
  }
  else
  {
    -[FMFLocationSharingViewController lastSelectedHandle](self, "lastSelectedHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFamilyMember");

    -[FMFLocationSharingViewController lastSelectedHandle](self, "lastSelectedHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "hashedDSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFLocationSharingViewController _followerHandleWithHashedDSID:](self, "_followerHandleWithHashedDSID:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      LogCategory_Daemon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[FMFLocationSharingViewController lastSelectedHandle](self, "lastSelectedHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMFLocationSharingViewController lastSelectedHandle](self, "lastSelectedHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dsid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v12;
        v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_20DD58000, v11, OS_LOG_TYPE_INFO, "Removing Share My Location For Family Member: %@ %@", buf, 0x16u);

      }
      LogCategory_Daemon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "hashedDSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v10;
        v31 = 2112;
        v32 = v16;
        _os_log_impl(&dword_20DD58000, v15, OS_LOG_TYPE_INFO, "Removing Share My Location For Actual Handle: %@ %@", buf, 0x16u);

      }
      v17 = (void *)MEMORY[0x24BDBCF20];
      v18 = (void *)MEMORY[0x24BE2FEB0];
      objc_msgSend(v10, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleWithId:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithObject:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *MEMORY[0x24BE2FE98];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __51__FMFLocationSharingViewController_removeFollower___block_invoke;
      v28[3] = &unk_24C877ED0;
      v28[4] = self;
      objc_msgSend(v22, "stopSharingMyLocationWithHandles:groupId:callerId:completion:", v21, v23, 0, v28);

    }
    else
    {
      -[FMFLocationSharingViewController allHandlesMatchingABCardForSelectedHandle:](self, "allHandlesMatchingABCardForSelectedHandle:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      LogCategory_Daemon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v10;
        _os_log_impl(&dword_20DD58000, v24, OS_LOG_TYPE_INFO, "Removing Share My Location Followers: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x24BE2FE98];
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __51__FMFLocationSharingViewController_removeFollower___block_invoke_186;
      v27[3] = &unk_24C877ED0;
      v27[4] = self;
      objc_msgSend(v21, "stopSharingMyLocationWithHandles:groupId:callerId:completion:", v10, v25, 0, v27);
    }

    -[FMFLocationSharingViewController navigationController](self, "navigationController");
    v4 = objc_claimAutoreleasedReturnValue();
    v26 = (id)-[NSObject popViewControllerAnimated:](v4, "popViewControllerAnimated:", 1);
  }

}

uint64_t __51__FMFLocationSharingViewController_removeFollower___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersOnMainQueue");
}

uint64_t __51__FMFLocationSharingViewController_removeFollower___block_invoke_186(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersOnMainQueue");
}

- (id)_followerHandleWithHashedDSID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("hashedDSID = %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocationSharingViewController allFollowersHandles](self, "allFollowersHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)shareMyLocation:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  NSObject *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE2FED0], "FMFRestricted", a3))
  {
    LogCategory_Daemon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DD58000, v4, OS_LOG_TYPE_INFO, "Cannot add follower due to restrictions.", buf, 2u);
    }
  }
  else
  {
    -[FMFLocationSharingViewController lastSelectedHandle](self, "lastSelectedHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hashedDSID");
    v4 = objc_claimAutoreleasedReturnValue();

    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[FMFLocationSharingViewController lastSelectedHandle](self, "lastSelectedHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v4;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_20DD58000, v6, OS_LOG_TYPE_DEFAULT, "hashed: %@ %@", buf, 0x16u);

    }
    LogCategory_Daemon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[FMFLocationSharingViewController hashedFamilyDsids](self, "hashedFamilyDsids");
      v9 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_impl(&dword_20DD58000, v8, OS_LOG_TYPE_DEFAULT, "hashed: %@", buf, 0xCu);

    }
    -[FMFLocationSharingViewController lastSelectedHandle](self, "lastSelectedHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isFamilyMember");

    if (v11)
    {
      LogCategory_Daemon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[FMFLocationSharingViewController lastSelectedHandle](self, "lastSelectedHandle");
        v13 = objc_claimAutoreleasedReturnValue();
        -[FMFLocationSharingViewController lastSelectedHandle](self, "lastSelectedHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dsid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v13;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_20DD58000, v12, OS_LOG_TYPE_INFO, "Starting Share My Location For Family Member: %@ %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __52__FMFLocationSharingViewController_shareMyLocation___block_invoke;
    v19[3] = &unk_24C877C40;
    v19[4] = self;
    objc_msgSend(v16, "iCloudAccountNameWithCompletion:", v19);

    -[FMFLocationSharingViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "popViewControllerAnimated:", 1);

  }
}

void __52__FMFLocationSharingViewController_shareMyLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__FMFLocationSharingViewController_shareMyLocation___block_invoke_2;
  v5[3] = &unk_24C877D90;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __52__FMFLocationSharingViewController_shareMyLocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "lastSelectedHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2FEB0], "handleWithId:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__FMFLocationSharingViewController_shareMyLocation___block_invoke_3;
  v7[3] = &unk_24C877EF8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:", v4, 0, v5, 0, v7);

}

uint64_t __52__FMFLocationSharingViewController_shareMyLocation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersOnMainQueue");
}

- (id)allHandlesMatchingABCardForSelectedHandle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocationSharingViewController identifierForHandle:](self, "identifierForHandle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getHandlesFollowingMyLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __78__FMFLocationSharingViewController_allHandlesMatchingABCardForSelectedHandle___block_invoke;
    v11[3] = &unk_24C877E58;
    v11[4] = self;
    v12 = v7;
    v13 = v6;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

  }
  return v6;
}

void __78__FMFLocationSharingViewController_allHandlesMatchingABCardForSelectedHandle___block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(a1[4], "identifierForHandle:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[5], "isEqualToString:", v3))
    objc_msgSend(a1[6], "addObject:", v4);

}

- (void)_meDeviceSpecifierWasTapped:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DD58000, v3, OS_LOG_TYPE_DEFAULT, "_meDeviceSpecifierWasTapped", v4, 2u);
  }

}

- (void)_findMyDeviceSpecifierWasTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20DD58000, v4, OS_LOG_TYPE_DEFAULT, "_findMyDeviceSpecifierWasTapped", v9, 2u);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(getFMDUIFMIPiCloudSettingsViewControllerClass());
  objc_msgSend(v7, "setAccount:", v6);
  -[FMFLocationSharingViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v7, 1);

}

- (void)reloadSpecifiersOnMainQueue
{
  _QWORD block[5];

  -[FMFLocationSharingViewController _loadSpecifiers](self, "_loadSpecifiers");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__FMFLocationSharingViewController_reloadSpecifiersOnMainQueue__block_invoke;
  block[3] = &unk_24C877CC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __63__FMFLocationSharingViewController_reloadSpecifiersOnMainQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (BOOL)isMyLocationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMyLocationEnabled");

  return v3;
}

- (void)didReceiveServerError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "Received server error: %@", (uint8_t *)&v7, 0xCu);
  }

  -[FMFLocationSharingViewController genericAlertController](self, "genericAlertController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocationSharingViewController displayAlertController:](self, "displayAlertController:", v6);

}

- (void)networkReachabilityUpdated:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  id v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "Updated network reachability status, Is reachable: %d", (uint8_t *)v8, 8u);
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forceRefresh");

    -[FMFLocationSharingViewController reloadSpecifiersOnMainQueue](self, "reloadSpecifiersOnMainQueue");
  }
  else
  {
    v7 = +[FMFNoNetworkAlert newAlertController](FMFNoNetworkAlert, "newAlertController");
    -[FMFLocationSharingViewController displayAlertController:](self, "displayAlertController:", v7);

  }
}

- (void)saveActiveDeviceSelection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DD58000, log, OS_LOG_TYPE_ERROR, "No FMFSession instance available.", v1, 2u);
}

void __61__FMFLocationSharingViewController_saveActiveDeviceSelection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setMeDeviceChangePending:", 0);
  if (v3)
  {
    LogCategory_Daemon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__FMFLocationSharingViewController_saveActiveDeviceSelection__block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersOnMainQueue");

}

- (void)updateFindMyDeviceStatus
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__FMFLocationSharingViewController_updateFindMyDeviceStatus__block_invoke;
  v4[3] = &unk_24C877F48;
  v4[4] = self;
  objc_msgSend(v3, "fmipStateWithCompletion:", v4);

}

uint64_t __60__FMFLocationSharingViewController_updateFindMyDeviceStatus__block_invoke(uint64_t a1, unint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsFindMyDeviceOn:", a2 < 2);
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersOnMainQueue");
}

- (void)traitCollectionDidChange:(id)a3
{
  NSString *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMFLocationSharingViewController;
  -[FMFLocationSharingViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[FMFLocationSharingViewController setIsAccessibilitySize:](self, "setIsAccessibilitySize:", UIContentSizeCategoryIsAccessibilityCategory(v4));

}

- (NSArray)followersSpecifiers
{
  return self->_followersSpecifiers;
}

- (void)setFollowersSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_followersSpecifiers, a3);
}

- (NSArray)familySpecifiers
{
  return self->_familySpecifiers;
}

- (void)setFamilySpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_familySpecifiers, a3);
}

- (NSArray)deviceSpecifiers
{
  return self->_deviceSpecifiers;
}

- (void)setDeviceSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSpecifiers, a3);
}

- (NSArray)allFollowersHandles
{
  return self->_allFollowersHandles;
}

- (void)setAllFollowersHandles:(id)a3
{
  objc_storeStrong((id *)&self->_allFollowersHandles, a3);
}

- (NSArray)followersHandles
{
  return self->_followersHandles;
}

- (void)setFollowersHandles:(id)a3
{
  objc_storeStrong((id *)&self->_followersHandles, a3);
}

- (NSMutableDictionary)dsidToFamilyPhoto
{
  return self->_dsidToFamilyPhoto;
}

- (void)setDsidToFamilyPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_dsidToFamilyPhoto, a3);
}

- (NSArray)hashedFamilyDsids
{
  return self->_hashedFamilyDsids;
}

- (void)setHashedFamilyDsids:(id)a3
{
  objc_storeStrong((id *)&self->_hashedFamilyDsids, a3);
}

- (FMFHandle)lastSelectedHandle
{
  return self->_lastSelectedHandle;
}

- (void)setLastSelectedHandle:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedHandle, a3);
}

- (void)setIsMyLocationEnabled:(BOOL)a3
{
  self->_isMyLocationEnabled = a3;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_familyMembers, a3);
}

- (UIAlertController)genericErrorAlert
{
  return self->_genericErrorAlert;
}

- (void)setGenericErrorAlert:(id)a3
{
  objc_storeStrong((id *)&self->_genericErrorAlert, a3);
}

- (void)setUseFamilyCirclePhotos:(BOOL)a3
{
  self->_useFamilyCirclePhotos = a3;
}

- (BOOL)useFamilyCirclePhotosLoaded
{
  return self->_useFamilyCirclePhotosLoaded;
}

- (void)setUseFamilyCirclePhotosLoaded:(BOOL)a3
{
  self->_useFamilyCirclePhotosLoaded = a3;
}

- (BOOL)areSpecifiersLoaded
{
  return self->_areSpecifiersLoaded;
}

- (void)setAreSpecifiersLoaded:(BOOL)a3
{
  self->_areSpecifiersLoaded = a3;
}

- (BOOL)areMeDeviceInfoLoaded
{
  return self->_areMeDeviceInfoLoaded;
}

- (void)setAreMeDeviceInfoLoaded:(BOOL)a3
{
  self->_areMeDeviceInfoLoaded = a3;
}

- (BOOL)isFindMyDeviceOn
{
  return self->_isFindMyDeviceOn;
}

- (void)setIsFindMyDeviceOn:(BOOL)a3
{
  self->_isFindMyDeviceOn = a3;
}

- (BOOL)meDeviceChangePending
{
  return self->_meDeviceChangePending;
}

- (void)setMeDeviceChangePending:(BOOL)a3
{
  self->_meDeviceChangePending = a3;
}

- (BOOL)isAccessibilitySize
{
  return self->_isAccessibilitySize;
}

- (void)setIsAccessibilitySize:(BOOL)a3
{
  self->_isAccessibilitySize = a3;
}

- (OS_dispatch_queue)specifiersQueue
{
  return self->_specifiersQueue;
}

- (void)setSpecifiersQueue:(id)a3
{
  objc_storeStrong((id *)&self->_specifiersQueue, a3);
}

- (NSSet)meDevices
{
  return self->_meDevices;
}

- (void)setMeDevices:(id)a3
{
  objc_storeStrong((id *)&self->_meDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meDevices, 0);
  objc_storeStrong((id *)&self->_specifiersQueue, 0);
  objc_storeStrong((id *)&self->_genericErrorAlert, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_lastSelectedHandle, 0);
  objc_storeStrong((id *)&self->_hashedFamilyDsids, 0);
  objc_storeStrong((id *)&self->_dsidToFamilyPhoto, 0);
  objc_storeStrong((id *)&self->_followersHandles, 0);
  objc_storeStrong((id *)&self->_allFollowersHandles, 0);
  objc_storeStrong((id *)&self->_deviceSpecifiers, 0);
  objc_storeStrong((id *)&self->_familySpecifiers, 0);
  objc_storeStrong((id *)&self->_followersSpecifiers, 0);
}

void __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DD58000, v0, v1, "Error loading family members: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__FMFLocationSharingViewController__setShareSwitchEnabled_forSpecifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DD58000, v0, v1, "Preference change failed because of error - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_showHandleDetails:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DD58000, v0, v1, "Error finding specifier in _showHandleDetails: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__FMFLocationSharingViewController_saveActiveDeviceSelection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DD58000, v0, v1, "Error while setting active device. Error - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
