@implementation CKAppInstallationWatcher

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_226);
  return (id)sharedInstance_sharedInstance_2;
}

void __42__CKAppInstallationWatcher_sharedInstance__block_invoke()
{
  CKAppInstallationWatcher *v0;
  void *v1;

  v0 = objc_alloc_init(CKAppInstallationWatcher);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (CKAppInstallationWatcher)init
{
  CKAppInstallationWatcher *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableArray *observers;
  NSObject *v8;
  _QWORD block[4];
  CKAppInstallationWatcher *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKAppInstallationWatcher;
  v2 = -[CKAppInstallationWatcher init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ChatKit.CKAppInstallationWatcher", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v6;

    v8 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__CKAppInstallationWatcher_init__block_invoke;
    block[3] = &unk_1E274A208;
    v11 = v2;
    dispatch_async(v8, block);

  }
  return v2;
}

uint64_t __32__CKAppInstallationWatcher_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadBundleIdentifiersFromDiskLocked");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_observingApplicationWorkspace)
  {
    -[CKAppInstallationWatcher _applicationWorkspace](self, "_applicationWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)CKAppInstallationWatcher;
  -[CKAppInstallationWatcher dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[CKAppInstallationWatcher observers](self, "observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D36B18], "weakRefWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v5);
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__68;
  v18 = __Block_byref_object_dispose__68;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[CKAppInstallationWatcher observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__CKAppInstallationWatcher_removeObserver___block_invoke;
  v11 = &unk_1E2759110;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v8);

  if (objc_msgSend((id)v15[5], "count", v8, v9, v10, v11))
  {
    -[CKAppInstallationWatcher observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectsInArray:", v15[5]);

  }
  _Block_object_dispose(&v14, 8);

}

void __43__CKAppInstallationWatcher_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "object");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        objc_msgSend(v7, "object"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = *(void **)(a1 + 32),
        v5,
        v4,
        v5 == v6))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);
  }

}

- (void)startListeningForAppBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[CKAppInstallationWatcher queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__CKAppInstallationWatcher_startListeningForAppBundleIdentifier___block_invoke;
    v6[3] = &unk_1E274A108;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __65__CKAppInstallationWatcher_startListeningForAppBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  CKAppInstallation *v3;
  CKAppInstallation *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(*(id *)(a1 + 32), "installations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __65__CKAppInstallationWatcher_startListeningForAppBundleIdentifier___block_invoke_2;
  v11 = &unk_1E2755728;
  v12 = *(id *)(a1 + 40);
  v13 = &v14;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v8);

  if (!*((_BYTE *)v15 + 24))
  {
    v3 = [CKAppInstallation alloc];
    v4 = -[CKAppInstallation initWithBundleIdentifier:](v3, "initWithBundleIdentifier:", *(_QWORD *)(a1 + 40), v8, v9, v10, v11);
    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v19 = v6;
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Began listening for app installation with bundle ID %@", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "installations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v4);

      objc_msgSend(*(id *)(a1 + 32), "_callDelegateAsynchronouslyWithProgressForAppInstallation:added:updated:", v4, 1, 0);
      objc_msgSend(*(id *)(a1 + 32), "_updateObservingApplicationWorkspaceLocked");
      objc_msgSend(*(id *)(a1 + 32), "_saveBundleIdentifiersToDiskLocked");
    }

  }
  _Block_object_dispose(&v14, 8);
}

void __65__CKAppInstallationWatcher_startListeningForAppBundleIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)fetchAllAppInstallations:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CKAppInstallationWatcher queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CKAppInstallationWatcher_fetchAllAppInstallations___block_invoke;
  v7[3] = &unk_1E274C2E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__CKAppInstallationWatcher_fetchAllAppInstallations___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(*(id *)(a1 + 32), "installations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:copyItems:", v3, 1);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CKAppInstallationWatcher_fetchAllAppInstallations___block_invoke_2;
  v7[3] = &unk_1E274DA38;
  v5 = *(id *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __53__CKAppInstallationWatcher_fetchAllAppInstallations___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_applicationWorkspace
{
  return (id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
}

- (void)_loadBundleIdentifiersFromDiskLocked
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CKAppInstallationWatcher queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", CFSTR("/var/mobile/Library/SMS/CKAppInstallationWatcher.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__CKAppInstallationWatcher__loadBundleIdentifiersFromDiskLocked__block_invoke;
    v9[3] = &unk_1E274A318;
    v10 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  }
  -[CKAppInstallationWatcher setInstallations:](self, "setInstallations:", v6);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[CKAppInstallationWatcher installations](self, "installations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Loaded initial watched bundle installations from disk: %@", buf, 0xCu);

    }
  }
  -[CKAppInstallationWatcher _updateObservingApplicationWorkspaceLocked](self, "_updateObservingApplicationWorkspaceLocked");
  -[CKAppInstallationWatcher _updateAppProgressWithKnownChangedProxiesLocked:](self, "_updateAppProgressWithKnownChangedProxiesLocked:", 0);

}

