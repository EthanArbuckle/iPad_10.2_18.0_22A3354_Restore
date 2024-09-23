@implementation DALocalDBWatcher

+ (id)sharedDBWatcher
{
  if (sharedDBWatcher_onceToken != -1)
    dispatch_once(&sharedDBWatcher_onceToken, &__block_literal_global_8);
  return (id)sharedDBWatcher___sharedInstance;
}

void __35__DALocalDBWatcher_sharedDBWatcher__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedDBWatcher___sharedInstance;
  sharedDBWatcher___sharedInstance = v0;

}

- (DALocalDBWatcher)init
{
  DALocalDBWatcher *v2;
  DACalDBHelper *v3;
  DACalDBHelper *calDBHelper;
  uint64_t v5;
  NSMutableDictionary *calDBInfosByPath;
  uint64_t v7;
  NSMapTable *concernedNotePartyToBlockMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DALocalDBWatcher;
  v2 = -[DALocalDBWatcher init](&v10, sel_init);
  if (v2)
  {
    v3 = -[DACalDBHelper initWithDatabaseInitOptions:]([DACalDBHelper alloc], "initWithDatabaseInitOptions:", 6);
    calDBHelper = v2->_calDBHelper;
    v2->_calDBHelper = v3;

    v5 = objc_opt_new();
    calDBInfosByPath = v2->_calDBInfosByPath;
    v2->_calDBInfosByPath = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithWeakToStrongObjects");
    v7 = objc_claimAutoreleasedReturnValue();
    concernedNotePartyToBlockMap = v2->_concernedNotePartyToBlockMap;
    v2->_concernedNotePartyToBlockMap = (NSMapTable *)v7;

  }
  return v2;
}

- (void)_handleCalChangeNotification
{
  DALocalDBWatcher *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int SequenceNumber;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  id obj;
  os_log_type_t v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  os_log_type_t type;
  id *p_isa;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  _BYTE v51[10];
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  p_isa = (id *)&v2->super.isa;
  -[DACalDBHelper allOpenDatabases](v2->_calDBHelper, "allOpenDatabases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v4)
  {
    v34 = *(_QWORD *)v46;
    type = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
    v32 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
    v33 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    *(_QWORD *)&v5 = 138543362;
    v30 = v5;
    obj = v3;
    do
    {
      v6 = 0;
      v35 = v4;
      do
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v6);
        v8 = (void *)objc_opt_class();
        v9 = (void *)CalDatabaseCopyDirectoryPathForDatabase();
        objc_msgSend(v8, "_canonicalizePath:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(p_isa[2], "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SequenceNumber = CalDatabaseGetSequenceNumber();
        v13 = objc_msgSend(v11, "lastSavedSequenceNumber");
        DALoggingwithCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v51 = SequenceNumber;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v13;
          v52 = 2112;
          v53 = v7;
          _os_log_impl(&dword_1B51E4000, v14, type, "__CalDatabaseChangedExternally - comparing current sequence number %d to saved sequence number %d in database: %@", buf, 0x18u);
        }

        if (SequenceNumber > v13 + 1)
        {
          v15 = (void *)objc_opt_new();
          DALoggingwithCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, v33))
          {
            objc_msgSend(v15, "transactionId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v30;
            *(_QWORD *)v51 = v17;
            _os_log_impl(&dword_1B51E4000, v16, v33, "DATransaction starting, ID: %{public}@", buf, 0xCu);

          }
          DALoggingwithCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, v32))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B51E4000, v18, v32, "Notifying agents that the Calendar database has changed.", buf, 2u);
          }

          v19 = (void *)objc_opt_new();
          objc_msgSend(v11, "blocksByConcernedParty");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __48__DALocalDBWatcher__handleCalChangeNotification__block_invoke;
          v42[3] = &unk_1E68CBD58;
          v21 = v19;
          v43 = v21;
          v22 = v15;
          v44 = v22;
          objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v42);

          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v23 = v21;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v39;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v39 != v25)
                  objc_enumerationMutation(v23);
                v27 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
                objc_msgSend(v11, "blocksByConcernedParty", v30);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, v27);

                objc_msgSend(v11, "blocksByConcernedParty");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v27) = objc_msgSend(v29, "count") == 0;

                if ((_DWORD)v27)
                  objc_msgSend(v11, "setLastSavedSequenceNumber:", 0);
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
            }
            while (v24);
          }

        }
        ++v6;
      }
      while (v6 != v35);
      v3 = obj;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v4);
  }

  objc_sync_exit(p_isa);
}

