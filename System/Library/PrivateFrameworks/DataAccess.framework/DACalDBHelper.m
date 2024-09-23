@implementation DACalDBHelper

- (DACalDBHelper)initWithDatabaseInitOptions:(int)a3
{
  DACalDBHelper *v4;
  DACalDBHelper *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSMutableDictionary *containerPathsByAccountID;
  uint64_t v10;
  NSMutableDictionary *containerPathsByAuxDatabaseID;
  uint64_t v12;
  NSMutableDictionary *databasesByContainerPath;
  uint64_t v14;
  NSCountedSet *connectionCountsByPath;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DACalDBHelper;
  v4 = -[DACalDBHelper init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_initOptions = a3;
    v6 = dispatch_queue_create("com.apple.dataaccessd.calDBQueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    containerPathsByAccountID = v5->_containerPathsByAccountID;
    v5->_containerPathsByAccountID = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    containerPathsByAuxDatabaseID = v5->_containerPathsByAuxDatabaseID;
    v5->_containerPathsByAuxDatabaseID = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    databasesByContainerPath = v5->_databasesByContainerPath;
    v5->_databasesByContainerPath = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    connectionCountsByPath = v5->_connectionCountsByPath;
    v5->_connectionCountsByPath = (NSCountedSet *)v14;

  }
  return v5;
}

- (id)_mainDatabasePath
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;
  NSString *cachedMainDatabasePath;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_cachedMainDatabasePath)
  {
    v3 = (void *)objc_opt_class();
    v4 = _mainDatabasePathOverride;
    v5 = (void *)_mainDatabasePathOverride;
    if (!_mainDatabasePathOverride)
      v5 = (void *)CalDatabaseCopyDirectoryPath();
    objc_msgSend(v3, "_canonicalizePath:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedMainDatabasePath = self->_cachedMainDatabasePath;
    self->_cachedMainDatabasePath = v6;

    if (!v4)
  }
  return self->_cachedMainDatabasePath;
}

- (void)openDatabaseForAccountID:(id)a3 clientID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DACalDBHelper *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__DACalDBHelper_openDatabaseForAccountID_clientID___block_invoke;
  block[3] = &unk_1E68CB2C0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __51__DACalDBHelper_openDatabaseForAccountID_clientID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_pathForAccountID:createdDatabase:", v3, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
  }
  else
  {
    objc_msgSend(v2, "_mainDatabasePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_openDatabaseForPath:clientID:createdDatabaseToConsume:", v4, *(_QWORD *)(a1 + 48), v5);

}

- (id)_pathForAccountID:(id)a3 createdDatabase:(CalDatabase *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  CalDatabase *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_containerPathsByAccountID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D0BB38]);
    v9 = (void *)objc_msgSend(v8, "initWithDirectoryURL:", _mainDatabasePathOverride);
    objc_msgSend(v9, "setOptions:", self->_initOptions);
    if (_containerProvider)
      objc_msgSend(v9, "setDataContainerProvider:");
    v10 = CalDatabaseCreateWithConfigurationForAccountID();
    if (v10)
    {
      v11 = (CalDatabase *)v10;
      v12 = CalDatabaseCopyDirectoryPathForDatabase();
      v13 = (void *)v12;
      if (a4)
      {
        *a4 = v11;
        if (v12)
        {
LABEL_7:
          objc_msgSend((id)objc_opt_class(), "_canonicalizePath:", v13);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_containerPathsByAccountID, "setObject:forKeyedSubscript:", v7, v6);
          goto LABEL_12;
        }
      }
      else
      {
        CFRelease(v11);
        if (v13)
          goto LABEL_7;
      }
    }
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v14, v15))
    {
      v17 = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1B51E4000, v14, v15, "Failed to determine database directory path for accountID: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    v7 = 0;
  }
LABEL_12:

  return v7;
}

- (void)openDatabaseForAuxDatabaseRef:(void *)a3 clientID:(id)a4
{
  id v7;
  NSObject *queue;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;
  void *v13;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DACalDBHelper.m"), 90, CFSTR("NULL auxDatabaseRef when trying to open aux database for client: %@"), v7);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__DACalDBHelper_openDatabaseForAuxDatabaseRef_clientID___block_invoke;
  block[3] = &unk_1E68CB590;
  v12 = v7;
  v13 = a3;
  block[4] = self;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __56__DACalDBHelper_openDatabaseForAuxDatabaseRef_clientID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CalAuxDatabaseGetUID());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = 0;
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "_openDatabaseForPath:clientID:createdDatabaseToConsume:", v4, *(_QWORD *)(a1 + 40), v5);

    goto LABEL_4;
  }
  CalGetDatabaseForRecord();
  v5 = (const void *)CalDatabaseCreateWithAuxDatabaseRef();
  if (v5)
  {
    v6 = CalDatabaseCopyDirectoryPathForDatabase();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend((id)objc_opt_class(), "_canonicalizePath:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v4, v2);
      goto LABEL_3;
    }
  }
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = 138543362;
    v11 = v2;
    _os_log_impl(&dword_1B51E4000, v8, v9, "Failed to determine database directory path for auxDatabaseID: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (v5)
    CFRelease(v5);
LABEL_4:

}

