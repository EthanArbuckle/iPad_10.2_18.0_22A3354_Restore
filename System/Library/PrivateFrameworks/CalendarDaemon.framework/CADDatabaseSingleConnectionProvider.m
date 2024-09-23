@implementation CADDatabaseSingleConnectionProvider

- (CADDatabaseSingleConnectionProvider)initWithConfiguration:(id)a3
{
  id v5;
  CADDatabaseSingleConnectionProvider *v6;
  CADDatabaseSingleConnectionProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADDatabaseSingleConnectionProvider;
  v6 = -[CADDatabaseSingleConnectionProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_initOptions, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0D0BB30], "cleanupDeallocatedClients");
  v3.receiver = self;
  v3.super_class = (Class)CADDatabaseSingleConnectionProvider;
  -[CADDatabaseSingleConnectionProvider dealloc](&v3, sel_dealloc);
}

- (void)_prepareDatabase:(CalDatabase *)a3 withConfiguration:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CalDatabaseSetClientIdentifier();

  objc_msgSend(v4, "clientName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CalDatabaseSetClientName();

  objc_msgSend(v4, "inMemoryChangeTrackingClientID");
  CalDatabaseSetInMemoryChangeTrackingID();
}

- (BOOL)performWithConfiguration:(id)a3 priority:(unint64_t)a4 databaseID:(int)a5 block:(id)a6
{
  uint64_t v7;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = (void (**)(id, void *))a6;
  os_unfair_lock_lock(&self->_lock);
  -[CADDatabaseSingleConnectionProvider _databases](self, "_databases");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    CFRetain(v13);
    os_unfair_lock_unlock(&self->_lock);
    -[CADDatabaseSingleConnectionProvider _prepareDatabase:withConfiguration:](self, "_prepareDatabase:withConfiguration:", v13, v9);
    v10[2](v10, v13);
    CFRelease(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v13 != 0;
}

- (void)performWithAllDatabasesWithConfiguration:(id)a3 priority:(unint64_t)a4 block:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, void *, _BYTE *);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, void *, _BYTE *))a5;
  os_unfair_lock_lock(&self->_lock);
  -[CADDatabaseSingleConnectionProvider _databases](self, "_databases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  os_unfair_lock_unlock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
      v17 = objc_msgSend(v16, "intValue");
      objc_msgSend(v11, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[CADDatabaseSingleConnectionProvider _prepareDatabase:withConfiguration:](self, "_prepareDatabase:withConfiguration:", v18, v7);
      v19 = 0;
      v8[2](v8, v17, v18, &v19);
      if (v19)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (int)databaseRestoreGeneration
{
  CADDatabaseSingleConnectionProvider *v2;
  os_unfair_lock_s *p_lock;
  id v4;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[CADDatabaseSingleConnectionProvider _databases](v2, "_databases");
  LODWORD(v2) = v2->_databaseRestoreGeneration;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)_databaseRestoreGenerationChanged:(int)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, "Database restore generation changed to %d", (uint8_t *)v6, 8u);
  }
  self->_databaseRestoreGeneration = a3;
}

