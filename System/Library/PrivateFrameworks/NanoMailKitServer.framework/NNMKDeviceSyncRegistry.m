@implementation NNMKDeviceSyncRegistry

- (NNMKDeviceSyncRegistry)initWithPath:(id)a3
{
  id v4;
  NNMKDeviceSyncRegistry *v5;
  NNMKSQLiteConnection *v6;
  NNMKSQLiteConnection *database;
  id *p_database;
  uint64_t v9;
  NSMutableDictionary *pendingComposedMessages;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NNMKSQLiteConnection *v22;
  void *v23;
  NNMKSQLiteConnection *v24;
  NNMKSQLiteConnection *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  unint64_t fullSyncVersion;
  unsigned int v34;
  objc_super v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NNMKDeviceSyncRegistry;
  v5 = -[NNMKDeviceSyncRegistry init](&v35, sel_init);
  if (!v5)
    goto LABEL_29;
  v34 = 0;
  v6 = -[NNMKSQLiteConnection initWithPath:errorCode:]([NNMKSQLiteConnection alloc], "initWithPath:errorCode:", v4, &v34);
  p_database = (id *)&v5->_database;
  database = v5->_database;
  v5->_database = v6;

  v9 = objc_opt_new();
  pendingComposedMessages = v5->_pendingComposedMessages;
  v5->_pendingComposedMessages = (NSMutableDictionary *)v9;

  v11 = +[NNMKSQLiteConnection errorCodeMeansCorruptedDatabase:](NNMKSQLiteConnection, "errorCodeMeansCorruptedDatabase:", v34);
  v12 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E161000, v12, OS_LOG_TYPE_DEFAULT, "Initializing database...", buf, 2u);
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry initWithPath:].cold.3();
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v4, 0);

  if (!v14)
  {
LABEL_15:
    v5->_recreatedFromScratch = 1;
    v22 = v5->_database;
    v5->_database = 0;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeItemAtPath:error:", v4, 0);

    v24 = -[NNMKSQLiteConnection initWithPath:errorCode:]([NNMKSQLiteConnection alloc], "initWithPath:errorCode:", v4, &v34);
    v25 = v5->_database;
    v5->_database = v24;

    if (+[NNMKSQLiteConnection errorCodeMeansCorruptedDatabase:](NNMKSQLiteConnection, "errorCodeMeansCorruptedDatabase:", v34)&& os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    {
      -[NNMKDeviceSyncRegistry initWithPath:].cold.2();
    }
    goto LABEL_18;
  }
  if (objc_msgSend(*p_database, "tableExists:inDatabase:", CFSTR("CONTROL"), 0))
  {
    -[NNMKDeviceSyncRegistry _loadAllControlValues](v5, "_loadAllControlValues");
    v15 = -[NNMKDeviceSyncRegistry currentDatabaseSchemaVersion](v5, "currentDatabaseSchemaVersion");
    v16 = (void *)qword_253E87A90;
    v17 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
    if (v15 != 36)
    {
      if (v17)
      {
        v20 = v16;
        v21 = -[NNMKDeviceSyncRegistry currentDatabaseSchemaVersion](v5, "currentDatabaseSchemaVersion");
        *(_DWORD *)buf = 134218240;
        v37 = v21;
        v38 = 2048;
        v39 = 36;
        _os_log_impl(&dword_22E161000, v20, OS_LOG_TYPE_DEFAULT, "Database from a previous version (%lu) already existed (Correct version should be %lu). Recreating...", buf, 0x16u);

      }
      goto LABEL_15;
    }
    if (v17)
    {
      v18 = v16;
      v19 = -[NNMKDeviceSyncRegistry currentDatabaseSchemaVersion](v5, "currentDatabaseSchemaVersion");
      *(_DWORD *)buf = 134218496;
      v37 = 36;
      v38 = 2048;
      v39 = v19;
      v40 = 2048;
      v41 = 1;
      _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "Database migration does not need to run. (Expected schema version: %lu, Current schema version: %lu, Path exist: %lu)", buf, 0x20u);

    }
  }
  v5->_recreatedFromScratch = 0;
LABEL_18:
  if ((objc_msgSend(*p_database, "tableExists:inDatabase:", CFSTR("CONTROL"), 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pathForResource:ofType:", CFSTR("DeviceSyncRegistryTables"), CFSTR("sql"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v27, 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NNMKSQLiteConnection executeSQL:](v5->_database, "executeSQL:", v28);
    v30 = qword_253E87A90;
    if (v29)
    {
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
        -[NNMKDeviceSyncRegistry initWithPath:].cold.1((uint64_t)&v5->_database, v30);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E161000, v30, OS_LOG_TYPE_DEFAULT, "Database tables created.", buf, 2u);
      }
      -[NNMKDeviceSyncRegistry setCurrentDatabaseSchemaVersion:](v5, "setCurrentDatabaseSchemaVersion:", 36);
      v31 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        fullSyncVersion = v5->_fullSyncVersion;
        *(_DWORD *)buf = 134217984;
        v37 = fullSyncVersion;
        _os_log_impl(&dword_22E161000, v31, OS_LOG_TYPE_DEFAULT, "Restoring full sync version. %lu", buf, 0xCu);
      }
      -[NNMKDeviceSyncRegistry setFullSyncVersion:](v5, "setFullSyncVersion:", v5->_fullSyncVersion);
    }

  }
  -[NNMKDeviceSyncRegistry _loadAllControlValues](v5, "_loadAllControlValues");
LABEL_29:

  return v5;
}

- (void)setFullSyncVersion:(unint64_t)a3
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = MEMORY[0x24BDAC760];
  self->_fullSyncVersion = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __45__NNMKDeviceSyncRegistry_setFullSyncVersion___block_invoke;
  v4[3] = &__block_descriptor_40_e26_v20__0__sqlite3_stmt__8i16l;
  v4[4] = a3;
  -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:](self, "_setControlValueForKey:withBlockForBinding:", CFSTR("kFullMessagesSyncVersionKey"), v4);
}

uint64_t __45__NNMKDeviceSyncRegistry_setFullSyncVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (void)setSupportsWebKit:(id)a3
{
  NSNumber *v4;
  uint64_t v5;
  NSNumber *v6;
  _QWORD v7[4];
  NSNumber *v8;

  v4 = (NSNumber *)a3;
  v5 = MEMORY[0x24BDAC760];
  self->_supportsWebKit = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __44__NNMKDeviceSyncRegistry_setSupportsWebKit___block_invoke;
  v7[3] = &unk_24F9F6628;
  v8 = v4;
  v6 = v4;
  -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:](self, "_setControlValueForKey:withBlockForBinding:", CFSTR("kSupportsWebKitKey"), v7);

}

uint64_t __44__NNMKDeviceSyncRegistry_setSupportsWebKit___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  v5 = *(void **)(a1 + 32);
  if (v5)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;
  return +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", v6, a2, a3);
}

- (void)setCurrentDatabaseSchemaVersion:(unint64_t)a3
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = MEMORY[0x24BDAC760];
  self->_currentDatabaseSchemaVersion = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __58__NNMKDeviceSyncRegistry_setCurrentDatabaseSchemaVersion___block_invoke;
  v4[3] = &__block_descriptor_40_e26_v20__0__sqlite3_stmt__8i16l;
  v4[4] = a3;
  -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:](self, "_setControlValueForKey:withBlockForBinding:", CFSTR("DBSchemaVersion"), v4);
}

uint64_t __58__NNMKDeviceSyncRegistry_setCurrentDatabaseSchemaVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (void)setIsMessagesSyncSuspendedByConnectivity:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  v3 = MEMORY[0x24BDAC760];
  self->_isMessagesSyncSuspendedByConnectivity = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __67__NNMKDeviceSyncRegistry_setIsMessagesSyncSuspendedByConnectivity___block_invoke;
  v4[3] = &__block_descriptor_33_e26_v20__0__sqlite3_stmt__8i16l;
  v5 = a3;
  -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:](self, "_setControlValueForKey:withBlockForBinding:", CFSTR("kIsMessagesSyncSuspendedByConnectivity"), v4);
}

uint64_t __67__NNMKDeviceSyncRegistry_setIsMessagesSyncSuspendedByConnectivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", *(unsigned __int8 *)(a1 + 32), a2, a3);
}

- (void)setOrganizeByThread:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  v3 = MEMORY[0x24BDAC760];
  self->_organizeByThread = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __46__NNMKDeviceSyncRegistry_setOrganizeByThread___block_invoke;
  v4[3] = &__block_descriptor_33_e26_v20__0__sqlite3_stmt__8i16l;
  v5 = a3;
  -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:](self, "_setControlValueForKey:withBlockForBinding:", CFSTR("kOrganizeByThreadKey"), v4);
}

uint64_t __46__NNMKDeviceSyncRegistry_setOrganizeByThread___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", *(unsigned __int8 *)(a1 + 32), a2, a3);
}

- (void)setDeviceScreenWidth:(double)a3
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = MEMORY[0x24BDAC760];
  self->_deviceScreenWidth = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __47__NNMKDeviceSyncRegistry_setDeviceScreenWidth___block_invoke;
  v4[3] = &__block_descriptor_40_e26_v20__0__sqlite3_stmt__8i16l;
  *(double *)&v4[4] = a3;
  -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:](self, "_setControlValueForKey:withBlockForBinding:", CFSTR("kDeviceScreenWidthKey"), v4);
}

uint64_t __47__NNMKDeviceSyncRegistry_setDeviceScreenWidth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindDouble:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindDouble:intoStatement:paramIndex:", a2, a3, *(double *)(a1 + 32));
}

- (void)setDeviceScreenScale:(double)a3
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = MEMORY[0x24BDAC760];
  self->_deviceScreenScale = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __47__NNMKDeviceSyncRegistry_setDeviceScreenScale___block_invoke;
  v4[3] = &__block_descriptor_40_e26_v20__0__sqlite3_stmt__8i16l;
  *(double *)&v4[4] = a3;
  -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:](self, "_setControlValueForKey:withBlockForBinding:", CFSTR("kDeviceScreenScaleKey"), v4);
}

uint64_t __47__NNMKDeviceSyncRegistry_setDeviceScreenScale___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindDouble:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindDouble:intoStatement:paramIndex:", a2, a3, *(double *)(a1 + 32));
}

- (void)setProtectedContentChannelSupported:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  v3 = MEMORY[0x24BDAC760];
  self->_protectedContentChannelSupported = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __62__NNMKDeviceSyncRegistry_setProtectedContentChannelSupported___block_invoke;
  v4[3] = &__block_descriptor_33_e26_v20__0__sqlite3_stmt__8i16l;
  v5 = a3;
  -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:](self, "_setControlValueForKey:withBlockForBinding:", CFSTR("kProtectedContentChannelSupportedKey"), v4);
}