- (id)allOpenDatabases
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__DACalDBHelper_allOpenDatabases__block_invoke;
  v5[3] = &unk_1E68CB5C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__DACalDBHelper_allOpenDatabases__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (CalDatabase)databaseForAccountID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  CalDatabase *v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DACalDBHelper_databaseForAccountID___block_invoke;
  block[3] = &unk_1E68CB5E8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (CalDatabase *)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

CFTypeRef __38__DACalDBHelper_databaseForAccountID___block_invoke(uint64_t a1)
{
  CFTypeRef result;
  CFTypeRef v3;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_cachedDatabaseForAccountID:path:", *(_QWORD *)(a1 + 40), 0);
  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (result)
  {
    v3 = CFRetain(result);
    return CFAutorelease(v3);
  }
  return result;
}

- (CalDatabase)databaseForAuxDatabaseRef:(void *)a3
{
  NSObject *queue;
  CalDatabase *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DACalDBHelper_databaseForAuxDatabaseRef___block_invoke;
  block[3] = &unk_1E68CB610;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (CalDatabase *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__DACalDBHelper_databaseForAuxDatabaseRef___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cachedDatabaseForAuxDatabaseRef:path:", *(_QWORD *)(a1 + 48), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)saveDatabaseForAccountID:(id)a3 flushCaches:(BOOL)a4
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  SEL v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v7 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DACalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke;
  block[3] = &unk_1E68CB638;
  block[4] = self;
  v12 = v7;
  v13 = &v16;
  v14 = a2;
  v15 = a4;
  v9 = v7;
  dispatch_sync(queue, block);
  LOBYTE(a2) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)a2;
}

