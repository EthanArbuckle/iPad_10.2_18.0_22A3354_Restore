@implementation ATXBackupService

+ (BOOL)isBackupRestore
{
  int AppBooleanValue;
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LOBYTE(v6[0]) = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ATXBackupStateUserDefault"), (CFStringRef)*MEMORY[0x1E0CF9510], (Boolean *)v6);
  v3 = _ATXRestoreIsInProgress();
  __atxlog_handle_backup();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = AppBooleanValue != 0;
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "db restore state - %{BOOL}u, mobile backup restore state - %{BOOL}u", (uint8_t *)v6, 0xEu);
  }

  if (AppBooleanValue)
    return 1;
  else
    return v3;
}

- (ATXBackupService)initWithContainerIdentifier:(id)a3 backupFileManager:(id)a4
{
  id v7;
  id v8;
  ATXBackupService *v9;
  ATXBackupService *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *serialQueue;
  void *v14;
  id WeakRetained;
  id v16;
  uint64_t v17;
  NSUserDefaults *atxDefaults;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATXBackupService;
  v9 = -[ATXBackupService init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_containerIdentifier, a3);
    objc_storeStrong((id *)&v10->_backupFileManager, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.duetexpertd.atxbackup", v11);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v12;

    +[ATXCloudStorageSettingsListener sharedInstance](ATXCloudStorageSettingsListener, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_cloudStorageSettingsListener, v14);

    WeakRetained = objc_loadWeakRetained((id *)&v10->_cloudStorageSettingsListener);
    objc_msgSend(WeakRetained, "setDelegate:", v10);

    v16 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v17 = objc_msgSend(v16, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    atxDefaults = v10->_atxDefaults;
    v10->_atxDefaults = (NSUserDefaults *)v17;

    -[ATXBackupService updateIsRestoreStarted:](v10, "updateIsRestoreStarted:", 0);
  }

  return v10;
}

- (void)updateIsRestoreStarted:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_backup();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "DB restore state is: %{BOOL}u", (uint8_t *)v6, 8u);
  }

  -[NSUserDefaults setBool:forKey:](self->_atxDefaults, "setBool:forKey:", v3, CFSTR("ATXBackupStateUserDefault"));
}

- (void)backupWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ATXBackupService_backupWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E82DA8E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __48__ATXBackupService_backupWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)os_transaction_create();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "writeBackupFileForD2D");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__ATXBackupService_backupWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E82DA8C0;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  objc_msgSend(v3, "writeBackupToiCloud:", v6);

}

id __48__ATXBackupService_backupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return (id)objc_opt_self();
}

- (void)restoreFromBackupIfNeccessary:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke;
  v7[3] = &unk_1E82DA8E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id keyExistsAndHasValidFormat[2];

  v2 = (void *)os_transaction_create();
  LOBYTE(keyExistsAndHasValidFormat[0]) = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("ATXBackupStateUserDefault"), (CFStringRef)*MEMORY[0x1E0CF9510], (Boolean *)keyExistsAndHasValidFormat))
  {
    __atxlog_handle_backup();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "updateIsRestoreStarted:", 0);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isMobileBackupRestoreNeeded"))
  {
    __atxlog_handle_backup();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(keyExistsAndHasValidFormat[0]) = 0;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "restoring from MobileBackup", (uint8_t *)keyExistsAndHasValidFormat, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "updateIsRestoreStarted:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "restoreFromMobileBackup");
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "updateIsRestoreStarted:", 0);
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_14:
    v6();
    goto LABEL_15;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isD2DRestoreNeeded"))
  {
    __atxlog_handle_backup();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(keyExistsAndHasValidFormat[0]) = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "restoring from D2D", (uint8_t *)keyExistsAndHasValidFormat, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "updateIsRestoreStarted:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "restoreFromD2D");
    goto LABEL_13;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isRestoreNeeded"))
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_14;
  }
  __atxlog_handle_backup();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(keyExistsAndHasValidFormat[0]) = 0;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "restoring from iCloud", (uint8_t *)keyExistsAndHasValidFormat, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateIsRestoreStarted:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containerIDForCloudKitRestore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(keyExistsAndHasValidFormat, *(id *)(a1 + 32));
  v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke_17;
  v10[3] = &unk_1E82DA910;
  objc_copyWeak(&v13, keyExistsAndHasValidFormat);
  v12 = *(id *)(a1 + 40);
  v11 = v2;
  objc_msgSend(v9, "restoreFromBackupWithRetries:fromContainerID:completionHandler:", 10, v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(keyExistsAndHasValidFormat);

LABEL_15:
}