uint64_t __62__NNMKDeviceSyncRegistry_setProtectedContentChannelSupported___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", *(unsigned __int8 *)(a1 + 32), a2, a3);
}

- (void)setDisconnectedSince:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  objc_storeStrong((id *)&self->_disconnectedSince, a3);
  if (v5)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__NNMKDeviceSyncRegistry_setDisconnectedSince___block_invoke;
    v6[3] = &unk_24F9F6628;
    v7 = v5;
    -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:](self, "_setControlValueForKey:withBlockForBinding:", CFSTR("kDisconnectedSinceKey"), v6);

  }
  else
  {
    -[NNMKDeviceSyncRegistry _removeControlValueForKey:](self, "_removeControlValueForKey:", CFSTR("kDisconnectedSinceKey"));
  }

}

uint64_t __47__NNMKDeviceSyncRegistry_setDisconnectedSince___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindDate:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindDate:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (void)beginUpdates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "Trying to start a transaction, but a transaction has already been started.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)endUpdates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "Trying to commit a transaction, but a transaction has not been started.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)cleanUpForFullSyncWithMailbox:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  NNMKDeviceSyncRegistry *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__NNMKDeviceSyncRegistry_cleanUpForFullSyncWithMailbox___block_invoke;
  v6[3] = &unk_24F9F6298;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[NNMKDeviceSyncRegistry _insureTransactionFor:](self, "_insureTransactionFor:", v6);

}

void __56__NNMKDeviceSyncRegistry_cleanUpForFullSyncWithMailbox___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setSyncActive:", 0);
  objc_msgSend(*(id *)(a1 + 40), "updateSyncActiveForMailbox:", *(_QWORD *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mailboxId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deleteAllObjectsFromTable:mailboxId:", CFSTR("SYNCED_MESSAGE"), v3);

  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mailboxId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_deleteAllObjectsFromTable:mailboxId:", CFSTR("DELETED_MESSAGE"), v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_deleteAllObjectsFromTable:mailboxId:", CFSTR("ATTACHMENT_NOT_SYNCED"), v7);

  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mailboxId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "incrementSyncVersionForMailboxId:", v9);

  v10 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v13 = v10;
    objc_msgSend(v12, "mailboxId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "syncVersionForMailboxId:", v14);
    objc_msgSend(*(id *)(a1 + 32), "mailboxId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134218242;
    v18 = v15;
    v19 = 2114;
    v20 = v16;
    _os_log_impl(&dword_22E161000, v13, OS_LOG_TYPE_DEFAULT, "Incrementing #mailbox-sync-version. %lu, %{public}@", (uint8_t *)&v17, 0x16u);

  }
}

- (void)incrementSyncVersionForMailboxId:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NNMKDeviceSyncRegistry syncVersionForMailboxId:](self, "syncVersionForMailboxId:", v4);
  v6 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = v5;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Incrementing #mailbox-sync-version. Current #mailbox-sync-version:%lu, mailbox: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  -[NNMKDeviceSyncRegistry updateSyncVersion:forMailboxId:](self, "updateSyncVersion:forMailboxId:", v5 + 1, v4);

}

- (void)cleanUpForInitialSync
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __47__NNMKDeviceSyncRegistry_cleanUpForInitialSync__block_invoke;
  v2[3] = &unk_24F9F6270;
  v2[4] = self;
  -[NNMKDeviceSyncRegistry _insureTransactionFor:](self, "_insureTransactionFor:", v2);
}

void __47__NNMKDeviceSyncRegistry_cleanUpForInitialSync__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 40);
  v4 = *(double *)(v2 + 48);
  v5 = *(unsigned __int8 *)(v2 + 10);
  v6 = *(void **)(v2 + 56);
  v7 = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v8 = *(_QWORD **)(a1 + 32);
  v9 = v8[3];
  v10 = v6;
  objc_msgSend(v8, "_deleteAllObjectsFromTable:", CFSTR("SYNCED_ACCOUNT"));
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllObjectsFromTable:", CFSTR("MAILBOX"));
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllObjectsFromTable:", CFSTR("MAILBOX_SYNC_VERSION"));
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllObjectsFromTable:", CFSTR("CONTROL"));
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllObjectsFromTable:", CFSTR("SYNCED_MESSAGE"));
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllObjectsFromTable:", CFSTR("DELETED_MESSAGE"));
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllObjectsFromTable:", CFSTR("ATTACHMENT_NOT_SYNCED"));
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllObjectsFromTable:", CFSTR("IDS_IDENTIFIER_NOT_YET_ACKD"));
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllObjectsFromTable:", CFSTR("IDS_IDENTIFIER_OBJECT"));
  objc_msgSend(*(id *)(a1 + 32), "setFullSyncVersion:", v9 + 1);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentDatabaseSchemaVersion:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setDeviceScreenScale:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setDeviceScreenWidth:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setProtectedContentChannelSupported:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setDisconnectedSince:", v10);

}

- (BOOL)containsSyncedMessageForMessageWithId:(id)a3
{
  NNMKSQLiteConnection *database;
  NNMKSQLiteConnection **p_database;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT 1 FROM SYNCED_MESSAGE WHERE ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6);
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v7))
  {
    v8 = (_DWORD)v7 == 100;
  }
  else
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry containsSyncedMessageForMessageWithId:].cold.1((uint64_t)p_database, v9);
    v8 = 0;
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
  return v8;
}

- (id)syncedMessageForMessageWithId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__NNMKDeviceSyncRegistry_syncedMessageForMessageWithId___block_invoke;
  v9[3] = &unk_24F9F6670;
  v10 = v4;
  v5 = v4;
  -[NNMKDeviceSyncRegistry _selectSyncedMessagesWhere:blockForBinding:](self, "_selectSyncedMessagesWhere:blockForBinding:", CFSTR("ID = ?"), v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __56__NNMKDeviceSyncRegistry_syncedMessageForMessageWithId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, 1);
}

- (void)addOrUpdateSyncedMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke;
  v6[3] = &unk_24F9F6298;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NNMKDeviceSyncRegistry _insureTransactionFor:](self, "_insureTransactionFor:", v6);

}

void __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[4];
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "preparedStatementForPattern:", CFSTR("INSERT OR REPLACE INTO SYNCED_MESSAGE (ID, STATUS, STATUS_VERSION, DATE_RECEIVED, USED_PROTECTED_CHANNEL, USED_NOTIFICATION_PRIORITY, CONTENT_SYNCED, CONTENT_SYNCED_NOTIFICATION_PRIORITY, CONTENT_SYNCED_BECAUSE_USER_REQUESTED, CONTENT_REQUESTED_BY_USER, CONVERSATION_ID, RESEND_REQUESTED, RESEND_INTERVAL, CONTENT_RESEND_INTERVAL, MAILBOX_ID, THREAD_SPECIFIC, SPECIAL_MAILBOX_SPECIFIC, SANITIZED_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"));
  objc_msgSend(v2[1], "messageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v4, v3, 1);

  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", objc_msgSend(v2[1], "status"), v3, 2);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", objc_msgSend(v2[1], "statusVersion"), v3, 3);
  objc_msgSend(v2[1], "dateReceived");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindDate:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindDate:intoStatement:paramIndex:", v5, v3, 4);

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v2[1], "usedProtectedChannelForMessageSync"), v3, 5);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v2[1], "usedNotificationPriorityForMessageSync"), v3, 6);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v2[1], "contentSynced"), v3, 7);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v2[1], "contentSyncedUsingNotificationPriority"), v3, 8);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v2[1], "contentSyncedBecauseUserRequested"), v3, 9);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v2[1], "contentRequestedByUser"), v3, 10);
  objc_msgSend(v2[1], "conversationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v6, v3, 11);

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v2[1], "resendRequested"), v3, 12);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", objc_msgSend(v2[1], "resendInterval"), v3, 13);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", objc_msgSend(v2[1], "contentResendInterval"), v3, 14);
  objc_msgSend(v2[1], "mailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v7, v3, 15);

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v2[1], "isThreadSpecific"), v3, 16);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", objc_msgSend(v2[1], "isSpecialMailboxSpecific"), v3, 17);
  objc_msgSend(v2[1], "sanitizedMessageId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v8, v3, 18);

  v23 = (uint64_t)v2;
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", objc_msgSend(*((id *)*v2 + 9), "stepPreparedStatement:", v3)))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_3((uint64_t)v2, v9);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v3);
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "preparedStatementForPattern:", CFSTR("DELETE FROM ATTACHMENT_NOT_SYNCED WHERE MESSAGE_ID = ?"));
  objc_msgSend(*(id *)(a1 + 40), "messageId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v11, v10, 1);

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "stepPreparedStatement:", v10)))
  {
    v12 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_2((uint64_t)v2, v12);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v10);
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "preparedStatementForPattern:", CFSTR("INSERT INTO ATTACHMENT_NOT_SYNCED (MESSAGE_ID, CONTENT_ID, MAILBOX_ID) VALUES (?, ?, ?)"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "attachmentsContentIdsNotYetSynced");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    v22 = &v29;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18);
        objc_msgSend(*(id *)(a1 + 40), "messageId", v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v20, v13, 1);

        +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v19, v13, 2);
        +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v19, v13, 3);
        if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "stepPreparedStatement:", v13)))
        {
          v21 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
            __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_1(v28, v23, v21, v22);
        }
        +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v13);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v16);
  }

}

- (void)removeSyncedMessageForMessageWithId:(id)a3
{
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  id v5;
  uint64_t v6;
  void *v7;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("DELETE FROM SYNCED_MESSAGE WHERE ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6)))
  {
    v7 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry removeSyncedMessageForMessageWithId:].cold.1((uint64_t)p_database, v7);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
}

- (id)syncedMessagesForConversationWithId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__NNMKDeviceSyncRegistry_syncedMessagesForConversationWithId___block_invoke;
  v8[3] = &unk_24F9F6670;
  v9 = v4;
  v5 = v4;
  -[NNMKDeviceSyncRegistry _selectSyncedMessagesWhere:blockForBinding:](self, "_selectSyncedMessagesWhere:blockForBinding:", CFSTR("CONVERSATION_ID = ?"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __62__NNMKDeviceSyncRegistry_syncedMessagesForConversationWithId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, 1);
}

- (id)syncedMessageIdsResendRequested
{
  return -[NNMKDeviceSyncRegistry _selectSyncedMessagesIdsWhere:count:blockForBinding:](self, "_selectSyncedMessagesIdsWhere:count:blockForBinding:", CFSTR("RESEND_REQUESTED = ?"), 0, &__block_literal_global_3);
}

uint64_t __57__NNMKDeviceSyncRegistry_syncedMessageIdsResendRequested__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", 1, a2, 1);
}

