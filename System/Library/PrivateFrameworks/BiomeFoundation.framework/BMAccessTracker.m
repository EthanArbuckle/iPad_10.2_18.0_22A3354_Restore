@implementation BMAccessTracker

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_instance;
}

void __33__BMAccessTracker_sharedInstance__block_invoke()
{
  BMAccessTracker *v0;
  void *v1;

  v0 = objc_alloc_init(BMAccessTracker);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (BMAccessTracker)init
{
  BMAccessTracker *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMAccessTracker;
  v2 = -[BMAccessTracker init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

  }
  return v2;
}

- (void)logMissingEntitlementsForAccessToResource:(id)a3 domain:(unint64_t)a4 withMode:(unint64_t)a5 useCase:(id)a6
{
  id v10;
  void *v11;
  BMAccessDescriptor *v12;
  _PASLock *lock;
  id v14;
  BMAccessDescriptor *v15;
  id v16;
  _QWORD v17[4];
  BMAccessDescriptor *v18;
  id v19;
  BMAccessTracker *v20;

  v16 = a3;
  v10 = a6;
  v11 = (void *)MEMORY[0x1AF4569E0]();
  v12 = -[BMAccessDescriptor initWithDomain:accessMode:resource:]([BMAccessDescriptor alloc], "initWithDomain:accessMode:resource:", a4, a5, v16);
  lock = self->_lock;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__BMAccessTracker_logMissingEntitlementsForAccessToResource_domain_withMode_useCase___block_invoke;
  v17[3] = &unk_1E5E3C7C0;
  v18 = v12;
  v14 = v10;
  v19 = v14;
  v20 = self;
  v15 = v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v17);

  objc_autoreleasePoolPop(v11);
}

void __85__BMAccessTracker_logMissingEntitlementsForAccessToResource_domain_withMode_useCase___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;

  v23 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "mode");
  objc_msgSend(*(id *)(a1 + 32), "resource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v23;
  if (v23)
    v6 = (void *)v23[2];
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if ((v8 & 1) == 0)
  {
    if ((v3 & 2) != 0)
    {
      v18 = v23;
      if (v23)
        v18 = (void *)v23[2];
      objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v20 = (void *)objc_opt_new();
        v21 = v23;
        if (v23)
          v21 = (void *)v23[2];
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, *(_QWORD *)(a1 + 40));

      }
      v16 = (char *)v23;
      if (!v23)
        goto LABEL_25;
      v17 = 16;
      goto LABEL_24;
    }
    v9 = v23;
    if (v23)
      v9 = (void *)v23[1];
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v5);

    if ((v11 & 1) == 0)
    {
      v12 = v23;
      if (v23)
        v12 = (void *)v23[1];
      objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = (void *)objc_opt_new();
        v15 = v23;
        if (v23)
          v15 = (void *)v23[1];
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, *(_QWORD *)(a1 + 40));

      }
      v16 = (char *)v23;
      if (!v23)
        goto LABEL_25;
      v17 = 8;
LABEL_24:
      v16 = *(char **)&v16[v17];
LABEL_25:
      objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v5);

      objc_msgSend(*(id *)(a1 + 48), "_logMissingEntitlementsForAccess:useCase:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
  }

}

- (void)_logMissingEntitlementsForAccess:(id)a3 useCase:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;

  v5 = a3;
  v6 = a4;
  +[BMProcess current](BMProcess, "current");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v7, "processType") - 2) >= 7)
  {
    v8 = CFSTR("com.apple.biome.access.user");
    if (objc_msgSend(v5, "domain") == 1)
    {
      v9 = CFSTR("com.apple.biome.access.system");

      v8 = v9;
    }
    if ((objc_msgSend(v7, "canPerformGlobalMachLookup:report:", v8, 0) & 1) == 0)
    {
      __biome_log_for_category(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[BMAccessTracker _logMissingEntitlementsForAccess:useCase:].cold.3((uint64_t)v8, v10);

    }
    v11 = objc_msgSend(v6, "hasPrefix:", CFSTR("__"));
    __biome_log_for_category(6);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);
    if (v11)
    {
      if (v13)
        -[BMAccessTracker _logMissingEntitlementsForAccess:useCase:].cold.1(v5, v12);
    }
    else if (v13)
    {
      -[BMAccessTracker _logMissingEntitlementsForAccess:useCase:].cold.2(v5, (uint64_t)v6, v12);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)_logMissingEntitlementsForAccess:(void *)a1 useCase:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  BMAccessModePrintableDescription(objc_msgSend(a1, "mode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1AEB31000, a2, OS_LOG_TYPE_FAULT, "This process is not entitled for %@ access to %@", (uint8_t *)&v6, 0x16u);

}

- (void)_logMissingEntitlementsForAccess:(NSObject *)a3 useCase:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  BMAccessModePrintableDescription(objc_msgSend(a1, "mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_fault_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_FAULT, "This process is not entitled for %@ access to %@ for use case '%@'", (uint8_t *)&v8, 0x20u);

}

- (void)_logMissingEntitlementsForAccess:(uint64_t)a1 useCase:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AEB31000, a2, OS_LOG_TYPE_ERROR, "Warning: This process is missing mach-lookup entitlement for %@", (uint8_t *)&v2, 0xCu);
}

@end
