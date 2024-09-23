@implementation CKContextContentProviderManager

uint64_t __89__CKContextContentProviderManager__isActivityReportingAllowedForCurrentBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (void)_dequeueActivityForReporting:(id)a3
{
  CKContextContentProviderManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_userActivitiesQueuedForReporting, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)userActivityWasCreated:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v9 = v3;
    v5 = objc_msgSend(v3, "isEligibleForPrediction");
    v4 = v9;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(&unk_1E6246F20, "containsObject:", v7))
      {
        +[CKContextContentProviderManager sharedManager](CKContextContentProviderManager, "sharedManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "scheduleUserActivityRecordingWithUserActivity:", v9);

      }
      v4 = v9;
    }
  }

}

- (void)userActivityDidBecomeCurrent:(id)a3 current:(BOOL)a4
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    +[CKContextContentProviderManager sharedManager](CKContextContentProviderManager, "sharedManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleUserActivityRecordingWithUserActivity:", v4);

  }
}

- (void)scheduleUserActivityRecordingWithUserActivity:(id)a3
{
  id v4;
  CKContextContentProviderManager *v5;
  void *v6;
  void *v7;
  id v8;
  dispatch_block_t v9;
  unint64_t v10;
  double v11;
  dispatch_time_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKContextContentProviderManager _isActivityReportingAllowedForCurrentBundleIdentifier:](v5, "_isActivityReportingAllowedForCurrentBundleIdentifier:", v7)&& (-[NSMutableArray containsObject:](v5->_userActivitiesQueuedForReporting, "containsObject:", v4) & 1) == 0)
  {
    objc_initWeak(&location, v5);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __81__CKContextContentProviderManager_scheduleUserActivityRecordingWithUserActivity___block_invoke;
    v16 = &unk_1E6243220;
    objc_copyWeak(&v19, &location);
    v8 = v4;
    v17 = v8;
    v18 = v7;
    v9 = dispatch_block_create((dispatch_block_flags_t)0, &v13);
    -[CKContextContentProviderManager _loadContextKitIfNecessaryWithExecutor:](v5, "_loadContextKitIfNecessaryWithExecutor:", 0, v13, v14, v15, v16);
    -[CKContextContentProviderManager _queueActivityForReporting:](v5, "_queueActivityForReporting:", v8);
    LODWORD(v8) = isSafariContentProvider;
    v10 = -[NSMutableArray count](v5->_userActivitiesQueuedForReporting, "count");
    v11 = 3.0;
    if ((_DWORD)v8)
      v11 = 5.0;
    v12 = dispatch_time(0, (uint64_t)(v11 * (double)v10 * 1000000000.0));
    dispatch_after(v12, MEMORY[0x1E0C80D38], v9);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v5);
}

