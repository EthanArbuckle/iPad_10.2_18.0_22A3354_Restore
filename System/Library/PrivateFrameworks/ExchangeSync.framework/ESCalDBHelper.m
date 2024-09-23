@implementation ESCalDBHelper

- (ESCalDBHelper)initWithDatabaseInitOptions:(int)a3
{
  ESCalDBHelper *v4;
  ESCalDBHelper *v5;
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
  v17.super_class = (Class)ESCalDBHelper;
  v4 = -[ESCalDBHelper init](&v17, sel_init);
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
  ESCalDBHelper *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ESCalDBHelper_openDatabaseForAccountID_clientID___block_invoke;
  block[3] = &unk_24F4DDFE8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __51__ESCalDBHelper_openDatabaseForAccountID_clientID___block_invoke(uint64_t a1)
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
  uint64_t v8;
  CalDatabase *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_containerPathsByAccountID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = CalDatabaseCreateWithOptionsMainDatabaseDirectoryAndContainerProviderForAccountID();
    if (v8)
    {
      v9 = (CalDatabase *)v8;
      v10 = CalDatabaseCopyDirectoryPathForDatabase();
      v11 = (void *)v10;
      if (a4)
      {
        *a4 = v9;
        if (v10)
        {
LABEL_5:
          objc_msgSend((id)objc_opt_class(), "_canonicalizePath:", v11);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_containerPathsByAccountID, "setObject:forKeyedSubscript:", v7, v6);
          goto LABEL_10;
        }
      }
      else
      {
        CFRelease(v9);
        if (v11)
          goto LABEL_5;
      }
    }
    DALoggingwithCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v12, v13))
    {
      v15 = 138543362;
      v16 = v6;
      _os_log_impl(&dword_22AC94000, v12, v13, "Failed to determine database directory path for accountID: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    v7 = 0;
  }
LABEL_10:

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
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ESCalDBHelper.m"), 87, CFSTR("NULL auxDatabaseRef when trying to open aux database for client: %@"), v7);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ESCalDBHelper_openDatabaseForAuxDatabaseRef_clientID___block_invoke;
  block[3] = &unk_24F4DE010;
  v12 = v7;
  v13 = a3;
  block[4] = self;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __56__ESCalDBHelper_openDatabaseForAuxDatabaseRef_clientID___block_invoke(uint64_t a1)
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

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", CalAuxDatabaseGetUID());
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
  v9 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = 138543362;
    v11 = v2;
    _os_log_impl(&dword_22AC94000, v8, v9, "Failed to determine database directory path for auxDatabaseID: %{public}@", (uint8_t *)&v10, 0xCu);
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__ESCalDBHelper_allOpenDatabases__block_invoke;
  v5[3] = &unk_24F4DE038;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__ESCalDBHelper_allOpenDatabases__block_invoke(uint64_t a1)
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ESCalDBHelper_databaseForAccountID___block_invoke;
  block[3] = &unk_24F4DE060;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (CalDatabase *)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

CFTypeRef __38__ESCalDBHelper_databaseForAccountID___block_invoke(uint64_t a1)
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ESCalDBHelper_databaseForAuxDatabaseRef___block_invoke;
  block[3] = &unk_24F4DE088;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (CalDatabase *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__ESCalDBHelper_databaseForAuxDatabaseRef___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cachedDatabaseForAuxDatabaseRef:path:", *(_QWORD *)(a1 + 48), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)saveDatabaseForAccountID:(id)a3 flushCaches:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
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
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__ESCalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke;
  v10[3] = &unk_24F4DE0B0;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __54__ESCalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 8);
  v8 = 0;
  v5 = objc_msgSend(v2, "_cachedDatabaseForAccountID:path:", v4, &v8);
  v6 = v8;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_saveDatabase:path:fushCaches:", v5, v6, *(unsigned __int8 *)(a1 + 56));
  }
  else
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __54__ESCalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (BOOL)saveDatabaseForAuxDatabaseRef:(void *)a3 flushCaches:(BOOL)a4
{
  NSObject *queue;
  char v5;
  _QWORD v7[7];
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__ESCalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke;
  v7[3] = &unk_24F4DE0D8;
  v7[5] = &v9;
  v7[6] = a3;
  v7[4] = self;
  v8 = a4;
  dispatch_sync(queue, v7);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __59__ESCalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 16);
  v8 = 0;
  v5 = objc_msgSend(v2, "_cachedDatabaseForAuxDatabaseRef:path:", v4, &v8);
  v6 = v8;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_saveDatabase:path:fushCaches:", v5, v6, *(unsigned __int8 *)(a1 + 56));
  }
  else
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __59__ESCalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (BOOL)closeDatabaseForAccountID:(id)a3 save:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  NSObject *queue;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = !v4
    || -[ESCalDBHelper saveDatabaseForAccountID:flushCaches:](self, "saveDatabaseForAccountID:flushCaches:", v6, 0);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__ESCalDBHelper_closeDatabaseForAccountID_save___block_invoke;
  v11[3] = &unk_24F4DE100;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  dispatch_sync(queue, v11);

  return v7;
}