- (id)syncedMessageIdsContentRequestedByUser
{
  return -[NNMKDeviceSyncRegistry _selectSyncedMessagesIdsWhere:count:blockForBinding:](self, "_selectSyncedMessagesIdsWhere:count:blockForBinding:", CFSTR("CONTENT_REQUESTED_BY_USER = ?"), 0, &__block_literal_global_68);
}

uint64_t __64__NNMKDeviceSyncRegistry_syncedMessageIdsContentRequestedByUser__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", 1, a2, 1);
}

- (id)firstSyncedMessageIdsContentNotSyncedOrRequestedByUser:(unint64_t)a3
{
  return -[NNMKDeviceSyncRegistry _selectSyncedMessagesIdsWhere:count:blockForBinding:](self, "_selectSyncedMessagesIdsWhere:count:blockForBinding:", CFSTR("((CONTENT_SYNCED = ?) OR ((SELECT COUNT(1) FROM ATTACHMENT_NOT_SYNCED WHERE MESSAGE_ID = ID) > 0)) AND (CONTENT_REQUESTED_BY_USER = ?)"), a3, &__block_literal_global_71);
}

uint64_t __81__NNMKDeviceSyncRegistry_firstSyncedMessageIdsContentNotSyncedOrRequestedByUser___block_invoke(uint64_t a1, uint64_t a2)
{
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", 0, a2, 1);
  return +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", 1, a2, 2);
}

- (id)oldestDateReceivedForMailboxId:(id)a3
{
  NNMKSQLiteConnection *database;
  NNMKSQLiteConnection **p_database;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT MIN(DATE_RECEIVED) FROM SYNCED_MESSAGE WHERE THREAD_SPECIFIC = 0 AND SPECIAL_MAILBOX_SPECIFIC = 0 AND MAILBOX_ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v7))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry oldestDateReceivedForMailboxId:].cold.1((uint64_t)p_database, v9);
    goto LABEL_6;
  }
  if ((_DWORD)v7 != 100)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  +[NNMKSQLiteUtils dateFromStatement:columnIndex:](NNMKSQLiteUtils, "dateFromStatement:columnIndex:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
  return v8;
}

- (unint64_t)syncedMessagesCount
{
  return -[NNMKDeviceSyncRegistry syncedMessagesCountForMailboxId:](self, "syncedMessagesCountForMailboxId:", 0);
}

- (unint64_t)syncedMessagesCountForMailboxId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v9;
  NNMKSQLiteConnection *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("SELECT COUNT(ID) FROM SYNCED_MESSAGE "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "appendString:", CFSTR("WHERE MAILBOX_ID = ? "));
    database = self->_database;
    p_database = &self->_database;
    v9 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", v6);
    +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v4, v9, 1);
  }
  else
  {
    v10 = self->_database;
    p_database = &self->_database;
    v9 = -[NNMKSQLiteConnection preparedStatementForPattern:](v10, "preparedStatementForPattern:", v5);
  }
  v11 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v9);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v11))
  {
    v13 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry syncedMessagesCountForMailboxId:].cold.1((uint64_t)p_database, v13);
    goto LABEL_9;
  }
  if ((_DWORD)v11 != 100)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v12 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v9, 0);
LABEL_10:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v9);

  return v12;
}

- (id)messageIdForSanitizedMessageId:(id)a3
{
  NNMKSQLiteConnection *database;
  NNMKSQLiteConnection **p_database;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT ID FROM SYNCED_MESSAGE WHERE SANITIZED_ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v7))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry messageIdForSanitizedMessageId:].cold.1((uint64_t)p_database, v9);
    goto LABEL_6;
  }
  if ((_DWORD)v7 != 100)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
  return v8;
}

- (void)removeSyncedMessagesBeforeDateReceived:(id)a3 mailbox:(id)a4
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
  v10[2] = __73__NNMKDeviceSyncRegistry_removeSyncedMessagesBeforeDateReceived_mailbox___block_invoke;
  v10[3] = &unk_24F9F6718;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NNMKDeviceSyncRegistry _insureTransactionFor:](self, "_insureTransactionFor:", v10);

}

uint64_t __73__NNMKDeviceSyncRegistry_removeSyncedMessagesBeforeDateReceived_mailbox___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1 + 32;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "preparedStatementForPattern:", CFSTR("DELETE FROM SYNCED_MESSAGE WHERE DATE_RECEIVED < ? AND MAILBOX_ID = ?"));
  +[NNMKSQLiteUtils bindDate:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindDate:intoStatement:paramIndex:", *(_QWORD *)(v1 + 8), v2, 1);
  objc_msgSend(*(id *)(v1 + 16), "mailboxId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v3, v2, 2);

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", objc_msgSend(*(id *)(*(_QWORD *)v1 + 72), "stepPreparedStatement:", v2)))
  {
    v4 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __73__NNMKDeviceSyncRegistry_removeSyncedMessagesBeforeDateReceived_mailbox___block_invoke_cold_1(v1, v4);
  }
  return +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v2);
}

- (id)syncedMessagesKeyedByMessageIdAfterDateReceived:(id)a3 mailboxId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __84__NNMKDeviceSyncRegistry_syncedMessagesKeyedByMessageIdAfterDateReceived_mailboxId___block_invoke;
    v26[3] = &unk_24F9F6740;
    v9 = &v27;
    v27 = v7;
    v28 = v6;
    -[NNMKDeviceSyncRegistry _selectSyncedMessagesWhere:blockForBinding:](self, "_selectSyncedMessagesWhere:blockForBinding:", CFSTR("MAILBOX_ID = ? AND DATE_RECEIVED >= ?"), v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __84__NNMKDeviceSyncRegistry_syncedMessagesKeyedByMessageIdAfterDateReceived_mailboxId___block_invoke_2;
    v24[3] = &unk_24F9F6670;
    v9 = &v25;
    v25 = v7;
    -[NNMKDeviceSyncRegistry _selectSyncedMessagesWhere:blockForBinding:](self, "_selectSyncedMessagesWhere:blockForBinding:", CFSTR("MAILBOX_ID = ? AND ID IS NOT NULL"), v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v17, "messageId", (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v14);
  }

  return v11;
}

uint64_t __84__NNMKDeviceSyncRegistry_syncedMessagesKeyedByMessageIdAfterDateReceived_mailboxId___block_invoke(uint64_t a1, uint64_t a2)
{
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, 1);
  return +[NNMKSQLiteUtils bindDate:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindDate:intoStatement:paramIndex:", *(_QWORD *)(a1 + 40), a2, 2);
}

uint64_t __84__NNMKDeviceSyncRegistry_syncedMessagesKeyedByMessageIdAfterDateReceived_mailboxId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, 1);
}

- (id)allSyncedAccountsKeyedByAccountId
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[NNMKDeviceSyncRegistry _selectSyncedAccountsWhere:blockForBinding:](self, "_selectSyncedAccountsWhere:blockForBinding:", 0, &__block_literal_global_87);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
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
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "accountId", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)syncedAccountForAccountWithId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__NNMKDeviceSyncRegistry_syncedAccountForAccountWithId___block_invoke;
  v9[3] = &unk_24F9F6670;
  v10 = v4;
  v5 = v4;
  -[NNMKDeviceSyncRegistry _selectSyncedAccountsWhere:blockForBinding:](self, "_selectSyncedAccountsWhere:blockForBinding:", CFSTR("ID = ?"), v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __56__NNMKDeviceSyncRegistry_syncedAccountForAccountWithId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, 1);
}

- (void)addOrUpdateSyncedAccount:(id)a3
{
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  id v5;
  uint64_t v6;
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

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("INSERT OR REPLACE INTO SYNCED_ACCOUNT (ID, DISPLAY_NAME, SHOULD_ARCHIVE, EMAIL_ADDRESSES, DEFAULT_ADDRESS, RESEND_REQUESTED, RESEND_INTERVAL, SOURCE_TYPE, USERNAME, LOCAL_ID, TYPE_IDENTIFIER, EMAIL_ADDRESS_TOKEN, PCC_EMAIL_ADDRESS) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"));
  objc_msgSend(v5, "accountId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v7, v6, 1);

  objc_msgSend(v5, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v8, v6, 2);

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v5, "shouldArchive"), v6, 3);
  objc_msgSend(v5, "emailAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v10, v6, 4);

  objc_msgSend(v5, "defaultEmailAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v11, v6, 5);

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v5, "resendRequested"), v6, 6);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", objc_msgSend(v5, "resendInterval"), v6, 7);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", objc_msgSend(v5, "sourceType"), v6, 8);
  objc_msgSend(v5, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v12, v6, 9);

  objc_msgSend(v5, "localId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v13, v6, 10);

  objc_msgSend(v5, "typeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v14, v6, 11);

  objc_msgSend(v5, "emailAddressToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v15, v6, 12);

  objc_msgSend(v5, "pccEmailAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v16, v6, 13);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6)))
  {
    v17 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry addOrUpdateSyncedAccount:].cold.1((uint64_t)p_database, v17);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
}

- (void)removeSyncedAccountForAccountWithId:(id)a3
{
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  id v5;
  uint64_t v6;
  void *v7;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("DELETE FROM SYNCED_ACCOUNT WHERE ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6)))
  {
    v7 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry removeSyncedAccountForAccountWithId:].cold.1((uint64_t)p_database, v7);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
}

- (id)syncedAccountIdsResendRequested
{
  NNMKSQLiteConnection **p_database;
  sqlite3_stmt *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  p_database = &self->_database;
  v3 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:", CFSTR("SELECT ID FROM SYNCED_ACCOUNT WHERE RESEND_REQUESTED = ?"));
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", 1, v3, 1);
  v4 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v4))
  {
    if ((_DWORD)v4 == 100)
    {
      do
      {
        +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v3, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend(v5, "addObject:", v6);
        v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v3);

      }
      while (v7 == 100);
    }
  }
  else
  {
    v8 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry syncedAccountIdsResendRequested].cold.1((uint64_t)p_database, v8);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v3);
  return v5;
}