- (BOOL)_isActivityReportingAllowedForCurrentBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6246F38);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__CKContextContentProviderManager__isActivityReportingAllowedForCurrentBundleIdentifier___block_invoke;
  v7[3] = &unk_1E6243328;
  v5 = v3;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (CKContextContentProviderManager)init
{
  CKContextContentProviderManager *v2;
  uint64_t v3;
  NSHashTable *providers;
  dispatch_queue_t v5;
  OS_dispatch_queue *activityReportingQueue;
  NSMutableArray *v7;
  NSMutableArray *userActivitiesQueuedForReporting;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKContextContentProviderManager;
  v2 = -[CKContextContentProviderManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    providers = v2->_providers;
    v2->_providers = (NSHashTable *)v3;

    +[CKContextUIClasses lookupClasses](CKContextUIClasses, "lookupClasses");
    -[objc_class performSelector:withObject:](NSClassFromString(CFSTR("UAUserActivity")), "performSelector:withObject:", sel_addUserActivityObserver_, v2);
    v5 = dispatch_queue_create("CKContextContentProviderManager Activity Reporting Queue", 0);
    activityReportingQueue = v2->_activityReportingQueue;
    v2->_activityReportingQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    userActivitiesQueuedForReporting = v2->_userActivitiesQueuedForReporting;
    v2->_userActivitiesQueuedForReporting = v7;

  }
  return v2;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CKContextContentProviderManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_instance;
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke(uint64_t a1)
{
  const char *v2;
  const char *v3;
  void *v4;
  void *v5;
  char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  CKContextContentProviderManager *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD handler[5];
  uint8_t buf[16];

  v2 = getprogname();
  v3 = v2;
  if (v2 && !strncmp(v2, "SafariViewService", 0x11uLL))
  {
    isSafariContentProvider = 1;
    objc_msgSend(*(id *)(a1 + 32), "_observeApplicationStateNotifications");
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
  {
    v6 = &isSafariContentProvider;
LABEL_8:
    *v6 = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.springboard")))
  {
    v6 = &isSpringBoard;
    goto LABEL_8;
  }
LABEL_9:
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v3);
  v8 = (void *)donationBundleIdentifier;
  donationBundleIdentifier = (uint64_t)v7;

  if ((objc_msgSend(&unk_1E6246F08, "containsObject:", v5) & 1) != 0)
    goto LABEL_24;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForInfoDictionaryKey:", CFSTR("UIContentTextExtractionEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = (void *)MEMORY[0x1E0C9AAB0];
  v12 = objc_msgSend(v10, "BOOLValue");

  if ((v12 & 1) == 0)
  {
LABEL_24:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Donations not allowed from this process. Setup aborted.", buf, 2u);
    }
  }
  else
  {
    v13 = objc_alloc_init(CKContextContentProviderManager);
    v14 = (void *)sharedManager_instance;
    sharedManager_instance = (uint64_t)v13;

    v15 = (const char *)objc_msgSend(CFSTR("com.apple.contextkit.content-request"), "UTF8String");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __48__CKContextContentProviderManager_sharedManager__block_invoke_10;
    handler[3] = &__block_descriptor_40_e8_v12__0i8l;
    handler[4] = *(_QWORD *)(a1 + 32);
    v16 = notify_register_dispatch(v15, &kContentTextExtractionNotificationToken, MEMORY[0x1E0C80D38], handler);
    if ((_DWORD)v16)
    {
      v17 = v16;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __48__CKContextContentProviderManager_sharedManager__block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }

}

+ (BOOL)isSpringBoard
{
  return isSpringBoard;
}

- (void)addProvider:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_providers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_providers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)_queueActivityForReporting:(id)a3
{
  CKContextContentProviderManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (isSafariContentProvider == 1)
    -[NSMutableArray removeAllObjects](v4->_userActivitiesQueuedForReporting, "removeAllObjects");
  -[NSMutableArray addObject:](v4->_userActivitiesQueuedForReporting, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)_loadContextKitIfNecessaryWithExecutor:(id)a3
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  if (!objc_lookUpClass("CKContextGlobals"))
  {
    objc_msgSend(v3, "markIncomplete");
    dispatch_get_global_queue(17, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__CKContextContentProviderManager__loadContextKitIfNecessaryWithExecutor___block_invoke;
    block[3] = &unk_1E6243148;
    v6 = v3;
    dispatch_async(v4, block);

  }
}

- (void)userActivityWasInvalidated:(id)a3
{
  if (a3)
    -[CKContextContentProviderManager _dequeueActivityForReporting:](self, "_dequeueActivityForReporting:");
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke_10()
{
  uint64_t state;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  state = notify_get_state(kContentTextExtractionNotificationToken, &state64);
  if ((_DWORD)state)
  {
    v1 = state;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __48__CKContextContentProviderManager_sharedManager__block_invoke_10_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
  if (state64 && (v9 = time(0) - (state64 & 0xFFFFFFFFFFLL), v9 >= 3))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v9;
      _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Ignoring outdated notification; delta=%llu seconds",
        buf,
        0xCu);
    }
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v11 = objc_msgSend((id)objc_opt_class(), "controlCodeForNonce:", state64);
    v12 = objc_msgSend((id)objc_opt_class(), "optionsForControlCode:", v11);
    v13 = (void *)sharedManager_instance;
    v14 = state64;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__CKContextContentProviderManager_sharedManager__block_invoke_12;
    v16[3] = &unk_1E62430E0;
    v17 = v10;
    v15 = v10;
    objc_msgSend(v13, "_prepareDonationWithNonce:options:isRecentsCapture:andReply:", v14, v12, 0, v16);

  }
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    v5[0] = 67109120;
    v5[1] = (int)(v4 * -1000.0);
    _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Donating to ContextService after %i ms.", (uint8_t *)v5, 8u);
  }
  objc_msgSend(v3, "donate");

}

