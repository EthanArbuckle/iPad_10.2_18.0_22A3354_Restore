@implementation FCUserEventHistoryStorage

- (FCUserEventHistoryStorage)initWithPrivateDataDirectory:(id)a3 configurationManager:(id)a4
{
  id v6;
  id v7;
  FCUserEventHistoryStorage *v8;
  uint64_t v9;
  NSHashTable *observers;
  id v11;
  uint64_t v12;
  NFLazy *lazyRootDirectory;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FCUserEventHistoryStorage;
  v8 = -[FCUserEventHistoryStorage init](&v19, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    objc_initWeak(&location, v8);
    objc_storeStrong((id *)&v8->_configurationManager, a4);
    v11 = objc_alloc(MEMORY[0x1E0D60AD0]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__FCUserEventHistoryStorage_initWithPrivateDataDirectory_configurationManager___block_invoke;
    v15[3] = &unk_1E46408E8;
    v16 = v6;
    objc_copyWeak(&v17, &location);
    v12 = objc_msgSend(v11, "initWithConstructor:", v15);
    lazyRootDirectory = v8->_lazyRootDirectory;
    v8->_lazyRootDirectory = (NFLazy *)v12;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)addObserver:(id)a3
{
  char *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCUserEventHistoryStorage observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      v7 = FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v10 = v4;
        _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "%p is already an observer", buf, 0xCu);
      }
    }
    -[FCUserEventHistoryStorage observers](self, "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCUserEventHistoryStorage addObserver:]";
    v11 = 2080;
    v12 = "FCUserEventHistoryStorage.m";
    v13 = 1024;
    v14 = 94;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_8:
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (id)pruneWithPolicies:(id)a3
{
  char *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  v5 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "User event history storage pruning with policies %{public}@", buf, 0xCu);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = v4;
  objc_msgSend(v4, "policies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = MEMORY[0x1E0C81028];
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        switch(objc_msgSend(v12, "type"))
        {
          case 0:
            if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
            {
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Given an pruning policy with an unknown type"));
              *(_DWORD *)buf = 136315906;
              v22 = "-[FCUserEventHistoryStorage pruneWithPolicies:]";
              v23 = 2080;
              v24 = "FCUserEventHistoryStorage.m";
              v25 = 1024;
              v26 = 129;
              v27 = 2114;
              v28 = v13;
              _os_log_fault_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidPruningPolicy) : %s %s:%d %{public}@", buf, 0x26u);

            }
            break;
          case 1:
            -[FCUserEventHistoryStorage _pruneToMaxSize:](self, "_pruneToMaxSize:", objc_msgSend(v12, "value"));
            break;
          case 2:
            -[FCUserEventHistoryStorage _pruneToMaxSessionCount:](self, "_pruneToMaxSessionCount:", objc_msgSend(v12, "value"));
            break;
          case 3:
            -[FCUserEventHistoryStorage _pruneToMaxSessionAge:](self, "_pruneToMaxSessionAge:", objc_msgSend(v12, "value"));
            break;
          default:
            continue;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    }
    while (v8);
  }

  -[FCUserEventHistoryStorage prunedSessionIDs](self, "prunedSessionIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSArray)prunedSessionIDs
{
  return self->_prunedSessionIDs;
}

- (void)_pruneToMaxSize:(int64_t)a3
{
  FCUserEventHistoryStorage *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  FCUserEventHistoryStorage *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[6];
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v4 = self;
  v52 = *MEMORY[0x1E0C80C00];
  v5 = -[FCUserEventHistoryStorage size](self, "size");
  v6 = v5;
  v7 = v5 - a3;
  if (v5 <= a3)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __45__FCUserEventHistoryStorage__pruneToMaxSize___block_invoke;
    v44[3] = &__block_descriptor_48_e5_v8__0l;
    v44[4] = v5;
    v44[5] = a3;
    __45__FCUserEventHistoryStorage__pruneToMaxSize___block_invoke((uint64_t)v44);
    return;
  }
  v8 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x1E0CB34E8];
    v10 = v8;
    objc_msgSend(v9, "stringFromByteCount:countStyle:", v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", a3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v7, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = (uint64_t)v11;
    v48 = 2114;
    v49 = v12;
    v50 = 2114;
    v51 = v13;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "Current size %{public}@ does violate max size %{public}@, attempting to prune %{public}@ from sessions", buf, 0x20u);

  }
  -[FCUserEventHistoryStorage sessions](v4, "sessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v28 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v28, OS_LOG_TYPE_ERROR, "Failed to get session IDs to prune, skipping", buf, 2u);
    }
    goto LABEL_26;
  }
  v15 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v14, "reverseObjectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v17)
  {
    v18 = v17;
    v38 = v14;
    v39 = v4;
    v19 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v15, "addObject:", v21, v38, v39);
        v22 = objc_msgSend(v21, "size");
        v7 -= v22;
        v23 = (void *)FCUserEventsStorageLog;
        if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          objc_msgSend(v21, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v22, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v7, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = (uint64_t)v25;
          v48 = 2114;
          v49 = v26;
          v50 = 2114;
          v51 = v27;
          _os_log_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_DEFAULT, "Found session %{public}@ to prune with size %{public}@, remaining size to prune %{public}@", buf, 0x20u);

        }
        if (v7 <= 0)
        {

          v14 = v38;
          v4 = v39;
          goto LABEL_23;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v18)
        continue;
      break;
    }

    v14 = v38;
    v4 = v39;
    goto LABEL_21;
  }

  if (v7 >= 1)
  {
LABEL_21:
    v29 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)MEMORY[0x1E0CB34E8];
      v36 = v29;
      objc_msgSend(v35, "stringFromByteCount:countStyle:", v7, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = (uint64_t)v37;
      _os_log_error_impl(&dword_1A1B90000, v36, OS_LOG_TYPE_ERROR, "Finished collecting sessions to prune but still need to remove %{public}@", buf, 0xCu);

    }
  }
