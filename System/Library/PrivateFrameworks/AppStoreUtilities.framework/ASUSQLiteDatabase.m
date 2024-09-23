@implementation ASUSQLiteDatabase

- (ASUSQLiteDatabase)initWithConnection:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASUSQLiteDatabase;
  v6 = -[ASUSQLiteDatabase init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.appstored.ASUSQLiteDatabase", v7);
    v9 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v8;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 2), "_ASUSQLiteDispatchQueueTag", v6, 0);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 258);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v10;

    objc_storeStrong((id *)v6 + 1, a3);
    objc_msgSend(*((id *)v6 + 1), "setDelegate:", v6);
  }

  return (ASUSQLiteDatabase *)v6;
}

- (ASUSQLiteDatabase)initWithConnectionOptions:(id)a3
{
  id v4;
  ASUSQLiteConnection *v5;
  ASUSQLiteDatabase *v6;

  v4 = a3;
  v5 = -[ASUSQLiteConnection initWithOptions:]([ASUSQLiteConnection alloc], "initWithOptions:", v4);

  v6 = -[ASUSQLiteDatabase initWithConnection:](self, "initWithConnection:", v5);
  return v6;
}

- (void)assertOnTransactionQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
}

- (void)modifyStore:(id)a3 usingTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__ASUSQLiteDatabase_modifyStore_usingTransaction___block_invoke;
  v10[3] = &unk_2507A9478;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v10);

}

void __50__ASUSQLiteDatabase_modifyStore_usingTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
  objc_msgSend((id)objc_opt_class(), "storeDescriptor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ASUSQLiteDatabase _modifyUsingTransactionClass:withBlock:](*(_QWORD *)(a1 + 32), (objc_class *)objc_msgSend(v3, "transactionClass"), *(void **)(a1 + 48));

}

- (void)_modifyUsingTransactionClass:(void *)a3 withBlock:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v5 = (void *)objc_msgSend([a2 alloc], "initWithConnection:", *(_QWORD *)(a1 + 8));
    v6 = *(void **)(a1 + 8);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__ASUSQLiteDatabase__modifyUsingTransactionClass_withBlock___block_invoke;
    v9[3] = &unk_2507A95B8;
    v10 = v5;
    v11 = v8;
    v7 = v5;
    objc_msgSend(v6, "performTransaction:error:", v9, 0);

  }
}

- (void)_reentrantSafePerformBlock:(NSObject *)a1
{
  NSObject **specific;
  NSObject *v4;
  void (**block)(void);

  block = a2;
  if (a1)
  {
    specific = (NSObject **)dispatch_get_specific("_ASUSQLiteDispatchQueueTag");
    v4 = a1[2];
    if (specific == a1)
    {
      dispatch_assert_queue_V2(v4);
      block[2]();
    }
    else
    {
      dispatch_assert_queue_not_V2(v4);
      dispatch_sync(a1[2], block);
    }
  }

}

- (void)modifyStore:(id)a3 usingTransaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *transactionQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  transactionQueue = self->_transactionQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__ASUSQLiteDatabase_modifyStore_usingTransaction_completion___block_invoke;
  v15[3] = &unk_2507A94A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(transactionQueue, v15);

}

void __61__ASUSQLiteDatabase_modifyStore_usingTransaction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
  objc_msgSend((id)objc_opt_class(), "storeDescriptor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASUSQLiteDatabase _modifyUsingTransactionClass:withBlock:](*(_QWORD *)(a1 + 32), (objc_class *)objc_msgSend(v4, "transactionClass"), *(void **)(a1 + 48));
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, *(dispatch_block_t *)(a1 + 56));

}

- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  Class v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__ASUSQLiteDatabase_modifyStore_usingTransactionClass_withBlock___block_invoke;
  v12[3] = &unk_2507A94C8;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v12);

}

void __65__ASUSQLiteDatabase_modifyStore_usingTransactionClass_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  -[ASUSQLiteDatabase _modifyUsingTransactionClass:withBlock:](v2, *(objc_class **)(a1 + 56), *(void **)(a1 + 48));
}

- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *transactionQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  Class v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  transactionQueue = self->_transactionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__ASUSQLiteDatabase_modifyStore_usingTransactionClass_withBlock_completion___block_invoke;
  block[3] = &unk_2507A94F0;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a4;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(transactionQueue, block);

}

void __76__ASUSQLiteDatabase_modifyStore_usingTransactionClass_withBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  -[ASUSQLiteDatabase _modifyUsingTransactionClass:withBlock:](v2, *(objc_class **)(a1 + 64), *(void **)(a1 + 48));
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, *(dispatch_block_t *)(a1 + 56));

}

- (void)readStore:(id)a3 usingSession:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__ASUSQLiteDatabase_readStore_usingSession___block_invoke;
  v10[3] = &unk_2507A9478;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v10);

}

void __44__ASUSQLiteDatabase_readStore_usingSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  dispatch_queue_t *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
  objc_msgSend((id)objc_opt_class(), "storeDescriptor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "sessionClass")), "initWithConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = *(dispatch_queue_t **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__ASUSQLiteDatabase_readStore_usingSession___block_invoke_2;
  v7[3] = &unk_2507A9518;
  v8 = *(id *)(a1 + 48);
  v5 = -[ASUSQLiteDatabase _readUsingSession:withBlock:](v4, v3, v7);

}

uint64_t __44__ASUSQLiteDatabase_readStore_usingSession___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

- (dispatch_queue_t)_readUsingSession:(void *)a3 withBlock:
{
  id v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    v19 = 0;
    v7 = a1[1];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __49__ASUSQLiteDatabase__readUsingSession_withBlock___block_invoke;
    v10[3] = &unk_2507A9630;
    v13 = &v14;
    v12 = v6;
    v11 = v5;
    if (-[NSObject performTransaction:error:](v7, "performTransaction:error:", v10, 0))
      v8 = (void *)v15[5];
    else
      v8 = 0;
    a1 = v8;

    _Block_object_dispose(&v14, 8);
  }

  return a1;
}

- (void)readStore:(id)a3 usingSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *transactionQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  transactionQueue = self->_transactionQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__ASUSQLiteDatabase_readStore_usingSession_completion___block_invoke;
  v15[3] = &unk_2507A94A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(transactionQueue, v15);

}

void __55__ASUSQLiteDatabase_readStore_usingSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    -[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](v2, *(void **)(a1 + 40), 0);
  objc_msgSend((id)objc_opt_class(), "storeDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "sessionClass")), "initWithConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  -[ASUSQLiteDatabase _readUsingSession:withBlock:](*(dispatch_queue_t **)(a1 + 32), v4, *(void **)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__ASUSQLiteDatabase_readStore_usingSession_completion___block_invoke_2;
  v9[3] = &unk_2507A9540;
  v7 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __55__ASUSQLiteDatabase_readStore_usingSession_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)connectionNeedsResetForReopen:(id)a3
{
  id v4;
  NSObject *v5;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  ASULogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "databasePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_error_impl(&dword_236337000, v5, OS_LOG_TYPE_ERROR, "Requiring all stores to migrate after truncating corrupt database at: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  NSResetHashTable(self->_migratedStores);

  return 1;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ASULogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_error_impl(&dword_236337000, v7, OS_LOG_TYPE_ERROR, "Exiting after deleting corrupt database at: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v4, "close");
  v15 = 0;
  ASUSQLiteDeleteDatabase(v6, &v15);
  v8 = v15;
  if (v8)
  {
    v9 = v8;
    ASULogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_error_impl(&dword_236337000, v10, OS_LOG_TYPE_ERROR, "Error when deleting corrupt database, renaming database instead: %{public}@", buf, 0xCu);
    }

    v14 = 0;
    ASUSQLiteTrashDatabaseName(v6, &v14);
    v11 = v14;
    if (v11)
    {
      v12 = v11;
      ASULogHandleForCategory(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v12;
        _os_log_error_impl(&dword_236337000, v13, OS_LOG_TYPE_ERROR, "Error when renaming database: %{public}@", buf, 0xCu);
      }

    }
  }
  exit(0);
}

- (BOOL)tableExists:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__ASUSQLiteDatabase_tableExists___block_invoke;
  v7[3] = &unk_2507A9568;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __33__ASUSQLiteDatabase_tableExists___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "tableExists:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)verifyDatabaseIntegrity
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44__ASUSQLiteDatabase_verifyDatabaseIntegrity__block_invoke;
  v2[3] = &unk_2507A9590;
  v2[4] = self;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:]((NSObject **)self, v2);
}