+ (unint64_t)optionsForControlCode:(unsigned __int8)a3
{
  if ((a3 - 2) > 4)
    return 0;
  else
    return qword_1B0D48960[(char)(a3 - 2)];
}

+ (BOOL)isSafariContentProvider
{
  return isSafariContentProvider;
}

- (unint64_t)providerCount
{
  NSHashTable *v3;
  unint64_t v4;

  v3 = self->_providers;
  objc_sync_enter(v3);
  v4 = -[NSHashTable count](self->_providers, "count");
  objc_sync_exit(v3);

  return v4;
}

- (void)removeProvider:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_providers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_providers, "removeObject:", v5);
  objc_sync_exit(v4);

}

+ (unsigned)controlCodeForNonce:(unint64_t)a3
{
  return BYTE5(a3);
}

uint64_t __74__CKContextContentProviderManager__loadContextKitIfNecessaryWithExecutor___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getCKContextGlobalsClass_softClass;
  v9 = getCKContextGlobalsClass_softClass;
  if (!getCKContextGlobalsClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCKContextGlobalsClass_block_invoke;
    v5[3] = &unk_1E6243378;
    v5[4] = &v6;
    __getCKContextGlobalsClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(*(id *)(a1 + 32), "markReady");
}

- (void)_prepareDonationWithNonce:(unint64_t)a3 options:(unint64_t)a4 isRecentsCapture:(BOOL)a5 requiringMainQueue:(BOOL)a6 andReply:(id)a7
{
  _BOOL8 v8;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15[3];
  BOOL v16;
  id location;

  v8 = a5;
  v12 = a7;
  if (a6)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __114__CKContextContentProviderManager__prepareDonationWithNonce_options_isRecentsCapture_requiringMainQueue_andReply___block_invoke;
    v13[3] = &unk_1E6243170;
    objc_copyWeak(v15, &location);
    v14 = v12;
    v15[1] = (id)a3;
    v15[2] = (id)a4;
    v16 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CKContextContentProviderManager _prepareDonationWithNonce:options:isRecentsCapture:andReply:](self, "_prepareDonationWithNonce:options:isRecentsCapture:andReply:", a3, a4, v8, v12);
  }

}