void __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke_17(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "updateIsRestoreStarted:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_opt_self();

}

- (void)writeBackupToiCloud:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_cloudStorageSettingsListener);
  v6 = objc_msgSend((id)objc_opt_class(), "isBackupForSiriEnabled");

  if ((v6 & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__ATXBackupService_writeBackupToiCloud___block_invoke;
    v8[3] = &unk_1E82DA988;
    v8[4] = self;
    v9 = v4;
    -[ATXBackupService initializeCloudKitClientWithCompletionHandler:withRetryBlock:](self, "initializeCloudKitClientWithCompletionHandler:withRetryBlock:", v8, &__block_literal_global_2);

  }
  else
  {
    __atxlog_handle_backup();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "iCloud backup is not enabled for Siri dataclass, not backing up...", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __40__ATXBackupService_writeBackupToiCloud___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__ATXBackupService_writeBackupToiCloud___block_invoke_2;
    v8[3] = &unk_1E82DA960;
    v8[4] = v7;
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "getDeviceIDWithCompletionHandler:", v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __40__ATXBackupService_writeBackupToiCloud___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "writeBackupFileForDeviceID:pareDown:", a2, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16) == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__ATXBackupService_writeBackupToiCloud___block_invoke_3;
  v7[3] = &unk_1E82DA938;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "saveBackupAsset:completionHandler:", v5, v7);

}

void __40__ATXBackupService_writeBackupToiCloud___block_invoke_3(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  __atxlog_handle_backup();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "backup file succesfully uploaded to container", v8, 2u);
    }

    objc_msgSend(*(id *)(a1[4] + 24), "commitWithContainerIdentifier:", a1[5]);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __40__ATXBackupService_writeBackupToiCloud___block_invoke_3_cold_1();

  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)initializeCloudKitClientWithCompletionHandler:(id)a3 withRetryBlock:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  ATXCloudKitClient *v9;
  ATXCloudKitClient *ckClient;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  serialQueue = self->_serialQueue;
  v8 = a4;
  dispatch_assert_queue_V2(serialQueue);
  +[ATXCloudKitClient clientWithContainerIdentifier:useManatee:callbackQueue:](ATXCloudKitClient, "clientWithContainerIdentifier:useManatee:callbackQueue:", self->_containerIdentifier, 1, self->_serialQueue);
  v9 = (ATXCloudKitClient *)objc_claimAutoreleasedReturnValue();
  ckClient = self->_ckClient;
  self->_ckClient = v9;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__ATXBackupService_initializeCloudKitClientWithCompletionHandler_withRetryBlock___block_invoke;
  v12[3] = &unk_1E82DA9D0;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[ATXBackupService isManateeAvailableWithCompletionHandler:withRetryBlock:](self, "isManateeAvailableWithCompletionHandler:withRetryBlock:", v12, v8);

}

