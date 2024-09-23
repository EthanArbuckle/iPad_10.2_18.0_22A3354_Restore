@implementation FPDAccessControlStore

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_13);
  return (id)sharedStore_store;
}

void __36__FPDAccessControlStore_sharedStore__block_invoke()
{
  FPDAccessControlStore *v0;
  void *v1;

  v0 = objc_alloc_init(FPDAccessControlStore);
  v1 = (void *)sharedStore_store;
  sharedStore_store = (uint64_t)v0;

}

- (FPDAccessControlStore)init
{
  if (accessControlBaseURL_onceToken != -1)
    dispatch_once(&accessControlBaseURL_onceToken, &__block_literal_global_73);
  return -[FPDAccessControlStore initWithDatabaseBaseURL:](self, "initWithDatabaseBaseURL:", accessControlBaseURL_url);
}

- (FPDAccessControlStore)initWithDatabaseBaseURL:(id)a3
{
  id v5;
  FPDAccessControlStore *v6;
  FPDAccessControlStore *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *syncQueue;
  uint64_t v11;
  PQLConnection *dbConnection;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v14;
  _QWORD block[4];
  FPDAccessControlStore *v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FPDAccessControlStore;
  v6 = -[FPDAccessControlStore init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseBaseURL, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("FPDAccessControlStore sync queue", v8);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    dbConnection = v7->_dbConnection;
    v7->_dbConnection = (PQLConnection *)v11;

    -[PQLConnection setLabel:](v7->_dbConnection, "setLabel:", CFSTR("access control"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)firstUnlockNotificationCallback_0, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v14 = v7->_syncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__FPDAccessControlStore_initWithDatabaseBaseURL___block_invoke;
    block[3] = &unk_1E8C75E48;
    v17 = v7;
    dispatch_sync(v14, block);

  }
  return v7;
}

uint64_t __49__FPDAccessControlStore_initWithDatabaseBaseURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openDatabase");
}

- (void)dealloc
{
  objc_super v3;

  -[PQLConnection close:](self->_dbConnection, "close:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FPDAccessControlStore;
  -[FPDAccessControlStore dealloc](&v3, sel_dealloc);
}

- (void)performWithDBConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[FPDAccessControlStore syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__FPDAccessControlStore_performWithDBConnection___block_invoke;
  block[3] = &unk_1E8C76C10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __49__FPDAccessControlStore_performWithDBConnection___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
}

- (void)reopenDatabaseAfterUnlock
{
  NSObject *v3;
  _QWORD block[5];

  -[FPDAccessControlStore syncQueue](self, "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FPDAccessControlStore_reopenDatabaseAfterUnlock__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __50__FPDAccessControlStore_reopenDatabaseAfterUnlock__block_invoke(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __50__FPDAccessControlStore_reopenDatabaseAfterUnlock__block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "openDatabase");
}

- (void)openDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] Opened access control database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)validateDatabase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  char v10;
  id v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "lastError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DE81E8]))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 11)
      {
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[FPDAccessControlStore validateDatabase:].cold.2();

        v27 = v6;
        v10 = objc_msgSend(v4, "destroyDatabaseWithError:", &v27);
        v11 = v27;

        if ((v10 & 1) == 0)
        {
          fp_current_or_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            -[FPDAccessControlStore validateDatabase:].cold.1(v11, v19);

          abort();
        }
        v5 = &unk_1E8C95E38;
        v6 = v11;
        goto LABEL_10;
      }
    }
    else
    {

    }
    v5 = 0;
LABEL_10:

  }
  v12 = objc_msgSend(v5, "unsignedIntegerValue");
  -[NSURL URLByAppendingPathExtension:](self->_databaseBaseURL, "URLByAppendingPathExtension:", CFSTR("plist"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = v12;
  if (v12 <= 3)
  {
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v24[3];
        *(_DWORD *)buf = 134218240;
        v29 = v16;
        v30 = 2048;
        v31 = v16 + 1;
        _os_log_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating from %lu to %lu", buf, 0x16u);
      }

      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __42__FPDAccessControlStore_validateDatabase___block_invoke;
      v20[3] = &unk_1E8C76F48;
      v22 = &v23;
      v21 = v13;
      v17 = objc_msgSend(v4, "performWithFlags:action:", 10, v20);

      if (!v17)
        break;
      v18 = v24[3] + 1;
      v24[3] = v18;
    }
    while (v18 < 4);
  }
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v4, "performWithFlags:action:", 0, &__block_literal_global_26);

}

