@implementation AXSpeechAssetMonitorHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_Monitor;
}

void __44__AXSpeechAssetMonitorHelper_sharedInstance__block_invoke()
{
  AXSpeechAssetMonitorHelper *v0;
  void *v1;

  v0 = objc_alloc_init(AXSpeechAssetMonitorHelper);
  v1 = (void *)sharedInstance_Monitor;
  sharedInstance_Monitor = (uint64_t)v0;

}

- (AXSpeechAssetMonitorHelper)init
{
  AXSpeechAssetMonitorHelper *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *longOperationQueue;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *migrationQueue;
  void *v9;
  objc_class *v10;
  AXAssetsService *v11;
  AXAssetsService *assetService;
  AXSpeechAssetMonitorHelper *v13;
  void *v14;
  char v15;
  AXSpeechAssetMonitorHelper *v16;
  AXSpeechAssetMonitorHelper *v18;
  objc_super v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v19.receiver = self;
  v19.super_class = (Class)AXSpeechAssetMonitorHelper;
  v2 = -[AXSpeechAssetMonitorHelper init](&v19, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AXSAM.operation", 0);
    longOperationQueue = v2->_longOperationQueue;
    v2->_longOperationQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.accessibility.migrationQueue", v6);
    migrationQueue = v2->_migrationQueue;
    v2->_migrationQueue = (OS_dispatch_queue *)v7;

    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v9 = (void *)getAXAssetsServiceClass_softClass;
    v24 = getAXAssetsServiceClass_softClass;
    if (!getAXAssetsServiceClass_softClass)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __getAXAssetsServiceClass_block_invoke;
      v20[3] = &unk_24D72F848;
      v20[4] = &v21;
      __getAXAssetsServiceClass_block_invoke((uint64_t)v20);
      v9 = (void *)v22[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v21, 8);
    v11 = (AXAssetsService *)objc_alloc_init(v10);
    assetService = v2->_assetService;
    v2->_assetService = v11;

    v2->_lastVoiceAssetUpdateTime = -3061152000.0;
    v13 = v2;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "siriAutoUpdateListInitialized");

    if ((v15 & 1) == 0)
    {
      v18 = v13;
      AXPerformBlockOnMainThreadAfterDelay();

    }
    v16 = v13;

  }
  return v2;
}

uint64_t __34__AXSpeechAssetMonitorHelper_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_monitorSpeechAssetChanges");
}

void __34__AXSpeechAssetMonitorHelper_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_assetUpdaterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__AXSpeechAssetMonitorHelper_init__block_invoke_3;
  v4[3] = &unk_24D72F820;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, 10, v3, v4);

}

void __34__AXSpeechAssetMonitorHelper_init__block_invoke_3(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD v3[4];
  _QWORD *v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[4];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__AXSpeechAssetMonitorHelper_init__block_invoke_4;
  v3[3] = &unk_24D72F7F8;
  v4 = v1;
  objc_msgSend(v2, "invalidate:", v3);

}

void __34__AXSpeechAssetMonitorHelper_init__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

- (id)_assetUpdaterClient
{
  AXUIClient *speechAssetClient;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AXUIClient *v8;
  AXUIClient *v9;
  NSObject *v10;
  AXUIClient *v11;
  uint8_t buf[4];
  AXUIClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  speechAssetClient = self->_speechAssetClient;
  if (!speechAssetClient)
  {
    v4 = objc_alloc(MEMORY[0x24BDFF8F0]);
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("AXAssetAndDataServer-migrate-siri-list-%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (AXUIClient *)objc_msgSend(v4, "initWithIdentifier:serviceBundleName:", v7, CFSTR("AXAssetAndDataServer"));
    v9 = self->_speechAssetClient;
    self->_speechAssetClient = v8;

    AXLogUI();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_speechAssetClient;
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl(&dword_2172DC000, v10, OS_LOG_TYPE_DEFAULT, "Making new speech migration client: %@", buf, 0xCu);
    }

    speechAssetClient = self->_speechAssetClient;
  }
  return speechAssetClient;
}

- (BOOL)_platformSupportsMobileAssetVoices
{
  return 1;
}

- (void)_registerForReachabilityNotifications
{
  __SCNetworkReachability *v3;
  SCNetworkReachabilityContext v4;
  sockaddr address;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!self->_reachability)
  {
    address = (sockaddr)xmmword_2172DF800;
    v3 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], &address);
    self->_reachability = v3;
    v4.version = 0;
    memset(&v4.retain, 0, 24);
    v4.info = self;
    SCNetworkReachabilitySetCallback(v3, (SCNetworkReachabilityCallBack)__ReachabilityCallback, &v4);
    SCNetworkReachabilitySetDispatchQueue(self->_reachability, MEMORY[0x24BDAC9B8]);
  }
}