- (void)databaseRestoreGenerationChanged:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;

  v3 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[CADDatabaseSingleConnectionProvider _databaseRestoreGenerationChanged:](self, "_databaseRestoreGenerationChanged:", v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)addCreatedAuxDatabase:(CalDatabase *)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t AuxilliaryDatabaseID;
  NSMutableDictionary *databases;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_databases)
  {
    AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
    databases = self->_databases;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", AuxilliaryDatabaseID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](databases, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        v16[0] = 67109120;
        v16[1] = AuxilliaryDatabaseID;
        _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_INFO, "Ignoring attempt to add a database already known to the connection (id = %d)", (uint8_t *)v16, 8u);
      }
    }
    else
    {
      v12 = self->_databases;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", AuxilliaryDatabaseID);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", a3, v13);

      v14 = (void *)MEMORY[0x1E0D0BB30];
      -[NSMutableDictionary allValues](self->_databases, "allValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setInterestedDatabases:forContext:", v15, self);

    }
  }
  else
  {
    v11 = -[CADDatabaseSingleConnectionProvider _databases](self, "_databases");
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)validateAuxDatabases
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *databases;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  databases = self->_databases;
  if (databases)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D0BE78]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](databases, "objectForKeyedSubscript:", v5);

    if (CalDatabaseGetAuxDatabaseChangesSequence() != self->_auxDatabaseSequence)
      -[CADDatabaseSingleConnectionProvider _closeDatabases](self, "_closeDatabases");
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_databases
{
  NSMutableDictionary *databases;
  NSObject *v4;
  CADDatabaseInitializationOptions *initOptions;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  const void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int UID;
  void *v30;
  NSMutableDictionary *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CADDatabaseInitializationOptions *v40;
  NSObject *v41;
  void *v42;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  _BYTE v56[14];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  databases = self->_databases;
  if (!databases)
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      initOptions = self->_initOptions;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v56 = initOptions;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEBUG, "Creating database with options [%@]", buf, 0xCu);
    }
    v6 = objc_alloc(MEMORY[0x1E0D0BB38]);
    -[CADDatabaseInitializationOptions databaseDirectory](self->_initOptions, "databaseDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithDirectoryURL:", v7);

    objc_msgSend(v8, "setOptions:", -[CADDatabaseInitializationOptions databaseInitOptions](self->_initOptions, "databaseInitOptions"));
    -[CADDatabaseInitializationOptions calendarDataContainerProvider](self->_initOptions, "calendarDataContainerProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "setDataContainerProvider:", v9);
    v10 = CalDatabaseCreateWithConfiguration();
    if (v10)
    {
      v11 = (const void *)v10;
      v44 = v9;
      v45 = v8;
      self->_auxDatabaseSequence = CalDatabaseGetAuxDatabaseChangesSequence();
      v12 = (void *)CalDatabaseCopyAllAuxDatabases();
      v13 = objc_msgSend(v12, "count");
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v13 + 1);
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v15 = self->_databases;
      self->_databases = v14;

      v16 = self->_databases;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D0BE78]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v11, v17);

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v51 != v21)
              objc_enumerationMutation(v18);
            -[CADDatabaseInitializationOptions databaseInitOptions](self->_initOptions, "databaseInitOptions", v44, v45);
            v23 = CalDatabaseCreateWithAuxDatabaseRef();
            if (v23)
            {
              v24 = (const void *)v23;
              v25 = self->_databases;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CalDatabaseGetAuxilliaryDatabaseID());
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v24, v26);

              CFRelease(v24);
            }
            else
            {
              v27 = (void *)CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
              {
                v28 = v27;
                UID = CalAuxDatabaseGetUID();
                -[CADDatabaseInitializationOptions databaseDirectory](self->_initOptions, "databaseDirectory");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v56 = UID;
                *(_WORD *)&v56[4] = 2112;
                *(_QWORD *)&v56[6] = v30;
                _os_log_impl(&dword_1B6A18000, v28, OS_LOG_TYPE_ERROR, "Unable to create auxiliary database %i with main database path %@", buf, 0x12u);

              }
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
        }
        while (v20);
      }

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v31 = self->_databases;
      v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v47 != v34)
              objc_enumerationMutation(v31);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_databases, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j), v44, v45);

            -[CADDatabaseInitializationOptions unitTesting](self->_initOptions, "unitTesting");
            CalDatabaseSetIsUnitTesting();
            if (-[CADDatabaseInitializationOptions unitTesting](self->_initOptions, "unitTesting"))
              CalDatabaseSetIntegrityErrorReportingDelegate();
            -[CADDatabaseInitializationOptions enablePropertyModificationLogging](self->_initOptions, "enablePropertyModificationLogging");
            CalDatabaseSetPropertyModificationLoggingEnabled();
          }
          v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        }
        while (v33);
      }

      self->_databaseRestoreGeneration = CalDatabaseSetRestoreGenerationChangedDelegate();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObserver:selector:name:object:", self, sel_handleDatabaseChangedExternally, *MEMORY[0x1E0D0BEB0], v11);

      CFRelease(v11);
      v37 = (void *)MEMORY[0x1E0D0BB30];
      -[NSMutableDictionary allValues](self->_databases, "allValues");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setInterestedDatabases:forContext:", v38, self);

      v9 = v44;
      v8 = v45;
    }
    else
    {
      v39 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v40 = self->_initOptions;
        v41 = v39;
        -[CADDatabaseInitializationOptions databaseDirectory](v40, "databaseDirectory");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v56 = v42;
        _os_log_impl(&dword_1B6A18000, v41, OS_LOG_TYPE_ERROR, "Unable to create main database for path %@", buf, 0xCu);

      }
    }

    databases = self->_databases;
  }
  return databases;
}

- (void)closeDatabases
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  uint8_t v5[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_databases)
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEBUG, "Closing the databases prematurely because we were explicitly asked to.", v5, 2u);
    }
    -[CADDatabaseSingleConnectionProvider _closeDatabases](self, "_closeDatabases");
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_closeDatabases
{
  NSMutableDictionary *databases;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;

  os_unfair_lock_assert_owner(&self->_lock);
  databases = self->_databases;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D0BE78]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](databases, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    CalDatabaseClearRestoreGenerationChangedDelegate();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D0BEB0], 0);

  v7 = self->_databases;
  self->_databases = 0;

}

- (void)reportIntegrityErrors:(id)a3
{
  CADDatabaseConnectionProviderDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "reportIntegrityErrors:", v4);

}

- (void)database:(CalDatabase *)a3 restoreGenerationChangedExternally:(int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *databases;
  void *v9;
  CalDatabase *v10;
  id WeakRetained;

  v4 = *(_QWORD *)&a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  databases = self->_databases;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D0BE78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](databases, "objectForKeyedSubscript:", v9);
  v10 = (CalDatabase *)objc_claimAutoreleasedReturnValue();

  if (v10 == a3)
  {
    -[CADDatabaseSingleConnectionProvider _databaseRestoreGenerationChanged:](self, "_databaseRestoreGenerationChanged:", v4);
    os_unfair_lock_unlock(p_lock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "restoreGenerationChangedExternally");

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)addDelegate:(id)a3
{
  id v4;
  CADDatabaseConnectionProviderDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained != v4)
    {
      v8 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_ERROR, "Only a single delegate is supported by single connection pools. Current delegate = %@, new delegate = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else
  {
    objc_storeWeak((id *)p_delegate, v4);
  }

}

- (void)removeDelegate:(id)a3
{
  CADDatabaseConnectionProviderDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained == v4)
    objc_storeWeak((id *)p_delegate, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databases, 0);
  objc_storeStrong((id *)&self->_initOptions, 0);
}

@end
