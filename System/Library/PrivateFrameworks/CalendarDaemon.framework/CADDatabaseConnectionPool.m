@implementation CADDatabaseConnectionPool

- (CADDatabaseConnectionPool)initWithOptions:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  CADDatabaseConnectionPool *v9;
  CADDatabaseConnectionPool *v10;
  dispatch_workloop_t v11;
  OS_dispatch_workloop *lowPriorityTasks;
  uint64_t v13;
  NSHashTable *clients;
  uint64_t v15;
  NSHashTable *delegates;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CADDatabaseConnectionPool;
  v9 = -[CADDatabaseConnectionPool init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = dispatch_workloop_create("com.apple.calendar.daemon.low_priority");
    lowPriorityTasks = v10->_lowPriorityTasks;
    v10->_lowPriorityTasks = (OS_dispatch_workloop *)v11;

    objc_storeStrong((id *)&v10->_initOptions, a3);
    objc_storeWeak((id *)&v10->_manager, v8);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    clients = v10->_clients;
    v10->_clients = (NSHashTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v15 = objc_claimAutoreleasedReturnValue();
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v15;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0D0BB30], "cleanupDeallocatedClients");
  v3.receiver = self;
  v3.super_class = (Class)CADDatabaseConnectionPool;
  -[CADDatabaseConnectionPool dealloc](&v3, sel_dealloc);
}

- (BOOL)performWithConfiguration:(id)a3 priority:(unint64_t)a4 databaseID:(int)a5 block:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  BOOL v12;
  NSObject *lowPriorityTasks;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a6;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (a4 && !dispatch_workloop_is_current())
  {
    lowPriorityTasks = self->_lowPriorityTasks;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__CADDatabaseConnectionPool_performWithConfiguration_priority_databaseID_block___block_invoke;
    block[3] = &unk_1E6A377B0;
    v18 = &v20;
    block[4] = self;
    v16 = v10;
    v19 = v7;
    v17 = v11;
    dispatch_async_and_wait(lowPriorityTasks, block);

    v12 = *((_BYTE *)v21 + 24) != 0;
  }
  else
  {
    v12 = -[CADDatabaseConnectionPool performASAPWithConfiguration:databaseID:block:](self, "performASAPWithConfiguration:databaseID:block:", v10, v7, v11);
    *((_BYTE *)v21 + 24) = v12;
  }
  _Block_object_dispose(&v20, 8);

  return v12;
}