- (void)_unregisterForReachabilityNotifications
{
  __SCNetworkReachability *reachability;
  __SCNetworkReachability *v4;

  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetCallback(reachability, 0, 0);
    v4 = self->_reachability;
    if (v4)
    {
      CFRelease(v4);
      self->_reachability = 0;
    }
  }
}

- (void)handeDeviceFirstUnlock
{
  -[AXSpeechAssetMonitorHelper startMigrationOnDeviceUnlock](self, "startMigrationOnDeviceUnlock");
  -[AXAssetsService runFirstUnlockTasks](self->_assetService, "runFirstUnlockTasks");
}

- (void)startMigrationOnDeviceUnlock
{
  _QWORD block[5];

  if (AXDeviceIsUnlocked())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__AXSpeechAssetMonitorHelper_startMigrationOnDeviceUnlock__block_invoke;
    block[3] = &unk_24D72F7F8;
    block[4] = self;
    if (startMigrationOnDeviceUnlock_onceToken != -1)
      dispatch_once(&startMigrationOnDeviceUnlock_onceToken, block);
  }
}

void __58__AXSpeechAssetMonitorHelper_startMigrationOnDeviceUnlock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "componentCacheChanged");
  AXLogSpeechAssetDownload();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2172DC000, v2, OS_LOG_TYPE_INFO, "AXSpeechAssetMonitorHelper: Migration task timer set for 5 minutes.", buf, 2u);
  }

  v3 = dispatch_time(0, 300000000000);
  objc_msgSend(*(id *)(a1 + 32), "migrationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__AXSpeechAssetMonitorHelper_startMigrationOnDeviceUnlock__block_invoke_188;
  block[3] = &unk_24D72F7F8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, v4, block);

}

uint64_t __58__AXSpeechAssetMonitorHelper_startMigrationOnDeviceUnlock__block_invoke_188(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];
  uint8_t buf[16];

  AXLogSpeechAssetDownload();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2172DC000, v2, OS_LOG_TYPE_INFO, "AXSpeechAssetMonitorHelper: Running migration from SpringBoard after first unlock.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BEB6220], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartMigrationIfNeeded");

  AXLogSpeechAssetDownload();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2172DC000, v4, OS_LOG_TYPE_INFO, "AXSpeechAssetMonitorHelper: Updating super compact voice identifiers for all speech sources if needed.", v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateSpeechSourceIdentifiersIfNeeded");
}

- (void)_monitorSpeechAssetChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v4;

  -[AXAssetsService runFirstBootTasks:](self->_assetService, "runFirstBootTasks:", 0);
  if (AXDeviceIsUnlocked())
  {
    -[AXSpeechAssetMonitorHelper startMigrationOnDeviceUnlock](self, "startMigrationOnDeviceUnlock");
    -[AXAssetsService runFirstUnlockTasks](self->_assetService, "runFirstUnlockTasks");
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v4 = (const __CFString *)AXkMobileKeyBagLockStatusNotificationID();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_deviceLockStateChanged, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_updateSpeechSourceIdentifiersIfNeeded
{
  void *v2;
  void *v3;
  uint64_t v4;
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
  id v16;

  v16 = (id)TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  MEMORY[0x219A09F18]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDFE3A8];
  objc_msgSend(v3, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v16, *MEMORY[0x24BDFE3A8], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB6220], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadCompactResourceIfNeededForIdentifier:", v5);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v2, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB6220], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "downloadCompactResourceIfNeededForIdentifier:", v8);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v2, *MEMORY[0x24BDFE398], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB6220], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "downloadCompactResourceIfNeededForIdentifier:", v11);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v2, *MEMORY[0x24BDFE3A0], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB6220], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "downloadCompactResourceIfNeededForIdentifier:", v14);

}

- (OS_dispatch_queue)longOperationQueue
{
  return self->_longOperationQueue;
}

- (void)setLongOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_longOperationQueue, a3);
}

- (OS_dispatch_queue)migrationQueue
{
  return self->_migrationQueue;
}

- (void)setMigrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_migrationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationQueue, 0);
  objc_storeStrong((id *)&self->_longOperationQueue, 0);
  objc_storeStrong((id *)&self->_speechAssetClient, 0);
  objc_storeStrong((id *)&self->_assetService, 0);
}

@end