void __48__DALocalDBWatcher__handleCalChangeNotification__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "concernedParty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    dataaccess_get_global_queue();
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__DALocalDBWatcher__handleCalChangeNotification__block_invoke_2;
    v9[3] = &unk_1E68CBD30;
    v11 = v6;
    v10 = *(id *)(a1 + 40);
    dispatch_async(v8, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

uint64_t __48__DALocalDBWatcher__handleCalChangeNotification__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_dbInfoForAccountID:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  CalDatabase *v7;
  CalDatabase *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  DALocalDBWatcherDBInfo *v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  int v21;
  int v23;
  NSObject *v24;
  __int16 v25;
  CalDatabase *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[DACalDBHelper databaseForAccountID:](self->_calDBHelper, "databaseForAccountID:", v6);
  if (!v7)
  {
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v14 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v11, v14))
    {
      v23 = 138543362;
      v24 = v6;
      _os_log_impl(&dword_1B51E4000, v11, v14, "No database for account: %{public}@", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_15;
  }
  v8 = v7;
  v9 = (void *)objc_opt_class();
  v10 = (void *)CalDatabaseCopyDirectoryPathForDatabase();
  objc_msgSend(v9, "_canonicalizePath:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (!os_log_type_enabled(v15, v16))
    {
LABEL_14:

LABEL_15:
      v13 = 0;
      goto LABEL_16;
    }
    v23 = 134218242;
    v24 = v8;
    v25 = 2114;
    v26 = (CalDatabase *)v6;
    v17 = "no path for database: %p, account: %{public}@";
    v18 = v15;
    v19 = v16;
    v20 = 22;
LABEL_13:
    _os_log_impl(&dword_1B51E4000, v18, v19, v17, (uint8_t *)&v23, v20);
    goto LABEL_14;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_calDBInfosByPath, "objectForKeyedSubscript:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (v4)
    {
      v13 = -[DALocalDBWatcherDBInfo initWithPath:]([DALocalDBWatcherDBInfo alloc], "initWithPath:", v11);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_calDBInfosByPath, "setObject:forKeyedSubscript:", v13, v11);
      goto LABEL_16;
    }
    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = *(unsigned __int8 *)(MEMORY[0x1E0D1C448] + 3);
    if (!os_log_type_enabled(v15, *(os_log_type_t *)(MEMORY[0x1E0D1C448] + 3)))
      goto LABEL_14;
    v23 = 138543874;
    v24 = v11;
    v25 = 2048;
    v26 = v8;
    v27 = 2114;
    v28 = v6;
    v17 = "No dbInfo for path: %{public}@, database: %p, account: %{public}@";
    v18 = v15;
    v19 = v21;
    v20 = 32;
    goto LABEL_13;
  }
  v13 = (DALocalDBWatcherDBInfo *)v12;
LABEL_16:

  return v13;
}

- (void)registerConcernedCalParty:(id)a3 forAccountID:(id)a4 withChangedBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  DALocalDBWatcher *v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    v17 = 138412546;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_1B51E4000, v11, v12, "Registering concerned cal party: %@ for account: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  v13 = self;
  objc_sync_enter(v13);
  -[DACalDBHelper openDatabaseForAccountID:clientID:](v13->_calDBHelper, "openDatabaseForAccountID:clientID:", v9, 0);
  -[DALocalDBWatcher _dbInfoForAccountID:create:](v13, "_dbInfoForAccountID:create:", v9, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "blocksByConcernedParty");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") == 0;

  if (!v16)
    -[DACalDBHelper closeDatabaseForAccountID:save:](v13->_calDBHelper, "closeDatabaseForAccountID:save:", v9, 0);
  objc_msgSend(v14, "addBlock:forConcernedParty:account:", v10, v8, v9);

  objc_sync_exit(v13);
}

- (void)removeConcernedCalParty:(id)a3 forAccountID:(id)a4
{
  id v6;
  DALocalDBWatcher *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *calDBInfosByPath;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[DALocalDBWatcher _dbInfoForAccountID:create:](v7, "_dbInfoForAccountID:create:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "removeBlockForConcernedParty:account:", v14, v6);
    objc_msgSend(v9, "blocksByConcernedParty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {

    }
    else
    {
      objc_msgSend(v9, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        calDBInfosByPath = v7->_calDBInfosByPath;
        objc_msgSend(v9, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](calDBInfosByPath, "setObject:forKeyedSubscript:", 0, v13);

        -[DACalDBHelper closeDatabaseForAccountID:save:](v7->_calDBHelper, "closeDatabaseForAccountID:save:", v6, 0);
      }
    }
  }

  objc_sync_exit(v7);
}