uint64_t __80__CADDatabaseConnectionPool_performWithConfiguration_priority_databaseID_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "performASAPWithConfiguration:databaseID:block:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)performWithAllDatabasesWithConfiguration:(id)a3 priority:(unint64_t)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[CADDatabaseConnectionPool _pools](self, "_pools");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v14)
        objc_enumerationMutation(v12);
      v16 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15), "intValue");
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __85__CADDatabaseConnectionPool_performWithAllDatabasesWithConfiguration_priority_block___block_invoke;
      v18[3] = &unk_1E6A377D8;
      v17 = v9;
      v21 = v16;
      v19 = v17;
      v20 = &v22;
      -[CADDatabaseConnectionPool performWithConfiguration:priority:databaseID:block:](self, "performWithConfiguration:priority:databaseID:block:", v8, a4, v16, v18);
      LOBYTE(v16) = *((_BYTE *)v23 + 24) == 0;

      _Block_object_dispose(&v22, 8);
      if ((v16 & 1) == 0)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t __85__CADDatabaseConnectionPool_performWithAllDatabasesWithConfiguration_priority_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (void)addCreatedAuxDatabase:(CalDatabase *)a3
{
  uint64_t AuxilliaryDatabaseID;
  CADPooledConnection *v6;
  NSMutableDictionary *pools;
  void *v8;
  CADSeparatedDatabasePool *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  CADSeparatedDatabasePool *v23;
  CADPooledConnection *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  os_unfair_lock_lock(&self->_lock);
  if (self->_pools)
  {
    v6 = -[CADPooledConnection initWithDatabase:]([CADPooledConnection alloc], "initWithDatabase:", a3);
    -[CADDatabaseConnectionPool setupDatabase:](self, "setupDatabase:", a3);
    pools = self->_pools;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", AuxilliaryDatabaseID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](pools, "objectForKeyedSubscript:", v8);
    v9 = (CADSeparatedDatabasePool *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      CalDatabaseCopyInitializationConfiguration();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CADSeparatedDatabasePool initWithConfig:databaseID:]([CADSeparatedDatabasePool alloc], "initWithConfig:databaseID:", v10, AuxilliaryDatabaseID);
      v11 = self->_pools;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", AuxilliaryDatabaseID);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);

    }
    v23 = v9;
    v24 = v6;
    -[CADSeparatedDatabasePool _returnConnectionToPool:](v9, "_returnConnectionToPool:", v6);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableDictionary count](self->_pools, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = self->_pools;
    v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "databasePath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v13, "addObject:", v21);
          }
          else
          {
            v22 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v30 = v19;
              _os_log_impl(&dword_1B6A18000, v22, OS_LOG_TYPE_ERROR, "Unexpectedly encountered nil path for database with id %{public}@", buf, 0xCu);
            }
          }

        }
        v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0D0BB30], "setInterestedDatabasePaths:forContext:", v13, self);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)addDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_delegates, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (int)databaseRestoreGeneration
{
  CADDatabaseConnectionPool *v2;
  os_unfair_lock_s *p_lock;
  id v4;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[CADDatabaseConnectionPool _pools](v2, "_pools");
  LODWORD(v2) = v2->_databaseRestoreGeneration;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)databaseChangedExternally:(id)a3 auxDatabaseID:(int)a4
{
  uint64_t v4;
  id v6;
  NSMutableDictionary *pools;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  int v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((_DWORD)v4 != -1)
  {
    pools = self->_pools;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](pools, "objectForKeyedSubscript:", v8);
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary databasePath](v9, "databasePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToString:", v10);

    if (v11)
    {
      v12 = v9;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = self->_pools;
  v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v13)
  {
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v14 = v13;
  v15 = *(_QWORD *)v25;
LABEL_6:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v15)
      objc_enumerationMutation(v9);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16));
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary databasePath](v12, "databasePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v6, "isEqualToString:", v17);

    if ((v18 & 1) != 0)
      break;

    if (v14 == ++v16)
    {
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
LABEL_13:

  if (v12)
  {
    -[NSMutableDictionary setLastChangeTimestamp:](v12, "setLastChangeTimestamp:", CalMonotonicTime());
    v19 = -[NSMutableDictionary databaseID](v12, "databaseID");
    v20 = *MEMORY[0x1E0D0BE78];
    -[NSMutableDictionary connections](v12, "connections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    v23 = 0;
    if (v19 == v20)
    {
      self->_needCheckAuxDatabaseSequenceAndRestoreGeneration = 1;
      if (v22)
        -[CADDatabaseConnectionPool _checkGenerationAndAuxDatabaseSequence:](self, "_checkGenerationAndAuxDatabaseSequence:", &v23);
    }
  }
  else
  {
    v23 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v23)
    -[CADDatabaseConnectionPool notifyDelegatesGenerationChanged](self, "notifyDelegatesGenerationChanged");

}

- (void)_checkGenerationAndAuxDatabaseSequence:(BOOL *)a3
{
  NSMutableDictionary *pools;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int databaseRestoreGeneration;
  int RestoreGeneration;
  NSMutableDictionary *v13;
  int v14;
  id v15;
  NSObject *v16;
  uint8_t v17[16];

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_needCheckAuxDatabaseSequenceAndRestoreGeneration)
  {
    pools = self->_pools;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D0BE78]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](pools, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "connections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[CADDatabaseConnectionPool createConnectionForPool:](self, "createConnectionForPool:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v16 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_ERROR, "Could not open a connection to the Calendar database. Unable to perform generation check.", v17, 2u);
        }
        goto LABEL_12;
      }
      v9 = (void *)v10;
      objc_msgSend(v7, "_returnConnectionToPool:", v10);
    }
    objc_msgSend(v9, "database");
    if (a3)
    {
      databaseRestoreGeneration = self->_databaseRestoreGeneration;
      RestoreGeneration = CalDatabaseGetRestoreGeneration();
      self->_databaseRestoreGeneration = RestoreGeneration;
      *a3 = databaseRestoreGeneration != RestoreGeneration;
    }
    if (CalDatabaseGetAuxDatabaseChangesSequence() != self->_auxDatabaseSequence)
    {
      v13 = self->_pools;
      self->_pools = 0;

      if (a3)
      {
        if (!*a3)
        {
          v14 = self->_databaseRestoreGeneration;
          v15 = -[CADDatabaseConnectionPool _pools](self, "_pools");
          *a3 = self->_databaseRestoreGeneration != v14;
        }
      }
    }
    self->_needCheckAuxDatabaseSequenceAndRestoreGeneration = 0;