void __54__DACalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  v4 = objc_msgSend(v2, "_cachedDatabaseForAccountID:path:", v3, &v7);
  v5 = v7;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_saveDatabase:path:fushCaches:", v4, v5, *(unsigned __int8 *)(a1 + 64));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("DACalDBHelper.m"), 156, CFSTR("%@: tried to save a database that was never opened. accountID: %@"), objc_opt_class(), *(_QWORD *)(a1 + 40));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (BOOL)saveDatabaseForAuxDatabaseRef:(void *)a3 flushCaches:(BOOL)a4
{
  NSObject *queue;
  char v5;
  _QWORD block[8];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__DACalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke;
  block[3] = &unk_1E68CB660;
  block[6] = a3;
  block[7] = a2;
  block[4] = self;
  block[5] = &v9;
  v8 = a4;
  dispatch_sync(queue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __59__DACalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v10 = 0;
  v4 = objc_msgSend(v2, "_cachedDatabaseForAuxDatabaseRef:path:", v3, &v10);
  v5 = v10;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_saveDatabase:path:fushCaches:", v4, v5, *(unsigned __int8 *)(a1 + 64));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = objc_opt_class();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("DACalDBHelper.m"), 174, CFSTR("%@: tried to save a database that was never opened. auxDatabaseID: %d"), v9, CalAuxDatabaseGetUID());

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (BOOL)closeDatabaseForAccountID:(id)a3 save:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  BOOL v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v13;
  SEL v14;

  v4 = a4;
  v7 = a3;
  v8 = !v4
    || -[DACalDBHelper saveDatabaseForAccountID:flushCaches:](self, "saveDatabaseForAccountID:flushCaches:", v7, 0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__DACalDBHelper_closeDatabaseForAccountID_save___block_invoke;
  block[3] = &unk_1E68CB590;
  block[4] = self;
  v13 = v7;
  v14 = a2;
  v10 = v7;
  dispatch_sync(queue, block);

  return v8;
}

void __48__DACalDBHelper_closeDatabaseForAccountID_save___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  v4 = objc_msgSend(v2, "_cachedDatabaseForAccountID:path:", v3, &v7);
  v5 = v7;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_closeDatabase:path:", v4, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("DACalDBHelper.m"), 195, CFSTR("%@: tried to close a database that was never opened. accountID: %@"), objc_opt_class(), *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)closeDatabaseForAuxDatabaseRef:(void *)a3 save:(BOOL)a4
{
  BOOL v7;
  NSObject *queue;
  _QWORD block[7];

  v7 = !a4
    || -[DACalDBHelper saveDatabaseForAuxDatabaseRef:flushCaches:](self, "saveDatabaseForAuxDatabaseRef:flushCaches:", a3, 0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__DACalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke;
  block[3] = &unk_1E68CB688;
  block[4] = self;
  block[5] = a3;
  block[6] = a2;
  dispatch_sync(queue, block);
  return v7;
}

void __53__DACalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v4 = objc_msgSend(v2, "_cachedDatabaseForAuxDatabaseRef:path:", v3, &v10);
  v5 = v10;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_closeDatabase:path:", v4, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = objc_opt_class();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("DACalDBHelper.m"), 215, CFSTR("%@: tried to close a database that was never opened. auxDatabaseID: %d"), v9, CalAuxDatabaseGetUID());

  }
}

- (void)_openDatabaseForPath:(id)a3 clientID:(id)a4 createdDatabaseToConsume:(CalDatabase *)a5
{
  id v9;
  CalDatabase *v10;
  CalDatabase *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  NSUInteger v21;
  NSObject *v22;
  os_log_type_t v23;
  NSObject *v24;
  os_log_type_t v25;
  char v26;
  void *v27;
  uint8_t buf[4];
  CalDatabase *v29;
  __int16 v30;
  CalDatabase *v31;
  __int16 v32;
  NSUInteger v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (CalDatabase *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_databasesByContainerPath, "objectForKeyedSubscript:", v9);
  v11 = (CalDatabase *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0D1C448];
  if (v11)
  {
    v13 = (void *)CalDatabaseCopyClientIdentifier();
    if (v10 && (-[CalDatabase isEqual:](v10, "isEqual:", v13) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DACalDBHelper.m"), 232, CFSTR("Client identifier is different. Expected \"%@\" but got \"%@\"), v13, v10);

    }
    v14 = 0;
  }
  else
  {
    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_BYTE *)(v12 + 7);
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v10;
      _os_log_impl(&dword_1B51E4000, v15, v16, "Creating calendar database for clientID %{public}@", buf, 0xCu);
    }

    v14 = a5 != 0;
    if (a5)
    {
      DALoggingwithCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, v16))
      {
        *(_DWORD *)buf = 134349056;
        v29 = a5;
        _os_log_impl(&dword_1B51E4000, v17, v16, "Using already-created calendar database %{public}p", buf, 0xCu);
      }
      v11 = a5;
    }
    else
    {
      -[DACalDBHelper _mainDatabasePath](self, "_mainDatabasePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "isEqualToString:", v9);

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
      v17 = objc_claimAutoreleasedReturnValue();
      v11 = (CalDatabase *)CalDatabaseCreateWithOptionsDatabaseDirectoryURLAndContainerProvider();
      DALoggingwithCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, v16))
      {
        *(_DWORD *)buf = 134349056;
        v29 = v11;
        _os_log_impl(&dword_1B51E4000, v19, v16, "Created calendar database %{public}p", buf, 0xCu);
      }

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_databasesByContainerPath, "setObject:forKeyedSubscript:", v11, v9);
    -[DACalDBHelper _registerForCalendarYieldNotificationsForDB:](self, "_registerForCalendarYieldNotificationsForDB:", v11);
    if (!-[CalDatabase length](v10, "length"))
    {
      v20 = CFSTR("com.apple.dataaccessd.changeinserter");

      v10 = (CalDatabase *)v20;
    }
    CalDatabaseSetClientIdentifier();
    CalDatabaseSetPropertyModificationLoggingEnabled();
    CFRelease(v11);
    v13 = 0;
  }
  -[NSCountedSet addObject:](self->_connectionCountsByPath, "addObject:", v9);
  v21 = -[NSCountedSet countForObject:](self->_connectionCountsByPath, "countForObject:", v9);
  DALoggingwithCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(_BYTE *)(v12 + 7);
  if (os_log_type_enabled(v22, v23))
  {
    *(_DWORD *)buf = 134218498;
    v29 = v11;
    v30 = 2114;
    v31 = v10;
    v32 = 2048;
    v33 = v21;
    _os_log_impl(&dword_1B51E4000, v22, v23, "Cal database %p opened for \"%{public}@\". Connection count is now %lu", buf, 0x20u);
  }

  if (v21 >= 2)
  {
    DALoggingwithCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_BYTE *)(v12 + 6);
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 134217984;
      v29 = (CalDatabase *)v21;
      _os_log_impl(&dword_1B51E4000, v24, v25, "connectionCount is > 1, at %lu", buf, 0xCu);
    }

  }
  if (a5)
    v26 = v14;
  else
    v26 = 1;
  if ((v26 & 1) == 0)
    CFRelease(a5);

}

