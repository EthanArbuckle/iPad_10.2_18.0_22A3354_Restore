@implementation _LSServerSettingsStore

- (void)userElectionForExtensionKey:(id)a3 reply:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, -[_LSInProcessSettingsStore userElectionForExtensionKey:](self, "userElectionForExtensionKey:", v7), 0);

}

- (void)_internalQueue_loadDatabase
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Initializing election database", v1, 2u);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSServerSettingsStore)init
{
  _LSServerSettingsStore *v2;
  uint64_t v3;
  NSXPCListener *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LSServerSettingsStore;
  v2 = -[_LSInProcessSettingsStore init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (id)settingsStoreConfigurationForProcessWithAuditToken:(id *)a3
{
  LSSettingsStoreConfiguration *v4;
  void *v5;
  void *v6;
  LSSettingsStoreConfiguration *v7;

  v4 = [LSSettingsStoreConfiguration alloc];
  -[_LSServerSettingsStore listener](self, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LSSettingsStoreConfiguration initWithEndpoint:](v4, "initWithEndpoint:", v6);

  return v7;
}

- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v12;
  unsigned __int8 v13;

  v7 = a4;
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___LSServerSettingsStore_setUserElection_forExtensionKey_error___block_invoke;
  block[3] = &unk_1E1043CA0;
  block[4] = self;
  v12 = v7;
  v13 = a3;
  v9 = v7;
  dispatch_sync(v8, block);

  return 1;
}

- (BOOL)resetUserElectionsWithError:(id *)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___LSServerSettingsStore_resetUserElectionsWithError___block_invoke;
  block[3] = &unk_1E10418C8;
  block[4] = self;
  dispatch_sync(v4, block);

  return 1;
}

- (void)_internalQueue_loadPluginKitDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_182882000, v0, v1, "Loading legacy user election database from: '%@'", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_internalQueue_initializeDatabase
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2080;
  v6 = v3;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "SQLite result: %d error: '%s'", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_internalQueue_insertIdentifier:(id)a3 userElection:(unsigned __int8)a4
{
  unsigned int v4;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  void *v12;
  sqlite3_stmt *ppStmt;
  _BYTE v14[24];
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  ppStmt = 0;
  if (sqlite3_prepare_v2(-[_LSInProcessSettingsStore database](self, "database"), "INSERT OR REPLACE INTO Election (identifier, userElection) VALUES (?, ?)", -1, &ppStmt, 0))
  {
    _LSExtensionsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = sqlite3_errmsg(-[_LSInProcessSettingsStore database](self, "database"));
      -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.2((uint64_t)v10, (uint64_t)v14);
    }

  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, 0);
    sqlite3_bind_int(ppStmt, 2, v4);
  }
  v11 = sqlite3_step(ppStmt);
  if (v11 != 8 && v11 != 101)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSSettingsStore.mm"), 501, CFSTR("failed to set user election to '%d' for extension record: %@"), v4, v7);

  }
  sqlite3_finalize(ppStmt);

}

- (void)_internalQueue_insertIdentifier:(id)a3 userElection:(unsigned __int8)a4 timestamp:(double)a5
{
  unsigned int v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  sqlite3_stmt *ppStmt;
  _BYTE v15[24];
  uint64_t v16;

  v6 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  ppStmt = 0;
  if (sqlite3_prepare_v2(-[_LSInProcessSettingsStore database](self, "database"), "INSERT OR REPLACE INTO LegacyElection (identifier, userElection, pkTimestamp) VALUES (?, ?, ?)", -1, &ppStmt, 0))
  {
    _LSExtensionsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = sqlite3_errmsg(-[_LSInProcessSettingsStore database](self, "database"));
      -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.2((uint64_t)v12, (uint64_t)v15);
    }

  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, 0);
    sqlite3_bind_int64(ppStmt, 2, v6);
    sqlite3_bind_double(ppStmt, 3, (double)(int)a5);
  }
  if (sqlite3_step(ppStmt) != 101)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSSettingsStore.mm"), 525, CFSTR("failed to import user elcection '%ld' for extension record: %@"), v6, v9);

  }
  sqlite3_finalize(ppStmt);

}

- (void)_internalQueue_resetUserElection
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  void *v8;
  sqlite3_stmt *ppStmt;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[_LSInProcessSettingsStore internalQueue](self, "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  ppStmt = 0;
  if (sqlite3_prepare_v2(-[_LSInProcessSettingsStore database](self, "database"), "DELETE FROM Election", -1, &ppStmt, 0))
  {
    _LSExtensionsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = sqlite3_errmsg(-[_LSInProcessSettingsStore database](self, "database"));
      -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:].cold.2((uint64_t)v6, (uint64_t)v10);
    }

  }
  v7 = sqlite3_step(ppStmt);
  if (v7 != 8 && v7 != 101)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSSettingsStore.mm"), 545, CFSTR("failed to reset user election"));

  }
  sqlite3_finalize(ppStmt);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  NSXPCListener *listener;
  void *v9;

  v6 = a4;
  v7 = v6;
  listener = self->_listener;
  if (listener == a3)
  {
    objc_msgSend(v6, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCEDA10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v9);

    objc_msgSend(v7, "resume");
  }

  return listener == a3;
}

- (void)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, id);
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  audit_token_t v15;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  memset(&v15, 0, sizeof(v15));
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "auditToken");
  else
    memset(&v15, 0, sizeof(v15));

  if (_LSCheckEntitlementForAuditToken(&v15, CFSTR("com.apple.private.extensionkit.extension-management")))
  {
    v14 = 0;
    v12 = -[_LSServerSettingsStore setUserElection:forExtensionKey:error:](self, "setUserElection:forExtensionKey:error:", v6, v8, &v14);
    v13 = v14;
    if (v12)
      -[_LSServerSettingsStore postSettingsChangeNotification](self, "postSettingsChangeNotification");
    v9[2](v9, v13);
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSServerSettingsStore setUserElection:forExtensionKey:reply:]", 585, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v13);
  }

}

- (void)resetUserElectionsWithReply:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  audit_token_t v10;

  v4 = (void (**)(id, id))a3;
  memset(&v10, 0, sizeof(v10));
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "auditToken");
  else
    memset(&v10, 0, sizeof(v10));

  if (_LSCheckEntitlementForAuditToken(&v10, CFSTR("com.apple.private.extensionkit.extension-management")))
  {
    v9 = 0;
    v7 = -[_LSServerSettingsStore resetUserElectionsWithError:](self, "resetUserElectionsWithError:", &v9);
    v8 = v9;
    if (v7)
      -[_LSServerSettingsStore postSettingsChangeNotification](self, "postSettingsChangeNotification");
    v4[2](v4, v8);
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSServerSettingsStore resetUserElectionsWithReply:]", 599, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);
  }

}

- (void)postSettingsChangeNotification
{
  void *SharedInstance;
  LaunchServices::notifyd::NotifyToken *v3;
  NSObject *v4;
  NSString *v5;

  SharedInstance = (void *)__LSDefaultsGetSharedInstance();
  objc_msgSend(SharedInstance, "settingsUpdateNotificationNameForUserID:", geteuid());
  v3 = (LaunchServices::notifyd::NotifyToken *)objc_claimAutoreleasedReturnValue();
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    _LSDatabaseCommit_cold_1();

  LaunchServices::notifyd::NotifyToken::Post(v3, v5);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