LABEL_23:
  -[FCUserEventHistoryStorage _pruneSessions:](v4, "_pruneSessions:", v15);
  v30 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    v32 = objc_msgSend(v15, "count");
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[FCUserEventHistoryStorage prunedSessionSize](v4, "prunedSessionSize"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUserEventHistoryStorage sizeString](v4, "sizeString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v47 = v32;
    v48 = 2114;
    v49 = v33;
    v50 = 2114;
    v51 = v34;
    _os_log_impl(&dword_1A1B90000, v31, OS_LOG_TYPE_DEFAULT, "Finished pruning %lu sessions account for %{public}@, session size after pruning %{public}@", buf, 0x20u);

  }
LABEL_26:

}

void __45__FCUserEventHistoryStorage__pruneToMaxSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x1E0CB34E8];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v2;
    objc_msgSend(v3, "stringFromByteCount:countStyle:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", *(_QWORD *)(a1 + 40), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Current size %{public}@ doesn't violate max size %{public}@, skipping pruning", (uint8_t *)&v8, 0x16u);

  }
}

NSObject *__79__FCUserEventHistoryStorage_initWithPrivateDataDirectory_configurationManager___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:isDirectory:", CFSTR("personalization-sessions"), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if ((-[NSObject fc_directoryExists](v2, "fc_directoryExists") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCurrentSize:", objc_msgSend(v6, "fc_sizeOfItemAtURL:error:", v2, 0));

      v7 = (void *)FCUserEventsStorageLog;
      if (!os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        goto LABEL_18;
      }
      v8 = (void *)MEMORY[0x1E0CB34E8];
      v9 = v7;
      objc_msgSend(v8, "stringFromByteCount:countStyle:", objc_msgSend(v5, "currentSize"), 0);
      v10 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v10;
      v26 = 2114;
      v27 = v2;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "User event history storage initialized. Current size %{public}@ at %{public}@", buf, 0x16u);
      goto LABEL_12;
    }
    v11 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v2;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "User event history storage initialized, creating root directory at path %{public}@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v23);
    v9 = v23;

    if (v9
      && (v14 = (void *)FCUserEventsStorageLog, os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR)))
    {
      v19 = v14;
      -[NSObject localizedDescription](v9, "localizedDescription");
      v20 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v2;
      v26 = 2114;
      v27 = v20;
      _os_log_error_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_ERROR, "Error creating event history storage root directory at %{public}@. Error: %{public}@", buf, 0x16u);

      if ((v13 & 1) != 0)
        goto LABEL_10;
    }
    else if ((v13 & 1) != 0)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCurrentSize:", objc_msgSend(v15, "fc_sizeOfItemAtURL:error:", v2, 0));

      v16 = (void *)FCUserEventsStorageLog;
      if (!os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        goto LABEL_17;
      }
      v17 = (void *)MEMORY[0x1E0CB34E8];
      v10 = v16;
      objc_msgSend(v17, "stringFromByteCount:countStyle:", objc_msgSend(v5, "currentSize"), 0);
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2114;
      v27 = v2;
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "User event history storage initialized. Current size %{public}@ at %{public}@", buf, 0x16u);

