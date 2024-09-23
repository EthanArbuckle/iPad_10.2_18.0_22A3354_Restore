@implementation ATXLockscreenBlacklist

- (ATXLockscreenBlacklist)init
{
  ATXLockscreenBlacklist *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  uint64_t v7;
  ATXLockscreenBlacklist *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id notificationCenterToken;
  const char *v14;
  int *p_libnotifyToken;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _QWORD handler[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[4];
  ATXLockscreenBlacklist *v25;
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)ATXLockscreenBlacklist;
  v2 = -[ATXLockscreenBlacklist init](&v28, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__ATXLockscreenBlacklist_init__block_invoke;
    aBlock[3] = &unk_1E82E6000;
    objc_copyWeak(&v26, &location);
    v8 = v2;
    v25 = v8;
    v9 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __30__ATXLockscreenBlacklist_init__block_invoke_19;
    v22[3] = &unk_1E82E6028;
    v11 = v9;
    v23 = v11;
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.duetexpertd.prefschanged"), 0, 0, v22);
    v12 = objc_claimAutoreleasedReturnValue();
    notificationCenterToken = v8->_notificationCenterToken;
    v8->_notificationCenterToken = (id)v12;

    v14 = (const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.prefschanged"), "UTF8String");
    p_libnotifyToken = &v8->_libnotifyToken;
    dispatch_get_global_queue(9, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    handler[0] = v7;
    handler[1] = 3221225472;
    handler[2] = __30__ATXLockscreenBlacklist_init__block_invoke_2_21;
    handler[3] = &unk_1E82E6050;
    v17 = v11;
    v21 = v17;
    LODWORD(v11) = notify_register_dispatch(v14, p_libnotifyToken, v16, handler);

    if ((_DWORD)v11)
    {
      __atxlog_handle_default();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXLockscreenBlacklist init].cold.1(v18);

    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__ATXLockscreenBlacklist_init__block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  _BOOL4 v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  objc_class *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "runWithLockAcquired:", &__block_literal_global_143);
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v6)
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v8;
        v9 = "%@ - lockscreen blacklist update before daemon launch";
LABEL_7:
        _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);

      }
    }
    else if (v6)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v8;
      v9 = "%@ - lockscreen blacklist update";
      goto LABEL_7;
    }

    ATXUpdatePredictionsImmediatelyWithReason(15);
  }

}

void __30__ATXLockscreenBlacklist_init__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v2;
  _QWORD *v3;
  id v4;

  v2 = (void *)a2[1];
  a2[1] = 0;
  v3 = a2;

  v4 = (id)v3[2];
  v3[2] = 0;

}

uint64_t __30__ATXLockscreenBlacklist_init__block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __30__ATXLockscreenBlacklist_init__block_invoke_2_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  int libnotifyToken;
  void *v4;
  objc_super v5;

  libnotifyToken = self->_libnotifyToken;
  if (libnotifyToken)
    notify_cancel(libnotifyToken);
  if (self->_notificationCenterToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_notificationCenterToken);

  }
  v5.receiver = self;
  v5.super_class = (Class)ATXLockscreenBlacklist;
  -[ATXLockscreenBlacklist dealloc](&v5, sel_dealloc);
}

+ (ATXLockscreenBlacklist)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ATXLockscreenBlacklist_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken9 != -1)
    dispatch_once(&sharedInstance__pasOnceToken9, block);
  return (ATXLockscreenBlacklist *)(id)sharedInstance__pasExprOnceResult_33;
}

void __40__ATXLockscreenBlacklist_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_33;
  sharedInstance__pasExprOnceResult_33 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)blacklist
{
  _PASLock *lock;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__66;
  v12 = __Block_byref_object_dispose__66;
  v13 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ATXLockscreenBlacklist_blacklist__block_invoke;
  v7[3] = &unk_1E82E6078;
  v7[4] = self;
  v7[5] = &v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = (void *)v9[5];
  if (v3)
    v4 = v3;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __35__ATXLockscreenBlacklist_blacklist__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[1];
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  }
  else
  {
    v5 = (void *)CFPreferencesCopyValue(CFSTR("LockscreenSuggestionsDisabledBundles"), CFSTR("com.apple.duetexpertd"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_opt_new();
    v8 = v7;

    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "removeObject:", CFSTR("com.apple.application"));
    objc_msgSend(v9, "removeObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    objc_msgSend(v9, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
    objc_msgSend(v9, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
    if (objc_msgSend(v8, "containsObject:", CFSTR("com.apple.DocumentsApp")))
    {
      objc_msgSend(v9, "addObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
      objc_msgSend(v9, "addObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
      objc_msgSend(v9, "addObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);

    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "blacklistedAppsForLockscreenPredictions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setByAddingObjectsFromArray:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v3[1];
    v3[1] = (id)v13;

    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v3[1];
      v19 = 138412546;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "%@ read lockscreen action blacklist: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3[1]);

  }
}

- (BOOL)isPredictionGloballyDisabled
{
  _PASLock *lock;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ATXLockscreenBlacklist_isPredictionGloballyDisabled__block_invoke;
  v5[3] = &unk_1E82E6078;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __54__ATXLockscreenBlacklist_isPredictionGloballyDisabled__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)v3[2];
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFPreferencesGetAppBooleanValue(CFSTR("LockScreenSuggestionsDisabled"), CFSTR("com.apple.lockscreen.shared"), 0) != 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v3[2];
    v3[2] = v5;

    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v11 = 138412546;
      v12 = v9;
      v13 = 1024;
      v14 = v10;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%@ - read lockscreen action global disabled: %d", (uint8_t *)&v11, 0x12u);

    }
  }

}

+ (id)appsLockedOrHiddenByAppProtection
{
  return (id)objc_msgSend(MEMORY[0x1E0CF8CD8], "hiddenOrLockedBundleIDs");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationCenterToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)init
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = CFSTR("com.apple.duetexpertd.prefschanged");
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Failed to register notification callback for %@", (uint8_t *)&v1, 0xCu);
}

@end