- (unint64_t)accountSourceTypeForMessageId:(id)a3
{
  id v4;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v11;
  unint64_t v12;

  v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  v7 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT A.SOURCE_TYPE FROM SYNCED_MESSAGE SM LEFT OUTER JOIN  MAILBOX M ON SM.MAILBOX_ID = M.ID LEFT OUTER JOIN SYNCED_ACCOUNT A ON A.ID = M.ACCOUNT_ID  WHERE SM.ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v4, v7, 1);
  v8 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v7);
  v9 = +[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v8);
  if ((_DWORD)v8 != 100 || !v9)
  {
    v11 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry accountSourceTypeForMessageId:].cold.1((uint64_t)p_database, v11);
    v12 = 0;
  }
  else
  {
    v12 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v7, 0);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v7);

  return v12;
}

- (unint64_t)accountSourceTypeForMailboxId:(id)a3
{
  id v4;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v11;
  unint64_t v12;

  v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  v7 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT A.SOURCE_TYPE FROM MAILBOX M LEFT OUTER JOIN SYNCED_ACCOUNT A ON A.ID = M.ACCOUNT_ID  WHERE M.ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v4, v7, 1);
  v8 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v7);
  v9 = +[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v8);
  if ((_DWORD)v8 != 100 || !v9)
  {
    v11 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry accountSourceTypeForMailboxId:].cold.1((uint64_t)p_database, v11);
    v12 = 0;
  }
  else
  {
    v12 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v7, 0);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v7);

  return v12;
}

- (unint64_t)accountSourceTypeForAccountId:(id)a3
{
  id v4;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v11;
  unint64_t v12;

  v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  v7 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT SOURCE_TYPE FROM SYNCED_ACCOUNT WHERE ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v4, v7, 1);
  v8 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v7);
  v9 = +[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v8);
  if ((_DWORD)v8 != 100 || !v9)
  {
    v11 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry accountSourceTypeForAccountId:].cold.1((uint64_t)p_database, v11);
    v12 = 0;
  }
  else
  {
    v12 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v7, 0);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v7);

  return v12;
}

- (id)accountIdForUsername:(id)a3
{
  NNMKSQLiteConnection *database;
  NNMKSQLiteConnection **p_database;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v10;
  void *v11;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT ID FROM SYNCED_ACCOUNT WHERE USERNAME = ? COLLATE NOCASE"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6);
  v8 = +[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v7);
  if ((_DWORD)v7 != 100 || !v8)
  {
    v10 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry accountIdForUsername:].cold.1((uint64_t)p_database, v10);
    v11 = 0;
  }
  else
  {
    +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
  return v11;
}

- (void)updateSourceType:(unint64_t)a3 forAccountId:(id)a4
{
  id v6;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v9;
  int v10;
  void *v11;

  v6 = a4;
  database = self->_database;
  p_database = &self->_database;
  v9 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("UPDATE SYNCED_ACCOUNT SET SOURCE_TYPE = ? WHERE ID = ?"));
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", a3, v9, 1);
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v6, v9, 2);
  v10 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v9);
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v9);
  v11 = (void *)qword_253E87A90;
  if (v10 == 101)
  {
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
      -[NNMKDeviceSyncRegistry updateSourceType:forAccountId:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
  {
    -[NNMKDeviceSyncRegistry updateSourceType:forAccountId:].cold.2((uint64_t)p_database, v11);
  }

}

- (void)addOrUpdateMailbox:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "mailboxId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_FAULT))
        -[NNMKDeviceSyncRegistry addOrUpdateMailbox:].cold.4(v8);
    }
    database = self->_database;
    p_database = &self->_database;
    v11 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("INSERT OR REPLACE INTO MAILBOX (ID, TYPE, FILTER_TYPE, CUSTOM_NAME, URL, SYNC_ACTIVE, ACCOUNT_ID, SYNC_ENABLED, SYNC_REQUESTED, ACCOUNT_LOCAL_ID, SYNC_REQUESTED_DATE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"));
    objc_msgSend(v4, "mailboxId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v12, v11, 1);

    +[NNMKSQLiteUtils bindInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindInteger:intoStatement:paramIndex:", objc_msgSend(v4, "type"), v11, 2);
    +[NNMKSQLiteUtils bindInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindInteger:intoStatement:paramIndex:", objc_msgSend(v4, "filterType"), v11, 3);
    objc_msgSend(v4, "customName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v13, v11, 4);

    objc_msgSend(v4, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v15, v11, 5);

    +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v4, "syncActive"), v11, 6);
    objc_msgSend(v4, "accountId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v16, v11, 7);

    +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v4, "syncEnabled"), v11, 8);
    +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", objc_msgSend(v4, "syncRequested"), v11, 9);
    objc_msgSend(v4, "accountLocalId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v17, v11, 10);

    objc_msgSend(v4, "syncRequestedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[NNMKSQLiteUtils bindDate:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindDate:intoStatement:paramIndex:", v18, v11, 11);

    v19 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v11);
    +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v11);
    v20 = (void *)qword_253E87A90;
    if (v19 == 101)
    {
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
        -[NNMKDeviceSyncRegistry addOrUpdateMailbox:].cold.2(v20);
    }
    else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    {
      -[NNMKDeviceSyncRegistry addOrUpdateMailbox:].cold.3((uint64_t)p_database, v20);
    }
  }
  else
  {
    v21 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry addOrUpdateMailbox:].cold.1(v21);
  }

}

- (id)mailboxes
{
  return -[NNMKDeviceSyncRegistry _selectMailboxesWhere:blockForBinding:](self, "_selectMailboxesWhere:blockForBinding:", 0, &__block_literal_global_109);
}

- (id)syncEnabledMailboxes
{
  return -[NNMKDeviceSyncRegistry _selectMailboxesWhere:blockForBinding:](self, "_selectMailboxesWhere:blockForBinding:", CFSTR("SYNC_ENABLED = 1"), &__block_literal_global_112);
}

- (id)activeMailboxes
{
  return -[NNMKDeviceSyncRegistry _selectMailboxesWhere:blockForBinding:](self, "_selectMailboxesWhere:blockForBinding:", CFSTR("SYNC_ENABLED = 1 AND SYNC_ACTIVE = 1"), &__block_literal_global_115);
}

- (void)deleteMailboxWithId:(id)a3
{
  -[NNMKDeviceSyncRegistry deleteMailboxWithId:startTransaction:](self, "deleteMailboxWithId:startTransaction:", a3, 1);
}

- (void)deleteMailboxWithId:(id)a3 startTransaction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NNMKSQLiteConnection **p_database;
  sqlite3_stmt *v8;
  int v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  if (v4)
    -[NNMKSQLiteConnection beginTransaction](self->_database, "beginTransaction");
  p_database = &self->_database;
  v8 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:", CFSTR("DELETE FROM MAILBOX WHERE ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v6, v8, 1);
  v9 = -[NNMKSQLiteConnection stepPreparedStatement:](self->_database, "stepPreparedStatement:", v8);
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v8);
  -[NNMKDeviceSyncRegistry _deleteAllObjectsFromTable:mailboxId:](self, "_deleteAllObjectsFromTable:mailboxId:", CFSTR("SYNCED_MESSAGE"), v6);
  -[NNMKDeviceSyncRegistry _deleteAllObjectsFromTable:mailboxId:](self, "_deleteAllObjectsFromTable:mailboxId:", CFSTR("DELETED_MESSAGE"), v6);
  -[NNMKDeviceSyncRegistry _deleteAllObjectsFromTable:mailboxId:](self, "_deleteAllObjectsFromTable:mailboxId:", CFSTR("ATTACHMENT_NOT_SYNCED"), v6);
  if (v9 != 101)
  {
    v10 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    {
      -[NNMKDeviceSyncRegistry deleteMailboxWithId:startTransaction:].cold.2((uint64_t)p_database, v10);
      if (!v4)
        goto LABEL_11;
    }
    else if (!v4)
    {
      goto LABEL_11;
    }
    -[NNMKSQLiteConnection rollbackTransaction](*p_database, "rollbackTransaction");
    goto LABEL_11;
  }
  if (v4)
    -[NNMKSQLiteConnection commitTransaction](*p_database, "commitTransaction");
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
    -[NNMKDeviceSyncRegistry deleteMailboxWithId:startTransaction:].cold.1();
LABEL_11:

}

- (void)resetSyncRequestedFromMailboxes
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error reseting sync requested flag for mailboxes. %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (id)mailboxWithId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__NNMKDeviceSyncRegistry_mailboxWithId___block_invoke;
  v9[3] = &unk_24F9F6670;
  v10 = v4;
  v5 = v4;
  -[NNMKDeviceSyncRegistry _selectMailboxesWhere:blockForBinding:](self, "_selectMailboxesWhere:blockForBinding:", CFSTR("ID = ?"), v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __40__NNMKDeviceSyncRegistry_mailboxWithId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, 1);
}

- (id)mailboxesForAccountId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__NNMKDeviceSyncRegistry_mailboxesForAccountId___block_invoke;
  v8[3] = &unk_24F9F6670;
  v9 = v4;
  v5 = v4;
  -[NNMKDeviceSyncRegistry _selectMailboxesWhere:blockForBinding:](self, "_selectMailboxesWhere:blockForBinding:", CFSTR("ACCOUNT_ID = ?"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __48__NNMKDeviceSyncRegistry_mailboxesForAccountId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", *(_QWORD *)(a1 + 32), a2, 1);
}

- (unint64_t)syncVersionForMailboxId:(id)a3
{
  NNMKSQLiteConnection *database;
  NNMKSQLiteConnection **p_database;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT SYNC_VERSION FROM MAILBOX_SYNC_VERSION WHERE MAILBOX_ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v7))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry syncVersionForMailboxId:].cold.1((uint64_t)p_database, v9);
    goto LABEL_6;
  }
  if ((_DWORD)v7 != 100)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v6, 0);
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
  return v8;
}

- (void)updateSyncVersion:(unint64_t)a3 forMailboxId:(id)a4
{
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  id v7;
  uint64_t v8;
  void *v9;

  p_database = &self->_database;
  database = self->_database;
  v7 = a4;
  v8 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("INSERT OR REPLACE INTO MAILBOX_SYNC_VERSION (MAILBOX_ID, SYNC_VERSION) VALUES (?, ?)"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v7, v8, 1);

  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", a3, v8, 2);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v8)))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry updateSyncVersion:forMailboxId:].cold.1((uint64_t)p_database, v9);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v8);
}

- (void)insertDeletedMessageId:(id)a3 mailboxId:(id)a4
{
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  p_database = &self->_database;
  database = self->_database;
  v7 = a4;
  v8 = a3;
  v9 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("INSERT OR REPLACE INTO DELETED_MESSAGE (MESSAGE_ID, MAILBOX_ID) VALUES (?, ?)"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v8, v9, 1);

  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v7, v9, 2);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v9)))
  {
    v10 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry insertDeletedMessageId:mailboxId:].cold.1((uint64_t)p_database, v10);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v9);
}