void __64__CKAppInstallationWatcher__loadBundleIdentifiersFromDiskLocked__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  CKAppInstallation *v7;
  void *v8;
  CKAppInstallation *v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v10;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "objectForKey:", CFSTR("BundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("BundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("TimeInitiated"));
  v7 = (CKAppInstallation *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TimeInitiated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8)
  {
    v9 = [CKAppInstallation alloc];
    objc_msgSend(v8, "doubleValue");
    v7 = -[CKAppInstallation initWithBundleIdentifier:startTime:](v9, "initWithBundleIdentifier:startTime:", v6);
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_saveBundleIdentifiersToDiskLocked
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[5];
  _QWORD v14[3];
  uint64_t v15;

  -[CKAppInstallationWatcher queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  v15 = v6;
  -[CKAppInstallationWatcher inProgressInstallations](self, "inProgressInstallations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CKAppInstallationWatcher__saveBundleIdentifiersToDiskLocked__block_invoke;
  v13[3] = &unk_1E2759138;
  v13[4] = v14;
  objc_msgSend(v7, "__imArrayByApplyingBlock:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "List of installing apps changed; updating on disk",
          v12,
          2u);
      }

    }
    objc_msgSend(v8, "writeToFile:atomically:", CFSTR("/var/mobile/Library/SMS/CKAppInstallationWatcher.plist"), 1);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "There are no more installing apps; removing plist from disk",
          v12,
          2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/SMS/CKAppInstallationWatcher.plist"), 0);

  }
  _Block_object_dispose(v14, 8);
}

id __62__CKAppInstallationWatcher__saveBundleIdentifiersToDiskLocked__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "startTime");
  v5 = v4 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v5 < 0.0)
    v5 = -v5;
  if (v5 >= 86000.0)
  {
    v9 = 0;
  }
  else
  {
    v11[0] = CFSTR("BundleIdentifier");
    objc_msgSend(v3, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("TimeInitiated");
    v12[0] = v6;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "startTime");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_updateObservingApplicationWorkspaceLocked
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  -[CKAppInstallationWatcher queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[CKAppInstallationWatcher observingApplicationWorkspace](self, "observingApplicationWorkspace"))
  {
    -[CKAppInstallationWatcher installations](self, "installations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Beginning observing LaunchServices events", buf, 2u);
        }

      }
      -[CKAppInstallationWatcher _applicationWorkspace](self, "_applicationWorkspace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:", self);
      v8 = 1;
LABEL_15:

      -[CKAppInstallationWatcher setObservingApplicationWorkspace:](self, "setObservingApplicationWorkspace:", v8);
      return;
    }
  }
  if (-[CKAppInstallationWatcher observingApplicationWorkspace](self, "observingApplicationWorkspace"))
  {
    -[CKAppInstallationWatcher installations](self, "installations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Ending observing LaunchServices events", v12, 2u);
        }

      }
      -[CKAppInstallationWatcher _applicationWorkspace](self, "_applicationWorkspace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:", self);
      v8 = 0;
      goto LABEL_15;
    }
  }
}

- (void)_updateAppProgressWithKnownChangedProxies:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CKAppInstallationWatcher queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxies___block_invoke;
  block[3] = &unk_1E274A108;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __70__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxies___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppProgressWithKnownChangedProxiesLocked:", *(_QWORD *)(a1 + 40));
}

- (void)_updateAppProgressWithKnownChangedProxiesLocked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  CKAppInstallationWatcher *v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppInstallationWatcher installations](self, "installations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxiesLocked___block_invoke;
  v11[3] = &unk_1E2759160;
  v9 = v4;
  v12 = v9;
  v13 = self;
  v8 = v5;
  v14 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  if (objc_msgSend(v8, "count"))
  {
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __76__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxiesLocked___block_invoke_45;
    v10[3] = &unk_1E2759188;
    v10[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
    -[CKAppInstallationWatcher _saveBundleIdentifiersToDiskLocked](self, "_saveBundleIdentifiersToDiskLocked");
  }

}

void __76__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxiesLocked___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v3, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__ck_proxyWithBundleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_33;
    objc_msgSend(v4, "setProxy:", v7);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v4;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Replacing proxy for app: %@", (uint8_t *)&v17, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(v3, "proxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_33;
  }
  objc_msgSend(v7, "installProgress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Install progress for app %@ = %@", (uint8_t *)&v17, 0x16u);
    }

  }
  if (v9)
  {
    objc_msgSend(v9, "fractionCompleted");
    objc_msgSend(v4, "setPercentComplete:", v11 * 100.0);
    v12 = objc_msgSend(v9, "installState");
  }
  else
  {
    if (!objc_msgSend(v7, "isInstalled"))
      goto LABEL_17;
    objc_msgSend(v4, "setPercentComplete:", 100.0);
    v12 = 5;
  }
  objc_msgSend(v4, "setInstallState:", v12);