void __81__ATXBackupService_initializeCloudKitClientWithCompletionHandler_withRetryBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  if (!v5 || (a2 & 1) != 0)
  {
    if (a2)
    {
      *(_BYTE *)(v6 + 16) = 1;
      v8 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    }
    else
    {
      objc_msgSend(*(id *)(v6 + 48), "stringByAppendingString:", CFSTR(".non-manatee"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
      +[ATXCloudKitClient clientWithContainerIdentifier:useManatee:callbackQueue:](ATXCloudKitClient, "clientWithContainerIdentifier:useManatee:callbackQueue:", v8, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 32);
      *(_QWORD *)(v10 + 32) = v9;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)isManateeAvailableWithCompletionHandler:(id)a3 withRetryBlock:(id)a4
{
  id v6;
  id v7;
  ATXCloudKitClient *ckClient;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  ckClient = self->_ckClient;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke;
  v11[3] = &unk_1E82DAA48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[ATXCloudKitClient fetchAccountInfoWithCompletionHandler:](ckClient, "fetchAccountInfoWithCompletionHandler:", v11);

}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *);
  void *v28;
  uint64_t v29;
  id v30;
  uint8_t *v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(v5, "accountStatus");
    switch(v7)
    {
      case 0:
      case 2:
      case 3:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CloudKit container is not accessible. Status: %ld"), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_backup();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_1();

        v40 = *MEMORY[0x1E0CB2D50];
        v41[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATXBackupService"), 1, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        break;
      case 1:
        v22 = (objc_msgSend(v5, "deviceToDeviceEncryptionAvailability") & 1) == 0;
        __atxlog_handle_backup();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_3();

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "Manatee is available", buf, 2u);
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
        break;
      case 4:
        __atxlog_handle_backup();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_4();

        *(_QWORD *)buf = 0;
        v33 = buf;
        v34 = 0x3032000000;
        v35 = __Block_byref_object_copy_;
        v36 = __Block_byref_object_dispose_;
        v37 = 0;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *MEMORY[0x1E0C94690];
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_32;
        v28 = &unk_1E82DAA20;
        v15 = *(_QWORD *)(a1 + 32);
        v31 = buf;
        v29 = v15;
        v30 = *(id *)(a1 + 48);
        objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v14, 0, 0, &v25);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)*((_QWORD *)v33 + 5);
        *((_QWORD *)v33 + 5) = v16;

        _Block_object_dispose(buf, 8);
        goto LABEL_10;
      default:
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("iCloud account status: %ld"), v7, v25, v26, v27, v28, v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_backup();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_1();

        v38 = *MEMORY[0x1E0CB2D50];
        v39 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATXBackupService"), 1, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        break;
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_32(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  __atxlog_handle_backup();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "CKAccountChangedNotification notification received", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  v4 = (void *)a1[5];
  v5 = *(NSObject **)(a1[4] + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_33;
  block[3] = &unk_1E82DA9F8;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setupRecordZoneWithName:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  id v9;
  void *v10;
  ATXCloudKitClient *ckClient;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ATXBackupService *v16;
  id v17;

  v6 = a4;
  serialQueue = self->_serialQueue;
  v8 = a3;
  dispatch_assert_queue_V2(serialQueue);
  v9 = objc_alloc(MEMORY[0x1E0C95098]);
  v10 = (void *)objc_msgSend(v9, "initWithZoneName:ownerName:", v8, *MEMORY[0x1E0C94730]);

  ckClient = self->_ckClient;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke;
  v14[3] = &unk_1E82DAA70;
  v15 = v10;
  v16 = self;
  v17 = v6;
  v12 = v6;
  v13 = v10;
  -[ATXCloudKitClient fetchRecordZone:completionHandler:](ckClient, "fetchRecordZone:completionHandler:", v13, v14);

}

void __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    __atxlog_handle_backup();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_cold_2();

    if (+[ATXBackupService isCloudKitError:](ATXBackupService, "isCloudKitError:", v6)
      && objc_msgSend(v6, "code") == 26)
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", a1[4]);
      objc_msgSend(*(id *)(a1[5] + 32), "saveRecordZone:completionHandler:", v5, a1[6]);
    }
    else
    {
      if (!+[ATXBackupService isManateeDecryptionError:](ATXBackupService, "isManateeDecryptionError:", v6))
      {
        (*(void (**)(void))(a1[6] + 16))();
        goto LABEL_4;
      }
      __atxlog_handle_backup();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_cold_1();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", a1[4]);
      v10 = a1[5];
      v11 = (void *)a1[6];
      v12 = *(void **)(v10 + 32);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_41;
      v13[3] = &unk_1E82DA938;
      v13[4] = v10;
      v14 = v9;
      v15 = v11;
      v5 = v9;
      objc_msgSend(v12, "deleteRecordZone:completionHandler:", v5, v13);

    }
  }