void __48__ESCalDBHelper_closeDatabaseForAccountID_save___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;

  v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  v7 = 0;
  v4 = objc_msgSend(v1, "_cachedDatabaseForAccountID:path:", v3, &v7);
  v5 = v7;
  if (v4)
  {
    objc_msgSend(*(id *)v2, "_closeDatabase:path:", v4, v5);
  }
  else
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __48__ESCalDBHelper_closeDatabaseForAccountID_save___block_invoke_cold_1();

  }
}

- (BOOL)closeDatabaseForAuxDatabaseRef:(void *)a3 save:(BOOL)a4
{
  BOOL v6;
  NSObject *queue;
  _QWORD v9[6];

  v6 = !a4
    || -[ESCalDBHelper saveDatabaseForAuxDatabaseRef:flushCaches:](self, "saveDatabaseForAuxDatabaseRef:flushCaches:", a3, 0);
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__ESCalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke;
  v9[3] = &unk_24F4DE128;
  v9[4] = self;
  v9[5] = a3;
  dispatch_sync(queue, v9);
  return v6;
}

void __53__ESCalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;

  v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  v7 = 0;
  v4 = objc_msgSend(v1, "_cachedDatabaseForAuxDatabaseRef:path:", v3, &v7);
  v5 = v7;
  if (v4)
  {
    objc_msgSend(*(id *)v2, "_closeDatabase:path:", v4, v5);
  }
  else
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __53__ESCalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke_cold_1();

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
  NSUInteger v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  os_log_type_t v19;
  char v20;
  NSObject *v21;
  os_log_type_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  __CFString *v26;
  uint8_t buf[4];
  CalDatabase *v28;
  __int16 v29;
  CalDatabase *v30;
  __int16 v31;
  NSUInteger v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (CalDatabase *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_databasesByContainerPath, "objectForKeyedSubscript:", v9);
  v11 = (CalDatabase *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x24BE2AD38];
  if (v10 && v11)
  {
    if ((-[CalDatabase isEqual:](v10, "isEqual:", self->_clientIdentifier) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ESCalDBHelper.m"), 225, CFSTR("Client identifier is different. Expected \"%@\" but got \"%@\"), self->_clientIdentifier, v10);

    }
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  DALoggingwithCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_BYTE *)(v12 + 7);
  if (os_log_type_enabled(v21, v22))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v10;
    _os_log_impl(&dword_22AC94000, v21, v22, "Creating calendar database for clientID %{public}@", buf, 0xCu);
  }

  v14 = a5 != 0;
  if (a5)
  {
    DALoggingwithCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, v22))
    {
      *(_DWORD *)buf = 134349056;
      v28 = a5;
      _os_log_impl(&dword_22AC94000, v23, v22, "Using already-created calendar database %{public}p", buf, 0xCu);
    }
    v11 = a5;
  }
  else
  {
    -[ESCalDBHelper _mainDatabasePath](self, "_mainDatabasePath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "isEqualToString:", v9);

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
    v23 = objc_claimAutoreleasedReturnValue();
    v11 = (CalDatabase *)CalDatabaseCreateWithOptionsDatabaseDirectoryURLAndContainerProvider();
    DALoggingwithCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, v22))
    {
      *(_DWORD *)buf = 134349056;
      v28 = v11;
      _os_log_impl(&dword_22AC94000, v25, v22, "Created calendar database %{public}p", buf, 0xCu);
    }

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_databasesByContainerPath, "setObject:forKeyedSubscript:", v11, v9);
  -[ESCalDBHelper _registerForCalendarYieldNotificationsForDB:](self, "_registerForCalendarYieldNotificationsForDB:", v11);
  if (!-[CalDatabase length](v10, "length"))
  {
    v26 = CFSTR("com.apple.dataaccessd.changeinserter");

    v10 = (CalDatabase *)v26;
  }
  CalDatabaseSetClientIdentifier();
  objc_storeStrong((id *)&self->_clientIdentifier, v10);
  CalDatabaseSetPropertyModificationLoggingEnabled();
  CFRelease(v11);
