@implementation ICCompatibilityController

- (ICCompatibilityController)init
{
  ICCompatibilityController *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICCompatibilityController;
  v2 = -[ICCompatibilityController init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(-32768, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create_with_target_V2("com.apple.notes.compatibility-controller", v3, v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

+ (ICCompatibilityController)sharedController
{
  if (sharedController_onceToken_1 != -1)
    dispatch_once(&sharedController_onceToken_1, &__block_literal_global_57);
  return (ICCompatibilityController *)(id)sharedController_sharedController_0;
}

void __45__ICCompatibilityController_sharedController__block_invoke()
{
  ICCompatibilityController *v0;
  void *v1;

  v0 = objc_alloc_init(ICCompatibilityController);
  v1 = (void *)sharedController_sharedController_0;
  sharedController_sharedController_0 = (uint64_t)v0;

}

- (void)devicesForAccount:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  ICCompatibilityController *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "shortLoggingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    v24 = 2080;
    v25 = "-[ICCompatibilityController devicesForAccount:completionHandler:]";
    v26 = 1024;
    v27 = 57;
    _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_DEFAULT, "Retrieving compatibility devices for account… {account: %@}%s:%d", buf, 0x1Cu);

  }
  objc_msgSend(v6, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workerManagedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCompatibilityController queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke;
  v17[3] = &unk_1E76CDB50;
  v18 = v12;
  v19 = self;
  v20 = v10;
  v21 = v7;
  v14 = v10;
  v15 = v7;
  v16 = v12;
  dispatch_async(v13, v17);

}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2;
  v3[3] = &unk_1E76CE970;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performBlockAndWait:", v3);

}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  void (*v18)(void);
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v2 = (id *)(a1 + 32);
  if (!objc_msgSend(*(id *)(a1 + 32), "fakesIncompatibleDevicesForDebugging"))
  {
    objc_msgSend(*(id *)(a1 + 40), "ic_existingObjectWithID:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v21 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);

      v29 = *(_QWORD *)(a1 + 56);
      if (v29)
        (*(void (**)(uint64_t, _QWORD))(v29 + 16))(v29, 0);
      goto LABEL_30;
    }
    objc_msgSend(*v2, "cachedDevicesDateForAccount:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "cachedDevicesForAccount:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && v10
      && (objc_msgSend(v10, "timeIntervalSinceNow"),
          v13 = -v12,
          +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = (double)(unint64_t)objc_msgSend(v14, "unsupportedNoteDeviceCheckIntervalSeconds"),
          v14,
          v13 < v15))
    {
      v16 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_3(v11);

      v17 = *(_QWORD *)(a1 + 56);
      if (!v17)
        goto LABEL_29;
      v18 = *(void (**)(void))(v17 + 16);
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x1E0D64290], "isInternetReachable") & 1) != 0)
      {
        objc_msgSend(*v2, "fetchDevicesForAccount:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(*v2, "cacheDevices:forAccount:", v19, v5);
        v20 = *(_QWORD *)(a1 + 56);
        if (v20)
          (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v19);

        goto LABEL_29;
      }
      v30 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_4(v30, v31, v32, v33, v34, v35, v36, v37);

      v38 = *(_QWORD *)(a1 + 56);
      if (!v38)
        goto LABEL_29;
      v18 = *(void (**)(void))(v38 + 16);
    }
    v18();
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_1(v2);

  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    objc_msgSend(*v2, "fakeDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
LABEL_31:

  }
}

- (id)fetchDevicesForAccount:(id)a3
{
  id v3;
  NSObject *v4;
  ICDeviceListRequest *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = v3;
    v12 = 2080;
    v13 = "-[ICCompatibilityController fetchDevicesForAccount:]";
    v14 = 1024;
    v15 = 110;
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEFAULT, "Fetching compatibility devices for account… {account: %@}%s:%d", (uint8_t *)&v10, 0x1Cu);
  }

  v5 = -[ICDeviceListRequest initWithAccount:]([ICDeviceListRequest alloc], "initWithAccount:", v3);
  -[ICDeviceListRequest fetchWithCompletionBlock:](v5, "fetchWithCompletionBlock:", &__block_literal_global_11_0);
  -[ICDeviceListRequest waitForFetchWithTimeout:](v5, "waitForFetchWithTimeout:", 20.0);
  -[ICDeviceListRequest devices](v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICCompatibilityController fetchDevicesForAccount:].cold.1(v7);

  return v7;
}

void __52__ICCompatibilityController_fetchDevicesForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __52__ICCompatibilityController_fetchDevicesForAccount___block_invoke_cold_1();

  }
}

ICCompatibilityControllerDevice *__52__ICCompatibilityController_fetchDevicesForAccount___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  ICCompatibilityControllerDevice *v3;

  v2 = a2;
  v3 = -[ICCompatibilityControllerDevice initWithMigrationDeviceInfo:]([ICCompatibilityControllerDevice alloc], "initWithMigrationDeviceInfo:", v2);

  return v3;
}