void __114__CKContextContentProviderManager__prepareDonationWithNonce_options_isRecentsCapture_requiringMainQueue_andReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_prepareDonationWithNonce:options:isRecentsCapture:andReply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_prepareDonationWithNonce:(unint64_t)a3 options:(unint64_t)a4 isRecentsCapture:(BOOL)a5 andReply:(id)a6
{
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSHashTable *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t i;
  double v31;
  _BOOL4 v32;
  CKContextExecutor *v33;
  double v34;
  void *v35;
  double v36;
  dispatch_time_t v37;
  CKContextExecutor *v38;
  void *v39;
  void *v40;
  void *v41;
  NSHashTable *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v11)
    -[CKContextContentProviderManager _prepareDonationWithNonce:options:isRecentsCapture:andReply:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  v19 = objc_alloc(MEMORY[0x1E0D14370]);
  v20 = v19;
  if (donationBundleIdentifier)
  {
    v21 = (void *)objc_msgSend(v19, "initWithDonorBundleIdentifier:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "initWithDonorBundleIdentifier:", v23);

  }
  objc_msgSend(v21, "setNonce:", a3);
  v24 = objc_msgSend((id)objc_opt_class(), "controlCodeForNonce:", a3);
  if (a5
    || -[CKContextContentProviderManager _isDonationAllowedWithControlCode:](self, "_isDonationAllowedWithControlCode:", v24))
  {
    v25 = self->_providers;
    objc_sync_enter(v25);
    if (-[NSHashTable count](self->_providers, "count"))
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      -[NSHashTable allObjects](self->_providers, "allObjects");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v55;
        v29 = 0.75;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v55 != v28)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "timeout");
            if (v31 > v29)
              v29 = v31;
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v27);
      }
      else
      {
        v29 = 0.75;
      }

      objc_sync_exit(v25);
      v32 = v29 > 60.0;
      v33 = [CKContextExecutor alloc];
      v34 = v29 * 1000000000.0;
      dispatch_get_global_queue(25, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 6.0e10;
      if (!v32)
        v36 = v34;
      v37 = dispatch_time(0, (uint64_t)v36);
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __95__CKContextContentProviderManager__prepareDonationWithNonce_options_isRecentsCapture_andReply___block_invoke;
      v51[3] = &unk_1E6243198;
      v52 = v21;
      v53 = v10;
      v38 = -[CKContextExecutor initWithContext:workItemQueue:completionQueue:timeoutAfter:completionHandler:](v33, "initWithContext:workItemQueue:completionQueue:timeoutAfter:completionHandler:", v52, MEMORY[0x1E0C80D38], v35, v37, v51);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v39 = (void *)MEMORY[0x1E0CEAC20];
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "_unassociatedWindowSceneForScreen:create:", v40, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
          +[CKContextContentProviderUIScene extractFromScene:usingExecutor:withOptions:](CKContextContentProviderUIScene, "extractFromScene:usingExecutor:withOptions:", v41, v38, a4);

      }
      v42 = self->_providers;
      objc_sync_enter(v42);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      -[NSHashTable allObjects](self->_providers, "allObjects", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v48 != v45)
              objc_enumerationMutation(v43);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "extractUsingExecutor:withOptions:", v38, a4);
          }
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
        }
        while (v44);
      }

      objc_sync_exit(v42);
      -[CKContextContentProviderManager _loadContextKitIfNecessaryWithExecutor:](self, "_loadContextKitIfNecessaryWithExecutor:", v38);
      -[CKContextExecutor markReady](v38, "markReady");

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
      objc_sync_exit(v25);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __95__CKContextContentProviderManager__prepareDonationWithNonce_options_isRecentsCapture_andReply___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134217984;
    v8 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Extraction timed out; donations so far: %lu",
      (uint8_t *)&v7,
      0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)_isDonationAllowedWithControlCode:(unsigned __int8)a3
{
  int v3;
  id v4;
  BOOL v5;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = (id)*MEMORY[0x1E0CEB258];
  if ((forceIneligible & 1) != 0)
  {
LABEL_2:
    v5 = 0;
    goto LABEL_11;
  }
  if (v3 == 1 && (isSafariContentProvider & 1) == 0)
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v7)
      -[CKContextContentProviderManager _isDonationAllowedWithControlCode:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_2;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = v4 == 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "performSelector:", sel__shouldAllowContentTextContextExtraction))
    goto LABEL_2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[CKContextContentProviderManager _isDonationAllowedWithControlCode:].cold.1();
  v5 = 1;
LABEL_11:

  return v5;
}

+ (void)_observeApplicationStateNotifications
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CEB288], 0, 0, &__block_literal_global_0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CEB350], 0, 0, &__block_literal_global_38);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CEB270], 0, 0, &__block_literal_global_39);

}

void __72__CKContextContentProviderManager__observeApplicationStateNotifications__block_invoke()
{
  forceIneligible = 1;
}

void __72__CKContextContentProviderManager__observeApplicationStateNotifications__block_invoke_2()
{
  forceIneligible = 0;
}

void __72__CKContextContentProviderManager__observeApplicationStateNotifications__block_invoke_3()
{
  forceIneligible = 0;
}

void __81__CKContextContentProviderManager_scheduleUserActivityRecordingWithUserActivity___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_hasQueuedForReportingActivity:", *(_QWORD *)(a1 + 32));
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "_prepareAndExtractContentForUserActivity:bundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v3 = v5;
    }
  }

}

