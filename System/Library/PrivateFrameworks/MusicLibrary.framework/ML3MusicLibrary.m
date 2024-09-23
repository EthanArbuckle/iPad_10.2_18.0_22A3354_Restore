@implementation ML3MusicLibrary

void __44__ML3MusicLibrary_valueForDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT value FROM _MLDatabaseProperties WHERE key = ?"), v5, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForFirstRowAndColumn");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)valueForDatabaseProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2077;
  v16 = __Block_byref_object_dispose__2078;
  v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__ML3MusicLibrary_valueForDatabaseProperty___block_invoke;
    v9[3] = &unk_1E5B64FE0;
    v10 = v4;
    v11 = &v12;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v9);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)databaseConnectionAllowingWrites:(BOOL)a3 withBlock:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void (**v7)(id, void *);

  v4 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v4)
    -[ML3MusicLibrary checkoutWriterConnection](self, "checkoutWriterConnection");
  else
    -[ML3MusicLibrary checkoutReaderConnection](self, "checkoutReaderConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6);
  -[ML3MusicLibrary checkInDatabaseConnection:](self, "checkInDatabaseConnection:", v6);

}

- (id)checkoutReaderConnection
{
  void *v3;
  void *v4;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  -[ML3MusicLibrary connectionPool](self, "connectionPool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)checkInDatabaseConnection:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2077;
  v30 = __Block_byref_object_dispose__2078;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2077;
  v24 = __Block_byref_object_dispose__2078;
  v25 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ML3MusicLibrary_checkInDatabaseConnection___block_invoke;
  block[3] = &unk_1E5B65A78;
  block[4] = self;
  block[5] = &v26;
  block[6] = &v20;
  dispatch_sync(serialQueue, block);
  if (objc_msgSend((id)v27[5], "ownsConnection:", v4))
  {
    objc_msgSend((id)v27[5], "checkInConnection:", v4);
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v7 = (void *)v21[5];
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __45__ML3MusicLibrary_checkInDatabaseConnection___block_invoke_2;
    v12[3] = &unk_1E5B5CAF0;
    v8 = v4;
    v13 = v8;
    v14 = &v15;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
    if (!*((_BYTE *)v16 + 24))
    {
      v9 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v27[5];
        v11 = v21[5];
        *(_DWORD *)buf = 138543874;
        v33 = v8;
        v34 = 2114;
        v35 = v10;
        v36 = 2114;
        v37 = v11;
        _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "Orphaned connection=%{public}@, activePool=%{public}@, poolsPendingClose=%{public}@", buf, 0x20u);
      }

    }
    _Block_object_dispose(&v15, 8);
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

- (ML3DatabaseConnectionPool)connectionPool
{
  void *v3;
  NSObject *serialQueue;
  id v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2077;
  v15 = __Block_byref_object_dispose__2078;
  v16 = 0;
  -[ML3MusicLibrary databasePath](self, "databasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ML3MusicLibrary_connectionPool__block_invoke;
  block[3] = &unk_1E5B65CF0;
  block[4] = self;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(serialQueue, block);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (ML3DatabaseConnectionPool *)v6;
}

- (NSString)databasePath
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2077;
  v10 = __Block_byref_object_dispose__2078;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__ML3MusicLibrary_databasePath__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)connectionDidAccessDatabase:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "privacyContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "privacyContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logDatabasePrivacyAccess");

  }
  else
  {
    -[ML3MusicLibrary _logDatabaseAccess](self, "_logDatabaseAccess");
  }

}

- (void)connectionPool:(id)a3 createdNewConnection:(id)a4
{
  objc_msgSend(a4, "setConnectionDelegate:", self);
}

void __48__ML3MusicLibrary_setValue_forDatabaseProperty___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = a1[5];
  v8[0] = a1[4];
  v8[1] = v3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO _MLDatabaseProperties (value, key) VALUES (?, ?);"),
         v6,
         0);

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v7;
}

void __31__ML3MusicLibrary_databasePath__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (!v2)
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      +[ML3MusicLibrary autoupdatingSharedLibraryPath](ML3MusicLibrary, "autoupdatingSharedLibraryPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v4;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating database path : %{public}@", (uint8_t *)&v14, 0x16u);

    }
    +[ML3MusicLibrary autoupdatingSharedLibraryPath](ML3MusicLibrary, "autoupdatingSharedLibraryPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 112);
    *(_QWORD *)(v8 + 112) = v7;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 97) = 1;
    +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy](ML3MusicLibraryAccountChangeObserverProxy, "sharedProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAccountChangeObserver:", *(_QWORD *)(a1 + 32));

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  }
  v11 = objc_msgSend(v2, "copy");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

- (BOOL)mediaRestrictionEnabled
{
  int v3;
  void *v4;
  void *v5;

  ML3RestrictionInfoInitializeIfNecessary();
  LOBYTE(v3) = byte_1ED07883B | byte_1ED07883C
            || qword_1ED078848 < qword_1ED078850
            || qword_1ED078860 < qword_1ED078868;
  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MPExplicitContentAllowedBoolean"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((v3 & 1) != 0)
      LOBYTE(v3) = 1;
    else
      v3 = objc_msgSend(v4, "BOOLValue") ^ 1;
  }
  else if (byte_1ED07883A)
  {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (id)libraryEntityFilterPredicatesForEntityClass:(Class)a3
{
  NSObject *serialQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2077;
  v11 = __Block_byref_object_dispose__2078;
  v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ML3MusicLibrary_libraryEntityFilterPredicatesForEntityClass___block_invoke;
  block[3] = &unk_1E5B5CAC8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (NSString)autoupdatingSharedLibraryPath
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2077;
  v11 = __Block_byref_object_dispose__2078;
  v12 = 0;
  objc_msgSend(a1, "globalSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__ML3MusicLibrary_autoupdatingSharedLibraryPath__block_invoke;
  v6[3] = &unk_1E5B5C9D0;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  if (globalSerialQueue_onceToken != -1)
    dispatch_once(&globalSerialQueue_onceToken, &__block_literal_global_2476);
  return (OS_dispatch_queue *)(id)globalSerialQueue___globalSerialQueue;
}

- (id)libraryEntityFilterPredicatesForContainerClass:(Class)a3
{
  NSObject *serialQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2077;
  v11 = __Block_byref_object_dispose__2078;
  v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ML3MusicLibrary_libraryEntityFilterPredicatesForContainerClass___block_invoke;
  block[3] = &unk_1E5B5CAC8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __57__ML3MusicLibrary_sectionIndexTitleIndexForSectionIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __39__ML3MusicLibrary_isHomeSharingLibrary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 80))
  {
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Library.itdb"));

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = v4;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(v2 + 81);
}

void __33__ML3MusicLibrary_connectionPool__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  ML3DatabaseConnectionPool *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v3;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating connection pool with path: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v5 = -[ML3DatabaseConnectionPool initWithDatabasePath:maxReaders:maxWriters:]([ML3DatabaseConnectionPool alloc], "initWithDatabasePath:maxReaders:maxWriters:", *(_QWORD *)(a1 + 40), 10, objc_msgSend(*(id *)(a1 + 32), "isReadOnly") ^ 1);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 104);
    *(_QWORD *)(v6 + 104) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setDelegate:");
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Library.itdb"));

    if ((v9 & 1) != 0 || objc_msgSend(*(id *)(a1 + 32), "isUnitTesting"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setUseDistantWriterConnections:", 0);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

void __63__ML3MusicLibrary_libraryEntityFilterPredicatesForEntityClass___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(a1[5] + 8);
  v8 = *(_QWORD *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (!v8)
    objc_storeStrong(v7, *(id *)(a1[4] + 168));
}

void __61__ML3MusicLibrary_setLibraryPublicContainerFilterPredicates___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), *(id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = v2;

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v5, objc_opt_class());
  }
}

void __52__ML3MusicLibrary_setLibraryEntityFilterPredicates___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v5, objc_opt_class());
  }
}

void __55__ML3MusicLibrary_setLibraryContainerFilterPredicates___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v2;

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v5, objc_opt_class());
  }
}

void __58__ML3MusicLibrary_setLibraryPublicEntityFilterPredicates___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = v2;

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v5, objc_opt_class());
  }
}

- (id)localizedSectionHeaderForSectionIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2077;
  v15 = __Block_byref_object_dispose__2078;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ML3MusicLibrary_localizedSectionHeaderForSectionIndex___block_invoke;
  v10[3] = &unk_1E5B5CBB8;
  v10[4] = &v11;
  v10[5] = a3;
  -[ML3MusicLibrary accessSortKeyBuilder:](self, "accessSortKeyBuilder:", v10);
  ML3LocalizedSectionDictionary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("LocalizedSectionHeaders"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", v12[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v12[5], &stru_1E5B66908, CFSTR("MLLocalizable"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __46__ML3MusicLibrary_localizedSectionIndexTitles__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  ML3LocalizedSectionDictionary();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("LocalizedSectionIndices"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v1, "objectForKey:", CFSTR("SectionIndices"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKey:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (void *)v9;
        else
          v11 = v8;
        v12 = v11;

        objc_msgSend(v0, "addObject:", v12);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NUMERIC_SECTION_HEADER"), &stru_1E5B66908, CFSTR("MLLocalizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_SECTION_HEADER"), &stru_1E5B66908, CFSTR("MLLocalizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v16);

  v17 = objc_msgSend(v0, "copy");
  v18 = (void *)localizedSectionIndexTitles_localizedSectionIndexTitles;
  localizedSectionIndexTitles_localizedSectionIndexTitles = v17;

}

- (unint64_t)sectionIndexTitleIndexForSectionIndex:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2077;
  v15 = __Block_byref_object_dispose__2078;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ML3MusicLibrary_sectionIndexTitleIndexForSectionIndex___block_invoke;
  v10[3] = &unk_1E5B5CBB8;
  v10[4] = &v11;
  v10[5] = a3;
  -[ML3MusicLibrary accessSortKeyBuilder:](self, "accessSortKeyBuilder:", v10);
  if (objc_msgSend((id)v12[5], "isEqualToString:", CFSTR("NUMERIC_SECTION_HEADER")))
  {
    v5 = -[ML3MusicLibrary unknownSectionIndex](self, "unknownSectionIndex") - 1;
  }
  else if (objc_msgSend((id)v12[5], "isEqualToString:", CFSTR("UNKNOWN_SECTION_HEADER")))
  {
    v5 = -[ML3MusicLibrary unknownSectionIndex](self, "unknownSectionIndex");
  }
  else
  {
    ML3LocalizedSectionDictionary();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("SectionIndices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __57__ML3MusicLibrary_sectionIndexTitleIndexForSectionIndex___block_invoke_2;
    v9[3] = &unk_1E5B5CBE0;
    v9[4] = &v11;
    v5 = objc_msgSend(v7, "indexOfObjectPassingTest:", v9);

  }
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __44__ML3MusicLibrary_autoupdatingSharedLibrary__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "_onGlobalQueue_shareableMusicLibraryWithResourcesManager:autoUpdatingSharedLibraryPath:", 0, *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)autoupdatingSharedLibrary___sharedLibrary;
  autoupdatingSharedLibrary___sharedLibrary = v1;

}

- (ML3MusicLibrary)initWithPath:(id)a3 readOnly:(BOOL)a4 populateUnitTestTablesBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  ML3MusicLibrary *v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  MSVTCCIdentityForCurrentProcess();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ML3MusicLibrary initWithClientIdentity:path:readOnly:populateUnitTestTablesBlock:](self, "initWithClientIdentity:path:readOnly:populateUnitTestTablesBlock:", v10, v9, v5, v8);

  return v11;
}

- (ML3MusicLibrary)initWithPath:(id)a3
{
  return -[ML3MusicLibrary initWithPath:readOnly:populateUnitTestTablesBlock:](self, "initWithPath:readOnly:populateUnitTestTablesBlock:", a3, 0, 0);
}

- (ML3MusicLibrary)initWithClientIdentity:(id)a3 path:(id)a4 readOnly:(BOOL)a5 populateUnitTestTablesBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  ML3MusicLibrary *v13;
  ML3MusicLibrary *v14;
  uint64_t v15;
  NSString *databasePath;
  NSLock *v17;
  NSLock *libraryUIDLock;
  ML3DatabasePrivacyContext *v19;
  void *v20;
  uint64_t v21;
  ML3DatabasePrivacyContext *privacyContext;
  uint64_t v23;
  NSMutableSet *connectionPoolsPendingClose;
  dispatch_queue_t v25;
  OS_dispatch_queue *serialQueue;
  void *v27;
  id v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  ML3MusicLibrary *v35;
  id v36;
  objc_super v37;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v37.receiver = self;
  v37.super_class = (Class)ML3MusicLibrary;
  v13 = -[ML3MusicLibrary init](&v37, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_readOnly = a5;
    if (v11)
    {
      objc_msgSend(v11, "msv_stringByResolvingRealPath");
      v15 = objc_claimAutoreleasedReturnValue();
      databasePath = v14->_databasePath;
      v14->_databasePath = (NSString *)v15;
    }
    else
    {
      databasePath = v13->_databasePath;
      v13->_databasePath = 0;
    }

    v17 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    libraryUIDLock = v14->_libraryUIDLock;
    v14->_libraryUIDLock = v17;

    v19 = [ML3DatabasePrivacyContext alloc];
    v20 = v10;
    if (!v10)
    {
      MSVTCCIdentityForCurrentProcess();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = -[ML3DatabasePrivacyContext initWithClientIdentity:](v19, "initWithClientIdentity:", v20);
    privacyContext = v14->_privacyContext;
    v14->_privacyContext = (ML3DatabasePrivacyContext *)v21;

    if (!v10)
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    connectionPoolsPendingClose = v14->_connectionPoolsPendingClose;
    v14->_connectionPoolsPendingClose = (NSMutableSet *)v23;

    v25 = dispatch_queue_create("com.apple.MusicLibrary.atomicity", 0);
    serialQueue = v14->_serialQueue;
    v14->_serialQueue = (OS_dispatch_queue *)v25;

    -[ML3MusicLibrary _setupNotificationManager](v14, "_setupNotificationManager");
    if (v12 && !a5)
    {
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __84__ML3MusicLibrary_initWithClientIdentity_path_readOnly_populateUnitTestTablesBlock___block_invoke;
      v34 = &unk_1E5B5C9F8;
      v36 = v12;
      v35 = v14;
      -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](v35, "databaseConnectionAllowingWrites:withBlock:", 1, &v31);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v31, v32, v33, v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v14, sel__effectiveSettingsDidChangeNotification_, *MEMORY[0x1E0D46EC8], 0);
    if (!__daemonProcessInfo)
    {
      objc_msgSend(v27, "addObserver:selector:name:object:", v14, sel__libraryPathDidChangeNotification_, CFSTR("MLUserDatabasePathDidChangeNotification"), 0);
      v28 = (id)objc_msgSend(v27, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C99720], 0, 0, &__block_literal_global_90);
      v29 = (id)objc_msgSend(v27, "addObserverForName:object:queue:usingBlock:", CFSTR("SBFinishedLanguageChangeStartup"), 0, 0, &__block_literal_global_94);
    }
    ML3RestrictionInfoInitializeIfNecessary();

  }
  return v14;
}

- (void)_setupNotificationManager
{
  NSObject *v3;
  id v4;
  int v5;
  ML3MusicLibrary *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - _setupNotificationManager", (uint8_t *)&v5, 0xCu);
  }

  v4 = -[ML3MusicLibrary notificationManager](self, "notificationManager");
}

- (ML3LibraryNotificationManager)notificationManager
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2077;
  v10 = __Block_byref_object_dispose__2078;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__ML3MusicLibrary_notificationManager__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ML3LibraryNotificationManager *)v3;
}

uint64_t __55__ML3MusicLibrary_Jalisco__jaliscoGetSortedMediaKinds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int64_t)jaliscoOnDiskDatabaseRevision
{
  void *v2;
  int64_t v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLJaliscoDatabaseRevision"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)sagaOnDiskDatabaseRevision
{
  void *v2;
  int64_t v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudDatabaseRevision"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

void __97__ML3MusicLibrary_enumerateArtworkTokensForEntityPersistentID_entityType_artworkType_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intForColumnIndex:", 1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __121__ML3MusicLibrary_retrieveBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_completionHandler___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "stringForColumnIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), v6);
  objc_msgSend(v8, "stringForColumnIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v7);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (int)objc_msgSend(v8, "intForColumnIndex:", 2);
  *a4 = 1;

}

void __38__ML3MusicLibrary_notificationManager__block_invoke(uint64_t a1)
{
  void *v2;
  ML3LibraryNotificationManager *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v2)
  {
    v3 = [ML3LibraryNotificationManager alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "distributedToLocalNotificationMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ML3LibraryNotificationManager initWithLibrary:distributedAndLocalNames:](v3, "initWithLibrary:distributedAndLocalNames:", v4, v5);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 136);
    *(_QWORD *)(v7 + 136) = v6;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

+ (NSDictionary)distributedToLocalNotificationMapping
{
  if (distributedToLocalNotificationMapping_onceToken != -1)
    dispatch_once(&distributedToLocalNotificationMapping_onceToken, &__block_literal_global_600);
  return (NSDictionary *)(id)distributedToLocalNotificationMapping__mapping;
}

+ (id)artworkRelativePathFromToken:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  ldiv_t v7;
  uint64_t v8;
  char *v9;
  const UInt8 *v10;
  unsigned __int8 *v11;
  char *v12;
  char *v13;
  uint64_t m;
  unsigned int v15;
  char *v16;
  id v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  unsigned __int8 *v24;
  char *v25;
  char *v26;
  uint64_t j;
  unsigned int v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t quot;
  lldiv_t v33;
  uint64_t v34;
  CFStringRef v35;
  unsigned __int8 *v36;
  char *v37;
  char *v38;
  uint64_t k;
  unsigned int v40;
  char *v41;
  char *v42;
  uint64_t v43;
  _BYTE *v44;
  unint64_t v45;
  unsigned __int8 *v46;
  char *v47;
  char *v48;
  uint64_t i;
  unsigned int v50;
  char *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  _BYTE v58[208];
  _BYTE v59[72];
  _OWORD v60[4];
  uint64_t v61;
  _QWORD v62[3];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  memset(v58, 0, sizeof(v58));
  CC_SHA1_Init((CC_SHA1_CTX *)v58);
  v4 = objc_retainAutorelease(v3);
  CC_SHA1_Update((CC_SHA1_CTX *)v58, (const void *)objc_msgSend(v4, "UTF8String"), objc_msgSend(v4, "length"));

  memset(&v59[8], 0, 64);
  *(_QWORD *)v59 = 4001;
  CC_SHA1_Final(&v59[8], (CC_SHA1_CTX *)v58);
  v60[0] = *(_OWORD *)v59;
  v60[1] = *(_OWORD *)&v59[16];
  v60[2] = *(_OWORD *)&v59[32];
  v60[3] = *(_OWORD *)&v59[48];
  v61 = *(_QWORD *)&v59[64];
  if (*(uint64_t *)v59 > 3999)
  {
    if (*(uint64_t *)v59 > 4255)
    {
      if (*(_QWORD *)v59 == 4256)
      {
        v46 = (unsigned __int8 *)v60 + 8;
        v47 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v48 = v47;
        for (i = 0; i != 64; i += 2)
        {
          v50 = *v46++;
          v51 = &v47[i];
          *v51 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v50 >> 4];
          v51[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v50 & 0xF];
        }
        v17 = objc_alloc(MEMORY[0x1E0CB3940]);
        v18 = v48;
        v19 = 64;
      }
      else
      {
        if (*(_QWORD *)v59 != 4512)
          goto LABEL_48;
        v24 = (unsigned __int8 *)v60 + 8;
        v25 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v26 = v25;
        for (j = 0; j != 128; j += 2)
        {
          v28 = *v24++;
          v29 = &v25[j];
          *v29 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v28 >> 4];
          v29[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v28 & 0xF];
        }
        v17 = objc_alloc(MEMORY[0x1E0CB3940]);
        v18 = v26;
        v19 = 128;
      }
    }
    else if (*(_QWORD *)v59 == 4000)
    {
      v36 = (unsigned __int8 *)v60 + 8;
      v37 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v38 = v37;
      for (k = 0; k != 32; k += 2)
      {
        v40 = *v36++;
        v41 = &v37[k];
        *v41 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v40 >> 4];
        v41[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v40 & 0xF];
      }
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = v38;
      v19 = 32;
    }
    else
    {
      if (*(_QWORD *)v59 != 4001)
        goto LABEL_48;
      v11 = (unsigned __int8 *)v60 + 8;
      v12 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v13 = v12;
      for (m = 0; m != 40; m += 2)
      {
        v15 = *v11++;
        v16 = &v12[m];
        *v16 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v15 >> 4];
        v16[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v15 & 0xF];
      }
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = v13;
      v19 = 40;
    }
LABEL_45:
    v35 = (CFStringRef)objc_msgSend(v17, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v18, v19, 4, 1, 4001, *(_QWORD *)v58);
    goto LABEL_46;
  }
  if (*(uint64_t *)v59 > 2999)
  {
    if (*(_QWORD *)v59 == 3000)
    {
      LODWORD(v62[0]) = bswap32(DWORD2(v60[0]));
      v42 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v43 = 0;
      v44 = v42 + 1;
      do
      {
        v45 = *((unsigned __int8 *)v62 + v43);
        *(v44 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v45 >> 4];
        *v44 = MSVFastHexStringFromBytes_hexCharacters_22377[v45 & 0xF];
        v44 += 2;
        ++v43;
      }
      while (v43 != 4);
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = v42;
      v19 = 8;
    }
    else
    {
      if (*(_QWORD *)v59 != 3001)
        goto LABEL_48;
      v62[0] = bswap64(*((unint64_t *)&v60[0] + 1));
      v20 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v21 = 0;
      v22 = v20 + 1;
      do
      {
        v23 = *((unsigned __int8 *)v62 + v21);
        *(v22 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v23 >> 4];
        *v22 = MSVFastHexStringFromBytes_hexCharacters_22377[v23 & 0xF];
        v22 += 2;
        ++v21;
      }
      while (v21 != 8);
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = v20;
      v19 = 16;
    }
    goto LABEL_45;
  }
  if (*(_QWORD *)v59 == 1000)
  {
    v30 = *((_QWORD *)&v60[0] + 1);
    v31 = (char *)&v63 + 1;
    quot = *((_QWORD *)&v60[0] + 1);
    do
    {
      v33 = lldiv(quot, 10);
      quot = v33.quot;
      if (v33.rem >= 0)
        LOBYTE(v34) = v33.rem;
      else
        v34 = -v33.rem;
      *(v31 - 2) = v34 + 48;
      v10 = (const UInt8 *)(v31 - 2);
      --v31;
    }
    while (v33.quot);
    if (v30 < 0)
    {
      *(v31 - 2) = 45;
      v10 = (const UInt8 *)(v31 - 2);
    }
    v9 = (char *)((char *)&v63 - (char *)v10);
    goto LABEL_35;
  }
  if (*(_QWORD *)v59 != 2000)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 4001, *(_QWORD *)v58);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v52 = &stru_1E5B66908;
    goto LABEL_47;
  }
  v5 = DWORD2(v60[0]);
  v6 = &v63;
  do
  {
    v7 = ldiv(v5, 10);
    v5 = v7.quot;
    if (v7.rem >= 0)
      LOBYTE(v8) = v7.rem;
    else
      v8 = -v7.rem;
    *((_BYTE *)v6 - 1) = v8 + 48;
    v6 = (uint64_t *)((char *)v6 - 1);
  }
  while (v7.quot);
  v9 = (char *)((char *)&v63 - (char *)v6);
  v10 = (const UInt8 *)v6;
LABEL_35:
  v35 = CFStringCreateWithBytes(0, v10, (CFIndex)v9, 0x8000100u, 0);
LABEL_46:
  v52 = (__CFString *)v35;
LABEL_47:

  v53 = (void *)-[__CFString mutableCopy](v52, "mutableCopy");
  objc_msgSend(v53, "insertString:atIndex:", CFSTR("/"), 2);
  v54 = (void *)objc_msgSend(v53, "copy");

  return v54;
}

- (void)enumeratePersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 maximumRevisionType:(int)a5 forMediaTypes:(id)a6 inUsersLibrary:(BOOL)a7 usingBlock:(id)a8
{
  _BOOL4 v9;
  uint64_t v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  ML3MusicLibrary *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[3];

  v9 = a7;
  v10 = *(_QWORD *)&a5;
  v46[1] = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = a8;
  v36 = self;
  if (enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock__onceToken != -1)
    dispatch_once(&enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock__onceToken, &__block_literal_global_387);
  v16 = (void *)objc_msgSend(CFSTR("SELECT entity_pid, revision, revision_type, deleted, class FROM entity_revision "), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  if (v14)
    objc_msgSend(v16, "appendString:", CFSTR(" LEFT OUTER JOIN item AS mediaType_item ON (mediaType_item.item_pid = entity_pid) "));
  objc_msgSend(v16, "appendString:", CFSTR(" WHERE revision > ? "));
  if (v10 <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

    objc_msgSend(v16, "appendString:", CFSTR(" AND revision_type <= ? "));
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9)
    {
      objc_msgSend(v16, "appendString:", CFSTR(" AND CASE "));
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend((id)enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock____existsInLibraryClauses, "allValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v42 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(v16, "appendString:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v23);
      }

      v26 = CFSTR("ELSE 0 END");
      goto LABEL_20;
    }
  }
  else
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v30);

      v26 = CFSTR(" AND class = ? ");
LABEL_20:
      objc_msgSend(v16, "appendString:", v26);
      goto LABEL_21;
    }
    v27 = (void *)enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock____existsInLibraryClauses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR(" AND CASE %@ ELSE 0 END"), v29);

  }
LABEL_21:
  if (v14 && objc_msgSend(v14, "count"))
  {
    objc_msgSend(v16, "appendFormat:", CFSTR(" AND (deleted != 0"));
    if (objc_msgSend(v14, "count"))
    {
      v31 = 0;
      do
      {
        objc_msgSend(v16, "appendString:", CFSTR(" OR"));
        objc_msgSend(v14, "objectAtIndex:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR(" ((media_type & %lu) != 0)"), objc_msgSend(v32, "unsignedIntegerValue"));

        ++v31;
      }
      while (objc_msgSend(v14, "count") > v31);
    }
    objc_msgSend(v16, "appendString:", CFSTR(")"));
  }
  objc_msgSend(v16, "appendString:", CFSTR(";"));
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke_436;
  v37[3] = &unk_1E5B63BC8;
  v38 = v16;
  v39 = v19;
  v40 = v15;
  v33 = v15;
  v34 = v19;
  v35 = v16;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](v36, "databaseConnectionAllowingWrites:withBlock:", 0, v37);

}

- (void)_configureMediaLibraryDatabaseConnection:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  if ((objc_msgSend(v4, "isOpen") & 1) == 0)
    objc_msgSend(v4, "open");
  if (objc_msgSend(v4, "isOpen"))
  {
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3SearchStringMatch"), 2, ML3SearchStringMatch);
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3SeasonDisplayName"), 1, ML3SeasonDisplayName);
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3IsCurrentlyRestrictedMedia"), 4, ML3IsCurrentlyRestrictedMedia);
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3TrackIntegrityCompute"), 0xFFFFFFFFLL, ML3TrackIntegrityCompute);
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3TrackIntegrityVerify"), 0xFFFFFFFFLL, ML3TrackIntegrityVerify);
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3TrackDigestCompute"), 0xFFFFFFFFLL, ML3TrackDigestCompute);
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3CompoundSortKey"), 0xFFFFFFFFLL, ML3CompoundSortKey);
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3SpotlightMatch"), 0xFFFFFFFFLL, ML3SpotlightMatch);
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3SortString"), 0xFFFFFFFFLL, ML3SortString);
    objc_msgSend(v4, "registerFunctionName:argumentCount:functionPointer:", CFSTR("ML3SortStringWithPrefix"), 0xFFFFFFFFLL, ML3SortStringWithPrefix);
    objc_msgSend(v4, "registerFunctionName:argumentCount:block:", CFSTR("ML3StandardizedMediaType"), 1, &__block_literal_global_593);
    +[ML3Track registerBookmarkMetadataIdentifierFunctionOnConnection:](ML3Track, "registerBookmarkMetadataIdentifierFunctionOnConnection:", v4);
    iPhoneSortKeyBuilderInstallSqlite3_v2((unsigned int *)-[ML3MusicLibrary sortKeyBuilder](self, "sortKeyBuilder"), (sqlite3 *)objc_msgSend(v4, "_sqliteHandle"));
  }

}

- (void)accessSortKeyBuilder:(id)a3
{
  NSObject *serialQueue;
  void (**v5)(id, iPhoneSortKeyBuilder *);

  serialQueue = self->_serialQueue;
  v5 = (void (**)(id, iPhoneSortKeyBuilder *))a3;
  dispatch_assert_queue_not_V2(serialQueue);
  v5[2](v5, -[ML3MusicLibrary sortKeyBuilder](self, "sortKeyBuilder"));

}

- (iPhoneSortKeyBuilder)sortKeyBuilder
{
  NSObject *serialQueue;
  iPhoneSortKeyBuilder *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__ML3MusicLibrary_sortKeyBuilder__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (iPhoneSortKeyBuilder *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __57__ML3MusicLibrary_sectionIndexTitleIndexForSectionIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  iPhoneSortKeyBuilderGetHeaderForSection(a2, *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __57__ML3MusicLibrary_localizedSectionHeaderForSectionIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  iPhoneSortKeyBuilderGetHeaderForSection(a2, *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (int64_t)purgeableStorageSizeWithUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v7;
  int64_t v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  int v13;
  _BYTE v14[10];
  int v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  if (-[ML3MusicLibrary currentDatabaseVersion](self, "currentDatabaseVersion") == 2200070)
  {
    v7 = -[ML3MusicLibrary _databaseFileFreeSpace](self, "_databaseFileFreeSpace");
    if (-[ML3MusicLibrary _shouldPurgeManagedAlbumsTracksForUrgency:](self, "_shouldPurgeManagedAlbumsTracksForUrgency:", a3))
    {
      v8 = -[ML3MusicLibrary _managedPurgeableTracksTotalSizeWithUrgency:](self, "_managedPurgeableTracksTotalSizeWithUrgency:", a3);
    }
    else
    {
      v8 = -[ML3MusicLibrary _purgeableTracksTotalSizeWithUrgency:includeAutoFilledTracks:](self, "_purgeableTracksTotalSizeWithUrgency:includeAutoFilledTracks:", a3, v4);
    }
    v10 = v8 + v7;
  }
  else
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = 67109376;
      *(_DWORD *)v14 = -[ML3MusicLibrary currentDatabaseVersion](self, "currentDatabaseVersion");
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = 2200070;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "Skipping purgeable calculation for tracks because DB is not present or invalid (db version=%d, current version=%d)", (uint8_t *)&v13, 0xEu);
    }

    v10 = 0;
  }
  v11 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218496;
    *(_QWORD *)v14 = v10;
    *(_WORD *)&v14[8] = 1024;
    v15 = a3;
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "Purgeable size of %lld bytes for urgency %d, includeAutoFilledTracks=%d", (uint8_t *)&v13, 0x18u);
  }

  return v10;
}

- (int)currentDatabaseVersion
{
  void *v2;
  ML3DatabaseConnection *v3;
  void *v4;
  int v5;

  -[ML3MusicLibrary databasePath](self, "databasePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[ML3DatabaseConnection initWithDatabasePath:]([ML3DatabaseConnection alloc], "initWithDatabasePath:", v2);
  if (-[ML3DatabaseConnection databasePathExists](v3, "databasePathExists"))
  {
    -[ML3DatabaseConnection executeQuery:](v3, "executeQuery:", CFSTR("PRAGMA user_version"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "int64ValueForFirstRowAndColumn");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __41__ML3MusicLibrary_currentContentRevision__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "executeQuery:", CFSTR("SELECT MAX(revision) FROM entity_revision WHERE revision_type=0;"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64ValueForFirstRowAndColumn");

}

void __34__ML3MusicLibrary_currentRevision__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "executeQuery:", CFSTR("SELECT MAX(revision) FROM entity_revision;"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64ValueForFirstRowAndColumn");

}

- (int64_t)currentRevision
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__ML3MusicLibrary_currentRevision__block_invoke;
  v4[3] = &unk_1E5B5CA80;
  v4[4] = &v5;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)currentContentRevision
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__ML3MusicLibrary_currentContentRevision__block_invoke;
  v4[3] = &unk_1E5B5CA80;
  v4[4] = &v5;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

_QWORD *__33__ML3MusicLibrary_sortKeyBuilder__block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result[4] + 120);
  if (!v2)
  {
    result = iPhoneSortKeyBuilderCreateForCurrentDevice();
    *(_QWORD *)(v1[4] + 120) = result;
    v2 = *(_QWORD *)(v1[4] + 120);
  }
  *(_QWORD *)(*(_QWORD *)(v1[5] + 8) + 24) = v2;
  return result;
}

void __35__ML3MusicLibrary_resourcesManager__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (!v2)
  {
    +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __48__ML3MusicLibrary_autoupdatingSharedLibraryPath__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)__sharedLibraryDatabasePath;
  if (!__sharedLibraryDatabasePath)
  {
    objc_msgSend(*(id *)(a1 + 40), "pathForResourceFileOrFolder:", 15);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)__sharedLibraryDatabasePath;
    __sharedLibraryDatabasePath = v3;

    v2 = (void *)__sharedLibraryDatabasePath;
  }
  v5 = objc_msgSend(v2, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (id)pathForResourceFileOrFolder:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResourceFileOrFolder:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)artworkCacheDirectoryForSize:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fx%.0f"), *(_QWORD *)&a3.width, *(_QWORD *)&a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[ML3MusicLibrary rootArtworkCacheDirectory](self, "rootArtworkCacheDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathWithComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)rootArtworkCacheDirectory
{
  return (NSString *)-[ML3MusicLibrary pathForResourceFileOrFolder:](self, "pathForResourceFileOrFolder:", 14);
}

- (id)pathForResourceFileOrFolder:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[ML3MusicLibrary resourcesManager](self, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResourceFileOrFolder:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ML3MusicLibraryResourcesManager)resourcesManager
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2077;
  v10 = __Block_byref_object_dispose__2078;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__ML3MusicLibrary_resourcesManager__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ML3MusicLibraryResourcesManager *)v3;
}

+ (id)mediaFolderPath
{
  void *v2;
  void *v3;

  MLMobileUserHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Media"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)originalArtworkDirectory
{
  return (NSString *)-[ML3MusicLibrary pathForResourceFileOrFolder:](self, "pathForResourceFileOrFolder:", 13);
}

- (void)connectionDidOpenDatabase:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ML3MusicLibrary _canConfigureMediaLibraryDatabaseConnection:](self, "_canConfigureMediaLibraryDatabaseConnection:"))
  {
    -[ML3MusicLibrary _configureMediaLibraryDatabaseConnection:](self, "_configureMediaLibraryDatabaseConnection:", v4);
  }

}

- (void)connectionWillOpenDatabase:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (MSVDeviceOSIsInternalInstall())
  {
    if (!__daemonProcessInfo)
    {
      +[ML3TerminationCoordinator sharedCoordinator](ML3TerminationCoordinator, "sharedCoordinator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isSigned");

      if ((v5 & 1) == 0)
      {
        +[ML3TerminationCoordinator sharedCoordinator](ML3TerminationCoordinator, "sharedCoordinator");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "signForReason:", 1);

      }
    }
  }
  if ((__disableAutomaticDatabaseValidation & 1) == 0)
    -[ML3MusicLibrary validateDatabase](self, "validateDatabase");
  objc_msgSend(v9, "privacyContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[ML3MusicLibrary privacyContext](self, "privacyContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrivacyContext:", v8);

  }
}

- (ML3DatabasePrivacyContext)privacyContext
{
  ML3DatabasePrivacyContext *privacyContext;
  ML3DatabasePrivacyContext *v4;

  os_unfair_lock_lock(&__privacyContextLock);
  privacyContext = (ML3DatabasePrivacyContext *)__privacyContextOverride;
  if (!__privacyContextOverride)
    privacyContext = self->_privacyContext;
  v4 = privacyContext;
  os_unfair_lock_unlock(&__privacyContextLock);
  return v4;
}

- (BOOL)validateDatabase
{
  void *v3;

  +[ML3DatabaseValidationClient sharedClient](ML3DatabaseValidationClient, "sharedClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "validateDatabaseForLibrary:", self);

  return (char)self;
}

- (BOOL)_canConfigureMediaLibraryDatabaseConnection:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = 0;
  else
    v5 = (objc_msgSend(v4, "isReadOnly") & 1) != 0
      || __daemonProcessInfo && !objc_msgSend(v4, "isReadOnly")
      || -[ML3MusicLibrary isHomeSharingLibrary](self, "isHomeSharingLibrary")
      || -[ML3MusicLibrary isUnitTesting](self, "isUnitTesting");

  return v5;
}

void __97__ML3MusicLibrary_enumerateArtworkTokensForEntityPersistentID_entityType_artworkType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:withParameters:", CFSTR("SELECT artwork_token, artwork_source_type FROM artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__ML3MusicLibrary_enumerateArtworkTokensForEntityPersistentID_entityType_artworkType_usingBlock___block_invoke_2;
  v11[3] = &unk_1E5B5F810;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v10, "enumerateRowsWithBlock:", v11);

}

void __121__ML3MusicLibrary_retrieveBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  __int128 v12;
  uint64_t v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:withParameters:", CFSTR("SELECT available_artwork_token, fetchable_artwork_token, fetchable_artwork_source_type FROM best_artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __121__ML3MusicLibrary_retrieveBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5B62B78;
  v12 = *(_OWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v10, "enumerateRowsWithBlock:", v11);

}

- (NSArray)localizedSectionIndexTitles
{
  if (localizedSectionIndexTitles_once != -1)
    dispatch_once(&localizedSectionIndexTitles_once, &__block_literal_global_138);
  return (NSArray *)(id)localizedSectionIndexTitles_localizedSectionIndexTitles;
}

- (void)retrieveBestArtworkTokensForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 retrievalTime:(double)a6 completionHandler:(id)a7
{
  void (**v12)(id, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  void *v14;
  _QWORD v15[10];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v12 = (void (**)(id, uint64_t, uint64_t, uint64_t))a7;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2077;
  v30 = __Block_byref_object_dispose__2078;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2077;
  v20 = __Block_byref_object_dispose__2078;
  v21 = 0;
  if (a5 == 3)
  {
    +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", a3, a6);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v27[5];
    v27[5] = v13;

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __121__ML3MusicLibrary_retrieveBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_completionHandler___block_invoke;
    v15[3] = &unk_1E5B5D078;
    v15[8] = a4;
    v15[9] = a5;
    v15[4] = &v26;
    v15[5] = &v16;
    v15[6] = &v22;
    v15[7] = a3;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v15);
  }
  v12[2](v12, v27[5], v17[5], v23[3]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

}

- (void)setLibraryPublicEntityFilterPredicates:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ML3MusicLibrary_setLibraryPublicEntityFilterPredicates___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)setLibraryEntityFilterPredicates:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ML3MusicLibrary_setLibraryEntityFilterPredicates___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (id)mediaFolderPath
{
  return +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
}

- (void)setLibraryPublicContainerFilterPredicates:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ML3MusicLibrary_setLibraryPublicContainerFilterPredicates___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)setLibraryContainerFilterPredicates:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ML3MusicLibrary_setLibraryContainerFilterPredicates___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (NSArray)jaliscoLastExcludedMediaKinds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLJaliscoLastExcludedMediaKinds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_longLongValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ML3MusicLibrary jaliscoGetSortedMediaKinds:](ML3MusicLibrary, "jaliscoGetSortedMediaKinds:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

+ (id)jaliscoGetSortedMediaKinds:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_17269);
}

void __36__ML3MusicLibrary_globalSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MusicLibrary.global.serial.queue", v2);
  v1 = (void *)globalSerialQueue___globalSerialQueue;
  globalSerialQueue___globalSerialQueue = (uint64_t)v0;

}

- (int64_t)purgeableStorageSizeWithUrgency:(unint64_t)a3
{
  return -[ML3MusicLibrary purgeableStorageSizeWithUrgency:includeAutoFilledTracks:](self, "purgeableStorageSizeWithUrgency:includeAutoFilledTracks:", a3, +[ML3MusicLibrary autoFilledTracksArePurgeable](ML3MusicLibrary, "autoFilledTracksArePurgeable"));
}

- (void)connection:(id)a3 didEndDatabaseTransactionAndCommit:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;
  id v7;

  v4 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "library:didCommitDatabaseTransactionWithConnection:", self, v7);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "library:didRollbackDatabaseTransactionWithConnection:", self, v7);
  }

}

- (void)connectionDidBeginDatabaseTransaction:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "library:didBeginDatabaseTransactionWithConnection:", self, v5);

}

- (BOOL)isUnitTesting
{
  return self->_isUnitTesting;
}

- (BOOL)isHomeSharingLibrary
{
  void *v3;
  NSObject *serialQueue;
  id v5;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[ML3MusicLibrary databasePath](self, "databasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ML3MusicLibrary_isHomeSharingLibrary__block_invoke;
  block[3] = &unk_1E5B65CF0;
  block[4] = self;
  v8 = v3;
  v9 = &v10;
  v5 = v3;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)serialQueue;
}

- (NSString)sagaClientFeaturesVersion
{
  return (NSString *)-[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudDatabaseClientFeaturesVersion"));
}

- (void)setJaliscoAccountID:(id)a3
{
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", a3, CFSTR("MLJaliscoAccountID"));
}

- (NSString)jaliscoLastSupportedMediaKinds
{
  return (NSString *)-[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLJaliscoLastSupportedMediaKinds"));
}

void __44__ML3MusicLibrary_autoupdatingSharedLibrary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  id v6[2];

  objc_msgSend(*(id *)(a1 + 40), "globalSerialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ML3MusicLibrary_autoupdatingSharedLibrary__block_invoke_2;
  block[3] = &unk_1E5B5F8C8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  *(_OWORD *)v6 = v4;
  dispatch_sync(v2, block);

}

- (id)checkoutWriterConnection
{
  void *v3;
  void *v4;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  -[ML3MusicLibrary connectionPool](self, "connectionPool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writerConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)libraryUID
{
  NSString *v3;
  NSString *libraryUID;
  void *v5;
  void *v6;

  -[NSLock lock](self->_libraryUIDLock, "lock");
  if (!self->_libraryUID)
  {
    -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("_UUID"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    libraryUID = self->_libraryUID;
    self->_libraryUID = v3;

    if (!self->_libraryUID)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v6, CFSTR("_UUID")))
        objc_storeStrong((id *)&self->_libraryUID, v6);

    }
  }
  -[NSLock unlock](self->_libraryUIDLock, "unlock");
  return self->_libraryUID;
}

+ (id)musicLibraryForUserAccount:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  objc_msgSend(v4, "accountDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[ML3MusicLibrary deviceSupportsMultipleLibraries](ML3MusicLibrary, "deviceSupportsMultipleLibraries"))
  {
    v6 = v5 == 0;
  }
  else
  {
    v6 = 1;
  }
  if (v6)
  {
    objc_msgSend(a1, "autoupdatingSharedLibrary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2077;
    v19 = __Block_byref_object_dispose__2078;
    v20 = 0;
    objc_msgSend(a1, "globalSerialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__ML3MusicLibrary_musicLibraryForUserAccount___block_invoke;
    v10[3] = &unk_1E5B659F8;
    v13 = &v15;
    v14 = a1;
    v11 = v5;
    v12 = v4;
    dispatch_sync(v7, v10);

    v8 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  return v8;
}

+ (ML3MusicLibrary)autoupdatingSharedLibrary
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  ML3MusicLibrary *v9;
  void *v12;
  _QWORD v13[4];
  void *v14;
  id v15;

  if (__disableSharedLibrary == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3MusicLibrary.m"), 343, CFSTR("sharedLibrary use is disabled. use initWithPath: in this process"));

  }
  +[ML3MusicLibrary autoupdatingSharedLibraryPath](ML3MusicLibrary, "autoupdatingSharedLibraryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__ML3MusicLibrary_autoupdatingSharedLibrary__block_invoke;
  v13[3] = &unk_1E5B5F8C8;
  v14 = v4;
  v15 = a1;
  v5 = autoupdatingSharedLibrary_onceToken[0];
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(autoupdatingSharedLibrary_onceToken, v13);
    v8 = v14;
  }
  v9 = (ML3MusicLibrary *)(id)autoupdatingSharedLibrary___sharedLibrary;

  return v9;
}

void __56__ML3MusicLibrary_distributedToLocalNotificationMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.mobileipod.librarychanged");
  v2[1] = CFSTR("com.apple.mobileipod.entitiesaddedorremoved");
  v3[0] = CFSTR("ML3MusicLibraryContentsDidChangeNotification");
  v3[1] = CFSTR("ML3MusicLibraryEntitiesAddedOrRemovedNotification");
  v2[2] = CFSTR("com.apple.mobileipod.noncontentspropertieschanged");
  v2[3] = CFSTR("com.apple.mobileipod.invisiblepropertieschanged");
  v3[2] = CFSTR("ML3MusicLibraryNonContentsPropertiesDidChangeNotification");
  v3[3] = CFSTR("ML3MusicLibraryInvisiblePropertiesDidChangeNotification");
  v2[4] = CFSTR("com.apple.mobileipod.displayvalueschanged");
  v2[5] = CFSTR("com.apple.mobileipod.syncgenerationchanged");
  v3[4] = CFSTR("ML3MusicLibraryDisplayValuesDidChangeNotification");
  v3[5] = CFSTR("ML3MusicLibrarySyncGenerationDidChangeNotification");
  v2[6] = CFSTR("com.apple.mobileipod.libraryUIDchanged");
  v2[7] = CFSTR("com.apple.mobileipod.cloudlibraryavailabilitychanged");
  v3[6] = CFSTR("ML3MusicLibraryUIDDidChangeNotification");
  v3[7] = CFSTR("ML3MusicLibraryCloudLibraryAvailablityDidChangeNotification");
  v2[8] = CFSTR("com.apple.mobileipod.sectionschanged");
  v2[9] = CFSTR("com.apple.mobileipod.libraryimportdidfinish");
  v3[8] = CFSTR("ML3MusicLibrarySectionsDidChangeNotification");
  v3[9] = CFSTR("ML3MusicLibraryImportDidFinishNotification");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)distributedToLocalNotificationMapping__mapping;
  distributedToLocalNotificationMapping__mapping = v0;

}

- (void)setStorefrontIdentifier:(id)a3
{
  if (a3)
    -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", a3, CFSTR("MLStorefrontID"));
  else
    -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLStorefrontID"));
}

- (BOOL)jaliscoNeedsUpdateForTokens
{
  void *v2;
  char v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLJaliscoNeedsUpdateForTokens"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

void __66__ML3MusicLibrary_libraryEntityFilterPredicatesForContainerClass___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(a1[5] + 8);
  v8 = *(_QWORD *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (!v8)
    objc_storeStrong(v7, *(id *)(a1[4] + 176));
}

- (void)enumerateArtworkTokensForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__ML3MusicLibrary_enumerateArtworkTokensForEntityPersistentID_entityType_artworkType_usingBlock___block_invoke;
  v12[3] = &unk_1E5B5D0A0;
  v15 = a4;
  v16 = a5;
  v13 = v10;
  v14 = a3;
  v11 = v10;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v12);

}

- (ML3Container)currentDeviceFavoriteSongsPlaylist
{
  void *v3;
  void *v4;

  +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("(container.distinguished_kind = 71)"), MEMORY[0x1E0C9AAB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity anyInLibrary:predicate:options:](ML3Container, "anyInLibrary:predicate:options:", self, v3, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ML3Container *)v4;
}

- (void)setClientIdentity:(id)a3
{
  id v4;
  ML3DatabasePrivacyContext *v5;
  ML3DatabasePrivacyContext *privacyContext;

  v4 = a3;
  os_unfair_lock_lock(&__privacyContextLock);
  v5 = -[ML3DatabasePrivacyContext initWithClientIdentity:]([ML3DatabasePrivacyContext alloc], "initWithClientIdentity:", v4);

  privacyContext = self->_privacyContext;
  self->_privacyContext = v5;

  os_unfair_lock_unlock(&__privacyContextLock);
}

void __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E5BAAD28;
  v2[1] = &unk_1E5BAAD40;
  v3[0] = CFSTR("WHEN class = 0 THEN deleted != 0 OR EXISTS (SELECT 1 FROM item WHERE item.in_my_library AND item.item_pid = entity_pid) ");
  v3[1] = CFSTR("WHEN class = 1 THEN deleted != 0 OR EXISTS (SELECT 1 FROM container WHERE container_pid = entity_pid) ");
  v2[2] = &unk_1E5BAAD58;
  v2[3] = &unk_1E5BAAD70;
  v3[2] = CFSTR("WHEN class = 2 THEN deleted != 0 OR EXISTS (SELECT 1 FROM item_artist JOIN item USING(item_artist_pid) WHERE item.in_my_library AND item_artist_pid = entity_pid LIMIT 1) ");
  v3[3] = CFSTR("WHEN class = 3 THEN deleted != 0 OR EXISTS (SELECT 1 FROM genre JOIN item USING(genre_id) WHERE item.in_my_library AND genre_id = entity_pid LIMIT 1) ");
  v2[4] = &unk_1E5BAAD88;
  v2[5] = &unk_1E5BAADA0;
  v3[4] = CFSTR("WHEN class = 4 THEN deleted != 0 OR EXISTS (SELECT 1 FROM album JOIN item USING(album_pid) WHERE item.in_my_library AND album_pid = entity_pid LIMIT 1) ");
  v3[5] = CFSTR("WHEN class = 5 THEN deleted != 0 OR EXISTS (SELECT 1 FROM composer JOIN item USING(composer_pid) WHERE item.in_my_library AND composer_pid = entity_pid LIMIT 1) ");
  v2[6] = &unk_1E5BAADB8;
  v3[6] = CFSTR("WHEN class = 7 THEN deleted != 0 OR EXISTS (SELECT 1 FROM album_artist JOIN item USING(album_artist_pid) WHERE item.in_my_library AND album_artist_pid = entity_pid LIMIT 1) ");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock____existsInLibraryClauses;
  enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock____existsInLibraryClauses = v0;

}

- (BOOL)isArtworkFetchableForPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6
{
  BOOL v6;
  id v7;
  void *v8;
  const __CFString *v9;

  v6 = 0;
  switch(a4)
  {
    case 0:
      if (a6 == 600)
        goto LABEL_14;
      if (a6 == 400)
      {
        if ((unint64_t)(a5 - 1) > 1)
          goto LABEL_20;
        v7 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", a3, self);
        if (objc_msgSend(v7, "existsInLibrary"))
        {
          v9 = CFSTR("item_store.purchase_history_id");
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      if (a6 != 200 || (unint64_t)(a5 - 1) > 1)
        goto LABEL_20;
      v7 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", a3, self);
      if (!objc_msgSend(v7, "existsInLibrary"))
        goto LABEL_21;
      objc_msgSend(v7, "valueForProperty:", CFSTR("item_store.store_saga_id"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "longLongValue") > 0;
      goto LABEL_19;
    case 1:
      if (a6 == 600)
      {
LABEL_14:
        v6 = 1;
      }
      else if (a6 == 200 && a5 == 5)
      {
        v7 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", a3, self);
        if (objc_msgSend(v7, "existsInLibrary"))
        {
          v9 = CFSTR("store_cloud_id");
LABEL_18:
          objc_msgSend(v7, "valueForProperty:", v9);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v8, "unsignedIntegerValue") != 0;
LABEL_19:

        }
        else
        {
LABEL_21:
          v6 = 0;
        }

      }
      else
      {
LABEL_20:
        v6 = 0;
      }
      break;
    case 2:
    case 7:
      v6 = a6 == 500;
      break;
    default:
      return v6;
  }
  return v6;
}

- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__ML3MusicLibrary_setValue_forDatabaseProperty___block_invoke;
    v10[3] = &unk_1E5B62DC0;
    v13 = &v14;
    v6 = v6;
    v11 = v6;
    v12 = v7;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v10);
    v8 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __40__ML3MusicLibrary_groupingKeyForString___block_invoke(uint64_t a1, uint64_t a2)
{
  CFDataRef v3;
  uint64_t v4;
  void *v5;

  v3 = iPhoneSortKeyBuilderCopyGroupingKeyForString(a2, *(CFStringRef *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

CFIndex __38__ML3MusicLibrary_unknownSectionIndex__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  CFIndex result;

  v3 = *(_QWORD *)(a2 + 24) + 48 * *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(v3 - 8);
  result = CFArrayGetCount(*(CFArrayRef *)(v3 - 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4 + result + 1;
  return result;
}

- (unint64_t)unknownSectionIndex
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__ML3MusicLibrary_unknownSectionIndex__block_invoke;
  v4[3] = &unk_1E5B61690;
  v4[4] = &v5;
  -[ML3MusicLibrary accessSortKeyBuilder:](self, "accessSortKeyBuilder:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)groupingKeyForString:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__2077;
    v14 = __Block_byref_object_dispose__2078;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__ML3MusicLibrary_groupingKeyForString___block_invoke;
    v7[3] = &unk_1E5B5CB90;
    v9 = &v10;
    v8 = v4;
    -[ML3MusicLibrary accessSortKeyBuilder:](self, "accessSortKeyBuilder:", v7);
    v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (BOOL)autoFilledTracksArePurgeable
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("_ML3AutofilledTracksArePurgeableKey"), CFSTR("com.apple.medialibrary"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (ML3MusicLibrary)initWithClientIdentity:(id)a3 forUserAccount:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  ML3MusicLibraryResourcesManager *v11;
  void *v12;
  ML3MusicLibrary *v13;
  ML3MusicLibrary *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *accountDSID;

  v6 = a3;
  v7 = a4;
  v8 = +[ML3MusicLibrary deviceSupportsMultipleLibraries](ML3MusicLibrary, "deviceSupportsMultipleLibraries");
  if (v7
    && v8
    && (objc_msgSend(v7, "accountDSID"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    +[ML3MusicLibraryResourcesManagerContext contextForSingleUserLibraryWithAccountInfo:](ML3MusicLibraryResourcesManagerContext, "contextForSingleUserLibraryWithAccountInfo:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ML3MusicLibraryResourcesManager initWithContext:]([ML3MusicLibraryResourcesManager alloc], "initWithContext:", v10);
    -[ML3MusicLibraryResourcesManager pathForResourceFileOrFolder:](v11, "pathForResourceFileOrFolder:", 15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ML3MusicLibrary initWithClientIdentity:path:readOnly:populateUnitTestTablesBlock:](self, "initWithClientIdentity:path:readOnly:populateUnitTestTablesBlock:", v6, v12, 0, 0);
    v14 = v13;
    if (v13)
    {
      v13->_usingSharedLibraryPath = 0;
      objc_storeStrong((id *)&v13->_resourcesManager, v11);
      -[ML3MusicLibraryResourcesManager context](v11, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accountInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accountDSID");
      v17 = objc_claimAutoreleasedReturnValue();
      accountDSID = v14->_accountDSID;
      v14->_accountDSID = (NSString *)v17;

    }
  }
  else
  {
    v14 = -[ML3MusicLibrary initWithClientIdentity:path:readOnly:populateUnitTestTablesBlock:](self, "initWithClientIdentity:path:readOnly:populateUnitTestTablesBlock:", v6, 0, 0, 0);
  }

  return v14;
}

- (ML3MusicLibrary)initWithResourcesManager:(id)a3
{
  id v5;
  void *v6;
  ML3MusicLibrary *v7;
  ML3MusicLibrary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *accountDSID;

  v5 = a3;
  objc_msgSend(v5, "pathForResourceFileOrFolder:", 15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ML3MusicLibrary initWithPath:](self, "initWithPath:", v6);
  v8 = v7;
  if (v7)
  {
    v7->_usingSharedLibraryPath = 0;
    objc_storeStrong((id *)&v7->_resourcesManager, a3);
    objc_msgSend(v5, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountDSID");
    v11 = objc_claimAutoreleasedReturnValue();
    accountDSID = v8->_accountDSID;
    v8->_accountDSID = (NSString *)v11;

  }
  return v8;
}

- (ML3MusicLibrary)initWithPath:(id)a3 isUnitTesting:(BOOL)a4
{
  self->_isUnitTesting = a4;
  return -[ML3MusicLibrary initWithPath:](self, "initWithPath:", a3);
}

- (ML3MusicLibrary)initWithClientIdentity:(id)a3 path:(id)a4
{
  return -[ML3MusicLibrary initWithClientIdentity:path:readOnly:populateUnitTestTablesBlock:](self, "initWithClientIdentity:path:readOnly:populateUnitTestTablesBlock:", a3, a4, 0, 0);
}

- (ML3MusicLibrary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  ML3MusicLibrary *v11;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  if ((objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutoupdatingSharedLibraryKey")) & 1) != 0)
  {
    +[ML3MusicLibrary autoupdatingSharedLibraryPath](ML3MusicLibrary, "autoupdatingSharedLibraryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourceManagerKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2077;
  v21 = __Block_byref_object_dispose__2078;
  v22 = 0;
  +[ML3MusicLibrary globalSerialQueue](ML3MusicLibrary, "globalSerialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ML3MusicLibrary_initWithCoder___block_invoke;
  block[3] = &unk_1E5B65CF0;
  v15 = v6;
  v16 = &v17;
  v14 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

  v11 = (ML3MusicLibrary *)(id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  objc_msgSend(v5, "encodeBool:forKey:", -[ML3MusicLibrary isUsingSharedLibraryPath](self, "isUsingSharedLibraryPath"), CFSTR("isAutoupdatingSharedLibraryKey"));
  if (!-[ML3MusicLibrary isUsingSharedLibraryPath](self, "isUsingSharedLibraryPath"))
  {
    -[ML3MusicLibrary resourcesManager](self, "resourcesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("resourceManagerKey"));

  }
}

- (NSString)debugDescription
{
  void *v3;
  NSString *databasePath;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  databasePath = self->_databasePath;
  v5 = __sharedLibraryDatabasePath;
  -[ML3MusicLibrary pathForResourceFileOrFolder:](self, "pathForResourceFileOrFolder:", 15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MusicLibrary: %p> path=%@ _sharedLibraryDatabasePath=%@ computedSharedLibraryDatabasePath=%@ _connectionPool=%p _usingSharedLibraryPath=%d, _isHomeSharingLibrary=%d"), self, databasePath, v5, v6, self->_connectionPool, self->_usingSharedLibraryPath, self->_isHomeSharingLibrary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)dealloc
{
  void *v3;
  ML3AccountCacheDatabase *accountCacheDatabase;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);
  iPhoneSortKeyBuilderRelease((unsigned int *)self->_sortKeyBuilder);
  self->_sortKeyBuilder = 0;
  accountCacheDatabase = self->_accountCacheDatabase;
  self->_accountCacheDatabase = 0;

  v5.receiver = self;
  v5.super_class = (Class)ML3MusicLibrary;
  -[ML3MusicLibrary dealloc](&v5, sel_dealloc);
}

- (void)setIsHomeSharingLibrary:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *serialQueue;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ML3MusicLibrary_setIsHomeSharingLibrary___block_invoke;
  v7[3] = &unk_1E5B65BB0;
  v7[4] = self;
  v8 = a3;
  dispatch_sync(serialQueue, v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v6, CFSTR("MLIsHomeSharingLibrary"));

}

- (BOOL)downloadOnAddToLibrary
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  _DWORD v8[2];
  __int16 v9;
  NSObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (MSVDeviceSupportsSideLoadedMediaContent())
  {
    +[ML3AccountStore defaultStore](ML3AccountStore, "defaultStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activeAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_opt_class();
      objc_msgSend(v3, "ams_automaticDownloadKinds");
      v4 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject containsObject:](v4, "containsObject:", CFSTR("song")))
        v5 = -[NSObject containsObject:](v4, "containsObject:", CFSTR("music-video"));
      else
        v5 = 0;
      v6 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109378;
        v8[1] = v5;
        v9 = 2114;
        v10 = v4;
        _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Automatic Downloads are %{BOOL}u. enabledKinds=%{public}@", (uint8_t *)v8, 0x12u);
      }

    }
    else
    {
      v4 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "Could not get active account. Treating automatic Downloads as disabled", (uint8_t *)v8, 2u);
      }
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setSyncGenerationID:(int64_t)a3
{
  void *v5;
  id v6;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v5, CFSTR("MLSyncClientGenerationID"));

  -[ML3MusicLibrary notificationManager](self, "notificationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueueDistributedNotificationNamed:", CFSTR("com.apple.mobileipod.syncgenerationchanged"));

}

- (int64_t)syncGenerationID
{
  void *v2;
  int64_t v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLSyncClientGenerationID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (void)setSyncLibraryID:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ML3MusicLibrary_setSyncLibraryID___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v6, CFSTR("MLSyncLibraryID"));

}

- (NSString)syncLibraryID
{
  NSObject *serialQueue;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  serialQueue = self->_serialQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ML3MusicLibrary_syncLibraryID__block_invoke;
  block[3] = &unk_1E5B65E48;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v22 + 24))
  {
    -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLSyncLibraryID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_serialQueue;
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __32__ML3MusicLibrary_syncLibraryID__block_invoke_2;
    v18[3] = &unk_1E5B65EB8;
    v18[4] = self;
    v19 = v5;
    v7 = v5;
    dispatch_sync(v6, v18);

  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2077;
  v16 = __Block_byref_object_dispose__2078;
  v17 = 0;
  v8 = self->_serialQueue;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __32__ML3MusicLibrary_syncLibraryID__block_invoke_3;
  v11[3] = &unk_1E5B65E48;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v8, v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v21, 8);
  return (NSString *)v9;
}

- (void)setLibraryUID:(id)a3
{
  id v4;
  NSString *libraryUID;
  NSString *v6;
  NSString *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[NSLock lock](self->_libraryUIDLock, "lock");
  libraryUID = self->_libraryUID;
  if (libraryUID && !-[NSString isEqualToString:](libraryUID, "isEqualToString:", v4))
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    v7 = self->_libraryUID;
    self->_libraryUID = v6;

    -[NSLock unlock](self->_libraryUIDLock, "unlock");
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__ML3MusicLibrary_setLibraryUID___block_invoke;
    v9[3] = &unk_1E5B65EB8;
    v9[4] = self;
    v10 = v4;
    dispatch_async(v8, v9);

  }
  else
  {
    -[NSLock unlock](self->_libraryUIDLock, "unlock");
  }

}

- (BOOL)isLibraryEmpty
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__ML3MusicLibrary_isLibraryEmpty__block_invoke;
  v4[3] = &unk_1E5B5CA80;
  v4[4] = &v5;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (ML3Container)currentDevicePurchasesPlaylist
{
  void *v3;
  void *v4;

  +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("(container.distinguished_kind = 20 AND container.is_container_type_active_target)"), MEMORY[0x1E0C9AAB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity anyInLibrary:predicate:](ML3Container, "anyInLibrary:predicate:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ML3Container *)v4;
}

- (ML3Container)currentDevicePlaybackHistoryPlaylist
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  if (-[ML3MusicLibrary isHomeSharingLibrary](self, "isHomeSharingLibrary"))
    return (ML3Container *)0;
  v4 = MEMORY[0x1E0C9AAB0];
  +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("(container.distinguished_kind = 10000 AND container.is_container_type_active_target)"), MEMORY[0x1E0C9AAB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity anyInLibrary:predicate:options:](ML3Container, "anyInLibrary:predicate:options:", self, v5, 3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v12[0] = CFSTR("distinguished_kind");
    v12[1] = CFSTR("is_container_type_active_target");
    v13[0] = &unk_1E5BAACC8;
    v13[1] = v4;
    v13[2] = v4;
    v12[2] = CFSTR("is_hidden");
    v12[3] = CFSTR("date_created");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v8;
    v12[4] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_HISTORY_PLAYLIST_NAME"), &stru_1E5B66908, CFSTR("MLLocalizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = +[ML3Entity newWithDictionary:inLibrary:](ML3Container, "newWithDictionary:inLibrary:", v11, self);
  }

  return (ML3Container *)v6;
}

- (ML3Container)currentDevicePhotosMemoriesPlaylist
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  if (-[ML3MusicLibrary isHomeSharingLibrary](self, "isHomeSharingLibrary"))
    return (ML3Container *)0;
  v4 = MEMORY[0x1E0C9AAB0];
  +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("(container.distinguished_kind = 10010 AND container.is_container_type_active_target)"), MEMORY[0x1E0C9AAB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity anyInLibrary:predicate:options:](ML3Container, "anyInLibrary:predicate:options:", self, v5, 7);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v10[0] = CFSTR("distinguished_kind");
    v10[1] = CFSTR("is_container_type_active_target");
    v11[0] = &unk_1E5BAACE0;
    v11[1] = v4;
    v11[2] = v4;
    v10[2] = CFSTR("is_hidden");
    v10[3] = CFSTR("date_created");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    v11[4] = &unk_1E5BAACF8;
    v10[4] = CFSTR("keep_local");
    v10[5] = CFSTR("name");
    v11[5] = CFSTR("Photos Memories");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = +[ML3Entity newWithDictionary:inLibrary:](ML3Container, "newWithDictionary:inLibrary:", v9, self);
  }

  return (ML3Container *)v6;
}

- (ML3DatabaseMetadata)databaseInfo
{
  return (ML3DatabaseMetadata *)+[ML3Entity anyInLibrary:predicate:](ML3DatabaseMetadata, "anyInLibrary:predicate:", self, 0);
}

- (NSArray)preferredAudioTracks
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  if (TCCAccessPreflight())
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "Could not resolve preferredAudioTracks, missing TCC", v7, 2u);
    }
    v4 = 0;
  }
  else
  {
    -[ML3MusicLibrary databaseInfo](self, "databaseInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", CFSTR("audio_language"));
    v3 = objc_claimAutoreleasedReturnValue();

    -[ML3MusicLibrary _logDatabaseAccess](self, "_logDatabaseAccess");
    if (!v3)
      return (NSArray *)0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v4;
}

- (NSArray)preferredSubtitleTracks
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  if (TCCAccessPreflight())
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "Could not resolve preferredSubtitleTracks, missing TCC", v7, 2u);
    }
    v4 = 0;
  }
  else
  {
    -[ML3MusicLibrary databaseInfo](self, "databaseInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", CFSTR("subtitle_language"));
    v3 = objc_claimAutoreleasedReturnValue();

    -[ML3MusicLibrary _logDatabaseAccess](self, "_logDatabaseAccess");
    if (!v3)
      return (NSArray *)0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v4;
}

- (void)connectionWillCloseDatabase:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ML3MusicLibrary _canConfigureMediaLibraryDatabaseConnection:](self, "_canConfigureMediaLibraryDatabaseConnection:"))
  {
    -[ML3MusicLibrary _teardownMediaLibraryDatabaseConnection:](self, "_teardownMediaLibraryDatabaseConnection:", v4);
  }

}

- (void)connectionDidClose:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__ML3MusicLibrary_connectionDidClose___block_invoke;
  v7[3] = &unk_1E5B65EB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

- (void)reconnectToDatabase
{
  void *v3;
  id v4;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ML3MusicLibraryWillInvalidateDatabaseConnectionNotification"), self);

  -[ML3MusicLibrary connectionPool](self, "connectionPool");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_closeAllConnectionsAndWaitForBusyConnections:", 0);

}

- (void)performDatabaseTransactionWithBlock:(id)a3
{
  void *v4;
  uint64_t (**v5)(id, void *);

  v5 = (uint64_t (**)(id, void *))a3;
  -[ML3MusicLibrary checkoutWriterConnection](self, "checkoutWriterConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushTransaction");
  objc_msgSend(v4, "popTransactionAndCommit:", v5[2](v5, v4));
  -[ML3MusicLibrary checkInDatabaseConnection:](self, "checkInDatabaseConnection:", v4);

}

- (void)performReadOnlyDatabaseTransactionWithBlock:(id)a3
{
  void *v4;
  uint64_t (**v5)(id, void *);

  v5 = (uint64_t (**)(id, void *))a3;
  -[ML3MusicLibrary checkoutReaderConnection](self, "checkoutReaderConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushTransactionUsingBehaviorType:", 3);
  objc_msgSend(v4, "popTransactionAndCommit:", v5[2](v5, v4));
  -[ML3MusicLibrary checkInDatabaseConnection:](self, "checkInDatabaseConnection:", v4);

}

- (void)performAsyncDatabaseWriteTransactionWithBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "widthLimitedSetValuesQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__ML3MusicLibrary_performAsyncDatabaseWriteTransactionWithBlock_completionBlock___block_invoke;
  v11[3] = &unk_1E5B5CB40;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

}

- (BOOL)isCurrentThreadInTransaction
{
  void *v2;
  char v3;

  -[ML3MusicLibrary connectionPool](self, "connectionPool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentThreadConnectionInTransaction");

  return v3;
}

- (BOOL)automaticDatabaseValidationDisabled
{
  return __disableAutomaticDatabaseValidation;
}

- (BOOL)createIndexes
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__ML3MusicLibrary_createIndexes__block_invoke;
  v4[3] = &unk_1E5B64FE0;
  v4[4] = self;
  v4[5] = &v5;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)emptyAllTables
{
  BOOL v3;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = -[ML3MusicLibrary _clearAllRowsFromTables:](self, "_clearAllRowsFromTables:", &unk_1E5BA8B50);
  *((_BYTE *)v8 + 24) = v3;
  if (v3
    && (v6[0] = MEMORY[0x1E0C809B0],
        v6[1] = 3221225472,
        v6[2] = __33__ML3MusicLibrary_emptyAllTables__block_invoke,
        v6[3] = &unk_1E5B5CA80,
        v6[4] = &v7,
        -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v6), *((_BYTE *)v8 + 24)))
  {
    -[ML3MusicLibrary cleanupArtworkWithOptions:](self, "cleanupArtworkWithOptions:", 8);
    v4 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)clearAllGeniusData
{
  BOOL v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = -[ML3MusicLibrary _clearAllRowsFromTables:](self, "_clearAllRowsFromTables:", &unk_1E5BA8B68);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("(container.is_container_type_active_target AND container.smart_is_genius)"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ML3MusicLibrary_clearAllGeniusData__block_invoke;
  v7[3] = &unk_1E5B5CB68;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "enumeratePersistentIDsUsingBlock:", v7);
  if (*((_BYTE *)v9 + 24))
    -[ML3MusicLibrary notifyContentsDidChange](self, "notifyContentsDidChange");

  _Block_object_dispose(&v8, 8);
  return v3;
}

- (BOOL)clearAllCloudKVSData
{
  return -[ML3MusicLibrary _clearAllRowsFromTables:](self, "_clearAllRowsFromTables:", &unk_1E5BA8B80);
}

- (id)accountCacheDatabase
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ML3MusicLibrary_accountCacheDatabase__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  return self->_accountCacheDatabase;
}

- (id)groupingKeysForStrings:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2077;
  v15 = __Block_byref_object_dispose__2078;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__ML3MusicLibrary_groupingKeysForStrings___block_invoke;
  v8[3] = &unk_1E5B5CB90;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[ML3MusicLibrary accessSortKeyBuilder:](self, "accessSortKeyBuilder:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)notifyContentsDidChange
{
  -[ML3MusicLibrary _postClientNotificationWithDistributedName:localName:](self, "_postClientNotificationWithDistributedName:localName:", CFSTR("com.apple.mobileipod.librarychanged"), CFSTR("ML3MusicLibraryContentsDidChangeNotification"));
}

- (void)notifyAssistantContentsDidChange
{
  void *v3;
  id v4;

  if (-[ML3MusicLibrary isUsingSharedLibraryPath](self, "isUsingSharedLibraryPath"))
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
    -[ML3MusicLibrary notificationManager](self, "notificationManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "assistantSyncDataChangedNotificationName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueDistributedNotificationNamed:", v3);

  }
}

- (void)notifyEntitiesAddedOrRemoved
{
  -[ML3MusicLibrary _postClientNotificationWithDistributedName:localName:](self, "_postClientNotificationWithDistributedName:localName:", CFSTR("com.apple.mobileipod.entitiesaddedorremoved"), CFSTR("ML3MusicLibraryEntitiesAddedOrRemovedNotification"));
}

- (void)notifyNonContentsPropertyDidChange
{
  -[ML3MusicLibrary _postClientNotificationWithDistributedName:localName:](self, "_postClientNotificationWithDistributedName:localName:", CFSTR("com.apple.mobileipod.noncontentspropertieschanged"), CFSTR("ML3MusicLibraryNonContentsPropertiesDidChangeNotification"));
}

- (void)notifyInvisiblePropertyDidChange
{
  -[ML3MusicLibrary _postClientNotificationWithDistributedName:localName:](self, "_postClientNotificationWithDistributedName:localName:", CFSTR("com.apple.mobileipod.invisiblepropertieschanged"), CFSTR("ML3MusicLibraryInvisiblePropertiesDidChangeNotification"));
}

- (void)notifyDisplayValuesPropertyDidChange
{
  -[ML3MusicLibrary _postClientNotificationWithDistributedName:localName:](self, "_postClientNotificationWithDistributedName:localName:", CFSTR("com.apple.mobileipod.displayvalueschanged"), CFSTR("ML3MusicLibraryDisplayValuesDidChangeNotification"));
}

- (void)notifySectionsDidChange
{
  -[ML3MusicLibrary _postClientNotificationWithDistributedName:localName:](self, "_postClientNotificationWithDistributedName:localName:", CFSTR("com.apple.mobileipod.sectionschanged"), CFSTR("ML3MusicLibrarySectionsDidChangeNotification"));
}

- (void)notifyCloudLibraryAvailabilityDidChange
{
  -[ML3MusicLibrary _postClientNotificationWithDistributedName:localName:](self, "_postClientNotificationWithDistributedName:localName:", CFSTR("com.apple.mobileipod.cloudlibraryavailabilitychanged"), CFSTR("ML3MusicLibraryCloudLibraryAvailablityDidChangeNotification"));
}

- (void)notifyLibraryImportDidFinish
{
  -[ML3MusicLibrary _postClientNotificationWithDistributedName:localName:](self, "_postClientNotificationWithDistributedName:localName:", CFSTR("com.apple.mobileipod.libraryimportdidfinish"), CFSTR("ML3MusicLibraryImportDidFinishNotification"));
}

- (void)notifyKeepLocalStateDidChange
{
  -[ML3MusicLibrary _postClientNotificationWithDistributedName:localName:](self, "_postClientNotificationWithDistributedName:localName:", CFSTR("com.apple.mobileipod.keeplocalstatechanged"), CFSTR("ML3MusicLibraryKeepLocalStateChangedNotification"));
}

- (void)saveTrackMetadata
{
  -[ML3MusicLibrary saveTrackMetadataSinceRevision:withGrappaID:](self, "saveTrackMetadataSinceRevision:withGrappaID:", 0, 0);
}

- (void)saveTrackMetadataSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  ML3MusicLibrary *v7;
  id v8;
  void *v9;
  CFAbsoluteTime Current;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *context;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  __CFString *v47;
  id v48;
  int64_t v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  int v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  +[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary");
  v7 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    v38 = a4;
    context = (void *)MEMORY[0x1AF43CC0C]();
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v9, "numberWithUnsignedInt:", ML3UInt32MacTimeFromCFAbsoluteTime(Current));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v8;
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("version"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __63__ML3MusicLibrary_saveTrackMetadataSinceRevision_withGrappaID___block_invoke;
    v46[3] = &unk_1E5B5CC08;
    v47 = CFSTR("SELECT item_store.sync_id, item_video.audio_track_id, item_stats.bookmark_time_ms, entity_revision.deleted, item_stats.play_count_recent, item_stats.date_played, item_stats.has_been_played, item_stats.skip_count_recent, item_stats.date_skipped, item_stats.user_rating, item_stats.liked_state, item_store.item_pid, store_saga_id, album.liked_state, item.in_my_library FROM item JOIN item_stats USING(item_pid) LEFT OUTER JOIN entity_revision ON (item.item_pid = entity_pid) JOIN item_video USING (item_pid) JOIN item_store using (item_pid) LEFT OUTER JOIN album USING (album_pid) WHERE revision > ? AND class = 0 ORDER BY entity_revision.revision DESC;");
    v49 = a3;
    v13 = v12;
    v48 = v13;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v46);
    +[ML3MusicLibrary pathForResourceFileOrFolder:basePath:relativeToBase:createParentFolderIfNecessary:](ML3MusicLibrary, "pathForResourceFileOrFolder:basePath:relativeToBase:createParentFolderIfNecessary:", 1, 0, 0, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("persistentID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("persistentID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKey:", v23, v25);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v20);
    }

    if (_os_feature_enabled_impl())
    {
      -[ML3MusicLibrary getAlbumArtistChangesSinceRevision:withGrappaID:](self, "getAlbumArtistChangesSinceRevision:withGrappaID:", a3, v38);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3MusicLibrary getAlbumChangesSinceRevision:withGrappaID:](self, "getAlbumChangesSinceRevision:withGrappaID:", a3, v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3MusicLibrary _getPlaylistContentTasteChangesSinceRevision:withGrappaID:](self, "_getPlaylistContentTasteChangesSinceRevision:withGrappaID:", a3, v38);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        objc_msgSend(v26, "allValues");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKey:", v29, CFSTR("artists"));

      }
      if (objc_msgSend(v27, "count"))
      {
        objc_msgSend(v27, "allValues");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKey:", v30, CFSTR("albums"));

      }
      if (objc_msgSend(v28, "count"))
      {
        objc_msgSend(v28, "allValues");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKey:", v31, CFSTR("playlists"));

      }
      if (objc_msgSend(v26, "count") || objc_msgSend(v27, "count") || objc_msgSend(v28, "count"))
      {
        v32 = os_log_create("com.apple.amp.medialibrary", "Library_Oversize");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v40;
          _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_DEFAULT, "playCountsPlistDictionary=%{public}@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "writeToFile:atomically:", v37, 1);

    objc_msgSend(v13, "allValues");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKey:", v34, CFSTR("tracks"));

    +[ML3MusicLibrary pathForResourceFileOrFolder:basePath:relativeToBase:createParentFolderIfNecessary:](ML3MusicLibrary, "pathForResourceFileOrFolder:basePath:relativeToBase:createParentFolderIfNecessary:", 2, 0, 0, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((WriteDictionaryToPathWithGrappaID(v40, v35, v38) & 1) == 0)
    {
      v36 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v51 = v35;
        v52 = 1024;
        v53 = 0;
        _os_log_impl(&dword_1AC149000, v36, OS_LOG_TYPE_DEFAULT, "Saved play counts to %{public}@: success=%d", buf, 0x12u);
      }

    }
    objc_autoreleasePoolPop(context);
  }
}

- (void)savePlaylists
{
  -[ML3MusicLibrary savePlaylistsSinceRevision:withGrappaID:](self, "savePlaylistsSinceRevision:withGrappaID:", 0, 0);
}

- (void)savePlaylistsSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  _QWORD v11[5];
  unsigned int v12;
  _QWORD v13[9];
  unsigned int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[5];
  _QWORD v24[4];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v8 = MEMORY[0x1E0C809B0];
  v24[3] = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke;
  v23[3] = &unk_1E5B5CA80;
  v23[4] = v24;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v23);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_2;
  v13[3] = &unk_1E5B5CC30;
  v13[7] = &v15;
  v13[8] = a2;
  v13[4] = self;
  v13[5] = v24;
  v13[6] = &v19;
  v14 = a4;
  -[ML3MusicLibrary enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:](self, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:", a3, +[ML3Container revisionTrackingCode](ML3Container, "revisionTrackingCode"), 3, 0, 1, v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_364;
  v11[3] = &unk_1E5B5CC58;
  v11[4] = self;
  v12 = a4;
  v9 = MEMORY[0x1AF43CDE0](v11);
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (*((_BYTE *)v20 + 24) || *((_BYTE *)v16 + 24))
  {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 5);
    v10[2](v10, 3);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v24, 8);
}

- (id)getAlbumArtistChanges
{
  return -[ML3MusicLibrary getAlbumArtistChangesSinceRevision:withGrappaID:](self, "getAlbumArtistChangesSinceRevision:withGrappaID:", 0, 0);
}

- (id)getAlbumArtistChangesSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  int64_t v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2077;
  v14 = __Block_byref_object_dispose__2078;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, *(_QWORD *)&a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = +[ML3AlbumArtist revisionTrackingCode](ML3AlbumArtist, "revisionTrackingCode");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ML3MusicLibrary_getAlbumArtistChangesSinceRevision_withGrappaID___block_invoke;
  v9[3] = &unk_1E5B5CC80;
  v9[4] = self;
  v9[5] = &v10;
  -[ML3MusicLibrary enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:](self, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:", a3, v6, 3, 0, 1, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)getAlbumChanges
{
  return -[ML3MusicLibrary getAlbumChangesSinceRevision:withGrappaID:](self, "getAlbumChangesSinceRevision:withGrappaID:", 0, 0);
}

- (id)getAlbumChangesSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  int64_t v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2077;
  v14 = __Block_byref_object_dispose__2078;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, *(_QWORD *)&a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = +[ML3Album revisionTrackingCode](ML3Album, "revisionTrackingCode");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ML3MusicLibrary_getAlbumChangesSinceRevision_withGrappaID___block_invoke;
  v9[3] = &unk_1E5B5CC80;
  v9[4] = self;
  v9[5] = &v10;
  -[ML3MusicLibrary enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:](self, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:", a3, v6, 3, 0, 1, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)_getPlaylistContentTasteChangesSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  void *v6;
  uint64_t v7;
  int64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD v17[4];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v17[3] = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__ML3MusicLibrary__getPlaylistContentTasteChangesSinceRevision_withGrappaID___block_invoke;
  v16[3] = &unk_1E5B5CA80;
  v16[4] = v17;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v16);
  v8 = +[ML3Container revisionTrackingCode](ML3Container, "revisionTrackingCode");
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __77__ML3MusicLibrary__getPlaylistContentTasteChangesSinceRevision_withGrappaID___block_invoke_2;
  v13[3] = &unk_1E5B5CCA8;
  v15 = v17;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  -[ML3MusicLibrary enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:](self, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:", a3, v8, 3, 0, 1, v13);
  v10 = v14;
  v11 = v9;

  _Block_object_dispose(v17, 8);
  return v11;
}

- (BOOL)requiresSchemaOnlyUpdatesOnConnection:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  NSObject *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[ML3MusicLibrary userVersionMatchesSystemUsingConnection:](ML3MusicLibrary, "userVersionMatchesSystemUsingConnection:", v3))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    +[ML3MusicLibrary allTables](ML3MusicLibrary, "allTables");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      obj = v4;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(name) FROM sqlite_master WHERE type='table' AND name = '%@';"),
            v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "executeQuery:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "int64ValueForFirstRowAndColumn");

          if (!v12)
          {
            v14 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v22 = v9;
              _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "Requires schema upgrade because database is missing table %{public}@", buf, 0xCu);
            }

            v13 = 1;
            v4 = obj;
            goto LABEL_17;
          }
        }
        v4 = obj;
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v6)
          continue;
        break;
      }
    }
    v13 = 0;
  }
  else
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "Requires schema upgrade because of a version mismatch", buf, 2u);
    }
    v13 = 1;
  }
LABEL_17:

  return v13;
}

- (BOOL)requiresNonSchemaUpdatesOnConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  BOOL v10;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  uint8_t buf[2];
  __int16 v21;
  __int16 v22;

  v3 = a3;
  if ((objc_msgSend(v3, "databasePathExists") & 1) != 0)
  {
    if ((objc_msgSend(v3, "tableExists:", CFSTR("_MLDatabaseProperties")) & 1) != 0)
    {
      if (+[ML3MusicLibrary orderingLanguageMatchesSystemUsingConnection:](ML3MusicLibrary, "orderingLanguageMatchesSystemUsingConnection:", v3))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        GetP7BPath();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

        if (v6)
        {
          v7 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v19 = 0;
            v8 = "Requires pre-processing because of integrity";
            v9 = (uint8_t *)&v19;
LABEL_13:
            _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
          }
        }
        else
        {
          if (objc_msgSend(v3, "tableExists:", CFSTR("sort_map")))
          {
            objc_msgSend(v3, "executeQuery:", CFSTR("SELECT rowid FROM sort_map WHERE name='' AND name_order != 0"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "hasAtLeastOneRow");

            if (v13)
            {
              _ML3LogCategoryDefault();
              v7 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                goto LABEL_14;
              v18 = 0;
              v8 = "Requires pre-processing because of invalid sort_map entries";
              v9 = (uint8_t *)&v18;
              goto LABEL_13;
            }
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM _MLDatabaseProperties WHERE key = '%@'"), CFSTR("_UUID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "executeQuery:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "hasAtLeastOneRow");

          if ((v16 & 1) != 0)
          {
            v10 = 0;
            goto LABEL_15;
          }
          v7 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v17 = 0;
            v8 = "Requires pre-processing because of missing database UID";
            v9 = (uint8_t *)&v17;
            goto LABEL_13;
          }
        }
      }
      else
      {
        v7 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v8 = "Requires pre-processing because of a language mismatch";
          v9 = buf;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v7 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 0;
        v8 = "Requires pre-processing because database properties table does not exist";
        v9 = (uint8_t *)&v21;
        goto LABEL_13;
      }
    }
  }
  else
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 0;
      v8 = "Requires pre-processing because database does not yet exist";
      v9 = (uint8_t *)&v22;
      goto LABEL_13;
    }
  }
LABEL_14:

  v10 = 1;
LABEL_15:

  return v10;
}

- (BOOL)updateSortMap
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__ML3MusicLibrary_updateSortMap__block_invoke;
  v4[3] = &unk_1E5B64FE0;
  v4[4] = self;
  v4[5] = &v5;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)enumeratePersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 maximumRevisionType:(int)a5 usingBlock:(id)a6
{
  uint64_t v6;
  id v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[2];

  v6 = *(_QWORD *)&a5;
  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = CFSTR("SELECT entity_pid, revision, deleted, class FROM entity_revision WHERE revision > ? ");
  }
  else
  {
    objc_msgSend(CFSTR("SELECT entity_pid, revision, deleted, class FROM entity_revision WHERE revision > ? "), "stringByAppendingString:", CFSTR(" AND class = ? "));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v6 <= 2)
  {
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR(" AND revision_type <= ? "));
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)v12;
  }
  -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR(";"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
  if (v6 <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke;
  v22[3] = &unk_1E5B63BC8;
  v23 = v13;
  v24 = v16;
  v25 = v10;
  v19 = v10;
  v20 = v16;
  v21 = v13;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v22);

}

- (void)enumerateAlbumArtistPersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 usingBlock:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  __CFString *v14;
  id v15;
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[ML3AlbumArtist revisionTrackingCode](ML3AlbumArtist, "revisionTrackingCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__ML3MusicLibrary_enumerateAlbumArtistPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke;
  v13[3] = &unk_1E5B63BC8;
  v14 = CFSTR("SELECT entity_pid, revision, revision_type, deleted, representative_item_pid, liked_state FROM entity_revision LEFT JOIN album_artist ON album_artist.album_artist_pid=entity_revision.entity_pid WHERE revision > ? AND class = ?;");
  v15 = v10;
  v16 = v7;
  v11 = v7;
  v12 = v10;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v13);

}

- (void)enumerateAlbumPersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 usingBlock:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  __CFString *v14;
  id v15;
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[ML3Album revisionTrackingCode](ML3Album, "revisionTrackingCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__ML3MusicLibrary_enumerateAlbumPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke;
  v13[3] = &unk_1E5B63BC8;
  v14 = CFSTR("SELECT entity_pid, revision, revision_type, deleted, representative_item_pid, liked_state FROM entity_revision LEFT JOIN album ON album.album_pid=entity_revision.entity_pid WHERE revision > ? AND class = ?;");
  v15 = v10;
  v16 = v7;
  v11 = v7;
  v12 = v10;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v13);

}

- (void)getChangedPersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(int64_t)a4 maximumRevisionType:(int)a5 usingBlock:(id)a6
{
  void (**v10)(id, uint64_t, uint64_t);
  _QWORD v11[9];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];

  v10 = (void (**)(id, uint64_t, uint64_t))a6;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 32;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v20 = malloc_type_malloc(0x100uLL, 0x100004000313F17uLL);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __108__ML3MusicLibrary_getChangedPersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke;
  v11[3] = &unk_1E5B5CD88;
  v12 = a5;
  v11[7] = a3;
  v11[8] = a4;
  v11[4] = v21;
  v11[5] = &v13;
  v11[6] = &v17;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v11);
  v10[2](v10, v18[3], v14[3]);
  free((void *)v18[3]);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);

}

- (BOOL)persistentID:(int64_t)a3 changedAfterRevision:(int64_t)a4 revisionTrackingCode:(int64_t)a5
{
  char v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__ML3MusicLibrary_persistentID_changedAfterRevision_revisionTrackingCode___block_invoke;
  v7[3] = &unk_1E5B5CDB0;
  v7[6] = a5;
  v7[7] = a4;
  v7[4] = &v8;
  v7[5] = a3;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unint64_t)countOfChangedPersistentIdsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 maximumRevisionType:(int)a5
{
  uint64_t v5;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v5 = *(_QWORD *)&a5;
  v29[1] = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = CFSTR("SELECT COUNT() FROM entity_revision WHERE revision > ? ");
  }
  else
  {
    objc_msgSend(CFSTR("SELECT COUNT() FROM entity_revision WHERE revision > ? "), "stringByAppendingString:", CFSTR(" AND class = ? "));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v5 <= 2)
  {
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(" AND revision_type <= ? "));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v10;
  }
  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(";"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
  if (v5 <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __101__ML3MusicLibrary_countOfChangedPersistentIdsAfterRevision_revisionTrackingCode_maximumRevisionType___block_invoke;
  v21[3] = &unk_1E5B62DC0;
  v24 = &v25;
  v17 = v11;
  v22 = v17;
  v18 = v14;
  v23 = v18;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v21);
  v19 = v26[3];

  _Block_object_dispose(&v25, 8);
  return v19;
}

- (void)removeSource:(int)a3 withCompletionHandler:(id)a4
{
  -[ML3MusicLibrary removeTracksWithPersistentIDs:fromSource:usingConnection:withCompletionHandler:](self, "removeTracksWithPersistentIDs:fromSource:usingConnection:withCompletionHandler:", 0, *(_QWORD *)&a3, 0, a4);
}

- (void)removeSource:(int)a3 usingConnection:(id)a4 withCompletionHandler:(id)a5
{
  -[ML3MusicLibrary removeTracksWithPersistentIDs:fromSource:usingConnection:withCompletionHandler:](self, "removeTracksWithPersistentIDs:fromSource:usingConnection:withCompletionHandler:", 0, *(_QWORD *)&a3, a4, a5);
}

- (void)removeTracksWithPersistentIDs:(id)a3 fromSource:(int)a4 withCompletionHandler:(id)a5
{
  -[ML3MusicLibrary removeTracksWithPersistentIDs:fromSource:usingConnection:withCompletionHandler:](self, "removeTracksWithPersistentIDs:fromSource:usingConnection:withCompletionHandler:", a3, *(_QWORD *)&a4, 0, a5);
}

- (void)removeTracksWithPersistentIDs:(id)a3 fromSource:(int)a4 usingConnection:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  NSObject *serialQueue;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v8 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  serialQueue = self->_serialQueue;
  v13 = a6;
  dispatch_assert_queue_not_V2(serialQueue);
  +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithObject:forKey:", v16, CFSTR("MLDatabaseOperationAttributeTrackSourceKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v17, "setObject:forKey:", v10, CFSTR("MLDatabaseOperationAttributePersistentIDsArrayKey"));
  v18 = (void *)MEMORY[0x1E0C99E08];
  -[ML3MusicLibrary databasePath](self, "databasePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryWithObject:forKey:", v19, CFSTR("MLDatabaseOperationOptionDatabasePathKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "isInTransaction"))
  {
    objc_msgSend(v11, "currentTransactionID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("MLDatabaseOperationOptionTransactionIdentifierKey"));

  }
  v22 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543874;
    v24 = v14;
    v25 = 2114;
    v26 = v17;
    v27 = 2114;
    v28 = v20;
    _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "Sending remove tracks request to %{public}@. Attributes: %{public}@, options: %{public}@", (uint8_t *)&v23, 0x20u);
  }

  objc_msgSend(v14, "performDatabaseOperation:withAttributes:options:completionHandler:", 3, v17, v20, v13);
}

- (void)removeCloudSourcesWithAttributes:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  serialQueue = self->_serialQueue;
  v8 = a4;
  dispatch_assert_queue_not_V2(serialQueue);
  +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E08];
  -[ML3MusicLibrary databasePath](self, "databasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, CFSTR("MLDatabaseOperationOptionDatabasePathKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "Sending remove tracks request to %{public}@. Attributes: %{public}@, options: %{public}@", (uint8_t *)&v14, 0x20u);
  }

  objc_msgSend(v9, "performDatabaseOperation:withAttributes:options:completionHandler:", 9, v6, v12, v8);
}

- (void)removePlaylistsWithPersistentIDs:(id)a3 fromSource:(int)a4 usingConnection:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  NSObject *serialQueue;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v8 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  serialQueue = self->_serialQueue;
  v13 = a6;
  dispatch_assert_queue_not_V2(serialQueue);
  +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithObject:forKey:", v16, CFSTR("MLDatabaseOperationAttributeTrackSourceKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v17, "setObject:forKey:", v10, CFSTR("MLDatabaseOperationAttributePersistentIDsArrayKey"));
  v18 = (void *)MEMORY[0x1E0C99E08];
  -[ML3MusicLibrary databasePath](self, "databasePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryWithObject:forKey:", v19, CFSTR("MLDatabaseOperationOptionDatabasePathKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "isInTransaction"))
  {
    objc_msgSend(v11, "currentTransactionID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("MLDatabaseOperationOptionTransactionIdentifierKey"));

  }
  v22 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543874;
    v24 = v14;
    v25 = 2114;
    v26 = v17;
    v27 = 2114;
    v28 = v20;
    _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "Sending remove playlists request to %{public}@. Attributes: %{public}@, options: %{public}@", (uint8_t *)&v23, 0x20u);
  }

  objc_msgSend(v14, "performDatabaseOperation:withAttributes:options:completionHandler:", 6, v17, v20, v13);
}

- (int64_t)autoFilledTracksTotalSize
{
  return -[ML3MusicLibrary purgeableStorageSizeWithUrgency:](self, "purgeableStorageSizeWithUrgency:", 2);
}

- (int64_t)deleteAutoFilledTracksOfAtLeastTotalSize:(int64_t)a3
{
  return -[ML3MusicLibrary clearPurgeableStorageAmount:withUrgency:](self, "clearPurgeableStorageAmount:withUrgency:", a3, 2);
}

- (void)autogenerateSupportedSizesForAllOriginalArtworkWithConnection:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  ML3MusicLibrary *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__2077;
  v20[4] = __Block_byref_object_dispose__2078;
  v21 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke;
  v16[3] = &unk_1E5B5CE00;
  v10 = v8;
  v17 = v10;
  v18 = self;
  v19 = v20;
  -[ML3MusicLibrary enumerateArtworkRelativePathsWithConnection:matchingRelativePathContainer:block:](self, "enumerateArtworkRelativePathsWithConnection:matchingRelativePathContainer:block:", v6, 0, v16);
  dispatch_get_global_queue(21, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke_3;
  block[3] = &unk_1E5B5CE28;
  v14 = v7;
  v15 = v20;
  v12 = v7;
  dispatch_group_notify(v10, v11, block);

  _Block_object_dispose(v20, 8);
}

- (void)enumerateArtworkRelativePathsWithConnection:(id)a3 matchingRelativePathContainer:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" WHERE relative_path LIKE \"%@%%\"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("SELECT DISTINCT(relative_path), best_artwork_token.artwork_type, media_type FROM item JOIN best_artwork_token ON item_pid = entity_pid AND entity_type = 0 JOIN artwork ON available_artwork_token = artwork_token"), "stringByAppendingString:", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("SELECT DISTINCT(relative_path), best_artwork_token.artwork_type, media_type FROM item JOIN best_artwork_token ON item_pid = entity_pid AND entity_type = 0 JOIN artwork ON available_artwork_token = artwork_token");
  }
  objc_msgSend(v19, "executeQuery:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__ML3MusicLibrary_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block___block_invoke;
  v22[3] = &unk_1E5B63BA0;
  v22[4] = self;
  v14 = v9;
  v23 = v14;
  objc_msgSend(v12, "enumerateRowsWithBlock:", v22);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" AND relative_path LIKE \"%@%%\"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("SELECT DISTINCT(relative_path), best_artwork_token.artwork_type FROM best_artwork_token JOIN artwork ON available_artwork_token = artwork_token WHERE entity_type IN (2,7)"), "stringByAppendingString:", v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = CFSTR("SELECT DISTINCT(relative_path), best_artwork_token.artwork_type FROM best_artwork_token JOIN artwork ON available_artwork_token = artwork_token WHERE entity_type IN (2,7)");
  }
  objc_msgSend(v19, "executeQuery:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __99__ML3MusicLibrary_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block___block_invoke_461;
  v20[3] = &unk_1E5B63BA0;
  v20[4] = self;
  v21 = v14;
  v18 = v14;
  objc_msgSend(v17, "enumerateRowsWithBlock:", v20);

}

- (void)generateArtworkForRelativePath:(id)a3 sizes:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  id v34;
  double v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  id v46;
  _QWORD v47[4];
  id v48;
  ML3MusicLibrary *v49;
  id v50;
  id v51;
  double v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE buf[22];
  _QWORD v59[2];
  _BYTE v60[128];
  _QWORD v61[5];

  v61[2] = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v7 = a4;
  v8 = a5;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v42 = v8;
    v9 = +[ML3MusicLibrary devicePreferredImageFormat](ML3MusicLibrary, "devicePreferredImageFormat");
    v10 = (void *)MEMORY[0x1E0C99E98];
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v12;
    v61[1] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathWithComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:isDirectory:", v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v41 = (void *)v15;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D028]), "initWithSourceURL:", v15);
    v17 = MEMORY[0x1E0C9D820];
    v18 = os_log_create("com.apple.amp.medialibrary", "Artwork");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "Generating artwork for sizes: %lu", buf, 0xCu);
    }
    v20 = *(double *)v17;
    v19 = *(_QWORD *)(v17 + 8);

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v43 = v7;
    obj = v7;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v55 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v26, "getValue:", buf);
          v27 = (void *)MEMORY[0x1E0C99E98];
          v28 = (void *)MEMORY[0x1E0CB3940];
          -[ML3MusicLibrary artworkCacheDirectoryForSize:](self, "artworkCacheDirectoryForSize:", *(double *)buf, *(double *)&buf[8]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v59[0] = v29;
          v59[1] = v46;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "pathWithComponents:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "fileURLWithPath:isDirectory:", v31, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = *(double *)buf;
          if (v20 >= *(double *)buf)
          {
            v35 = *(double *)buf;
          }
          else
          {
            v19 = *(_QWORD *)&buf[8];
            v34 = v32;

            v35 = *(double *)buf;
            v23 = v34;
            v20 = v33;
          }
          if (v9)
            objc_msgSend(v16, "addDestinationWithFormat:size:url:", 2, v32, v35, *(double *)&buf[8]);
          else
            objc_msgSend(v16, "addJPEGDestinationWithSize:compressionQuality:url:", v32, v35, *(double *)&buf[8], 0.9);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v22);
    }
    else
    {
      v23 = 0;
    }

    v37 = os_log_create("com.apple.amp.medialibrary", "Artwork");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = (unint64_t)v20;
      _os_log_impl(&dword_1AC149000, v37, OS_LOG_TYPE_DEFAULT, "Preferred for color analysis: %{public}@ of size %lu", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D4D008], "sharedService");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __74__ML3MusicLibrary_generateArtworkForRelativePath_sizes_completionHandler___block_invoke;
    v47[3] = &unk_1E5B5CE78;
    v48 = v16;
    v49 = self;
    v8 = v42;
    v52 = v20;
    v53 = v19;
    v50 = v23;
    v51 = v42;
    v39 = v23;
    v40 = v16;
    objc_msgSend(v38, "sendRequest:completionHandler:", v40, v47);

    v7 = v43;
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ml_errorWithCode:description:", 1, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, double, double))v8 + 2))(v8, v36, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  }
}

- (void)performColorAnalysisForArtworkWithConnection:(id)a3 shouldRegenerateColorAnalysis:(BOOL)a4
{
  const __CFString *v6;
  id v7;
  _QWORD v8[5];

  if (a4)
    v6 = CFSTR("SELECT DISTINCT(relative_path), artwork.artwork_type, item.media_type, artwork.artwork_token FROM artwork JOIN artwork_token ON artwork.artwork_token = artwork_token.artwork_token JOIN item ON item_pid = entity_pid");
  else
    v6 = CFSTR("SELECT DISTINCT(relative_path), artwork.artwork_type, item.media_type, artwork.artwork_token FROM artwork JOIN artwork_token ON artwork.artwork_token = artwork_token.artwork_token JOIN item ON item_pid = entity_pid WHERE artwork.interest_data IS NULL");
  objc_msgSend(a3, "executeQuery:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__ML3MusicLibrary_performColorAnalysisForArtworkWithConnection_shouldRegenerateColorAnalysis___block_invoke;
  v8[3] = &unk_1E5B65EE0;
  v8[4] = self;
  objc_msgSend(v7, "enumerateRowsWithBlock:", v8);

}

- (BOOL)importExistingOriginalArtworkWithArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 mediaType:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  _QWORD v20[5];
  id v21;
  int64_t v22;
  uint8_t buf[4];
  void *v24;
  _QWORD v25[3];

  v6 = *(_QWORD *)&a6;
  v25[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3MusicLibrary artworkRelativePathFromToken:](ML3MusicLibrary, "artworkRelativePathFromToken:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    v25[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pathWithComponents:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "fileExistsAtPath:", v16) & 1) != 0)
    {
      if (-[ML3MusicLibrary _insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:](self, "_insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:", v10, a4, a5, v12))
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __98__ML3MusicLibrary_importExistingOriginalArtworkWithArtworkToken_artworkType_sourceType_mediaType___block_invoke;
        v20[3] = &unk_1E5B5CEC0;
        v20[4] = self;
        v22 = a4;
        v21 = v10;
        -[ML3MusicLibrary _autogenerateArtworkForRelativePath:artworkType:mediaType:completionHandler:](self, "_autogenerateArtworkForRelativePath:artworkType:mediaType:completionHandler:", v12, a4, v6, v20);

        v17 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v16;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_ERROR, "Original artwork not found at '%{public}@'", buf, 0xCu);
      }

    }
    v17 = 0;
    goto LABEL_10;
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (BOOL)importOriginalArtworkFromFileURL:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  BOOL v25;
  dispatch_semaphore_t v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  BOOL v31;
  unsigned int v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  int64_t v36;
  BOOL v37;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  id v46;
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  if (objc_msgSend(v15, "length"))
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = a8;
    v32 = a7;
    +[ML3MusicLibrary artworkRelativePathFromToken:](ML3MusicLibrary, "artworkRelativePathFromToken:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99E98];
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v19;
    v47[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pathWithComponents:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPath:isDirectory:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v33, "fileExistsAtPath:", v23);

    if ((_DWORD)v19)
    {
      v24 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v15;
        _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_DEFAULT, "Artwork already exists on disk for artwork token %{public}@, ensuring artwork table is consistent", buf, 0xCu);
      }

      v25 = -[ML3MusicLibrary _insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:](self, "_insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:", v15, a5, a6, v16);
      *((_BYTE *)v42 + 24) = v25;
    }
    else
    {
      v26 = dispatch_semaphore_create(0);
      v27 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __129__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke;
      v38[3] = &unk_1E5B64708;
      v40 = &v41;
      v28 = v26;
      v39 = v28;
      -[ML3MusicLibrary _convertOriginalArtworkToDevicePreferredFormatFromSourceURL:toDestinationURL:completionHandler:](self, "_convertOriginalArtworkToDevicePreferredFormatFromSourceURL:toDestinationURL:completionHandler:", v14, v22, v38);
      dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      if (*((_BYTE *)v42 + 24)
        && (v29 = -[ML3MusicLibrary _insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:](self, "_insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:", v15, a5, a6, v16), *((_BYTE *)v42 + 24) = v29, v29))
      {
        v34[0] = v27;
        v34[1] = 3221225472;
        v34[2] = __129__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke_474;
        v34[3] = &unk_1E5B5CEE8;
        v37 = v31;
        v34[4] = self;
        v36 = a5;
        v35 = v15;
        -[ML3MusicLibrary _autogenerateArtworkForRelativePath:artworkType:mediaType:completionHandler:](self, "_autogenerateArtworkForRelativePath:artworkType:mediaType:completionHandler:", v16, a5, v32, v34);

        v25 = *((_BYTE *)v42 + 24) != 0;
      }
      else
      {
        v25 = 0;
      }

    }
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)importOriginalArtworkFromFileURL:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  void (**v17)(id, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  BOOL v28;
  void *v29;
  NSObject *v30;
  void *v31;
  unsigned int v32;
  BOOL v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  void (**v38)(id, _QWORD);
  int64_t v39;
  int64_t v40;
  unsigned int v41;
  BOOL v42;
  uint8_t buf[4];
  id v44;
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = (void (**)(id, _QWORD))a9;
  if (objc_msgSend(v16, "length"))
  {
    v32 = a7;
    v33 = a8;
    v34 = v15;
    +[ML3MusicLibrary artworkRelativePathFromToken:](ML3MusicLibrary, "artworkRelativePathFromToken:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E98];
    v20 = (void *)MEMORY[0x1E0CB3940];
    -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v21;
    v45[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pathWithComponents:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURLWithPath:isDirectory:", v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = objc_msgSend(v25, "fileExistsAtPath:", v26);

    if ((_DWORD)v21)
    {
      v27 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v16;
        _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_DEFAULT, "Artwork already exists on disk for artwork token %{public}@, ensuring artwork table is consistent", buf, 0xCu);
      }

      v28 = -[ML3MusicLibrary _insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:](self, "_insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:", v16, a5, a6, v18);
      v15 = v34;
      if (v17)
      {
        if (v28)
        {
          v17[2](v17, 0);
        }
        else
        {
          v30 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC149000, v30, OS_LOG_TYPE_ERROR, "importOriginalArtworkFromFileURL failed to insert into artwork table", buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ML3DatabaseErrorDomain"), 0, CFSTR("Failed to insert row for artwork"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *))v17)[2](v17, v31);

        }
      }
    }
    else
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __140__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke;
      v35[3] = &unk_1E5B5CF38;
      v38 = v17;
      v35[4] = self;
      v36 = v16;
      v39 = a5;
      v40 = a6;
      v37 = v18;
      v41 = v32;
      v42 = v33;
      v15 = v34;
      -[ML3MusicLibrary _convertOriginalArtworkToDevicePreferredFormatFromSourceURL:toDestinationURL:completionHandler:](self, "_convertOriginalArtworkToDevicePreferredFormatFromSourceURL:toDestinationURL:completionHandler:", v34, v24, v35);

    }
  }
  else if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ML3DatabaseErrorDomain"), 700, CFSTR("Cannot import artwork without a valid artwork token"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v17)[2](v17, v29);

  }
}

- (BOOL)importOriginalArtworkFromFileURL:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7
{
  return -[ML3MusicLibrary importOriginalArtworkFromFileURL:withArtworkToken:artworkType:sourceType:mediaType:shouldPerformColorAnalysis:](self, "importOriginalArtworkFromFileURL:withArtworkToken:artworkType:sourceType:mediaType:shouldPerformColorAnalysis:", a3, a4, a5, a6, *(_QWORD *)&a7, 1);
}

- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  BOOL v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  dispatch_semaphore_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _BOOL4 v35;
  id v37;
  BOOL v38;
  unsigned int v39;
  id v40;
  void *v41;
  int64_t v42;
  int64_t v43;
  _QWORD v44[5];
  id v45;
  id v46;
  int64_t v47;
  BOOL v48;
  id v49;
  _QWORD v50[4];
  NSObject *v51;
  uint64_t *v52;
  id v53[2];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  _QWORD v62[5];

  v62[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  if (objc_msgSend(v15, "length"))
  {
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = a8;
    v39 = a7;
    v42 = a6;
    v43 = a5;
    +[ML3MusicLibrary artworkRelativePathFromToken:](ML3MusicLibrary, "artworkRelativePathFromToken:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99E98];
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v20;
    v62[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pathWithComponents:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURLWithPath:isDirectory:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v16, "fileExistsAtPath:", v24);

    if ((_DWORD)v20)
    {
      v25 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v59 = v15;
        _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEBUG, "Artwork already exists on disk for artwork token %{public}@, ensuring artwork table is consistent", buf, 0xCu);
      }

      v26 = -[ML3MusicLibrary _insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:](self, "_insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:", v15, v43, v42, v17);
      *((_BYTE *)v55 + 24) = v26;
    }
    else
    {
      NSTemporaryDirectory();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringByAppendingPathComponent:", CFSTR("imagedata.XXXXXX"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v53[1] = 0;
      MSVCreateTemporaryFileHandle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v53[0] = 0;
      objc_msgSend(v28, "writeData:error:", v14, v53);
      v29 = v53[0];
      objc_msgSend(v28, "closeFile");

      if (v29)
      {
        v30 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v59 = v29;
          _os_log_impl(&dword_1AC149000, v30, OS_LOG_TYPE_ERROR, "Failed to write original artwork to temporary path with error: %{public}@", buf, 0xCu);
        }
        v26 = 0;
      }
      else
      {
        v31 = dispatch_semaphore_create(0);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v40, 0);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = MEMORY[0x1E0C809B0];
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __131__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke;
        v50[3] = &unk_1E5B64708;
        v52 = &v54;
        v30 = v31;
        v51 = v30;
        -[ML3MusicLibrary _convertOriginalArtworkToDevicePreferredFormatFromSourceURL:toDestinationURL:completionHandler:](self, "_convertOriginalArtworkToDevicePreferredFormatFromSourceURL:toDestinationURL:completionHandler:", v32, v23, v50);

        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
        v49 = 0;
        LOBYTE(v32) = objc_msgSend(v16, "removeItemAtPath:error:", v40, &v49);
        v37 = v49;
        if ((v32 & 1) == 0)
        {
          v34 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v59 = v40;
            v60 = 2114;
            v61 = v37;
            _os_log_impl(&dword_1AC149000, v34, OS_LOG_TYPE_ERROR, "Failed to remove temporary artwork file: '%{public}@'. err = %{public}@", buf, 0x16u);
          }

        }
        if (*((_BYTE *)v55 + 24)
          && (v35 = -[ML3MusicLibrary _insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:](self, "_insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:", v15, v43, v42, v17), *((_BYTE *)v55 + 24) = v35, v35))
        {
          v44[0] = v33;
          v44[1] = 3221225472;
          v44[2] = __131__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke_482;
          v44[3] = &unk_1E5B5CF60;
          v48 = v38;
          v44[4] = self;
          v45 = v23;
          v47 = v43;
          v46 = v15;
          -[ML3MusicLibrary _autogenerateArtworkForRelativePath:artworkType:mediaType:completionHandler:](self, "_autogenerateArtworkForRelativePath:artworkType:mediaType:completionHandler:", v17, v43, v39, v44);

          v26 = *((_BYTE *)v55 + 24) != 0;
        }
        else
        {
          v26 = 0;
        }

      }
    }

    _Block_object_dispose(&v54, 8);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8 completion:(id)a9
{
  uint64_t v9;
  id v14;
  void (**v15)(id, id);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  _BOOL4 v24;
  _QWORD v25[4];
  id v26;
  void (**v27)(id, id);
  id v28[2];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v24 = a8;
  v9 = *(_QWORD *)&a7;
  v31 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = (void (**)(id, id))a9;
  v16 = a3;
  NSTemporaryDirectory();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("imagedata.XXXXXX"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = 0;
  MSVCreateTemporaryFileHandle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v28[0] = 0;
  objc_msgSend(v19, "writeData:error:", v16, v28);

  v21 = v28[0];
  objc_msgSend(v19, "closeFile");

  if (v21)
  {
    v22 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_ERROR, "Failed to write original artwork to temporary path with error: %{public}@", buf, 0xCu);
    }

    if (v15)
      v15[2](v15, v21);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v20, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __142__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke;
    v25[3] = &unk_1E5B647D0;
    v26 = v20;
    v27 = v15;
    -[ML3MusicLibrary importOriginalArtworkFromFileURL:withArtworkToken:artworkType:sourceType:mediaType:shouldPerformColorAnalysis:completion:](self, "importOriginalArtworkFromFileURL:withArtworkToken:artworkType:sourceType:mediaType:shouldPerformColorAnalysis:completion:", v23, v14, a5, a6, v9, v24, v25);

  }
}

- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7
{
  return -[ML3MusicLibrary importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:shouldPerformColorAnalysis:](self, "importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:shouldPerformColorAnalysis:", a3, a4, a5, a6, *(_QWORD *)&a7, 1);
}

- (BOOL)removeArtworkAssetWithToken:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  ML3MusicLibrary *v11;
  uint64_t *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[4];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2077;
    v26 = __Block_byref_object_dispose__2078;
    v27 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0;
    v5 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke;
    v16[3] = &unk_1E5B5CF88;
    v6 = v4;
    v17 = v6;
    v18 = v28;
    v19 = &v22;
    v20 = v21;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v16);
    if (objc_msgSend((id)v23[5], "length"))
    {
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke_3;
      v9[3] = &unk_1E5B5CFB0;
      v12 = &v29;
      v10 = v6;
      v11 = self;
      v13 = v21;
      v14 = v28;
      v15 = &v22;
      -[ML3MusicLibrary performDatabaseTransactionWithBlock:](self, "performDatabaseTransactionWithBlock:", v9);

    }
    v7 = *((_BYTE *)v30 + 24) != 0;

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)deleteArtworkToken:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;
  ML3MusicLibrary *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__ML3MusicLibrary_deleteArtworkToken___block_invoke;
    v7[3] = &unk_1E5B62DC0;
    v9 = self;
    v10 = &v11;
    v8 = v4;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v7);
    v5 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)migrateExistingArtworkToken:(id)a3 newArtworkToken:(id)a4 newSourceType:(int64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  os_log_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  ML3MusicLibrary *v41;
  os_log_t v42;
  __int128 *v43;
  _QWORD *v44;
  int64_t v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t *v49;
  _QWORD *v50;
  _QWORD v51[4];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  uint8_t v64[128];
  __int128 v65;
  uint64_t v66;
  char v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28 = a4;
  v29 = v7;
  if (objc_msgSend(v7, "length"))
  {
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__2077;
    v56 = __Block_byref_object_dispose__2078;
    v57 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v51[3] = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke;
    v46[3] = &unk_1E5B5CFD8;
    v10 = v29;
    v47 = v10;
    v49 = &v52;
    v50 = v51;
    v27 = v8;
    v48 = v27;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v46);
    if (objc_msgSend((id)v53[5], "length"))
    {
      +[ML3MusicLibrary artworkRelativePathFromToken:](ML3MusicLibrary, "artworkRelativePathFromToken:", v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v65 = 0;
      *((_QWORD *)&v65 + 1) = &v65;
      v66 = 0x2020000000;
      v67 = 1;
      v37[0] = v9;
      v37[1] = 3221225472;
      v37[2] = __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_493;
      v37[3] = &unk_1E5B5D000;
      v38 = v27;
      v43 = &v65;
      v39 = v28;
      v45 = a5;
      v40 = v10;
      v41 = self;
      v44 = v51;
      v12 = v11;
      v42 = v12;
      -[ML3MusicLibrary performDatabaseTransactionWithBlock:](self, "performDatabaseTransactionWithBlock:", v37);
      if (*(_BYTE *)(*((_QWORD *)&v65 + 1) + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ML3MusicLibrary _allArtworkVariantDirectories](self, "_allArtworkVariantDirectories");
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v64, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v34 != v15)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v17, "URLByAppendingPathComponent:", v53[5]);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "URLByAppendingPathComponent:", v12);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "URLByDeletingLastPathComponent");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "path");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v13, "fileExistsAtPath:", v21);

              if ((v22 & 1) == 0)
                objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, 0);
              objc_msgSend(v18, "path");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v13, "fileExistsAtPath:", v23);

              if (v24)
              {
                v32 = 0;
                objc_msgSend(v13, "moveItemAtURL:toURL:error:", v18, v19, &v32);
                v25 = v32;
                if (v25)
                {
                  v26 = os_log_create("com.apple.amp.medialibrary", "Default");
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543874;
                    v59 = v18;
                    v60 = 2114;
                    v61 = v19;
                    v62 = 2114;
                    v63 = v25;
                    _os_log_impl(&dword_1AC149000, v26, OS_LOG_TYPE_ERROR, "Failed to move artwork from '%{public}@' to '%{public}@' with error: %{public}@", buf, 0x20u);
                  }
                }
                else
                {
                  objc_msgSend(v19, "path");
                  v26 = objc_claimAutoreleasedReturnValue();
                  -[ML3MusicLibrary updatePurgeabilityForCachedArtworkWithAbsolutePath:](self, "updatePurgeabilityForCachedArtworkWithAbsolutePath:", v26);
                }

              }
            }
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v64, 16);
          }
          while (v14);
        }

      }
      _Block_object_dispose(&v65, 8);
    }
    else
    {
      v12 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v65) = 138543362;
        *(_QWORD *)((char *)&v65 + 4) = v10;
        _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "Cannot migrate exisitng artwork, no artwork found in database with token %{public}@", (uint8_t *)&v65, 0xCu);
      }
    }

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(&v52, 8);

  }
}

- (void)importArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7
{
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;

  v12 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__ML3MusicLibrary_importArtworkTokenForEntityPersistentID_entityType_artworkToken_artworkType_sourceType___block_invoke;
  v14[3] = &unk_1E5B5D028;
  v16 = a3;
  v17 = a4;
  v14[4] = self;
  v15 = v12;
  v18 = a6;
  v19 = a7;
  v13 = v12;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v14);

}

- (void)importArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7 usingConnection:(id)a8
{
  InsertOrReplaceIntoArtworkToken(a8, a5, a7, a6, a3, a4);
}

- (void)removeArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6
{
  _QWORD v6[9];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__ML3MusicLibrary_removeArtworkTokenForEntityPersistentID_entityType_artworkType_sourceType___block_invoke;
  v6[3] = &unk_1E5B5D050;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  v6[8] = a6;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v6);
}

- (void)removeArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 usingConnection:(id)a7
{
  InsertOrReplaceIntoArtworkToken(a7, 0, a6, a5, a3, a4);
}

- (void)updateBestArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 retrievalTime:(double)a6 usingConnection:(id)a7
{
  -[ML3MusicLibrary updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:](self, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:", a3, a4, a5, 1, a7, a6);
}

- (BOOL)isArtworkTokenAvailable:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__ML3MusicLibrary_isArtworkTokenAvailable___block_invoke;
    v7[3] = &unk_1E5B64FE0;
    v8 = v4;
    v9 = &v10;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v7);
    v5 = *((_BYTE *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasUserPlaylists
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__ML3MusicLibrary_hasUserPlaylists__block_invoke;
  v4[3] = &unk_1E5B5CA80;
  v4[4] = &v5;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)hasAddedToLibraryAppleMusicContent
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__ML3MusicLibrary_hasAddedToLibraryAppleMusicContent__block_invoke;
  v4[3] = &unk_1E5B5CA80;
  v4[4] = &v5;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)hasUserPlaylistsContainingAppleMusicContent
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__ML3MusicLibrary_hasUserPlaylistsContainingAppleMusicContent__block_invoke;
  v4[3] = &unk_1E5B5CA80;
  v4[4] = &v5;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)cleanupArtworkWithOptions:(unint64_t)a3
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  NSString *v9;
  NSString *databasePath;
  char v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  if (!-[ML3MusicLibrary isHomeSharingLibrary](self, "isHomeSharingLibrary"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", self->_databasePath);

    if (v6)
    {
      v7 = -[ML3MusicLibrary currentDatabaseVersion](self, "currentDatabaseVersion");
      if (v7 == 2200070)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __45__ML3MusicLibrary_cleanupArtworkWithOptions___block_invoke;
        v13[3] = &unk_1E5B5D0C8;
        v13[4] = self;
        v13[5] = &v14;
        v13[6] = a3;
        -[ML3MusicLibrary performDatabaseTransactionWithBlock:](self, "performDatabaseTransactionWithBlock:", v13);
        goto LABEL_11;
      }
      v8 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        databasePath = self->_databasePath;
        *(_DWORD *)buf = 67109890;
        v19 = a3;
        v20 = 2114;
        v21 = databasePath;
        v22 = 1024;
        v23 = v7;
        v24 = 1024;
        v25 = 2200070;
        _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "not cleaning up artwork with options (%d) with database at %{public}@ as current version (%d) is not (%d)", buf, 0x1Eu);
      }
    }
    else
    {
      v8 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = self->_databasePath;
        *(_DWORD *)buf = 67109378;
        v19 = a3;
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "not cleaning up artwork with options (%d) with database at %{public}@ as file does not exist at this location", buf, 0x12u);
      }
    }

  }
LABEL_11:
  v11 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (BOOL)cleanupArtworkWithOptions:(unint64_t)a3 usingConnection:(id)a4
{
  char v4;
  id v6;
  _BOOL4 v7;

  v4 = a3;
  v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  if (-[ML3MusicLibrary isHomeSharingLibrary](self, "isHomeSharingLibrary"))
  {
    LOBYTE(v7) = 1;
    goto LABEL_15;
  }
  if ((v4 & 2) != 0)
  {
    v7 = -[ML3MusicLibrary _removeOrphanedArtworkTokensUsingConnection:](self, "_removeOrphanedArtworkTokensUsingConnection:", v6);
    if ((v4 & 4) == 0)
      goto LABEL_9;
LABEL_7:
    if (v7)
      v7 = -[ML3MusicLibrary _removeOrphanedArtworkMetadataUsingConnection:](self, "_removeOrphanedArtworkMetadataUsingConnection:", v6);
    goto LABEL_9;
  }
  v7 = 1;
  if ((v4 & 4) != 0)
    goto LABEL_7;
LABEL_9:
  if ((v4 & 8) != 0 && v7)
    v7 = -[ML3MusicLibrary _removeOrphanedArtworkAssetsUsingConnection:](self, "_removeOrphanedArtworkAssetsUsingConnection:", v6);
  if ((v4 & 0x10) != 0 && v7)
    LOBYTE(v7) = -[ML3MusicLibrary _removeInvalidAvailableArtworkTokensUsingConnection:](self, "_removeInvalidAvailableArtworkTokensUsingConnection:", v6);
LABEL_15:

  return v7;
}

- (void)removeTombstonesForDeletedItems
{
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, &__block_literal_global_515);
}

- (void)removeOrphanedTracksOnlyInCaches:(BOOL)a3
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  const char *v39;
  NSObject *v40;
  os_log_type_t v41;
  off_t st_size;
  NSObject *v43;
  _BOOL4 v44;
  id v45;
  void (**v46)(_QWORD, _QWORD);
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  ML3MusicLibrary *v51;
  char v52;
  uint64_t i;
  _BOOL4 v54;
  void *v55;
  void *v56;
  ML3MusicLibrary *v57;
  void *v58;
  void *v59;
  SEL v60;
  void *v61;
  void *v62;
  _QWORD v63[5];
  id v64;
  id v65;
  uint64_t v66;
  uint8_t v67[16];
  stat buf;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  NSObject *v74;
  _BYTE v75[128];
  _QWORD v76[4];

  v76[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  if (!-[ML3MusicLibrary isHomeSharingLibrary](self, "isHomeSharingLibrary"))
  {
    +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", self, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = CFSTR("item_extra.location");
    v76[1] = CFSTR("base_location_id");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", self->_databasePath);

    v14 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      if (-[ML3MusicLibrary currentDatabaseVersion](self, "currentDatabaseVersion") != 2200070)
      {
        v16 = os_log_create("com.apple.amp.medialibrary", "Library");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.st_dev) = 0;
          _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "De-orphaning called on old database, returning immediately", (uint8_t *)&buf, 2u);
        }
        goto LABEL_42;
      }
      v73[0] = v14;
      v73[1] = 3221225472;
      v73[2] = __52__ML3MusicLibrary_removeOrphanedTracksOnlyInCaches___block_invoke;
      v73[3] = &unk_1E5B62770;
      v74 = v11;
      objc_msgSend(v9, "enumeratePersistentIDsAndProperties:usingBlock:", v10, v73);
      v15 = v74;
    }
    else
    {
      v15 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.st_dev) = 0;
        _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "De-orphaning called with no database, removing everything", (uint8_t *)&buf, 2u);
      }
    }

    -[ML3MusicLibrary pathForBaseLocationPath:](self, "pathForBaseLocationPath:", 300);
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", CFSTR("Ringtones.plist"));
    v17 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)v17;
    v62 = v10;
    v60 = a2;
    if (a3
      || (v18 = (void *)v17,
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = v18,
          LODWORD(v18) = objc_msgSend(v19, "fileExistsAtPath:", v18),
          v19,
          !(_DWORD)v18))
    {
      v35 = 1;
      v36 = MEMORY[0x1E0C809B0];
LABEL_33:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("mp3"), CFSTR("m4a"), CFSTR("m4p"), CFSTR("aa"), CFSTR("aax"), CFSTR("mp4"), CFSTR("m4v"), CFSTR("mov"), CFSTR("m4b"), CFSTR("movpkg"), CFSTR("m4bpkg"), 0);
      v63[0] = v36;
      v63[1] = 3221225472;
      v63[2] = __52__ML3MusicLibrary_removeOrphanedTracksOnlyInCaches___block_invoke_524;
      v63[3] = &unk_1E5B5D110;
      v63[4] = self;
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v64 = v45;
      v65 = v11;
      v66 = (uint64_t)v8;
      v46 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF43CDE0](v63);
      if (!a3)
      {
        v47 = v9;
        v48 = v16;
        -[ML3MusicLibrary libraryContainerPath](self, "libraryContainerPath");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = self;
        v52 = objc_msgSend(v49, "isEqualToString:", v50);

        if ((v52 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[ML3MusicLibrary libraryContainerPath](v51, "libraryContainerPath");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", v60, v51, CFSTR("ML3MusicLibrary.m"), 3405, CFSTR("Attempting to de-orphan shared resources in a MU library! %@"), v56);

        }
        for (i = 3840; i != 3890; ++i)
          v46[2](v46, i);
        v46[2](v46, 250);
        v16 = v48;
        if ((v35 & 1) != 0)
        {
          v46[2](v46, 300);
          v46[2](v46, 500);
          v46[2](v46, 600);
        }
        v46[2](v46, 400);
        v9 = v47;
      }
      v46[2](v46, 200);
      v46[2](v46, 100);

      v10 = v62;
LABEL_42:

      return;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v21;
    if (v21)
    {
      v57 = self;
      v58 = v9;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v21, "objectForKey:", CFSTR("Ringtones"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v70;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v70 != v26)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 300);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v30)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 300);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, v32);

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 300);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v28);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
        }
        while (v25);
      }

      v35 = 1;
      self = v57;
      v9 = v58;
      v36 = MEMORY[0x1E0C809B0];
      goto LABEL_32;
    }
    memset(&buf, 0, sizeof(buf));
    if (stat((const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"), &buf))
    {
      v37 = os_log_create("com.apple.amp.medialibrary", "Library");
      v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      v36 = MEMORY[0x1E0C809B0];
      if (v38)
      {
        *(_WORD *)v67 = 0;
        v39 = "Couldn't stat ringtone.plist";
        v40 = v37;
        v41 = OS_LOG_TYPE_DEFAULT;
LABEL_29:
        _os_log_impl(&dword_1AC149000, v40, v41, v39, v67, 2u);
      }
    }
    else
    {
      st_size = buf.st_size;
      _ML3LogCategoryLibrary();
      v43 = objc_claimAutoreleasedReturnValue();
      v37 = v43;
      if (st_size < 1)
      {
        v54 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
        v36 = MEMORY[0x1E0C809B0];
        if (v54)
        {
          *(_WORD *)v67 = 0;
          _os_log_impl(&dword_1AC149000, v37, OS_LOG_TYPE_DEFAULT, "Empty ringtone.plist found, OK to purge.", v67, 2u);
        }
        v35 = 1;
        goto LABEL_31;
      }
      v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
      v36 = MEMORY[0x1E0C809B0];
      if (v44)
      {
        *(_WORD *)v67 = 0;
        v39 = "Skipping de-orphaning of Purchases directory due to locked ringtone.plist";
        v40 = v37;
        v41 = OS_LOG_TYPE_ERROR;
        goto LABEL_29;
      }
    }
    v35 = 0;
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
}

- (void)removeItemsWithFamilyAccountID:(unint64_t)a3 purchaserAccountID:(unint64_t)a4 downloaderAccountID:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("item_store.account_id"), v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("item_store.downloader_account_id"), v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = v9;
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("item_store.family_account_id"), v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("item_store.is_protected"), &unk_1E5BAAD40, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v13;
  v33[1] = v15;
  v33[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", self, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __89__ML3MusicLibrary_removeItemsWithFamilyAccountID_purchaserAccountID_downloaderAccountID___block_invoke;
  v25[3] = &unk_1E5B65960;
  v21 = v20;
  v26 = v21;
  objc_msgSend(v19, "enumeratePersistentIDsUsingBlock:", v25);
  v22 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 134218498;
    v28 = v23;
    v29 = 2048;
    v30 = v24;
    v31 = 2114;
    v32 = v21;
    _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_ERROR, "Removing %llu tracks due to family account removal (family account id = %lld)\npersistent_ids = %{public}@", buf, 0x20u);
  }

  +[ML3Track unlinkRedownloadableAssetsFromLibrary:persistentIDs:deletionType:deletedFileSize:](ML3Track, "unlinkRedownloadableAssetsFromLibrary:persistentIDs:deletionType:deletedFileSize:", self, v21, 2, 0);
}

- (BOOL)deleteDatabaseProperty:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__ML3MusicLibrary_deleteDatabaseProperty___block_invoke;
    v8[3] = &unk_1E5B64FE0;
    v10 = &v11;
    v9 = v4;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v8);

    v6 = *((_BYTE *)v12 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)migratePresignedValidity
{
  if (-[ML3MusicLibrary hasPresignedValidity](self, "hasPresignedValidity"))
  {
    if (-[ML3MusicLibrary verifyPresignedValidity](self, "verifyPresignedValidity"))
      -[ML3MusicLibrary updateTrackIntegrity](self, "updateTrackIntegrity");
    -[ML3MusicLibrary deletePresignedValidity](self, "deletePresignedValidity");
  }
}

- (BOOL)hasPresignedValidity
{
  void *v2;
  void *v3;
  char v4;

  GetP7BPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  return v4;
}

- (BOOL)verifyPresignedValidity
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  CC_SHA1_CTX v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  unsigned __int8 md[20];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  GetP7BPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__ML3MusicLibrary_verifyPresignedValidity__block_invoke;
    v14[3] = &unk_1E5B65F08;
    v6 = v5;
    v15 = v6;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v14);
    memset(&v13, 0, sizeof(v13));
    CC_SHA1_Init(&v13);
    v7 = objc_retainAutorelease(v6);
    CC_SHA1_Update(&v13, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    CC_SHA1_Final(md, &v13);
    objc_msgSend(v4, "length");
    objc_msgSend(objc_retainAutorelease(v4), "bytes");
    zLTj();
    v9 = v8 == 0;
    if (v8)
    {
      v10 = v8;
      v11 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219008;
        v17 = v10;
        v18 = 1024;
        v19 = md[0];
        v20 = 1024;
        v21 = md[1];
        v22 = 1024;
        v23 = md[2];
        v24 = 1024;
        v25 = md[3];
        _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "BarVerify returned %ld for %02x%02x%02x%02x...", buf, 0x24u);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)deletePresignedValidity
{
  NSObject *v2;
  id v3;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_ERROR, "deleting presigned validity", v4, 2u);
  }

  GetP7BPath();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  unlink((const char *)objc_msgSend(v3, "fileSystemRepresentation"));

}

- (void)updateTrackIntegrity
{
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, &__block_literal_global_542);
}

- (id)securityScopedFileURLForItemPID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary databasePath](self, "databasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "securityScopedURLForItemPID:withDatabasePath:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_logDatabaseAccess
{
  id v2;

  if (!__daemonProcessInfo)
  {
    -[ML3MusicLibrary privacyContext](self, "privacyContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logDatabasePrivacyAccess");

  }
}

- (BOOL)_insertArtworkRowWithArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 relativePath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v10 = a3;
  v11 = a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__ML3MusicLibrary__insertArtworkRowWithArtworkToken_artworkType_sourceType_relativePath___block_invoke;
  v15[3] = &unk_1E5B5D178;
  v18 = &v21;
  v15[4] = self;
  v12 = v10;
  v16 = v12;
  v19 = a4;
  v20 = a5;
  v13 = v11;
  v17 = v13;
  -[ML3MusicLibrary performDatabaseTransactionWithBlock:](self, "performDatabaseTransactionWithBlock:", v15);
  LOBYTE(a4) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return a4;
}

- (BOOL)_insertArtworkRowWithArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 relativePath:(id)a6 usingConnection:(id)a7
{
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  ML3MusicLibrary *v23;
  id v24;
  _QWORD v25[4];
  uint8_t buf[4];
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (!objc_msgSend(v13, "length"))
  {
    v19 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v12;
      _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "_insertArtworkRowWithArtworkToken passed empty path for artwork with token %{public}@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  v23 = self;
  v25[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v16;
  v25[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v18 = objc_msgSend(v14, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO artwork (artwork_token, artwork_type, artwork_source_type, relative_path) VALUES (?, ?, ?, ?)"), v17, &v24);
  v19 = v24;

  if (!v18)
  {
    v21 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "Failed to insert into artwork table with error: %{public}@", buf, 0xCu);
    }

LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  v20 = 1;
  -[ML3MusicLibrary _updateBestArtworkTokensForArtworkToken:artworkType:sourceType:preserveExistingAvailableToken:usingConnection:](v23, "_updateBestArtworkTokensForArtworkToken:artworkType:sourceType:preserveExistingAvailableToken:usingConnection:", v12, a4, a5, 1, v14);
  -[ML3MusicLibrary updatePurgeabilityForOriginalArtworkWithRelativePath:](v23, "updatePurgeabilityForOriginalArtworkWithRelativePath:", v13);
LABEL_10:

  return v20;
}

- (BOOL)_updateBestArtworkTokensForArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 preserveExistingAvailableToken:(BOOL)a6 usingConnection:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  BOOL v29;
  id v31;
  void *v32;
  id obja;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  int64_t v42;
  int64_t v43;
  _BYTE v44[128];
  _QWORD v45[5];

  v8 = a6;
  v45[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v45[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "executeQuery:withParameters:", CFSTR("SELECT entity_pid, entity_type FROM artwork_token WHERE artwork_token = ? AND artwork_type = ? AND artwork_source_type = ?"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __129__ML3MusicLibrary__updateBestArtworkTokensForArtworkToken_artworkType_sourceType_preserveExistingAvailableToken_usingConnection___block_invoke;
  v39[3] = &unk_1E5B5D1A0;
  v18 = obja;
  v40 = v18;
  v19 = v12;
  v41 = v19;
  v42 = a4;
  v43 = a5;
  v32 = v17;
  objc_msgSend(v17, "enumerateRowsWithBlock:", v39);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v18;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v20)
  {
    v21 = v20;
    v31 = v19;
    v22 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "longLongValue");

        objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (int)objc_msgSend(v27, "intValue");

        if (!-[ML3MusicLibrary _determineAndUpdateBestArtworkTokensForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:](self, "_determineAndUpdateBestArtworkTokensForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:", v26, v28, a4, v8, v13, 0.0))
        {
          v29 = 0;
          goto LABEL_11;
        }
        objc_msgSend(MLEntityClassForType(v28), "incrementRevisionWithLibrary:persistentID:deletionType:revisionType:usingConnection:", self, v26, 0, 1, v13);
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v21)
        continue;
      break;
    }
    v29 = 1;
LABEL_11:
    v19 = v31;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)_determineAndUpdateBestArtworkTokensForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 retrievalTime:(double)a6 preserveExistingAvailableToken:(BOOL)a7 usingConnection:(id)a8
{
  _BOOL4 v8;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void **v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  void **v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  BOOL v44;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v57[12];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  __CFString *v67;
  _QWORD v68[4];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  __CFString *v74;
  id v75;
  _QWORD v76[5];
  _QWORD v77[3];
  uint8_t buf[4];
  id v79;
  void *v80;
  void **v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  _QWORD v86[6];

  v8 = a7;
  v86[3] = *MEMORY[0x1E0C80C00];
  v12 = a8;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__2077;
  v73 = __Block_byref_object_dispose__2078;
  v74 = &stru_1E5B66908;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v68[3] = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__2077;
  v66 = __Block_byref_object_dispose__2078;
  v67 = &stru_1E5B66908;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeQuery:withParameters:", CFSTR("SELECT artwork_token.artwork_token, artwork_token.artwork_source_type, (artwork.relative_path != '') AS has_artwork_on_disk FROM artwork_token LEFT OUTER JOIN artwork USING (artwork_token) WHERE artwork_token.entity_pid = ? AND artwork_token.entity_type = ? AND artwork_token.artwork_type = ? ORDER BY artwork_token.artwork_source_type ASC"), v16);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __161__ML3MusicLibrary__determineAndUpdateBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_preserveExistingAvailableToken_usingConnection___block_invoke;
  v57[3] = &unk_1E5B5D1C8;
  v57[6] = &v69;
  v57[7] = &v58;
  v57[4] = self;
  v57[5] = v68;
  v57[10] = a4;
  v57[11] = a5;
  v57[8] = &v62;
  v57[9] = a3;
  objc_msgSend(v53, "enumerateRowsWithBlock:", v57);
  v17 = (void *)v70[5];
  v18 = (void *)v63[5];
  v51 = v59[3];
  v55 = v12;
  v19 = v17;
  v20 = v18;
  if (!v19)
  {
    v46 = v20;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL UpdateBestArtworkToken(ML3DatabaseConnection *__strong, int64_t, ML3EntityType, ML3ArtworkType, NSString *__strong, NSString *__strong, ML3ArtworkSourceType, BOOL)");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("ML3MusicLibrary.m"), 4429, CFSTR("Available artwork token cannot be nil"));

    v20 = v46;
  }
  v54 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL UpdateBestArtworkToken(ML3DatabaseConnection *__strong, int64_t, ML3EntityType, ML3ArtworkType, NSString *__strong, NSString *__strong, ML3ArtworkSourceType, BOOL)");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("ML3MusicLibrary.m"), 4430, CFSTR("Fetchable artwork token cannot be nil"));

  }
  v21 = objc_msgSend(v19, "length", v51);
  v22 = objc_msgSend(v54, "length");
  v23 = v22 != 0;
  if (!v8 || v21)
  {
    if (!(v21 | v22))
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v25;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "executeQuery:withParameters:", CFSTR("SELECT available_artwork_token FROM best_artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__2077;
    v84 = __Block_byref_object_dispose__2078;
    v85 = 0;
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __UpdateBestArtworkToken_block_invoke;
    v76[3] = &unk_1E5B65200;
    v76[4] = &v80;
    objc_msgSend(v28, "enumerateRowsWithBlock:", v76);
    if (objc_msgSend(v81[5], "length"))
    {
      v29 = v81[5];

      v23 = 1;
      v19 = v29;
    }
    _Block_object_dispose(&v80, 8);

    if (!v23)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v30;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v31 = (void **)objc_claimAutoreleasedReturnValue();
      v81 = v31;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (uint64_t)v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 0;
      v34 = objc_msgSend(v55, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM best_artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?"), v33, &v75);
      v35 = v75;

      if ((v34 & 1) == 0)
      {
        v36 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v79 = v35;
          v37 = "Failed to delete best_artwork_token with error: %{public}@";
LABEL_18:
          _os_log_impl(&dword_1AC149000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v38;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v39 = (void **)objc_claimAutoreleasedReturnValue();
  v81 = v39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (uint64_t)v40;
  v83 = (uint64_t (*)(uint64_t, uint64_t))v19;
  v84 = (void (*)(uint64_t))v54;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v52);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v43 = objc_msgSend(v55, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO best_artwork_token (entity_pid, entity_type, artwork_type, available_artwork_token, fetchable_artwork_token, fetchable_artwork_source_type) VALUES (?, ?, ?, ?, ?, ?)"), v42, &v75);
  v35 = v75;

  if ((v43 & 1) == 0)
  {
    v36 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v79 = v35;
      v37 = "Failed to update best_artwork_token with error: %{public}@";
      goto LABEL_18;
    }
LABEL_19:

    v44 = 0;
    goto LABEL_20;
  }
LABEL_15:
  v44 = 1;
LABEL_20:

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(v68, 8);
  _Block_object_dispose(&v69, 8);

  return v44;
}

- (id)_allArtworkVariantDirectories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  -[ML3MusicLibrary rootArtworkCacheDirectory](self, "rootArtworkCacheDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C999D0];
  v30[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v3;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, v11, 4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
        v24 = 0;
        v19 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v24, v10, 0);
        v20 = v24;
        v21 = v20;
        if (v19 && objc_msgSend(v20, "BOOLValue"))
          objc_msgSend(v4, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  return v4;
}

- (void)_deleteAllArtworkVariantsAtRelativePaths:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id obj;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *context;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary _allArtworkVariantDirectories](self, "_allArtworkVariantDirectories");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(obj);
        v25 = v5;
        v6 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1AF43CC0C]();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v7 = v22;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v28 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              v13 = (void *)MEMORY[0x1AF43CC0C]();
              objc_msgSend(v6, "URLByAppendingPathComponent:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "path");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v4, "fileExistsAtPath:", v15);

              if (v16)
              {
                v17 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v36 = v14;
                  _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "Deleting artwork at: %{public}@", buf, 0xCu);
                }

                v26 = 0;
                objc_msgSend(v4, "removeItemAtURL:error:", v14, &v26);
                v18 = v26;
                if (v18)
                {
                  v19 = os_log_create("com.apple.amp.medialibrary", "Default");
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    v36 = v14;
                    v37 = 2114;
                    v38 = v18;
                    _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_ERROR, "Failed to delete artwork at '%{public}@' with error: %{public}@", buf, 0x16u);
                  }

                }
              }

              objc_autoreleasePoolPop(v13);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          }
          while (v9);
        }

        objc_autoreleasePoolPop(context);
        v5 = v25 + 1;
      }
      while (v25 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v23);
  }

}

- (BOOL)_removeOrphanedArtworkTokensUsingConnection:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v15[0] = &unk_1E5BAAD28;
  v15[1] = &unk_1E5BAAD40;
  v16[0] = CFSTR("item");
  v16[1] = CFSTR("container");
  v15[2] = &unk_1E5BAAD58;
  v15[3] = &unk_1E5BAAD70;
  v16[2] = CFSTR("item_artist");
  v16[3] = CFSTR("genre");
  v15[4] = &unk_1E5BAAD88;
  v15[5] = &unk_1E5BAADA0;
  v16[4] = CFSTR("album");
  v16[5] = CFSTR("composer");
  v15[6] = &unk_1E5BAADB8;
  v16[6] = CFSTR("album_artist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__ML3MusicLibrary__removeOrphanedArtworkTokensUsingConnection___block_invoke;
  v8[3] = &unk_1E5B5D1F0;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((_BYTE *)v12 + 24) != 0;

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)_removeOrphanedArtworkMetadataUsingConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1AF43CC0C]();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT artwork_token, artwork_source_type, relative_path, artwork.artwork_type FROM artwork LEFT OUTER JOIN best_artwork_token ON artwork_token = available_artwork_token WHERE artwork.artwork_type != ? AND available_artwork_token IS NULL"), &unk_1E5BA8C10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke;
  v35[3] = &unk_1E5B639C0;
  v10 = v5;
  v36 = v10;
  v11 = v6;
  v37 = v11;
  objc_msgSend(v8, "enumerateRowsWithBlock:", v35);

  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1AF43CC0C]();
  objc_msgSend(v4, "executeQuery:", CFSTR("SELECT item_pid, chapter_data FROM chapter JOIN item USING (item_pid) WHERE chapter_data IS NOT NULL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v9;
  v33[1] = 3221225472;
  v33[2] = __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_566;
  v33[3] = &unk_1E5B65EE0;
  v15 = v12;
  v34 = v15;
  objc_msgSend(v14, "enumerateRowsWithBlock:", v33);

  objc_autoreleasePoolPop(v13);
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT artwork_token, relative_path FROM artwork WHERE artwork_type = ?"), &unk_1E5BA8C28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1AF43CC0C]();
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_3;
  v29[3] = &unk_1E5B64290;
  v18 = v15;
  v30 = v18;
  v19 = v10;
  v31 = v19;
  v20 = v11;
  v32 = v20;
  objc_msgSend(v16, "enumerateRowsWithBlock:", v29);

  objc_autoreleasePoolPop(v17);
  if (objc_msgSend(v19, "count"))
  {
    v21 = (void *)MEMORY[0x1AF43CC0C]();
    +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "statementWithPrefix:inParameterCount:", CFSTR("DELETE FROM artwork WHERE artwork_token"), objc_msgSend(v19, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v4, "executeUpdate:withParameters:error:", v23, v19, &v28);
    v24 = v28;

    v25 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134217984;
      v39 = v26;
      _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_ERROR, "Deleting %ld artwork assets from orphaned metadata.", buf, 0xCu);
    }

    -[ML3MusicLibrary _deleteAllArtworkVariantsAtRelativePaths:](self, "_deleteAllArtworkVariantsAtRelativePaths:", v20);
    objc_autoreleasePoolPop(v21);
  }

  return 1;
}

- (BOOL)_removeOrphanedArtworkAssetsUsingConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  uint64_t v80;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id obj;
  ML3MusicLibrary *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[4];
  id v120;
  _BYTE v121[128];
  uint64_t v122;
  _BYTE v123[128];
  uint64_t v124;
  _BYTE v125[128];
  uint64_t v126;
  uint8_t v127[128];
  uint8_t buf[4];
  uint64_t v129;
  _QWORD v130[2];
  _BYTE v131[128];
  _QWORD v132[4];

  v132[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1AF43CC0C]();
  v92 = v4;
  objc_msgSend(v4, "executeQuery:", CFSTR("SELECT distinct(relative_path) FROM artwork"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke;
  v119[3] = &unk_1E5B65EE0;
  v8 = v5;
  v120 = v8;
  objc_msgSend(v7, "enumerateRowsWithBlock:", v119);

  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E98];
  v91 = self;
  -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 1);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0C999D0];
  v132[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)v12;
  v84 = v9;
  objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v14, 4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v116;
    v87 = *(_QWORD *)v116;
    do
    {
      v19 = 0;
      v89 = v17;
      do
      {
        if (*(_QWORD *)v116 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1AF43CC0C]();
        v114 = 0;
        objc_msgSend(v20, "getResourceValue:forKey:error:", &v114, v13, 0);
        v22 = v114;
        if ((objc_msgSend(v22, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v20, "pathComponents");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count");
          v25 = v24 - 1;
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v23, "objectAtIndexedSubscript:", v24 - 2);
          v27 = v8;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v130[0] = v28;
          objc_msgSend(v23, "objectAtIndexedSubscript:", v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v130[1] = v29;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "pathWithComponents:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v27;
          if (objc_msgSend(v27, "containsObject:", v31))
          {
            objc_msgSend(v27, "removeObject:", v31);
          }
          else
          {
            objc_msgSend(v86, "addObject:", v31);
            v32 = os_log_create("com.apple.amp.medialibrary", "Library");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v129 = (uint64_t)v31;
              _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_DEFAULT, "Found orphaned artwork on disk with relative path: %{public}@", buf, 0xCu);
            }

          }
          v18 = v87;

          v17 = v89;
        }

        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v8, "count") || objc_msgSend(v86, "count"))
  {
    v33 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v129 = v34;
      _os_log_impl(&dword_1AC149000, v33, OS_LOG_TYPE_DEFAULT, "Found %lu artwork metadata without an asset on disk", buf, 0xCu);
    }

    v35 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_msgSend(v86, "count");
      *(_DWORD *)buf = 134217984;
      v129 = v36;
      _os_log_impl(&dword_1AC149000, v35, OS_LOG_TYPE_DEFAULT, "Found %lu artwork asset without metadata in database", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v88 = v8;
    v38 = v8;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v111;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v111 != v41)
            objc_enumerationMutation(v38);
          v43 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i);
          v44 = (void *)MEMORY[0x1AF43CC0C]();
          v126 = v43;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "executeQuery:withParameters:", CFSTR("SELECT artwork_token FROM artwork WHERE relative_path = ?"), v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v108[0] = MEMORY[0x1E0C809B0];
          v108[1] = 3221225472;
          v108[2] = __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke_580;
          v108[3] = &unk_1E5B65EE0;
          v109 = v37;
          objc_msgSend(v46, "enumerateRowsWithBlock:", v108);

          objc_autoreleasePoolPop(v44);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
      }
      while (v40);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v48 = v37;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v105;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v105 != v51)
            objc_enumerationMutation(v48);
          v53 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j);
          v54 = (void *)MEMORY[0x1AF43CC0C]();
          v124 = v53;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "executeQuery:withParameters:", CFSTR("SELECT entity_pid, entity_type, artwork_type FROM best_artwork_token WHERE available_artwork_token = ?"), v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          v102[0] = MEMORY[0x1E0C809B0];
          v102[1] = 3221225472;
          v102[2] = __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke_2;
          v102[3] = &unk_1E5B65EE0;
          v103 = v47;
          objc_msgSend(v56, "enumerateRowsWithBlock:", v102);

          objc_autoreleasePoolPop(v54);
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
      }
      while (v50);
    }

    if (objc_msgSend(v48, "count"))
    {
      v85 = v47;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v82 = v48;
      v57 = v48;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v98, v123, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v99;
        do
        {
          for (k = 0; k != v59; ++k)
          {
            if (*(_QWORD *)v99 != v60)
              objc_enumerationMutation(v57);
            v62 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * k);
            v63 = (void *)MEMORY[0x1AF43CC0C]();
            v122 = v62;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = 0;
            LOBYTE(v62) = objc_msgSend(v92, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM artwork WHERE artwork_token = ?"), v64, &v97);
            v65 = v97;

            if ((v62 & 1) == 0)
            {
              v66 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v129 = (uint64_t)v65;
                _os_log_impl(&dword_1AC149000, v66, OS_LOG_TYPE_ERROR, "Failed to delete from artwork table with error: %{public}@", buf, 0xCu);
              }

            }
            objc_autoreleasePoolPop(v63);
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v98, v123, 16);
        }
        while (v59);
      }

      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v67 = v85;
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v93, v121, 16);
      if (v68)
      {
        v69 = v68;
        v70 = *(_QWORD *)v94;
        do
        {
          for (m = 0; m != v69; ++m)
          {
            if (*(_QWORD *)v94 != v70)
              objc_enumerationMutation(v67);
            v72 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * m);
            v73 = (void *)MEMORY[0x1AF43CC0C]();
            objc_msgSend(v72, "objectAtIndexedSubscript:", 0);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v74, "longLongValue");
            objc_msgSend(v72, "objectAtIndexedSubscript:", 1);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = (int)objc_msgSend(v76, "intValue");
            objc_msgSend(v72, "objectAtIndexedSubscript:", 2);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[ML3MusicLibrary updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:](v91, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:", v75, v77, (int)objc_msgSend(v78, "intValue"), v92, 0.0);

            objc_autoreleasePoolPop(v73);
          }
          v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v93, v121, 16);
        }
        while (v69);
      }

      v47 = v85;
      v48 = v82;
    }

    v8 = v88;
  }
  v79 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
  {
    v80 = objc_msgSend(v86, "count");
    *(_DWORD *)buf = 134217984;
    v129 = v80;
    _os_log_impl(&dword_1AC149000, v79, OS_LOG_TYPE_ERROR, "Deleting %ld orphaned artwork assets.", buf, 0xCu);
  }

  -[ML3MusicLibrary _deleteAllArtworkVariantsAtRelativePaths:](v91, "_deleteAllArtworkVariantsAtRelativePaths:", v86);
  return 1;
}

- (BOOL)_removeInvalidAvailableArtworkTokensUsingConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  void *v15;
  int v16;
  ML3MusicLibrary *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id obj;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1AF43CC0C]();
  objc_msgSend(v4, "executeQuery:", CFSTR("SELECT entity_pid, entity_type, best_artwork_token.artwork_type, available_artwork_token FROM best_artwork_token LEFT OUTER JOIN artwork ON available_artwork_token = artwork_token WHERE available_artwork_token != '' AND artwork_token IS NULL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __71__ML3MusicLibrary__removeInvalidAvailableArtworkTokensUsingConnection___block_invoke;
  v36[3] = &unk_1E5B65EE0;
  v8 = v5;
  v37 = v8;
  objc_msgSend(v7, "enumerateRowsWithBlock:", v36);

  objc_autoreleasePoolPop(v6);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v8;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
  if (v30)
  {
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        context = (void *)MEMORY[0x1AF43CC0C]();
        v12 = os_log_create("com.apple.amp.medialibrary", "Library");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v29, "longLongValue");
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v9;
          v14 = objc_msgSend(v28, "intValue");
          objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "intValue");
          objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
          v17 = self;
          v18 = v4;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v39 = v27;
          v40 = 1024;
          v41 = v14;
          v9 = v13;
          v42 = 1024;
          v43 = v16;
          v44 = 2114;
          v45 = v19;
          _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Updating best tokens for entity_pid = %lld entity_type = %d artwork_type = %d with invalid available token %{public}@", buf, 0x22u);

          v4 = v18;
          self = v17;

        }
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "longLongValue");
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (int)objc_msgSend(v22, "intValue");
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ML3MusicLibrary updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:](self, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:", v21, v23, (int)objc_msgSend(v24, "intValue"), 0, v4, 0.0);

        objc_autoreleasePoolPop(context);
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    }
    while (v30);
  }

  return 1;
}

- (void)_convertOriginalArtworkToDevicePreferredFormatFromSourceURL:(id)a3 toDestinationURL:(id)a4 completionHandler:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v7 = (objc_class *)MEMORY[0x1E0D4D018];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = (id)objc_msgSend([v7 alloc], "initWithSourceURL:destinationURL:destinationFormat:", v10, v9, 0);

  objc_msgSend(v12, "setDestinationCompressionQuality:", 0.9);
  objc_msgSend(MEMORY[0x1E0D4D008], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendRequest:completionHandler:", v12, v8);

}

- (void)_autogenerateArtworkForRelativePath:(id)a3 artworkType:(int64_t)a4 mediaType:(unsigned int)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = *(_QWORD *)&a5;
  v13 = a3;
  v10 = a6;
  +[ML3ArtworkConfiguration systemConfiguration](ML3ArtworkConfiguration, "systemConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizesToAutogenerateForMediaType:artworkType:", v7, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    -[ML3MusicLibrary generateArtworkForRelativePath:sizes:completionHandler:](self, "generateArtworkForRelativePath:sizes:completionHandler:", v13, v12, v10);
  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD, double, double))v10 + 2))(v10, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }

}

- (void)_createColorAnalysisForRelativePath:(id)a3 artworkType:(int64_t)a4 artworkToken:(id)a5 preferredImageSize:(CGSize)a6 completionHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  ML3MusicLibrary *v23;
  id v24;
  int64_t v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  height = a6.height;
  width = a6.width;
  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a7;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D010]), "initWithSourceURL:preferredImageSize:", v16, width, height);
    objc_msgSend(MEMORY[0x1E0D4D008], "sharedService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __117__ML3MusicLibrary__createColorAnalysisForRelativePath_artworkType_artworkToken_preferredImageSize_completionHandler___block_invoke;
    v20[3] = &unk_1E5B5D240;
    v21 = v13;
    v25 = a4;
    v22 = v14;
    v23 = self;
    v24 = v15;
    objc_msgSend(v18, "sendRequest:completion:", v17, v20);

  }
  else
  {
    v19 = os_log_create("com.apple.amp.medialibrary", "Artwork");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_ERROR, "Failed to create color analysis for artwork: %{public}@. Relative path is nil.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "ml_errorWithCode:", 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      (*((void (**)(id, void *))v15 + 2))(v15, v16);
  }

}

- (id)_newGeniusDBConnectionAtPath:(id)a3
{
  id v3;
  void *v4;
  ML3DatabaseConnection *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
    v5 = -[ML3DatabaseConnection initWithDatabasePath:]([ML3DatabaseConnection alloc], "initWithDatabasePath:", v3);
  else
    v5 = 0;

  return v5;
}

- (void)_teardownMediaLibraryDatabaseConnection:(id)a3
{
  NSObject *serialQueue;
  id v5;
  sqlite3 *v6;

  serialQueue = self->_serialQueue;
  v5 = a3;
  dispatch_assert_queue_not_V2(serialQueue);
  v6 = (sqlite3 *)objc_msgSend(v5, "_sqliteHandle");

  if (v6)
    iPhoneSortKeyBuilderUninstallSqlite3((int)-[ML3MusicLibrary sortKeyBuilder](self, "sortKeyBuilder"), v6);
}

- (BOOL)_clearAllRowsFromTables:(id)a3
{
  id v4;
  id v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2077;
  v23 = __Block_byref_object_dispose__2078;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__ML3MusicLibrary__clearAllRowsFromTables___block_invoke;
  v15[3] = &unk_1E5B63180;
  v5 = v4;
  v16 = v5;
  v17 = &v25;
  v18 = &v19;
  -[ML3MusicLibrary performDatabaseTransactionWithBlock:](self, "performDatabaseTransactionWithBlock:", v15);
  v6 = *((unsigned __int8 *)v26 + 24);
  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v30 = v5;
      v9 = "Succesfully emptied tables in media library database: %{public}@";
      v10 = v7;
      v11 = 12;
LABEL_6:
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else if (v8)
  {
    v12 = v20[5];
    *(_DWORD *)buf = 138543618;
    v30 = v5;
    v31 = 2114;
    v32 = v12;
    v9 = "Failed to empty tables: %{public}@ with error: %{public}@";
    v10 = v7;
    v11 = 22;
    goto LABEL_6;
  }

  v13 = *((_BYTE *)v26 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

- (void)_effectiveSettingsDidChangeNotification:(id)a3
{
  id v4;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  pthread_mutex_lock(&sRestrictionSettingsLock);
  sRestrictionSettingsInfo = 0;
  pthread_mutex_unlock(&sRestrictionSettingsLock);
  -[ML3MusicLibrary notificationManager](self, "notificationManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueLocalNotificationNamed:", CFSTR("ML3MusicLibraryContentsDidChangeNotification"));

}

- (void)_libraryPathDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  ML3MusicLibrary *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (__daemonProcessInfo)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v8 = self;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - Received MLUserDatabasePathDidChangeNotification in medialibraryd which is unexpected", buf, 0xCu);
    }

  }
  else
  {
    -[ML3MusicLibrary _setupNotificationManager](self, "_setupNotificationManager", a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("ML3MusicLibraryPathDidChangeNotification"), self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("ML3MusicLibraryContentsDidChangeNotification"), self);

  }
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, id);
  BOOL v9;
  NSObject *v10;
  _BOOL4 v11;
  BOOL v12;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  ML3MusicLibrary *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, id))a4;
  v9 = -[ML3MusicLibrary _shouldProcessAccountChanges](self, "_shouldProcessAccountChanges");
  v10 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - Process started", buf, 0xCu);
    }

    v15 = 0;
    v12 = -[ML3MusicLibrary _prepareForAccountChange:](self, "_prepareForAccountChange:", &v15);
    v13 = v15;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3MusicLibrary.m"), 4148, CFSTR("ML3MusicLibrary %p - Database path change failure [unable to close connection pools] - error=%@"), self, v13);

    }
    -[ML3MusicLibrary _completeAccountChangeWithPath:](self, "_completeAccountChangeWithPath:", v7);
    v8[2](v8, 1, v13);

    v8 = (void (**)(id, uint64_t, id))v13;
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - No action to take [returning early]", buf, 0xCu);
    }

    v8[2](v8, 0, 0);
  }

}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  void (**v5)(id, _BOOL8, _QWORD);
  NSObject *v6;
  _BOOL8 v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  ML3MusicLibrary *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _BOOL8, _QWORD))a3;
  v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - emergencyDisconnectWithCompletion:", buf, 0xCu);
  }

  v7 = -[ML3MusicLibrary _shouldProcessAccountChanges](self, "_shouldProcessAccountChanges");
  if (v7)
  {
    if (!-[ML3MusicLibrary _prepareForAccountChange:](self, "_prepareForAccountChange:", 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3MusicLibrary.m"), 4162, CFSTR("ML3MusicLibrary %p - Unable to prepare for account changes during emergency disconnect"), self);

    }
    -[ML3MusicLibrary _completeAccountChangeWithPath:](self, "_completeAccountChangeWithPath:", 0);
  }
  else
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - emergencyDisconnectWithCompletion: - No action to take [returning early]", buf, 0xCu);
    }

  }
  v5[2](v5, v7, 0);

}

- (void)terminateForFailureToPerformDatabasePathChange
{
  NSObject *v3;
  ML3MusicLibrary *v4;
  uint8_t buf[4];
  ML3MusicLibrary *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[ML3MusicLibrary _shouldProcessAccountChanges](self, "_shouldProcessAccountChanges"))
  {
    v4 = self;
    _ML3LogCategoryMultiUser();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "%{public}@ - terminateForFailureToPerformDatabasePathChange [unresponsive process]", buf, 0xCu);
    }

    exit(0);
  }
}

- (BOOL)_prepareForAccountChange:(id *)a3
{
  NSObject *v4;
  uint8_t buf[4];
  ML3MusicLibrary *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - _prepareForAccountChange", buf, 0xCu);
  }

  -[ML3MusicLibrary _closeAndLockCurrentDatabaseConnections](self, "_closeAndLockCurrentDatabaseConnections");
  -[ML3MusicLibrary _tearDownNotificationManager](self, "_tearDownNotificationManager");
  return 1;
}

- (void)_completeAccountChangeWithPath:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *serialQueue;
  id v7;
  NSString *libraryUID;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ML3MusicLibrary *v13;
  id v14;
  uint8_t buf[4];
  ML3MusicLibrary *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - _completeAccountChangeWithPath - New database path: %{public}@", buf, 0x16u);
  }

  +[ML3MusicLibrary setAutoupdatingSharedLibraryPath:](ML3MusicLibrary, "setAutoupdatingSharedLibraryPath:", v4);
  serialQueue = self->_serialQueue;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50__ML3MusicLibrary__completeAccountChangeWithPath___block_invoke;
  v12 = &unk_1E5B65EB8;
  v13 = self;
  v14 = v4;
  v7 = v4;
  dispatch_sync(serialQueue, &v9);
  -[NSLock lock](self->_libraryUIDLock, "lock", v9, v10, v11, v12, v13);
  libraryUID = self->_libraryUID;
  self->_libraryUID = 0;

  -[NSLock unlock](self->_libraryUIDLock, "unlock");
}

- (BOOL)_shouldProcessAccountChanges
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ML3MusicLibrary__shouldProcessAccountChanges__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_closeAndLockCurrentDatabaseConnections
{
  NSObject *v3;
  NSObject *serialQueue;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD block[6];
  uint8_t v12[4];
  ML3MusicLibrary *v13;
  __int16 v14;
  uint64_t v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _closeAndLockCurrentDatabaseConnections", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2077;
  v19 = __Block_byref_object_dispose__2078;
  v20 = 0;
  serialQueue = self->_serialQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ML3MusicLibrary__closeAndLockCurrentDatabaseConnections__block_invoke;
  block[3] = &unk_1E5B65E48;
  block[4] = self;
  block[5] = &buf;
  dispatch_sync(serialQueue, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("ML3MusicLibraryWillInvalidateDatabaseConnectionNotification"), self);

  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "lockAndCloseAllConnectionsForTermination");
  v7 = self->_serialQueue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __58__ML3MusicLibrary__closeAndLockCurrentDatabaseConnections__block_invoke_2;
  v10[3] = &unk_1E5B65E48;
  v10[4] = self;
  v10[5] = &buf;
  dispatch_sync(v7, v10);
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - connection pool %{public}@ locked and closed", v12, 0x16u);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)_tearDownNotificationManager
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *serialQueue;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[4];
  ML3MusicLibrary *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - _tearDownNotificationManager", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "distributedToLocalNotificationMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__ML3MusicLibrary__tearDownNotificationManager__block_invoke;
  v8[3] = &unk_1E5B65448;
  v8[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  serialQueue = self->_serialQueue;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __47__ML3MusicLibrary__tearDownNotificationManager__block_invoke_2;
  v7[3] = &unk_1E5B65D80;
  v7[4] = self;
  dispatch_sync(serialQueue, v7);
}

- (void)_postClientNotificationWithDistributedName:(id)a3 localName:(id)a4
{
  NSObject *serialQueue;
  id v7;
  id v8;
  void *v9;
  id v10;

  serialQueue = self->_serialQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_not_V2(serialQueue);
  -[ML3MusicLibrary notificationManager](self, "notificationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueLocalNotificationNamed:", v7);

  -[ML3MusicLibrary notificationManager](self, "notificationManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueDistributedNotificationNamed:", v8);

}

- (CGSize)_sizeForColorAnalysisForMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double v9;
  float v10;
  double v11;
  double v12;
  _QWORD v13[5];
  uint64_t v14;
  float *v15;
  uint64_t v16;
  int v17;
  uint8_t buf[4];
  double v19;
  uint64_t v20;
  CGSize result;

  v5 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  +[ML3ArtworkConfiguration systemConfiguration](ML3ArtworkConfiguration, "systemConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizesToAutogenerateForMediaType:artworkType:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = (float *)&v14;
  v16 = 0x2020000000;
  v17 = -8388609;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__ML3MusicLibrary__sizeForColorAnalysisForMediaType_artworkType___block_invoke;
  v13[3] = &unk_1E5B5D2C8;
  v13[4] = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  v8 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v15[6];
    *(_DWORD *)buf = 134217984;
    v19 = v9;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "Size to use for color analysis: %f", buf, 0xCu);
  }

  v10 = v15[6];
  _Block_object_dispose(&v14, 8);

  v11 = v10;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManager, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSString)accountDSID
{
  return self->_accountDSID;
}

- (ML3MusicLibraryDelegate)delegate
{
  return (ML3MusicLibraryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setIsUnitTesting:(BOOL)a3
{
  self->_isUnitTesting = a3;
}

- (NSArray)libraryEntityFilterPredicates
{
  return self->_libraryEntityFilterPredicates;
}

- (NSArray)libraryContainerFilterPredicates
{
  return self->_libraryContainerFilterPredicates;
}

- (NSArray)libraryPublicEntityFilterPredicates
{
  return self->_libraryPublicEntityFilterPredicates;
}

- (NSArray)libraryPublicContainerFilterPredicates
{
  return self->_libraryPublicContainerFilterPredicates;
}

- (BOOL)isUsingSharedLibraryPath
{
  return self->_usingSharedLibraryPath;
}

- (void)setUsingSharedLibraryPath:(BOOL)a3
{
  self->_usingSharedLibraryPath = a3;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryPublicContainerFilterPredicates, 0);
  objc_storeStrong((id *)&self->_libraryPublicEntityFilterPredicates, 0);
  objc_storeStrong((id *)&self->_libraryContainerFilterPredicates, 0);
  objc_storeStrong((id *)&self->_libraryEntityFilterPredicates, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_resourcesManager, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_connectionPool, 0);
  objc_storeStrong((id *)&self->_connectionPoolsPendingClose, 0);
  objc_storeStrong((id *)&self->_optimizedLibraryPublicContainerFilterPredicatesByContainerClass, 0);
  objc_storeStrong((id *)&self->_optimizedLibraryPublicEntityFilterPredicatesByEntityClass, 0);
  objc_storeStrong((id *)&self->_optimizedLibraryContainerFilterPredicatesByContainerClass, 0);
  objc_storeStrong((id *)&self->_optimizedLibraryEntityFilterPredicatesByEntityClass, 0);
  objc_storeStrong((id *)&self->_privacyContext, 0);
  objc_storeStrong((id *)&self->_accountCacheDatabase, 0);
  objc_storeStrong((id *)&self->_syncLibraryUID, 0);
  objc_storeStrong((id *)&self->_libraryUIDLock, 0);
  objc_storeStrong((id *)&self->_libraryUID, 0);
}

float __65__ML3MusicLibrary__sizeForColorAnalysisForMediaType_artworkType___block_invoke(uint64_t a1, void *a2)
{
  float result;
  uint64_t v4;
  double v5[2];

  v5[0] = 0.0;
  v5[1] = 0.0;
  objc_msgSend(a2, "getValue:", v5);
  result = *(float *)v5;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v5[0] > *(float *)(v4 + 24))
  {
    result = v5[0];
    *(float *)(v4 + 24) = result;
  }
  return result;
}

void __47__ML3MusicLibrary__tearDownNotificationManager__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "notificationManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserverWithDistributedName:", v3);

}

void __47__ML3MusicLibrary__tearDownNotificationManager__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 136);
  *(_QWORD *)(v1 + 136) = 0;

}

void __58__ML3MusicLibrary__closeAndLockCurrentDatabaseConnections__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

}

void __58__ML3MusicLibrary__closeAndLockCurrentDatabaseConnections__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
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
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "isClosedWithNoActiveOrBusyConnections"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDelegate:", 0);
      v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v3 = *(void **)(v2 + 40);
      *(_QWORD *)(v2 + 40) = 0;

    }
    else
    {
      v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v7 = 138543618;
        v8 = v5;
        v9 = 2114;
        v10 = v6;
        _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - connection pool %{public}@ has pending or active connections", (uint8_t *)&v7, 0x16u);
      }

    }
  }
}

uint64_t __47__ML3MusicLibrary__shouldProcessAccountChanges__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[81])
    result = 0;
  else
    result = objc_msgSend(v2, "isUsingSharedLibraryPath");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __50__ML3MusicLibrary__completeAccountChangeWithPath___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
}

uint64_t __43__ML3MusicLibrary__clearAllRowsFromTables___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@"), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v10 + 40);
      v11 = objc_msgSend(v3, "executeUpdate:withParameters:error:", v9, 0, &obj);
      objc_storeStrong((id *)(v10 + 40), obj);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(_BYTE *)(v12 + 24) ? v11 : 0;
      *(_BYTE *)(v12 + 24) = v13;

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return v14;
}

void __60__ML3MusicLibrary__configureMediaLibraryDatabaseConnection___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  uint64_t v5;
  int v6;

  v5 = sqlite3_value_int(*a4);
  v6 = MLMediaTypeByStandardizingMediaType(v5);
  sqlite3_result_int(a2, v6);
}

void __117__ML3MusicLibrary__createColorAnalysisForRelativePath_artworkType_artworkToken_preferredImageSize_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  ML3ArtworkColorAnalysis *v8;
  uint64_t v9;
  uint64_t v10;
  ML3Artwork *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  v8 = (ML3ArtworkColorAnalysis *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_1AC149000, &v8->super, OS_LOG_TYPE_ERROR, "Failed to create color analysis for relative path: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_1AC149000, &v8->super, OS_LOG_TYPE_INFO, "Created color analysis for relative path: %{public}@", buf, 0xCu);
    }

    v8 = -[ML3ArtworkColorAnalysis initWithColorAnalysis:]([ML3ArtworkColorAnalysis alloc], "initWithColorAnalysis:", v5);
    v11 = -[ML3Artwork initWithToken:artworkType:musicLibrary:]([ML3Artwork alloc], "initWithToken:artworkType:musicLibrary:", a1[5], a1[8], a1[6]);
    v19 = CFSTR("ColorAnalysis");
    objc_msgSend(&unk_1E5BAAD40, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3ArtworkColorAnalysis dictRepresentation](v8, "dictRepresentation", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[ML3Artwork setInterestDictionary:](v11, "setInterestDictionary:", v15);
  }

  v16 = a1[7];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);

}

void __71__ML3MusicLibrary__removeInvalidAvailableArtworkTokensUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

}

void __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "stringForColumnIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke_580(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "stringForColumnIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

}

void __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "intForColumnIndex:", 1);
  objc_msgSend(v3, "stringForColumnIndex:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "intForColumnIndex:", 3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  v8 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109890;
    v9[1] = v7;
    v10 = 1024;
    v11 = v5;
    v12 = 2114;
    v13 = v4;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "Found orphaned artwork (type=%d, source=%d) in database with token: %{public}@ relative path: %{public}@", (uint8_t *)v9, 0x22u);
  }

}

void __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_566(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "dataForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_2;
  v6[3] = &unk_1E5B5D218;
  v8 = v4;
  v7 = *(id *)(a1 + 32);
  +[MLITChapterTOC enumerateChapterTimesInFlattenedChapterData:usingBlock:](MLITChapterTOC, "enumerateChapterTimesInFlattenedChapterData:usingBlock:", v5, v6);

}

void __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1[4], "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(a1[5], "addObject:", v4);
    objc_msgSend(a1[6], "addObject:", v5);
    v6 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Found orphaned chapter artwork in database with token: %{public}@ relative path: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_2(uint64_t a1)
{
  id v2;

  +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

void __63__ML3MusicLibrary__removeOrphanedArtworkTokensUsingConnection___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  char v18;
  id v19;
  char v20;
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("DELETE FROM artwork_token WHERE entity_type = ? AND entity_pid NOT IN (SELECT ROWID FROM %@)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM best_artwork_token WHERE entity_type = ? AND entity_pid NOT IN (SELECT ROWID FROM %@)"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 32);
  v23 = 0;
  v14 = objc_msgSend(v13, "executeUpdate:withParameters:error:", v10, v12, &v23);
  v15 = v23;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "Failed to remove orphaned artwork tokens with error: %{public}@", buf, 0xCu);
    }

    v15 = 0;
  }
  v17 = *(void **)(a1 + 32);
  v22 = v15;
  v18 = objc_msgSend(v17, "executeUpdate:withParameters:error:", v11, v12, &v22);
  v19 = v22;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v18;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v20 = 0;
  }
  else
  {
    v21 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "Failed to remove orphaned best artwork tokens with error: %{public}@", buf, 0xCu);
    }

    v20 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
  }
  *a4 = v20;

}

void __161__ML3MusicLibrary__determineAndUpdateBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_preserveExistingAvailableToken_usingConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  id obj;

  v6 = a2;
  objc_msgSend(v6, "stringForColumnIndex:", 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "intForColumnIndex:", 1);
  v8 = objc_msgSend(v6, "intForColumnIndex:", 2);

  if (v8)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      goto LABEL_14;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
    if ((_DWORD)v7 != 100 && (_DWORD)v7 != 200 && (_DWORD)v7 != 300)
      goto LABEL_14;
LABEL_13:
    *a4 = 1;
    goto LABEL_14;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v9 = 1;
  else
    v9 = (_DWORD)v7 == 0;
  if (!v9)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isArtworkFetchableForPersistentID:entityType:artworkType:artworkSourceType:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v7))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), obj);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        goto LABEL_13;
    }
  }
LABEL_14:

}

void __129__ML3MusicLibrary__updateBestArtworkTokensForArtworkToken_artworkType_sourceType_preserveExistingAvailableToken_usingConnection___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v8)
  {
    v9 = (void *)a1[4];
    v22[0] = v7;
    v22[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);
  }
  else
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[5];
      v12 = a1[6];
      v13 = a1[7];
      v14 = 138544130;
      v15 = v11;
      v16 = 1024;
      v17 = v12;
      v18 = 1024;
      v19 = v13;
      v20 = 2114;
      v21 = v5;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "Could not find artwork with token %{public}@, type=%d, source=%d - error=%{public}@", (uint8_t *)&v14, 0x22u);
    }
  }

}

uint64_t __89__ML3MusicLibrary__insertArtworkRowWithArtworkToken_artworkType_sourceType_relativePath___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:usingConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), a2);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

uint64_t __39__ML3MusicLibrary_updateTrackIntegrity__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "executeUpdate:", CFSTR("UPDATE item_extra SET integrity = (SELECT ML3TrackIntegrityCompute(item.item_pid, item.media_type, item_extra.location, item_extra.file_size) FROM item JOIN item_extra AS item_extra2 USING (item_pid) WHERE item_extra.item_pid = item.item_pid)"));
}

void __42__ML3MusicLibrary_verifyPresignedValidity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v22[0] = v4;
  v5 = (void *)objc_opt_new();
  v22[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v9 = v7;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v3, "tableExists:", v13);

        if (!v14)
        {
          v9 = v7;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }

    objc_msgSend(v3, "executeQuery:", CFSTR("SELECT ML3TrackDigestCompute(item.item_pid, item.media_type, item_extra.location, item_extra.file_size) FROM item JOIN item_extra USING (item_pid) ORDER BY item_pid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__ML3MusicLibrary_verifyPresignedValidity__block_invoke_2;
    v15[3] = &unk_1E5B65EE0;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v9, "enumerateRowsWithBlock:", v15);

  }
LABEL_11:

}

uint64_t __42__ML3MusicLibrary_verifyPresignedValidity__block_invoke_2(uint64_t a1, void *a2)
{
  int v4;
  uint64_t v5;

  v5 = 0;
  v4 = 0;
  objc_msgSend(a2, "getBlobBytes:outLength:forColumnIndex:", &v5, &v4, 0);
  return objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", v5, v4);
}

void __42__ML3MusicLibrary_deleteDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM _MLDatabaseProperties WHERE key = ?"), v5, 0, v7, v8);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
}

void __89__ML3MusicLibrary_removeItemsWithFamilyAccountID_purchaserAccountID_downloaderAccountID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __52__ML3MusicLibrary_removeOrphanedTracksOnlyInCaches___block_invoke(uint64_t a1, uint64_t a2, id *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = *a3;
  v5 = a3[1];
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

void __52__ML3MusicLibrary_removeOrphanedTracksOnlyInCaches___block_invoke_524(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  const char *v21;
  NSObject *v22;
  int *v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  uint32_t v28;
  char v29;
  void *v30;
  NSObject *v31;
  __darwin_ino64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  char *v45;
  stat v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pathForBaseLocationPath:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v3;
  objc_msgSend(v4, "enumeratorAtPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    v35 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1AF43CC0C]();
        objc_msgSend(v10, "pathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v13))
        {
          if (v13)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("movpkg"), CFSTR("m4bpkg"), 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "containsObject:", v13);

          }
          else
          {
            v15 = 0;
          }
          v16 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "containsObject:", v10);

          if (!v19)
          {
            objc_msgSend(v34, "stringByAppendingPathComponent:", v10);
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v21 = (const char *)objc_msgSend(v20, "fileSystemRepresentation");

            memset(&v46, 0, sizeof(v46));
            if (stat(v21, &v46))
            {
              v22 = os_log_create("com.apple.amp.medialibrary", "Library");
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                v23 = __error();
                v24 = strerror(*v23);
                *(_DWORD *)buf = 136446466;
                v43 = v21;
                v44 = 2082;
                v45 = v24;
                v25 = v22;
                v26 = OS_LOG_TYPE_ERROR;
                v27 = "Could not read old file: %{public}s, %{public}s";
                v28 = 22;
                goto LABEL_16;
              }
              goto LABEL_17;
            }
            if ((v46.st_mode & 0x4000) != 0)
              v29 = v15;
            else
              v29 = 1;
            if ((v29 & 1) != 0)
            {
              if (v46.st_mtimespec.tv_sec <= *(_QWORD *)(a1 + 56) - 300)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "addObject:", v30);

              }
              else
              {
                v22 = os_log_create("com.apple.amp.medialibrary", "Library");
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446210;
                  v43 = v21;
                  v25 = v22;
                  v26 = OS_LOG_TYPE_DEFAULT;
                  v27 = "Ignoring new unaccounted file %{public}s";
                  v28 = 12;
LABEL_16:
                  _os_log_impl(&dword_1AC149000, v25, v26, v27, buf, v28);
                }
LABEL_17:

              }
            }
            else
            {
              objc_msgSend(obj, "skipDescendants");
            }
            v8 = v35;
            goto LABEL_28;
          }
          v8 = v35;
          if (v15)
            objc_msgSend(obj, "skipDescendants");
        }
LABEL_28:

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v7);
  }

  v31 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = objc_msgSend(v33, "count");
    v46.st_dev = 138543874;
    *(_QWORD *)&v46.st_mode = v34;
    WORD2(v46.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v46.st_ino + 6) = v32;
    HIWORD(v46.st_gid) = 2114;
    *(_QWORD *)&v46.st_rdev = v33;
    _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_ERROR, "Track de-orphaning of '%{public}@']: removing %lu orphaned tracks at paths %{public}@", (uint8_t *)&v46, 0x20u);
  }

  ML3DeleteAssetsAtPaths(v33);
}

void __50__ML3MusicLibrary_removeTombstonesForDeletedItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "executeUpdate:", CFSTR("DELETE FROM item_store WHERE item_pid NOT IN (SELECT item_pid FROM item)"));
  objc_msgSend(v2, "executeUpdate:", CFSTR("DELETE FROM item_stats WHERE item_pid NOT IN (SELECT item_pid FROM item)"));

}

uint64_t __45__ML3MusicLibrary_cleanupArtworkWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "cleanupArtworkWithOptions:usingConnection:", *(_QWORD *)(a1 + 48), a2);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __62__ML3MusicLibrary_hasUserPlaylistsContainingAppleMusicContent__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "executeQuery:withParameters:", CFSTR("SELECT 1 FROM container_item JOIN container USING (container_pid) JOIN item_store USING (item_pid) WHERE cloud_status = ? AND NOT is_hidden AND distinguished_kind = ? AND smart_criteria IS NULL AND NOT smart_is_genius AND (NOT cloud_is_subscribed OR is_editable) LIMIT 1"), &unk_1E5BA8BF8);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "hasAtLeastOneRow");

}

void __53__ML3MusicLibrary_hasAddedToLibraryAppleMusicContent__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "executeQuery:", CFSTR("SELECT 1 FROM item JOIN item_store USING (item_pid) JOIN item_stats USING (item_pid) WHERE item.in_my_library AND item_store.cloud_status = 8 AND item_stats.liked_state != 2 LIMIT 1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "hasAtLeastOneRow");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(v5, "executeQuery:", CFSTR("SELECT 1 FROM container WHERE store_cloud_id != 0 AND cloud_is_subscribed AND liked_state != 2 LIMIT 1"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "hasAtLeastOneRow");
    v3 = v4;
  }

}

void __35__ML3MusicLibrary_hasUserPlaylists__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "executeQuery:withParameters:", CFSTR("SELECT 1 FROM container WHERE NOT is_hidden AND distinguished_kind = ? AND smart_criteria IS NULL AND NOT smart_is_genius AND (NOT cloud_is_subscribed OR is_editable) LIMIT 1"), &unk_1E5BA8BE0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "hasAtLeastOneRow");

}

void __43__ML3MusicLibrary_isArtworkTokenAvailable___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT 1 FROM artwork WHERE artwork_token=?"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ML3MusicLibrary_isArtworkTokenAvailable___block_invoke_2;
  v7[3] = &unk_1E5B65200;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "enumerateRowsWithBlock:", v7);

}

uint64_t __43__ML3MusicLibrary_isArtworkTokenAvailable___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

uint64_t __93__ML3MusicLibrary_removeArtworkTokenForEntityPersistentID_entityType_artworkType_sourceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeArtworkTokenForEntityPersistentID:entityType:artworkType:sourceType:usingConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a2);
}

uint64_t __106__ML3MusicLibrary_importArtworkTokenForEntityPersistentID_entityType_artworkToken_artworkType_sourceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:usingConnection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2);
}

void __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  __int128 v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("SELECT relative_path, artwork_type FROM artwork WHERE artwork_token = ?"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_2;
  v11[3] = &unk_1E5B65040;
  v12 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v5, "enumerateRowsWithBlock:", v11);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("SELECT entity_pid, entity_type, artwork_type FROM artwork_token WHERE artwork_token = ?"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_3;
    v9[3] = &unk_1E5B65EE0;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "enumerateRowsWithBlock:", v9);

    v5 = v8;
  }

}

uint64_t __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_493(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  uint64_t i;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  __int128 v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = *(id *)(a1 + 32);
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v33;
    *(_QWORD *)&v4 = 138543362;
    v25 = v4;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v31 = 0;
        v7 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?"), v6, &v31, v25);
        v8 = v31;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v7;
        v9 = v3;
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        {
          v10 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v37 = v8;
            _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "Failed to delete from artwork_token table with error: %{public}@", buf, 0xCu);
          }

        }
        v11 = *(void **)(a1 + 40);
        v12 = *(_QWORD *)(a1 + 88);
        objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v8;
        v14 = (int)objc_msgSend(v13, "intValue");
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "longLongValue");
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = InsertOrReplaceIntoArtworkToken(v9, v11, v12, v14, v16, (int)objc_msgSend(v17, "intValue"));

        v3 = v9;
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v28);
  }

  v40 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v19 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM artwork WHERE artwork_token = ?"), v18, &v30);
  v20 = v30;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v19;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v21 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v37 = v22;
      v38 = 2114;
      v39 = v20;
      _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "Failed to delete from artwork table (token = %{public}@) with error: %{public}@", buf, 0x16u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 56), "_insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:usingConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 24), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64), v3);
  v23 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

  return v23;
}

void __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v6 = a2;
  objc_msgSend(v6, "stringForColumnIndex:", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = objc_msgSend(v6, "intForColumnIndex:", 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  *a4 = 1;
}

void __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

}

void __38__ML3MusicLibrary_deleteArtworkToken___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  os_log_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  os_log_t obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  _QWORD v48[4];

  v48[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("SELECT entity_pid, entity_type, artwork_type FROM artwork_token WHERE artwork_token = ?"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __38__ML3MusicLibrary_deleteArtworkToken___block_invoke_2;
  v41[3] = &unk_1E5B65EE0;
  v7 = v4;
  v42 = v7;
  objc_msgSend(v6, "enumerateRowsWithBlock:", v41);
  v40 = 0;
  v8 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM artwork_token WHERE artwork_token = ?"), v5, &v40);
  v9 = v40;
  v10 = v9;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v8;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v39 = v9;
    v11 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM artwork WHERE artwork_token = ?"), v5, &v39);
    v12 = v39;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v11;
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v13 = (os_log_t)v7;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (v14)
      {
        v15 = v14;
        v29 = v12;
        v30 = v7;
        v31 = v6;
        v32 = v5;
        obj = v13;
        v34 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            v17 = v3;
            if (*(_QWORD *)v36 != v34)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            v19 = (void *)a1[5];
            objc_msgSend(v18, "objectAtIndexedSubscript:", 0, v29, v30, v31, v32);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "longLongValue");
            objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (int)objc_msgSend(v22, "intValue");
            objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "intValue");
            v26 = v21;
            v3 = v17;
            objc_msgSend(v19, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:", v26, v23, v25, v17, 0.0);

          }
          v13 = obj;
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        }
        while (v15);
        v6 = v31;
        v5 = v32;
        v12 = v29;
        v7 = v30;
      }
    }
    else
    {
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v28 = a1[4];
        *(_DWORD *)buf = 138543618;
        v44 = v28;
        v45 = 2114;
        v46 = v12;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "Failed to delete from artwork table (token = %{public}@) with error: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v27 = a1[4];
      *(_DWORD *)buf = 138543618;
      v44 = v27;
      v45 = 2114;
      v46 = v10;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "Failed to delete from artwork_token table (token = %{public}@) with error: %{public}@", buf, 0x16u);
    }
    v12 = v10;
  }

}

void __38__ML3MusicLibrary_deleteArtworkToken___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

}

void __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT artwork_source_type, relative_path, artwork_type FROM artwork WHERE artwork_token = ?"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke_2;
  v7[3] = &unk_1E5B62B78;
  v8 = *(_OWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v6, "enumerateRowsWithBlock:", v7);

}

uint64_t __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM artwork WHERE artwork_token = ?"), v4, &v14);
  v6 = v14;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateBestArtworkTokensForArtworkToken:artworkType:sourceType:preserveExistingAvailableToken:usingConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), 0, v3);
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "Explicitly deleting artwork at relative path %{public}@", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_deleteAllArtworkVariantsAtRelativePaths:", v10);
  }
  else
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "Failed to delete from artwork table (token = %{public}@) with error: %{public}@", buf, 0x16u);
    }
  }

  v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return v12;
}

void __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = (int)objc_msgSend(v6, "intForColumnIndex:", 0);
  objc_msgSend(v6, "stringForColumnIndex:", 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = objc_msgSend(v6, "intForColumnIndex:", 2);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v10;
  *a4 = 1;
}

void __142__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v11 = 0;
  v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v11);
  v7 = v11;
  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "Failed to remove temporary artwork file: '%{public}@'. err = %{public}@", buf, 0x16u);
    }

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __131__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "Failed to convert original artwork with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __131__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke_482(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  id v9;

  if (a5)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "absoluteString");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), 0, a2, a3);

    }
  }
}

void __140__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v3;
      v22 = 2114;
      v23 = v5;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "importOriginalArtworkFromFileURL failed to convert original artwork with error: %{public}@ error=%{public}@", buf, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "_insertArtworkRowWithArtworkToken:artworkType:sourceType:relativePath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48)) & 1) != 0)
  {
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(unsigned int *)(a1 + 80);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __140__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke_479;
    v14[3] = &unk_1E5B5CF10;
    v19 = *(_BYTE *)(a1 + 84);
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 32);
    v18 = v7;
    v16 = v9;
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v15, "_autogenerateArtworkForRelativePath:artworkType:mediaType:completionHandler:", v10, v7, v8, v14);

  }
  else
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "importOriginalArtworkFromFileURL failed to insert into artwork table", buf, 2u);
    }

    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ML3DatabaseErrorDomain"), 0, CFSTR("Failed to insert row for artwork"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    }
  }

}

void __140__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke_479(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  if (v9)
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "msv_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "importOriginalArtworkFromFileURL failed to convert original artwork with error: %{public}@ error=%{public}@", (uint8_t *)&v16, 0x16u);

    }
  }
  if (v10 && *(_BYTE *)(a1 + 64))
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v10, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, a4, a5);

  }
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v9);

}

void __129__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "Failed to convert original artwork with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __129__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke_474(uint64_t a1, double a2, double a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;

  if (a5)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(a5, "absoluteString");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, a2, a3);

    }
  }
}

void __98__ML3MusicLibrary_importExistingOriginalArtworkWithArtworkToken_artworkType_sourceType_mediaType___block_invoke(_QWORD *a1, double a2, double a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;

  if (a5)
  {
    v8 = (void *)a1[4];
    objc_msgSend(a5, "absoluteString");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v9, a1[6], a1[5], 0, a2, a3);

  }
}

void __94__ML3MusicLibrary_performColorAnalysisForArtworkWithConnection_shouldRegenerateColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v3, "intForColumnIndex:", 1);
  v6 = objc_msgSend(v3, "intForColumnIndex:", 2);
  objc_msgSend(v3, "stringForColumnIndex:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_sizeForColorAnalysisForMediaType:artworkType:", v6, v5);
  v9 = v8;
  v11 = v10;
  v12 = (void *)MEMORY[0x1E0C99E98];
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "originalArtworkDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pathWithComponents:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:isDirectory:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543362;
    v22 = v7;
    _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "Creating color analysis for artwork token: %{public}@", (uint8_t *)&v21, 0xCu);
  }

  if (v7)
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v17, "absoluteString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v20, v5, v7, &__block_literal_global_473, v9, v11);

  }
}

void __94__ML3MusicLibrary_performColorAnalysisForArtworkWithConnection_shouldRegenerateColorAnalysis___block_invoke_472(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "_ML3MigrationExecuteDirectives - Color analysis for library artwork is completed error=%{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "_ML3MigrationExecuteDirectives - Color analysis for library artwork is completed", (uint8_t *)&v6, 2u);
  }

}

void __74__ML3MusicLibrary_generateArtworkForRelativePath_sizes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__ML3MusicLibrary_generateArtworkForRelativePath_sizes_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5B5CE50;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "enumerateDestinationsUsingBlock:", v7);
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 64), *(double *)(a1 + 72));

}

void __74__ML3MusicLibrary_generateArtworkForRelativePath_sizes_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a2, "destinationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!*(_QWORD *)(a1 + 32)
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "fileExistsAtPath:", v6),
        v4,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "updatePurgeabilityForCachedArtworkWithAbsolutePath:", v6);
  }

}

void __99__ML3MusicLibrary_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v8, "stringForColumnIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (int)objc_msgSend(v8, "intForColumnIndex:", 1);
  v11 = objc_msgSend(v8, "intForColumnIndex:", 2);

  +[ML3ArtworkConfiguration systemConfiguration](ML3ArtworkConfiguration, "systemConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizesToAutogenerateForMediaType:artworkType:", v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v15;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error enumerating artwork paths. error=%{public}@", (uint8_t *)&v16, 0x16u);
    }

    *a4 = 1;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __99__ML3MusicLibrary_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block___block_invoke_461(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v8, "stringForColumnIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "intForColumnIndex:", 1);

  v11 = v10;
  +[ML3ArtworkConfiguration systemConfiguration](ML3ArtworkConfiguration, "systemConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizesToAutogenerateForMediaType:artworkType:", 8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v15;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error enumerating hero artwork paths. error=%{public}@", (uint8_t *)&v16, 0x16u);
    }

    *a4 = 1;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v5 = *(NSObject **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  dispatch_group_enter(v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5B5CDD8;
  v8 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v8, "generateArtworkForRelativePath:sizes:completionHandler:", v7, v6, v9);

}

uint64_t __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

void __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __101__ML3MusicLibrary_countOfChangedPersistentIdsAfterRevision_revisionTrackingCode_maximumRevisionType___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "executeQuery:withParameters:", a1[4], a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "int64ValueForFirstRowAndColumn");

}

void __74__ML3MusicLibrary_persistentID_changedAfterRevision_revisionTrackingCode___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[7]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:withParameters:", CFSTR("SELECT 1 FROM entity_revision WHERE entity_pid = ? AND class = ? AND revision > ? "), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v10, "hasAtLeastOneRow");
}

void __108__ML3MusicLibrary_getChangedPersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  v12 = (id)objc_msgSend(CFSTR("SELECT entity_pid, class FROM entity_revision WHERE revision > ?"), "mutableCopy");
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, 0);

  if (*(_DWORD *)(a1 + 72) <= 2u)
  {
    objc_msgSend(v12, "appendString:", CFSTR(" AND revision_type <= ? "));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  objc_msgSend(v12, "appendString:", CFSTR(";"));
  objc_msgSend(v3, "executeQuery:withParameters:", v12, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__ML3MusicLibrary_getChangedPersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke_2;
  v13[3] = &unk_1E5B5CD60;
  v10 = *(_QWORD *)(a1 + 64);
  v14 = v9;
  v15 = *(_OWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = v10;
  v11 = v9;
  objc_msgSend(v8, "enumerateRowsWithBlock:", v13);

}

void __108__ML3MusicLibrary_getChangedPersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  char v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  v5 = objc_msgSend(v3, "intForColumnIndex:", 1);

  if (*(_QWORD *)(a1 + 64) == v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v11);
    v7 = (void *)v11;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(_QWORD *)(v8 + 24);
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v9 <= v10)
      {
        *(_QWORD *)(v8 + 24) = 2 * v9 + 2;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = malloc_type_realloc(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 24), 8* *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 24), 0x100004000313F17uLL);
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 8 * v10) = v4;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v7 = (void *)v11;
    }

  }
}

void __92__ML3MusicLibrary_enumerateAlbumPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "executeQuery:withParameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__ML3MusicLibrary_enumerateAlbumPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke_2;
  v4[3] = &unk_1E5B5F810;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

uint64_t __92__ML3MusicLibrary_enumerateAlbumPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "int64ForColumnIndex:", 1);
  objc_msgSend(v3, "int64ForColumnIndex:", 2);
  objc_msgSend(v3, "int64ForColumnIndex:", 3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__ML3MusicLibrary_enumerateAlbumArtistPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "executeQuery:withParameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__ML3MusicLibrary_enumerateAlbumArtistPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke_2;
  v4[3] = &unk_1E5B5F810;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

uint64_t __98__ML3MusicLibrary_enumerateAlbumArtistPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "int64ForColumnIndex:", 1);
  objc_msgSend(v3, "int64ForColumnIndex:", 2);
  objc_msgSend(v3, "int64ForColumnIndex:", 3);
  objc_msgSend(v3, "int64ForColumnIndex:", 4);
  objc_msgSend(v3, "intForColumnIndex:", 5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __107__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "executeQuery:withParameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __107__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke_2;
  v4[3] = &unk_1E5B5F810;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

uint64_t __107__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "int64ForColumnIndex:", 1);
  objc_msgSend(v3, "int64ForColumnIndex:", 2);
  objc_msgSend(v3, "intForColumnIndex:", 3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke_436(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "executeQuery:withParameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke_2;
  v4[3] = &unk_1E5B5F810;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

uint64_t __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "int64ForColumnIndex:", 1);
  objc_msgSend(v3, "int64ForColumnIndex:", 2);
  objc_msgSend(v3, "int64ForColumnIndex:", 3);
  objc_msgSend(v3, "intForColumnIndex:", 4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __32__ML3MusicLibrary_updateSortMap__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "updateSortMapOnConnection:forceUpdateOriginals:", a2, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __77__ML3MusicLibrary__getPlaylistContentTasteChangesSinceRevision_withGrappaID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "executeQuery:", CFSTR("SELECT primary_container_pid FROM db_info"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64ValueForFirstRowAndColumn");

}

void __77__ML3MusicLibrary__getPlaylistContentTasteChangesSinceRevision_withGrappaID___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CFAbsoluteTime v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _QWORD v25[3];
  uint8_t buf[4];
  uint64_t v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  if (a4 == 1 && *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) != a2)
  {
    v6 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", a2, a1[4]);
    v7 = CFSTR("is_hidden");
    v28[0] = CFSTR("is_hidden");
    v8 = CFSTR("sync_id");
    v28[1] = CFSTR("sync_id");
    v9 = CFSTR("liked_state");
    v28[2] = CFSTR("liked_state");
    v10 = CFSTR("liked_state_changed_date");
    v28[3] = CFSTR("liked_state_changed_date");
    MEMORY[0x1E0C80A78](v10);
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "getValues:forProperties:count:", &v22, v28, 4);
    if (objc_msgSend((id)v22, "BOOLValue"))
    {
      v11 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_DWORD *)buf = 134217984;
      v27 = a2;
      v12 = "Skip reverse syncing dynamic change for playlist persistentID=%lld as it's hidden";
    }
    else
    {
      if (*((_QWORD *)&v22 + 1))
      {
        v13 = objc_msgSend(*((id *)&v22 + 1), "longLongValue");
        if (v13)
        {
          v14 = v13;
          v25[0] = v23;
          v24[0] = CFSTR("likedState");
          v24[1] = CFSTR("likedMacOSDate");
          v15 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*((id *)&v23 + 1), "doubleValue");
          objc_msgSend(v15, "numberWithUnsignedInt:", ML3UInt32MacTimeFromCFAbsoluteTime(v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = v17;
          v24[2] = CFSTR("persistentID");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v25[2] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
          v11 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)a1[5];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v11, v20);

          goto LABEL_12;
        }
      }
      v11 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        for (i = 3; i != -1; --i)
        return;
      }
      *(_DWORD *)buf = 134217984;
      v27 = a2;
      v12 = "Skip reverse syncing dynamic change for playlist persistentID=%lld as syncID is 0";
    }
    _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    goto LABEL_12;
  }
}

void __61__ML3MusicLibrary_getAlbumChangesSinceRevision_withGrappaID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  os_log_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CFAbsoluteTime v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t i;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    v7 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Album, "newWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32));
    v8 = CFSTR("liked_state");
    v33[0] = CFSTR("liked_state");
    v9 = CFSTR("liked_state_changed_date");
    v33[1] = CFSTR("liked_state_changed_date");
    v10 = CFSTR("sync_id");
    v33[2] = CFSTR("sync_id");
    MEMORY[0x1E0C80A78](v10);
    v22 = 0;
    v23 = 0;
    v24 = 0;
    -[NSObject getValues:forProperties:count:](v7, "getValues:forProperties:count:", &v22, v33, 3);
    if (v24 && (v11 = objc_msgSend(v24, "longLongValue")) != 0)
    {
      v12 = v11;
      v32[0] = v22;
      v31[0] = CFSTR("likedState");
      v31[1] = CFSTR("likedMacOSDate");
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v23, "doubleValue");
      objc_msgSend(v13, "numberWithUnsignedInt:", ML3UInt32MacTimeFromCFAbsoluteTime(v14));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v15;
      v31[2] = CFSTR("persistentID");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v17, v19);

    }
    else
    {
      v17 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        v26 = 1;
        v27 = 2048;
        v28 = a3;
        v29 = 2048;
        v30 = a2;
        _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEFAULT, "Skip reverse syncing dynamic revision type=%d, revision=%lld album changes for pid=%lld as it's missing the syncID", buf, 0x1Cu);
      }
    }

    for (i = 2; i != -1; --i)
  }
  else
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v26 = a4;
      v27 = 2048;
      v28 = a3;
      v29 = 2048;
      v30 = a2;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Skip reverse syncing non dynamic revision type=%d, revision=%lld album changes for pid=%lld", buf, 0x1Cu);
    }
  }

}

void __67__ML3MusicLibrary_getAlbumArtistChangesSinceRevision_withGrappaID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  os_log_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CFAbsoluteTime v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t i;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    v7 = +[ML3Entity newWithPersistentID:inLibrary:](ML3AlbumArtist, "newWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32));
    v8 = CFSTR("liked_state");
    v33[0] = CFSTR("liked_state");
    v9 = CFSTR("liked_state_changed_date");
    v33[1] = CFSTR("liked_state_changed_date");
    v10 = CFSTR("sync_id");
    v33[2] = CFSTR("sync_id");
    MEMORY[0x1E0C80A78](v10);
    v22 = 0;
    v23 = 0;
    v24 = 0;
    -[NSObject getValues:forProperties:count:](v7, "getValues:forProperties:count:", &v22, v33, 3);
    if (v24 && (v11 = objc_msgSend(v24, "longLongValue")) != 0)
    {
      v12 = v11;
      v32[0] = v22;
      v31[0] = CFSTR("likedState");
      v31[1] = CFSTR("likedMacOSDate");
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v23, "doubleValue");
      objc_msgSend(v13, "numberWithUnsignedInt:", ML3UInt32MacTimeFromCFAbsoluteTime(v14));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v15;
      v31[2] = CFSTR("persistentID");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v17, v19);

    }
    else
    {
      v17 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        v26 = 1;
        v27 = 2048;
        v28 = a3;
        v29 = 2048;
        v30 = a2;
        _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEFAULT, "Skip reverse syncing dynamic revision type=%d, revision=%lld album artist changes for pid=%lld as it's missing the syncID", buf, 0x1Cu);
      }
    }

    for (i = 2; i != -1; --i)
  }
  else
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v26 = a4;
      v27 = 2048;
      v28 = a3;
      v29 = 2048;
      v30 = a2;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Skip reverse syncing non dynamic revision type=%d, revision=%lld album artist changes for pid=%lld", buf, 0x1Cu);
    }
  }

}

void __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "executeQuery:", CFSTR("SELECT primary_container_pid FROM db_info"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64ValueForFirstRowAndColumn");

}

void __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4, int a5)
{
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  ML3Track *v40;
  ML3Track *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  NSObject *v49;
  ML3Artwork *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  NSObject *v59;
  uint64_t i;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  id v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  id v82;
  id v83;
  ML3Artwork *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  ML3ArtworkTokenSet *v90;
  void *v91;
  uint64_t *v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  int v98;
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  id v103;
  _QWORD v104[3];
  _BYTE v105[24];
  const __CFString *v106;
  const __CFString *v107;
  const __CFString *v108;
  const __CFString *v109;
  const __CFString *v110;
  const __CFString *v111;
  const __CFString *v112;
  const __CFString *v113;
  const __CFString *v114;
  const __CFString *v115;
  const __CFString *v116;
  const __CFString *v117;
  const __CFString *v118;
  const __CFString *v119;
  const __CFString *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  if (a5 != 2 && *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != a2)
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v105 = 134218496;
      *(_QWORD *)&v105[4] = a2;
      *(_WORD *)&v105[12] = 2048;
      *(_QWORD *)&v105[14] = a3;
      *(_WORD *)&v105[22] = 1024;
      LODWORD(v106) = a5;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "Saving updated container data. container_pid=%lld, revision=%lld, deletionType=%d", v105, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("playlistPersistentID"));

    if (a5)
    {
      if (a5 != 1)
      {
        v15 = 0;
LABEL_42:
        +[ML3MusicLibrary pathForResourceFileOrFolder:](ML3MusicLibrary, "pathForResourceFileOrFolder:", 7);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v63, CFSTR("%llu"), &v94, a2);
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = v94;

        if (v65)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("ML3MusicLibrary.m"), 1902, CFSTR("Encountered error validating format. pathFormat=%@ error=%@"), v63, v65);

        }
        v15 = (__CFString *)v64;
LABEL_45:
        v93 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 100, 0, &v93);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v93;
        if (v66)
        {
          if ((WriteDictionaryToPathWithGrappaID(v11, v15, *(unsigned int *)(a1 + 72)) & 1) != 0)
          {
LABEL_54:

LABEL_55:
            return;
          }
        }
        else
        {
          v68 = os_log_create("com.apple.amp.medialibrary", "Library");
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v105 = 138543618;
            *(_QWORD *)&v105[4] = v15;
            *(_WORD *)&v105[12] = 2114;
            *(_QWORD *)&v105[14] = v67;
            _os_log_impl(&dword_1AC149000, v68, OS_LOG_TYPE_ERROR, "Could not serialize plist: %{public}@ (%{public}@)", v105, 0x16u);
          }

        }
        v69 = os_log_create("com.apple.amp.medialibrary", "Library");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v105 = 136446722;
          *(_QWORD *)&v105[4] = "-[ML3MusicLibrary savePlaylistsSinceRevision:withGrappaID:]_block_invoke";
          *(_WORD *)&v105[12] = 2114;
          *(_QWORD *)&v105[14] = v67;
          *(_WORD *)&v105[22] = 2114;
          v106 = v15;
          _os_log_impl(&dword_1AC149000, v69, OS_LOG_TYPE_ERROR, "%{public}s failed with error %{public}@ path = %{public}@\n", v105, 0x20u);
        }

        goto LABEL_54;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forKey:", v13, CFSTR("playlistDeleted"));

      +[ML3MusicLibrary pathForResourceFileOrFolder:](ML3MusicLibrary, "pathForResourceFileOrFolder:", 7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%llu"), &v97, a2);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v16 = v97;
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("ML3MusicLibrary.m"), 1768, CFSTR("Encountered error validating format. pathFormat=%@ error=%@"), v14, v16);

      }
    }
    else
    {
      v17 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32));
      v18 = CFSTR("filepath");
      *(_QWORD *)v105 = CFSTR("filepath");
      v19 = CFSTR("is_ignored_syncing");
      *(_QWORD *)&v105[8] = CFSTR("is_ignored_syncing");
      v20 = CFSTR("date_modified");
      *(_QWORD *)&v105[16] = CFSTR("date_modified");
      v21 = CFSTR("orig_date_modified");
      v106 = CFSTR("orig_date_modified");
      v22 = CFSTR("smart_is_genius");
      v107 = CFSTR("smart_is_genius");
      v23 = CFSTR("smart_is_dynamic");
      v108 = CFSTR("smart_is_dynamic");
      v24 = CFSTR("container_type");
      v109 = CFSTR("container_type");
      v25 = CFSTR("container_seed.item_pid");
      v110 = CFSTR("container_seed.item_pid");
      v26 = CFSTR("name");
      v111 = CFSTR("name");
      v27 = CFSTR("distinguished_kind");
      v112 = CFSTR("distinguished_kind");
      v28 = CFSTR("is_hidden");
      v113 = CFSTR("is_hidden");
      v29 = CFSTR("liked_state");
      v114 = CFSTR("liked_state");
      v30 = CFSTR("description");
      v115 = CFSTR("description");
      v31 = CFSTR("parent_pid");
      v116 = CFSTR("parent_pid");
      v32 = CFSTR("external_vendor_identifier");
      v117 = CFSTR("external_vendor_identifier");
      v33 = CFSTR("external_vendor_display_name");
      v118 = CFSTR("external_vendor_display_name");
      v34 = CFSTR("external_vendor_container_tag");
      v119 = CFSTR("external_vendor_container_tag");
      v35 = CFSTR("is_external_vendor_playlist");
      v92 = &v81;
      v120 = CFSTR("is_external_vendor_playlist");
      MEMORY[0x1E0C80A78](v35);
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v72 = 0u;
      objc_msgSend(v17, "getValues:forProperties:count:", &v72, v105, 18);
      if ((objc_msgSend((id)v77, "BOOLValue") & 1) != 0)
      {
        v15 = 0;
        v36 = 1;
      }
      else
      {
        v90 = -[ML3ArtworkTokenSet initWithEntity:artworkType:]([ML3ArtworkTokenSet alloc], "initWithEntity:artworkType:", v17, 5);
        -[ML3ArtworkTokenSet artworkTokenForSource:](v90, "artworkTokenForSource:", 100);
        v37 = objc_claimAutoreleasedReturnValue();
        v91 = (void *)v37;
        if (!a4 || v37)
        {
          if (*((_QWORD *)&v75 + 1))
          {
            v40 = [ML3Track alloc];
            v41 = -[ML3Entity initWithPersistentID:inLibrary:](v40, "initWithPersistentID:inLibrary:", objc_msgSend(*((id *)&v75 + 1), "longLongValue"), *(_QWORD *)(a1 + 32));
            -[ML3Entity valueForProperty:](v41, "valueForProperty:", CFSTR("item_store.sync_id"));
            v89 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v89 = 0;
          }
          v42 = objc_msgSend((id)v74, "intValue");
          v43 = 48;
          if (!v42)
            v43 = 56;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + v43) + 8) + 24) = 1;
          objc_msgSend(v11, "setValue:forKey:", *((_QWORD *)&v72 + 1), CFSTR("deleteWithoutSyncing"));
          objc_msgSend(v11, "setValue:forKey:", (_QWORD)v73, CFSTR("dateLastModified"));
          objc_msgSend(v11, "setValue:forKey:", *((_QWORD *)&v73 + 1), CFSTR("originalDateLastModified"));
          objc_msgSend(v11, "setValue:forKey:", *((_QWORD *)&v77 + 1), CFSTR("likedState"));
          objc_msgSend(v11, "setValue:forKey:", (_QWORD)v78, CFSTR("description"));
          objc_msgSend(v11, "setValue:forKey:", *((_QWORD *)&v78 + 1), CFSTR("parentPersistentID"));
          objc_msgSend(v11, "setValue:forKey:", (_QWORD)v79, CFSTR("external_vendor_identifier"));
          objc_msgSend(v11, "setValue:forKey:", *((_QWORD *)&v79 + 1), CFSTR("external_vendor_display_name"));
          objc_msgSend(v11, "setValue:forKey:", (_QWORD)v80, CFSTR("external_tag"));
          objc_msgSend(v11, "setValue:forKey:", *((_QWORD *)&v80 + 1), CFSTR("is_external_vendor_playlist"));
          v88 = v17;
          +[ML3Track containerQueryWithContainer:](ML3Track, "containerQueryWithContainer:", v17);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v104[0] = CFSTR("item_store.sync_id");
          v104[1] = CFSTR("item_store.store_saga_id");
          v104[2] = CFSTR("item_store.purchase_history_id");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 3);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_346;
          v95[3] = &unk_1E5B62770;
          v47 = v45;
          v96 = v47;
          v87 = v44;
          objc_msgSend(v44, "enumeratePersistentIDsAndProperties:usingBlock:", v46, v95);

          objc_msgSend(v11, "setValue:forKey:", v47, CFSTR("trackPersistentIDs"));
          v48 = objc_msgSend(v47, "count");
          v38 = v89;
          if (v48 && v89)
            objc_msgSend(v11, "setValue:forKey:", v89, CFSTR("seedTrackPersistentID"));
          objc_msgSend(v11, "setValue:forKey:", *((_QWORD *)&v76 + 1), CFSTR("distinguishedKind"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
          v86 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setValue:forKey:");
          objc_msgSend(v11, "setValue:forKey:", (_QWORD)v76, CFSTR("name"));
          v15 = (__CFString *)objc_msgSend((id)v72, "copy");
          v39 = v91;
          v17 = v88;
          if (v91)
          {
            v82 = v47;
            v49 = os_log_create("com.apple.amp.medialibrary", "Library");
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v98 = 138543362;
              v99 = v39;
              _os_log_impl(&dword_1AC149000, v49, OS_LOG_TYPE_DEFAULT, "container artwork has changed. new token=%{public}@", (uint8_t *)&v98, 0xCu);
            }

            v50 = -[ML3Artwork initWithToken:artworkType:musicLibrary:]([ML3Artwork alloc], "initWithToken:artworkType:musicLibrary:", v39, 5, *(_QWORD *)(a1 + 32));
            -[ML3Artwork originalFileURL](v50, "originalFileURL");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v51;
            objc_msgSend(v51, "path");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = v52;
            v54 = objc_msgSend(v52, "fileExistsAtPath:", v53);
            v55 = v39;
            v56 = v54;

            v84 = v50;
            if ((v56 & 1) != 0)
            {
              objc_msgSend(v85, "path");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              +[ML3MusicLibrary libraryContainerPath](ML3MusicLibrary, "libraryContainerPath");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "substringFromIndex:", objc_msgSend(v58, "length"));
              v59 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "setValue:forKey:", v55, CFSTR("artworkCacheId"));
              objc_msgSend(v11, "setValue:forKey:", v59, CFSTR("artworkFilePath"));
              v39 = v55;
            }
            else
            {
              _ML3LogCategoryLibrary();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v98 = 134218498;
                v99 = a2;
                v100 = 2114;
                v39 = v91;
                v101 = v91;
                v102 = 2114;
                v103 = v85;
                _os_log_impl(&dword_1AC149000, v59, OS_LOG_TYPE_ERROR, "artwork file not found. container_pid=%lld, token=%{public}@, url=%{public}@", (uint8_t *)&v98, 0x20u);
              }
              else
              {
                v39 = v91;
              }
            }
            v47 = v82;
            v17 = v88;

            v38 = v89;
          }

          v36 = 0;
        }
        else
        {
          v38 = os_log_create("com.apple.amp.medialibrary", "Library");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v98 = 134217984;
            v99 = a2;
            _os_log_impl(&dword_1AC149000, v38, OS_LOG_TYPE_DEFAULT, "no content changes for container %lld - skipping", (uint8_t *)&v98, 0xCu);
          }
          v15 = 0;
          v36 = 1;
          v39 = v91;
        }

      }
      for (i = 136; i != -8; i -= 8)

      if (v36)
        goto LABEL_55;
    }
    if (v15)
    {
      -[__CFString stringByDeletingLastPathComponent](v15, "stringByDeletingLastPathComponent");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "length");

      if (v62)
        goto LABEL_45;
    }
    goto LABEL_42;
  }
}

void __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_364(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  CFNumberRef v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t valuePtr;

  objc_msgSend(*(id *)(a1 + 32), "pathForResourceFileOrFolder:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v9);

  if ((v4 & 1) == 0)
  {
    valuePtr = ML3CreateIntegerUUID();
    v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    v6 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("deleteWithoutSyncing"), v5, CFSTR("playlistPersistentID"), CFSTR("SYNC_MARKER"), CFSTR("name"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    WriteDictionaryToPathWithGrappaID(v8, v9, *(unsigned int *)(a1 + 40));
  }

}

void __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_346(uint64_t a1, uint64_t a2, id *a3)
{
  id v6;
  id v7;

  if (objc_msgSend(*a3, "longLongValue"))
  {
    v6 = *a3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __63__ML3MusicLibrary_saveTrackMetadataSinceRevision_withGrappaID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v4, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__ML3MusicLibrary_saveTrackMetadataSinceRevision_withGrappaID___block_invoke_2;
  v10[3] = &unk_1E5B65EE0;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v9, "enumerateRowsWithBlock:", v10);

}

void __63__ML3MusicLibrary_saveTrackMetadataSinceRevision_withGrappaID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  CFAbsoluteTime v5;
  void *v6;
  CFAbsoluteTime v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a2;
  objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v34, "objectAtIndexedSubscript:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "longLongValue"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "objectAtIndexedSubscript:", 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v34, "doubleForColumnIndex:", 5);
  objc_msgSend(v4, "numberWithUnsignedInt:", ML3UInt32MacTimeFromCFAbsoluteTime(v5));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v34, "doubleForColumnIndex:", 8);
  objc_msgSend(v6, "numberWithUnsignedInt:", ML3UInt32MacTimeFromCFAbsoluteTime(v7));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v34, "objectAtIndexedSubscript:", 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "longLongValue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v34, "objectAtIndexedSubscript:", 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedLongLong:", objc_msgSend(v11, "longLongValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || (v16 = objc_msgSend(v13, "unsignedLongLongValue"), v17 = v13, !v16))
    v17 = v14;
  v18 = v17;
  objc_msgSend(v34, "objectAtIndexedSubscript:", 13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 13);
  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(v21, "setValue:forKey:", v18, CFSTR("persistentID"));
      if (objc_msgSend(v33, "BOOLValue") && objc_msgSend(v13, "longLongValue"))
        objc_msgSend(v21, "setValue:forKey:", v33, CFSTR("deleted"));
      if (!objc_msgSend(v15, "longLongValue"))
      {
        if (objc_msgSend(v30, "intValue"))
        {
          objc_msgSend(v21, "setValue:forKey:", v30, CFSTR("playCount"));
          objc_msgSend(v21, "setObject:forKey:", v27, CFSTR("playMacOSDate"));
          objc_msgSend(v21, "setValue:forKey:", v26, CFSTR("playedState"));
        }
        if (objc_msgSend(v29, "intValue"))
        {
          objc_msgSend(v21, "setValue:forKey:", v29, CFSTR("skipCount"));
          objc_msgSend(v21, "setObject:forKey:", v25, CFSTR("skipMacOSDate"));
        }
        objc_msgSend(v21, "setValue:forKey:", v31, CFSTR("bookmarkTimeInMS"));
        objc_msgSend(v21, "setValue:forKey:", v32, CFSTR("audioTrackID"));
        objc_msgSend(v21, "setValue:forKey:", v28, CFSTR("userRating"));
        objc_msgSend(v21, "setValue:forKey:", v12, CFSTR("likedState"));
        objc_msgSend(v21, "setValue:forKey:", v19, CFSTR("albumLikedState"));
        if (v20)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "BOOLValue") ^ 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setValue:forKey:", v23, CFSTR("isPlaylistOnly"));

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v21, v18);
    }
  }

}

void __42__ML3MusicLibrary_groupingKeysForStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(__CFString **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[__CFString length](v9, "length", (_QWORD)v12))
        {
          v10 = (uint64_t)iPhoneSortKeyBuilderCopyGroupingKeyForString(a2, v9);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v11 = (void *)v10;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __39__ML3MusicLibrary_accountCacheDatabase__block_invoke(uint64_t a1)
{
  ML3AccountCacheDatabase *v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = -[ML3AccountCacheDatabase initWithLibrary:]([ML3AccountCacheDatabase alloc], "initWithLibrary:", *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

  }
}

void __37__ML3MusicLibrary_clearAllGeniusData__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v4, "existsInLibrary"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "deleteFromLibrary");
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = a2;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Deleted active Genius playlist with pid: %lld", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __33__ML3MusicLibrary_emptyAllTables__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = ML3ValidationRunInitialInsertStatements(a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __32__ML3MusicLibrary_createIndexes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "indexSchemaSQL", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "executeUpdate:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v9 = objc_msgSend(v3, "executeUpdate:", CFSTR("ANALYZE;"));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v10 + 24))
    v11 = v9;
  else
    v11 = 0;
  *(_BYTE *)(v10 + 24) = v11;

}

void __81__ML3MusicLibrary_performAsyncDatabaseWriteTransactionWithBlock_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__ML3MusicLibrary_performAsyncDatabaseWriteTransactionWithBlock_completionBlock___block_invoke_2;
  v4[3] = &unk_1E5B5CB18;
  v6 = &v7;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performDatabaseTransactionWithBlock:", v4);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *((unsigned __int8 *)v8 + 24), 0);

  _Block_object_dispose(&v7, 8);
}

uint64_t __81__ML3MusicLibrary_performAsyncDatabaseWriteTransactionWithBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __45__ML3MusicLibrary_checkInDatabaseConnection___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 104));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 88));
}

void __45__ML3MusicLibrary_checkInDatabaseConnection___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "ownsConnection:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v5, "checkInConnection:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (a3)
      *a3 = 1;
  }

}

void __38__ML3MusicLibrary_connectionDidClose___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2077;
  v21 = __Block_byref_object_dispose__2078;
  v22 = 0;
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v24 = v3;
    v25 = 2114;
    v26 = v4;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received connection=%{public}@ did close notification", buf, 0x16u);
  }

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __38__ML3MusicLibrary_connectionDidClose___block_invoke_159;
  v14 = &unk_1E5B5CAF0;
  v15 = v5;
  v16 = &v17;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v11);
  v7 = (void *)v18[5];
  if (v7)
  {
    objc_msgSend(v7, "setDelegate:", 0, v11, v12, v13, v14);
    v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = v18[5];
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - connection pool %{public}@ will be removed from the pending pools as it has no pending or active connections", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", v18[5]);
  }

  _Block_object_dispose(&v17, 8);
}

void __38__ML3MusicLibrary_connectionDidClose___block_invoke_159(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "ownsConnection:", *(_QWORD *)(a1 + 32)))
  {
    if (objc_msgSend(v6, "isClosedWithNoActiveOrBusyConnections"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      if (a3)
        *a3 = 1;
    }
  }

}

void __33__ML3MusicLibrary_isLibraryEmpty__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT 1 FROM item LIMIT 1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAtLeastOneRow");

  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT 1 FROM container WHERE distinguished_kind = 0 LIMIT 1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v6, "hasAtLeastOneRow");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (v5 | v3) ^ 1;
}

uint64_t __33__ML3MusicLibrary_setLibraryUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forDatabaseProperty:", *(_QWORD *)(a1 + 40), CFSTR("_UUID"));
}

uint64_t __32__ML3MusicLibrary_syncLibraryID__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24) == 0;
  return result;
}

void __32__ML3MusicLibrary_syncLibraryID__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

void __32__ML3MusicLibrary_syncLibraryID__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __36__ML3MusicLibrary_setSyncLibraryID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

uint64_t __43__ML3MusicLibrary_setIsHomeSharingLibrary___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 81) = *(_BYTE *)(result + 40);
  return result;
}

void __33__ML3MusicLibrary_initWithCoder___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[ML3MusicLibrary _onGlobalQueue_shareableMusicLibraryWithResourcesManager:autoUpdatingSharedLibraryPath:](ML3MusicLibrary, "_onGlobalQueue_shareableMusicLibraryWithResourcesManager:autoUpdatingSharedLibraryPath:", a1[4], a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __84__ML3MusicLibrary_initWithClientIdentity_path_readOnly_populateUnitTestTablesBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __84__ML3MusicLibrary_initWithClientIdentity_path_readOnly_populateUnitTestTablesBlock___block_invoke_3()
{
  id v0;

  +[ML3LanguageResourceManager sharedResourceManager](ML3LanguageResourceManager, "sharedResourceManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invalidateCachedResources");

}

void __84__ML3MusicLibrary_initWithClientIdentity_path_readOnly_populateUnitTestTablesBlock___block_invoke_2()
{
  id v0;

  +[ML3LanguageResourceManager sharedResourceManager](ML3LanguageResourceManager, "sharedResourceManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invalidateCachedResources");

}

+ (id)_onGlobalQueue_shareableMusicLibraryWithResourcesManager:(id)a3 autoUpdatingSharedLibraryPath:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  ML3MusicLibrary *v16;
  ML3MusicLibrary *v17;
  void *v18;
  void *v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a1, "globalSerialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (!v7 && !objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3MusicLibrary.m"), 258, CFSTR("Cannot create library with no resource mananger and invalid autoUpdatingLibraryPath"));

  }
  if (!_onGlobalQueue_shareableMusicLibraryWithResourcesManager_autoUpdatingSharedLibraryPath___cachedLibraries)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)_onGlobalQueue_shareableMusicLibraryWithResourcesManager_autoUpdatingSharedLibraryPath___cachedLibraries;
    _onGlobalQueue_shareableMusicLibraryWithResourcesManager_autoUpdatingSharedLibraryPath___cachedLibraries = v10;

  }
  objc_msgSend(v7, "pathForResourceFileOrFolder:", 15);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v8;
  v15 = v14;

  objc_msgSend((id)_onGlobalQueue_shareableMusicLibraryWithResourcesManager_autoUpdatingSharedLibraryPath___cachedLibraries, "objectForKey:", v15);
  v16 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v17 = [ML3MusicLibrary alloc];
    if (v7)
    {
      v16 = -[ML3MusicLibrary initWithResourcesManager:](v17, "initWithResourcesManager:", v7);
    }
    else
    {
      v16 = -[ML3MusicLibrary initWithPath:](v17, "initWithPath:", v15);
      -[ML3MusicLibrary setUsingSharedLibraryPath:](v16, "setUsingSharedLibraryPath:", 1);
      +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy](ML3MusicLibraryAccountChangeObserverProxy, "sharedProxy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAccountChangeObserver:", v16);

    }
    objc_msgSend((id)_onGlobalQueue_shareableMusicLibraryWithResourcesManager_autoUpdatingSharedLibraryPath___cachedLibraries, "setObject:forKey:", v16, v15);
  }

  return v16;
}

+ (NSArray)registeredLibraries
{
  NSObject *v3;
  id v4;
  void *v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (+[ML3MusicLibrary deviceSupportsMultipleLibraries](ML3MusicLibrary, "deviceSupportsMultipleLibraries"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__2077;
    v13 = __Block_byref_object_dispose__2078;
    v14 = 0;
    objc_msgSend(a1, "globalSerialQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__ML3MusicLibrary_registeredLibraries__block_invoke;
    v8[3] = &unk_1E5B5C9D0;
    v8[4] = &v9;
    v8[5] = a1;
    dispatch_sync(v3, v8);

    v4 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

    return (NSArray *)v4;
  }
  else
  {
    objc_msgSend(a1, "autoupdatingSharedLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v7;
  }
}

+ (NSArray)allLibraries
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3MusicLibrary autoupdatingSharedLibraryPath](ML3MusicLibrary, "autoupdatingSharedLibraryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(a1, "globalSerialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ML3MusicLibrary_allLibraries__block_invoke;
  block[3] = &unk_1E5B65678;
  v13 = v5;
  v14 = a1;
  v12 = v3;
  v7 = v5;
  v8 = v3;
  dispatch_sync(v6, block);

  v9 = (void *)objc_msgSend(v8, "copy");
  return (NSArray *)v9;
}

+ (void)setAutoupdatingSharedLibraryPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "globalSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ML3MusicLibrary_setAutoupdatingSharedLibraryPath___block_invoke;
  block[3] = &unk_1E5B65D80;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

+ (NSMutableDictionary)musicLibraryPerUserDSID
{
  if (musicLibraryPerUserDSID_onceToken != -1)
    dispatch_once(&musicLibraryPerUserDSID_onceToken, &__block_literal_global_78);
  return (NSMutableDictionary *)(id)musicLibraryPerUserDSID___musicLibraryPerUserDSID;
}

+ (id)sharedLibrary
{
  return +[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary");
}

+ (NSString)sharedLibraryDatabasePath
{
  return +[ML3MusicLibrary autoupdatingSharedLibraryPath](ML3MusicLibrary, "autoupdatingSharedLibraryPath");
}

+ (void)setSharedLibraryDatabasePath:(id)a3
{
  +[ML3MusicLibrary setAutoupdatingSharedLibraryPath:](ML3MusicLibrary, "setAutoupdatingSharedLibraryPath:", a3);
}

+ (void)disableSharedLibrary
{
  __disableSharedLibrary = 1;
}

+ (void)disableAutomaticDatabaseValidation
{
  __disableAutomaticDatabaseValidation = 1;
}

+ (void)enableAutomaticDatabaseValidation
{
  __disableAutomaticDatabaseValidation = 0;
}

+ (void)setGlobalPrivacyContextWithAuditToken:(id *)a3
{
  ML3DatabasePrivacyContext *v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[2];

  os_unfair_lock_lock(&__privacyContextLock);
  v4 = [ML3DatabasePrivacyContext alloc];
  v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  v6 = -[ML3DatabasePrivacyContext initWithAuditToken:](v4, "initWithAuditToken:", v8);
  v7 = (void *)__privacyContextOverride;
  __privacyContextOverride = v6;

  os_unfair_lock_unlock(&__privacyContextLock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)localizedSectionHeaderForSectionHeader:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  ML3LocalizedSectionDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("LocalizedSectionHeaders"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v3;
  v8 = v6;

  return v8;
}

+ (id)localizedSectionIndexTitleForSectionHeader:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  ML3LocalizedSectionDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("LocalizedSectionIndices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v3;
  v8 = v6;

  return v8;
}

+ (id)sectionIndexTitles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  ML3LocalizedSectionDictionary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SectionIndices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NUMERIC_SECTION_HEADER"), &stru_1E5B66908, CFSTR("MLLocalizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sectionIndexTitleForSectionHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *context;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex;
  if (!sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex)
  {
    v36 = v4;
    context = (void *)MEMORY[0x1AF43CC0C]();
    objc_msgSend(a1, "sectionIndexTitles");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    ML3LocalizedSectionDictionary();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("SectionHeaders"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          objc_msgSend(v13, "objectForKey:", CFSTR("Headers"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v39 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v16);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v10);
    }

    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = (void *)sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex;
    sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex = (uint64_t)v19;

    v21 = v37;
    if (objc_msgSend(v37, "count"))
    {
      v22 = 0;
      v23 = 0;
      v24 = 1;
      do
      {
        objc_msgSend(v21, "objectAtIndex:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "isEqualToString:", CFSTR("•")) & 1) == 0)
        {
          v26 = 0;
          v27 = v24;
          while (v27 < objc_msgSend(v21, "count"))
          {
            objc_msgSend(v21, "objectAtIndex:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            ++v27;
            v26 = v28;
            if ((objc_msgSend(v28, "isEqualToString:", CFSTR("•")) & 1) == 0)
              goto LABEL_24;
          }
          v28 = v26;
LABEL_24:
          if (v22 < objc_msgSend(v6, "count"))
          {
            while (1)
            {
              objc_msgSend(v6, "objectAtIndex:", v22);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v28, "isEqualToString:", v29))
                break;
              objc_msgSend((id)sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex, "setObject:forKey:", v25, v29);

              if (++v22 >= objc_msgSend(v6, "count"))
                goto LABEL_29;
            }

          }
LABEL_29:

          v21 = v37;
        }

        ++v23;
        ++v24;
      }
      while (v23 < objc_msgSend(v21, "count"));
    }

    objc_autoreleasePoolPop(context);
    v5 = (void *)sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex;
    v4 = v36;
  }
  objc_msgSend(v5, "objectForKey:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v32 = v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("NUMERIC_SECTION_HEADER"), &stru_1E5B66908, CFSTR("MLLocalizable"));
    v32 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v32;
}

+ (void)enumerateSortMapTablesUsingBlock:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[6];

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (enumerateSortMapTablesUsingBlock____once != -1)
    dispatch_once(&enumerateSortMapTablesUsingBlock____once, block);
  v7 = (void *)enumerateSortMapTablesUsingBlock____sortMapTables;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke_2;
  v9[3] = &unk_1E5B5CD18;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

}

+ (void)removeOrphanedTracks
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  +[ML3MusicLibrary allLibraries](ML3MusicLibrary, "allLibraries", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeOrphanedTracksOnlyInCaches:", +[ML3MusicLibrary deviceSupportsMultipleLibraries](ML3MusicLibrary, "deviceSupportsMultipleLibraries"));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (BOOL)updateTrackIntegrityOnConnection:(id)a3
{
  return objc_msgSend(a3, "executeUpdate:", CFSTR("UPDATE item_extra SET integrity = (SELECT ML3TrackIntegrityCompute(item.item_pid, item.media_type, item_extra.location, item_extra.file_size) FROM item JOIN item_extra AS item_extra2 USING (item_pid) WHERE item_extra.item_pid = item.item_pid)"));
}

+ (id)widthLimitedSetValuesQueue
{
  if (widthLimitedSetValuesQueue___once != -1)
    dispatch_once(&widthLimitedSetValuesQueue___once, &__block_literal_global_543);
  return (id)widthLimitedSetValuesQueue___setValuesQueue;
}

+ (id)assistantSyncDataChangedNotificationName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%s"), "com.apple.media.entities", ".siri_data_changed");
}

uint64_t __45__ML3MusicLibrary_widthLimitedSetValuesQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)widthLimitedSetValuesQueue___setValuesQueue;
  widthLimitedSetValuesQueue___setValuesQueue = (uint64_t)v0;

  return objc_msgSend((id)widthLimitedSetValuesQueue___setValuesQueue, "setMaxConcurrentOperationCount:", 5);
}

void __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("MLSortMapTables"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v2);
  v4 = (void *)enumerateSortMapTablesUsingBlock____sortMapTables;
  enumerateSortMapTablesUsingBlock____sortMapTables = v3;

  if (!enumerateSortMapTablesUsingBlock____sortMapTables)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("ML3MusicLibrary.m"), 2162, CFSTR("Unable to load MLSortMapTables.plist at %@"), v2);

  }
}

void __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke_3;
  v8[3] = &unk_1E5B5CCF0;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a2;
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = a1 + 32;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v9 + 8);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, void *, void *))(v8 + 16))(v8, v7, v5, v10, v6);

}

void __42__ML3MusicLibrary_musicLibraryPerUserDSID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v1 = (void *)musicLibraryPerUserDSID___musicLibraryPerUserDSID;
  musicLibraryPerUserDSID___musicLibraryPerUserDSID = v0;

}

void __52__ML3MusicLibrary_setAutoupdatingSharedLibraryPath___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v2 = (void *)__sharedLibraryDatabasePath;
  __sharedLibraryDatabasePath = v1;

}

void __31__ML3MusicLibrary_allLibraries__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ML3MusicLibraryResourcesManager *v10;
  void *v11;
  void *v12;
  id obj;
  id obja;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (+[ML3MusicLibrary deviceSupportsMultipleLibraries](ML3MusicLibrary, "deviceSupportsMultipleLibraries"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    +[ML3MusicLibrary allLibraryContainerPaths](ML3MusicLibrary, "allLibraryContainerPaths");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v16 != v4)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v6, "lastPathComponent");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("iTunes_Control")))
          {

            v7 = 0;
          }
          objc_msgSend(v6, "lastPathComponent");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          +[ML3MusicLibraryResourcesManagerContext contextForSingleUserLibraryWithLibraryContainerIdentifier:](ML3MusicLibraryResourcesManagerContext, "contextForSingleUserLibraryWithLibraryContainerIdentifier:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = -[ML3MusicLibraryResourcesManager initWithContext:]([ML3MusicLibraryResourcesManager alloc], "initWithContext:", v9);
          objc_msgSend(*(id *)(a1 + 48), "_onGlobalQueue_shareableMusicLibraryWithResourcesManager:autoUpdatingSharedLibraryPath:", v10, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v3);
    }

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "_onGlobalQueue_shareableMusicLibraryWithResourcesManager:autoUpdatingSharedLibraryPath:", 0, *(_QWORD *)(a1 + 40));
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:");

  }
}

void __38__ML3MusicLibrary_registeredLibraries__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "musicLibraryPerUserDSID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46__ML3MusicLibrary_musicLibraryForUserAccount___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  ML3MusicLibraryResourcesManager *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 56), "musicLibraryPerUserDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[ML3MusicLibraryResourcesManagerContext contextForSingleUserLibraryWithAccountInfo:](ML3MusicLibraryResourcesManagerContext, "contextForSingleUserLibraryWithAccountInfo:", *(_QWORD *)(a1 + 40));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v6 = -[ML3MusicLibraryResourcesManager initWithContext:]([ML3MusicLibraryResourcesManager alloc], "initWithContext:", v12);
    objc_msgSend(*(id *)(a1 + 56), "_onGlobalQueue_shareableMusicLibraryWithResourcesManager:autoUpdatingSharedLibraryPath:", v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 56), "musicLibraryPerUserDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 32));

  }
}

- (id)artistGroupingKeyForArtistName:(id)a3 seriesName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "length"))
    v8 = v6;
  else
    v8 = v7;
  -[ML3MusicLibrary groupingKeyForString:](self, "groupingKeyForString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)artistForArtistName:(id)a3 seriesName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  ML3MusicLibrary *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4165;
  v20 = __Block_byref_object_dispose__4166;
  v21 = 0;
  -[ML3MusicLibrary artistGroupingKeyForArtistName:seriesName:](self, "artistGroupingKeyForArtistName:seriesName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__ML3MusicLibrary_ML3ArtistAdditions__artistForArtistName_seriesName___block_invoke;
    v12[3] = &unk_1E5B62DC0;
    v14 = self;
    v15 = &v16;
    v13 = v8;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v12);

  }
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __70__ML3MusicLibrary_ML3ArtistAdditions__artistForArtistName_seriesName___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a1[4];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT ROWID FROM item_artist WHERE (grouping_key = ?)"), v5, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "int64ValueForFirstRowAndColumn");
  if (v7)
    v8 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Artist, "newWithPersistentID:inLibrary:", v7, a1[5]);
  else
    v8 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v8);
  if (v7)

}

- (id)albumForAlbumArtistPersistentID:(int64_t)a3 albumName:(id)a4 feedURL:(id)a5 seasonNumber:(id)a6 compilation:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v28;
  _QWORD v29[3];
  _QWORD v30[2];

  v7 = a7;
  v30[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[ML3MusicLibrary checkoutReaderConnection](self, "checkoutReaderConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    v30[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "executeQuery:withParameters:", CFSTR("SELECT ROWID FROM album WHERE feed_url = ?"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "int64ValueForFirstRowAndColumn");
  }
  else
  {
    -[ML3MusicLibrary groupingKeyForString:](self, "groupingKeyForString:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v19;
    v20 = CFSTR("SELECT ROWID FROM album WHERE (grouping_key = ?) AND (all_compilations = ?) AND (album_artist_pid = ?) AND (season_number = ?)");
    if (!v14)
      v20 = CFSTR("SELECT ROWID FROM album WHERE (grouping_key = ?) AND (all_compilations = ?) AND (album_artist_pid = ?)");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7, v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    if (v14)
      objc_msgSend(v24, "addObject:", v14);
    objc_msgSend(v15, "executeQuery:withParameters:", v28, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v25, "int64ValueForFirstRowAndColumn");

  }
  if (v18)
    v26 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Album, "newWithPersistentID:inLibrary:", v18, self);
  else
    v26 = 0;
  -[ML3MusicLibrary checkInDatabaseConnection:](self, "checkInDatabaseConnection:", v15);

  return v26;
}

- (BOOL)repairAlbumArtistRelationshipsWithConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  char v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  uint64_t v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT album_pid FROM album LEFT OUTER JOIN album_artist USING(album_artist_pid) WHERE album_artist IS NULL AND album_artist_pid != 0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsInColumn:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v30 = objc_msgSend(v5, "count");
    v31 = 2114;
    v32 = v5;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEBUG, "Album -> AlbumArtist repair: Found %lu albums with invalid album artists %{public}@", buf, 0x16u);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    v20 = 1;
    *(_QWORD *)&v8 = 138543362;
    v19 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v27 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("SELECT album_artist_pid FROM item WHERE album_artist_pid != 0 AND album_pid = ? LIMIT 1"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForFirstRowAndColumn");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "longLongValue"))
        {
          v26[0] = v15;
          v26[1] = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("UPDATE album SET album_artist_pid = ? WHERE album_pid = ?"), v16, 0);

          v17 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v12;
            v31 = 2114;
            v32 = v15;
            _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEBUG, "Updated album %{public}@ with album artist %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v17 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v30 = v12;
            _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "Could not find valid album artist for album %{public}@", buf, 0xCu);
          }
          v20 = 0;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }
  else
  {
    v20 = 1;
  }

  return v20 & 1;
}

- (BOOL)coerceValidDatabaseWithError:(id *)a3
{
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  -[ML3MusicLibrary migratePresignedValidity](self, "migratePresignedValidity");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__ML3MusicLibrary_Validation__coerceValidDatabaseWithError___block_invoke;
  v6[3] = &unk_1E5B65650;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v6);
  LOBYTE(a3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)a3;
}

- (BOOL)_validateDatabaseUsingConnection:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  _BOOL4 v23;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  id v37;
  _QWORD v38[2];
  uint8_t buf[4];
  _DWORD v40[7];

  *(_QWORD *)&v40[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = +[ML3MusicLibrary userVersionUsingConnection:](ML3MusicLibrary, "userVersionUsingConnection:", v6);
  v8 = v7;
  if ((int)v7 > 2200070)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ml_errorWithCode:description:", 3, CFSTR("Media library database is too new for this device. (version = %d, latest known version is %d)"), v7, 2200070);
LABEL_3:
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v10 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v40 = v9;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "Failed to validate database with error: %{public}@", buf, 0xCu);
    }
    v11 = 0;
    goto LABEL_30;
  }
  if (!(_DWORD)v7)
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "User version is 0, building tables for newly created DB", buf, 2u);
    }

    if ((_ML3ValidationBuildDatabaseTables(v6) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ml_errorWithCode:description:", 4, CFSTR("Could not build database tables using connection %@."), v6, v35);
      goto LABEL_3;
    }
    v9 = 0;
    goto LABEL_18;
  }
  if ((int)v7 >= 2200070)
  {
    v15 = 0;
    goto LABEL_20;
  }
  v12 = os_log_create("com.apple.amp.medialibrary", "Validation");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v40[0] = v8;
    LOWORD(v40[1]) = 1024;
    *(_DWORD *)((char *)&v40[1] + 2) = 2200070;
    _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Migrating media library database from %d to %d", buf, 0xEu);
  }

  v37 = 0;
  v13 = ML3MigrationMigrateLibraryToCurrentVersion(self, v6, &v37);
  v14 = v37;
  v9 = 0;
  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ml_errorWithCode:description:", 5, CFSTR("Failed to migrate database from version %d to %d. %@"), v8, 2200070, v14);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v25 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "localizedDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v40 = v26;
      _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_ERROR, "Migration error: %{public}@", buf, 0xCu);

    }
    v27 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_ERROR, "Recreating un-migratable database...", buf, 2u);
    }

    v28 = v6;
    v29 = v28;
    if (__daemonProcessInfo)
    {
      if ((objc_msgSend(v28, "deleteDatabase") & 1) != 0)
      {
        v30 = _ML3ValidationBuildDatabaseTables(v29);

        if (v30)
        {
          _ML3LogCategoryValidation();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_DEFAULT, "Successfully deleted un-migratable database and re-created.", buf, 2u);
          }

          goto LABEL_12;
        }
LABEL_51:
        v34 = os_log_create("com.apple.amp.medialibrary", "Validation");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v34, OS_LOG_TYPE_ERROR, "Still can't validate database after recreating.", buf, 2u);
        }

        goto LABEL_4;
      }
      _ML3LogCategoryDefault();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v33, OS_LOG_TYPE_ERROR, "Could not delete database", buf, 2u);
      }

    }
    goto LABEL_51;
  }
LABEL_12:

  v15 = v9;
  if ((int)v8 <= 1140159)
  {
LABEL_18:
    +[ML3Container populateMediaTypesOfStaticContainersInLibrary:](ML3Container, "populateMediaTypesOfStaticContainersInLibrary:", self);
    v15 = v9;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM _MLDatabaseProperties WHERE key = '%@'"), CFSTR("_UUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForFirstRowAndColumn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v9 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v38[0] = v19;
    v38[1] = CFSTR("_UUID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v15;
    v22 = objc_msgSend(v6, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO _MLDatabaseProperties (value, key) VALUES (?, ?);"),
            v21,
            &v36);
    v9 = v36;

    if ((v22 & 1) == 0)
    {
      v32 = os_log_create("com.apple.amp.medialibrary", "Validation");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v40 = v9;
        _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_ERROR, "Failed to insert a library UID into the database properties table. (Error = %{public}@)", buf, 0xCu);
      }

      goto LABEL_4;
    }
  }

  v10 = os_log_create("com.apple.amp.medialibrary", "Validation");
  v23 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v23)
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v40 = v9;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "Successfully validated database, but encountered a recoverable error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "Successfully validated database", buf, 2u);
    }
    v9 = 0;
  }
  v11 = 1;
LABEL_30:

  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v11;
}

uint64_t __60__ML3MusicLibrary_Validation__coerceValidDatabaseWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_validateDatabaseUsingConnection:error:", a2, *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)updateSortMapOnConnection:(id)a3
{
  return -[ML3MusicLibrary updateSortMapOnConnection:forceUpdateOriginals:](self, "updateSortMapOnConnection:forceUpdateOriginals:", a3, 0);
}

- (BOOL)updateSortMapOnConnection:(id)a3 forceUpdateOriginals:(BOOL)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__ML3MusicLibrary_SortMap__updateSortMapOnConnection_forceUpdateOriginals___block_invoke;
  v10[3] = &unk_1E5B615F0;
  v10[4] = self;
  v7 = v6;
  v13 = a4;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v7, "performTransactionWithBlock:", v10);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (BOOL)inTransactionUpdateSortMapOnConnection:(id)a3 forceUpdateOriginals:(BOOL)a4
{
  return -[ML3MusicLibrary inTransactionUpdateSortMapOnConnection:forceRebuild:forceUpdateOriginals:](self, "inTransactionUpdateSortMapOnConnection:forceRebuild:forceUpdateOriginals:", a3, 0, a4);
}

- (BOOL)inTransactionUpdateSortMapOnConnection:(id)a3 forceRebuild:(BOOL)a4 forceUpdateOriginals:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  char v15;
  char v16;
  char v17;
  char v18;
  int v19;
  NSObject *v20;
  const char *v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  uint64_t *v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  void *v68;
  char v69;
  char v70;
  NSObject *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  ML3ItemTable *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  uint64_t v90;
  void *v91;
  void *v92;
  char v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  int v100;
  int v101;
  int v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  NSObject *v108;
  int v109;
  int v110;
  char v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  char v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  _BOOL4 v128;
  NSObject *v129;
  NSObject *v130;
  const char *v131;
  NSObject *v132;
  os_log_type_t v133;
  void *v134;
  void *v135;
  char v136;
  NSObject *v137;
  NSObject *v138;
  int v139;
  BOOL v140;
  id v142;
  id v143;
  id v144;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD v154[4];
  id v155;
  ML3MusicLibrary *v156;
  id v157;
  id v158;
  id v159;
  _QWORD v160[4];
  id v161;
  id v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  char v167;
  uint8_t buf[4];
  int v169;
  _QWORD v170[2];
  _BYTE v171[128];
  _BYTE v172[128];
  uint64_t v173;

  v5 = a5;
  v173 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v164 = 0;
  v165 = &v164;
  v166 = 0x2020000000;
  v167 = 1;
  v8 = os_log_create("com.apple.amp.medialibrary", "SortMap");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "Rebuilding the sort_map table", buf, 2u);
  }

  objc_msgSend(v7, "executeQuery:", CFSTR("SELECT COUNT(name) FROM sqlite_master WHERE type='table' AND name = 'sort_map';"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "int64ValueForFirstRowAndColumn") == 1;

  if (v10)
  {
    objc_msgSend(v7, "executeQuery:", CFSTR("SELECT ROWID FROM sort_map LIMIT 1;"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "hasAtLeastOneRow");

  }
  v12 = objc_msgSend(v7, "executeUpdate:", CFSTR("DROP TABLE IF EXISTS sort_map_new"));
  *((_BYTE *)v165 + 24) = v12;
  if ((v12 & 1) == 0)
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "failed to delete existing sort_map_new table", buf, 2u);
    }

  }
  +[ML3MusicLibrary sortMapNewSchemaSQL](ML3MusicLibrary, "sortMapNewSchemaSQL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "executeUpdate:", v14);
  *((_BYTE *)v165 + 24) = v15;

  if ((v15 & 1) != 0)
  {
    if (!v10 || a4)
    {
      v22 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT title, iPhoneSortKey(title) FROM item_extra;"));
      if (*((_BYTE *)v165 + 24))
        v23 = v22;
      else
        v23 = 0;
      *((_BYTE *)v165 + 24) = v23;
      v24 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(title), iPhoneSortKey(ML3SortString(title)) FROM item_extra;"));
      if (*((_BYTE *)v165 + 24))
        v25 = v24;
      else
        v25 = 0;
      *((_BYTE *)v165 + 24) = v25;
      v26 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_title, iPhoneSortKey(sort_title) FROM item_extra;"));
      if (*((_BYTE *)v165 + 24))
        v27 = v26;
      else
        v27 = 0;
      *((_BYTE *)v165 + 24) = v27;
      v28 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT item_artist, iPhoneSortKey(item_artist) FROM item_artist;"));
      if (*((_BYTE *)v165 + 24))
        v29 = v28;
      else
        v29 = 0;
      *((_BYTE *)v165 + 24) = v29;
      v30 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(item_artist), iPhoneSortKey(ML3SortString(item_artist)) FROM item_artist;"));
      if (*((_BYTE *)v165 + 24))
        v31 = v30;
      else
        v31 = 0;
      *((_BYTE *)v165 + 24) = v31;
      v32 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_item_artist, iPhoneSortKey(sort_item_artist) FROM item_artist;"));
      if (*((_BYTE *)v165 + 24))
        v33 = v32;
      else
        v33 = 0;
      *((_BYTE *)v165 + 24) = v33;
      v34 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT series_name, iPhoneSortKey(series_name) FROM item_artist;"));
      if (*((_BYTE *)v165 + 24))
        v35 = v34;
      else
        v35 = 0;
      *((_BYTE *)v165 + 24) = v35;
      v36 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(series_name), iPhoneSortKey(ML3SortString(series_name)) FROM item_artist;"));
      if (*((_BYTE *)v165 + 24))
        v37 = v36;
      else
        v37 = 0;
      *((_BYTE *)v165 + 24) = v37;
      v38 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_series_name, iPhoneSortKey(sort_series_name) FROM item_artist;"));
      if (*((_BYTE *)v165 + 24))
        v39 = v38;
      else
        v39 = 0;
      *((_BYTE *)v165 + 24) = v39;
      v40 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT album_artist, iPhoneSortKey(album_artist) FROM album_artist;"));
      if (*((_BYTE *)v165 + 24))
        v41 = v40;
      else
        v41 = 0;
      *((_BYTE *)v165 + 24) = v41;
      v42 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(album_artist), iPhoneSortKey(ML3SortString(album_artist)) FROM album_artist;"));
      if (*((_BYTE *)v165 + 24))
        v43 = v42;
      else
        v43 = 0;
      *((_BYTE *)v165 + 24) = v43;
      v44 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_album_artist, iPhoneSortKey(sort_album_artist) FROM album_artist;"));
      if (*((_BYTE *)v165 + 24))
        v45 = v44;
      else
        v45 = 0;
      *((_BYTE *)v165 + 24) = v45;
      v46 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT album, iPhoneSortKey(album) FROM album;"));
      if (*((_BYTE *)v165 + 24))
        v47 = v46;
      else
        v47 = 0;
      *((_BYTE *)v165 + 24) = v47;
      v48 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(album), iPhoneSortKey(ML3SortString(album)) FROM album;"));
      if (*((_BYTE *)v165 + 24))
        v49 = v48;
      else
        v49 = 0;
      *((_BYTE *)v165 + 24) = v49;
      v50 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_album, iPhoneSortKey(sort_album) FROM album;"));
      if (*((_BYTE *)v165 + 24))
        v51 = v50;
      else
        v51 = 0;
      *((_BYTE *)v165 + 24) = v51;
      v52 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT season_number, iPhoneSortKey(season_number) FROM album;"));
      if (*((_BYTE *)v165 + 24))
        v53 = v52;
      else
        v53 = 0;
      *((_BYTE *)v165 + 24) = v53;
      v54 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT composer, iPhoneSortKey(composer) FROM composer;"));
      if (*((_BYTE *)v165 + 24))
        v55 = v54;
      else
        v55 = 0;
      *((_BYTE *)v165 + 24) = v55;
      v56 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(composer), iPhoneSortKey(ML3SortString(composer)) FROM composer;"));
      if (*((_BYTE *)v165 + 24))
        v57 = v56;
      else
        v57 = 0;
      *((_BYTE *)v165 + 24) = v57;
      v58 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_composer, iPhoneSortKey(sort_composer) FROM composer;"));
      if (*((_BYTE *)v165 + 24))
        v59 = v58;
      else
        v59 = 0;
      *((_BYTE *)v165 + 24) = v59;
      v60 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT genre, iPhoneSortKey(genre) FROM genre;"));
      if (*((_BYTE *)v165 + 24))
        v61 = v60;
      else
        v61 = 0;
      *((_BYTE *)v165 + 24) = v61;
      v19 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT name, iPhoneSortKey(name) FROM container;"));
    }
    else
    {
      v16 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT INTO sort_map_new (name, sort_key) SELECT name, iPhoneSortKey(name) FROM sort_map;"));
      *((_BYTE *)v165 + 24) = v16;
      v17 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(name), iPhoneSortKey(ML3SortString(name)) FROM sort_map;"));
      if (*((_BYTE *)v165 + 24))
        v18 = v17;
      else
        v18 = 0;
      *((_BYTE *)v165 + 24) = v18;
      v19 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_composer, iPhoneSortKey(sort_composer) FROM composer WHERE sort_composer IS NOT NULL;"));
    }
    v62 = v165;
    if (*((_BYTE *)v165 + 24))
      v63 = v19;
    else
      v63 = 0;
    *((_BYTE *)v165 + 24) = v63;
    if (v63)
      goto LABEL_87;
    v20 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "failed to populate sort_map_new";
      goto LABEL_85;
    }
  }
  else
  {
    v20 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "failed to create sort_map_new";
LABEL_85:
      _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    }
  }

  v62 = v165;
LABEL_87:
  if (!*((_BYTE *)v62 + 24))
    goto LABEL_163;
  v64 = objc_msgSend(v7, "executeUpdate:", CFSTR("UPDATE sort_map_new SET name_section = iPhoneSortSection(sort_key);"));
  *((_BYTE *)v165 + 24) = v64;
  if (!v64)
    goto LABEL_168;
  v65 = objc_msgSend(v7, "executeUpdate:", CFSTR("CREATE TEMPORARY TABLE sort_map_new_in_order (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, UNIQUE (name));"));
  *((_BYTE *)v165 + 24) = v65;
  if (!v65)
    goto LABEL_168;
  v66 = objc_msgSend(v7, "executeUpdate:", CFSTR("INSERT INTO sort_map_new_in_order (name) SELECT name FROM sort_map_new ORDER BY sort_key;"));
  *((_BYTE *)v165 + 24) = v66;
  if (!v66)
    goto LABEL_168;
  v67 = objc_msgSend(v7, "executeUpdate:", CFSTR("UPDATE sort_map_new SET name_order = (SELECT sort_map_new_in_order.ROWID << 32 FROM sort_map_new_in_order WHERE sort_map_new.name = sort_map_new_in_order.name);"));
  *((_BYTE *)v165 + 24) = v67;
  if (!v67
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO sort_map_new (name, name_order, name_section, sort_key) VALUES ('', 0, %u, '')"), -[ML3MusicLibrary unknownSectionIndex](self, "unknownSectionIndex")), v68 = (void *)objc_claimAutoreleasedReturnValue(), v69 = objc_msgSend(v7, "executeUpdate:", v68), *((_BYTE *)v165 + 24) = v69, v68, v70 = objc_msgSend(v7, "executeUpdate:", CFSTR("DROP TABLE sort_map_new_in_order;")),
        *((_BYTE *)v165 + 24) = v70,
        (v70 & 1) == 0))
  {
LABEL_168:
    v71 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v71, OS_LOG_TYPE_ERROR, "failed to re-order sort-map entries", buf, 2u);
    }

    if (!*((_BYTE *)v165 + 24))
      goto LABEL_163;
  }
  if (v10 && !a4)
  {
    objc_msgSend(v7, "executeQuery:", CFSTR("SELECT sort_map.name FROM sort_map JOIN sort_map_new ON sort_map.name = sort_map_new.name WHERE (sort_map_new.name_order != sort_map.name_order) OR (sort_map_new.name_section != sort_map.name_section) LIMIT 1;"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v72, "hasAtLeastOneRow"))
    {
      v73 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v73, OS_LOG_TYPE_ERROR, "Sort collations changed, need to recompute", buf, 2u);
      }

    }
    else
    {

      if (!v5)
        goto LABEL_128;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = MEMORY[0x1E0C809B0];
  v160[0] = MEMORY[0x1E0C809B0];
  v160[1] = 3221225472;
  v160[2] = __101__ML3MusicLibrary_SortMap__inTransactionUpdateSortMapOnConnection_forceRebuild_forceUpdateOriginals___block_invoke;
  v160[3] = &unk_1E5B61618;
  v163 = &v164;
  v144 = v74;
  v161 = v144;
  v76 = v7;
  v162 = v76;
  +[ML3MusicLibrary enumerateSortMapTablesUsingBlock:](ML3MusicLibrary, "enumerateSortMapTablesUsingBlock:", v160);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v75;
  v154[1] = 3221225472;
  v154[2] = __101__ML3MusicLibrary_SortMap__inTransactionUpdateSortMapOnConnection_forceRebuild_forceUpdateOriginals___block_invoke_2;
  v154[3] = &unk_1E5B61640;
  v142 = v77;
  v155 = v142;
  v156 = self;
  v81 = v78;
  v157 = v81;
  v82 = v79;
  v158 = v82;
  v143 = v80;
  v159 = v143;
  objc_msgSend(v144, "enumerateKeysAndObjectsUsingBlock:", v154);
  v83 = objc_alloc_init(ML3ItemTable);
  -[ML3ItemTable columns](v83, "columns");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "valueForKey:", CFSTR("name"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v86 = v85;
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v150, v172, 16);
  if (v87)
  {
    v88 = *(_QWORD *)v151;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v151 != v88)
          objc_enumerationMutation(v86);
        v90 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * i);
        if ((objc_msgSend(v81, "containsObject:", v90) & 1) == 0)
        {
          objc_msgSend(v81, "addObject:", v90);
          objc_msgSend(CFSTR("item."), "stringByAppendingString:", v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "addObject:", v91);

        }
      }
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v150, v172, 16);
    }
    while (v87);
  }

  +[ML3MusicLibrary itemNewSchemaSQL](ML3MusicLibrary, "itemNewSchemaSQL");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v76, "executeUpdate:", v92);
  *((_BYTE *)v165 + 24) = v93;

  if ((v93 & 1) != 0)
  {
    v94 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v142, "componentsJoinedByString:", CFSTR(", "));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "componentsJoinedByString:", CFSTR(", "));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "componentsJoinedByString:", CFSTR(", "));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "componentsJoinedByString:", CFSTR(" LEFT JOIN "));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "stringWithFormat:", CFSTR("WITH %@ INSERT OR REPLACE INTO item_new (%@) SELECT %@ FROM item LEFT JOIN %@;"),
      v95,
      v96,
      v97,
      v98);
    v99 = objc_claimAutoreleasedReturnValue();

    v100 = objc_msgSend(v76, "executeUpdate:", v99);
    *((_BYTE *)v165 + 24) = v100;
    if (v100)
    {
      v101 = objc_msgSend(v76, "executeUpdate:", CFSTR("DROP TABLE IF EXISTS item;"));
      *((_BYTE *)v165 + 24) = v101;
      if (v101)
      {
        v102 = objc_msgSend(v76, "executeUpdate:", CFSTR("ALTER TABLE item_new RENAME TO item;"));
        *((_BYTE *)v165 + 24) = v102;
        if (v102)
        {
          v148 = 0u;
          v149 = 0u;
          v146 = 0u;
          v147 = 0u;
          +[ML3MusicLibrary itemIndexSchemaSQL](ML3MusicLibrary, "itemIndexSchemaSQL");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v146, v171, 16);
          if (v104)
          {
            v105 = *(_QWORD *)v147;
LABEL_118:
            v106 = 0;
            while (1)
            {
              if (*(_QWORD *)v147 != v105)
                objc_enumerationMutation(v103);
              v107 = objc_msgSend(v76, "executeUpdate:", *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * v106));
              *((_BYTE *)v165 + 24) = v107;
              if ((v107 & 1) == 0)
                break;
              if (v104 == ++v106)
              {
                v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v146, v171, 16);
                if (v104)
                  goto LABEL_118;
                break;
              }
            }
          }

          objc_msgSend(v76, "executeUpdate:", CFSTR("ANALYZE;"));
        }
      }
    }
  }
  else
  {
    v99 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v99, OS_LOG_TYPE_ERROR, "failed to create item_new", buf, 2u);
    }
  }

LABEL_128:
  if (*((_BYTE *)v165 + 24))
    goto LABEL_169;
  v108 = os_log_create("com.apple.amp.medialibrary", "SortMap");
  if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v108, OS_LOG_TYPE_ERROR, "failed to update tables with new name_orders", buf, 2u);
  }

  if (*((_BYTE *)v165 + 24))
  {
LABEL_169:
    v109 = objc_msgSend(v7, "executeUpdate:", CFSTR("DROP TABLE IF EXISTS sort_map;"));
    *((_BYTE *)v165 + 24) = v109;
    if (v109)
    {
      v110 = objc_msgSend(v7, "executeUpdate:", CFSTR("ALTER TABLE sort_map_new RENAME TO sort_map;"));
      *((_BYTE *)v165 + 24) = v110;
      if (v110)
      {
        v111 = objc_msgSend(v7, "executeUpdate:", CFSTR("CREATE INDEX IF NOT EXISTS SortMapSortKeys ON sort_map (sort_key ASC);"));
        *((_BYTE *)v165 + 24) = v111;
        if ((v111 & 1) != 0)
          goto LABEL_170;
      }
    }
    v112 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v112, OS_LOG_TYPE_ERROR, "failed to swap sort_map tables", buf, 2u);
    }

    if (*((_BYTE *)v165 + 24))
    {
LABEL_170:
      v113 = (void *)MEMORY[0x1E0CB3940];
      ML3LocalizationLanguageCanonicalIdentifier();
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO _MLDatabaseProperties (key, value) VALUES ('OrderingLanguage', '%@')"), v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      v116 = objc_msgSend(v7, "executeUpdate:", v115);
      *((_BYTE *)v165 + 24) = v116;
      if (!v116)
        goto LABEL_144;
      v117 = objc_msgSend(v7, "executeUpdate:", CFSTR("UPDATE item_artist SET grouping_key = iPhoneGroupingKey((CASE LENGTH(series_name) WHEN 0 THEN item_artist ELSE series_name END))"));
      *((_BYTE *)v165 + 24) = v117;
      if (!v117)
        goto LABEL_144;
      v118 = objc_msgSend(v7, "executeUpdate:", CFSTR("UPDATE album_artist SET grouping_key = iPhoneGroupingKey(album_artist), sort_order = IFNULL((SELECT name_order FROM sort_map WHERE name = IFNULL(album_artist.sort_album_artist, ML3SortString(album_artist.album_artist))), 0), sort_order_section = IFNULL((SELECT name_section FROM sort_map WHERE name = IFNULL(album_artist.sort_album_artist, ML3SortString(album_artist.album_artist))), 0)"));
      *((_BYTE *)v165 + 24) = v118;
      if (!v118
        || (v119 = objc_msgSend(v7, "executeUpdate:", CFSTR("UPDATE album SET grouping_key = iPhoneGroupingKey(album)")),
            *((_BYTE *)v165 + 24) = v119,
            !v119)
        || (v120 = objc_msgSend(v7, "executeUpdate:", CFSTR("UPDATE composer SET grouping_key = iPhoneGroupingKey(composer)")), *((_BYTE *)v165 + 24) = v120, !v120)|| (v121 = objc_msgSend(v7, "executeUpdate:", CFSTR("UPDATE genre SET grouping_key = iPhoneGroupingKey(genre)")), *((_BYTE *)v165 + 24) = v121, (v121 & 1) == 0))
      {
LABEL_144:
        v122 = os_log_create("com.apple.amp.medialibrary", "SortMap");
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v122, OS_LOG_TYPE_ERROR, "failed to update grouping_key fields", buf, 2u);
        }

      }
      if (*((_BYTE *)v165 + 24))
      {
        -[ML3MusicLibrary _systemUnicodeVersionData](self, "_systemUnicodeVersionData");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM _MLDatabaseProperties WHERE key = '%@'"), CFSTR("MLSortMapUnicodeVersion"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "executeQuery:", v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "objectForFirstRowAndColumn");
        v126 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v123, "isEqualToData:", v126) & 1) != 0)
        {
LABEL_158:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO _MLDatabaseProperties (key, value) VALUES (?, ?)"));
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v170[0] = CFSTR("MLSortMapUnicodeVersion");
          v170[1] = v123;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 2);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = objc_msgSend(v7, "executeUpdate:withParameters:error:", v134, v135, 0);
          *((_BYTE *)v165 + 24) = v136;

          if (!*((_BYTE *)v165 + 24))
          {
            v137 = os_log_create("com.apple.amp.medialibrary", "SortMap");
            if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AC149000, v137, OS_LOG_TYPE_ERROR, "failed to update library unicode version", buf, 2u);
            }

          }
          goto LABEL_163;
        }
        v127 = os_log_create("com.apple.amp.medialibrary", "SortMap");
        if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v127, OS_LOG_TYPE_ERROR, "Unicode version has changed after sort map update. Coalescing mismatched collections...", buf, 2u);
        }

        +[ML3Collection removeOrphanedCollectionsInLibrary:usingConnection:](ML3Collection, "removeOrphanedCollectionsInLibrary:usingConnection:", self, v7);
        v128 = -[ML3MusicLibrary coalesceMismatchedCollectionsUsingConnection:](self, "coalesceMismatchedCollectionsUsingConnection:", v7);
        v129 = os_log_create("com.apple.amp.medialibrary", "SortMap");
        v130 = v129;
        if (v128)
        {
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v131 = "Successfully coalesced mismatched collections.";
            v132 = v130;
            v133 = OS_LOG_TYPE_DEFAULT;
LABEL_156:
            _os_log_impl(&dword_1AC149000, v132, v133, v131, buf, 2u);
          }
        }
        else if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v131 = "failed to coalesce mismatched collections after rebuilding sort map";
          v132 = v130;
          v133 = OS_LOG_TYPE_ERROR;
          goto LABEL_156;
        }

        goto LABEL_158;
      }
    }
  }
LABEL_163:
  v138 = os_log_create("com.apple.amp.medialibrary", "SortMap");
  if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
  {
    v139 = *((unsigned __int8 *)v165 + 24);
    *(_DWORD *)buf = 67109120;
    v169 = v139;
    _os_log_impl(&dword_1AC149000, v138, OS_LOG_TYPE_DEFAULT, "Finished rebuilding the sort_map table. success = %{BOOL}u", buf, 8u);
  }

  v140 = *((_BYTE *)v165 + 24) != 0;
  _Block_object_dispose(&v164, 8);

  return v140;
}

- (BOOL)inTransactionUpdateSearchMapOnConnection:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (objc_msgSend(v3, "executeUpdate:", CFSTR("INSERT OR REPLACE INTO item_search (item_pid, search_title) SELECT item_extra.item_pid, sort_map.name_order from sort_map JOIN item_extra ON item_extra.title = sort_map.name"))&& objc_msgSend(v3, "executeUpdate:", CFSTR("UPDATE item_search SET search_album = IFNULL((SELECT sort_map.name_order FROM sort_map JOIN album ON album.album = sort_map.name JOIN item ON item.album_pid = album.album_pid WHERE item.item_pid = item_search.item_pid), 0)"))&& objc_msgSend(v3, "executeUpdate:", CFSTR("UPDATE item_search SET search_artist = IFNULL((SELECT sort_map.name_order FROM sort_map JOIN item_artist ON item_artist.item_artist = sort_map.name JOIN item ON item.item_artist_pid = item_artist.item_artist_pid WHERE item.item_pid = item_search.item_pid), 0)"))&& objc_msgSend(v3, "executeUpdate:", CFSTR("UPDATE item_search SET search_composer = IFNULL((SELECT sort_map.name_order FROM sort_map JOIN composer ON composer.composer = sort_map.name JOIN item ON item.composer_pid = composer.composer_pid WHERE item.item_pid = item_search.item_pid), 0)"))&& (objc_msgSend(v3, "executeUpdate:", CFSTR("UPDATE item_search SET search_album_artist = IFNULL((SELECT sort_map.name_order FROM sort_map JOIN album_artist ON album_artist.album_artist = sort_map.name JOIN item ON item.album_artist_pid = album_artist.album_artist_pid WHERE item.item_pid = item_search.item_pid), 0)")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_ERROR, "failed to update item_search entries", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (BOOL)validateSortMapUnicodeVersionOnConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLSortMapUnicodeVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary _systemUnicodeVersionData](self, "_systemUnicodeVersionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v5, "isEqualToData:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "System unicode version does not match version stored in the library -- upgrading sort map", v10, 2u);
    }

    v7 = -[ML3MusicLibrary updateSortMapOnConnection:forceUpdateOriginals:](self, "updateSortMapOnConnection:forceUpdateOriginals:", v4, 1);
  }

  return v7;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)nameOrderForString:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  const char *v15;
  __int128 v16;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3010000000;
    v15 = "";
    v16 = *(_OWORD *)"";
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__ML3MusicLibrary_SortMap__nameOrderForString___block_invoke;
    v9[3] = &unk_1E5B64FE0;
    v10 = v4;
    v11 = &v12;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v9);
    v6 = v13[4];
    v5 = v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v5 = -[ML3MusicLibrary unknownSectionIndex](self, "unknownSectionIndex");
    v6 = 0;
  }

  v7 = v6;
  v8 = v5;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (id)insertStringsIntoSortMap:(id)a3 didReSortMap:(BOOL *)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  BOOL *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5079;
  v18 = __Block_byref_object_dispose__5080;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__ML3MusicLibrary_SortMap__insertStringsIntoSortMap_didReSortMap___block_invoke;
  v10[3] = &unk_1E5B61668;
  v10[4] = self;
  v7 = v6;
  v12 = &v14;
  v13 = a4;
  v11 = v7;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)insertStringsIntoSortMap:(id)a3
{
  return -[ML3MusicLibrary insertStringsIntoSortMap:didReSortMap:](self, "insertStringsIntoSortMap:didReSortMap:", a3, 0);
}

- (int64_t)insertStringIntoSortMapNoTransaction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[6];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  int64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  _QWORD v62[2];
  _QWORD v63[2];
  id v64;
  _QWORD v65[6];

  v65[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3SortMap.m"), 426, CFSTR("blank string cannot be inserted into sort map"));

  }
  -[ML3MusicLibrary checkoutWriterConnection](self, "checkoutWriterConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v5;
  v65[1] = v5;
  v65[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO sort_map (name, sort_key, name_section) VALUES (?, iPhoneSortKey(?), iPhoneSortSection(iPhoneSortKey(?)))"), v7, 0);

  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 1;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__5079;
  v44 = __Block_byref_object_dispose__5080;
  v45 = 0;
  v64 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", CFSTR("SELECT sort_map1.name_order, sort_map1.name FROM sort_map AS sort_map1 WHERE sort_map1.sort_key < (SELECT sort_map2.sort_key FROM sort_map AS sort_map2 WHERE name = ?) ORDER BY sort_map1.sort_key DESC, sort_map1.name_order DESC LIMIT 1;"),
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __65__ML3MusicLibrary_SortMap__insertStringIntoSortMapNoTransaction___block_invoke;
  v39[3] = &unk_1E5B65040;
  v39[4] = &v46;
  v39[5] = &v40;
  objc_msgSend(v9, "enumerateRowsWithBlock:", v39);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0x7FFFFFFFFFFFFFFFLL;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__5079;
  v33 = __Block_byref_object_dispose__5080;
  v34 = 0;
  v63[0] = v5;
  v63[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", CFSTR("SELECT sort_map1.name_order, sort_map1.name FROM sort_map AS sort_map1 WHERE sort_map1.sort_key >= (SELECT sort_map2.sort_key FROM sort_map AS sort_map2 WHERE name = ?) AND sort_map1.name != ? ORDER BY sort_map1.sort_key ASC, sort_map1.name_order ASC LIMIT 1;"),
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __65__ML3MusicLibrary_SortMap__insertStringIntoSortMapNoTransaction___block_invoke_2;
  v28[3] = &unk_1E5B65040;
  v28[4] = &v35;
  v28[5] = &v29;
  objc_msgSend(v12, "enumerateRowsWithBlock:", v28);
  v13 = v36[3];
  if (v13 >= 0)
    v14 = v36[3];
  else
    v14 = v13 + 1;
  v15 = v47[3];
  if (v15 >= 0)
    v16 = v47[3];
  else
    v16 = v15 + 1;
  v17 = (v16 >> 1) + (v14 >> 1);
  if (v17 == v13 || v17 == v15)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (v16 >> 1) + (v14 >> 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v18;
  v62[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v6, "executeUpdate:withParameters:error:", CFSTR("UPDATE sort_map SET name_order = ? WHERE name = ?;"),
          v19,
          0);

  if ((v20 & 1) == 0)
  {
    v21 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = v47[3];
      v23 = v41[5];
      v24 = v36[3];
      v25 = v30[5];
      *(_DWORD *)buf = 134219266;
      v51 = v17;
      v52 = 2048;
      v53 = v22;
      v54 = 2114;
      v55 = v23;
      v56 = 2048;
      v57 = v24;
      v58 = 2114;
      v59 = v25;
      v60 = 2114;
      v61 = v5;
      _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "Could not not insert name_order = %lld (between %lld/%{public}@ and %lld/%{public}@) for %{public}@", buf, 0x3Eu);
    }

LABEL_15:
    -[ML3MusicLibrary updateSortMap](self, "updateSortMap");
    v17 = -[ML3MusicLibrary nameOrderForString:](self, "nameOrderForString:", v5);
  }
  -[ML3MusicLibrary checkInDatabaseConnection:](self, "checkInDatabaseConnection:", v6);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v17;
}

- (id)_systemUnicodeVersionData
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5079;
  v9 = __Block_byref_object_dispose__5080;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__ML3MusicLibrary_SortMap___systemUnicodeVersionData__block_invoke;
  v4[3] = &unk_1E5B61690;
  v4[4] = &v5;
  -[ML3MusicLibrary accessSortKeyBuilder:](self, "accessSortKeyBuilder:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)coalesceMismatchedCollectionsUsingConnection:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  objc_class *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ML3Collection collectionEntityClasses](ML3Collection, "collectionEntityClasses");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(objc_class **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[objc_class isSubclassOfClass:](v11, "isSubclassOfClass:", objc_opt_class(), (_QWORD)v15))
        {
          if (!-[ML3MusicLibrary _coalesceMismatchedCollectionClass:usingConnection:](self, "_coalesceMismatchedCollectionClass:usingConnection:", v11, v4))
          {
            v12 = os_log_create("com.apple.amp.medialibrary", "SortMap");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              NSStringFromClass(v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v20 = v13;
              _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "Failed to coalesce potentially mismatched collection %{public}@", buf, 0xCu);

            }
            goto LABEL_15;
          }
          v8 = 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
LABEL_15:
    v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)_coalesceMismatchedCollectionClass:(Class)a3 usingConnection:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id obj;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  Class v58;
  _QWORD v59[4];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  uint64_t v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  _QWORD v76[2];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[objc_class databaseTable](a3, "databaseTable");
  v7 = objc_claimAutoreleasedReturnValue();
  -[objc_class trackForeignPersistentID](a3, "trackForeignPersistentID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = a3;
  -[objc_class propertiesForGroupingUniqueCollections](a3, "propertiesForGroupingUniqueCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3SortMap.m"), 511, CFSTR("Collection %@ has no properties for grouping unique collections. This should be impossible!"), v7);

  }
  v9 = 0x1E0C99000uLL;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v49 = (void *)v7;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@ GROUP BY %@ HAVING COUNT(*) > 1"), v47, v7, v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __79__ML3MusicLibrary_SortMap___coalesceMismatchedCollectionClass_usingConnection___block_invoke;
  v69[3] = &unk_1E5B65EE0;
  v13 = v10;
  v70 = v13;
  v45 = v11;
  objc_msgSend(v11, "enumerateRowsWithBlock:", v69);
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v66 != v16)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = ?"), *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObject:", v18);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    }
    while (v15);
  }

  objc_msgSend(v55, "componentsJoinedByString:", CFSTR(" AND "));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM %@ WHERE %@"), v49, v44);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE item SET %@ = ? WHERE %@ = ?"), v48, v48);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v51 = v13;
  v56 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
  if (v56)
  {
    v54 = *(_QWORD *)v62;
    v21 = 1;
    v50 = v19;
    do
    {
      for (j = 0; j != v56; ++j)
      {
        if (*(_QWORD *)v62 != v54)
          objc_enumerationMutation(v51);
        v23 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
        v24 = objc_alloc_init(*(Class *)(v9 + 3560));
        objc_msgSend(v6, "executeQuery:withParameters:", v19, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v12;
        v59[1] = 3221225472;
        v59[2] = __79__ML3MusicLibrary_SortMap___coalesceMismatchedCollectionClass_usingConnection___block_invoke_2;
        v59[3] = &unk_1E5B65EE0;
        v26 = v24;
        v60 = v26;
        objc_msgSend(v25, "enumerateRowsWithBlock:", v59);
        v27 = objc_msgSend(v26, "count");
        if (v27 >= 2)
        {
          v28 = v27;
          v53 = v25;
          objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 2;
          v31 = 1;
          while (1)
          {
            objc_msgSend(v26, "objectAtIndexedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v76[0] = v29;
            v76[1] = v32;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v6, "executeUpdate:withParameters:error:", v20, v33, 0);

            v35 = os_log_create("com.apple.amp.medialibrary", "SortMap");
            v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
            if ((v34 & 1) == 0)
              break;
            if (v36)
            {
              v37 = objc_msgSend(v32, "longLongValue");
              *(_DWORD *)buf = 138543618;
              v73 = (uint64_t)v58;
              v74 = 2048;
              v75 = v37;
              _os_log_impl(&dword_1AC149000, v35, OS_LOG_TYPE_ERROR, "Deleting duplicate %{public}@ %lld", buf, 0x16u);
            }

            v71 = objc_msgSend(v32, "longLongValue");
            if ((-[objc_class deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](v58, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", self, 2, &v71, 1, v6) & 1) == 0)
            {
              v40 = os_log_create("com.apple.amp.medialibrary", "SortMap");
              v9 = 0x1E0C99000;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v41 = objc_msgSend(v32, "longLongValue");
                *(_DWORD *)buf = 134217984;
                v73 = v41;
                _os_log_impl(&dword_1AC149000, v40, OS_LOG_TYPE_ERROR, "Failed to delete duplicate collection with pid %lld", buf, 0xCu);
              }

              goto LABEL_29;
            }

            v31 = v30;
            if (v28 <= v30++)
            {
              v21 = 1;
              v9 = 0x1E0C99000;
              v25 = v53;
              goto LABEL_30;
            }
          }
          if (v36)
          {
            v39 = objc_msgSend(v29, "longLongValue");
            *(_DWORD *)buf = 134217984;
            v73 = v39;
            _os_log_impl(&dword_1AC149000, v35, OS_LOG_TYPE_ERROR, "Failed to repair entities converging on PID %lld", buf, 0xCu);
          }

          v9 = 0x1E0C99000;
LABEL_29:
          v25 = v53;

          v21 = 0;
LABEL_30:

          v12 = MEMORY[0x1E0C809B0];
          v19 = v50;
        }

      }
      v56 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    }
    while (v56);
  }
  else
  {
    v21 = 1;
  }

  return v21 & 1;
}

void __79__ML3MusicLibrary_SortMap___coalesceMismatchedCollectionClass_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = a2;
  v3 = objc_msgSend(v12, "columnCount");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
  if (v3)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      objc_msgSend(v12, "valueForColumnIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;

      objc_msgSend(v4, "addObject:", v10);
      v5 = v6;
    }
    while (v3 > v6++);
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __79__ML3MusicLibrary_SortMap___coalesceMismatchedCollectionClass_usingConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "numberForColumnIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __53__ML3MusicLibrary_SortMap___systemUnicodeVersionData__block_invoke(uint64_t a1, uint64_t a2)
{
  CFDataRef v3;
  uint64_t v4;
  void *v5;

  v3 = iPhoneSortKeyBuilderCopyVersionData(a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __65__ML3MusicLibrary_SortMap__insertStringIntoSortMapNoTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __65__ML3MusicLibrary_SortMap__insertStringIntoSortMapNoTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __66__ML3MusicLibrary_SortMap__insertStringsIntoSortMap_didReSortMap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ML3SortMap *v7;

  v3 = a2;
  v7 = -[ML3SortMap initWithConnection:library:preloadNames:]([ML3SortMap alloc], "initWithConnection:library:preloadNames:", v3, *(_QWORD *)(a1 + 32), (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") > 0x32);

  if (-[ML3SortMap insertStringsIntoSortMap:didReSortMap:](v7, "insertStringsIntoSortMap:didReSortMap:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56))&& -[ML3SortMap commitUpdates](v7, "commitUpdates"))
  {
    -[ML3SortMap nameOrders](v7, "nameOrders");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __47__ML3MusicLibrary_SortMap__nameOrderForString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT name_order, name_section FROM sort_map WHERE name = ? LIMIT 1;"),
    v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ML3MusicLibrary_SortMap__nameOrderForString___block_invoke_2;
  v7[3] = &unk_1E5B65200;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "enumerateRowsWithBlock:", v7);

}

void __47__ML3MusicLibrary_SortMap__nameOrderForString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v6 = a2;
  v7 = objc_msgSend(v6, "int64ForColumnIndex:", 0);
  v8 = objc_msgSend(v6, "intForColumnIndex:", 1);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v9 + 32) = v7;
  *(_QWORD *)(v9 + 40) = v8;
  *a4 = 1;
}

void __101__ML3MusicLibrary_SortMap__inTransactionUpdateSortMapOnConnection_forceRebuild_forceUpdateOriginals___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (v12 && objc_msgSend(v9, "isEqualToString:", CFSTR("item")))
    {
      v16[0] = v11;
      v16[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IFNULL((SELECT sort_map_new.name_order FROM sort_map_new WHERE sort_map_new.name = (CASE %@ WHEN '' THEN NULL ELSE %@ END)), 0)"), v11, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = %@;"), v9, v10, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "executeUpdate:", v15);

    }
  }

}

void __101__ML3MusicLibrary_SortMap__inTransactionUpdateSortMapOnConnection_forceRebuild_forceUpdateOriginals___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_view"));
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "stringByAppendingString:", CFSTR("_sq"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%1$@(pid, name_order, name_section) AS (SELECT %3$@.pid, sort_map_new.name_order, sort_map_new.name_section FROM sort_map_new JOIN %2$@ AS %3$@ ON sort_map_new.name = %3$@.name UNION SELECT 0, 0, %4$u)"), v23, v9, v8, objc_msgSend(*(id *)(a1 + 40), "unknownSectionIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  v13 = *(void **)(a1 + 48);
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("item."), &stru_1E5B66908);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  v15 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.name_order"), v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  v17 = *(void **)(a1 + 48);
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("_section"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addObject:", v18);
  v19 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.name_section"), v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v20);

  v21 = *(void **)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%1$@ ON %2$@ = %1$@.pid"), v23, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v22);

}

uint64_t __75__ML3MusicLibrary_SortMap__updateSortMapOnConnection_forceUpdateOriginals___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "inTransactionUpdateSortMapOnConnection:forceUpdateOriginals:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56)))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "inTransactionUpdateSearchMapOnConnection:", *(_QWORD *)(a1 + 40));
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (id)genreForGenre:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ML3MusicLibrary *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6100;
  v17 = __Block_byref_object_dispose__6101;
  v18 = 0;
  -[ML3MusicLibrary groupingKeyForString:](self, "groupingKeyForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__ML3MusicLibrary_ML3GenreAdditions__genreForGenre___block_invoke;
    v9[3] = &unk_1E5B62DC0;
    v11 = self;
    v12 = &v13;
    v10 = v5;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v9);

  }
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __52__ML3MusicLibrary_ML3GenreAdditions__genreForGenre___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a1[4];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT ROWID FROM genre WHERE (grouping_key = ?)"), v5, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "int64ValueForFirstRowAndColumn");
  if (v7)
    v8 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Genre, "newWithPersistentID:inLibrary:", v7, a1[5]);
  else
    v8 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v8);
  if (v7)

}

- (id)composerForComposerName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ML3MusicLibrary *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7583;
  v17 = __Block_byref_object_dispose__7584;
  v18 = 0;
  -[ML3MusicLibrary groupingKeyForString:](self, "groupingKeyForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__ML3MusicLibrary_ML3ComposerAdditions__composerForComposerName___block_invoke;
    v9[3] = &unk_1E5B62DC0;
    v11 = self;
    v12 = &v13;
    v10 = v5;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v9);

  }
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __65__ML3MusicLibrary_ML3ComposerAdditions__composerForComposerName___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a1[4];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT ROWID FROM composer WHERE (grouping_key = ?)"), v5, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "int64ValueForFirstRowAndColumn");
  if (v7)
    v8 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Composer, "newWithPersistentID:inLibrary:", v7, a1[5]);
  else
    v8 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v8);
  if (v7)

}

- (id)albumArtistForEffectiveAlbumArtistName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ML3MusicLibrary *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7675;
  v17 = __Block_byref_object_dispose__7676;
  v18 = 0;
  -[ML3MusicLibrary groupingKeyForString:](self, "groupingKeyForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__ML3MusicLibrary_ML3AlbumArtistAdditions__albumArtistForEffectiveAlbumArtistName___block_invoke;
    v9[3] = &unk_1E5B62DC0;
    v11 = self;
    v12 = &v13;
    v10 = v5;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 0, v9);

  }
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __83__ML3MusicLibrary_ML3AlbumArtistAdditions__albumArtistForEffectiveAlbumArtistName___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a1[4];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT ROWID FROM album_artist WHERE (grouping_key = ?)"), v5, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "int64ValueForFirstRowAndColumn");
  if (v7)
    v8 = +[ML3Entity newWithPersistentID:inLibrary:](ML3AlbumArtist, "newWithPersistentID:inLibrary:", v7, a1[5]);
  else
    v8 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v8);
  if (v7)

}

- (BOOL)updateSystemPlaylistNamesForCurrentLanguageUsingConnection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GENIUS_PLAYLIST_NAME"), &stru_1E5B66908, CFSTR("MLLocalizable"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = &stru_1E5B66908;
  v9 = v8;

  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("(container.is_container_type_active_target AND container.smart_is_genius)"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity anyInLibrary:predicate:](ML3Container, "anyInLibrary:predicate:", self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ML3MusicLibrary _updateSystemPlaylist:withName:usingConnection:](self, "_updateSystemPlaylist:withName:usingConnection:", v11, v9, v4);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ON_THE_GO_PLAYLIST_NAME"), &stru_1E5B66908, CFSTR("MLLocalizable"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = &stru_1E5B66908;
  v16 = v15;

  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("(container.is_container_type_active_target AND (container.container_type = 2))"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity anyInLibrary:predicate:](ML3Container, "anyInLibrary:predicate:", self, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[ML3MusicLibrary _updateSystemPlaylist:withName:usingConnection:](self, "_updateSystemPlaylist:withName:usingConnection:", v18, v16, v4);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_HISTORY_PLAYLIST_NAME"), &stru_1E5B66908, CFSTR("MLLocalizable"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (__CFString *)v20;
  else
    v22 = &stru_1E5B66908;
  v23 = v22;

  -[ML3MusicLibrary currentDevicePlaybackHistoryPlaylist](self, "currentDevicePlaybackHistoryPlaylist");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[ML3MusicLibrary _updateSystemPlaylist:withName:usingConnection:](self, "_updateSystemPlaylist:withName:usingConnection:", v24, v23, v4);
  +[ML3Container updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary:](ML3Container, "updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary:", self);

  return 1;
}

- (void)updateOrderingLanguagesForCurrentLanguage
{
  uint64_t v3;
  id v4;

  ML3LocalizationLanguageCanonicalIdentifier();
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    __assert_rtn("-[ML3MusicLibrary(ProcessingAdditions) updateOrderingLanguagesForCurrentLanguage]", "ML3MusicLibraryProcessingAdditions.m", 50, "currentLanaguage");
  v4 = (id)v3;
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v3, CFSTR("OrderingLanguage"));

}

- (void)_updateSystemPlaylist:(id)a3 withName:(id)a4 usingConnection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v23[0] = v8;
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = a5;
    objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v14 = objc_msgSend(v11, "executeUpdate:withParameters:error:", CFSTR("UPDATE container SET name = ? WHERE container_pid = ?"), v13, &v18);

    v15 = v18;
    if ((v14 & 1) == 0)
    {
      v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(v7, "persistentID");
        *(_DWORD *)buf = 134218242;
        v20 = v17;
        v21 = 2114;
        v22 = v9;
        _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "Failed to update name of container %lld (%{public}@)", buf, 0x16u);
      }

    }
  }

}

- (int64_t)clearPurgeableStorageAmount:(int64_t)a3 withUrgency:(unint64_t)a4
{
  return -[ML3MusicLibrary clearPurgeableStorageAmount:withUrgency:includeAutoFilledTracks:](self, "clearPurgeableStorageAmount:withUrgency:includeAutoFilledTracks:", a3, a4, +[ML3MusicLibrary autoFilledTracksArePurgeable](ML3MusicLibrary, "autoFilledTracksArePurgeable"));
}

- (int64_t)clearPurgeableStorageAmount:(int64_t)a3 withUrgency:(unint64_t)a4 includeAutoFilledTracks:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *v9;
  char IsWatch;
  char v11;
  int64_t v12;
  int64_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v18;
  _BYTE v19[10];
  int v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134218496;
    *(_QWORD *)v19 = a3;
    *(_WORD *)&v19[8] = 1024;
    v20 = a4;
    v21 = 1024;
    v22 = v5;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "Purging media data of at least %lli bytes for urgency %d. includeAutoFilledTracks=%d", (uint8_t *)&v18, 0x18u);
  }

  IsWatch = MSVDeviceIsWatch();
  if (a3 < 1)
    v11 = 1;
  else
    v11 = IsWatch;
  if ((v11 & 1) != 0)
    v12 = 0;
  else
    v12 = -[ML3MusicLibrary _clearOrphanedAssetsOfAmount:withUrgency:](self, "_clearOrphanedAssetsOfAmount:withUrgency:", a3, a4);
  if (-[ML3MusicLibrary currentDatabaseVersion](self, "currentDatabaseVersion") == 2200070)
  {
    v12 += -[ML3MusicLibrary _clearDatabaseFileFreeSpace](self, "_clearDatabaseFileFreeSpace");
    if (v12 < a3)
    {
      if (-[ML3MusicLibrary _shouldPurgeManagedAlbumsTracksForUrgency:](self, "_shouldPurgeManagedAlbumsTracksForUrgency:", a4))
      {
        v13 = -[ML3MusicLibrary _managedClearPurgeableTracksOfAmount:urgency:](self, "_managedClearPurgeableTracksOfAmount:urgency:", a3, a4);
      }
      else
      {
        v13 = -[ML3MusicLibrary _clearPurgeableTracksOfAmount:withUrgency:includeAutoFilledTracks:](self, "_clearPurgeableTracksOfAmount:withUrgency:includeAutoFilledTracks:", a3, a4, v5);
      }
      v12 += v13;
    }
  }
  else
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = -[ML3MusicLibrary currentDatabaseVersion](self, "currentDatabaseVersion");
      v18 = 67109376;
      *(_DWORD *)v19 = v15;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = 2200070;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Skipping purge for tracks because DB is not present or invalid (db version=%d, current version=%d)", (uint8_t *)&v18, 0xEu);
    }

  }
  v16 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134217984;
    *(_QWORD *)v19 = v12;
    _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "Purged %lld bytes of media data", (uint8_t *)&v18, 0xCu);
  }

  return v12;
}

- (int64_t)clearAllRemovedTracks
{
  NSObject *v3;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Clearing removed tracks.", v5, 2u);
  }

  return -[ML3MusicLibrary _clearPurgeableTracksOfAmount:withUrgency:includeCloudAssets:includeAutoFilledTracks:](self, "_clearPurgeableTracksOfAmount:withUrgency:includeCloudAssets:includeAutoFilledTracks:", 0x7FFFFFFFFFFFFFFFLL, 2, 0, 0);
}

- (void)enumeratePurgeableAlbumTracksForUrgency:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a4;
  if (-[ML3MusicLibrary _shouldPurgeManagedAlbumsTracksForUrgency:](self, "_shouldPurgeManagedAlbumsTracksForUrgency:", a3))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __87__ML3MusicLibrary_CacheManagement__enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke;
    v7[3] = &unk_1E5B63050;
    v8 = v6;
    -[ML3MusicLibrary _enumeratePurgeableAlbumTracksForUrgency:usingBlock:](self, "_enumeratePurgeableAlbumTracksForUrgency:usingBlock:", a3, v7);

  }
}

- (unint64_t)totalSizeForAllNonCacheTracks
{
  void *v3;
  unint64_t v4;

  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("base_location_id"), &unk_1E5BAB538, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ML3MusicLibrary _totalSizeForTracksPredicate:](self, "_totalSizeForTracksPredicate:", v3);

  return v4;
}

- (unint64_t)totalSizeForAllRedownloadableNonCacheTracks
{
  void *v3;
  unint64_t v4;

  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("base_location_id"), &unk_1E5BAB538, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ML3MusicLibrary _totalSizeForTracksPredicate:](self, "_totalSizeForTracksPredicate:", v3);

  return v4;
}

- (unint64_t)totalSizeForAllNonRedownloadableTracks
{
  void *v3;
  unint64_t v4;

  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("base_location_id"), &unk_1E5BAB538, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ML3MusicLibrary _totalSizeForTracksPredicate:](self, "_totalSizeForTracksPredicate:", v3);

  return v4;
}

- (unint64_t)totalSizeForAllSyncedTracks
{
  void *v3;
  unint64_t v4;

  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("base_location_id"), &unk_1E5BAB550, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ML3MusicLibrary _totalSizeForTracksPredicate:](self, "_totalSizeForTracksPredicate:", v3);

  return v4;
}

- (BOOL)markSystemPurgeableMusicPath:(id)a3 forUrgency:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  __CFString *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  int *v17;
  char *v18;
  BOOL v19;
  const __CFString *v21;
  uint64_t v22;
  uint8_t buf[4];
  ML3MusicLibrary *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v22 = 65538;
  switch(a4)
  {
    case 0uLL:
      v8 = 66050;
      goto LABEL_9;
    case 1uLL:
      v8 = 66562;
      goto LABEL_9;
    case 2uLL:
      v8 = 67586;
      goto LABEL_9;
    case 3uLL:
      v8 = 98306;
LABEL_9:
      v22 = v8;
      goto LABEL_11;
    case 4uLL:
      v22 = 0;
      goto LABEL_11;
    default:
      if (a4 == 0x7FFFFFFF)
      {
        v9 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v24 = self;
          v10 = "%{public}@ Not marking purgeability for undefined urgency.";
          v11 = v9;
          v12 = 12;
LABEL_14:
          _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
LABEL_11:
      v13 = (__CFString *)objc_retainAutorelease(v6);
      v14 = fsctl((const char *)-[__CFString UTF8String](v13, "UTF8String"), 0xC0084A44uLL, &v22, 0);
      v15 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
      v9 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = v22;
          v17 = __error();
          v18 = strerror(*v17);
          *(_DWORD *)buf = 138544131;
          v24 = self;
          v25 = 2113;
          v26 = v13;
          v27 = 2048;
          v28 = v16;
          v29 = 2080;
          v30 = (uint64_t)v18;
          v10 = "%{public}@ Failed to set purgeability for path %{private}@. flags=%llu error=%s";
          v11 = v9;
          v12 = 42;
          goto LABEL_14;
        }
LABEL_15:
        v19 = 0;
        goto LABEL_16;
      }
      v19 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        switch(a4)
        {
          case 1uLL:
            v21 = CFSTR("medium");
            break;
          case 2uLL:
            v21 = CFSTR("high");
            break;
          case 3uLL:
            v21 = CFSTR("special");
            break;
          case 4uLL:
            v21 = CFSTR("none");
            break;
          default:
            if (a4 == 0x7FFFFFFF)
              v21 = CFSTR("undefined");
            else
              v21 = CFSTR("low");
            break;
        }
        *(_DWORD *)buf = 138544131;
        v24 = self;
        v25 = 2114;
        v26 = v21;
        v27 = 2113;
        v28 = (uint64_t)v13;
        v29 = 2048;
        v30 = v22;
        _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_INFO, "%{public}@ Marked purgeability level %{public}@ for path %{private}@. flags=%llu", buf, 0x2Au);
      }
LABEL_16:

      return v19;
  }
}

- (void)updateRootArtworkPurgeability
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  ML3MusicLibrary *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((MSVDeviceSupportsMultipleLibraries() & 1) != 0)
  {
    -[ML3MusicLibrary rootArtworkCacheDirectory](self, "rootArtworkCacheDirectory");
    v3 = objc_claimAutoreleasedReturnValue();
    -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3MusicLibrary databasePath](self, "databasePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3MusicLibrary autoupdatingSharedLibraryPath](ML3MusicLibrary, "autoupdatingSharedLibraryPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    v8 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        -[ML3MusicLibrary databasePath](self, "databasePath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543619;
        v14 = self;
        v15 = 2113;
        v16 = v10;
        _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating multi-user artwork purgeability for primary user. path=%{private}@", (uint8_t *)&v13, 0x16u);

      }
      v11 = 4;
      -[ML3MusicLibrary markSystemPurgeableMusicPath:forUrgency:](self, "markSystemPurgeableMusicPath:forUrgency:", v3, 4);
    }
    else
    {
      if (v9)
      {
        -[ML3MusicLibrary databasePath](self, "databasePath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543619;
        v14 = self;
        v15 = 2113;
        v16 = v12;
        _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating multi-user artwork purgeability for non-primary user. path=%{private}@", (uint8_t *)&v13, 0x16u);

      }
      MSVEnableDirStatsForDirectory();
      -[ML3MusicLibrary markSystemPurgeableMusicPath:forUrgency:](self, "markSystemPurgeableMusicPath:forUrgency:", v3, 0);
      MSVEnableDirStatsForDirectory();
      v11 = 1;
    }
    -[ML3MusicLibrary markSystemPurgeableMusicPath:forUrgency:](self, "markSystemPurgeableMusicPath:forUrgency:", v4, v11);

  }
  else
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = self;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Root artwork purgeability not supported on single-user devices.", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (unint64_t)_minimumPurgeableStorageForUrgency:(unint64_t)a3
{
  if (a3 == 3)
    return 0;
  else
    return +[ML3MusicLibrary minimumPurgeableStorage](ML3MusicLibrary, "minimumPurgeableStorage");
}

- (unint64_t)_totalSizeForTracksPredicate:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  +[ML3Entity queryWithLibrary:predicate:](ML3Track, "queryWithLibrary:predicate:", self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAggregateFunction:onEntitiesForProperty:", CFSTR("TOTAL"), CFSTR("item_extra.file_size"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  return v5;
}

- (BOOL)_shouldPurgeManagedAlbumsTracksForUrgency:(unint64_t)a3
{
  return +[ML3MusicLibrary shouldOptimizeStorage](ML3MusicLibrary, "shouldOptimizeStorage", a3);
}

- (BOOL)_unmanagedPurgeShouldPurgeKeepLocalTracksForUrgency:(unint64_t)a3
{
  if (a3 == 3)
  {
    if ((MSVDeviceIsWatch() & 1) != 0)
      return 1;
  }
  else if (a3 < 2)
  {
    return 0;
  }
  return +[ML3MusicLibrary shouldOptimizeStorage](ML3MusicLibrary, "shouldOptimizeStorage");
}

- (int64_t)_databaseFileFreeSpace
{
  NSObject *v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = 0;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "Purgeable database free space: %lld bytes", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (int64_t)_cloudAssetsTotalSize
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[ML3MusicLibrary pathForBaseLocationPath:](self, "pathForBaseLocationPath:", 200);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  -[ML3MusicLibrary pathForBaseLocationPath:](self, "pathForBaseLocationPath:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v9 += ML3GetDiskUsageForPath(*(void **)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)totalSizeForArtwork
{
  void *v2;
  unint64_t DiskUsageForPath;

  -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DiskUsageForPath = ML3GetDiskUsageForPath(v2);

  return DiskUsageForPath;
}

- (unint64_t)_managedPurgeableTracksTotalSizeWithUrgency:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__ML3MusicLibrary_CacheManagement___managedPurgeableTracksTotalSizeWithUrgency___block_invoke;
  v13[3] = &unk_1E5B63080;
  v13[4] = &v14;
  -[ML3MusicLibrary _enumeratePurgeableStreamedTracksForUrgency:usingBlock:](self, "_enumeratePurgeableStreamedTracksForUrgency:usingBlock:", a3, v13);
  v6 = v15[3];
  v7 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = v6;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Purgeable cached tracks size: %lld bytes", buf, 0xCu);
  }

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __80__ML3MusicLibrary_CacheManagement___managedPurgeableTracksTotalSizeWithUrgency___block_invoke_25;
  v12[3] = &unk_1E5B630A8;
  v12[4] = &v14;
  -[ML3MusicLibrary _enumeratePurgeableAlbumTracksForUrgency:usingBlock:](self, "_enumeratePurgeableAlbumTracksForUrgency:usingBlock:", a3, v12);
  v8 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v15[3] - v6;
    *(_DWORD *)buf = 134217984;
    v19 = v9;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "Purgeable managed tracks size: %lld bytes", buf, 0xCu);
  }

  v10 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v10;
}

- (unint64_t)_managedClearPurgeableTracksOfAmount:(unint64_t)a3 urgency:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  _QWORD v16[10];
  _QWORD v17[9];
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke;
  v26[3] = &unk_1E5B630D0;
  v9 = v7;
  v27 = v9;
  v28 = &v30;
  v29 = a3;
  -[ML3MusicLibrary _enumeratePurgeableStreamedTracksForUrgency:usingBlock:](self, "_enumeratePurgeableStreamedTracksForUrgency:usingBlock:", a4, v26);
  v10 = +[ML3Track unlinkRedownloadableAssetsFromLibrary:persistentIDs:](ML3Track, "unlinkRedownloadableAssetsFromLibrary:persistentIDs:", self, v9);
  v11 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Purged streaming assets %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v13 = v31[3];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "Failed to purge streaming assets %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v13 = 0;
    v31[3] = 0;
  }
  if (v13 < a3)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__11281;
    v37 = __Block_byref_object_dispose__11282;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__11281;
    v24 = __Block_byref_object_dispose__11282;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__11281;
    v18[4] = __Block_byref_object_dispose__11282;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_29;
    v17[3] = &unk_1E5B63128;
    v17[4] = self;
    v17[5] = v18;
    v17[6] = &v20;
    v17[7] = &buf;
    v17[8] = a4;
    -[ML3MusicLibrary _enumeratePurgeableAlbumTracksForUrgency:usingBlock:](self, "_enumeratePurgeableAlbumTracksForUrgency:usingBlock:", a4, v17);
    v14 = (void *)v21[5];
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_3;
    v16[3] = &unk_1E5B631A8;
    v16[4] = self;
    v16[5] = v18;
    v16[6] = &v30;
    v16[7] = &buf;
    v16[8] = a4;
    v16[9] = a3;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v16);
    v13 = v31[3];
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&buf, 8);

  }
  _Block_object_dispose(&v30, 8);
  return v13;
}

- (id)_purgeableItemsPredicateSQLWithUrgency:(unint64_t)a3
{
  return CFSTR("((item.base_location_id > 0) AND (item_stats.is_alarm = 0) AND ((item_stats.chosen_by_auto_fill = 1) OR (item.remote_location_id >= 50 AND item.remote_location_id < 300)))");
}

- (id)_purgeableNonCachedItemsPredicateSQL
{
  return CFSTR("((item.base_location_id > 200) AND (item_stats.is_alarm = 0) AND ((item_stats.chosen_by_auto_fill = 1) OR (item.remote_location_id >= 50 AND item.remote_location_id < 300)))");
}

- (id)_nonPurgeableAlbumsQuerySQLWithUrgency:(unint64_t)a3
{
  if (a3 >= 2)
    return CFSTR("SELECT DISTINCT album_pid FROM item JOIN item_store USING (item_pid) JOIN item_extra USING (item_pid) JOIN item_stats USING (item_pid) WHERE (item.base_location_id > 0 AND item.remote_location_id < 200) OR (item.base_location_id = 0 AND item.keep_local_status = 1)");
  else
    return CFSTR("SELECT DISTINCT album_pid FROM item JOIN item_store USING (item_pid) JOIN item_extra USING (item_pid) JOIN item_stats USING (item_pid) WHERE (item.base_location_id > 0 AND (item.remote_location_id < 200 OR item_stats.liked_state = 2)) OR (item.base_location_id = 0 AND item.keep_local_status = 1)");
}

- (id)_purgeableAlbumsQuerySQLWithUrgency:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[ML3MusicLibrary _nonPurgeableAlbumsQuerySQLWithUrgency:](self, "_nonPurgeableAlbumsQuerySQLWithUrgency:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary _purgeableItemsPredicateSQLWithUrgency:](self, "_purgeableItemsPredicateSQLWithUrgency:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT album_pid, max(max(date_accessed), max(date_added), max(date_played)) AS date_accessed, max(liked_state = 2) AS liked_state FROM item JOIN item_stats USING (item_pid) JOIN item_extra USING (item_pid) WHERE album_pid NOT IN (%@) AND (%@) GROUP BY album_pid ORDER BY liked_state, date_accessed"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_enumeratePurgeableStreamedTracksForUrgency:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("(item.base_location_id BETWEEN 100 AND 200)"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 + -3600.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("date_downloaded"), v9, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v7;
    v26[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("keep_local"), 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("item_extra.file_size"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity queryWithLibrary:predicate:](ML3Track, "queryWithLibrary:predicate:", self, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__ML3MusicLibrary_CacheManagement___enumeratePurgeableStreamedTracksForUrgency_usingBlock___block_invoke;
  v21[3] = &unk_1E5B63208;
  v22 = v17;
  v23 = v16;
  v24 = v6;
  v18 = v6;
  v19 = v16;
  v20 = v17;
  -[ML3MusicLibrary performReadOnlyDatabaseTransactionWithBlock:](self, "performReadOnlyDatabaseTransactionWithBlock:", v21);

}

- (void)_enumeratePurgeableAlbumTracksForUrgency:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD v17[3];
  unint64_t v18;
  _QWORD v19[3];
  unint64_t v20;

  v6 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v20 = -[ML3MusicLibrary _minimumPurgeableStorageForUrgency:](self, "_minimumPurgeableStorageForUrgency:", a3);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v18 = -[ML3MusicLibrary totalSizeForAllNonCacheTracks](self, "totalSizeForAllNonCacheTracks");
  -[ML3MusicLibrary _purgeableNonCachedItemsPredicateSQL](self, "_purgeableNonCachedItemsPredicateSQL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT item_pid, item_extra.file_size FROM item JOIN item_stats USING (item_pid) JOIN item_extra USING (item_pid) WHERE album_pid = ? AND (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke;
  v11[3] = &unk_1E5B63258;
  v11[4] = self;
  v16 = a3;
  v9 = v8;
  v12 = v9;
  v14 = v17;
  v15 = v19;
  v10 = v6;
  v13 = v10;
  -[ML3MusicLibrary performReadOnlyDatabaseTransactionWithBlock:](self, "performReadOnlyDatabaseTransactionWithBlock:", v11);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

- (int64_t)_purgeableTracksTotalSizeWithUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4
{
  NSObject *v4;
  uint64_t v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__ML3MusicLibrary_CacheManagement___purgeableTracksTotalSizeWithUrgency_includeAutoFilledTracks___block_invoke;
  v8[3] = &unk_1E5B63080;
  v8[4] = &v9;
  -[ML3MusicLibrary _enumeratePurgeableTracksForUrgency:includeAutoFilledTracks:includeCloudAssets:usingBlock:](self, "_enumeratePurgeableTracksForUrgency:includeAutoFilledTracks:includeCloudAssets:usingBlock:", a3, a4, 1, v8);
  v4 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v10[3];
    *(_DWORD *)buf = 134217984;
    v14 = v5;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "Purgeable tracks size: %lld bytes", buf, 0xCu);
  }

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)_enumeratePurgeableTracksForUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4 includeCloudAssets:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[3];

  v6 = a5;
  v7 = a4;
  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  -[ML3MusicLibrary _purgeableTrackPredicateWithUrgency:includeAutoFilledTracks:includeCloudAssets:](self, "_purgeableTrackPredicateWithUrgency:includeAutoFilledTracks:includeCloudAssets:", a3, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("item_extra.file_size"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3OrderingTerm orderingTermWithProperty:direction:](ML3OrderingTerm, "orderingTermWithProperty:direction:", CFSTR("base_location_id"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3OrderingTerm orderingTermWithProperty:direction:](ML3OrderingTerm, "orderingTermWithProperty:direction:", CFSTR("item_stats.date_accessed"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", self, v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[ML3MusicLibrary _unmanagedPurgeShouldPurgeKeepLocalTracksForUrgency:](self, "_unmanagedPurgeShouldPurgeKeepLocalTracksForUrgency:", a3))
    {
      -[ML3MusicLibrary _allKeepLocalPlaylistTracks](self, "_allKeepLocalPlaylistTracks");
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v18;
    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __126__ML3MusicLibrary_CacheManagement___enumeratePurgeableTracksForUrgency_includeAutoFilledTracks_includeCloudAssets_usingBlock___block_invoke;
    v22[3] = &unk_1E5B632B0;
    v23 = v16;
    v24 = v12;
    v25 = v17;
    v26 = v10;
    v19 = v17;
    v20 = v12;
    v21 = v16;
    -[ML3MusicLibrary performReadOnlyDatabaseTransactionWithBlock:](self, "performReadOnlyDatabaseTransactionWithBlock:", v22);

  }
}

- (id)_purgeableTrackPredicateWithUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4 includeCloudAssets:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[3];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[3];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[3];
  uint64_t v58;
  uint64_t v59;

  v5 = a5;
  v59 = *MEMORY[0x1E0C80C00];
  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("item_stats.chosen_by_auto_fill"), 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary _notInKeepLocalCollectionPredicate](self, "_notInKeepLocalCollectionPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("(item.remote_location_id >= 50 AND item.remote_location_id < 300)"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v11 = 6;
  else
    v11 = 1;
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("base_location_id"), &unk_1E5BAB538, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("keep_local"), &unk_1E5BAB580, 6);
  v57[0] = v10;
  v57[1] = v12;
  v57[2] = v9;
  v58 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v56[0] = v48;
    v56[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v14;
  }
  v17 = 0x1E5B4A000uLL;
  v45 = v16;
  v46 = v14;
  if (a3 - 1 >= 2)
  {
    if (a3 == 3)
    {
      if ((MSVDeviceIsWatch() & 1) != 0)
        v18 = 0;
      else
        v18 = v16;
    }
    else
    {
      v31 = v12;
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("keep_local"), 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v32;
      v52[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        v51[0] = v48;
        v51[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v35);
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = v34;
      }
      v12 = v31;

    }
  }
  else
  {
    v18 = v16;
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 + -3600.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("date_downloaded"), v20, 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v55[0] = v18;
      v55[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v23;
    }
    if (MSVDeviceIsWatch())
    {
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_extra.is_audible_audio_book"), 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_stats.bookmark_time_ms"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("keep_local"), 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v43;
      v54[1] = v25;
      v54[2] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
      v44 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v53[0] = v18;
      v53[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
      v28 = v12;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v12 = v28;
      v18 = (id)v30;
      v17 = 0x1E5B4A000;
      v10 = v44;
    }
  }
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("base_location_id"), &unk_1E5BAB580, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("item_stats.is_alarm"), 0);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  v39 = *(void **)(v17 + 2552);
  if (v18)
  {
    v49[0] = v18;
    v49[1] = v37;
    v49[2] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "predicateMatchingPredicates:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50[0] = v37;
    v50[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "predicateMatchingPredicates:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v41;
}

- (id)_allKeepLocalPlaylistTracks
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("keep_local"), &unk_1E5BAB580, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__ML3MusicLibrary_CacheManagement___allKeepLocalPlaylistTracks__block_invoke;
  v10[3] = &unk_1E5B63860;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumeratePersistentIDsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

- (id)_notInKeepLocalCollectionPredicate
{
  if (_notInKeepLocalCollectionPredicate_onceToken != -1)
    dispatch_once(&_notInKeepLocalCollectionPredicate_onceToken, &__block_literal_global_11258);
  return (id)_notInKeepLocalCollectionPredicate_predicate;
}

- (int64_t)_clearDatabaseFileFreeSpace
{
  NSObject *v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "Compacting the database file", (uint8_t *)&v5, 2u);
  }

  v3 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = 0;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes compacting the db", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (int64_t)_clearAllCloudAssets
{
  NSObject *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int64_t v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Purging all cloud assets", buf, 2u);
  }

  v4 = -[ML3MusicLibrary _cloudAssetsTotalSize](self, "_cloudAssetsTotalSize");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary pathForBaseLocationPath:](self, "pathForBaseLocationPath:", 200);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  -[ML3MusicLibrary pathForBaseLocationPath:](self, "pathForBaseLocationPath:", 100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v5, "removeItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), 0, (_QWORD)v16);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

  v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v4;
    _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes clearing cloud assets", buf, 0xCu);
  }

  return v4;
}

- (int64_t)_clearOrphanedAssetsOfAmount:(int64_t)a3 withUrgency:(unint64_t)a4
{
  NSObject *v7;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 67109120;
    LODWORD(v17) = a4;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Clearing orphaned assets with urgency %d", (uint8_t *)&v16, 8u);
  }

  if (a4 < 2)
  {
    v9 = 0;
  }
  else
  {
    v8 = -[ML3MusicLibrary _cloudAssetsTotalSize](self, "_cloudAssetsTotalSize");
    -[ML3MusicLibrary removeOrphanedTracksOnlyInCaches:](self, "removeOrphanedTracksOnlyInCaches:", 1);
    v9 = v8 - -[ML3MusicLibrary _cloudAssetsTotalSize](self, "_cloudAssetsTotalSize");
    v10 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v9;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes of orphaned tracks", (uint8_t *)&v16, 0xCu);
    }

    if (v9 < a3)
    {
      v11 = -[ML3MusicLibrary totalSizeForArtwork](self, "totalSizeForArtwork");
      -[ML3MusicLibrary cleanupArtworkWithOptions:](self, "cleanupArtworkWithOptions:", 30);
      v12 = v11 - -[ML3MusicLibrary totalSizeForArtwork](self, "totalSizeForArtwork");
      v9 += v12;
      v13 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 134217984;
        v17 = v12;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes of orphaned artwork", (uint8_t *)&v16, 0xCu);
      }

    }
  }
  v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134217984;
    v17 = v9;
    _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes of orphaned assets", (uint8_t *)&v16, 0xCu);
  }

  return v9;
}

- (int64_t)_clearPurgeableTracksOfAmount:(int64_t)a3 withUrgency:(unint64_t)a4 includeAutoFilledTracks:(BOOL)a5
{
  return -[ML3MusicLibrary _clearPurgeableTracksOfAmount:withUrgency:includeCloudAssets:includeAutoFilledTracks:](self, "_clearPurgeableTracksOfAmount:withUrgency:includeCloudAssets:includeAutoFilledTracks:", a3, a4, 1, a5);
}

- (int64_t)_clearPurgeableTracksOfAmount:(int64_t)a3 withUrgency:(unint64_t)a4 includeCloudAssets:(BOOL)a5 includeAutoFilledTracks:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v11;
  uint64_t v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  int64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  int64_t v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  int64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v6 = a6;
  v7 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __121__ML3MusicLibrary_CacheManagement___clearPurgeableTracksOfAmount_withUrgency_includeCloudAssets_includeAutoFilledTracks___block_invoke;
  v26[3] = &unk_1E5B63330;
  v28 = &v30;
  v26[4] = self;
  v13 = v11;
  v27 = v13;
  v29 = a3;
  -[ML3MusicLibrary _enumeratePurgeableTracksForUrgency:includeAutoFilledTracks:includeCloudAssets:usingBlock:](self, "_enumeratePurgeableTracksForUrgency:includeAutoFilledTracks:includeCloudAssets:usingBlock:", a4, v6, v7, v26);
  if (objc_msgSend(v13, "count")
    && !+[ML3Track unlinkRedownloadableAssetsFromLibrary:persistentIDs:](ML3Track, "unlinkRedownloadableAssetsFromLibrary:persistentIDs:", self, v13))
  {
    v15 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "Failed to purge redownloadable assets", buf, 2u);
    }

    v16 = -[ML3MusicLibrary _clearAllCloudAssets](self, "_clearAllCloudAssets");
    v31[3] += v16;
    v14 = +[ML3Track unlinkRedownloadableAssetsFromLibrary:persistentIDs:](ML3Track, "unlinkRedownloadableAssetsFromLibrary:persistentIDs:", self, v13);
  }
  else
  {
    v14 = 1;
  }
  if (a4 == 3 && v14 && objc_msgSend(v13, "count"))
  {
    objc_msgSend(&stru_1E5B66908, "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend(v13, "count") - 1, CFSTR(",?"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE item SET keep_local=%d WHERE item_pid IN (%@)"), 0, v17);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __121__ML3MusicLibrary_CacheManagement___clearPurgeableTracksOfAmount_withUrgency_includeCloudAssets_includeAutoFilledTracks___block_invoke_70;
    v23[3] = &unk_1E5B642E8;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v18;
    v25 = v13;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v23);

  }
  v19 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v31[3];
    *(_DWORD *)buf = 134217984;
    v35 = v20;
    _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "Removed %lli bytes of track data", buf, 0xCu);
  }

  v21 = v31[3];
  _Block_object_dispose(&v30, 8);
  return v21;
}

uint64_t __121__ML3MusicLibrary_CacheManagement___clearPurgeableTracksOfAmount_withUrgency_includeCloudAssets_includeAutoFilledTracks___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  ML3Track *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += objc_msgSend(v7, "longLongValue");
  v8 = -[ML3Entity initWithPersistentID:inLibrary:]([ML3Track alloc], "initWithPersistentID:inLibrary:", a2, a1[4]);
  v9 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[ML3Entity valueForProperty:](v8, "valueForProperty:", CFSTR("item_artist.item_artist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3Entity valueForProperty:](v8, "valueForProperty:", CFSTR("item_extra.title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    v19 = 2048;
    v20 = objc_msgSend(v7, "longLongValue");
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "Purging %{public}@ - %{public}@ (%lli bytes)", (uint8_t *)&v15, 0x20u);

  }
  v12 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) >= a1[7])
    *a4 = 1;

  return 0;
}

void __121__ML3MusicLibrary_CacheManagement___clearPurgeableTracksOfAmount_withUrgency_includeCloudAssets_includeAutoFilledTracks___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  v4 = objc_msgSend(a2, "executeUpdate:withParameters:error:", v2, v3, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_ERROR, "failed to mark purged tracks as keep-local off. err=%{public}@", buf, 0xCu);
    }

  }
}

void __70__ML3MusicLibrary_CacheManagement___notInKeepLocalCollectionPredicate__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("album_artist.keep_local");
  v16[1] = CFSTR("item_artist.keep_local");
  v16[2] = CFSTR("album.keep_local");
  v16[3] = CFSTR("composer.keep_local");
  v16[4] = CFSTR("genre.keep_local");
  v16[5] = CFSTR("keep_local");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        +[ML3ComparisonPredicate predicateWithProperty:value:comparison:caseInsensitive:treatNullAsString:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:caseInsensitive:treatNullAsString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6), &unk_1E5BAB598, 1, 0, &stru_1E5B66908, (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3UnaryPredicate predicateWithPredicate:](ML3NegationPredicate, "predicateWithPredicate:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_notInKeepLocalCollectionPredicate_predicate;
  _notInKeepLocalCollectionPredicate_predicate = v9;

}

void __63__ML3MusicLibrary_CacheManagement___allKeepLocalPlaylistTracks__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32));
  +[ML3Track containerQueryWithContainer:](ML3Track, "containerQueryWithContainer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__ML3MusicLibrary_CacheManagement___allKeepLocalPlaylistTracks__block_invoke_2;
  v5[3] = &unk_1E5B65960;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumeratePersistentIDsUsingBlock:", v5);

}

void __63__ML3MusicLibrary_CacheManagement___allKeepLocalPlaylistTracks__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __126__ML3MusicLibrary_CacheManagement___enumeratePurgeableTracksForUrgency_includeAutoFilledTracks_includeCloudAssets_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __126__ML3MusicLibrary_CacheManagement___enumeratePurgeableTracksForUrgency_includeAutoFilledTracks_includeCloudAssets_usingBlock___block_invoke_2;
  v8[3] = &unk_1E5B63288;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = &v12;
  objc_msgSend(v4, "enumeratePersistentIDsAndProperties:usingBlock:", v5, v8);
  v6 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __126__ML3MusicLibrary_CacheManagement___enumeratePurgeableTracksForUrgency_includeAutoFilledTracks_includeCloudAssets_usingBlock___block_invoke_2(_QWORD *a1, uint64_t a2, _QWORD *a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;

  v9 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

  if ((v9 & 1) == 0)
  {
    v12 = 0;
    v11 = a1[5];
    if (v11)
      LOBYTE(v11) = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, char *))(v11 + 16))(v11, a2, *a3, &v12);
    if (a5)
      *a5 = v12;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= v11;
  }
}

uint64_t __97__ML3MusicLibrary_CacheManagement___purgeableTracksTotalSizeWithUrgency_includeAutoFilledTracks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(a3, "longLongValue");
  return 0;
}

uint64_t __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v3 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  objc_msgSend(*(id *)(a1 + 32), "_purgeableAlbumsQuerySQLWithUrgency:", *(_QWORD *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke_2;
  v13[3] = &unk_1E5B63230;
  v6 = v3;
  v14 = v6;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = v7;
  v17 = v8;
  v18 = &v19;
  v12 = *(_OWORD *)(a1 + 48);
  v9 = (id)v12;
  v16 = v12;
  objc_msgSend(v5, "enumerateRowsWithBlock:", v13);
  v10 = *((unsigned __int8 *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke_2(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  BOOL v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v24 = a3;
  v8 = objc_msgSend(v7, "int64ForColumnIndex:", 0);
  v9 = (void *)objc_opt_new();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v10 = (void *)a1[4];
  v11 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executeQuery:withParameters:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke_3;
  v25[3] = &unk_1E5B64FB8;
  v15 = v9;
  v26 = v15;
  v27 = &v28;
  objc_msgSend(v14, "enumerateRowsWithBlock:", v25);
  v16 = *(_QWORD *)(a1[7] + 8);
  v17 = v29;
  v18 = *(_QWORD *)(v16 + 24) - v29[3];
  if (v18 >= *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    *(_QWORD *)(v16 + 24) = v18;
    v19 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17[3]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (*(uint64_t (**)(uint64_t, uint64_t, id, void *, _BYTE *))(v19 + 16))(v19, v8, v15, v20, a4);
    v22 = *(_QWORD *)(a1[9] + 8);
    if (v21)
      v23 = *(_BYTE *)(v22 + 24) != 0;
    else
      v23 = 0;
    *(_BYTE *)(v22 + 24) = v23;

  }
  else
  {
    *a4 = 1;
  }

  _Block_object_dispose(&v28, 8);
}

void __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  v5 = objc_msgSend(v3, "int64ForColumnIndex:", 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
}

uint64_t __91__ML3MusicLibrary_CacheManagement___enumeratePurgeableStreamedTracksForUrgency_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__ML3MusicLibrary_CacheManagement___enumeratePurgeableStreamedTracksForUrgency_usingBlock___block_invoke_2;
  v8[3] = &unk_1E5B631E0;
  v10 = &v11;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumeratePersistentIDsAndProperties:usingBlock:", v5, v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __91__ML3MusicLibrary_CacheManagement___enumeratePurgeableStreamedTracksForUrgency_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  BOOL v4;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if ((_DWORD)result)
    v4 = *(_BYTE *)(v3 + 24) != 0;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  return result;
}

uint64_t __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v7 = (void *)a1[4];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithLongLong:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  v11 = objc_msgSend(v9, "unsignedLongLongValue");
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += v11;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a1[6])
    *a4 = 1;
  return 0;
}

uint64_t __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_29(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "numberWithLongLong:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v8, v10);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_2;
  v14[3] = &unk_1E5B63100;
  v18 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  v16 = v11;
  v17 = *(_OWORD *)(a1 + 48);
  v12 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  return 1;
}

void __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_3(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = v7;
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v8;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "Purging album %{public}@ (%{public}@ bytes): %{public}@", buf, 0x20u);
  }

  v11 = +[ML3Track unlinkRedownloadableAssetsFromLibrary:persistentIDs:](ML3Track, "unlinkRedownloadableAssetsFromLibrary:persistentIDs:", a1[4], v8);
  *((_BYTE *)v21 + 24) = v11;
  v12 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      v14 = "Successfully purged redownloadable assets for album %{public}@";
      v15 = v13;
      v16 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl(&dword_1AC149000, v15, v16, v14, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v7;
    v14 = "Failed to purge redownloadable assets for album %{public}@";
    v15 = v13;
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }

  if (*((_BYTE *)v21 + 24))
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += objc_msgSend(v9, "unsignedLongLongValue");
    if (*((_BYTE *)v21 + 24))
    {
      if (a1[8] == 3)
      {
        v17 = (void *)a1[4];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_31;
        v19[3] = &unk_1E5B63180;
        v19[6] = &v20;
        v18 = a1[7];
        v19[4] = v17;
        v19[5] = v18;
        objc_msgSend(v17, "performDatabaseTransactionWithBlock:", v19);
      }
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) >= a1[9])
    *a4 = 1;

  _Block_object_dispose(&v20, 8);
}

uint64_t __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_31(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v3 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_2_32;
  v10[3] = &unk_1E5B63158;
  v4 = a1[6];
  v11 = v3;
  v12 = v4;
  v5 = a1[4];
  v6 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v10[1] = 3221225472;
  v10[4] = v5;
  v7 = v3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);

  return v8;
}

void __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_2_32(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v19[0] = v7;
  v19[1] = &unk_1E5BAB568;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("keep_local");
  v18[1] = CFSTR("keep_local_constraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = +[ML3Entity setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:](ML3Track, "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", v9, v10, v8, a1[4], a1[5]);

  v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  v12 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "Marked %{public}@ persistentIDs as keep_local=%@ with keep_local_constraints=wifi", (uint8_t *)&v14, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "Failed to mark purged tracks as keep_local=%@ with keep_local_constraints=wifi", (uint8_t *)&v14, 0xCu);
    }

    *a4 = 1;
  }

}

void __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", v4, a1[4]);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  if (a1[8] == 3)
  {
    v6 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", objc_msgSend(v11, "unsignedLongLongValue"), a1[5]);
    objc_msgSend(v6, "valueForProperty:", CFSTR("keep_local"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setObject:forKeyedSubscript:", v9, v7);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
}

uint64_t __80__ML3MusicLibrary_CacheManagement___managedPurgeableTracksTotalSizeWithUrgency___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(a3, "unsignedLongLongValue");
  return 0;
}

uint64_t __80__ML3MusicLibrary_CacheManagement___managedPurgeableTracksTotalSizeWithUrgency___block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(a4, "unsignedLongLongValue");
  return 0;
}

uint64_t __87__ML3MusicLibrary_CacheManagement__enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

+ (void)setAutoFilledTracksArePurgeable:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(CFSTR("_ML3AutofilledTracksArePurgeableKey"), *v3, CFSTR("com.apple.medialibrary"));
}

+ (void)setShouldOptimizeStorage:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(CFSTR("OptimizeStorage"), *v3, CFSTR("com.apple.Music"));
}

+ (BOOL)shouldOptimizeStorage
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("OptimizeStorage"), CFSTR("com.apple.Music"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

+ (void)setMinimumPurgeableStorage:(int64_t)a3
{
  CFNumberRef v3;
  int64_t valuePtr;

  valuePtr = a3;
  v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFPreferencesSetAppValue(CFSTR("MinimumStorageSize"), v3, CFSTR("com.apple.Music"));
  CFRelease(v3);
}

+ (int64_t)minimumPurgeableStorage
{
  int64_t result;
  const __CFNumber *v3;
  CFTypeID v4;
  int64_t valuePtr;

  result = (int64_t)CFPreferencesCopyAppValue(CFSTR("MinimumStorageSize"), CFSTR("com.apple.Music"));
  valuePtr = 0;
  if (result)
  {
    v3 = (const __CFNumber *)result;
    v4 = CFGetTypeID((CFTypeRef)result);
    if (v4 == CFNumberGetTypeID())
      CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

+ (void)clearCloudAssetSharedCache
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "cloudAssetsSharedCacheFolderPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v3, "enumeratorAtPath:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = (void *)v5;
      v8 = 0;
      *(_QWORD *)&v6 = 138543618;
      v14 = v6;
      do
      {
        v9 = v8;
        objc_msgSend(v2, "stringByAppendingPathComponent:", v7, v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v8;
        v11 = objc_msgSend(v3, "removeItemAtPath:error:", v10, &v15);
        v8 = v15;

        if ((v11 & 1) == 0)
        {
          v12 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            v17 = v7;
            v18 = 2114;
            v19 = v8;
            _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "Failed to remove cached asset %{public}@ error %{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v4, "nextObject");
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v13;
      }
      while (v13);

    }
  }

}

- (NSString)artworkDirectory
{
  return (NSString *)-[ML3MusicLibrary pathForResourceFileOrFolder:](self, "pathForResourceFileOrFolder:", 12);
}

- (id)artworkCacheDirectoryForEffect:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[ML3MusicLibrary rootArtworkCacheDirectory](self, "rootArtworkCacheDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathWithComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hasOriginalArtworkForRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "fileExistsAtPath:", v6);

  return (char)v4;
}

- (void)updatePurgeabilityForOriginalArtworkWithRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  ML3MusicLibrary *v12;
  __int16 v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[ML3MusicLibrary originalArtworkDirectory](self, "originalArtworkDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = v4;
  v7 = 2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathWithComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((MSVDeviceIsAppleTV() & 1) != 0)
    goto LABEL_4;
  if ((MSVDeviceIsWatch() & 1) != 0)
  {
    v7 = 3;
LABEL_4:
    -[ML3MusicLibrary markSystemPurgeableMusicPath:forUrgency:](self, "markSystemPurgeableMusicPath:forUrgency:", v9, v7);
    goto LABEL_8;
  }
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ Not marking purgeability for original artwork. relativePath=%{public}@", (uint8_t *)&v11, 0x16u);
  }

LABEL_8:
}

- (void)updatePurgeabilityForCachedArtworkWithAbsolutePath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  ML3MusicLibrary *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ML3MusicLibrary rootArtworkCacheDirectory](self, "rootArtworkCacheDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsString:", v5);

  if (v6)
  {
    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v7 = objc_claimAutoreleasedReturnValue();
    if (MSVDeviceIsAppleTV())
      v8 = 1;
    else
      v8 = 2;
    -[ML3MusicLibrary markSystemPurgeableMusicPath:forUrgency:](self, "markSystemPurgeableMusicPath:forUrgency:", v7, v8);
  }
  else
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Unexpected path for cached artwork %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }

}

+ (BOOL)deviceSupportsASTC
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 0;
  if (deviceSupportsASTC_onceToken != -1)
    dispatch_once(&deviceSupportsASTC_onceToken, &__block_literal_global_11397);
  return deviceSupportsASTC_deviceSupportsASTC != 0;
}

+ (int64_t)devicePreferredImageFormat
{
  if (objc_msgSend(a1, "deviceSupportsASTC"))
    return 2;
  else
    return 0;
}

+ (id)artworkTokenForArtistHeroURL:(id)a3
{
  return (id)objc_msgSend(a3, "absoluteString");
}

+ (id)artworkTokenForChapterWithItemPID:(int64_t)a3 retrievalTime:(double)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("chapter=%llu-%.0f"), a3, a4 * 1000.0);
}

+ (int64_t)artworkSourceTypeForTrackSource:(int)a3
{
  if ((a3 - 1) > 5)
    return 0;
  else
    return qword_1AC3D92F0[a3 - 1];
}

uint64_t __46__ML3MusicLibrary_Artwork__deviceSupportsASTC__block_invoke()
{
  int AppBooleanValue;
  uint64_t result;
  char v2;
  char v3;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DisableASTCEncoding"), CFSTR("com.apple.mobileipod"), 0);
  result = CFPreferencesGetAppBooleanValue(CFSTR("EnableASTCEncoding"), CFSTR("com.apple.medialibrary"), 0);
  if (AppBooleanValue)
  {
    v2 = 0;
  }
  else if ((_DWORD)result)
  {
    v2 = 1;
  }
  else
  {
    v3 = MGGetBoolAnswer();
    result = MGGetBoolAnswer();
    v2 = v3 & result;
  }
  deviceSupportsASTC_deviceSupportsASTC = v2;
  return result;
}

+ (id)sortMapSchemaSQL
{
  return CFSTR("CREATE TABLE \"sort_map\" (name TEXT NOT NULL UNIQUE, name_order INTEGER UNIQUE, name_section INTEGER,  sort_key BLOB NOT NULL)");
}

+ (id)sortMapNewSchemaSQL
{
  return CFSTR("CREATE TABLE \"sort_map_new\" (name TEXT NOT NULL UNIQUE, name_order INTEGER UNIQUE, name_section INTEGER, sort_key BLOB NOT NULL DEFAULT x'')");
}

+ (id)itemSchemaSQL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "createTableSQLWithExistenceClause:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)itemNewSchemaSQL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setName:", CFSTR("item_new"));
  objc_msgSend(v3, "createTableSQLWithExistenceClause:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allSchemaSQL
{
  if (allSchemaSQL_once != -1)
    dispatch_once(&allSchemaSQL_once, &__block_literal_global_11973);
  return (id)allSchemaSQL_allSchemaSQL;
}

+ (id)allPragmaSQL
{
  return &unk_1E5BAA908;
}

+ (id)allTriggersSQL
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("CREATE TRIGGER IF NOT EXISTS on_insert_item_setRemoteLocationColumn AFTER INSERT ON item_store BEGIN UPDATE item SET remote_location_id =(CASE WHEN new.home_sharing_id != 0 THEN 300 ELSE(CASE WHEN IFNULL(new.match_redownload_params, '') != '' THEN 200 ELSE(CASE WHEN IFNULL(new.purchase_history_redownload_params, '') != '' AND new.purchase_history_id != 0 THEN 100 ELSE(CASE WHEN new.subscription_store_item_id != 0 AND new.is_subscription AND new.cloud_asset_available THEN 50 ELSE(CASE WHEN new.sync_redownload_params == 'redownload' AND new.sync_id != 0 THEN 20 ELSE(CASE WHEN new.sync_redownload_params == 'local' AND new.sync_id != 0 THEN 10 ELSE 0 END) END) END) END) END) END) WHERE item_pid = new.item_pid; END;");
  v3[1] = CFSTR("CREATE TRIGGER IF NOT EXISTS on_update_item_setRemoteLocationColumn AFTER UPDATE OF match_redownload_params, purchase_history_redownload_params, purchase_history_id, home_sharing_id, sync_redownload_params, subscription_store_item_id, store_saga_id, is_subscription, cloud_asset_available ON item_store BEGIN UPDATE item SET remote_location_id =(CASE WHEN new.home_sharing_id != 0 THEN 300 ELSE(CASE WHEN IFNULL(new.match_redownload_params, '') != '' THEN 200 ELSE(CASE WHEN IFNULL(new.purchase_history_redownload_params, '') != '' AND new.purchase_history_id != 0 THEN 100 ELSE(CASE WHEN new.subscription_store_item_id != 0 AND new.is_subscription AND new.cloud_asset_available THEN 50 ELSE(CASE WHEN new.sync_redownload_params == 'redownload' AND new.sync_id != 0 THEN 20 ELSE(CASE WHEN new.sync_redownload_params == 'local' AND new.sync_id != 0 THEN 10 ELSE 0 END) END) END) END) END) END) WHERE item_pid = new.item_pid; END;");
  v3[2] = CFSTR("CREATE TRIGGER IF NOT EXISTS on_insert_item_setInMyLibraryColumn AFTER INSERT ON item_store BEGIN UPDATE item SET in_my_library =(CASE WHEN new.home_sharing_id OR (new.store_saga_id AND new.cloud_in_my_library) OR new.purchase_history_id OR (new.sync_id AND new.sync_in_my_library) OR new.is_ota_purchased THEN 1 ELSE 0 END) WHERE item_pid = new.item_pid; END;");
  v3[3] = CFSTR("CREATE TRIGGER IF NOT EXISTS on_update_item_setInMyLibraryColumn AFTER UPDATE OF purchase_history_id, home_sharing_id, sync_id, subscription_store_item_id, store_saga_id, is_ota_purchased, sync_in_my_library, cloud_in_my_library ON item_store BEGIN UPDATE item SET in_my_library =(CASE WHEN new.home_sharing_id OR (new.store_saga_id AND new.cloud_in_my_library) OR new.purchase_history_id OR (new.sync_id AND new.sync_in_my_library) OR new.is_ota_purchased THEN 1 ELSE 0 END) WHERE item_pid = new.item_pid; END;");
  v3[4] = CFSTR("CREATE TRIGGER IF NOT EXISTS on_remove_source_setPlaybackEndpointType AFTER UPDATE OF playback_endpoint_type ON item_store BEGIN UPDATE item_store SET playback_endpoint_type = (CASE WHEN new.playback_endpoint_type >= 0 THEN new.playback_endpoint_type ELSE (CASE WHEN store_saga_id THEN cloud_playback_endpoint_type WHEN sync_id THEN 0 WHEN purchase_history_id THEN 1 WHEN is_ota_purchased THEN 0 WHEN is_subscription THEN 3 ELSE 0 END) END) WHERE item_pid = new.item_pid; END;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)allTables
{
  if (allTables_once != -1)
    dispatch_once(&allTables_once, &__block_literal_global_79);
  return (id)allTables_allTables;
}

+ (id)indexSchemaSQL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ML3MusicLibrary_Schema__indexSchemaSQL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (indexSchemaSQL_onceToken != -1)
    dispatch_once(&indexSchemaSQL_onceToken, block);
  return (id)indexSchemaSQL_indices;
}

+ (id)itemIndexSchemaSQL
{
  if (itemIndexSchemaSQL_onceToken != -1)
    dispatch_once(&itemIndexSchemaSQL_onceToken, &__block_literal_global_312);
  return (id)itemIndexSchemaSQL_itemIndices;
}

+ (int)userVersionUsingConnection:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "databasePathExists"))
  {
    objc_msgSend(v3, "executeQuery:", CFSTR("PRAGMA user_version;"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "int64ValueForFirstRowAndColumn");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)userVersionMatchesSystemUsingConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "[Schema] Checking if the current database version is up-to-date...", (uint8_t *)v9, 2u);
  }

  v6 = objc_msgSend(a1, "userVersionUsingConnection:", v4);
  if (v6 != 2200070)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109376;
      v9[1] = v6;
      v10 = 1024;
      v11 = 2200070;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "[Schema] Database version is %d, not %d", (uint8_t *)v9, 0xEu);
    }

  }
  return v6 == 2200070;
}

+ (BOOL)orderingLanguageMatchesSystemUsingConnection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "executeQuery:", CFSTR("SELECT value FROM _MLDatabaseProperties WHERE key = 'OrderingLanguage';"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValueForFirstRowAndColumn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ML3LocalizationLanguageCanonicalIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);
  if ((v6 & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = v4;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "[Schema] Device language changed from %{public}@ to %{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  return v6;
}

+ (BOOL)dropIndexesUsingConnection:(id)a3 tableNames:(const char *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type='index' AND tbl_name IN (%s);"),
    a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __65__ML3MusicLibrary_Schema__dropIndexesUsingConnection_tableNames___block_invoke;
  v26[3] = &unk_1E5B65EE0;
  v9 = v6;
  v27 = v9;
  objc_msgSend(v8, "enumerateRowsWithBlock:", v26);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v11)
  {
    v12 = v11;
    v20 = v8;
    v21 = v7;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v15, "hasPrefix:", CFSTR("sqlite_autoindex_")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP INDEX %@;"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v5, "executeUpdate:", v16);

          if (!v17)
          {
            v18 = 0;
            goto LABEL_12;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v12)
        continue;
      break;
    }
    v18 = 1;
LABEL_12:
    v8 = v20;
    v7 = v21;
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

void __65__ML3MusicLibrary_Schema__dropIndexesUsingConnection_tableNames___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __45__ML3MusicLibrary_Schema__itemIndexSchemaSQL__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", itemIndexSchemaSQL_indexSQLs, 30);
  v1 = (void *)itemIndexSchemaSQL_itemIndices;
  itemIndexSchemaSQL_itemIndices = v0;

}

void __41__ML3MusicLibrary_Schema__indexSchemaSQL__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "itemIndexSchemaSQL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromArray:", &unk_1E5BAA920);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)indexSchemaSQL_indices;
  indexSchemaSQL_indices = v1;

}

void __36__ML3MusicLibrary_Schema__allTables__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("album"), CFSTR("item_artist"), CFSTR("album_artist"), CFSTR("composer"), CFSTR("genre"), CFSTR("category"), CFSTR("base_location"), CFSTR("sort_map"), CFSTR("item"), CFSTR("item_extra"), CFSTR("item_playback"), CFSTR("item_search"), CFSTR("item_stats"), CFSTR("item_store"), CFSTR("item_video"), CFSTR("item_kvs"), CFSTR("container"),
    CFSTR("container_seed"),
    CFSTR("container_item"),
    CFSTR("_MLDatabaseProperties"),
    CFSTR("db_info"),
    CFSTR("chapter"),
    CFSTR("lyrics"),
    CFSTR("entity_revision"),
    CFSTR("genius_config"),
    CFSTR("genius_metadata"),
    CFSTR("genius_similarities"),
    CFSTR("artwork_token"),
    CFSTR("best_artwork_token"),
    CFSTR("artwork"),
    CFSTR("entity_changes"),
    CFSTR("source"),
    CFSTR("library_property"),
    CFSTR("cloud_kvs"),
    CFSTR("account"),
    CFSTR("person"),
    CFSTR("container_item_person"),
    CFSTR("container_author"),
    CFSTR("container_item_reaction"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allTables_allTables;
  allTables_allTables = v0;

}

void __39__ML3MusicLibrary_Schema__allSchemaSQL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[43];

  v44[41] = *MEMORY[0x1E0C80C00];
  v43 = (void *)objc_opt_new();
  objc_msgSend(v43, "createTableSQLWithExistenceClause:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v42;
  v41 = (void *)objc_opt_new();
  objc_msgSend(v41, "createTableSQLWithExistenceClause:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v40;
  v39 = (void *)objc_opt_new();
  objc_msgSend(v39, "createTableSQLWithExistenceClause:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v38;
  v37 = (void *)objc_opt_new();
  objc_msgSend(v37, "createTableSQLWithExistenceClause:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v36;
  v35 = (void *)objc_opt_new();
  objc_msgSend(v35, "createTableSQLWithExistenceClause:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v34;
  v44[5] = CFSTR("CREATE TABLE category (category_id INTEGER PRIMARY KEY, category TEXT NOT NULL UNIQUE)");
  v44[6] = CFSTR("CREATE TABLE base_location (base_location_id INTEGER PRIMARY KEY, path TEXT NOT NULL)");
  v44[7] = CFSTR("CREATE TABLE \"sort_map\" (name TEXT NOT NULL UNIQUE, name_order INTEGER UNIQUE, name_section INTEGER,  sort_key BLOB NOT NULL)");
  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "createTableSQLWithExistenceClause:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v32;
  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "createTableSQLWithExistenceClause:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[9] = v30;
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "createTableSQLWithExistenceClause:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[10] = v28;
  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "createTableSQLWithExistenceClause:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[11] = v26;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "createTableSQLWithExistenceClause:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[12] = v24;
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "createTableSQLWithExistenceClause:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[13] = v22;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "createTableSQLWithExistenceClause:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[14] = v20;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "createTableSQLWithExistenceClause:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[15] = v18;
  v44[16] = CFSTR("CREATE TABLE container (container_pid INTEGER PRIMARY KEY, distinguished_kind INTEGER NOT NULL DEFAULT 0, date_created INTEGER NOT NULL DEFAULT 0, date_modified INTEGER NOT NULL DEFAULT 0, date_played INTEGER NOT NULL DEFAULT 0, name TEXT NOT NULL DEFAULT '', name_order INTEGER NOT NULL DEFAULT 0, is_owner INTEGER NOT NULL DEFAULT 1, is_editable INTEGER NOT NULL DEFAULT 0, parent_pid INTEGER NOT NULL DEFAULT 0, contained_media_type INTEGER NOT NULL DEFAULT 0, workout_template_id INTEGER NOT NULL DEFAULT 0, is_hidden INTEGER NOT NULL DEFAULT 0, is_ignorable_itunes_playlist INTEGER NOT NULL DEFAULT 0, description TEXT, play_count_user INTEGER NOT NULL DEFAULT 0, play_count_recent INTEGER NOT NULL DEFAULT 0, liked_state INTEGER NOT NULL DEFAULT 0, smart_evaluation_order INTEGER NOT NULL DEFAULT 0, smart_is_folder INTEGER NOT NULL DEFAULT 0, smart_is_dynamic INTEGER NOT NULL DEFAULT 0, smart_is_filtered INTEGER NOT NULL DEFAULT 0, smart_is_genius INTEGER NOT NULL DEFAULT 0, smart_enabled_only INTEGER NOT NULL DEFAULT 0, smart_is_limited INTEGER NOT NULL DEFAULT 0, smart_limit_kind INTEGER NOT NULL DEFAULT 0, smart_limit_order INTEGER NOT NULL DEFAULT 0, smart_limit_value INTEGER NOT NULL DEFAULT 0, smart_reverse_limit_order INTEGER NOT NULL DEFAULT 0, smart_criteria BLOB, play_order INTEGER NOT NULL DEFAULT 0, is_reversed INTEGER NOT NULL DEFAULT 0, album_field_order INTEGER NOT NULL DEFAULT 0, repeat_mode INTEGER NOT NULL DEFAULT 0, shuffle_items INTEGER NOT NULL DEFAULT 0, has_been_shuffled INTEGER NOT NULL DEFAULT 0, filepath TEXT NOT NULL DEFAULT '', is_saveable INTEGER NOT NULL DEFAULT 0, is_src_remote INTEGER NOT NULL DEFAULT 0, is_ignored_syncing INTEGER NOT NULL DEFAULT 0, container_type INTEGER NOT NULL DEFAULT 0, is_container_type_active_target INTEGER NOT NULL DEFAULT 0, orig_date_modified INTEGER NOT NULL DEFAULT 0, store_cloud_id INTEGER NOT NULL DEFAULT 0, has_cloud_play_order INTEGER NOT NULL DEFAULT 0, cloud_global_id TEXT NOT NULL DEFAULT '', cloud_share_url TEXT NOT NULL DEFAULT '', cloud_is_public INTEGER NOT NULL DEFAULT 0, cloud_is_visible INTEGER NOT NULL DEFAULT 0, cloud_is_subscribed INTEGER NOT NULL DEFAULT 0, cloud_is_curator_playlist INTEGER NOT NULL DEFAULT 0, cloud_author_store_id INTEGER NOT NULL DEFAULT 0, cloud_author_display_name TEXT NOT NULL DEFAULT '', cloud_author_store_url TEXT NOT NULL DEFAULT '', cloud_min_refresh_interval INTEGER NOT NULL DEFAULT 0, cloud_last_update_time INTEGER NOT NULL DEFAULT 0, cloud_user_count INTEGER NOT NULL DEFAULT 0, cloud_global_play_count INTEGER NOT NULL DEFAULT 0, cloud_global_like_count INTEGER NOT NULL DEFAULT 0, keep_local INTEGER NOT NULL DEFAULT 0, keep_local_status INTEGER NOT NULL DEFAULT 0, keep_local_status_reason INTEGER NOT NULL DEFAULT 0, keep_local_constraints INTEGER NOT NULL DEFAULT 0, external_vendor_identifier TEXT NOT NULL DEFAULT '', external_vendor_display_name TEXT NOT NULL DEFAULT '', external_vendor_container_tag TEXT NOT NULL DEFAULT '', is_external_vendor_playlist INTEGER NOT NULL DEFAULT 0, sync_id INTEGER NOT NULL DEFAULT 0, cloud_is_sharing_disabled INTEGER NOT NULL DEFAULT 0, cloud_version_hash TEXT NOT NULL DEFAULT '', date_played_local INTEGER NOT NULL DEFAULT 0, cloud_author_handle TEXT NOT NULL DEFAULT '', cloud_universal_library_id TEXT NOT NULL DEFAULT '', should_display_index INTEGER NOT NULL DEFAULT 0, date_downloaded INTEGER NOT NULL DEFAULT 0, category_type_mask INTEGER NOT NULL DEFAULT 0, grouping_sort_key TEXT NOT NULL DEFAULT '', traits INTEGER NOT NULL DEFAULT 0, liked_state_changed_date INTEGER NOT NULL DEFAULT 0, is_collaborative INTEGER NOT NULL DEFAULT 0, collaborator_invite_options INTEGER NOT NULL DEFAULT 0, collaborator_permissions INTEGER NOT NULL DEFAULT 0, collaboration_invitation_link TEXT NOT NULL DEFAULT '', cover_artwork_recipe TEXT NOT NULL DEFAULT '', collaboration_invitation_url_expiration_date INTEGER NOT NULL DEFAULT 0 ,collaboration_join_request_pending INTEGER NOT NULL DEFAULT 0 ,collaborator_status INTEGER NOT NULL DEFAULT 0)");
  v44[17] = CFSTR("CREATE TABLE container_seed (container_pid INTEGER PRIMARY KEY, item_pid INTEGER NOT NULL DEFAULT 0, seed_order INTEGER NOT NULL DEFAULT 0)");
  v44[18] = CFSTR("CREATE TABLE container_item_media_type (container_pid INTEGER PRIMARY KEY, media_type INTEGER NOT NULL DEFAULT 0, count INTEGER NOT NULL DEFAULT 0, UNIQUE (container_pid, media_type))");
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "createTableSQLWithExistenceClause:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[19] = v16;
  v44[20] = CFSTR("CREATE TABLE _MLDatabaseProperties (key TEXT PRIMARY KEY, value TEXT)");
  v44[21] = CFSTR("CREATE TABLE db_info (db_pid INTEGER PRIMARY KEY, primary_container_pid INTEGER, media_folder_url TEXT, audio_language INTEGER, subtitle_language INTEGER, genius_cuid TEXT, bib BLOB, rib BLOB)");
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "createTableSQLWithExistenceClause:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[22] = v14;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "createTableSQLWithExistenceClause:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[23] = v12;
  v44[24] = CFSTR("CREATE TABLE entity_revision (revision INTEGER PRIMARY KEY, entity_pid INTEGER NOT NULL DEFAULT 0, deleted INTEGER NOT NULL DEFAULT 0, class INTEGER NOT NULL DEFAULT 0, revision_type INTEGER NOT NULL DEFAULT 0, UNIQUE (entity_pid, revision_type))");
  v44[25] = CFSTR("CREATE TABLE genius_config (id INTEGER PRIMARY KEY, version INTEGER UNIQUE, default_num_results INTEGER NOT NULL DEFAULT 0, min_num_results INTEGER NOT NULL DEFAULT 0, data BLOB)");
  v44[26] = CFSTR("CREATE TABLE genius_metadata (genius_id INTEGER PRIMARY KEY, revision_level INTEGER NOT NULL DEFAULT 0, version INTEGER NOT NULL DEFAULT 0, checksum INTEGER NOT NULL DEFAULT 0, data BLOB)");
  v44[27] = CFSTR("CREATE TABLE genius_similarities (genius_id INTEGER PRIMARY KEY, data BLOB)");
  v44[28] = CFSTR("CREATE TABLE artwork_token (artwork_token TEXT NOT NULL DEFAULT '', artwork_source_type INTEGER NOT NULL DEFAULT 0, artwork_type INTEGER NOT NULL DEFAULT 0, entity_pid INTEGER NOT NULL DEFAULT 0, entity_type INTEGER NOT NULL DEFAULT 0, UNIQUE (artwork_source_type, artwork_type, entity_pid, entity_type))");
  v44[29] = CFSTR("CREATE TABLE best_artwork_token (entity_pid INTEGER NOT NULL DEFAULT 0, entity_type INTEGER NOT NULL DEFAULT 0, artwork_type INTEGER NOT NULL DEFAULT 0, available_artwork_token TEXT NOT NULL DEFAULT '', fetchable_artwork_token TEXT NOT NULL DEFAULT '', fetchable_artwork_source_type INTEGER NOT NULL DEFAULT 0, UNIQUE (entity_pid, entity_type, artwork_type))");
  v44[30] = CFSTR("CREATE TABLE artwork (artwork_token TEXT NOT NULL DEFAULT '', artwork_source_type INTEGER NOT NULL DEFAULT 0, relative_path TEXT NOT NULL DEFAULT '', artwork_type INTEGER NOT NULL DEFAULT 0, interest_data BLOB, UNIQUE (artwork_token, artwork_source_type))");
  v44[31] = CFSTR("CREATE TABLE entity_changes (class INTEGER NOT NULL, entity_pid INTEGER NOT NULL, source_pid INTEGER NOT NULL, change_type INTEGER NOT NULL, changes TEXT NOT NULL DEFAULT '', UNIQUE (class, entity_pid, source_pid, change_type))");
  v44[32] = CFSTR("CREATE TABLE source (source_pid INTEGER PRIMARY KEY, source_name TEXT, last_sync_date INTEGER NOT NULL DEFAULT 0, last_sync_revision INTEGER NOT NULL DEFAULT 0)");
  v44[33] = CFSTR("CREATE TABLE library_property (property_pid INTEGER PRIMARY KEY, source_id INTEGER, key TEXT, value TEXT, UNIQUE (source_id, key))");
  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "createTableSQLWithExistenceClause:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v44[34] = v1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "createTableSQLWithExistenceClause:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44[35] = v3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "createTableSQLWithExistenceClause:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44[36] = v5;
  v44[37] = CFSTR("CREATE TABLE container_item_person (container_item_person_pid INTEGER PRIMARY KEY, container_item_pid INTEGER NOT NULL DEFAULT 0, person_pid INTEGER NOT NULL DEFAULT 0, UNIQUE (container_item_pid, person_pid))");
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "createTableSQLWithExistenceClause:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[38] = v7;
  v44[39] = CFSTR("CREATE TABLE container_author (container_author_pid INTEGER PRIMARY KEY, container_pid INTEGER NOT NULL DEFAULT 0, person_pid INTEGER NOT NULL DEFAULT 0, role INTEGER NOT NULL DEFAULT 0, is_pending INTEGER NOT NULL DEFAULT 0, position INTEGER NOT NULL DEFAULT 0, UNIQUE (container_pid, person_pid))");
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "createTableSQLWithExistenceClause:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[40] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 41);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)allSchemaSQL_allSchemaSQL;
  allSchemaSQL_allSchemaSQL = v10;

}

- (BOOL)supportsUbiquitousPlaybackPositions
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((MSVDeviceIsHomePod() & 1) != 0 || (MSVDeviceIsWatch() & 1) != 0)
    return 0;
  -[ML3MusicLibrary databasePath](self, "databasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3MusicLibrary autoupdatingSharedLibraryPath](ML3MusicLibrary, "autoupdatingSharedLibraryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0 || NSClassFromString(CFSTR("SenTestCase")) != 0;

  return v3;
}

- (void)updateUbiquitousDatabaseByRemovingUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a3
{
  ML3Track *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  ML3MusicLibrary *v8;

  v4 = -[ML3Entity initWithPersistentID:inLibrary:]([ML3Track alloc], "initWithPersistentID:inLibrary:", a3, self);
  -[ML3Entity valueForProperty:](v4, "valueForProperty:", CFSTR("item_kvs.key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __117__ML3MusicLibrary_UbiquitousDatabase__updateUbiquitousDatabaseByRemovingUbiquitousMetadataFromTrackWithPersistentID___block_invoke;
    v6[3] = &unk_1E5B642E8;
    v7 = v5;
    v8 = self;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](self, "databaseConnectionAllowingWrites:withBlock:", 1, v6);

  }
}

void __117__ML3MusicLibrary_UbiquitousDatabase__updateUbiquitousDatabaseByRemovingUbiquitousMetadataFromTrackWithPersistentID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v18[0] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v4, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM cloud_kvs WHERE key = ?"), v5, &v11);

  v7 = v11;
  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Encountered removing item from cloud_kvs. key=%{public}@ error=%{public}@", buf, 0x20u);
    }

  }
}

- (id)libraryContainerPath
{
  void *v2;
  void *v3;

  -[ML3MusicLibrary resourcesManager](self, "resourcesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)libraryContainerPathByAppendingPathComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ML3MusicLibrary resourcesManager](self, "resourcesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryContainerPathByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)libraryContainerRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ML3MusicLibrary resourcesManager](self, "resourcesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryContainerRelativePath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  -[ML3MusicLibrary resourcesManager](self, "resourcesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathForResourceFileOrFolder:basePath:relativeToBase:createParentFolderIfNecessary:", v8, v10, v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)pathForBaseLocationPath:(int64_t)a3
{
  void *v4;
  void *v5;

  -[ML3MusicLibrary resourcesManager](self, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForBaseLocationPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mediaFolderPathByAppendingPathComponent:(id)a3
{
  return +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:](ML3MusicLibrary, "mediaFolderPathByAppendingPathComponent:", a3);
}

- (id)mediaFolderRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ML3MusicLibrary resourcesManager](self, "resourcesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaFolderRelativePath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)mediaFolderPathByAppendingPathComponent:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allLibraryContainerPaths
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (allLibraryContainerPaths_onceToken != -1)
    dispatch_once(&allLibraryContainerPaths_onceToken, &__block_literal_global_13522);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend((id)allLibraryContainerPaths___potentialContainerDenylist, "containsObject:", v10) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "contentsOfDirectoryAtPath:error:", v12, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", CFSTR("iTunes_Control"));

          if (v15)
            objc_msgSend(v17, "addObject:", v12);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v17;
}

+ (id)libraryPathForContainerPath:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "msv_stringByResolvingRealPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("iTunes_Control/iTunes/MediaLibrary.sqlitedb"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)libraryContainerPath
{
  void *v2;
  void *v3;

  +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)libraryContainerPathByAppendingPathComponent:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryContainerPathByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)libraryContainerRelativePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryContainerRelativePath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v9 = a4;
  +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForResourceFileOrFolder:basePath:relativeToBase:createParentFolderIfNecessary:", v8, v9, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)pathForBaseLocationPath:(int64_t)a3
{
  void *v4;
  void *v5;

  +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForBaseLocationPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)cloudAssetsSharedCacheFolderPath
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD block[4];
  id v8;

  +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:](ML3MusicLibrary, "mediaFolderPathByAppendingPathComponent:", CFSTR("Music/Cache/SharedCache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ML3MusicLibrary_ML3Resources__cloudAssetsSharedCacheFolderPath__block_invoke;
  block[3] = &unk_1E5B65D80;
  v3 = v2;
  v4 = v3;
  v8 = v3;
  if (cloudAssetsSharedCacheFolderPath_onceToken == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&cloudAssetsSharedCacheFolderPath_onceToken, block);
    v5 = v8;
  }

  return v4;
}

void __65__ML3MusicLibrary_ML3Resources__cloudAssetsSharedCacheFolderPath__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  v44 = 0;
  v4 = v2;
  v5 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v44);
  v6 = v44;
  if ((v5 & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v47 = v8;
      v48 = 2114;
      v49 = v6;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "Failed to create cloud asset shared cache folder %{public}@ error %{public}@", buf, 0x16u);
    }

  }
  MSVGetKernelBootTime();
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12 + -604800.0;

  if (v10 < v13)
    v10 = v13;
  v14 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v47 = v15;
    _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "Clearing cached items created before %@ in the shared cache folder", buf, 0xCu);

  }
  objc_msgSend(v4, "enumeratorAtPath:", *(_QWORD *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v41;
    v36 = *MEMORY[0x1E0CB2A38];
    *(_QWORD *)&v18 = 138543618;
    v35 = v18;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if ((objc_msgSend(v22, "hasPrefix:", CFSTR("tmp."), v35) & 1) != 0)
        {
          v23 = v6;
        }
        else
        {
          objc_msgSend(*(id *)(v37 + 32), "stringByAppendingPathComponent:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v6;
          objc_msgSend(v4, "attributesOfItemAtPath:error:", v24, &v39);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v39;

          if (!v25)
          {
            v32 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v35;
              v47 = v22;
              v48 = 2114;
              v49 = v23;
              v33 = v32;
              v34 = "Failed to retrieve attributes of shared cache file %{public}@ error %{public}@";
LABEL_23:
              _os_log_impl(&dword_1AC149000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);
            }
LABEL_24:

            goto LABEL_25;
          }
          objc_msgSend(v25, "objectForKey:", v36);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "timeIntervalSince1970");
          v28 = v27;

          v6 = v23;
          if (v28 >= v10)
            goto LABEL_26;
        }
        v29 = v23;
        objc_msgSend(*(id *)(v37 + 32), "stringByAppendingPathComponent:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v23;
        v31 = objc_msgSend(v4, "removeItemAtPath:error:", v30, &v38);
        v23 = v38;

        if ((v31 & 1) == 0)
        {
          v32 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v35;
            v47 = v22;
            v48 = 2114;
            v49 = v23;
            v33 = v32;
            v34 = "Failed to remove shared cache temporary file %{public}@ error %{public}@";
            goto LABEL_23;
          }
          goto LABEL_24;
        }
LABEL_25:
        v6 = v23;
LABEL_26:
        objc_msgSend(v16, "skipDescendants");
      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v19);
  }

}

void __57__ML3MusicLibrary_ML3Resources__allLibraryContainerPaths__block_invoke()
{
  void *v0;

  v0 = (void *)allLibraryContainerPaths___potentialContainerDenylist;
  allLibraryContainerPaths___potentialContainerDenylist = (uint64_t)&unk_1E5BAA968;

}

- (void)clearCachedCloudLibraryVersionsUsingConnection:(id)a3
{
  char v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v3 = objc_msgSend(a3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM _MLDatabaseProperties WHERE key IN (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), &unk_1E5BAA980, &v6);
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Could not remove cached saga library properties - error=%{public}@", buf, 0xCu);
    }

  }
}

- (void)clearCachedPurchaseHistoryVersionsUsingConnection:(id)a3
{
  char v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v3 = objc_msgSend(a3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM _MLDatabaseProperties WHERE key IN (?, ?, ?, ?)"), &unk_1E5BAA998, &v6);
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Could not remove cached jalisco library properties - error=%{public}@", buf, 0xCu);
    }

  }
}

- (BOOL)removeSource:(int)a3 forImportOperation:(id)a4 usingConnection:(id)a5 postNotifications:(BOOL)a6
{
  double v8;
  double v9;
  NSObject *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  id v60;
  NSObject *v61;
  NSObject *v62;
  int64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  int v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  double v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  _BOOL4 v95;
  id v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  unsigned int v111;
  void *v112;
  id obj;
  id v115;
  _QWORD v116[5];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[6];
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  void *v129;
  _QWORD v130[4];
  id v131;
  _QWORD v132[4];
  id v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _QWORD v139[4];
  id v140;
  _QWORD v141[4];
  NSObject *v142;
  id v143;
  id v144;
  _BYTE v145[128];
  void *v146;
  void *v147;
  uint8_t v148[4];
  uint64_t v149;
  _BYTE v150[128];
  _QWORD v151[2];
  _BYTE buf[38];
  uint64_t v153;

  v95 = a6;
  v153 = *MEMORY[0x1E0C80C00];
  v110 = a4;
  v115 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a3;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d from entire library", buf, 8u);
  }
  v111 = a3;

  ML3TrackRulesRemovalPropertiesForSource(a3);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  ML3TrackRulesRemovalSourceIdentityPropertyForSource(a3);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", v109, &unk_1E5BABD90, 2);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 3)
  {
    if (a3 != 2)
    {
      v99 = 0;
      goto LABEL_28;
    }
    v99 = 1;
    v143 = 0;
    v11 = objc_msgSend(v115, "executeUpdate:withParameters:error:", CFSTR("UPDATE item_stats SET liked_state=0, liked_state_changed_date=0"), 0, &v143);
    v12 = v143;
    if ((v11 & 1) == 0)
    {
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 2;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v12;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to clear item_stats properties. error: %@", buf, 0x12u);
      }

    }
    v151[0] = v108;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.is_protected"), 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v151[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", self, v16, MEMORY[0x1E0C9AA60]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v141[0] = MEMORY[0x1E0C809B0];
    v141[1] = 3221225472;
    v141[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke;
    v141[3] = &unk_1E5B65960;
    v20 = v18;
    v142 = v20;
    objc_msgSend(v17, "enumeratePersistentIDsUsingBlock:", v141);
    if (-[NSObject count](v20, "count"))
    {
      v21 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = -[NSObject count](v20, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2;
        _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Found %lu tracks to unlink with asset protection type = %d", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v139[0] = v19;
      v139[1] = 3221225472;
      v139[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_65;
      v139[3] = &unk_1E5B63928;
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v140 = v23;
      +[ML3Track enumeratePathsToDeleteFromLibrary:persistentIDs:usingBlock:](ML3Track, "enumeratePathsToDeleteFromLibrary:persistentIDs:usingBlock:", self, v20, v139);
      v24 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Deleting assets due to remove cloud library source:%{public}@", buf, 0xCu);
      }

      ML3DeleteAssetsAtPaths(v23);
      if (!+[ML3Track clearLocationFromLibrary:persistentIDs:usingConnection:](ML3Track, "clearLocationFromLibrary:persistentIDs:usingConnection:", self, v20, v115))
      {
        v25 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = 2;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 2;
          _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to clear location for tracks with asset protection type = %d", buf, 0xEu);
        }

      }
    }
    v26 = v142;
    goto LABEL_26;
  }
  v99 = 0;
  ML3NonQualifiedColumnNameFromProperty(CFSTR("item_stats.chosen_by_auto_fill"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "objectForKey:", CFSTR("item_stats.chosen_by_auto_fill"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v112, "mutableCopy");
  objc_msgSend(v27, "removeObjectForKey:", CFSTR("item_stats.chosen_by_auto_fill"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE item_stats SET %@=%@"), v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = 0;
  v28 = objc_msgSend(v115, "executeUpdate:withParameters:error:", v17, 0, &v144);
  v20 = v144;
  if ((v28 & 1) == 0)
  {
    v26 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = 3;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = CFSTR("item_stats.chosen_by_auto_fill");
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v16;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v20;
      _os_log_impl(&dword_1AC149000, v26, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to set %@ to %@ with error: %@", buf, 0x26u);
    }
    v112 = v27;
LABEL_26:

    v27 = v112;
    goto LABEL_27;
  }
  v99 = 0;
LABEL_27:

  v112 = v27;
LABEL_28:
  if ((objc_msgSend(v110, "isCancelled") & 1) != 0)
  {
    LOBYTE(v105) = 0;
  }
  else
  {
    +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", self, v108, MEMORY[0x1E0C9AA60]);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setIgnoreRestrictionsPredicates:", 1);
    objc_msgSend(v107, "selectPersistentIDsSQL");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "persistentIDParameters");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("UPDATE item_store SET "));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v112, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v112, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v31 = v112;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v135, v150, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v136 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
          ML3NonQualifiedColumnNameFromProperty(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v36);
          objc_msgSend(v31, "objectForKey:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v37);

        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v135, v150, 16);
      }
      while (v32);
    }

    objc_msgSend(v29, "componentsJoinedByString:", CFSTR("=?, "));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "appendFormat:", CFSTR("%@=? WHERE item_pid IN (%@)"), v100, v101);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v30, "count") + objc_msgSend(v104, "count"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "addObjectsFromArray:", v30);
    objc_msgSend(v106, "addObjectsFromArray:", v104);
    v134 = 0;
    v38 = objc_msgSend(v115, "executeUpdate:withParameters:error:", v103, v106, &v134);
    v96 = v134;
    if ((v38 & 1) == 0)
    {
      v39 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v31, "allKeys");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v111;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v40;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v96;
        _os_log_impl(&dword_1AC149000, v39, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to remove source properties: %{public}@\nwith error: %@", buf, 0x1Cu);

      }
    }
    if ((objc_msgSend(v110, "isCancelled") & 1) != 0)
    {
      LOBYTE(v105) = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("remote_location_id"), 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "addObject:", v43);

      +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("item_store.is_ota_purchased"), 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "addObject:", v44);

      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_stats.needs_restore"), 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "addObject:", v45);

      v46 = v111;
      if ((int)v111 > 3 || v111 == 1)
      {
        +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.sync_id"), 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "addObject:", v47);

        v46 = v111;
      }
      if ((ML3TrackRulesRemoveLocalAssetForSource(v46) & 1) == 0)
      {
        +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("base_location_id"), &unk_1E5BABDA8, 5);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "addObject:", v48);

      }
      +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v102);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", self, v94, 0);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setIgnoreRestrictionsPredicates:", 1);
      objc_msgSend(v98, "selectPersistentIDsSQL");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "persistentIDParameters");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "executeQuery:withParameters:", v92, v91);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v132[0] = MEMORY[0x1E0C809B0];
      v132[1] = 3221225472;
      v132[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_75;
      v132[3] = &unk_1E5B65EE0;
      v93 = v41;
      v133 = v93;
      objc_msgSend(v90, "enumerateRowsWithBlock:", v132);
      +[ML3UnaryPredicate predicateWithPredicate:](ML3NegationPredicate, "predicateWithPredicate:", v94);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", self, v89, 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setIgnoreRestrictionsPredicates:", 1);
      objc_msgSend(v97, "selectPersistentIDsSQL");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "persistentIDParameters");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "executeQuery:withParameters:", v88, v87);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v130[0] = MEMORY[0x1E0C809B0];
      v130[1] = 3221225472;
      v130[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_2;
      v130[3] = &unk_1E5B65EE0;
      v84 = v42;
      v131 = v84;
      objc_msgSend(v86, "enumerateRowsWithBlock:", v130);
      if ((objc_msgSend(v110, "isCancelled") & 1) != 0)
        goto LABEL_71;
      v49 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = objc_msgSend(v93, "count");
        v51 = objc_msgSend(v85, "count");
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v111;
        *(_WORD *)&buf[8] = 2048;
        *(_QWORD *)&buf[10] = v50;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v51;
        _os_log_impl(&dword_1AC149000, v49, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, deleting %lu tracks, purging %lu assets", buf, 0x1Cu);
      }

      if (objc_msgSend(v93, "count"))
      {
        v52 = (void *)MEMORY[0x1AF43CC0C]();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        *(_QWORD *)&buf[24] = 0;
        v53 = objc_msgSend(v93, "count");
        v126 = 0;
        v127 = &v126;
        v128 = 0x2020000000;
        v129 = 0;
        v129 = malloc_type_malloc(8 * v53, 0x100004000313F17uLL);
        v125[0] = MEMORY[0x1E0C809B0];
        v125[1] = 3221225472;
        v125[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_78;
        v125[3] = &unk_1E5B63970;
        v125[4] = &v126;
        v125[5] = buf;
        objc_msgSend(v93, "enumerateObjectsUsingBlock:", v125);
        objc_msgSend(v93, "removeAllObjects");
        v54 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v148 = 134217984;
          v149 = v53;
          _os_log_impl(&dword_1AC149000, v54, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks deleting %lu tracks", v148, 0xCu);
        }

        if (!+[ML3Track deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3Track, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", self, 2, v127[3], v53, v115))
        {
          v55 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v148 = 67109120;
            LODWORD(v149) = v111;
            _os_log_impl(&dword_1AC149000, v55, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to delete purged tracks", v148, 8u);
          }

        }
        free((void *)v127[3]);
        objc_msgSend(v115, "executeUpdate:withParameters:error:", CFSTR("UPDATE album SET user_rating=IFNULL((SELECT AVG(user_rating) FROM item_stats JOIN item USING (item_pid) WHERE album.album_pid=item.album_pid), album.user_rating) WHERE album.user_rating_is_derived=1"), 0, 0);
        _Block_object_dispose(&v126, 8);
        _Block_object_dispose(buf, 8);
        objc_autoreleasePoolPop(v52);
      }
      if ((objc_msgSend(v110, "isCancelled") & 1) != 0)
        goto LABEL_71;
      if (objc_msgSend(v85, "count"))
      {
        v56 = (void *)MEMORY[0x1AF43CC0C]();
        v57 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v57, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Deleting assets due to remove source:", buf, 2u);
        }

        v58 = objc_msgSend(v85, "count");
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v123[0] = MEMORY[0x1E0C809B0];
        v123[1] = 3221225472;
        v123[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_82;
        v123[3] = &unk_1E5B63928;
        v60 = v59;
        v124 = v60;
        +[ML3Track enumeratePathsToDeleteFromLibrary:persistentIDs:usingBlock:](ML3Track, "enumeratePathsToDeleteFromLibrary:persistentIDs:usingBlock:", self, v85, v123);
        ML3DeleteAssetsAtPaths(v60);
        v61 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v58;
          _os_log_impl(&dword_1AC149000, v61, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks clearing location from %lu tracks", buf, 0xCu);
        }

        if (!+[ML3Track clearLocationFromLibrary:persistentIDs:usingConnection:](ML3Track, "clearLocationFromLibrary:persistentIDs:usingConnection:", self, v85, v115))
        {
          _ML3LogCategoryDefault();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v111;
            _os_log_impl(&dword_1AC149000, v62, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to clear location for purged tracks", buf, 8u);
          }

        }
        objc_autoreleasePoolPop(v56);
      }
      if ((objc_msgSend(v110, "isCancelled") & 1) != 0)
      {
LABEL_71:
        LOBYTE(v105) = 0;
      }
      else
      {
        if (objc_msgSend(v84, "count"))
          +[ML3Entity incrementRevisionForRevisionTypeContentWithConnection:deletionType:persistentIDs:](ML3Track, "incrementRevisionForRevisionTypeContentWithConnection:deletionType:persistentIDs:", v115, 0, v84);
        v64 = +[ML3MusicLibrary artworkSourceTypeForTrackSource:](ML3MusicLibrary, "artworkSourceTypeForTrackSource:", v111);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v147, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend(v115, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM artwork_token WHERE artwork_source_type = ?"), v66, 0);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v64);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = v68;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "executeQuery:withParameters:", CFSTR("SELECT entity_pid, entity_type, artwork_type FROM best_artwork_token WHERE fetchable_artwork_source_type = ?"), v69);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        v121[0] = MEMORY[0x1E0C809B0];
        v121[1] = 3221225472;
        v121[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_88;
        v121[3] = &unk_1E5B65EE0;
        v70 = v67;
        v122 = v70;
        objc_msgSend(v83, "enumerateRowsWithBlock:", v121);
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        obj = v70;
        v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v145, 16);
        if (v71)
        {
          v72 = *(_QWORD *)v118;
          do
          {
            for (j = 0; j != v71; ++j)
            {
              if (*(_QWORD *)v118 != v72)
                objc_enumerationMutation(obj);
              v74 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * j);
              objc_msgSend(v74, "objectAtIndexedSubscript:", 0);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = objc_msgSend(v75, "longLongValue");
              objc_msgSend(v74, "objectAtIndexedSubscript:", 1);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = objc_msgSend(v77, "intValue");
              objc_msgSend(v74, "objectAtIndexedSubscript:", 2);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              -[ML3MusicLibrary updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:](self, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:", v76, v78, (int)objc_msgSend(v79, "intValue"), v115, 0.0);

            }
            v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v145, 16);
          }
          while (v71);
        }

        if (v111 == 3)
          -[ML3MusicLibrary cleanupArtworkWithOptions:usingConnection:](self, "cleanupArtworkWithOptions:usingConnection:", 6, v115);
        if (v99)
        {
          _ML3LogCategoryDefault();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC149000, v80, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Deleting all non-library tracks from playlists (removing source match)", buf, 2u);
          }

          +[ML3Container removeNonLibraryItemsFromContainersInLibrary:usingConnection:](ML3Container, "removeNonLibraryItemsFromContainersInLibrary:usingConnection:", self, v115);
        }
        v81 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)&buf[4] = v111;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v105;
          *(_WORD *)&buf[14] = 2048;
          *(double *)&buf[16] = v82 - v9;
          _os_log_impl(&dword_1AC149000, v81, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d from entire library finished with success=%d in %.3f seconds", buf, 0x18u);
        }

        if ((v105 & v95) == 1)
        {
          v116[0] = MEMORY[0x1E0C809B0];
          v116[1] = 3221225472;
          v116[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_90;
          v116[3] = &unk_1E5B64F90;
          v116[4] = self;
          objc_msgSend(v115, "enqueueBlockForTransactionCommit:", v116);
        }

      }
    }

  }
  return v105;
}

- (BOOL)removeSource:(int)a3 fromPersistentIDS:(id)a4 forImportOperation:(id)a5 usingConnection:(id)a6 postNotifications:(BOOL)a7
{
  return -[ML3MusicLibrary _removeSource:fromPersistentIDS:forImportOperation:canonocalizeCollections:usingConnection:postNotifications:](self, "_removeSource:fromPersistentIDS:forImportOperation:canonocalizeCollections:usingConnection:postNotifications:", *(_QWORD *)&a3, a4, a5, 1, a6, a7);
}

- (BOOL)_removeSource:(int)a3 fromPersistentIDS:(id)a4 forImportOperation:(id)a5 canonocalizeCollections:(BOOL)a6 usingConnection:(id)a7 postNotifications:(BOOL)a8
{
  _BOOL8 v9;
  id v12;
  NSObject *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  void *v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  int64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  BOOL v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  NSObject *v77;
  uint64_t v78;
  double v79;
  void *v80;
  _BOOL4 v82;
  id v83;
  id v84;
  void *v85;
  id obj;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  id v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  id v114;
  id v115;
  uint64_t *v116;
  void *v117;
  int v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint8_t buf[4];
  _BYTE v124[14];
  __int16 v125;
  _BOOL4 v126;
  __int16 v127;
  double v128;
  _BYTE v129[128];
  _BYTE v130[128];
  void *v131;
  _BYTE v132[128];
  uint64_t v133;

  v9 = a6;
  v133 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v84 = a5;
  v83 = a7;
  v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v124 = a3;
    *(_WORD *)&v124[4] = 2048;
    *(_QWORD *)&v124[6] = objc_msgSend(v12, "count");
    v125 = 1024;
    v126 = v9;
    _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks removing source %d from %lu tracks, canonocalizeCollections=%{BOOL}u", buf, 0x18u);
  }
  v85 = v12;

  if (v12 && objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = malloc_type_malloc(8 * objc_msgSend(v12, "count"), 0x100004000313F17uLL);
    v119 = 0;
    v120 = &v119;
    v121 = 0x2020000000;
    v122 = 0;
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke;
    v113[3] = &unk_1E5B63998;
    v118 = a3;
    v116 = &v119;
    v117 = v80;
    v113[4] = self;
    v17 = v83;
    v114 = v17;
    v94 = v16;
    v115 = v94;
    +[ML3Track enumeratePathsToDeleteFromLibrary:persistentIDs:usingConnection:usingBlock:](ML3Track, "enumeratePathsToDeleteFromLibrary:persistentIDs:usingConnection:usingBlock:", self, v12, v17, v113);
    if ((objc_msgSend(v84, "isCancelled") & 1) != 0)
      goto LABEL_36;
    v18 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v120[3];
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v124 = v19;
      _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks deleting %lu tracks", buf, 0xCu);
    }

    v20 = v120[3];
    if (v20)
    {
      if (!+[ML3Track deleteFromLibrary:deletionType:canonicalizeCollections:persistentIDs:count:usingConnection:](ML3Track, "deleteFromLibrary:deletionType:canonicalizeCollections:persistentIDs:count:usingConnection:", self, 2, v9, v80, v20, v17))
      {
        v37 = os_log_create("com.apple.amp.medialibrary", "Default");
        v82 = 0;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        *(_WORD *)buf = 0;
        v39 = "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks failed to delete purged tracks";
        goto LABEL_34;
      }
      objc_msgSend(v17, "executeUpdate:withParameters:error:", CFSTR("UPDATE album SET user_rating=IFNULL((SELECT AVG(user_rating) FROM item_stats JOIN item USING (item_pid) WHERE album.album_pid=item.album_pid), album.user_rating) WHERE album.user_rating_is_derived=1"), 0, 0);
    }
    v21 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v124 = v12;
      _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing potential non-library tracks from all containers: %{public}@", buf, 0xCu);
    }

    +[ML3Container removeAnyNonLibraryItemsInPersistentIDs:fromContainersInLibrary:usingConnection:](ML3Container, "removeAnyNonLibraryItemsInPersistentIDs:fromContainersInLibrary:usingConnection:", v12, self, v17);
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    objc_msgSend(v94, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v109, v132, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v110 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
          v131 = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "executeQuery:withParameters:", CFSTR("SELECT 1 FROM container_item JOIN container USING(container_pid) WHERE is_hidden = 0 AND item_pid = ?"), v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "hasAtLeastOneRow");

          if (v29)
          {
            v30 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = objc_msgSend(v26, "longLongValue");
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v124 = v31;
              _os_log_impl(&dword_1AC149000, v30, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Keeping asset for track %llu because it is ATPWATL", buf, 0xCu);
            }

            objc_msgSend(v94, "removeObjectForKey:", v26);
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v109, v132, 16);
      }
      while (v23);
    }

    v32 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend(v94, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v124 = v33;
      _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks purging %lu assets", buf, 0xCu);
    }

    if (!objc_msgSend(v94, "count")
      || (objc_msgSend(v94, "allKeys"),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = +[ML3Track clearLocationFromLibrary:persistentIDs:usingConnection:](ML3Track, "clearLocationFromLibrary:persistentIDs:usingConnection:", self, v34, v17), v34, v35))
    {
      v36 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v94, "allValues");
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setWithArray:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      ML3DeleteAssetsAtPaths(v38);

      v82 = 1;
      goto LABEL_35;
    }
    v37 = os_log_create("com.apple.amp.medialibrary", "Default");
    v82 = 0;
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
LABEL_35:

      if ((objc_msgSend(v84, "isCancelled") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = +[ML3MusicLibrary artworkSourceTypeForTrackSource:](ML3MusicLibrary, "artworkSourceTypeForTrackSource:", a3);
        v42 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "arrayWithObjects:", v43, &unk_1E5BABD90, &unk_1E5BABDC0, 0);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = objc_msgSend(v85, "count");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v124 = v45;
          *(_WORD *)&v124[8] = 1024;
          *(_DWORD *)&v124[10] = v41;
          _os_log_impl(&dword_1AC149000, v44, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks updating artwork for %lu persistentIDs, sourceType=%d", buf, 0x12u);
        }

        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        obj = v85;
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
        if (v46)
        {
          v87 = *(_QWORD *)v106;
          do
          {
            v90 = v46;
            for (j = 0; j != v90; ++j)
            {
              if (*(_QWORD *)v106 != v87)
                objc_enumerationMutation(obj);
              v48 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * j);
              objc_msgSend(v89, "replaceObjectAtIndex:withObject:", 1, v48);
              objc_msgSend(v17, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM artwork_token WHERE artwork_source_type = ? AND entity_pid = ? AND entity_type = ?"), v89, 0);
              objc_msgSend(v17, "executeQuery:withParameters:", CFSTR("SELECT artwork_type FROM best_artwork_token WHERE fetchable_artwork_source_type = ? AND entity_pid = ? AND entity_type = ?"), v89);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v102[0] = MEMORY[0x1E0C809B0];
              v102[1] = 3221225472;
              v102[2] = __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke_104;
              v102[3] = &unk_1E5B639C0;
              v50 = v88;
              v103 = v50;
              v104 = v48;
              objc_msgSend(v49, "enumerateRowsWithBlock:", v102);
              v92 = v49;
              v100 = 0u;
              v101 = 0u;
              v98 = 0u;
              v99 = 0u;
              v51 = v50;
              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v98, v129, 16);
              if (v52)
              {
                v53 = *(_QWORD *)v99;
                do
                {
                  for (k = 0; k != v52; ++k)
                  {
                    if (*(_QWORD *)v99 != v53)
                      objc_enumerationMutation(v51);
                    v55 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
                    objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    v57 = objc_msgSend(v56, "longLongValue");
                    objc_msgSend(v55, "objectAtIndexedSubscript:", 1);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ML3MusicLibrary updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:](self, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:", v57, 0, (int)objc_msgSend(v58, "intValue"), v17, 0.0);

                  }
                  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v98, v129, 16);
                }
                while (v52);
              }

            }
            v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
          }
          while (v46);
        }

        if (a3 == 3)
        {
          v59 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v124 = 3;
            _os_log_impl(&dword_1AC149000, v59, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks cleaning artwork options for source=%d", buf, 8u);
          }

          -[ML3MusicLibrary cleanupArtworkWithOptions:usingConnection:](self, "cleanupArtworkWithOptions:usingConnection:", 6, v17);
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(obj, "count");
        if (v60 >= 1)
        {
          do
          {
            if ((unint64_t)v60 >= 0xFA)
              v61 = 250;
            else
              v61 = v60;
            +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "statementWithPrefix:inParameterCount:", CFSTR("SELECT item_pid FROM item JOIN item_stats USING(item_pid) WHERE in_my_library=0 AND liked_state=2 AND item_pid"), v61);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "subarrayWithRange:", objc_msgSend(obj, "count") - v60, v61);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "executeQuery:withParameters:", v63, v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v96[0] = MEMORY[0x1E0C809B0];
            v96[1] = 3221225472;
            v96[2] = __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke_108;
            v96[3] = &unk_1E5B65EE0;
            v97 = v93;
            objc_msgSend(v65, "enumerateRowsWithBlock:", v96);

            v66 = v60 <= v61;
            v60 -= v61;
          }
          while (!v66);
        }
        v67 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = objc_msgSend(v93, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v124 = v68;
          _os_log_impl(&dword_1AC149000, v67, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks removing liked_state from=%lu presistentIDs", buf, 0xCu);
        }

        v69 = objc_msgSend(v93, "count");
        if (v69 >= 1)
        {
          do
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)v69 >= 0xFA)
              v71 = 250;
            else
              v71 = v69;
            +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "statementWithPrefix:inParameterCount:", CFSTR("UPDATE item_stats SET liked_state=0, liked_state_changed_date=? WHERE item_pid"), v71);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v70);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "subarrayWithRange:", objc_msgSend(v93, "count") - v69, v71);
            v75 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "addObjectsFromArray:", v75);

            v95 = 0;
            LOBYTE(v75) = objc_msgSend(v17, "executeUpdate:withParameters:error:", v73, v74, &v95);
            v91 = v95;
            if ((v75 & 1) == 0)
            {
              v76 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)v124 = v91;
                _os_log_impl(&dword_1AC149000, v76, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks failed to update liked_state on deleted tracks, error=%{public}@", buf, 0xCu);
              }

            }
            v66 = v69 <= v71;
            v69 -= v71;
          }
          while (!v66);
        }
        v77 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          v78 = objc_msgSend(obj, "count");
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)v124 = a3;
          *(_WORD *)&v124[4] = 2048;
          *(_QWORD *)&v124[6] = v78;
          v125 = 1024;
          v126 = v82;
          v127 = 2048;
          v128 = v79 - v15;
          _os_log_impl(&dword_1AC149000, v77, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d from %lu tracks finished with success=%d in %.3f seconds", buf, 0x22u);
        }

        -[ML3MusicLibrary notifyEntitiesAddedOrRemoved](self, "notifyEntitiesAddedOrRemoved");
        -[ML3MusicLibrary notifyContentsDidChange](self, "notifyContentsDidChange");
        free(v80);

        goto LABEL_37;
      }
LABEL_36:
      LOBYTE(v82) = 0;
LABEL_37:

      _Block_object_dispose(&v119, 8);
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    v39 = "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks failed to clear location for purged tracks";
LABEL_34:
    _os_log_impl(&dword_1AC149000, v37, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
    v82 = 0;
    goto LABEL_35;
  }
  LOBYTE(v82) = 1;
LABEL_38:

  return v82;
}

void __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v37 = a5;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks enumeratePathsToDeleteFromLibrary: %lld", buf, 0xCu);
  }

  v11 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", a5, *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "valueForProperty:", CFSTR("item_stats.needs_restore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v11, "valueForProperty:", CFSTR("item_store.store_item_id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "longLongValue");

    if (v14)
      goto LABEL_22;
  }
  else
  {

  }
  v15 = *(unsigned int *)(a1 + 72);
  if (v15 < 2)
    goto LABEL_11;
  if ((a4 & 1) == 0)
  {
    if ((ML3TrackRulesRemoveLocalAssetForSource(v15) & 1) == 0)
    {
      v34 = a3;
      v15 = *(unsigned int *)(a1 + 72);
      goto LABEL_13;
    }
LABEL_11:
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(_QWORD *)(v17 + 24);
    *(_QWORD *)(v17 + 24) = v18 + 1;
    *(_QWORD *)(v16 + 8 * v18) = a5;
    goto LABEL_22;
  }
  v34 = a3;
LABEL_13:
  ML3TrackRulesRemovalPropertiesForSource(v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValues:forProperties:usingConnection:", v20, v21, *(_QWORD *)(a1 + 40));

  v22 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM item WHERE item_pid=?"), CFSTR("(item.remote_location_id >= 50 AND item.remote_location_id < 300)"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "executeQuery:withParameters:", v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "int64ValueForFirstRowAndColumn");

  if (v27)
  {
    if (v9 && ML3TrackRulesRemoveLocalAssetForSource(*(unsigned int *)(a1 + 72)))
    {
      v28 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v9, v29);

    }
  }
  else if (!v9 || (v30 = ML3TrackRulesRemoveLocalAssetForSource(*(unsigned int *)(a1 + 72)), v34 < 250) || v30)
  {
    v31 = *(_QWORD *)(a1 + 64);
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v33 = *(_QWORD *)(v32 + 24);
    *(_QWORD *)(v32 + 24) = v33 + 1;
    *(_QWORD *)(v31 + 8 * v33) = a5;
  }

LABEL_22:
}

void __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke_104(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

void __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke_108(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "int64ForColumnIndex:", 0));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "length");
    v4 = v6;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      v4 = v6;
    }
  }

}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

uint64_t __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(a2, "longLongValue");
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6 + 1;
  *(_QWORD *)(v4 + 8 * v6) = result;
  return result;
}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_88(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

}

uint64_t __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_90(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "notifyEntitiesAddedOrRemoved");
  return objc_msgSend(*(id *)(a1 + 32), "notifyContentsDidChange");
}

- (NSNumber)sagaAccountID
{
  void *v2;
  void *v3;
  void *v4;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudAccountID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setSagaAccountID:(id)a3
{
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", a3, CFSTR("MLCloudAccountID"));
}

- (NSNumber)sagaLastKnownActiveLockerAccountDSID
{
  void *v2;
  void *v3;
  void *v4;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLLastKnownActiveLockerAccountDSID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setSagaLastKnownActiveLockerAccountDSID:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a3, "longLongValue"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLLastKnownActiveLockerAccountDSID"));

}

- (NSDate)sagaLastGeniusUpdateDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLSagaLastGeniusUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)setSagaLastGeniusUpdateDate:(id)a3
{
  id v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLSagaLastGeniusUpdate"));

}

- (NSDate)sagaLastItemPlayDataUploadDate
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudLastPlayDataUpdate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  if (v4 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v6;
}

- (void)setSagaLastItemPlayDataUploadDate:(id)a3
{
  id v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudLastPlayDataUpdate"));

}

- (NSDate)sagaLastPlaylistPlayDataUploadDate
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudLastPlaylistPlayDataUpdate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  if (v4 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v6;
}

- (void)setSagaLastPlaylistPlayDataUploadDate:(id)a3
{
  id v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudLastPlaylistPlayDataUpdate"));

}

- (NSString)sagaCloudLibraryCUID
{
  return (NSString *)-[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudLibraryCUID"));
}

- (void)setSagaCloudLibraryCUID:(id)a3
{
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", a3, CFSTR("MLCloudLibraryCUID"));
}

- (NSString)sagaCloudLibraryTroveID
{
  return (NSString *)-[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudLibraryTroveID"));
}

- (void)setSagaCloudLibraryTroveID:(id)a3
{
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", a3, CFSTR("MLCloudLibraryTroveID"));
}

- (int64_t)sagaDatabaseUserVersion
{
  void *v2;
  int64_t v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudDatabaseUserVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setSagaDatabaseUserVersion:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudDatabaseUserVersion"));

}

- (int64_t)sagaCloudAddToPlaylistBehavior
{
  void *v2;
  int64_t v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudAccountAddToPlaylistBehavior"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3)
    return v3;
  else
    return 2;
}

- (void)setSagaCloudAddToPlaylistBehavior:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudAccountAddToPlaylistBehavior"));

}

- (int64_t)sagaCloudFavoriteSongAddToLibraryBehavior
{
  void *v2;
  int64_t v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudAccountFavoriteSongAddToLibraryBehavior"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setSagaCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudAccountFavoriteSongAddToLibraryBehavior"));

}

- (BOOL)sagaNeedsFullUpdate
{
  void *v2;
  char v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLSagaNeedsFullUpdate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSagaNeedsFullUpdate:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLSagaNeedsFullUpdate"));

}

- (BOOL)sagaPrefersToMergeWithCloudLibrary
{
  void *v2;
  char v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudLibraryPrefersToMerge"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSagaInitiateClientResetSync:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLSagaInitiateClientResetSync"));

}

- (BOOL)sagaInitiateClientResetSync
{
  void *v2;
  char v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLSagaInitiateClientResetSync"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSagaPrefersToMergeWithCloudLibrary:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudLibraryPrefersToMerge"));

}

- (NSString)storefrontIdentifier
{
  return (NSString *)-[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLStorefrontID"));
}

- (void)setSagaOnDiskDatabaseRevision:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudDatabaseRevision"));

}

- (NSDate)sagaLastLibraryUpdateTime
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudLastLibraryUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)setSagaLastLibraryUpdateTime:(id)a3
{
  id v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudLastLibraryUpdate"));

}

- (NSDate)sagaLastSubscribedContainersUpdateTime
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudLastSubscribedContainersUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)setSagaLastSubscribedContainersUpdateTime:(id)a3
{
  id v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudLastSubscribedContainersUpdate"));

}

- (int64_t)preferredVideoQuality
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudDatabasePreferredVideoQuality"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
    v4 = (int)objc_msgSend(v3, "intValue");
  else
    v4 = -1;

  return v4;
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLCloudDatabasePreferredVideoQuality"));

}

- (void)setSagaClientFeaturesVersion:(id)a3
{
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", a3, CFSTR("MLCloudDatabaseClientFeaturesVersion"));
}

- (NSString)sagaLastCloudUpdateClientBuildVersion
{
  return (NSString *)-[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLCloudDatabaseUpdateClientBuildVersion"));
}

- (void)setSagaLastCloudUpdateClientBuildVersion:(id)a3
{
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", a3, CFSTR("MLCloudDatabaseUpdateClientBuildVersion"));
}

- (void)clearSagaCloudAccountID
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudAccountID"));
}

- (void)clearSagaLastGeniusUpdateDate
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLSagaLastGeniusUpdate"));
}

- (void)clearSagaLastItemPlayDataUploadDate
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudLastPlayDataUpdate"));
}

- (void)clearSagaLastPlaylistPlayDataUploadDate
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudLastPlaylistPlayDataUpdate"));
}

- (void)clearSagaCloudLibraryCUID
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudLibraryCUID"));
}

- (void)clearSagaCloudLibraryTroveID
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudLibraryTroveID"));
}

- (void)clearSagaPrefersToMergeWithCloudLibrary
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudLibraryPrefersToMerge"));
}

- (void)clearSagaCloudAddToPlaylistBehavior
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudAccountAddToPlaylistBehavior"));
}

- (void)clearSagaClientFeaturesVersion
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudDatabaseClientFeaturesVersion"));
}

- (void)clearSagaCloudFavoriteSongAddToLibraryBehavior
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudAccountFavoriteSongAddToLibraryBehavior"));
}

- (void)clearSagaLastUpdatedClientBuildVersion
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLCloudDatabaseUpdateClientBuildVersion"));
}

- (int64_t)syncIdFromMultiverseId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ML3MusicLibrary syncLibraryID](self, "syncLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "libraryIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "libraryName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if (v12)
        {
          v7 = objc_msgSend(v10, "libraryId");
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)prepareUnitTestDatabaseWithSQLFromContentsOfFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int8x8_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  ML3MusicLibrary *v40;
  void *v41;
  id v42;
  id obj;
  id *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    if (a4)
      *a4 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfFile:encoding:error:", v6, 4, a4);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(";"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        -[ML3MusicLibrary checkoutWriterConnection](self, "checkoutWriterConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v9 = v9;
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v11)
        {
          v12 = v11;
          v40 = self;
          v41 = v8;
          v44 = a4;
          v42 = v6;
          obj = v9;
          v13 = *(_QWORD *)v46;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v46 != v13)
                objc_enumerationMutation(obj);
              v15 = *(id *)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)objc_msgSend(v17, "mutableCopy");

              v20 = 1;
              do
              {
                NSPersistentStringFromMLMediaType(v20, v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "length"))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "replaceOccurrencesOfString:withString:options:range:", v21, v22, 1, 0, objc_msgSend(v18, "length"));

                }
                v23 = (v20 & 0x7FFFFF) == 0;
                v20 *= 2;
              }
              while (!v23);
              v24 = objc_msgSend(v18, "rangeOfString:options:", CFSTR("mlmediatype"), 1);
              if (v25)
              {
                v28 = v24;
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *executableSQLFromUnitTestFileForString(NSString *__strong)");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "substringFromIndex:", v28);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("ML3MusicLibrary+MLUnitTestingAdditions.m"), 27, CFSTR("sql contains invalid text at '%@'"), v31);

              }
              if (objc_msgSend(v18, "length"))
              {
                v26 = objc_msgSend(v10, "executeUpdate:", v18);
                v27 = v26;
                if (v44 && (v26 & 1) == 0)
                {
                  v36 = (void *)MEMORY[0x1E0CB35C8];
                  v49 = *MEMORY[0x1E0CB2D50];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error executing '%@'"), v18);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = v37;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "errorWithDomain:code:userInfo:", &stru_1E5B66908, -1, v38);
                  *v44 = (id)objc_claimAutoreleasedReturnValue();

LABEL_35:
                  v32 = 0;
                  goto LABEL_36;
                }

                if (!v27)
                  goto LABEL_35;
              }
              else
              {

              }
            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
            if (v12)
              continue;
            break;
          }
          v32 = 1;
LABEL_36:
          v8 = v41;
          v6 = v42;
          v9 = obj;
          self = v40;
        }
        else
        {
          v32 = 1;
        }

        objc_msgSend(v10, "executeUpdate:", CFSTR("DROP TABLE sort_map"));
        -[ML3MusicLibrary updateSortMapOnConnection:forceUpdateOriginals:](self, "updateSortMapOnConnection:forceUpdateOriginals:", v10, 1);
        -[ML3MusicLibrary checkInDatabaseConnection:](self, "checkInDatabaseConnection:", v10);
      }
      else
      {
        if (!a4)
        {
          v32 = 0;
          goto LABEL_39;
        }
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v52 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No SQL statements found in %@"), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", &stru_1E5B66908, -1, v35);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v32 = 0;
      }
    }
    else
    {
      if (!a4)
      {
        v32 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v54 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open file '%@'"), v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v55[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", &stru_1E5B66908, -1, v10);
      v32 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_39:
    goto LABEL_40;
  }
  v32 = 1;
LABEL_41:

  return v32;
}

+ (id)databasePathForUnitTest:(id)a3 withBasePath:(id)a4
{
  __CFString *v5;
  id v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (__CFString *)a4;
  v6 = a3;
  v7 = -[__CFString length](v5, "length");
  v8 = CFSTR("/tmp/ML3UnitTests");
  if (v7)
    v8 = v5;
  v9 = v8;

  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (const char *)objc_msgSend(v6, "selector");

  NSStringFromSelector(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v9, "length"))
  {
    -[__CFString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, 0);

    objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("library.sqlitedb"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ML3MemorySQLiteDatabasePathWithName(v15);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)unitTestableLibraryForTest:(id)a3 basePath:(id)a4 setupSQLFilenames:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ML3MusicLibrary *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  SEL v40;
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = a4;
  v8 = a5;
  v34 = v7;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector((SEL)objc_msgSend(v7, "selector"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v16, "stringByDeletingPathExtension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pathExtension");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pathForResource:ofType:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "length") && !objc_msgSend(v19, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3MusicLibrary+MLUnitTestingAdditions.m"), 99, CFSTR("Could not prepare for test '%@/%@' database, unable to load setupSQLFilename = '%@' - no such file in bundle %@"), v33, v32, v16, v10);

          v26 = 0;
          v24 = v12;
          goto LABEL_15;
        }
        objc_msgSend(v11, "addObject:", v19);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "databasePathForUnitTest:withBasePath:", v34, v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByDeletingLastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeItemAtPath:error:", v21, 0);

  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v22 = [ML3MusicLibrary alloc];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __97__ML3MusicLibrary_MLUnitTestingAdditions__unitTestableLibraryForTest_basePath_setupSQLFilenames___block_invoke;
  v35[3] = &unk_1E5B64AB8;
  v36 = v11;
  v40 = a2;
  v41 = a1;
  v37 = v33;
  v38 = v32;
  v39 = &v42;
  v23 = -[ML3MusicLibrary initWithPath:readOnly:populateUnitTestTablesBlock:](v22, "initWithPath:readOnly:populateUnitTestTablesBlock:", v19, 0, v35);
  v24 = (void *)v23;
  if (*((_BYTE *)v43 + 24))
    v25 = 0;
  else
    v25 = (void *)v23;
  v26 = v25;

  _Block_object_dispose(&v42, 8);
LABEL_15:

  return v26;
}

void __97__ML3MusicLibrary_MLUnitTestingAdditions__unitTestableLibraryForTest_basePath_setupSQLFilenames___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v14 = v10;
        v12 = objc_msgSend(v3, "prepareUnitTestDatabaseWithSQLFromContentsOfFile:error:", v11, &v14);
        v7 = v14;

        if ((v12 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("ML3MusicLibrary+MLUnitTestingAdditions.m"), 114, CFSTR("Could not prepare for test '%@/%@' database with setupSQLPath = %@, error = %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v11, v7);

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        }
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

}

- (NSNumber)jaliscoAccountID
{
  void *v2;
  void *v3;
  void *v4;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLJaliscoAccountID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSDate)jaliscoLastGeniusUpdateDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLJaliscoLastGeniusUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)setJaliscoLastGeniusUpdateDate:(id)a3
{
  id v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLJaliscoLastGeniusUpdate"));

}

- (void)setJaliscoLastSupportedMediaKinds:(id)a3
{
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", a3, CFSTR("MLJaliscoLastSupportedMediaKinds"));
}

- (BOOL)jaliscoHasCloudGeniusData
{
  void *v2;
  char v3;

  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLJaliscoHasCloudGeniusData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setJaliscoHasCloudGeniusData:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLJaliscoHasCloudGeniusData"));

}

- (BOOL)jaliscoIsMusicGeniusUserEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("GeniusUserEnabled"), CFSTR("com.apple.mobileipod"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (void)setJaliscoIsMusicGeniusUserEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("GeniusUserEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.mobileipod"));
}

- (void)setJaliscoNeedsUpdateForTokens:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLJaliscoNeedsUpdateForTokens"));

}

- (void)setJaliscoOnDiskDatabaseRevision:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLJaliscoDatabaseRevision"));

}

- (NSDate)jaliscoLastLibraryUpdateTime
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[ML3MusicLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLJaliscoLastLibraryUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)setJaliscoLastLibraryUpdateTime:(id)a3
{
  id v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLJaliscoLastLibraryUpdate"));

}

- (void)clearJaliscoAccountID
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLJaliscoAccountID"));
}

- (void)clearJaliscoLastGeniusUpdateDate
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLJaliscoLastGeniusUpdate"));
}

- (void)clearJaliscoLastExcludedMediaKinds
{
  -[ML3MusicLibrary deleteDatabaseProperty:](self, "deleteDatabaseProperty:", CFSTR("MLJaliscoLastExcludedMediaKinds"));
}

- (void)sortJaliscoLastSupportedMediaKinds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ML3MusicLibrary jaliscoLastSupportedMediaKinds](self, "jaliscoLastSupportedMediaKinds");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_longLongValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ML3MusicLibrary jaliscoGetSortedMediaKinds:](ML3MusicLibrary, "jaliscoGetSortedMediaKinds:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setJaliscoLastSupportedMediaKinds:](self, "setJaliscoLastSupportedMediaKinds:", v7);

}

- (void)updateJaliscoExcludedMediaKindsWith:(id)a3 excludingMediaKindsInSet:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[ML3MusicLibrary jaliscoLastExcludedMediaKinds](self, "jaliscoLastExcludedMediaKinds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v4)
      objc_msgSend(v7, "unionSet:", v12);
    else
      objc_msgSend(v7, "minusSet:", v12);
    if (v8 == objc_msgSend(v7, "count"))
    {
      v9 = v7;
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v7, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3MusicLibrary jaliscoGetSortedMediaKinds:](ML3MusicLibrary, "jaliscoGetSortedMediaKinds:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v11, CFSTR("MLJaliscoLastExcludedMediaKinds"));

    }
    else
    {
      -[ML3MusicLibrary clearJaliscoLastExcludedMediaKinds](self, "clearJaliscoLastExcludedMediaKinds");
    }
    goto LABEL_13;
  }
  if (v4)
  {
    objc_msgSend(v12, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3MusicLibrary jaliscoGetSortedMediaKinds:](ML3MusicLibrary, "jaliscoGetSortedMediaKinds:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_14:

}

@end
