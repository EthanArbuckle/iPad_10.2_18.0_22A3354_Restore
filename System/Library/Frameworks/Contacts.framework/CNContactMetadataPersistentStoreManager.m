@implementation CNContactMetadataPersistentStoreManager

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_1_2 != -1)
    dispatch_once(&os_log_cn_once_token_1_2, &__block_literal_global_105);
  return (OS_os_log *)(id)os_log_cn_once_object_1_2;
}

void __49__CNContactMetadataPersistentStoreManager_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNContactMetadata");
  v1 = (void *)os_log_cn_once_object_1_2;
  os_log_cn_once_object_1_2 = (uint64_t)v0;

}

+ (id)currentManagedObjectModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CNContactMetadataPersistentStoreManager_currentManagedObjectModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentManagedObjectModel_cn_once_token_2 != -1)
    dispatch_once(&currentManagedObjectModel_cn_once_token_2, block);
  return (id)currentManagedObjectModel_cn_once_object_2;
}

void __68__CNContactMetadataPersistentStoreManager_currentManagedObjectModel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "createModel");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)currentManagedObjectModel_cn_once_object_2;
  currentManagedObjectModel_cn_once_object_2 = v1;

}

+ (id)createModel
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("CNContactMetadata"), CFSTR("momd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(a1, "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CNContactMetadataPersistentStoreManager createModel].cold.1(v5, v6, v7);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v4);

  return v8;
}

+ (id)sharedPersistentContainerForModel:(id)a3 storeLocation:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C97BC8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithName:managedObjectModel:", CFSTR("CNContactMetadata"), v7);

  objc_msgSend((id)objc_opt_class(), "storeFileURLForLocation:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97C08], "persistentStoreDescriptionWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOption:forKey:", v12, *MEMORY[0x1E0C97918]);

  v13 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v10, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97868]);
  objc_msgSend(v10, "setOption:forKey:", v13, *MEMORY[0x1E0C978D0]);
  v16 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPersistentStoreDescriptions:", v14);

  return v8;
}