LABEL_17:
  if ((objc_msgSend(v7, "isInstalled") & 1) != 0 || (objc_msgSend(v4, "percentComplete"), v13 >= 100.0))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "registeredDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v16;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Updating install complete (%@): %@", (uint8_t *)&v17, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_callDelegateAsynchronouslyWithProgressForAppInstallation:added:updated:", v4, 0, 1);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  }
  else
  {
    if (objc_msgSend(v4, "installState") == 3 || objc_msgSend(v4, "installState") == 4)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v4;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Updating install progress: %@", (uint8_t *)&v17, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "_callDelegateAsynchronouslyWithProgressForAppInstallation:added:updated:", v4, 0, 1);
  }

LABEL_33:
}

void __76__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxiesLocked___block_invoke_45(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "installations");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

}

- (void)_callDelegateAsynchronouslyWithProgressForAppInstallation:(id)a3 added:(BOOL)a4 updated:(BOOL)a5
{
  _QWORD block[6];
  BOOL v9;
  BOOL v10;
  _QWORD v11[5];
  id v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__68;
  v11[4] = __Block_byref_object_dispose__68;
  v12 = 0;
  v12 = (id)objc_msgSend(a3, "copy");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__CKAppInstallationWatcher__callDelegateAsynchronouslyWithProgressForAppInstallation_added_updated___block_invoke;
  block[3] = &unk_1E27591D8;
  v9 = a4;
  block[4] = self;
  block[5] = v11;
  v10 = a5;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  _Block_object_dispose(v11, 8);

}

void __100__CKAppInstallationWatcher__callDelegateAsynchronouslyWithProgressForAppInstallation_added_updated___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  __int16 v5;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __100__CKAppInstallationWatcher__callDelegateAsynchronouslyWithProgressForAppInstallation_added_updated___block_invoke_2;
  v3[3] = &unk_1E27591B0;
  v5 = *(_WORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __100__CKAppInstallationWatcher__callDelegateAsynchronouslyWithProgressForAppInstallation_added_updated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appInstallationWatcher:addedAppInstallation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v3 = v6;
  }
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(v6, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appInstallationWatcher:changedAppInstallation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v3 = v6;
  }

}

- (NSArray)inProgressInstallations
{
  void *v2;
  void *v3;

  -[CKAppInstallationWatcher installations](self, "installations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &__block_literal_global_48_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

BOOL __51__CKAppInstallationWatcher_inProgressInstallations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "installed") & 1) == 0
    && objc_msgSend(v2, "installState") != 4
    && objc_msgSend(v2, "installState") != 3
    && objc_msgSend(v2, "installState") != 5;

  return v3;
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidStart:%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAppInstallationWatcher _updateAppProgressWithKnownChangedProxies:](self, "_updateAppProgressWithKnownChangedProxies:", v4);

}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidChange:%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAppInstallationWatcher _updateAppProgressWithKnownChangedProxies:](self, "_updateAppProgressWithKnownChangedProxies:", v4);

}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidUpdateIcon:%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAppInstallationWatcher _updateAppProgressWithKnownChangedProxies:](self, "_updateAppProgressWithKnownChangedProxies:", v4);

}

- (void)applicationsWillInstall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsWillInstall:%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAppInstallationWatcher _updateAppProgressWithKnownChangedProxies:](self, "_updateAppProgressWithKnownChangedProxies:", v4);

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidInstall:%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAppInstallationWatcher _updateAppProgressWithKnownChangedProxies:](self, "_updateAppProgressWithKnownChangedProxies:", v4);

}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidFailToInstall:%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAppInstallationWatcher _updateAppProgressWithKnownChangedProxies:](self, "_updateAppProgressWithKnownChangedProxies:", v4);

}

- (void)applicationStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationStateDidChange:%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAppInstallationWatcher _updateAppProgressWithKnownChangedProxies:](self, "_updateAppProgressWithKnownChangedProxies:", v4);

}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)installations
{
  return self->_installations;
}

- (void)setInstallations:(id)a3
{
  objc_storeStrong((id *)&self->_installations, a3);
}

- (BOOL)observingApplicationWorkspace
{
  return self->_observingApplicationWorkspace;
}

- (void)setObservingApplicationWorkspace:(BOOL)a3
{
  self->_observingApplicationWorkspace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