LABEL_4:
}

uint64_t __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_41(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "saveRecordZone:completionHandler:", a1[5], a1[6]);
}

- (void)saveBackupAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSString *deviceID;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6)
  {
    deviceID = self->_deviceID;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke;
    v9[3] = &unk_1E82DAAC0;
    v11 = v7;
    v9[4] = self;
    v10 = v6;
    -[ATXBackupService setupRecordZoneWithName:completionHandler:](self, "setupRecordZoneWithName:completionHandler:", deviceID, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[ATXBackupService queryForBackupsWithDeviceID:](ATXBackupService, "queryForBackupsWithDeviceID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_43;
    v13[3] = &unk_1E82DAA98;
    v14 = v6;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v8, "fetchRecords:inZone:completionHandler:", v7, v9, v13);

  }
  else
  {
    __atxlog_handle_backup();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    __atxlog_handle_backup();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_43_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0C95048]);
    objc_msgSend(*(id *)(a1 + 40), "zoneID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v15, "initWithRecordType:zoneID:", CFSTR("backups"), v16);

    objc_msgSend(v14, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56), CFSTR("deviceUUID"));
  }
  __atxlog_handle_backup();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 56);
    v21 = 138412290;
    v22 = v18;
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "backup url %@", (uint8_t *)&v21, 0xCu);
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileURL:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("backupFile"));
  __atxlog_handle_backup();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "uploading asset...", (uint8_t *)&v21, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "saveRecord:completionHandler:", v14, *(_QWORD *)(a1 + 64));
}

- (void)fetchBackupAssetWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXCloudKitClient *ckClient;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_backup();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "fetching backup asset", buf, 2u);
  }

  -[ATXBackupFileManager deviceID](self->_backupFileManager, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", v6);
    +[ATXBackupService queryForBackupsWithDeviceID:](ATXBackupService, "queryForBackupsWithDeviceID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ckClient = self->_ckClient;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E82DAAE8;
    v12 = v4;
    -[ATXCloudKitClient fetchRecords:inZone:completionHandler:](ckClient, "fetchRecords:inZone:completionHandler:", v8, v7, v11);
    v10 = v12;
  }
  else
  {
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("Unable to fetch backup asset. No device identifier set or is empty string");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ATXBackupService"), 1, v7);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);
    __atxlog_handle_backup();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXBackupService fetchBackupAssetWithCompletionHandler:].cold.1();
  }

}

void __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_backup();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke_cold_2();
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("backupFile"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      goto LABEL_7;
    }
    __atxlog_handle_backup();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_7:

}