- (id)mailboxIdForDeletedMessageId:(id)a3
{
  NNMKSQLiteConnection *database;
  NNMKSQLiteConnection **p_database;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT MAILBOX_ID FROM DELETED_MESSAGE WHERE MESSAGE_ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v7))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry mailboxIdForDeletedMessageId:].cold.1((uint64_t)p_database, v9);
    goto LABEL_6;
  }
  if ((_DWORD)v7 != 100)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
  return v8;
}

- (void)deleteAllMailboxes
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error deleting all mailboxes (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)updateSyncEnabledForMailbox:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "mailboxId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKDeviceSyncRegistry mailboxWithId:](self, "mailboxWithId:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "syncEnabled");
  objc_msgSend(v7, "setSyncEnabled:", v6);
  -[NNMKDeviceSyncRegistry addOrUpdateMailbox:](self, "addOrUpdateMailbox:", v7);

}

- (void)updateSyncActiveForMailbox:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "syncActive");
    objc_msgSend(v4, "mailboxId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Updating mailbox sync active: %lu (Mailbox: %{public}@)", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v4, "mailboxId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKDeviceSyncRegistry mailboxWithId:](self, "mailboxWithId:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSyncActive:", objc_msgSend(v4, "syncActive"));
  -[NNMKDeviceSyncRegistry addOrUpdateMailbox:](self, "addOrUpdateMailbox:", v10);

}

- (void)updateSyncRequestedForMailbox:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "syncRequested");
    objc_msgSend(v4, "mailboxId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218242;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Updating mailbox sync requested: %lu (Mailbox: %{public}@)", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(v4, "mailboxId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKDeviceSyncRegistry mailboxWithId:](self, "mailboxWithId:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v4, "syncRequested");
  if ((_DWORD)v9 != objc_msgSend(v10, "syncRequested"))
  {
    objc_msgSend(v10, "setSyncRequested:", objc_msgSend(v4, "syncRequested"));
    if ((objc_msgSend(v4, "syncRequested") & 1) != 0)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCE60]);
      objc_msgSend(v10, "setSyncRequestedDate:", v11);

    }
    else
    {
      objc_msgSend(v10, "setSyncRequestedDate:", 0);
    }
    -[NNMKDeviceSyncRegistry addOrUpdateMailbox:](self, "addOrUpdateMailbox:", v10);
  }

}

- (id)_selectMailboxesWhere:(id)a3 blockForBinding:(id)a4
{
  id v6;
  void (**v7)(id, sqlite3_stmt *);
  void *v8;
  const __CFString *v9;
  void *v10;
  NNMKSQLiteConnection **p_database;
  sqlite3_stmt *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  void *v20;
  __CFString *v22;
  void *v23;
  uint8_t buf;
  _BYTE v25[15];

  v6 = a3;
  v7 = (void (**)(id, sqlite3_stmt *))a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WHERE %@"), v6);
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_24F9F9D80;
  }
  v22 = (__CFString *)v9;
  v23 = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT ID, TYPE, FILTER_TYPE, CUSTOM_NAME, URL, SYNC_ACTIVE, ACCOUNT_ID, SYNC_ENABLED, SYNC_REQUESTED, ACCOUNT_LOCAL_ID, SYNC_REQUESTED_DATE FROM MAILBOX M %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  p_database = &self->_database;
  v12 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:", v10);
  v7[2](v7, v12);
  v13 = -[NNMKSQLiteConnection stepPreparedStatement:](self->_database, "stepPreparedStatement:", v12);
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v13))
  {
    if ((_DWORD)v13 == 100)
    {
      do
      {
        -[NNMKDeviceSyncRegistry _mailboxFromCurrentRowInStatement:](self, "_mailboxFromCurrentRowInStatement:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14
          && (objc_msgSend(v14, "mailboxId"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "length"),
              v16,
              v17))
        {
          objc_msgSend(v8, "addObject:", v15);
        }
        else
        {
          v18 = qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
            -[NNMKDeviceSyncRegistry _selectMailboxesWhere:blockForBinding:].cold.1(&buf, v25, v18);
        }
        v19 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v12);

      }
      while (v19 == 100);
    }
  }
  else
  {
    v20 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _selectMailboxesWhere:blockForBinding:].cold.2((uint64_t)v6, (uint64_t)p_database, v20);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v12);

  return v8;
}

- (id)_mailboxFromCurrentRowInStatement:(sqlite3_stmt *)a3
{
  NNMKMailbox *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init(NNMKMailbox);
  +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setMailboxId:](v4, "setMailboxId:", v5);

  -[NNMKMailbox setType:](v4, "setType:", +[NNMKSQLiteUtils integerFromStatement:columnIndex:](NNMKSQLiteUtils, "integerFromStatement:columnIndex:", a3, 1));
  -[NNMKMailbox setFilterType:](v4, "setFilterType:", +[NNMKSQLiteUtils integerFromStatement:columnIndex:](NNMKSQLiteUtils, "integerFromStatement:columnIndex:", a3, 2));
  +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", a3, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setCustomName:](v4, "setCustomName:", v6);

  v7 = (void *)MEMORY[0x24BDBCF48];
  +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", a3, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setUrl:](v4, "setUrl:", v9);

  -[NNMKMailbox setSyncActive:](v4, "setSyncActive:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", a3, 5));
  +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", a3, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setAccountId:](v4, "setAccountId:", v10);

  -[NNMKMailbox setSyncEnabled:](v4, "setSyncEnabled:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", a3, 7));
  -[NNMKMailbox setSyncRequested:](v4, "setSyncRequested:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", a3, 8));
  +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", a3, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setAccountLocalId:](v4, "setAccountLocalId:", v11);

  +[NNMKSQLiteUtils dateFromStatement:columnIndex:](NNMKSQLiteUtils, "dateFromStatement:columnIndex:", a3, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setSyncRequestedDate:](v4, "setSyncRequestedDate:", v12);

  return v4;
}

- (void)setProgress:(int64_t)a3 forComposedMessageWithId:(id)a4
{
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  id v7;
  uint64_t v8;
  void *v9;

  p_database = &self->_database;
  database = self->_database;
  v7 = a4;
  v8 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("INSERT OR REPLACE INTO COMPOSED_MESSAGE (ID, PROGRESS) VALUES (?, ?)"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v7, v8, 1);

  +[NNMKSQLiteUtils bindInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindInteger:intoStatement:paramIndex:", a3, v8, 2);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v8)))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry setProgress:forComposedMessageWithId:].cold.1((uint64_t)p_database, v9);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v8);
}

- (int64_t)progressForComposedMessageWithId:(id)a3
{
  NNMKSQLiteConnection *database;
  NNMKSQLiteConnection **p_database;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT PROGRESS FROM COMPOSED_MESSAGE WHERE ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v7))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry progressForComposedMessageWithId:].cold.1((uint64_t)p_database, v9);
    goto LABEL_6;
  }
  if ((_DWORD)v7 != 100)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = +[NNMKSQLiteUtils integerFromStatement:columnIndex:](NNMKSQLiteUtils, "integerFromStatement:columnIndex:", v6, 0);
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
  return v8;
}

- (id)pendingComposedMessageIds
{
  NNMKSQLiteConnection **p_database;
  sqlite3_stmt *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  p_database = &self->_database;
  v3 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:", CFSTR("SELECT ID FROM COMPOSED_MESSAGE"));
  v4 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v4))
  {
    if ((_DWORD)v4 == 100)
    {
      do
      {
        +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v3, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend(v5, "addObject:", v6);
        v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v3);

      }
      while (v7 == 100);
    }
  }
  else
  {
    v8 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry pendingComposedMessageIds].cold.1((uint64_t)p_database, v8);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v3);
  return v5;
}

- (void)removePendingComposedMessages
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error deleting all composed messages (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)removeProgressForComposedMessageWithId:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  void *v6;

  v4 = a3;
  v5 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:", CFSTR("DELETE FROM COMPOSED_MESSAGE WHERE ID = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v4, v5, 1);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](self->_database, "stepPreparedStatement:", v5)))
  {
    v6 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry removeProgressForComposedMessageWithId:].cold.1((uint64_t)&self->_database, v6);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v5);
  -[NNMKDeviceSyncRegistry _removeAttachmentsForComposedMessageId:](self, "_removeAttachmentsForComposedMessageId:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_pendingComposedMessages, "removeObjectForKey:", v4);

}

- (id)attachmentsForComposedMessageId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v17;

  v4 = a3;
  -[NNMKDeviceSyncRegistry _attachmentDirectory](self, "_attachmentDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nnmk_sanitizedFileNameString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:", v7);
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD1620];
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v8, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;

    if (!v13 || v14)
    {
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
        -[NNMKDeviceSyncRegistry attachmentsForComposedMessageId:].cold.1();
      v15 = 0;
    }
    else
    {
      v15 = v13;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)attachmentsFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  id v14;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:", v3);
  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v8, v4, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v12 = v9;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry attachmentsFromURL:].cold.1();
    v12 = 0;
  }

  return v12;
}

- (void)storePendingComposedMessage:(id)a3
{
  NSMutableDictionary *pendingComposedMessages;
  id v4;
  id v5;

  pendingComposedMessages = self->_pendingComposedMessages;
  v4 = a3;
  objc_msgSend(v4, "composedMessageId");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](pendingComposedMessages, "setObject:forKeyedSubscript:", v4, v5);

}

- (id)pendingComposedMessageWithId:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingComposedMessages, "objectForKeyedSubscript:", a3);
}

- (void)saveAttachmentsForComposedMessageId:(id)a3 temporaryURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[NNMKDeviceSyncRegistry _urlForAttachmentsWithComposedMessageId:](self, "_urlForAttachmentsWithComposedMessageId:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v9, "moveItemAtURL:toURL:error:", v7, v8, &v11);

  v10 = v11;
  if (v10 && os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    -[NNMKDeviceSyncRegistry saveAttachmentsForComposedMessageId:temporaryURL:].cold.1();

}

- (void)_removeAttachmentsForComposedMessageId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  -[NNMKDeviceSyncRegistry _urlForAttachmentsWithComposedMessageId:](self, "_urlForAttachmentsWithComposedMessageId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v9, "removeItemAtURL:error:", v5, &v11);
    v10 = v11;

    if (v10 && os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _removeAttachmentsForComposedMessageId:].cold.1();

  }
}

- (void)_removeAllPendingAttachments
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_22E161000, v0, OS_LOG_TYPE_ERROR, "Unable to delete all pending attachments. Error: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_15();
}