LABEL_12:
      goto LABEL_16;
    }
    v21 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v2;
      _os_log_error_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_ERROR, "Failed to create user event history storage root directory at %{public}@", buf, 0xCu);
    }
    goto LABEL_16;
  }
LABEL_18:

  return v2;
}

- (unint64_t)size
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  _QWORD v8[6];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistoryStorage rootDirectory](self, "rootDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v3, "fc_sizeOfItemAtURL:error:", v4, &v9);
  v6 = v9;

  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__FCUserEventHistoryStorage_size__block_invoke;
    v8[3] = &unk_1E46409B0;
    v8[4] = self;
    v8[5] = v6;
    __33__FCUserEventHistoryStorage_size__block_invoke((uint64_t)v8);
    v5 = 0;
  }

  return v5;
}

- (void)setCurrentSize:(unint64_t)a3
{
  self->_currentSize = a3;
}

- (id)rootDirectory
{
  void *v2;
  void *v3;

  -[FCUserEventHistoryStorage lazyRootDirectory](self, "lazyRootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NFLazy)lazyRootDirectory
{
  return self->_lazyRootDirectory;
}

- (unint64_t)currentSize
{
  return self->_currentSize;
}

- (FCUserEventHistoryStorage)initWithPrivateDataDirectory:(id)a3
{
  return -[FCUserEventHistoryStorage initWithPrivateDataDirectory:configurationManager:](self, "initWithPrivateDataDirectory:configurationManager:", a3, 0);
}

- (id)sizeString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[FCUserEventHistoryStorage size](self, "size"), 0);
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCUserEventHistoryStorage observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCUserEventHistoryStorage removeObserver:]";
    v8 = 2080;
    v9 = "FCUserEventHistoryStorage.m";
    v10 = 1024;
    v11 = 106;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (void)clearSessionsWithIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 134217984;
    v18 = (const char *)objc_msgSend(v4, "count");
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "User event history storage will attempt to clear %lu sessions", buf, 0xCu);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__FCUserEventHistoryStorage_clearSessionsWithIDs___block_invoke;
  v16[3] = &unk_1E4640910;
  v16[4] = self;
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistoryStorage _deleteSessions:pruned:](self, "_deleteSessions:pruned:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 >= objc_msgSend(v4, "count"))
  {
    v13 = objc_msgSend(v8, "count");
    if (v13 <= objc_msgSend(v4, "count"))
    {
      v14 = (void *)FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v14;
        v15 = objc_msgSend(v4, "count");
        *(_DWORD *)buf = 134217984;
        v18 = (const char *)v15;
        _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Successfully cleared %lu sessions", buf, 0xCu);
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Somehow cleared %lu sessions even though only %lu sessions were requested to be cleared"), objc_msgSend(v8, "count"), objc_msgSend(v4, "count"));
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCUserEventHistoryStorage clearSessionsWithIDs:]";
      v19 = 2080;
      v20 = "FCUserEventHistoryStorage.m";
      v21 = 1024;
      v22 = 148;
      v23 = 2114;
      v24 = v11;
      _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidSessionClearing) : %s %s:%d %{public}@", buf, 0x26u);
      goto LABEL_11;
    }
  }
  else
  {
    v10 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      v12 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 134218242;
      v18 = (const char *)v12;
      v19 = 2114;
      v20 = (char *)v4;
      _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "Failed to find %lu sessions to clear. %{public}@", buf, 0x16u);
LABEL_11:

    }
  }

}

FCUserEventHistorySession *__50__FCUserEventHistoryStorage_clearSessionsWithIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FCUserEventHistorySession *v4;
  void *v5;
  FCUserEventHistorySession *v6;

  v3 = a2;
  v4 = [FCUserEventHistorySession alloc];
  objc_msgSend(*(id *)(a1 + 32), "_filePathForSessionID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCUserEventHistorySession initWithSessionID:path:](v4, "initWithSessionID:path:", v3, v5);

  return v6;
}

