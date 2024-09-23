@implementation AMSStorageDatabaseSchema

+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3
{
  id v4;
  AMSSQLiteSchema *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _QWORD v16[5];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AMSSQLiteSchema initWithConnection:]([AMSSQLiteSchema alloc], "initWithConnection:", v4);
  v6 = -[AMSSQLiteSchema currentUserVersion](v5, "currentUserVersion");
  v7 = MEMORY[0x1E0C809B0];
  while (1)
  {
    if (v6 > 0)
    {
      v13 = 1;
      goto LABEL_19;
    }
    if (!v6)
    {
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __64__AMSStorageDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke;
      v16[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v16[4] = a1;
      if (!-[AMSSQLiteSchema migrateToVersion:usingBlock:](v5, "migrateToVersion:usingBlock:", 1, v16))
        break;
    }
    v8 = -[AMSSQLiteSchema currentUserVersion](v5, "currentUserVersion");
    v9 = v8 == v6;
    v6 = v8;
    if (v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v18 = v12;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update AMSStorage database scheme. User version did not change", buf, 0xCu);
      }
      v13 = 1;
      goto LABEL_18;
    }
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v14 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update AMSStorage database scheme. Success = NO", buf, 0xCu);
  }
  v13 = 0;
LABEL_18:

LABEL_19:
  return v13;
}

uint64_t __64__AMSStorageDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateVersion0to1WithMigration:", a2);
}

+ (void)migrateVersion0to1WithMigration:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "executeStatement:", CFSTR("PRAGMA auto_vacuum = 2;"));
  objc_msgSend(v3, "executeStatement:", CFSTR("CREATE TABLE IF NOT EXISTS data (domain TEXT, key TEXT, valueType INT, value BLOB, lastModified REAL, PRIMARY KEY (key, domain));"));

}

@end