+ (id)storeFileURLForLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(CFSTR("CNContactMetadata"), "stringByAppendingString:", CFSTR(".db"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultStoreLocation
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(CFSTR("/var/mobile/"), "stringByAppendingPathComponent:", CFSTR("Library"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("ContactsMetadata"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedPersistentContainerForStoreLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "currentManagedObjectModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedPersistentContainerForModel:storeLocation:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNContactMetadataPersistentStoreManager)init
{
  void *v3;
  CNContactMetadataPersistentStoreManager *v4;

  objc_msgSend((id)objc_opt_class(), "defaultStoreLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNContactMetadataPersistentStoreManager initWithStoreLocation:](self, "initWithStoreLocation:", v3);

  return v4;
}

- (CNContactMetadataPersistentStoreManager)initWithStoreLocation:(id)a3
{
  id v4;
  CNContactMetadataPersistentStoreManager *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  CNContactMetadataPersistentStoreManager *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  CNContactMetadataPersistentStoreManager *v16;
  id v17;

  v4 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __65__CNContactMetadataPersistentStoreManager_initWithStoreLocation___block_invoke;
  v15 = &unk_1E29F7CE0;
  v5 = self;
  v16 = v5;
  v17 = v4;
  v6 = initWithStoreLocation__cn_once_token_4;
  v7 = v4;
  if (v6 != -1)
    dispatch_once(&initWithStoreLocation__cn_once_token_4, &v12);
  v8 = v17;
  v9 = (id)initWithStoreLocation__cn_once_object_4;

  v10 = -[CNContactMetadataPersistentStoreManager initWithStoreLocation:container:](v5, "initWithStoreLocation:container:", v7, v9, v12, v13, v14, v15);
  return v10;
}

void __65__CNContactMetadataPersistentStoreManager_initWithStoreLocation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend((id)objc_opt_class(), "sharedPersistentContainerForStoreLocation:", *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)initWithStoreLocation__cn_once_object_4;
  initWithStoreLocation__cn_once_object_4 = v1;

}

- (CNContactMetadataPersistentStoreManager)initWithStoreLocation:(id)a3 container:(id)a4
{
  id v7;
  id v8;
  CNContactMetadataPersistentStoreManager *v9;
  CNContactMetadataPersistentStoreManager *v10;
  CNContactMetadataPersistentStoreManager *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactMetadataPersistentStoreManager;
  v9 = -[CNContactMetadataPersistentStoreManager init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeLocation, a3);
    objc_storeStrong((id *)&v10->_container, a4);
    -[CNContactMetadataPersistentStoreManager setupIfNeeded](v10, "setupIfNeeded");
    v11 = v10;
  }

  return v10;
}

- (BOOL)performWorkWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[CNContactMetadataPersistentStoreManager persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentStores");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[CNContactMetadataPersistentStoreManager createManagedObjectContext](self, "createManagedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__CNContactMetadataPersistentStoreManager_performWorkWithManagedObjectContext_error___block_invoke;
    v14[3] = &unk_1E29FCD30;
    v15 = v10;
    v16 = v6;
    v11 = v10;
    objc_msgSend(v11, "performBlockAndWait:", v14);

  }
  else
  {
    -[CNContactMetadataPersistentStoreManager loadPersistentStoresError](self, "loadPersistentStoresError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (a4)
    {
      v11 = objc_retainAutorelease(v12);
      *a4 = v11;
    }
  }

  return v9 != 0;
}

uint64_t __85__CNContactMetadataPersistentStoreManager_performWorkWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)createManagedObjectContext
{
  void *v2;
  void *v3;

  -[CNContactMetadataPersistentStoreManager container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newBackgroundContext");

  return v3;
}

- (void)setupIfNeeded
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Failed to setup store: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __56__CNContactMetadataPersistentStoreManager_setupIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v6)
  {
    objc_msgSend(WeakRetained, "setLoadPersistentStoresError:", v6);
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __56__CNContactMetadataPersistentStoreManager_setupIfNeeded__block_invoke_cold_1(v6);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_INFO, "Loaded container with description: %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (id)persistentStoreCoordinator
{
  void *v2;
  void *v3;

  -[CNContactMetadataPersistentStoreManager container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)storeDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[CNContactMetadataPersistentStoreManager container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)createStoreDirectoryIfNeeded:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  char v9;
  id v10;
  BOOL v11;
  NSObject *v13;
  id v14;
  id v15;

  -[CNContactMetadataPersistentStoreManager storeLocation](self, "storeLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
LABEL_4:
    v10 = v8;
    v11 = 1;
    goto LABEL_5;
  }
  v15 = 0;
  v9 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v15);
  v8 = v15;
  if ((v9 & 1) != 0)
    goto LABEL_4;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[CNContactMetadataPersistentStoreManager createStoreDirectoryIfNeeded:].cold.1();

  v14 = v8;
  v10 = v14;
  if (a3)
  {
    v10 = objc_retainAutorelease(v14);
    v11 = 0;
    *a3 = v10;
  }
  else
  {
    v11 = 0;
  }
LABEL_5:

  return v11;
}

+ (BOOL)performLightweightMigrationIfNeededError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  NSObject *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v20;
  id v21;
  uint8_t buf[8];
  id v23;

  objc_msgSend((id)objc_opt_class(), "defaultStoreLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "storeFileURLForLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C979E8];
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:options:error:", v6, v5, 0, &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  v9 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13820] + 16))();
  v10 = (void *)objc_opt_class();
  if (!v9)
  {
    objc_msgSend(v10, "currentManagedObjectModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "isConfiguration:compatibleWithStoreMetadata:", 0, v7);
      v16 = (void *)objc_opt_class();
      if (!v15)
      {
        objc_msgSend(v16, "sharedPersistentContainerForModel:storeLocation:", v14, v4);
        v17 = objc_claimAutoreleasedReturnValue();

        v21 = 0;
        v12 = -[NSObject load:](v17, "load:", &v21);
        v8 = v21;
        if ((v12 & 1) == 0)
        {
          objc_msgSend((id)objc_opt_class(), "os_log");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            +[CNContactMetadataPersistentStoreManager performLightweightMigrationIfNeededError:].cold.2(v8);

          if (a3)
          {
            v8 = objc_retainAutorelease(v8);
            *a3 = v8;
          }
        }
        goto LABEL_15;
      }
      objc_msgSend(v16, "os_log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "Did not perform migration, existing model is already compatible with store metadata";
LABEL_13:
        _os_log_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "Did not perform migration, no existing managed object model found";
        goto LABEL_13;
      }
    }
    v12 = 0;
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v10, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    +[CNContactMetadataPersistentStoreManager performLightweightMigrationIfNeededError:].cold.1(v8);

  if (a3)
  {
    v8 = objc_retainAutorelease(v8);
    v12 = 0;
    *a3 = v8;
  }
  else
  {
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (NSURL)storeLocation
{
  return self->_storeLocation;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (NSError)loadPersistentStoresError
{
  return self->_loadPersistentStoresError;
}

- (void)setLoadPersistentStoresError:(id)a3
{
  objc_storeStrong((id *)&self->_loadPersistentStoresError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadPersistentStoresError, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_storeLocation, 0);
}

+ (void)createModel
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = CFSTR("CNContactMetadata");
  OUTLINED_FUNCTION_1_3(&dword_18F8BD000, a1, a3, "Could not find model named %@", (uint8_t *)&v3);
}

void __56__CNContactMetadataPersistentStoreManager_setupIfNeeded__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Failed to load persistent stores: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)createStoreDirectoryIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_3(&dword_18F8BD000, v0, v1, "Failed to create ContactMetadata store location - %@", v2);
}

+ (void)performLightweightMigrationIfNeededError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Did not perform migration, no store metadata found, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)performLightweightMigrationIfNeededError:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Did not perform migration, failed to load persistent stores: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