- (void)restoreFromBackupWithRetries:(unint64_t)a3 fromContainerID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  ATXCloudKitClient *v16;
  ATXCloudKitClient *ckClient;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD aBlock[5];
  id v28;
  id v29;
  unint64_t v30;

  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a3)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke;
    aBlock[3] = &unk_1E82DAB10;
    aBlock[4] = self;
    v30 = a3;
    v11 = v8;
    v28 = v11;
    v12 = v9;
    v29 = v12;
    v13 = _Block_copy(aBlock);
    if (v11)
    {
      -[NSString stringByAppendingString:](self->_containerIdentifier, "stringByAppendingString:", CFSTR(".non-manatee"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "isEqualToString:", v14);
      if ((v15 & 1) != 0 || (objc_msgSend(v11, "isEqualToString:", self->_containerIdentifier) & 1) != 0)
      {
        +[ATXCloudKitClient clientWithContainerIdentifier:useManatee:callbackQueue:](ATXCloudKitClient, "clientWithContainerIdentifier:useManatee:callbackQueue:", self->_containerIdentifier, v15 ^ 1u, self->_serialQueue);
        v16 = (ATXCloudKitClient *)objc_claimAutoreleasedReturnValue();
        ckClient = self->_ckClient;
        self->_ckClient = v16;

        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_55;
        v24[3] = &unk_1E82DAB38;
        v24[4] = self;
        v25 = v13;
        v26 = v12;
        -[ATXBackupService fetchBackupAssetWithCompletionHandler:](self, "fetchBackupAssetWithCompletionHandler:", v24);

      }
      else
      {
        __atxlog_handle_backup();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          -[ATXBackupService restoreFromBackupWithRetries:fromContainerID:completionHandler:].cold.3();

        (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
      }

    }
    else
    {
      __atxlog_handle_backup();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ATXBackupService restoreFromBackupWithRetries:fromContainerID:completionHandler:].cold.2();

      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_57;
      v21[3] = &unk_1E82DAB60;
      v21[4] = self;
      v22 = v13;
      v23 = v12;
      -[ATXBackupService initializeCloudKitClientWithCompletionHandler:withRetryBlock:](self, "initializeCloudKitClientWithCompletionHandler:withRetryBlock:", v21, v22);

    }
  }
  else
  {
    __atxlog_handle_backup();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[ATXBackupService restoreFromBackupWithRetries:fromContainerID:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

uint64_t __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "restoreFromBackupWithRetries:fromContainerID:completionHandler:", *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_55(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "retryIfNeededInResponseToError:withBlock:", a3, *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    __atxlog_handle_backup();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "backup asset successfully fetched", v7, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "restoreFromBackup:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_57(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  uint8_t buf[16];

  __atxlog_handle_backup();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "initialized CloudKit client", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_58;
  v4[3] = &unk_1E82DAB38;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v5, "fetchBackupAssetWithCompletionHandler:", v4);

}

void __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_58(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "retryIfNeededInResponseToError:withBlock:", a3, *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    __atxlog_handle_backup();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "backup asset successfully fetched", v7, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "restoreFromBackup:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)getDeviceIDWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  ATXCloudKitClient *ckClient;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_deviceID)
  {
    v4[2](v4);
  }
  else
  {
    ckClient = self->_ckClient;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E82DAB88;
    v6[4] = self;
    v7 = v4;
    -[ATXCloudKitClient fetchCurrentDeviceIDWithCompletionHandler:](ckClient, "fetchCurrentDeviceIDWithCompletionHandler:", v6);

  }
}

void __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke_cold_1();
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "length"))
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke_cold_2();
LABEL_7:

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = v5;
  v10 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)queryForBackupsWithDeviceID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deviceUUID == %@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("backups"), v3);

  return v4;
}