- (id)cachedDevicesDateForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("AccountDevicesCacheDate-"), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)cachedDevicesForAccount:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "shortLoggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v5;
    v17 = 2080;
    v18 = "-[ICCompatibilityController cachedDevicesForAccount:]";
    v19 = 1024;
    v20 = 141;
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving cached compatibility devices for account… {account: %@}%s:%d", buf, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("AccountDevicesCache-"), "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedArrayOfObjectsOfClass:fromData:error:", objc_opt_class(), v9, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (v11)
    {
      v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ICCompatibilityController cachedDevicesForAccount:].cold.1();

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (void)cacheDevices:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = v8;
    v21 = 2080;
    v22 = "-[ICCompatibilityController cacheDevices:forAccount:]";
    v23 = 1024;
    v24 = 159;
    _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEFAULT, "Caching compatibility devices for account… {account: %@}%s:%d", buf, 0x1Cu);

  }
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v18;
  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICCompatibilityController cacheDevices:forAccount:].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("AccountDevicesCache-"), "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v9, v14);

    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("AccountDevicesCacheDate-"), "stringByAppendingString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v11, "setObject:forKey:", v15, v17);

  }
}

- (void)clearCachedDevicesForAccount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0D64188];
  v4 = a3;
  objc_msgSend(v3, "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("AccountDevicesCache-"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", 0, v7);

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("AccountDevicesCacheDate-"), "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", 0, v9);

}

- (void)messageForAccount:(id)a3 minimumNotesVersion:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  int64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "shortLoggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = v11;
    v19 = 2112;
    v21 = 2080;
    v20 = v12;
    v22 = "-[ICCompatibilityController messageForAccount:minimumNotesVersion:completionHandler:]";
    v23 = 1024;
    v24 = 181;
    _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving incompatibility messages for account… {account: %@, minimumNotesVersion: %@}%s:%d", buf, 0x26u);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__ICCompatibilityController_messageForAccount_minimumNotesVersion_completionHandler___block_invoke;
  v14[3] = &unk_1E76CEA40;
  v15 = v9;
  v16 = a4;
  v13 = v9;
  -[ICCompatibilityController devicesForAccount:completionHandler:](self, "devicesForAccount:completionHandler:", v8, v14);

}

void __85__ICCompatibilityController_messageForAccount_minimumNotesVersion_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__ICCompatibilityController_messageForAccount_minimumNotesVersion_completionHandler___block_invoke_2;
  v15[3] = &unk_1E76CEA18;
  v4 = *(_QWORD *)(a1 + 40);
  v15[4] = &v20;
  v15[5] = &v24;
  v15[6] = &v16;
  v15[7] = v4;
  objc_msgSend(v3, "ic_compactMap:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21[3])
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("*Device can’t be upgraded."), CFSTR("*Device can’t be upgraded."), 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = &stru_1E76DB108;
    v34[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25[3]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21[3]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17[3]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    v32 = 2112;
    v33 = v14;
    _os_log_debug_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEBUG, "Fetched incompatible devices for account {#devicesToUpgrade: %@, #nonUpgradableDevices %@, #upgradedDevices: %@}", buf, 0x20u);

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

id __85__ICCompatibilityController_messageForAccount_minimumNotesVersion_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "maximumNotesVersion") >= a1[7])
  {
    if (objc_msgSend(v3, "notesVersion") >= a1[7])
    {
      v6 = 0;
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    }
    else
    {
      ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      objc_msgSend(v3, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", CFSTR("%@*"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)fakesIncompatibleDevicesForDebugging
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fakesIncompatibleDevicesForDebugging);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "BOOLForKey:", v3);

  return v4;
}

- (void)setFakesIncompatibleDevicesForDebugging:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fakesIncompatibleDevicesForDebugging);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, v4);

}

- (NSArray)fakeDevices
{
  return self->_fakeDevices;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fakeDevices, 0);
}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_1(id *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*a1, "fakeDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v4, v5, "Returning fake compatibility devices for debugging {#devices: %@}", v6, v7, v8, v9, v10);

}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Cannot retrieve compatibility devices for account because it has no Apple Account", a5, a6, a7, a8, 0);
}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Returning compatibility cached devices {#devices: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCompatibilityController_devicesForAccount_completionHandler___block_invoke_2_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Cannot retrieve compatibility devices for account because the device is offline", a5, a6, a7, a8, 0);
}

- (void)fetchDevicesForAccount:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Fetched compatibility devices for account {#devices: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __52__ICCompatibilityController_fetchDevicesForAccount___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1BD918000, v0, OS_LOG_TYPE_DEBUG, "Error fetching compatibility devices for account {error: %@}", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)cachedDevicesForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error retrieving compatibility devices {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cacheDevices:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error caching compatibility devices {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