uint64_t __42__FPDAccessControlStore_validateDatabase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v5 == 3)
  {
    objc_msgSend(v3, "execute:", CFSTR("DROP TABLE IF EXISTS bundle_ids"));
    objc_msgSend(v4, "execute:", CFSTR("DROP TABLE IF EXISTS vended_bookmarks"));
    objc_msgSend(v4, "execute:", CFSTR("DROP TABLE IF EXISTS acl"));
    if (!objc_msgSend(v4, "execute:", CFSTR("CREATE TABLE bundle_keys(key INTEGER PRIMARY KEY, identifier TEXT UNIQUE NOT NULL, symmetric_key BLOB NOT NULL)")))goto LABEL_7;
  }
  else if (!v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  }
  if ((objc_msgSend(v4, "setUserVersion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 1) & 1) != 0)
  {
    v7 = 1;
    goto LABEL_12;
  }
LABEL_7:
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __42__FPDAccessControlStore_validateDatabase___block_invoke_cold_2(v4);

  fp_simulate_crash();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    __42__FPDAccessControlStore_validateDatabase___block_invoke_cold_1();

  v7 = 0;
LABEL_12:

  return v7;
}

uint64_t __42__FPDAccessControlStore_validateDatabase___block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_msgSend(v2, "execute:", CFSTR("DROP TABLE IF EXISTS lru_signature"));
  v3 = objc_msgSend(v2, "execute:", CFSTR("CREATE TABLE lru_signature(signature BLOB UNIQUE NOT NULL)"));

  return v3;
}

- (id)keyForBundleIdentifier:(id)a3 generateIfNotFound:(BOOL)a4 keyGenBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__FPDAccessControlStore_keyForBundleIdentifier_generateIfNotFound_keyGenBlock___block_invoke;
  v14[3] = &unk_1E8C76FD8;
  v10 = v8;
  v15 = v10;
  v18 = a4;
  v11 = v9;
  v16 = v11;
  v17 = &v19;
  -[FPDAccessControlStore performWithDBConnection:](self, "performWithDBConnection:", v14);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __79__FPDAccessControlStore_keyForBundleIdentifier_generateIfNotFound_keyGenBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  char v10;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__FPDAccessControlStore_keyForBundleIdentifier_generateIfNotFound_keyGenBlock___block_invoke_2;
  v6[3] = &unk_1E8C76FB0;
  v7 = *(id *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "performWithFlags:action:", 16, v6);

}

uint64_t __79__FPDAccessControlStore_keyForBundleIdentifier_generateIfNotFound_keyGenBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT symmetric_key FROM bundle_keys WHERE identifier = %@"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v4, "next")
    && (objc_msgSend(v4, "dataAtIndex:", 0), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
    v8 = v5;

    v9 = 1;
  }
  else
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      v9 = 0;
      goto LABEL_8;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
    v8 = v10;

    v9 = objc_msgSend(v3, "execute:", CFSTR("INSERT INTO bundle_keys (identifier, symmetric_key) VALUES (%@, %@)"), *(_QWORD *)(a1 + 32), v8);
  }

LABEL_8:
  return v9;
}