- (BOOL)retryIfNeededInResponseToError:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  OS_dispatch_queue *serialQueue;
  void *v27;
  OS_dispatch_queue *v28;
  NSObject *v29;
  void *v30;
  OS_dispatch_queue *v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  _QWORD v42[5];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[9];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (+[ATXBackupService isCloudKitError:](ATXBackupService, "isCloudKitError:", v6))
    {
      objc_msgSend((id)objc_opt_class(), "allErrorsFromCloudKitError:", v6);
      memset(v51, 0, 64);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", v51, v52, 16);
      v10 = v9 != 0;
      if (v9)
      {
        v11 = *(void **)v51[1];
        if (objc_msgSend(*(id *)v51[1], "code") == 111)
        {
          __atxlog_handle_backup();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[ATXBackupService retryIfNeededInResponseToError:withBlock:].cold.1();

          v45 = 0;
          v46 = &v45;
          v47 = 0x3032000000;
          v48 = __Block_byref_object_copy_;
          v49 = __Block_byref_object_dispose_;
          v50 = 0;
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *MEMORY[0x1E0C94870];
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke;
          v42[3] = &unk_1E82DAA20;
          v44 = &v45;
          v42[4] = self;
          v43 = v7;
          objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v14, 0, 0, v42);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v46[5];
          v46[5] = v15;

          _Block_object_dispose(&v45, 8);
        }
        else if (objc_msgSend(v11, "code") == 110)
        {
          __atxlog_handle_backup();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[ATXBackupService retryIfNeededInResponseToError:withBlock:].cold.2();

          v45 = 0;
          v46 = &v45;
          v47 = 0x3032000000;
          v48 = __Block_byref_object_copy_;
          v49 = __Block_byref_object_dispose_;
          v50 = 0;
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *MEMORY[0x1E0C94690];
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_64;
          v39[3] = &unk_1E82DAA20;
          v41 = &v45;
          v39[4] = self;
          v40 = v7;
          objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", v19, 0, 0, v39);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v46[5];
          v46[5] = v20;

          _Block_object_dispose(&v45, 8);
        }
        else if (CKCanRetryForError())
        {
          CKRetryAfterSecondsForError();
          if (v22 >= 1.0)
            v23 = v22;
          else
            v23 = 1.0;
          __atxlog_handle_backup();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[ATXBackupService retryIfNeededInResponseToError:withBlock:].cold.3();

          v25 = (void *)MEMORY[0x1E0D81598];
          serialQueue = self->_serialQueue;
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_67;
          v37[3] = &unk_1E82DA9F8;
          v38 = v7;
          objc_msgSend(v25, "runAsyncOnQueue:afterDelaySeconds:block:", serialQueue, v37, v23);

        }
        else if (objc_msgSend(v11, "code") == 9)
        {
          v27 = (void *)MEMORY[0x1E0D81598];
          v28 = self->_serialQueue;
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_2;
          v35[3] = &unk_1E82DA9F8;
          v36 = v7;
          objc_msgSend(v27, "runAsyncOnQueue:afterDelaySeconds:block:", v28, v35, 1.0);

        }
        else
        {
          __atxlog_handle_backup();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            -[ATXBackupService retryIfNeededInResponseToError:withBlock:].cold.4();

          v30 = (void *)MEMORY[0x1E0D81598];
          v31 = self->_serialQueue;
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_68;
          v33[3] = &unk_1E82DA9F8;
          v34 = v7;
          objc_msgSend(v30, "runAsyncOnQueue:afterDelaySeconds:block:", v31, v33, 10.0);

        }
      }

    }
    else
    {
      __atxlog_handle_backup();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXBackupService retryIfNeededInResponseToError:withBlock:].cold.5();
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  __atxlog_handle_backup();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "CKIdentityUpdateNotification notification received", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  v4 = (void *)a1[5];
  v5 = *(NSObject **)(a1[4] + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_63;
  block[3] = &unk_1E82DA9F8;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_64(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  __atxlog_handle_backup();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "CKAccountChangedNotification notification received", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  v4 = (void *)a1[5];
  v5 = *(NSObject **)(a1[4] + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_65;
  block[3] = &unk_1E82DA9F8;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)allErrorsFromCloudKitError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "code") == 2)
  {
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C94940];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v3, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
  }
  else if (objc_msgSend(v3, "code") == 1)
  {
    objc_msgSend(v3, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C947D8]);

    if (v14)
    {
      v17[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v16 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (BOOL)isCloudKitError:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C94B20]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  }
  return v5;
}

+ (BOOL)isManateeDecryptionError:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  if (!+[ATXBackupService isCloudKitError:](ATXBackupService, "isCloudKitError:", v3))
  {
    v4 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "code") != 112)
  {
    v5 = v3;
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    {
      v7 = objc_msgSend(v5, "code");

      if (v7 == 1)
      {
        objc_msgSend(v5, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "code");
        v4 = 1;
        if ((unint64_t)(v10 - 5000) < 5 || v10 == 112)
          goto LABEL_13;
        goto LABEL_12;
      }
    }
    else
    {

    }
    v9 = v5;
LABEL_12:
    v4 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v4 = 1;
LABEL_14:

  return v4;
}

- (void)handleDeleteDataRequest
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ATXBackupService_handleDeleteDataRequest__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __43__ATXBackupService_handleDeleteDataRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  __atxlog_handle_backup();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Deleting all backups", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ATXBackupService_handleDeleteDataRequest__block_invoke_70;
  v5[3] = &unk_1E82DABF0;
  v5[4] = v3;
  return objc_msgSend(v3, "initializeCloudKitClientWithCompletionHandler:withRetryBlock:", v5, &__block_literal_global_74);
}