- (void)writeJSON:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCUserEventHistoryStorage rootDirectory](self, "rootDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("personalization-sessions-json"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "fc_directoryExists") & 1) != 0)
  {
LABEL_2:
    v8 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v7;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "Found JSON folder at %{public}@", buf, 0xCu);
    }
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v11, &v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v41;
    objc_msgSend(v9, "setWithArray:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fc_setByTransformingWithBlock:", &__block_literal_global_47);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v16 = (void *)FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        objc_msgSend(v13, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v18;
        _os_log_error_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_ERROR, "Failed to get existing contents of JSON folder %@", buf, 0xCu);

      }
    }
    else
    {
      -[FCUserEventHistoryStorage sessions](self, "sessions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __39__FCUserEventHistoryStorage_writeJSON___block_invoke_23;
      v39[3] = &unk_1E4640938;
      v26 = v15;
      v40 = v26;
      objc_msgSend(v25, "fc_arrayOfObjectsFailingTest:", v39);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x1E0C99E60];
      -[FCUserEventHistoryStorage sessionIDs](self, "sessionIDs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWithArray:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "fc_setByMinusingSet:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __39__FCUserEventHistoryStorage_writeJSON___block_invoke_2;
      v37[3] = &unk_1E4640960;
      v33 = v7;
      v38 = v33;
      objc_msgSend(v31, "enumerateObjectsUsingBlock:", v37);
      v34[0] = v32;
      v34[1] = 3221225472;
      v34[2] = __39__FCUserEventHistoryStorage_writeJSON___block_invoke_26;
      v34[3] = &unk_1E4640988;
      v36 = v4;
      v35 = v33;
      objc_msgSend(v27, "enumerateObjectsUsingBlock:", v34);

    }
    goto LABEL_14;
  }
  v19 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v7;
    _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "Creating user event history JSON directory at path %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v21 = objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v42);
  v13 = v42;

  v22 = FCUserEventsStorageLog;
  if (!v13)
  {
    if ((v21 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v7;
        _os_log_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEFAULT, "Successfully created user event history JSON directory at %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v7;
      _os_log_error_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_ERROR, "Failed to create user event history storage JSON directory at %{public}@", buf, 0xCu);
    }
    goto LABEL_2;
  }
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    v23 = v22;
    objc_msgSend(v13, "localizedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v7;
    v45 = 2114;
    v46 = v24;
    _os_log_error_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_ERROR, "Error creating user event history JSON directory at %{public}@. Error: %{public}@", buf, 0x16u);

  }
LABEL_14:

}

uint64_t __39__FCUserEventHistoryStorage_writeJSON___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringByDeletingPathExtension");
}

uint64_t __39__FCUserEventHistoryStorage_writeJSON___block_invoke_23(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __39__FCUserEventHistoryStorage_writeJSON___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v4 = objc_msgSend(v3, "removeItemAtURL:error:", v2, &v9);
  v5 = v9;

  v6 = FCUserEventsStorageLog;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v2;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "Deleted session at %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v2;
    v12 = 2112;
    v13 = v8;
    _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "Failed to get delete session at %@. Error %@", buf, 0x16u);

  }
}

void __39__FCUserEventHistoryStorage_writeJSON___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  char *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathExtension:", CFSTR("json"));
    v8 = (char *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1E0CB34E8];
      v11 = v9;
      objc_msgSend(v10, "stringFromByteCount:countStyle:", objc_msgSend(v4, "length"), 0);
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20[0] = v8;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Got back session JSON data of size %@ for session %@. Writing to %@", (uint8_t *)&v15, 0x20u);

    }
    if ((objc_msgSend(v4, "writeToURL:atomically:", v8, 1) & 1) == 0)
    {
      v14 = FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v8;
        _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "Failed to write json data for session to %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    v8 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Missing session data for session we want to write as JSON"));
    v15 = 136315906;
    v16 = "-[FCUserEventHistoryStorage writeJSON:]_block_invoke";
    v17 = 2080;
    v18 = "FCUserEventHistoryStorage.m";
    v19 = 1024;
    LODWORD(v20[0]) = 212;
    WORD2(v20[0]) = 2114;
    *(_QWORD *)((char *)v20 + 6) = v8;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingSessionData) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }

LABEL_9:
}

uint64_t __33__FCUserEventHistoryStorage_size__block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "rootDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Error looking up contents of user event history storage at %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