LABEL_12:
  }
}

- (id)_openDatabases
{
  NSObject *v3;
  CADDatabaseInitializationOptions *initOptions;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  const void *v20;
  void *v21;
  NSObject *v22;
  int UID;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  CADDatabaseInitializationOptions *v31;
  NSObject *v32;
  void *v33;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  _BYTE v47[14];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    initOptions = self->_initOptions;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v47 = initOptions;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEBUG, "Creating database with options [%@]", buf, 0xCu);
  }
  v5 = objc_alloc(MEMORY[0x1E0D0BB38]);
  -[CADDatabaseInitializationOptions databaseDirectory](self->_initOptions, "databaseDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDirectoryURL:", v6);

  objc_msgSend(v7, "setOptions:", -[CADDatabaseInitializationOptions databaseInitOptions](self->_initOptions, "databaseInitOptions"));
  -[CADDatabaseInitializationOptions calendarDataContainerProvider](self->_initOptions, "calendarDataContainerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "setDataContainerProvider:", v8);
  v9 = CalDatabaseCreateWithConfiguration();
  if (v9)
  {
    v10 = (const void *)v9;
    v35 = v8;
    v36 = v7;
    self->_auxDatabaseSequence = CalDatabaseGetAuxDatabaseChangesSequence();
    self->_databaseRestoreGeneration = CalDatabaseGetRestoreGeneration();
    v11 = (void *)CalDatabaseCopyAllAuxDatabases();
    v12 = objc_msgSend(v11, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v10);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(v14);
          -[CADDatabaseInitializationOptions databaseInitOptions](self->_initOptions, "databaseInitOptions", v35, v36);
          v19 = CalDatabaseCreateWithAuxDatabaseRef();
          if (v19)
          {
            v20 = (const void *)v19;
            objc_msgSend(v13, "addObject:", v19);
            CFRelease(v20);
          }
          else
          {
            v21 = (void *)CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              v22 = v21;
              UID = CalAuxDatabaseGetUID();
              -[CADDatabaseInitializationOptions databaseDirectory](self->_initOptions, "databaseDirectory");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v47 = UID;
              *(_WORD *)&v47[4] = 2112;
              *(_QWORD *)&v47[6] = v24;
              _os_log_impl(&dword_1B6A18000, v22, OS_LOG_TYPE_ERROR, "Unable to create auxiliary database %i with main database path %@", buf, 0x12u);

            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v16);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = v13;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v25);
          -[CADDatabaseConnectionPool setupDatabase:](self, "setupDatabase:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j), v35, v36);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v27);
    }

    CFRelease(v10);
    objc_msgSend(MEMORY[0x1E0D0BB30], "setInterestedDatabases:forContext:", v25, self);

    v8 = v35;
    v7 = v36;
  }
  else
  {
    v30 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v31 = self->_initOptions;
      v32 = v30;
      -[CADDatabaseInitializationOptions databaseDirectory](v31, "databaseDirectory");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v47 = v33;
      _os_log_impl(&dword_1B6A18000, v32, OS_LOG_TYPE_ERROR, "Unable to create main database for path %@", buf, 0xCu);

    }
    v25 = 0;
  }

  return v25;
}

