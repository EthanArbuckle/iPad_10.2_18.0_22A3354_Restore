@implementation LSApplicationIdentityMigrator

- (id)migrateIdentities:(id)a3 error:(id *)a4
{
  id v4;
  LSApplicationIdentityMigrationResult *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  __int128 v14;
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
  v5 = objc_alloc_init(LSApplicationIdentityMigrationResult);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v8 = 138412290;
    v14 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "needsMigration", v14, (_QWORD)v15))
        {
          _LSDefaultLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v11;
            _os_log_fault_impl(&dword_182882000, v12, OS_LOG_TYPE_FAULT, "identity %@ needs migration!? How!?", buf, 0xCu);
          }

        }
        -[LSApplicationIdentityMigrationResult noteIdentityDoesNotNeedMigration:]((uint64_t)v5, v11);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)migrateIdentity:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationIdentityMigrator migrateIdentities:error:](self, "migrateIdentities:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