- (NSArray)sessionIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  FCUserEventHistoryStorage *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistoryStorage rootDirectory](self, "rootDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;

  if (v6)
  {
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_35_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__FCUserEventHistoryStorage_sessionIDs__block_invoke;
    v10[3] = &unk_1E463D4B8;
    v11 = v7;
    v12 = self;
    __39__FCUserEventHistoryStorage_sessionIDs__block_invoke((uint64_t)v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v8;
}

uint64_t __39__FCUserEventHistoryStorage_sessionIDs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v2;
      objc_msgSend(v4, "rootDirectory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to lookup session IDs in %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  return 0;
}

uint64_t __39__FCUserEventHistoryStorage_sessionIDs__block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:options:", a2, 64);
}

- (NSArray)sessions
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[FCUserEventHistoryStorage sessionIDs](self, "sessionIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__FCUserEventHistoryStorage_sessions__block_invoke;
  v6[3] = &unk_1E4640910;
  v6[4] = self;
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

FCUserEventHistorySession *__37__FCUserEventHistoryStorage_sessions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  FCUserEventHistorySession *v5;
  FCUserEventHistorySession *v6;
  FCUserEventHistorySession *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_filePathForSessionID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCUserEventHistorySession initWithSessionID:path:]([FCUserEventHistorySession alloc], "initWithSessionID:path:", v3, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__FCUserEventHistoryStorage_sessions__block_invoke_2;
    v9[3] = &unk_1E463B350;
    v10 = v3;
    __37__FCUserEventHistoryStorage_sessions__block_invoke_2((uint64_t)v9);
    v7 = (FCUserEventHistorySession *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __37__FCUserEventHistoryStorage_sessions__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Error creating user event history session for session id %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (void)storeSessionID:(id)a3 compressedSessionData:(id)a4 notify:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  FCPersistenceQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__FCUserEventHistoryStorage_storeSessionID_compressedSessionData_notify___block_invoke;
  v13[3] = &unk_1E46409D8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __73__FCUserEventHistoryStorage_storeSessionID_compressedSessionData_notify___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_filePathForSessionID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x1E0CB34E8];
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v7 = v3;
    objc_msgSend(v4, "stringFromByteCount:countStyle:", objc_msgSend(v5, "length"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v6;
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v2;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Storing session %{public}@ with size %{public}@ at %{public}@", buf, 0x20u);

  }
  v9 = *(void **)(a1 + 48);
  v21 = 0;
  v10 = objc_msgSend(v9, "writeToFile:options:error:", v2, 1, &v21);
  v11 = v21;
  if (v11)
  {
    v12 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = v12;
      objc_msgSend(v11, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      v24 = 2114;
      v25 = v15;
      _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "Error storing session %{public}@: %{public}@", buf, 0x16u);

    }
  }
  else if ((v10 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __73__FCUserEventHistoryStorage_storeSessionID_compressedSessionData_notify___block_invoke_36;
      v18[3] = &unk_1E463B228;
      v18[4] = *(_QWORD *)(a1 + 32);
      v19 = *(id *)(a1 + 48);
      v20 = *(id *)(a1 + 40);
      FCPerformBlockOnMainThread(v18);

    }
  }
  else
  {
    v16 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_error_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_ERROR, "Error storing session %{public}@ but no error...", buf, 0xCu);
    }
  }

}

void __73__FCUserEventHistoryStorage_storeSessionID_compressedSessionData_notify___block_invoke_36(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "storage:didStoreData:forSessionID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)storeSessionID:(id)a3 sessionData:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v11 = 0;
  objc_msgSend(a4, "compressedDataUsingAlgorithm:error:", 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__FCUserEventHistoryStorage_storeSessionID_sessionData___block_invoke;
    v10[3] = &unk_1E463AB18;
    v10[4] = v8;
    __56__FCUserEventHistoryStorage_storeSessionID_sessionData___block_invoke((uint64_t)v10);
  }
  else
  {
    -[FCUserEventHistoryStorage storeSessionID:compressedSessionData:notify:](self, "storeSessionID:compressedSessionData:notify:", v6, v7, 1);
  }

}

void __56__FCUserEventHistoryStorage_storeSessionID_sessionData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "Failed to compress data with error %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)clearAllSessions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[FCUserEventHistoryStorage sessions](self, "sessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FCUserEventHistoryStorage _deleteSessions:pruned:](self, "_deleteSessions:pruned:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[FCUserEventHistoryStorage observers](self, "observers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "storage:didClearAllSessions:", self, v4);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v11 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "Failed to get sessions IDs for clearing all sessions", buf, 2u);
    }
  }

}