- (id)_urlForAttachmentsWithComposedMessageId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NNMKDeviceSyncRegistry _attachmentDirectory](self, "_attachmentDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nnmk_sanitizedFileNameString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_attachmentDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingStorePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v3, 1);
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("NanoMail/ComposedMessage"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addObjectIds:(id)a3 type:(id)a4 resendInterval:(unint64_t)a5 forIDSIdentifierNotYetAckd:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __86__NNMKDeviceSyncRegistry_addObjectIds_type_resendInterval_forIDSIdentifierNotYetAckd___block_invoke;
  v16[3] = &unk_24F9F67E8;
  v16[4] = self;
  v17 = v12;
  v19 = v10;
  v20 = a5;
  v18 = v11;
  v13 = v10;
  v14 = v11;
  v15 = v12;
  -[NNMKDeviceSyncRegistry _insureTransactionFor:](self, "_insureTransactionFor:", v16);

}

void __86__NNMKDeviceSyncRegistry_addObjectIds_type_resendInterval_forIDSIdentifierNotYetAckd___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "preparedStatementForPattern:", CFSTR("INSERT INTO IDS_IDENTIFIER_NOT_YET_ACKD (IDS_IDENTIFIER, TYPE, DATE_TO_RESEND, RESEND_INTERVAL) VALUES (?, ?, NULL, ?)"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v2[1], v3, 1);
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v2[2], v3, 2);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", v2[4], v3, 3);
  v4 = objc_msgSend(*(id *)(*v2 + 72), "stepPreparedStatement:", v3);
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v3);
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v4))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(id *)(a1 + 56);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "preparedStatementForPattern:", CFSTR("INSERT INTO IDS_IDENTIFIER_OBJECT (IDS_IDENTIFIER, OBJECT_ID) VALUES (?, ?)"), (_QWORD)v14);
          +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", *(_QWORD *)(a1 + 40), v11, 1);
          +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v10, v11, 2);
          v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "stepPreparedStatement:", v11);
          +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v11);
          if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v12))
          {

            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  else
  {
LABEL_12:
    v13 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __86__NNMKDeviceSyncRegistry_addObjectIds_type_resendInterval_forIDSIdentifierNotYetAckd___block_invoke_cold_1((uint64_t)v2, v13);
  }
}

- (id)objectIdsForIDSIdentifierNotYetAckd:(id)a3 type:(id *)a4 resendInterval:(unint64_t *)a5
{
  id v7;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;

  v7 = a3;
  database = self->_database;
  p_database = &self->_database;
  v10 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT O.OBJECT_ID, I.TYPE, I.RESEND_INTERVAL FROM IDS_IDENTIFIER_NOT_YET_ACKD I INNER JOIN IDS_IDENTIFIER_OBJECT O ON O.IDS_IDENTIFIER == I.IDS_IDENTIFIER WHERE I.IDS_IDENTIFIER = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v7, v10, 1);
  v11 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v11))
  {
    v17 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry objectIdsForIDSIdentifierNotYetAckd:type:resendInterval:].cold.1((uint64_t)p_database, v17);
    goto LABEL_10;
  }
  if ((_DWORD)v11 != 100)
  {
LABEL_10:
    v14 = 0;
    v13 = 0;
    goto LABEL_11;
  }
  v13 = 0;
  v14 = 0;
  do
  {
    +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v10, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v10, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v10, 2);
    }
    objc_msgSend(v12, "addObject:", v15);
    v16 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v10);

  }
  while (v16 == 100);
LABEL_11:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v10);
  if (a4)
    *a4 = objc_retainAutorelease(v13);
  if (a5)
    *a5 = v14;

  return v12;
}

- (id)objectIdsForType:(id)a3
{
  id v4;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  v7 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT O.OBJECT_ID FROM IDS_IDENTIFIER_NOT_YET_ACKD I INNER JOIN IDS_IDENTIFIER_OBJECT O ON O.IDS_IDENTIFIER == I.IDS_IDENTIFIER WHERE I.TYPE = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v4, v7, 1);
  v8 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v7);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v8))
  {
    if ((_DWORD)v8 == 100)
    {
      do
      {
        +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v7, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);
        v11 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v7);

      }
      while (v11 == 100);
    }
  }
  else
  {
    v12 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry objectIdsForType:].cold.1((uint64_t)v4, (uint64_t)p_database, v12);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v7);

  return v9;
}

- (id)typeForIDSIdentifierNotYetAckd:(id)a3
{
  NNMKSQLiteConnection *database;
  NNMKSQLiteConnection **p_database;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  p_database = &self->_database;
  database = self->_database;
  v5 = a3;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT TYPE FROM IDS_IDENTIFIER_NOT_YET_ACKD WHERE IDS_IDENTIFIER = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v6, 1);

  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6)))
  {
    +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry typeForIDSIdentifierNotYetAckd:].cold.1((uint64_t)p_database, v8);
    v7 = 0;
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
  return v7;
}

- (void)markIDSIdentifierAsAckd:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke;
  v6[3] = &unk_24F9F6298;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NNMKDeviceSyncRegistry _insureTransactionFor:](self, "_insureTransactionFor:", v6);

}

uint64_t __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = a1 + 32;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "preparedStatementForPattern:", CFSTR("DELETE FROM IDS_IDENTIFIER_NOT_YET_ACKD WHERE IDS_IDENTIFIER = ?"));
  v5 = *(_QWORD *)(a1 + 40);
  v4 = (_QWORD *)(a1 + 40);
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v5, v3, 1);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", objc_msgSend(*(id *)(*(_QWORD *)v2 + 72), "stepPreparedStatement:", v3)))
  {
    v6 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke_cold_2((uint64_t)v4, v2, v6);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v3);
  v7 = objc_msgSend(*(id *)(*(_QWORD *)v2 + 72), "preparedStatementForPattern:", CFSTR("DELETE FROM IDS_IDENTIFIER_OBJECT WHERE IDS_IDENTIFIER = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", *v4, v7, 1);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", objc_msgSend(*(id *)(*(_QWORD *)v2 + 72), "stepPreparedStatement:", v7)))
  {
    v8 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke_cold_1((uint64_t)v4, v2, v8);
  }
  return +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v7);
}

- (void)rescheduleIDSIdentifier:(id)a3 resendInterval:(unint64_t)a4 withDateToResend:(id)a5 errorCode:(int64_t)a6
{
  id v10;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v10 = a3;
  database = self->_database;
  p_database = &self->_database;
  v13 = a5;
  v14 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("UPDATE IDS_IDENTIFIER_NOT_YET_ACKD SET RESEND_INTERVAL = ?, DATE_TO_RESEND = ?, ERROR_CODE = ? WHERE IDS_IDENTIFIER = ?"));
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", a4, v14, 1);
  +[NNMKSQLiteUtils bindDate:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindDate:intoStatement:paramIndex:", v13, v14, 2);

  +[NNMKSQLiteUtils bindInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindInteger:intoStatement:paramIndex:", a6, v14, 3);
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v10, v14, 4);
  v15 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v14);
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v14);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v15))
  {
    v16 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry rescheduleIDSIdentifier:resendInterval:withDateToResend:errorCode:].cold.1((uint64_t)v10, (uint64_t)p_database, v16);
  }

}

- (void)prepareIDSIdentifiersForResendForErrorCode:(int64_t)a3
{
  NNMKSQLiteConnection **p_database;
  sqlite3_stmt *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  p_database = &self->_database;
  v5 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:", CFSTR("UPDATE IDS_IDENTIFIER_NOT_YET_ACKD SET DATE_TO_RESEND = ?, RESEND_INTERVAL = ?, ERROR_CODE = ? WHERE ERROR_CODE = ?"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKSQLiteUtils bindDate:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindDate:intoStatement:paramIndex:", v6, v5, 1);

  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", 0, v5, 2);
  +[NNMKSQLiteUtils bindInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindInteger:intoStatement:paramIndex:", 0, v5, 3);
  +[NNMKSQLiteUtils bindInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindInteger:intoStatement:paramIndex:", a3, v5, 4);
  v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v5);
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v5);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v7))
  {
    v8 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry prepareIDSIdentifiersForResendForErrorCode:].cold.1((uint64_t)p_database, v8);
  }
}

- (id)datesForIDSIdentifiersScheduledToBeResent
{
  void *v3;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  p_database = &self->_database;
  v6 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("SELECT IDS_IDENTIFIER, DATE_TO_RESEND FROM IDS_IDENTIFIER_NOT_YET_ACKD WHERE DATE_TO_RESEND IS NOT NULL"));
  v7 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6);
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v7))
  {
    if ((_DWORD)v7 == 100)
    {
      do
      {
        +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v6, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[NNMKSQLiteUtils dateFromStatement:columnIndex:](NNMKSQLiteUtils, "dateFromStatement:columnIndex:", v6, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v8);
        v10 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v6);

      }
      while (v10 == 100);
    }
  }
  else
  {
    v11 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry datesForIDSIdentifiersScheduledToBeResent].cold.1((uint64_t)p_database, v11);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v6);
  return v3;
}

- (void)deleteObjectId:(id)a3 fromIDSIdentifiersNotYetAckdOfType:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  sqlite3_stmt *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  NNMKSQLiteConnection *database;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NNMKDeviceSyncRegistry _idsIdentifiersForObjectId:type:](self, "_idsIdentifiersForObjectId:type:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v21;
    *(_QWORD *)&v9 = 138543618;
    v17 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:", CFSTR("DELETE FROM IDS_IDENTIFIER_OBJECT WHERE OBJECT_ID = ? AND IDS_IDENTIFIER = ?"), v17);
        +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v6, v14, 1);
        +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v13, v14, 2);
        if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](self->_database, "stepPreparedStatement:", v14)))
        {
          v15 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
          {
            database = self->_database;
            v16 = v15;
            -[NNMKSQLiteConnection lastErrorMessage](database, "lastErrorMessage");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v25 = v6;
            v26 = 2114;
            v27 = v19;
            _os_log_error_impl(&dword_22E161000, v16, OS_LOG_TYPE_ERROR, "Error deleting Object Id from IDS Identifiers (Object Id: %{public}@ - Error: %{public}@).", buf, 0x16u);

          }
        }
        +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v10);
  }

}

- (id)_idsIdentifiersForObjectId:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  database = self->_database;
  p_database = &self->_database;
  v10 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("select I.IDS_IDENTIFIER FROM IDS_IDENTIFIER_NOT_YET_ACKD I INNER JOIN IDS_IDENTIFIER_OBJECT O ON O.IDS_IDENTIFIER == I.IDS_IDENTIFIER WHERE O.OBJECT_ID = ? AND TYPE = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v6, v10, 1);
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v7, v10, 2);
  v11 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v11))
  {
    if ((_DWORD)v11 == 100)
    {
      do
      {
        +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v10, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);
        v14 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v10);

      }
      while (v14 == 100);
    }
  }
  else
  {
    v15 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _idsIdentifiersForObjectId:type:].cold.1((uint64_t)p_database, v15);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v10);

  return v12;
}

