@implementation NTKBundleComplicationMigrationProvider

- (void)migratedComplicationFromType:(os_log_t)log family:device:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Attempted to load cached type migration, but the lookup hasn't been loaded yet!", v1, 2u);
}

- (id)migratedComplicationFromType:(unint64_t)a3 family:(int64_t)a4 device:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NTKBundleComplicationMigrationTypeLookupKey *v11;
  void *v12;
  NSObject *v13;

  v8 = a5;
  v9 = -[NTKBundleComplicationMigrationProvider _loadMigrationCacheForDevice:](self, "_loadMigrationCacheForDevice:", v8);
  -[NTKBundleComplicationMigrationProvider _cachedLookupForDevice:](self, "_cachedLookupForDevice:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[NTKBundleComplicationMigrationTypeLookupKey initWithComplicationType:family:]([NTKBundleComplicationMigrationTypeLookupKey alloc], "initWithComplicationType:family:", a3, a4);
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NTKBundleComplicationMigrationProvider migratedComplicationFromType:family:device:].cold.1(v13);

    v12 = 0;
  }

  return v12;
}

- (NTKBundleComplicationMigrationProvider)init
{
  NTKBundleComplicationMigrationProvider *v2;
  NTKBundleComplicationMigrationProvider *v3;
  uint64_t v4;
  NSMutableDictionary *typeMigrationCaches;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKBundleComplicationMigrationProvider;
  v2 = -[NTKBundleComplicationMigrationProvider init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cachesLock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    typeMigrationCaches = v3->_typeMigrationCaches;
    v3->_typeMigrationCaches = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__handleDeviceDidUpdate_, *MEMORY[0x1E0C93E48], 0);

  }
  return v3;
}

- (BOOL)hasTypeLookupForDevice:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NTKBundleComplicationMigrationProvider _cachedLookupForDevice:](self, "_cachedLookupForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    v7 = -[NTKBundleComplicationMigrationProvider _loadMigrationCacheForDevice:](self, "_loadMigrationCacheForDevice:", v4);
    -[NTKBundleComplicationMigrationProvider _cachedLookupForDevice:](self, "_cachedLookupForDevice:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 != 0;

  }
  return v6;
}

- (id)_loadMigrationCacheForDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  os_unfair_lock_s *p_cachesLock;
  void *v29;
  NSMutableDictionary *typeMigrationCaches;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v44;
  void *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKBundleComplicationMigrationProvider _cachedLookupForDevice:](self, "_cachedLookupForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NTKBundleComplicationMigrationServiceLookupPathForDevice(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

    if (!v9)
    {
      v6 = 0;
LABEL_33:

      goto LABEL_34;
    }
    NTKBundleComplicationMigrationServiceGetLookupVersion(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      NTKBundleComplicationMigrationCurrentVersion();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
      {
        v47 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v7, 0, &v47);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v47;
        v15 = v14;
        if (v13)
        {
          _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = os_signpost_id_generate(v16);
          v18 = v16;
          v19 = v18;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B72A3000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "load migration cache", ", buf, 2u);
          }

          v45 = v13;
          v46 = v15;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, &v46);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v46;

          v22 = v19;
          v23 = v22;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B72A3000, v23, OS_SIGNPOST_INTERVAL_END, v17, "load migration cache", ", buf, 2u);
          }

          v24 = v20;
          if (v20)
          {
            v44 = v23;
            objc_msgSend(v20, "buildVersion");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            NTKBundleComplicationMigrationCurrentVersion();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "isEqual:", v26);

            v13 = v45;
            if ((v27 & 1) != 0)
            {
              p_cachesLock = &self->_cachesLock;
              os_unfair_lock_lock(&self->_cachesLock);
              objc_msgSend(v24, "dictionary");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              typeMigrationCaches = self->_typeMigrationCaches;
              objc_msgSend(v4, "descriptor");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](typeMigrationCaches, "setObject:forKeyedSubscript:", v29, v31);

              os_unfair_lock_unlock(p_cachesLock);
              _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v24, "dictionary");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "count");
                *(_DWORD *)buf = 134217984;
                v49 = (const char *)v34;
                _os_log_impl(&dword_1B72A3000, v32, OS_LOG_TYPE_DEFAULT, "Loaded type migration cache with %lu entries", buf, 0xCu);

              }
            }
            else
            {
              _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B72A3000, v32, OS_LOG_TYPE_DEFAULT, "Loaded lookup from a different version", buf, 2u);
              }
            }

            v6 = 0;
            v23 = v44;
          }
          else
          {
            _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
            v42 = objc_claimAutoreleasedReturnValue();
            v13 = v45;
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B72A3000, v42, OS_LOG_TYPE_DEFAULT, "Failed to decode type lookup container", buf, 2u);
            }

            v6 = v21;
          }

        }
        else
        {
          v21 = v14;
          v6 = v21;
        }

        goto LABEL_32;
      }
      _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v49 = "-[NTKBundleComplicationMigrationProvider _loadMigrationCacheForDevice:]";
        _os_log_impl(&dword_1B72A3000, v21, OS_LOG_TYPE_DEFAULT, "%s: xattr build version mismatched, not loading cache", buf, 0xCu);
      }
    }
    else
    {
      _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[NTKBundleComplicationMigrationProvider _loadMigrationCacheForDevice:].cold.1(v21, v35, v36, v37, v38, v39, v40, v41);
    }
    v6 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v6 = 0;