- (NSDate)earliestSessionDate
{
  void *v2;
  void *v3;
  void *v4;

  -[FCUserEventHistoryStorage sessionIDs](self, "sessionIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[FCUserEventHistorySession dateFromSessionID:](FCUserEventHistorySession, "dateFromSessionID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)clearHistory
{
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCUserEventHistoryStorage clearAllSessions](self, "clearAllSessions");
}

- (FCUserEventHistoryMetadata)metadata
{
  FCUserEventHistoryMetadata *metadata;
  NSObject *v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  FCUserEventHistoryMetadata *v10;
  NSObject *v11;
  int v12;
  FCUserEventHistoryMetadata *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  metadata = self->_metadata;
  if (metadata)
  {
    v4 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = metadata;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "Found user event history metadata %{public}@", (uint8_t *)&v12, 0xCu);
      metadata = self->_metadata;
    }
    return metadata;
  }
  else
  {
    -[FCUserEventHistoryStorage configurationManager](self, "configurationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[FCUserEventHistoryStorage configurationManager](self, "configurationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "possiblyUnfetchedAppConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "personalizationAnalyticsEnabled");

    }
    else
    {
      v9 = 0;
    }

    +[FCUserEventHistoryMetadata emptyWithSessionsOnDiskSize:personalizationAnalyticsEnabled:](FCUserEventHistoryMetadata, "emptyWithSessionsOnDiskSize:personalizationAnalyticsEnabled:", -[FCUserEventHistoryStorage currentSize](self, "currentSize"), v9);
    v10 = (FCUserEventHistoryMetadata *)objc_claimAutoreleasedReturnValue();
    v11 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "User event history metadata requested, but none found, returning empty metadata with only session size on disk %{public}@", (uint8_t *)&v12, 0xCu);
    }
    return v10;
  }
}

- (void)setMetadataWithAggregateStoreGenerationTime:(int64_t)a3 aggregateTotalCount:(int64_t)a4 meanCountOfEvents:(double)a5 standardDeviationOfEvents:(double)a6 totalEventsCount:(int64_t)a7 headlineEventCount:(int64_t)a8 headlinesWithValidTitleEmbeddingsEventCount:(int64_t)a9 headlinesWithInvalidTitleEmbeddingsEventCount:(int64_t)a10 headlinesWithValidBodyEmbeddingsEventCount:(int64_t)a11 headlinesWithInvalidBodyEmbeddingsEventCount:(int64_t)a12 eventCounts:(id)a13 aggregateStoreData:(id)a14
{
  id v21;
  id v22;
  FCUserEventHistoryMetadata *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a14;
  v22 = a13;
  v23 = -[FCUserEventHistoryMetadata initWithAggregateStoreGenerationTime:aggregateTotalCount:meanCountOfEvents:sessionsOnDiskSize:standardDeviationOfEvents:totalEventsCount:headlineEventCount:headlinesWithValidTitleEmbeddingsEventCount:headlinesWithInvalidTitleEmbeddingsEventCount:headlinesWithValidBodyEmbeddingsEventCount:headlinesWithInvalidBodyEmbeddingsEventCount:eventCounts:aggregateStoreData:]([FCUserEventHistoryMetadata alloc], "initWithAggregateStoreGenerationTime:aggregateTotalCount:meanCountOfEvents:sessionsOnDiskSize:standardDeviationOfEvents:totalEventsCount:headlineEventCount:headlinesWithValidTitleEmbeddingsEventCount:headlinesWithInvalidTitleEmbeddingsEventCount:headlinesWithValidBodyEmbeddingsEventCount:headlinesWithInvalidBodyEmbeddingsEventCount:eventCounts:aggregateStoreData:", a3, a4, -[FCUserEventHistoryStorage currentSize](self, "currentSize"), a7, a8, a9, a5, a6, a10, a11, a12, v22, v21);

  -[FCUserEventHistoryStorage setMetadata:](self, "setMetadata:", v23);
  v24 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    -[FCUserEventHistoryStorage metadata](self, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v26;
    _os_log_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_DEFAULT, "Metadata set as %{public}@", buf, 0xCu);

  }
}