- (void)_loadAllControlValues
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error loading control values (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_setControlValueForKey:(id)a3 withBlockForBinding:(id)a4
{
  id v6;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  void (**v9)(id, uint64_t, uint64_t);
  uint64_t v10;
  void *v11;

  v6 = a3;
  database = self->_database;
  p_database = &self->_database;
  v9 = (void (**)(id, uint64_t, uint64_t))a4;
  v10 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("INSERT OR REPLACE INTO CONTROL (KEY, VALUE) VALUES (?, ?)"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v6, v10, 1);
  v9[2](v9, v10, 2);

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v10)))
  {
    v11 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:].cold.1((uint64_t)v6, (uint64_t)p_database, v11);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v10);

}

- (void)_removeControlValueForKey:(id)a3
{
  id v4;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v7;
  void *v8;

  v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  v7 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", CFSTR("DELETE FROM CONTROL WHERE KEY = ?"));
  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v4, v7, 1);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v7)))
  {
    v8 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _removeControlValueForKey:].cold.1((uint64_t)v4, (uint64_t)p_database, v8);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v7);

}

- (void)_deleteAllObjectsFromTable:(id)a3
{
  id v4;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", v7);

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v8)))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _deleteAllObjectsFromTable:].cold.1((uint64_t)v4, (uint64_t)p_database, v9);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v8);

}

- (void)_deleteAllObjectsFromTable:(id)a3 mailboxId:(id)a4
{
  id v6;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  database = self->_database;
  p_database = &self->_database;
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = a4;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE MAILBOX_ID = ?"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", v11);

  +[NNMKSQLiteUtils bindString:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindString:intoStatement:paramIndex:", v10, v12, 1);
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v12)))
  {
    v13 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _deleteAllObjectsFromTable:].cold.1((uint64_t)v6, (uint64_t)p_database, v13);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v12);

}

- (id)_selectSyncedMessagesWhere:(id)a3 blockForBinding:(id)a4
{
  id v6;
  void (**v7)(id, sqlite3_stmt *);
  NNMKSQLiteConnection **p_database;
  sqlite3_stmt *v9;
  uint64_t v10;
  void *v11;
  NNMKSyncedMessage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v24;

  v6 = a3;
  v7 = (void (**)(id, sqlite3_stmt *))a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT ID, STATUS, STATUS_VERSION, DATE_RECEIVED, USED_PROTECTED_CHANNEL, USED_NOTIFICATION_PRIORITY, CONTENT_SYNCED, CONTENT_SYNCED_NOTIFICATION_PRIORITY, CONTENT_SYNCED_BECAUSE_USER_REQUESTED, CONTENT_REQUESTED_BY_USER, (SELECT group_concat(T.CONTENT_ID, \"\n\") FROM ATTACHMENT_NOT_SYNCED T WHERE T.MESSAGE_ID == ID GROUP BY T.MESSAGE_ID) AS ATTACHMENTS_NOT_SYNCED, CONVERSATION_ID, RESEND_REQUESTED, RESEND_INTERVAL, CONTENT_RESEND_INTERVAL, MAILBOX_ID, THREAD_SPECIFIC, SPECIAL_MAILBOX_SPECIFIC, SANITIZED_ID FROM SYNCED_MESSAGE WHERE %@ ORDER BY DATE_RECEIVED DESC"), v6);
  p_database = &self->_database;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:");
  v7[2](v7, v9);
  v10 = -[NNMKSQLiteConnection stepPreparedStatement:](self->_database, "stepPreparedStatement:", v9);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v10))
  {
    if ((_DWORD)v10 == 100)
    {
      do
      {
        v12 = objc_alloc_init(NNMKSyncedMessage);
        +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v9, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncedMessage setMessageId:](v12, "setMessageId:", v13);

        -[NNMKSyncedMessage messageId](v12, "messageId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[NNMKSyncedMessage setStatus:](v12, "setStatus:", +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v9, 1));
          -[NNMKSyncedMessage setStatusVersion:](v12, "setStatusVersion:", +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v9, 2));
          +[NNMKSQLiteUtils dateFromStatement:columnIndex:](NNMKSQLiteUtils, "dateFromStatement:columnIndex:", v9, 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedMessage setDateReceived:](v12, "setDateReceived:", v15);

          -[NNMKSyncedMessage setUsedProtectedChannelForMessageSync:](v12, "setUsedProtectedChannelForMessageSync:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v9, 4));
          -[NNMKSyncedMessage setUsedNotificationPriorityForMessageSync:](v12, "setUsedNotificationPriorityForMessageSync:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v9, 5));
          -[NNMKSyncedMessage setContentSynced:](v12, "setContentSynced:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v9, 6));
          -[NNMKSyncedMessage setContentSyncedUsingNotificationPriority:](v12, "setContentSyncedUsingNotificationPriority:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v9, 7));
          -[NNMKSyncedMessage setContentSyncedBecauseUserRequested:](v12, "setContentSyncedBecauseUserRequested:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v9, 8));
          -[NNMKSyncedMessage setContentRequestedByUser:](v12, "setContentRequestedByUser:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v9, 9));
          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v9, 10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKDeviceSyncRegistry _ungroupGroupedValue:](self, "_ungroupGroupedValue:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedMessage setAttachmentsContentIdsNotYetSynced:](v12, "setAttachmentsContentIdsNotYetSynced:", v17);

          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v9, 11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedMessage setConversationId:](v12, "setConversationId:", v18);

          -[NNMKSyncedMessage setResendRequested:](v12, "setResendRequested:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v9, 12));
          -[NNMKSyncedMessage setResendInterval:](v12, "setResendInterval:", +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v9, 13));
          -[NNMKSyncedMessage setContentResendInterval:](v12, "setContentResendInterval:", +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v9, 14));
          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v9, 15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedMessage setMailboxId:](v12, "setMailboxId:", v19);

          -[NNMKSyncedMessage setIsThreadSpecific:](v12, "setIsThreadSpecific:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v9, 16));
          -[NNMKSyncedMessage setIsSpecialMailboxSpecific:](v12, "setIsSpecialMailboxSpecific:", +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v9, 17));
          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v9, 18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedMessage setSanitizedMessageId:](v12, "setSanitizedMessageId:", v20);

          objc_msgSend(v11, "addObject:", v12);
        }
        v21 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v9);

      }
      while (v21 == 100);
    }
  }
  else
  {
    v22 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _selectSyncedMessagesWhere:blockForBinding:].cold.1((uint64_t)v6, (uint64_t)p_database, v22);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v9);

  return v11;
}

- (id)_selectSyncedMessagesIdsWhere:(id)a3 count:(unint64_t)a4 blockForBinding:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  uint64_t v12;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT ID FROM SYNCED_MESSAGE WHERE %@ ORDER BY DATE_RECEIVED DESC"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4)
  {
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(" LIMIT %lu"), a4);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  database = self->_database;
  p_database = &self->_database;
  v15 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:", v11);
  v9[2](v9, v15);
  v16 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v15);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v16))
  {
    if ((_DWORD)v16 == 100)
    {
      do
      {
        +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v15, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v17, "addObject:", v18);
        v19 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v15);

      }
      while (v19 == 100);
    }
  }
  else
  {
    v20 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _selectSyncedMessagesIdsWhere:count:blockForBinding:].cold.1((uint64_t)v8, (uint64_t)p_database, v20);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v15);

  return v17;
}

- (id)_selectSyncedAccountsWhere:(id)a3 blockForBinding:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  const __CFString *v8;
  uint64_t v9;
  NNMKSQLiteConnection **p_database;
  NNMKSQLiteConnection *database;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NNMKSyncedAccount *v15;
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
  int v27;
  void *v28;
  void *v30;
  __CFString *v31;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WHERE %@"), v6);
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_24F9F9D80;
  }
  v31 = (__CFString *)v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT ID, DISPLAY_NAME, SHOULD_ARCHIVE, EMAIL_ADDRESSES, DEFAULT_ADDRESS, RESEND_REQUESTED, RESEND_INTERVAL, SOURCE_TYPE, USERNAME, LOCAL_ID, TYPE_IDENTIFIER, EMAIL_ADDRESS_TOKEN, PCC_EMAIL_ADDRESS FROM SYNCED_ACCOUNT %@"), v8);
  v9 = objc_claimAutoreleasedReturnValue();
  database = self->_database;
  p_database = &self->_database;
  v30 = (void *)v9;
  v12 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:");
  v7[2](v7, v12);
  v13 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v12);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v13))
  {
    if ((_DWORD)v13 == 100)
    {
      do
      {
        v15 = objc_alloc_init(NNMKSyncedAccount);
        +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v12, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKSyncedAccount setAccountId:](v15, "setAccountId:", v16);

        -[NNMKSyncedAccount accountId](v15, "accountId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v12, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedAccount setDisplayName:](v15, "setDisplayName:", v18);

          -[NNMKSyncedAccount setShouldArchive:](v15, "setShouldArchive:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v12, 2));
          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v12, 3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("\n"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedAccount setEmailAddresses:](v15, "setEmailAddresses:", v20);

          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v12, 4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedAccount setDefaultEmailAddress:](v15, "setDefaultEmailAddress:", v21);

          -[NNMKSyncedAccount setResendRequested:](v15, "setResendRequested:", +[NNMKSQLiteUtils BOOLFromStatement:columnIndex:](NNMKSQLiteUtils, "BOOLFromStatement:columnIndex:", v12, 5));
          -[NNMKSyncedAccount setResendInterval:](v15, "setResendInterval:", +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v12, 6));
          -[NNMKSyncedAccount setSourceType:](v15, "setSourceType:", +[NNMKSQLiteUtils unsignedIntegerFromStatement:columnIndex:](NNMKSQLiteUtils, "unsignedIntegerFromStatement:columnIndex:", v12, 7));
          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v12, 8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedAccount setUsername:](v15, "setUsername:", v22);

          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v12, 9);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedAccount setLocalId:](v15, "setLocalId:", v23);

          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v12, 10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedAccount setTypeIdentifier:](v15, "setTypeIdentifier:", v24);

          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v12, 11);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedAccount setEmailAddressToken:](v15, "setEmailAddressToken:", v25);

          +[NNMKSQLiteUtils stringFromStatement:columnIndex:](NNMKSQLiteUtils, "stringFromStatement:columnIndex:", v12, 12);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncedAccount setPccEmailAddress:](v15, "setPccEmailAddress:", v26);

          objc_msgSend(v14, "addObject:", v15);
        }
        v27 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v12);

      }
      while (v27 == 100);
    }
  }
  else
  {
    v28 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry _selectSyncedAccountsWhere:blockForBinding:].cold.1((uint64_t)v31, (uint64_t)p_database, v28);
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v12);

  return v14;
}