LABEL_7:
  -[NSCountedSet addObject:](self->_connectionCountsByPath, "addObject:", v9);
  v15 = -[NSCountedSet countForObject:](self->_connectionCountsByPath, "countForObject:", v9);
  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_BYTE *)(v12 + 7);
  if (os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)buf = 134218498;
    v28 = v11;
    v29 = 2114;
    v30 = v10;
    v31 = 2048;
    v32 = v15;
    _os_log_impl(&dword_22AC94000, v16, v17, "Cal database %p opened for \"%{public}@\". Connection count is now %lu", buf, 0x20u);
  }

  if (v15 >= 2)
  {
    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_BYTE *)(v12 + 6);
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 134217984;
      v28 = (CalDatabase *)v15;
      _os_log_impl(&dword_22AC94000, v18, v19, "connectionCount is > 1, at %lu", buf, 0xCu);
    }

  }
  if (a5)
    v20 = v14;
  else
    v20 = 1;
  if ((v20 & 1) == 0)
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
  NSObject *v12;
  os_log_type_t v13;
  CalDatabase *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    -[ESCalDBHelper _pathForAccountID:createdDatabase:](self, "_pathForAccountID:createdDatabase:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_14:
      v14 = 0;
      if (!a4)
        goto LABEL_12;
      goto LABEL_11;
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
        goto LABEL_14;
    }
    else
    {

      if (!v7)
        goto LABEL_14;
    }
  }
  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v12, v13))
  {
    v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_22AC94000, v12, v13, "DatabasesByContainerPath: Getting calendar database with path %@", (uint8_t *)&v16, 0xCu);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_databasesByContainerPath, "objectForKeyedSubscript:", v7);
  v14 = (CalDatabase *)objc_claimAutoreleasedReturnValue();

  if (a4)
LABEL_11:
    *a4 = objc_retainAutorelease(v7);
LABEL_12:

  return v14;
}

- (CalDatabase)_cachedDatabaseForAuxDatabaseRef:(void *)a3 path:(id *)a4
{
  uint64_t UID;
  NSMutableDictionary *containerPathsByAuxDatabaseID;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  CalDatabase *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!a3)
  {
    v12 = 0;
    goto LABEL_10;
  }
  UID = CalAuxDatabaseGetUID();
  containerPathsByAuxDatabaseID = self->_containerPathsByAuxDatabaseID;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", UID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](containerPathsByAuxDatabaseID, "objectForKeyedSubscript:", v9);
  a3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3)
  {
    v12 = 0;
    if (!a4)
      goto LABEL_10;
LABEL_9:
    a3 = objc_retainAutorelease(a3);
    *a4 = a3;
    goto LABEL_10;
  }
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v10, v11))
  {
    v14 = 138412290;
    v15 = a3;
    _os_log_impl(&dword_22AC94000, v10, v11, "DatabasesByContainerPath: Getting aux calendar database with path %@", (uint8_t *)&v14, 0xCu);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_databasesByContainerPath, "objectForKeyedSubscript:", a3);
  v12 = (CalDatabase *)objc_claimAutoreleasedReturnValue();

  if (a4)
    goto LABEL_9;
LABEL_10:

  return v12;
}