- (id)_filePathForSessionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FCUserEventHistoryStorage rootDirectory](self, "rootDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_deleteSessions:(id)a3 pruned:(BOOL)a4
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  _BOOL4 v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v26 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = (id)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v30;
    *(_QWORD *)&v7 = 138543874;
    v24 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "size", v24);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v15 = objc_msgSend(v13, "removeItemAtPath:error:", v14, &v28);
        v16 = v28;

        if ((v15 & 1) != 0)
        {
          if (v26)
            -[FCUserEventHistoryStorage setPrunedSessionSize:](self, "setPrunedSessionSize:", -[FCUserEventHistoryStorage prunedSessionSize](self, "prunedSessionSize") + v12);
          objc_msgSend(v11, "identifier");
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v17);
          goto LABEL_10;
        }
        v18 = (void *)FCUserEventsStorageLog;
        if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
        {
          v17 = v18;
          objc_msgSend(v11, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v34 = v19;
          v35 = 2114;
          v36 = v20;
          v37 = 2114;
          v38 = v21;
          _os_log_error_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_ERROR, "Encountered error removing session %{public}@ at path %{public}@. Error: %{public}@", buf, 0x20u);

LABEL_10:
        }

        ++v10;
      }
      while (v8 != v10);
      v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      v8 = v22;
    }
    while (v22);
  }

  return v27;
}

- (void)_pruneSessions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[FCUserEventHistoryStorage _deleteSessions:pruned:](self, "_deleteSessions:pruned:", a3, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistoryStorage prunedSessionIDs](self, "prunedSessionIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistoryStorage setPrunedSessionIDs:](self, "setPrunedSessionIDs:", v6);

  -[FCUserEventHistoryStorage setCurrentSize:](self, "setCurrentSize:", -[FCUserEventHistoryStorage size](self, "size"));
}

- (void)_pruneToMaxSessionCount:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = a3;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to prune to max session count %lu", buf, 0xCu);
  }
  -[FCUserEventHistoryStorage sessions](self, "sessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    if (objc_msgSend(v8, "count") <= a3)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __53__FCUserEventHistoryStorage__pruneToMaxSessionCount___block_invoke_46;
      v15[3] = &unk_1E4640A20;
      v15[4] = v8;
      v15[5] = a3;
      __53__FCUserEventHistoryStorage__pruneToMaxSessionCount___block_invoke_46((uint64_t)v15);
    }
    else
    {
      v9 = objc_msgSend(v8, "count") - a3;
      v10 = (void *)FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 134218496;
        v17 = v12;
        v18 = 2048;
        v19 = a3;
        v20 = 2048;
        v21 = v9;
        _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Current session count %lu violates max session count %lu, attempting to prune %lu sessions", buf, 0x20u);

      }
      objc_msgSend(v8, "fc_safeSubarrayWithCountFromBack:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCUserEventHistoryStorage _pruneSessions:](self, "_pruneSessions:", v13);

    }
  }
  else
  {
    v14 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "Encountered error getting sessions to prune, skipping", buf, 2u);
    }
  }

}

void __53__FCUserEventHistoryStorage__pruneToMaxSessionCount___block_invoke_46(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = objc_msgSend(v3, "count");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 134218240;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "Current session count %lu doesn't violate max session count %lu, skipping pruning", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_pruneToMaxSessionAge:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = a3;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to prune to max session age %lu", buf, 0xCu);
  }
  -[FCUserEventHistoryStorage sessions](self, "sessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)-(int)a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__FCUserEventHistoryStorage__pruneToMaxSessionAge___block_invoke_49;
    v14[3] = &unk_1E4640938;
    v8 = v7;
    v15 = v8;
    objc_msgSend(v6, "fc_arrayOfObjectsFailingTest:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218242;
      v17 = v12;
      v18 = 2114;
      v19 = v9;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Found %lu sessions violating max age. Pruning %{public}@", buf, 0x16u);

    }
    -[FCUserEventHistoryStorage _pruneSessions:](self, "_pruneSessions:", v9);

  }
  else
  {
    v13 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "Failed to get session IDs for pruning", buf, 2u);
    }
  }

}

uint64_t __51__FCUserEventHistoryStorage__pruneToMaxSessionAge___block_invoke_49(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fc_isLaterThanOrEqualTo:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)setLazyRootDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_lazyRootDirectory, a3);
}

- (void)setPrunedSessionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_prunedSessionIDs, a3);
}

- (unint64_t)prunedSessionSize
{
  return self->_prunedSessionSize;
}

- (void)setPrunedSessionSize:(unint64_t)a3
{
  self->_prunedSessionSize = a3;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (FCNewsAppConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_prunedSessionIDs, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lazyRootDirectory, 0);
}

@end