LABEL_34:

  return v6;
}

- (id)_cachedLookupForDevice:(id)a3
{
  os_unfair_lock_s *p_cachesLock;
  id v5;
  NSMutableDictionary *typeMigrationCaches;
  void *v7;
  void *v8;

  p_cachesLock = &self->_cachesLock;
  v5 = a3;
  os_unfair_lock_lock(p_cachesLock);
  typeMigrationCaches = self->_typeMigrationCaches;
  objc_msgSend(v5, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](typeMigrationCaches, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cachesLock);
  return v8;
}

+ (NTKBundleComplicationMigrationProvider)cachedInstance
{
  NTKBundleComplicationMigrationProvider *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&cachedInstance__lock);
  v2 = (NTKBundleComplicationMigrationProvider *)(id)cachedInstance__instance;
  if (!v2)
  {
    v2 = objc_alloc_init(NTKBundleComplicationMigrationProvider);
    objc_storeStrong((id *)&cachedInstance__instance, v2);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedInstance__lock);
  return v2;
}

- (void)serviceRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[NTKBundleComplicationMigrationServiceClient sharedInstance](NTKBundleComplicationMigrationServiceClient, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceRequest:completion:", v6, v5);

}

- (void)ensureTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint8_t v18[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[NTKBundleComplicationMigrationProvider _loadMigrationCacheForDevice:](self, "_loadMigrationCacheForDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKBundleComplicationMigrationProvider ensureTypeLookupForDevice:completion:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
  -[NTKBundleComplicationMigrationProvider _cachedLookupForDevice:](self, "_cachedLookupForDevice:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v7[2](v7, 0);
  }
  else
  {
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "Requesting type lookup...", v18, 2u);
    }

    -[NTKBundleComplicationMigrationProvider _fetchTypeLookupForDevice:completion:](self, "_fetchTypeLookupForDevice:completion:", v6, v7);
  }

}

- (void)_fetchTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD aBlock[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke;
  aBlock[3] = &unk_1E6BD3F30;
  v9 = v7;
  v20 = v9;
  v10 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  +[NTKBundleComplicationMigrationServiceClient sharedInstance](NTKBundleComplicationMigrationServiceClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke_2;
  v14[3] = &unk_1E6BD4608;
  v12 = v10;
  v16 = v12;
  objc_copyWeak(&v17, &location);
  v13 = v6;
  v15 = v13;
  objc_msgSend(v11, "generateTypeLookupForDevice:completion:", v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

uint64_t __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_loadMigrationCacheForDevice:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke_2_cold_1(v5);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)_handleDeviceDidUpdate:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Received device did update capabilities or pairing: %@", buf, 0xCu);
      }

      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __65__NTKBundleComplicationMigrationProvider__handleDeviceDidUpdate___block_invoke;
      v8[3] = &unk_1E6BCE728;
      v9 = v5;
      v7 = v5;
      -[NTKBundleComplicationMigrationProvider _regenerateTypeLookupForDevice:completion:](self, "_regenerateTypeLookupForDevice:completion:", v7, v8);

    }
  }

}

void __65__NTKBundleComplicationMigrationProvider__handleDeviceDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__NTKBundleComplicationMigrationProvider__handleDeviceDidUpdate___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Finished regenerating type lookup for device: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_regenerateTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *typeMigrationCaches;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Regenerating type lookup for device %@", (uint8_t *)&v11, 0xCu);
  }

  os_unfair_lock_lock(&self->_cachesLock);
  typeMigrationCaches = self->_typeMigrationCaches;
  objc_msgSend(v6, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](typeMigrationCaches, "setObject:forKeyedSubscript:", 0, v10);

  os_unfair_lock_unlock(&self->_cachesLock);
  -[NTKBundleComplicationMigrationProvider _fetchTypeLookupForDevice:completion:](self, "_fetchTypeLookupForDevice:completion:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_typeMigrationCaches, 0);
}

- (void)ensureTypeLookupForDevice:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Error loading type lookup: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_loadMigrationCacheForDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a1, a3, "%s: file exists but no xattr build version found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __79__NTKBundleComplicationMigrationProvider__fetchTypeLookupForDevice_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B72A3000, log, OS_LOG_TYPE_FAULT, "Generated type lookup remotely but failed to load from disk", v1, 2u);
}

void __65__NTKBundleComplicationMigrationProvider__handleDeviceDidUpdate___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Error regenerating type lookup for device %@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