- (void)_prepareAndExtractContentForUserActivity:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CKContextContentProviderManager *v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[NSHashTable count](self->_providers, "count"))
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke;
    v8[3] = &unk_1E6243298;
    objc_copyWeak(&v12, &location);
    v9 = v7;
    v10 = self;
    v11 = v6;
    -[CKContextContentProviderManager _hasForegroundActiveContentWithReply:](self, "_hasForegroundActiveContentWithReply:", v8);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
    objc_initWeak(&location, WeakRetained);
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_40;
    block[3] = &unk_1E6243270;
    objc_copyWeak(&v15, &location);
    v14 = *(id *)(a1 + 48);
    dispatch_async(v12, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_40(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, int);
  void *v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_formContextUserActivityFromUserActivity:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_2;
      v9 = &unk_1E6243248;
      v5 = v3;
      v10 = v5;
      v11 = v4;
      objc_msgSend(v11, "prepareForDonationWithCompletionHandler:", &v6);
      objc_msgSend(v5, "_dequeueActivityForReporting:", *(_QWORD *)(a1 + 32), v6, v7, v8, v9);

    }
  }

}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_3;
    v3[3] = &unk_1E62430E0;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "_prepareDonationWithNonce:options:isRecentsCapture:requiringMainQueue:andReply:", 0, 0, 1, 1, v3);

  }
}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAssociatedUserActivity:", v2);
  objc_msgSend(v3, "donate");

}

- (void)_prepareAndDonateUserActivity:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    -[CKContextContentProviderManager _formContextUserActivityFromUserActivity:](self, "_formContextUserActivityFromUserActivity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __65__CKContextContentProviderManager__prepareAndDonateUserActivity___block_invoke;
      v6[3] = &unk_1E6243300;
      objc_copyWeak(&v8, &location);
      v7 = v4;
      objc_msgSend(v5, "prepareForDonationWithCompletionHandler:", v6);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }

  }
}

void __65__CKContextContentProviderManager__prepareAndDonateUserActivity___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (a2)
      objc_msgSend(WeakRetained, "_prepareDonationWithNonce:options:isRecentsCapture:andReply:", 0, 0, 1, &__block_literal_global_42);
    objc_msgSend(v5, "_dequeueActivityForReporting:", *(_QWORD *)(a1 + 32));
    WeakRetained = v5;
  }

}

uint64_t __65__CKContextContentProviderManager__prepareAndDonateUserActivity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "donate");
}

- (id)_formContextUserActivityFromUserActivity:(id)a3
{
  id v4;
  CKContextContentProviderManager *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D14380]), "initWithUserActivity:", v4);
      objc_msgSend(v8, "setBundleIdentifier:", v7);
    }
    else
    {
      v8 = 0;
    }

    objc_sync_exit(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_hasQueuedForReportingActivity:(id)a3
{
  id v4;
  CKContextContentProviderManager *v5;
  char v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableArray containsObject:](v5->_userActivitiesQueuedForReporting, "containsObject:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (void)_hasForegroundActiveContentWithReply:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CKContextContentProviderManager__hasForegroundActiveContentWithReply___block_invoke;
  block[3] = &unk_1E6243350;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__CKContextContentProviderManager__hasForegroundActiveContentWithReply___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = WeakRetained[1];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
            objc_msgSend(v10, "_scene", (_QWORD)v13);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "activationState");

            if (!v12)
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

              goto LABEL_15;
            }

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_15:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivitiesQueuedForReporting, 0);
  objc_storeStrong((id *)&self->_activityReportingQueue, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "Could not register for extraction; error:%u",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_3();
}

void __48__CKContextContentProviderManager_sharedManager__block_invoke_10_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "Could not get notification state; error:%i",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_3();
}

- (void)_prepareDonationWithNonce:(uint64_t)a3 options:(uint64_t)a4 isRecentsCapture:(uint64_t)a5 andReply:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "Preparing a donation...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_isDonationAllowedWithControlCode:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_1B0D39000, MEMORY[0x1E0C81028], v2, "The client %@ is allowed to donate", v3, v4, v5, v6, 2u);

}

- (void)_isDonationAllowedWithControlCode:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "The client is not allowed to donate due it being a Safari provider", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __93__CKContextContentProviderManager__prepareAndExtractContentForUserActivity_bundleIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "Preparing donation of user activity for foreground process: %@", a5, a6, a7, a8, 2u);
}

@end
