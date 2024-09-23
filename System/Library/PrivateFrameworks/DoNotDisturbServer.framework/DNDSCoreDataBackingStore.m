@implementation DNDSCoreDataBackingStore

- (id)_initWithURL:(id)a3
{
  id v5;
  DNDSCoreDataBackingStore *v6;
  id *p_isa;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSCoreDataBackingStore;
  v6 = -[DNDSCoreDataBackingStore init](&v9, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    v6->_setupLock._os_unfair_lock_opaque = 0;
    if (v5)
    {
      if (os_variant_has_internal_content())
        objc_storeStrong(p_isa + 3, a3);
    }
  }

  return p_isa;
}

- (void)setupPersistentStoreIfNeeded
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Failed to create backing store directory.", v1, 2u);
}

void __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = DNDSLogSettings;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT))
      __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke_cold_2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *MEMORY[0x1E0C979E8];
    v29 = 0;
    objc_msgSend(v14, "destroyPersistentStoreAtURL:withType:options:error:", v15, v16, 0, &v29);
    v17 = v29;

    v18 = DNDSLogSettings;
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT))
        __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke_cold_1((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v31 = v28;
      _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Destroyed persistent store to retry load. url=%@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v5;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Loaded persistent store with description: %@", buf, 0xCu);
    }
    v25 = *(void **)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 48);
    v27 = v25;
    v17 = *(id *)(v26 + 16);
    *(_QWORD *)(v26 + 16) = v27;
  }

}

- (id)newManagedObjectContext
{
  NSManagedObjectContext *v3;

  -[DNDSCoreDataBackingStore setupPersistentStoreIfNeeded](self, "setupPersistentStoreIfNeeded");
  v3 = -[NSPersistentContainer newBackgroundContext](self->_persistentContainer, "newBackgroundContext");
  -[NSManagedObjectContext setMergePolicy:](v3, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDatabaseURL, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

void __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1CB895000, a2, a3, "Failed to destroy persistent store: %@", a5, a6, a7, a8, 2u);
}

void __56__DNDSCoreDataBackingStore_setupPersistentStoreIfNeeded__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1CB895000, a2, a3, "Error adding persistent store: %@", a5, a6, a7, a8, 2u);
}

@end