- (CalDatabase)_cachedDatabaseForAccountID:(id)a3 path:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  CalDatabase *v12;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    -[DACalDBHelper _pathForAccountID:createdDatabase:](self, "_pathForAccountID:createdDatabase:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_12:
      v12 = 0;
      if (!a4)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else
  {
    v8 = (void *)objc_opt_class();
    v9 = _mainDatabasePathOverride;
    v10 = (void *)_mainDatabasePathOverride;
    if (!_mainDatabasePathOverride)
      v10 = (void *)CalDatabaseCopyDirectoryPath();
    objc_msgSend(v8, "_canonicalizePath:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v11;
    if (v9)
    {
      if (!v11)
        goto LABEL_12;
    }
    else
    {

      if (!v7)
        goto LABEL_12;
    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_databasesByContainerPath, "objectForKeyedSubscript:", v7);
  v12 = (CalDatabase *)objc_claimAutoreleasedReturnValue();

  if (a4)
LABEL_9:
    *a4 = objc_retainAutorelease(v7);
LABEL_10:

  return v12;
}

- (CalDatabase)_cachedDatabaseForAuxDatabaseRef:(void *)a3 path:(id *)a4
{
  uint64_t UID;
  NSMutableDictionary *containerPathsByAuxDatabaseID;
  void *v9;
  CalDatabase *v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3)
  {
    UID = CalAuxDatabaseGetUID();
    containerPathsByAuxDatabaseID = self->_containerPathsByAuxDatabaseID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", UID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](containerPathsByAuxDatabaseID, "objectForKeyedSubscript:", v9);
    a3 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_databasesByContainerPath, "objectForKeyedSubscript:", a3);
      v10 = (CalDatabase *)objc_claimAutoreleasedReturnValue();

      if (!a4)
        goto LABEL_8;
      goto LABEL_7;
    }
    v10 = 0;
    if (a4)
    {
LABEL_7:
      a3 = objc_retainAutorelease(a3);
      *a4 = a3;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (BOOL)_saveDatabase:(CalDatabase *)a3 path:(id)a4 fushCaches:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  __CFString *v14;
  const __CFString *v15;
  DALocalDBWatcher *watcher;
  char v17;
  void *v18;
  BOOL v19;
  char v20;
  NSObject *v21;
  const __CFString *v22;
  NSObject *v23;
  uint8_t buf[4];
  CalDatabase *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = -[DALocalDBWatcher lastSavedCalSequenceNumberForDatabaseInContainer:](self->_watcher, "lastSavedCalSequenceNumberForDatabaseInContainer:", v8);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0D0BEF8], 0, 0, 1u);
  +[DALocalDBGateKeeper sharedGateKeeper](DALocalDBGateKeeper, "sharedGateKeeper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "claimedOwnershipOfDataclasses:", 4);

  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
  if (os_log_type_enabled(v12, v13))
  {
    v14 = &stru_1E68CCDC0;
    if (v5)
      v15 = CFSTR(", and flushing caches");
    else
      v15 = &stru_1E68CCDC0;
    watcher = self->_watcher;
    if (watcher)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" old sequence %d"), v9);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 134218498;
    v26 = a3;
    v27 = 2114;
    v28 = v15;
    v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_1B51E4000, v12, v13, "Saving calendar database %p%{public}@%{public}@.", buf, 0x20u);
    if (watcher)

  }
  if (self->_watcher)
    -[DALocalDBWatcher setLastSavedCalSequenceNumber:forDatabaseInContainer:](self->_watcher, "setLastSavedCalSequenceNumber:forDatabaseInContainer:", CalDatabaseGetSequenceNumber(), v8);
  if (v5)
  {
    v17 = CalDatabaseSaveAndFlushCaches();
    -[DACalDBHelper _registerForCalendarYieldNotificationsForDB:](self, "_registerForCalendarYieldNotificationsForDB:", a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", CFSTR("CalDBIsClosing"), 0);

    if ((v17 & 1) != 0)
    {
LABEL_13:
      v19 = 1;
      goto LABEL_24;
    }
  }
  else
  {
    v20 = CalDatabaseSave();
    -[DACalDBHelper _registerForCalendarYieldNotificationsForDB:](self, "_registerForCalendarYieldNotificationsForDB:", a3);
    if ((v20 & 1) != 0)
      goto LABEL_13;
  }
  DALoggingwithCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, v13))
  {
    v22 = &stru_1E68CCDC0;
    if (v5)
      v22 = CFSTR(", and flushing caches");
    *(_DWORD *)buf = 134218242;
    v26 = a3;
    v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_1B51E4000, v21, v13, "Saving calendar database %p%{public}@.  Save failed", buf, 0x16u);
  }

  if (self->_watcher)
  {
    DALoggingwithCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, v13))
    {
      *(_DWORD *)buf = 134218240;
      v26 = a3;
      v27 = 1024;
      LODWORD(v28) = v9;
      _os_log_impl(&dword_1B51E4000, v23, v13, "Resetting calendar database %p sequence %d", buf, 0x12u);
    }

    -[DALocalDBWatcher setLastSavedCalSequenceNumber:forDatabaseInContainer:](self->_watcher, "setLastSavedCalSequenceNumber:forDatabaseInContainer:", v9, v8);
  }
  v19 = 0;
