@implementation BMRemoteSQLStoreManager

- (BMRemoteSQLStoreManager)initWithURL:(id)a3
{
  BMRemoteSQLStoreManager *v3;
  BMRemoteSQLStoreManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMRemoteSQLStoreManager;
  v3 = -[BMSQLStoreManager initWithURL:](&v6, sel_initWithURL_, a3);
  v4 = v3;
  if (v3)
    -[BMRemoteSQLStoreManager setRemoteOnly:](v3, "setRemoteOnly:", 0);
  return v4;
}

- (BOOL)hasReadWriteAccessToURL:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  uint8_t buf[16];

  v3 = a3;
  if (hasReadWriteAccessToURL__onceToken != -1)
    dispatch_once(&hasReadWriteAccessToURL__onceToken, &__block_literal_global);
  if (hasReadWriteAccessToURL__isSandboxed)
  {
    objc_msgSend(v3, "path");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "UTF8String");
    v5 = sandbox_check() == 0;

  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B399A000, v6, OS_LOG_TYPE_INFO, "Process not sandboxed, skipping sandbox check", buf, 2u);
    }

    v5 = 1;
  }

  return v5;
}

uint64_t __51__BMRemoteSQLStoreManager_hasReadWriteAccessToURL___block_invoke()
{
  uint64_t result;

  hasReadWriteAccessToURL__pid = getpid();
  result = sandbox_check();
  hasReadWriteAccessToURL__isSandboxed = (_DWORD)result != 0;
  return result;
}

- (id)deleteRowsDerivedFromStream:(id)a3 eventIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (-[BMRemoteSQLStoreManager remoteOnly](self, "remoteOnly")
    || (-[BMSQLStore dbURL](self, "dbURL"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = -[BMRemoteSQLStoreManager hasReadWriteAccessToURL:](self, "hasReadWriteAccessToURL:", v8),
        v8,
        !v9))
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BMRemoteSQLStoreManager deleteRowsDerivedFromStream:eventIdentifier:].cold.1(self, v11);

    v10 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BMRemoteSQLStoreManager;
    -[BMSQLStoreManager deleteRowsDerivedFromStream:eventIdentifier:](&v13, sel_deleteRowsDerivedFromStream_eventIdentifier_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)remoteOnly
{
  return self->_remoteOnly;
}

- (void)setRemoteOnly:(BOOL)a3
{
  self->_remoteOnly = a3;
}

- (void)deleteRowsDerivedFromStream:(void *)a1 eventIdentifier:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dbURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1B399A000, a2, OS_LOG_TYPE_FAULT, "Unable to delete derived data - biomed does not have access to %@", (uint8_t *)&v4, 0xCu);

}

@end