- (BOOL)_saveDatabase:(CalDatabase *)a3 path:(id)a4 fushCaches:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  __CFString *v15;
  const __CFString *v16;
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
  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[ESLocalDBWatcher sharedDBWatcher](ESLocalDBWatcher, "sharedDBWatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lastSavedCalSequenceNumberForDatabaseInContainer:", v8);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE13EB8], 0, 0, 1u);
  objc_msgSend(MEMORY[0x24BE2AAB8], "sharedGateKeeper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "claimedOwnershipOfDataclasses:", 4);

  DALoggingwithCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v13, v14))
  {
    v15 = &stru_24F4DE530;
    if (v5)
      v16 = CFSTR(", and flushing caches");
    else
      v16 = &stru_24F4DE530;
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" old sequence %d"), v10);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 134218498;
    v26 = a3;
    v27 = 2114;
    v28 = v16;
    v29 = 2114;
    v30 = v15;
    _os_log_impl(&dword_22AC94000, v13, v14, "Saving calendar database %p%{public}@%{public}@.", buf, 0x20u);
    if (v9)

  }
  if (v9)
    objc_msgSend(v9, "setLastSavedCalSequenceNumber:forDatabaseInContainer:", CalDatabaseGetSequenceNumber(), v8);
  if (v5)
  {
    v17 = CalDatabaseSaveAndFlushCaches();
    -[ESCalDBHelper _registerForCalendarYieldNotificationsForDB:](self, "_registerForCalendarYieldNotificationsForDB:", a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
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
    -[ESCalDBHelper _registerForCalendarYieldNotificationsForDB:](self, "_registerForCalendarYieldNotificationsForDB:", a3);
    if ((v20 & 1) != 0)
      goto LABEL_13;
  }
  DALoggingwithCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, v14))
  {
    v22 = &stru_24F4DE530;
    if (v5)
      v22 = CFSTR(", and flushing caches");
    *(_DWORD *)buf = 134218242;
    v26 = a3;
    v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_22AC94000, v21, v14, "Saving calendar database %p%{public}@.  Save failed", buf, 0x16u);
  }

  if (v9)
  {
    DALoggingwithCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, v14))
    {
      *(_DWORD *)buf = 134218240;
      v26 = a3;
      v27 = 1024;
      LODWORD(v28) = v10;
      _os_log_impl(&dword_22AC94000, v23, v14, "Resetting calendar database %p sequence %d", buf, 0x12u);
    }

    objc_msgSend(v9, "setLastSavedCalSequenceNumber:forDatabaseInContainer:", v10, v8);
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
  NSString *clientIdentifier;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  CalDatabase *v17;
  __int16 v18;
  NSUInteger v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (CalDatabase *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = -[NSCountedSet countForObject:](self->_connectionCountsByPath, "countForObject:", v6);
  if (!v7)
  {
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v14, v15))
    {
      v16 = 138543362;
      v17 = v6;
      _os_log_impl(&dword_22AC94000, v14, v15, "_closeDatabase called too many times with path: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_11;
  }
  v8 = v7;
  -[NSCountedSet removeObject:](self->_connectionCountsByPath, "removeObject:", v6);
  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v9, v10))
  {
    clientIdentifier = self->_clientIdentifier;
    v16 = 134218498;
    v17 = a3;
    v18 = 2048;
    v19 = v8 - 1;
    v20 = 2114;
    v21 = clientIdentifier;
    _os_log_impl(&dword_22AC94000, v9, v10, "Decrementing database %p reference count. connectionCount is %lu. Client identifier is \"%{public}@\", (uint8_t *)&v16, 0x20u);
  }

  if (v8 == 1)
  {
    DALoggingwithCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, v10))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_22AC94000, v12, v10, "DatabasesByContainerPath: Destroying calendar database for path %@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("CalDBIsClosing"), 0);

    CalDatabaseRegisterYieldBlock();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_databasesByContainerPath, "setObject:forKeyedSubscript:", 0, v6);
    if (!-[NSCountedSet count](self->_connectionCountsByPath, "count"))
    {
      v14 = self->_clientIdentifier;
      self->_clientIdentifier = 0;
LABEL_11:

    }
  }

}

- (void)_registerForCalendarYieldNotificationsForDB:(CalDatabase *)a3
{
  if (a3)
    CalDatabaseRegisterYieldBlock();
}

void __61__ESCalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  const void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AC94000, v2, v3, "Someone asked us to yield the calendar database. Bumping up all clients to UI priority", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE2AAD0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bumpDataclassesToUIPriority:", 20);

  v5 = *(const void **)(a1 + 32);
  if (v5)
  {
    CFRetain(v5);
    dataaccess_get_global_queue();
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__ESCalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke_24;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v6, block);

  }
}

void __61__ESCalDBHelper__registerForCalendarYieldNotificationsForDB___block_invoke_24(uint64_t a1)
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

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionCountsByPath, 0);
  objc_storeStrong((id *)&self->_databasesByContainerPath, 0);
  objc_storeStrong((id *)&self->_containerPathsByAuxDatabaseID, 0);
  objc_storeStrong((id *)&self->_containerPathsByAccountID, 0);
  objc_storeStrong((id *)&self->_cachedMainDatabasePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__ESCalDBHelper_saveDatabaseForAccountID_flushCaches___block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  v0 = (void *)OUTLINED_FUNCTION_0();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_2(&dword_22AC94000, v2, v3, "%@: tried to save a database that was never opened. accountID: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __59__ESCalDBHelper_saveDatabaseForAuxDatabaseRef_flushCaches___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  v1 = (void *)OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(v1);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_22AC94000, v2, v3, "%@: tried to save a database that was never opened. auxDatabaseID: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __48__ESCalDBHelper_closeDatabaseForAccountID_save___block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  v0 = (void *)OUTLINED_FUNCTION_0();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_2(&dword_22AC94000, v2, v3, "%@: tried to close a database that was never opened. accountID: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __53__ESCalDBHelper_closeDatabaseForAuxDatabaseRef_save___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  v1 = (void *)OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(v1);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_22AC94000, v2, v3, "%@: tried to close a database that was never opened. auxDatabaseID: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

@end