void __44__ASUSQLiteDatabase_verifyDatabaseIntegrity__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tableExists:", CFSTR("schema_version"));
  ASULogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if ((_DWORD)v2)
  {
    if (v5)
    {
      v7 = 138543362;
      v8 = v3;
      v6 = "Database opened at: %{public}@";
LABEL_6:
      _os_log_impl(&dword_236337000, v4, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v5)
  {
    v7 = 138543362;
    v8 = v3;
    v6 = "Database created at: %{public}@";
    goto LABEL_6;
  }

}

uint64_t __60__ASUSQLiteDatabase__modifyUsingTransactionClass_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (uint64_t)_performMigrationIfNeededForStore:(char)a3 calledAfterTransaction:
{
  id v5;
  uint64_t v6;
  void *v7;
  ASUSQLiteDatabaseStoreSchema *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ASUSQLiteDatabaseStoreSchema *v12;
  void *v13;
  id v14;
  ASUSQLiteDatabaseStoreSchema *v15;
  _QWORD v17[4];
  id v18;
  ASUSQLiteDatabaseStoreSchema *v19;
  uint64_t v20;
  id v21;
  char v22;

  v5 = a2;
  if (a1)
  {
    if (NSHashGet(*(NSHashTable **)(a1 + 24), v5))
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "storeDescriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = [ASUSQLiteDatabaseStoreSchema alloc];
      v9 = *(_QWORD *)(a1 + 8);
      objc_msgSend(v7, "schemaName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tableNames");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ASUSQLiteDatabaseStoreSchema initWithConnection:schemaName:tableNames:](v8, "initWithConnection:schemaName:tableNames:", v9, v10, v11);

      v13 = *(void **)(a1 + 8);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke;
      v17[3] = &unk_2507A9608;
      v18 = v5;
      v19 = v12;
      v22 = a3;
      v20 = a1;
      v21 = v7;
      v14 = v7;
      v15 = v12;
      v6 = objc_msgSend(v13, "performTransaction:error:", v17, 0);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_opt_class(), "createOrMigrateStoreUsingSchema:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)v2)
  {
    if (!*(_BYTE *)(a1 + 64))
    {
      v3 = *(_QWORD *)(a1 + 48);
      v4 = *(void **)(v3 + 8);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke_2;
      v9[3] = &unk_2507A95E0;
      v9[4] = v3;
      v10 = *(id *)(a1 + 32);
      objc_msgSend(v4, "dispatchAfterTransaction:", v9);

    }
  }
  else
  {
    ASULogHandleForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 56), "schemaName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 40), "currentSchemaVersion");
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2048;
      v14 = v8;

    }
  }
  return v2;
}

void __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  NSObject **v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke_3;
  v2[3] = &unk_2507A95E0;
  v1 = *(void **)(a1 + 40);
  v3 = *(NSObject ***)(a1 + 32);
  v4 = v1;
  -[ASUSQLiteDatabase _reentrantSafePerformBlock:](v3, v2);

}

void __78__ASUSQLiteDatabase__performMigrationIfNeededForStore_calledAfterTransaction___block_invoke_3(uint64_t a1)
{
  if (-[ASUSQLiteDatabase _performMigrationIfNeededForStore:calledAfterTransaction:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1))NSHashInsert(*(NSHashTable **)(*(_QWORD *)(a1 + 32) + 24), *(const void **)(a1 + 40));
}

uint64_t __49__ASUSQLiteDatabase__readUsingSession_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migratedStores, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
