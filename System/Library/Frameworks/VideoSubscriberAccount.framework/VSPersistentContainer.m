@implementation VSPersistentContainer

uint64_t __38__VSPersistentContainer_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSManagedObjectContext)viewContext
{
  return self->_viewContext;
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[VSPersistentContainer viewContext](self, "viewContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__VSPersistentContainer_performBlock___block_invoke;
  v8[3] = &unk_1E939F1A8;
  v9 = v5;
  v10 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (id)developerIdentityProviderFetchRequest
{
  return (id)+[VSDeveloperIdentityProvider fetchRequest](VSDeveloperIdentityProvider, "fetchRequest");
}

+ (id)legacyDirectoryURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)directoryURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v18;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      VSErrorLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[VSPersistentContainer directoryURL].cold.1();
      v8 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      VSErrorLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[VSPersistentContainer directoryURL].cold.2();
      goto LABEL_21;
    }
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [directoryURL path] parameter must not be nil."));
    objc_msgSend(v8, "path");
    v10 = objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v11 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 0, 0, &v18);
    v12 = v18;
    v13 = v12;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v12, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0CB28A8]))
      {
        v15 = objc_msgSend(v13, "code");

        if (v15 == 516)
          goto LABEL_20;
      }
      else
      {

      }
      VSErrorLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[VSPersistentContainer directoryURL].cold.3();

    }
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v8 = 0;
LABEL_22:

  return v8;
}

- (void)migrateContainerIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error migrating legacy developer store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (VSPersistentContainer)initWithModelVersion:(int64_t)a3
{
  VSPersistentContainer *v4;
  VSPersistentContainer *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSPersistentContainer *persistentContainer;
  id v12;
  NSPersistentContainer *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSManagedObjectContext *viewContext;
  void *v18;
  uint8_t v20[16];
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)VSPersistentContainer;
  v4 = -[VSPersistentContainer init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    -[VSPersistentContainer migrateContainerIfNecessary](v4, "migrateContainerIfNecessary");
    v5->_modelVersion = a3;
    objc_msgSend(MEMORY[0x1E0C97B98], "vs_developerModeModelForVersion:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "directoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("DeveloperIdentityProviders.sqlite"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)*MEMORY[0x1E0C979E8];
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97BC8]), "initWithName:managedObjectModel:", CFSTR("Developer Identity Providers"), v6);
    persistentContainer = v5->_persistentContainer;
    v5->_persistentContainer = (NSPersistentContainer *)v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C97C08]);
    objc_msgSend(v12, "setURL:", v8);
    objc_msgSend(v12, "setType:", v9);
    objc_msgSend(v12, "setConfiguration:", 0);
    objc_msgSend(v12, "setShouldAddStoreAsynchronously:", 0);
    objc_msgSend(v12, "setShouldMigrateStoreAutomatically:", 1);
    objc_msgSend(v12, "setShouldInferMappingModelAutomatically:", 1);
    v13 = v5->_persistentContainer;
    v22[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersistentContainer setPersistentStoreDescriptions:](v13, "setPersistentStoreDescriptions:", v14);

    VSDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D2419000, v15, OS_LOG_TYPE_DEFAULT, "Will load persistent stores for developer identity providers.", v20, 2u);
    }

    -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v5->_persistentContainer, "loadPersistentStoresWithCompletionHandler:", &__block_literal_global_7);
    -[NSPersistentContainer viewContext](v5->_persistentContainer, "viewContext");
    v16 = objc_claimAutoreleasedReturnValue();
    viewContext = v5->_viewContext;
    v5->_viewContext = (NSManagedObjectContext *)v16;

    -[VSPersistentContainer viewContext](v5, "viewContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMergePolicy:", *MEMORY[0x1E0C978D8]);

  }
  return v5;
}

void __46__VSPersistentContainer_initWithModelVersion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Did load persistent stores for developer identity providers.", v6, 2u);
  }

  if (v3)
  {
    VSErrorLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__VSPersistentContainer_initWithModelVersion___block_invoke_cold_1();

  }
}

- (VSPersistentContainer)init
{
  return -[VSPersistentContainer initWithModelVersion:](self, "initWithModelVersion:", 3);
}

- (id)insertDeveloperIdentityProviderInContext:(id)a3
{
  id v3;
  VSDeveloperIdentityProvider *v4;

  v3 = a3;
  v4 = -[VSDeveloperIdentityProvider initWithContext:]([VSDeveloperIdentityProvider alloc], "initWithContext:", v3);

  return v4;
}

- (int64_t)modelVersion
{
  return self->_modelVersion;
}

- (void)setViewContext:(id)a3
{
  objc_storeStrong((id *)&self->_viewContext, a3);
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
}

+ (void)directoryURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error creating container directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__VSPersistentContainer_initWithModelVersion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error loading persistent stores: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