- (id)_ungroupGroupedValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_insureTransactionFor:(id)a3
{
  _BOOL4 v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  if (-[NNMKSQLiteConnection isInTransaction](self->_database, "isInTransaction"))
  {
    v5[2]();
  }
  else
  {
    v4 = -[NNMKSQLiteConnection beginTransaction](self->_database, "beginTransaction");
    v5[2]();
    if (v4)
      -[NNMKSQLiteConnection commitTransaction](self->_database, "commitTransaction");
  }

}

- (BOOL)hasMailboxSyncedActive
{
  NNMKSQLiteConnection **p_database;
  sqlite3_stmt *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;

  p_database = &self->_database;
  v3 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:", CFSTR("SELECT 1 FROM MAILBOX WHERE SYNC_ACTIVE = 1"));
  v4 = -[NNMKSQLiteConnection stepPreparedStatement:](*p_database, "stepPreparedStatement:", v3);
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", v4))
  {
    v5 = (_DWORD)v4 == 100;
  }
  else
  {
    v6 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKDeviceSyncRegistry hasMailboxSyncedActive].cold.1((uint64_t)p_database, v6);
    v5 = 0;
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:](NNMKSQLiteUtils, "closeExecutedPreparedStatement:", v3);
  return v5;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSNumber)supportsWebKit
{
  return self->_supportsWebKit;
}

- (BOOL)isMessagesSyncSuspendedByConnectivity
{
  return self->_isMessagesSyncSuspendedByConnectivity;
}

- (BOOL)organizeByThread
{
  return self->_organizeByThread;
}

- (double)deviceScreenWidth
{
  return self->_deviceScreenWidth;
}

- (double)deviceScreenScale
{
  return self->_deviceScreenScale;
}

- (BOOL)protectedContentChannelSupported
{
  return self->_protectedContentChannelSupported;
}

- (NSDate)disconnectedSince
{
  return self->_disconnectedSince;
}

- (unint64_t)currentDatabaseSchemaVersion
{
  return self->_currentDatabaseSchemaVersion;
}

- (BOOL)recreatedFromScratch
{
  return self->_recreatedFromScratch;
}

- (NNMKSQLiteConnection)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (NSMutableDictionary)pendingComposedMessages
{
  return self->_pendingComposedMessages;
}

- (void)setPendingComposedMessages:(id)a3
{
  objc_storeStrong((id *)&self->_pendingComposedMessages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingComposedMessages, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_disconnectedSince, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithPath:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error creating database. (%{public}@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)initWithPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "After recreating the database, it got corrupted. We'll try to recreate it next time MobileMail restarts...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)initWithPath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(&dword_22E161000, v0, v1, "Database corrupted. Recreating...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)containsSyncedMessageForMessageWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error checking if synced message exists (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_1(uint8_t *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void *v6;
  NSObject *v7;
  void *v8;

  v6 = *(void **)(*(_QWORD *)a2 + 72);
  v7 = a3;
  objc_msgSend(v6, "lastErrorMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_22E161000, v7, OS_LOG_TYPE_ERROR, "Error adding attachment not synced (%{public}@).", a1, 0xCu);

}

void __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error deleting attachments not synced (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error adding synced message (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)removeSyncedMessageForMessageWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error deleting synced message (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)oldestDateReceivedForMailboxId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error getting oldest date received (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)syncedMessagesCountForMailboxId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error getting synced messages count (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)messageIdForSanitizedMessageId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error querying message id from sanitized id. (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __73__NNMKDeviceSyncRegistry_removeSyncedMessagesBeforeDateReceived_mailbox___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error deleting synced messages (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)addOrUpdateSyncedAccount:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error adding synced account (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)removeSyncedAccountForAccountWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error deleting synced account (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)syncedAccountIdsResendRequested
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error selecting account ids for resend (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)accountSourceTypeForMessageId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_16(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_22E161000, v4, v5, "Error selecting account source type for message (%{public}@ - %{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)accountSourceTypeForMailboxId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_16(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_22E161000, v4, v5, "Error selecting account source type for mailbox (%{public}@ - %{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)accountSourceTypeForAccountId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_16(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_22E161000, v4, v5, "Error selecting account source type (%{public}@ - %{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)accountIdForUsername:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error selecting account id from username (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)updateSourceType:forAccountId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17(&dword_22E161000, v0, v1, "Account source type update for account (Id: %{public}@).", v2);
  OUTLINED_FUNCTION_15();
}

- (void)updateSourceType:(uint64_t)a1 forAccountId:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error updating account source type (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)addOrUpdateMailbox:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_22(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "mailboxId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v3, v4, "Attempting to save mailbox without id. %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)addOrUpdateMailbox:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_22(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "mailboxId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17(&dword_22E161000, v1, v3, "Mailbox ADDED OR UPDATED to SQLite database (Id: %{public}@).", v4);

  OUTLINED_FUNCTION_1();
}

- (void)addOrUpdateMailbox:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error ADDING Mailbox to SQLite database (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)addOrUpdateMailbox:(void *)a1 .cold.4(void *a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_22(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "mailboxId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_22E161000, v1, OS_LOG_TYPE_FAULT, "Saving mailbox without url. %{public}@", v3, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (void)deleteMailboxWithId:startTransaction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17(&dword_22E161000, v0, v1, "Maibox with id %{public}@ deleted successfully.", v2);
  OUTLINED_FUNCTION_15();
}

- (void)deleteMailboxWithId:(uint64_t)a1 startTransaction:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_16(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_22E161000, v4, v5, "Error deleting  mailboxes with id %{public}@ (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)syncVersionForMailboxId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error selecting sync_version for mailbox (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)updateSyncVersion:(uint64_t)a1 forMailboxId:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error updating/adding sync version for mailbox (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)insertDeletedMessageId:(uint64_t)a1 mailboxId:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error adding deleted message for mailbox (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)mailboxIdForDeletedMessageId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error selecting mailbox id for deleted message %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_selectMailboxesWhere:(os_log_t)log blockForBinding:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "Retrived mailbox with empty id. Ignoring...", buf, 2u);
}

- (void)_selectMailboxesWhere:(void *)a3 blockForBinding:.cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_22E161000, v5, v6, "Error selecting mailboxes where %{public}@ (%{public}@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)setProgress:(uint64_t)a1 forComposedMessageWithId:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error adding/updating composed message (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)progressForComposedMessageWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error selecting progress for composed message (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)pendingComposedMessageIds
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error selecting composed message ids for resend (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)removeProgressForComposedMessageWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error deleting composed message (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)attachmentsForComposedMessageId:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(&dword_22E161000, v0, (uint64_t)v0, "Unable to unarchive attachments for composed message: %{public}@ Error: %{public}@", v1);
  OUTLINED_FUNCTION_15();
}

- (void)attachmentsFromURL:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(&dword_22E161000, v0, (uint64_t)v0, "Unable to unarchive attachments for URL: %{public}@ Error: %{public}@", v1);
  OUTLINED_FUNCTION_15();
}

- (void)saveAttachmentsForComposedMessageId:temporaryURL:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(&dword_22E161000, v0, (uint64_t)v0, "Unable to save attachments for composedMessageId: %{public}@ Error: %{public}@", v1);
  OUTLINED_FUNCTION_15();
}

- (void)_removeAttachmentsForComposedMessageId:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(&dword_22E161000, v0, (uint64_t)v0, "Unable to delete attachments for composedMessageId: %{public}@ Error: %{public}@", v1);
  OUTLINED_FUNCTION_15();
}

void __86__NNMKDeviceSyncRegistry_addObjectIds_type_resendInterval_forIDSIdentifierNotYetAckd___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error adding Object for IDS Identifier (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)objectIdsForIDSIdentifierNotYetAckd:(uint64_t)a1 type:(void *)a2 resendInterval:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error retrieving Object Ids for IDS identifier (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)objectIdsForType:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_22E161000, v5, v6, "Error retrieving Object Ids for type. (%{public}@, %{public}@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)typeForIDSIdentifierNotYetAckd:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error retrieving Type for IDS identifier (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_18(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5(&dword_22E161000, v3, v5, "Error deleting objects for IDS Identifier (IDS Identifier: %{public}@ - Error: %{public}@).", v6);

  OUTLINED_FUNCTION_4();
}

void __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke_cold_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_18(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5(&dword_22E161000, v3, v5, "Error marking IDS Identifier as Ack'd (IDS Identifier: %{public}@ - Error: %{public}@).", v6);

  OUTLINED_FUNCTION_4();
}

- (void)rescheduleIDSIdentifier:(void *)a3 resendInterval:withDateToResend:errorCode:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_22E161000, v5, v6, "Error rescheduling Object for IDS Identifier (IDS Identifier: %{public}@ - Error: %{public}@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)prepareIDSIdentifiersForResendForErrorCode:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error preparing IDS Identifiers for Resend (Error: %{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)datesForIDSIdentifiersScheduledToBeResent
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error selecting IDS Identifiers scheduled to be resent (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_idsIdentifiersForObjectId:(uint64_t)a1 type:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error selecting IDS Identifiers for object id and type (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_setControlValueForKey:(void *)a3 withBlockForBinding:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_22E161000, v5, v6, "Error setting control value for key %{public}@ (%{public}@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)_removeControlValueForKey:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_22E161000, v5, v6, "Error deleting control value for key %{public}@ (%{public}@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)_deleteAllObjectsFromTable:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_22E161000, v5, v6, "Error deleting all values from table %{public}@ (%{public}@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)_selectSyncedMessagesWhere:(void *)a3 blockForBinding:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_22E161000, v5, v6, "Error selecting synced messages where %{public}@ (%{public}@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)_selectSyncedMessagesIdsWhere:(uint64_t)a1 count:(uint64_t)a2 blockForBinding:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_22E161000, v5, v6, "Error selecting synced message ids where %{public}@ (%{public}@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)_selectSyncedAccountsWhere:(void *)a3 blockForBinding:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "lastErrorMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_22E161000, v5, v6, "Error selecting synced accounts where %{public}@ (%{public}@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)hasMailboxSyncedActive
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "lastErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22E161000, v4, v5, "Error checking if has synced mailbox active (%{public}@).", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

@end