- (void)noteCalDBDirChanged
{
  DALocalDBWatcher *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  id obj;
  id obja;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  obj = (id)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[NSMutableDictionary allValues](v2->_calDBInfosByPath, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v48;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v48 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v9 = (void *)objc_opt_new();
        objc_msgSend(v8, "blocksByConcernedParty");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v6;
        v45[1] = 3221225472;
        v45[2] = __39__DALocalDBWatcher_noteCalDBDirChanged__block_invoke;
        v45[3] = &unk_1E68CBD80;
        v11 = v9;
        v46 = v11;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v45);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v4);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obja = obj;
  v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obja);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v15, "blocksByConcernedParty");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v38;
          do
          {
            for (k = 0; k != v18; ++k)
            {
              if (*(_QWORD *)v38 != v19)
                objc_enumerationMutation(v17);
              v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
              objc_msgSend(v21, "concernedParty");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "accountID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[DALocalDBWatcher removeConcernedCalParty:forAccountID:](v2, "removeConcernedCalParty:forAccountID:", v22, v23);

            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
          }
          while (v18);
        }

      }
      v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v12);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = obja;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v51, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v34;
    v27 = MEMORY[0x1E0C809B0];
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * m), "blocksByConcernedParty");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v27;
        v32[1] = 3221225472;
        v32[2] = __39__DALocalDBWatcher_noteCalDBDirChanged__block_invoke_2;
        v32[3] = &unk_1E68CBD80;
        v32[4] = v2;
        objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v32);

      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v51, 16);
    }
    while (v25);
  }

  objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v2, sel__handleCalChangeNotification, *MEMORY[0x1E0D0BEB0]);
  objc_sync_exit(v2);

}

void __39__DALocalDBWatcher_noteCalDBDirChanged__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)MEMORY[0x1B5E48C2C](a3);
  objc_msgSend(*(id *)(a1 + 32), "blocksByConcernedParty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);

}

void __39__DALocalDBWatcher_noteCalDBDirChanged__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "concernedParty");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerConcernedCalParty:forAccountID:withChangedBlock:", v8, v7, v5);
}

- (int)lastSavedCalSequenceNumberForDatabaseInContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_canonicalizePath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_calDBInfosByPath, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "lastSavedSequenceNumber");
  else
    v8 = 0;

  return v8;
}

- (void)setLastSavedCalSequenceNumber:(int)a3 forDatabaseInContainer:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_canonicalizePath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_calDBInfosByPath, "objectForKeyedSubscript:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastSavedSequenceNumber:", v4);

}

- (void)_notesChangedExternally
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B51E4000, v3, v4, "__NotesChanged externally.", buf, 2u);
  }

  v5 = (void *)objc_opt_new();
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, v4))
  {
    objc_msgSend(v5, "transactionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v7;
    _os_log_impl(&dword_1B51E4000, v6, v4, "DATransaction starting, ID: %{public}@", buf, 0xCu);

  }
  -[NSMapTable objectEnumerator](self->_concernedNotePartyToBlockMap, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      dataaccess_get_global_queue();
      v12 = objc_claimAutoreleasedReturnValue();
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __43__DALocalDBWatcher__notesChangedExternally__block_invoke;
      v14[3] = &unk_1E68CBD30;
      v16 = v10;
      v15 = v5;
      v13 = v10;
      dispatch_async(v12, v14);

      objc_msgSend(v8, "nextObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v10);
  }

}

uint64_t __43__DALocalDBWatcher__notesChangedExternally__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)registerConcernedNoteParty:(id)a3 withChangedBlock:(id)a4
{
  id v7;
  DALocalDBWatcher *v8;
  void *v9;
  void *v10;
  NSMapTable *concernedNotePartyToBlockMap;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMapTable objectForKey:](v8->_concernedNotePartyToBlockMap, "objectForKey:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("DALocalDBWatcher.m"), 217, CFSTR("Someone registered themselves for the Note notification more than once.  Why?  Bad guy %@"), v14);

  }
  v10 = (void *)objc_msgSend(v7, "copy");

  concernedNotePartyToBlockMap = v8->_concernedNotePartyToBlockMap;
  v12 = (void *)MEMORY[0x1B5E48C2C](v10);
  -[NSMapTable setObject:forKey:](concernedNotePartyToBlockMap, "setObject:forKey:", v12, v14);

  objc_sync_exit(v8);
}

- (void)removeConcernedNoteParty:(id)a3
{
  DALocalDBWatcher *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMapTable objectForKey:](v4->_concernedNotePartyToBlockMap, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMapTable removeObjectForKey:](v4->_concernedNotePartyToBlockMap, "removeObjectForKey:", v6);
  objc_sync_exit(v4);

}

- (void)didReceiveDarwinNotification:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B51E4000, v5, v6, "Received darwin notification %@", (uint8_t *)&v7, 0xCu);
  }

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("_CalDatabaseChangedNotification")))
  {
    -[DALocalDBWatcher _handleCalChangeNotification](self, "_handleCalChangeNotification");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("NoteContextDarwinNotificationWithLoggedChanges")))
  {
    -[DALocalDBWatcher _notesChangedExternally](self, "_notesChangedExternally");
  }

}

+ (id)_canonicalizePath:(id)a3
{
  return (id)objc_msgSend(a3, "removeSlashIfNeeded");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concernedNotePartyToBlockMap, 0);
  objc_storeStrong((id *)&self->_noteWatcher, 0);
  objc_storeStrong((id *)&self->_calDBInfosByPath, 0);
  objc_storeStrong((id *)&self->_calDBHelper, 0);
}

@end