- (void)setupDatabase:(CalDatabase *)a3
{
  -[CADDatabaseInitializationOptions unitTesting](self->_initOptions, "unitTesting");
  CalDatabaseSetIsUnitTesting();
  if (-[CADDatabaseInitializationOptions unitTesting](self->_initOptions, "unitTesting"))
    CalDatabaseSetIntegrityErrorReportingDelegate();
  -[CADDatabaseInitializationOptions enablePropertyModificationLogging](self->_initOptions, "enablePropertyModificationLogging");
  CalDatabaseSetPropertyModificationLoggingEnabled();
}

- (id)createConnectionForPool:(id)a3
{
  id v4;
  void *v5;
  const void *v6;
  CADPooledConnection *v7;

  v4 = a3;
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)CalDatabaseCreateWithConfiguration();

  if (v6)
  {
    objc_msgSend(v4, "databaseID");
    CalDatabaseSetAuxilliaryDatabaseID();
    -[CADDatabaseConnectionPool setupDatabase:](self, "setupDatabase:", v6);
    v7 = -[CADPooledConnection initWithDatabase:]([CADPooledConnection alloc], "initWithDatabase:", v6);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_pools
{
  NSMutableDictionary *pools;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AuxilliaryDatabaseID;
  void *v13;
  CADSeparatedDatabasePool *v14;
  CADPooledConnection *v15;
  NSMutableDictionary *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  pools = self->_pools;
  if (!pools)
  {
    -[CADDatabaseConnectionPool _openDatabases](self, "_openDatabases");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v6 = self->_pools;
    self->_pools = v5;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
          AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
          CalDatabaseCopyInitializationConfiguration();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[CADSeparatedDatabasePool initWithConfig:databaseID:]([CADSeparatedDatabasePool alloc], "initWithConfig:databaseID:", v13, AuxilliaryDatabaseID);
          v15 = -[CADPooledConnection initWithDatabase:]([CADPooledConnection alloc], "initWithDatabase:", v11);
          -[CADSeparatedDatabasePool _returnConnectionToPool:](v14, "_returnConnectionToPool:", v15);
          v16 = self->_pools;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", AuxilliaryDatabaseID);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v14, v17);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    pools = self->_pools;
  }
  return pools;
}

- (void)prepareDatabase:(CalDatabase *)a3 forUseWithConfiguration:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  objc_msgSend(v4, "clientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CalDatabaseSetClientName();

  objc_msgSend(v4, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CalDatabaseSetClientIdentifier();

  objc_msgSend(v4, "inMemoryChangeTrackingClientID");
  CalDatabaseSetInMemoryChangeTrackingID();
  objc_msgSend(v4, "enablePropertyModificationLogging");

  CalDatabaseSetPropertyModificationLoggingEnabled();
}

- (BOOL)performASAPWithConfiguration:(id)a3 databaseID:(int)a4 block:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(_QWORD, uint64_t);
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  id WeakRetained;
  NSObject *v25;
  void (**v26)(_QWORD, uint64_t);
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v6 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD, uint64_t))a5;
  os_unfair_lock_lock(&self->_lock);
  v10 = *MEMORY[0x1E0D0BE78];
  if (*MEMORY[0x1E0D0BE78] == (_DWORD)v6)
  {
    buf[0] = 0;
    -[CADDatabaseConnectionPool _checkGenerationAndAuxDatabaseSequence:](self, "_checkGenerationAndAuxDatabaseSequence:", buf);
    if (buf[0])
    {
      os_unfair_lock_unlock(&self->_lock);
      -[CADDatabaseConnectionPool notifyDelegatesGenerationChanged](self, "notifyDelegatesGenerationChanged");
      os_unfair_lock_lock(&self->_lock);
    }
  }
  -[CADDatabaseConnectionPool _pools](self, "_pools");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    os_unfair_lock_unlock(&self->_lock);
