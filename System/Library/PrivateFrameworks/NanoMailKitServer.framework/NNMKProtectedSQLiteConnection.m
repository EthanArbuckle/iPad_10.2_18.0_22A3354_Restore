@implementation NNMKProtectedSQLiteConnection

- (NNMKProtectedSQLiteConnection)initWithUnprotectedDatabaseFileName:(id)a3 protectedDatabaseFileName:(id)a4 inDirectory:(id)a5 protectedDatabaseName:(id)a6 errorCode:(int *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NNMKProtectedSQLiteConnection *v16;
  uint64_t v17;
  NSString *protectedDatabasePath;
  objc_super v20;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "stringByAppendingPathComponent:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)NNMKProtectedSQLiteConnection;
  v16 = -[NNMKSQLiteConnection initWithPath:errorCode:](&v20, sel_initWithPath_errorCode_, v15, a7);
  if (v16)
  {
    objc_msgSend(v13, "stringByAppendingPathComponent:", v12);
    v17 = objc_claimAutoreleasedReturnValue();
    protectedDatabasePath = v16->_protectedDatabasePath;
    v16->_protectedDatabasePath = (NSString *)v17;

    objc_storeStrong((id *)&v16->_protectedDatabaseName, a6);
    v16->_protectedDatabaseAttached = 0;
  }

  return v16;
}

- (int)attachProtectedDatabase
{
  int v2;
  void *v4;
  NSString *protectedDatabasePath;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  NSString *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->_protectedDatabaseAttached)
    return 0;
  v4 = (void *)MEMORY[0x24BDD17C8];
  protectedDatabasePath = self->_protectedDatabasePath;
  -[NNMKProtectedSQLiteConnection _vfsModuleName](self, "_vfsModuleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("ATTACH DATABASE \"file:%@?vfs=%@\" AS %@"), protectedDatabasePath, v6, self->_protectedDatabaseName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = -[NNMKSQLiteConnection executeSQL:](self, "executeSQL:", v7);
  if (v2
    || (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA %@.journal_mode = WAL;"),
          self->_protectedDatabaseName),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v2 = -[NNMKSQLiteConnection executeSQL:](self, "executeSQL:", v8),
        v8,
        v2))
  {
    v9 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    {
      v12 = self->_protectedDatabasePath;
      v13 = v9;
      -[NNMKSQLiteConnection lastErrorMessage](self, "lastErrorMessage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      v17 = 1024;
      v18 = v2;
      v19 = 2114;
      v20 = v14;
      _os_log_error_impl(&dword_22E161000, v13, OS_LOG_TYPE_ERROR, "Error attaching protected database. Path: %{public}@, Error Code: %d, Error Message: %{public}@", buf, 0x1Cu);

    }
  }
  else
  {
    self->_protectedDatabaseAttached = 1;
    v11 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v11, OS_LOG_TYPE_DEFAULT, "Protected database attached.", buf, 2u);
      v2 = 0;
    }
  }

  return v2;
}

- (void)dettachProtectedDatabase
{
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "lastErrorMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109378;
  v7[1] = a3;
  v8 = 2114;
  v9 = v6;
  _os_log_error_impl(&dword_22E161000, v5, OS_LOG_TYPE_ERROR, "Error detaching protected database (Error Code: %d, Error Message: %{public}@).", (uint8_t *)v7, 0x12u);

}

- (id)_vfsModuleName
{
  uint64_t v3;
  _QWORD v5[6];

  v3 = objc_msgSend(CFSTR("VFS-nanomaild-Protected"), "UTF8String");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__NNMKProtectedSQLiteConnection__vfsModuleName__block_invoke;
  v5[3] = &unk_24F9F62E8;
  v5[4] = self;
  v5[5] = v3;
  if (_vfsModuleName_vfsCreationOnceToken != -1)
    dispatch_once(&_vfsModuleName_vfsCreationOnceToken, v5);
  return CFSTR("VFS-nanomaild-Protected");
}

uint64_t __47__NNMKProtectedSQLiteConnection__vfsModuleName__block_invoke(uint64_t a1)
{
  _OWORD *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  __defaultVFS = (uint64_t)sqlite3_vfs_find(0);
  v2 = malloc_type_calloc(1uLL, 0xA8uLL, 0x10F0040C767261AuLL);
  __protectionVFS = (uint64_t)v2;
  v3 = __defaultVFS;
  v5 = *(_OWORD *)(__defaultVFS + 16);
  v4 = *(_OWORD *)(__defaultVFS + 32);
  *v2 = *(_OWORD *)__defaultVFS;
  v2[1] = v5;
  v2[2] = v4;
  v6 = *(_OWORD *)(v3 + 96);
  v8 = *(_OWORD *)(v3 + 48);
  v7 = *(_OWORD *)(v3 + 64);
  v2[5] = *(_OWORD *)(v3 + 80);
  v2[6] = v6;
  v2[3] = v8;
  v2[4] = v7;
  v10 = *(_OWORD *)(v3 + 128);
  v9 = *(_OWORD *)(v3 + 144);
  v11 = *(_OWORD *)(v3 + 112);
  *((_QWORD *)v2 + 20) = *(_QWORD *)(v3 + 160);
  v2[8] = v10;
  v2[9] = v9;
  v2[7] = v11;
  *((_DWORD *)v2 + 1) = *(_DWORD *)(v3 + 4);
  *((_QWORD *)v2 + 3) = strdup(*(const char **)(a1 + 40));
  *(_DWORD *)v2 = 1;
  *((_QWORD *)v2 + 5) = __protectedVFSxOpen;
  *((_QWORD *)v2 + 4) = *(_QWORD *)(a1 + 32);
  return sqlite3_vfs_register((sqlite3_vfs *)v2, 0);
}

- (BOOL)protectedDatabaseAttached
{
  return self->_protectedDatabaseAttached;
}

- (NSString)protectedDatabasePath
{
  return self->_protectedDatabasePath;
}

- (void)setProtectedDatabasePath:(id)a3
{
  objc_storeStrong((id *)&self->_protectedDatabasePath, a3);
}

- (NSString)protectedDatabaseName
{
  return self->_protectedDatabaseName;
}

- (void)setProtectedDatabaseName:(id)a3
{
  objc_storeStrong((id *)&self->_protectedDatabaseName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedDatabaseName, 0);
  objc_storeStrong((id *)&self->_protectedDatabasePath, 0);
}

@end