- (id)bookmarkForItemID:(id)a3 consumerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  containingApplicationRecord(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (checkBundleRecord(v9, v7))
    {
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[FPDAccessControlStore bookmarkForItemID:consumerIdentifier:].cold.2((uint64_t)v6, v9, v10);

      objc_msgSend(v9, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "installSessionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDAccessControlStore swift_bookmarkForItemID:consumerIdentifier:installSessionIdentifier:](self, "swift_bookmarkForItemID:consumerIdentifier:installSessionIdentifier:", v6, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FPDAccessControlStore bookmarkForItemID:consumerIdentifier:].cold.1();

    -[FPDAccessControlStore swift_bookmarkForItemID:consumerIdentifier:installSessionIdentifier:](self, "swift_bookmarkForItemID:consumerIdentifier:installSessionIdentifier:", v6, v7, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)verifyBookmark:(id)a3 auditToken:(id *)a4 consumerIdentifier:(id)a5
{
  id v8;
  id v9;
  __int128 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _OWORD v19[2];

  v8 = a3;
  v9 = a5;
  v10 = *(_OWORD *)&a4->var0[4];
  v19[0] = *(_OWORD *)a4->var0;
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", v19, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  containingApplicationRecord(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (checkBundleRecord(v12, v9))
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[FPDAccessControlStore verifyBookmark:auditToken:consumerIdentifier:].cold.2(v12, v13);

      objc_msgSend(v12, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "installSessionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDAccessControlStore swift_verifyBookmark:consumerIdentifier:installSessionIdentifier:](self, "swift_verifyBookmark:consumerIdentifier:installSessionIdentifier:", v8, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[FPDAccessControlStore verifyBookmark:auditToken:consumerIdentifier:].cold.1();

    -[FPDAccessControlStore swift_verifyBookmark:consumerIdentifier:installSessionIdentifier:](self, "swift_verifyBookmark:consumerIdentifier:installSessionIdentifier:", v8, v9, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (BOOL)lookupLRUSignature:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__FPDAccessControlStore_lookupLRUSignature___block_invoke;
  v7[3] = &unk_1E8C77028;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[FPDAccessControlStore performWithDBConnection:](self, "performWithDBConnection:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __44__FPDAccessControlStore_lookupLRUSignature___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__FPDAccessControlStore_lookupLRUSignature___block_invoke_2;
  v6[3] = &unk_1E8C77000;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "performWithFlags:action:", 0, v6);

}

uint64_t __44__FPDAccessControlStore_lookupLRUSignature___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "fetch:", CFSTR("SELECT COUNT(*) FROM lru_signature WHERE signature = %@"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "next"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)objc_msgSend(v3, "intAtIndex:", 0) > 0;

  return 1;
}

- (void)addLRUSignature:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__FPDAccessControlStore_addLRUSignature___block_invoke;
  v6[3] = &unk_1E8C77078;
  v7 = v4;
  v5 = v4;
  -[FPDAccessControlStore performWithDBConnection:](self, "performWithDBConnection:", v6);

}

void __41__FPDAccessControlStore_addLRUSignature___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__FPDAccessControlStore_addLRUSignature___block_invoke_2;
  v3[3] = &unk_1E8C77050;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "performWithFlags:action:", 0, v3);

}

uint64_t __41__FPDAccessControlStore_addLRUSignature___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "execute:", CFSTR("INSERT OR IGNORE INTO lru_signature (signature) VALUES (%@)"), *(_QWORD *)(a1 + 32));
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_databaseBaseURL, 0);
  objc_storeStrong((id *)&self->_dbConnection, 0);
}

void __50__FPDAccessControlStore_reopenDatabaseAfterUnlock__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] Retrying opening access control database after first unlock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)validateDatabase:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] failed to destroy database after corruption: %@", v4, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

- (void)validateDatabase:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_5(&dword_1CF55F000, v0, v1, "[CRIT] acl database is corrupted, destroying it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __42__FPDAccessControlStore_validateDatabase___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_5(&dword_1CF55F000, v0, v1, "[SIMCRASH] Failed to migrate legacy database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __42__FPDAccessControlStore_validateDatabase___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] Failed to migrate legacy database; %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)bookmarkForItemID:consumerIdentifier:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v1, (uint64_t)v1, "[DEBUG] extending bookmark to %@ for %@", v2);
}

- (void)bookmarkForItemID:(NSObject *)a3 consumerIdentifier:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint8_t v9[14];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "installSessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v10 = v5;
  v11 = v7;
  v12 = v8;
  _os_log_debug_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] extending bookmark to %@ for %@ (%@)", v9, 0x20u);

}

- (void)verifyBookmark:auditToken:consumerIdentifier:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] verifying bookmark for %@", v1, 0xCu);
}

- (void)verifyBookmark:(void *)a1 auditToken:(NSObject *)a2 consumerIdentifier:.cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "installSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v9 = v6;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a2, v7, "[DEBUG] verifying bookmark for %@ (%@)", v8);

}

@end