LABEL_12:
    v20 = 0;
    goto LABEL_23;
  }
  v26 = v9;
  v14 = v8;
  objc_msgSend(v13, "connections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v13, "connections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeLastObject");

  }
  v18 = objc_msgSend(v13, "lastChangeTimestamp");
  os_unfair_lock_unlock(&self->_lock);
  if (v16)
  {
    v19 = objc_msgSend(v16, "database");
    if (v18 > CalDatabaseGetLastCacheInvalidationTimestamp())
      CalDatabaseReset();
    v8 = v14;
    goto LABEL_15;
  }
  -[CADDatabaseConnectionPool createConnectionForPool:](self, "createConnectionForPool:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v21)
  {
    v25 = CADLogHandle;
    v9 = v26;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v28 = v6;
      _os_log_impl(&dword_1B6A18000, v25, OS_LOG_TYPE_ERROR, "Unable to create database connection for database ID %i", buf, 8u);
    }
    goto LABEL_12;
  }
  v16 = v21;
  v19 = objc_msgSend(v21, "database");
LABEL_15:
  v9 = v26;
  if (v8)
    -[CADDatabaseConnectionPool prepareDatabase:forUseWithConfiguration:](self, "prepareDatabase:forUseWithConfiguration:", v19, v8);
  v26[2](v26, v19);
  v22 = CalDatabaseCountCachedRecords();
  buf[0] = 0;
  if (v22 <= 60000)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(v13, "_returnConnectionToPool:", v16);
    if (v10 == (_DWORD)v6)
      -[CADDatabaseConnectionPool _checkGenerationAndAuxDatabaseSequence:](self, "_checkGenerationAndAuxDatabaseSequence:", buf);
    os_unfair_lock_unlock(&self->_lock);
    if (buf[0])
      -[CADDatabaseConnectionPool notifyDelegatesGenerationChanged](self, "notifyDelegatesGenerationChanged");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "schedulePurge");

  v20 = 1;
LABEL_23:

  return v20;
}

- (void)forEachDelegate:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)notifyDelegatesGenerationChanged
{
  -[CADDatabaseConnectionPool forEachDelegate:](self, "forEachDelegate:", &__block_literal_global_13);
}

uint64_t __61__CADDatabaseConnectionPool_notifyDelegatesGenerationChanged__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "restoreGenerationChangedExternally");
}

- (void)addClient:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_clients, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeClient:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_clients, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)numberOfClients
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_clients;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = v4;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        --v7;
      }
      while (v7);
      v5 += v4;
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)reportIntegrityErrors:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CADDatabaseConnectionPool_reportIntegrityErrors___block_invoke;
  v6[3] = &unk_1E6A37820;
  v7 = v4;
  v5 = v4;
  -[CADDatabaseConnectionPool forEachDelegate:](self, "forEachDelegate:", v6);

}

uint64_t __51__CADDatabaseConnectionPool_reportIntegrityErrors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reportIntegrityErrors:", *(_QWORD *)(a1 + 32));
}

- (void)purgeConnectionsLastUsedPriorTo:(unint64_t)a3 stats:(id *)a4
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_pools;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "purgeConnectionsLastUsedPriorTo:stats:", a3, a4);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_pools, 0);
  objc_storeStrong((id *)&self->_lowPriorityTasks, 0);
  objc_storeStrong((id *)&self->_initOptions, 0);
  objc_destroyWeak((id *)&self->_manager);
}

@end