LABEL_24:

  return v19;
}

- (void)_closeDatabase:(CalDatabase *)a3 path:(id)a4
{
  CalDatabase *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  CalDatabase *v16;
  __int16 v17;
  NSUInteger v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (CalDatabase *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = -[NSCountedSet countForObject:](self->_connectionCountsByPath, "countForObject:", v6);
  if (v7)
  {
    v8 = v7;
    -[NSCountedSet removeObject:](self->_connectionCountsByPath, "removeObject:", v6);
    if (a3)
      v9 = CalDatabaseCopyClientIdentifier();
    else
      v9 = 0;
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
    if (os_log_type_enabled(v11, v12))
    {
      v15 = 134218498;
      v16 = a3;
      v17 = 2048;
      v18 = v8 - 1;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1B51E4000, v11, v12, "Decrementing database %p reference count. connectionCount is %lu. Client identifier is \"%{public}@\", (uint8_t *)&v15, 0x20u);
    }

    if (v8 == 1)
    {
      DALoggingwithCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, v12))
      {
        v15 = 134217984;
        v16 = a3;
        _os_log_impl(&dword_1B51E4000, v13, v12, "Destroying calendar database %p", (uint8_t *)&v15, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:", CFSTR("CalDBIsClosing"), 0);

      CalDatabaseRegisterYieldBlock();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_databasesByContainerPath, "setObject:forKeyedSubscript:", 0, v6);
    }
  }
  else
  {
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      v15 = 138543362;
      v16 = v6;
      _os_log_impl(&dword_1B51E4000, v9, v10, "_closeDatabase called too many times with path: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }

}

- (void)_registerForCalendarYieldNotificationsForDB:(CalDatabase *)a3
{
  if (a3)
    CalDatabaseRegisterYieldBlock();
}

void __61__DACalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B51E4000, v2, v3, "Someone asked us to yield the calendar database. Bumping up all clients to UI priority", buf, 2u);
  }

  +[DAPriorityManager sharedManager](DAPriorityManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bumpDataclassesToUIPriority:", 20);

  CFRetain(*(CFTypeRef *)(a1 + 32));
  dataaccess_get_global_queue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__DACalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke_32;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v5, block);

}

void __61__DACalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke_32(uint64_t a1)
{
  CalDatabaseRegisterYieldBlock();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

+ (id)_canonicalizePath:(id)a3
{
  return (id)objc_msgSend(a3, "removeSlashIfNeeded");
}

+ (void)setMainDatabasePath:(id)a3 containerProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)_mainDatabasePathOverride;
  _mainDatabasePathOverride = (uint64_t)v5;
  v9 = v5;

  v8 = (void *)_containerProvider;
  _containerProvider = (uint64_t)v6;

}

+ (id)mainDatabasePath
{
  return (id)_mainDatabasePathOverride;
}

+ (id)containerProvider
{
  return (id)_containerProvider;
}

- (DALocalDBWatcher)watcher
{
  return self->_watcher;
}

- (void)setWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_watcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watcher, 0);
  objc_storeStrong((id *)&self->_connectionCountsByPath, 0);
  objc_storeStrong((id *)&self->_databasesByContainerPath, 0);
  objc_storeStrong((id *)&self->_containerPathsByAuxDatabaseID, 0);
  objc_storeStrong((id *)&self->_containerPathsByAccountID, 0);
  objc_storeStrong((id *)&self->_cachedMainDatabasePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