void __43__ATXBackupService_handleDeleteDataRequest__block_invoke_70(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a4;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "deviceID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", v7);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "deleteRecordZone:completionHandler:", v8, &__block_literal_global_72);

    }
    else
    {
      __atxlog_handle_backup();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Skipping iCloud deletion because no backup has been made", v10, 2u);
      }

    }
  }
  else
  {
    __atxlog_handle_backup();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__ATXBackupService_handleDeleteDataRequest__block_invoke_70_cold_1();
  }

}

void __43__ATXBackupService_handleDeleteDataRequest__block_invoke_71(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  __atxlog_handle_backup();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Backups deleted", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __43__ATXBackupService_handleDeleteDataRequest__block_invoke_71_cold_1();
  }

}

- (ATXBackupFileManager)backupFileManager
{
  return self->_backupFileManager;
}

- (void)setBackupFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_backupFileManager, a3);
}

- (ATXCloudKitClient)ckClient
{
  return self->_ckClient;
}

- (void)setCkClient:(id)a3
{
  objc_storeStrong((id *)&self->_ckClient, a3);
}

- (ATXCloudStorageSettingsListener)cloudStorageSettingsListener
{
  return (ATXCloudStorageSettingsListener *)objc_loadWeakRetained((id *)&self->_cloudStorageSettingsListener);
}

- (void)setCloudStorageSettingsListener:(id)a3
{
  objc_storeWeak((id *)&self->_cloudStorageSettingsListener, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (BOOL)isManatee
{
  return self->_isManatee;
}

- (void)setIsManatee:(BOOL)a3
{
  self->_isManatee = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_destroyWeak((id *)&self->_cloudStorageSettingsListener);
  objc_storeStrong((id *)&self->_ckClient, 0);
  objc_storeStrong((id *)&self->_backupFileManager, 0);
  objc_storeStrong((id *)&self->_atxDefaults, 0);
}

+ (id)backupService
{
  ATXBackupFileManager *v3;
  void *v4;
  void *v5;
  ATXBackupFileManager *v6;
  void *v7;

  v3 = [ATXBackupFileManager alloc];
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXBackupFileManager initWithBackupDirectory:dataProviderDelegate:](v3, "initWithBackupDirectory:dataProviderDelegate:", v4, v5);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContainerIdentifier:backupFileManager:", CFSTR("com.apple.ProactivePredictionsBackup"), v6);
  return v7;
}

void __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "restore state shouldn't be YES at this point", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __40__ATXBackupService_writeBackupToiCloud___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "backup file failed to uploaded with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "iCloud account doesn't support end-to-end encryption: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "account status is CKAccountStatusTemporarilyUnavailable, listening for CKAccountChangedNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Manatee identity is lost; the current record zone will no longer be readable %@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error fetching record zone: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error setting up record zone: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_43_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error fetching records %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchBackupAssetWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Error fetching backup asset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "No results with the backed up device id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error fetching backup asset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)restoreFromBackupWithRetries:fromContainerID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "retry count exceeded, restore failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)restoreFromBackupWithRetries:fromContainerID:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "no container identifier, falling back to existing restore flow", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)restoreFromBackupWithRetries:fromContainerID:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "unknown container identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Fetched DeviceID was nil, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Fetched DeviceID was empty string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Keychain is still syncing, listening for CKIdentityUpdateNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "listening for CKAccountChangedNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_1C9A3B000, v1, OS_LOG_TYPE_ERROR, "Retrying retryable error %@ in %lu seconds", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "unrecoverable error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Unknown error: (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __43__ATXBackupService_handleDeleteDataRequest__block_invoke_70_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Failed to initialize CloudKit client %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __43__ATXBackupService_handleDeleteDataRequest__block_invoke_71_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error deleting all backups: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
