@implementation AMSMetricsDatabaseSchema

+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3
{
  AMSSQLiteSchema *v4;
  BOOL v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  AMSSQLiteSchema *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v4 = -[AMSSQLiteSchema initWithConnection:]([AMSSQLiteSchema alloc], "initWithConnection:", v20);
  v7 = -[AMSSQLiteSchema currentUserVersion](v4, "currentUserVersion");
  v8 = MEMORY[0x1E0C809B0];
  while (!v6 && v5)
  {
LABEL_11:
    v12 = -[AMSSQLiteSchema currentUserVersion](v4, "currentUserVersion");
    v5 = v12 >= v7;
    v6 = v12 == v7;
    v7 = v12;
    if (v6)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v28 = v15;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update database scheme. User version did not change", buf, 0xCu);
      }
      v16 = 1;
      goto LABEL_24;
    }
  }
  switch(v7)
  {
    case 0uLL:
      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke;
      v26[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v26[4] = a1;
      v9 = v26;
      v10 = v4;
      v11 = 1;
      goto LABEL_10;
    case 1uLL:
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_2;
      v25[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v25[4] = a1;
      v9 = v25;
      v10 = v4;
      v11 = 2;
      goto LABEL_10;
    case 2uLL:
      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_3;
      v24[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v24[4] = a1;
      v9 = v24;
      v10 = v4;
      v11 = 3;
      goto LABEL_10;
    case 3uLL:
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_4;
      v23[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v23[4] = a1;
      v9 = v23;
      v10 = v4;
      v11 = 4;
      goto LABEL_10;
    case 4uLL:
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_5;
      v22[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v22[4] = a1;
      v9 = v22;
      v10 = v4;
      v11 = 5;
      goto LABEL_10;
    case 5uLL:
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_6;
      v21[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v21[4] = a1;
      v9 = v21;
      v10 = v4;
      v11 = 6;
LABEL_10:
      if (-[AMSSQLiteSchema migrateToVersion:usingBlock:](v10, "migrateToVersion:usingBlock:", v11, v9))
        goto LABEL_11;
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v28 = v18;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update database scheme. Success = NO", buf, 0xCu);
      }
      v16 = 0;
      break;
    default:
      v16 = 1;
      v17 = v20;
      goto LABEL_25;
  }
LABEL_24:
  v17 = v20;

LABEL_25:
  return v16;
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateVersion0to1WithMigration:", a2);
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateVersion1to2WithMigration:", a2);
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateVersion2to3WithMigration:", a2);
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateVersion3to4WithMigration:", a2);
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateVersion4to5WithMigration:", a2);
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateVersion5to6WithMigration:", a2);
}

+ (void)migrateVersion0to1WithMigration:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "executeStatement:", CFSTR("PRAGMA auto_vacuum = 2;"));
  objc_msgSend(v3, "executeStatement:", CFSTR("CREATE TABLE events (pid INTEGER, report_url TEXT, eventBody TEXT, locked_by TEXT, locked_time REAL DEFAULT 0, timestampInserted REAL, PRIMARY KEY (pid));"));
  objc_msgSend(v3, "executeStatement:", CFSTR("CREATE INDEX events_locked_by ON events (locked_by);"));
  objc_msgSend(v3, "executeStatement:", CFSTR("CREATE INDEX events_locked_time ON events (locked_time);"));
  objc_msgSend(v3, "executeStatement:", CFSTR("CREATE INDEX events_report_url ON events (report_url);"));
  objc_msgSend(v3, "executeStatement:", CFSTR("CREATE INDEX events_timestampInserted ON events (timestampInserted);"));

}

+ (void)migrateVersion1to2WithMigration:(id)a3
{
  objc_msgSend(a3, "executeStatement:", CFSTR("ALTER TABLE events ADD account TEXT;"));
}

+ (void)migrateVersion3to4WithMigration:(id)a3
{
  objc_msgSend(a3, "executeStatement:", CFSTR("ALTER TABLE events ADD batchId TEXT;"));
}

+ (void)migrateVersion4to5WithMigration:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v7 = a3;
  objc_msgSend(v7, "executeOptionalStatement:", CFSTR("ALTER TABLE identifiers RENAME TO old_identifiers;"));
  objc_msgSend(v7, "executeStatement:", CFSTR("CREATE TABLE identifier_stores (store_key TEXT PRIMARY KEY, store_uuid TEXT UNIQUE, account TEXT, interval REAL, cross_device INTEGER, started REAL, modified REAL, last_sync REAL DEFAULT 0, deleted INTEGER DEFAULT 0);"));
  objc_msgSend(v7, "executeStatement:", CFSTR("CREATE TABLE identifiers (identifier_key TEXT PRIMARY KEY, store_uuid TEXT, name TEXT, value TEXT, cross_device INTEGER, expires REAL, modified REAL, last_sync REAL DEFAULT 0, deleted INTEGER DEFAULT 0);"));
  objc_msgSend(v7, "executeStatement:", CFSTR("CREATE INDEX identifiers_store_uuid ON identifiers (store_uuid);"));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__AMSMetricsDatabaseSchema_migrateVersion4to5WithMigration___block_invoke;
  v9[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  v9[4] = v5;
  objc_msgSend(v7, "executeOptionalStatement:bindings:", CFSTR("INSERT INTO identifier_stores (store_key, store_uuid, account, interval, cross_device, started, modified) SELECT key, key, account, 0, 0, ?, ? FROM old_identifiers;"),
    v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __60__AMSMetricsDatabaseSchema_migrateVersion4to5WithMigration___block_invoke_2;
  v8[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  v8[4] = v5;
  objc_msgSend(v7, "executeOptionalStatement:bindings:", CFSTR("INSERT INTO identifiers (identifier_key, store_uuid, name, value, cross_device, expires, modified) SELECT key || '_clientId', key, 'clientId', value, 0, expires, ? FROM old_identifiers;"),
    v8);
  objc_msgSend(v7, "executeOptionalStatement:", CFSTR("DROP TABLE old_identifiers;"));

}

void __60__AMSMetricsDatabaseSchema_migrateVersion4to5WithMigration___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindDouble:atPosition:", 1, v3);
  objc_msgSend(v4, "bindDouble:atPosition:", 2, *(double *)(a1 + 32));
  objc_msgSend(v4, "bindDouble:atPosition:", 3, *(double *)(a1 + 32));

}

uint64_t __60__AMSMetricsDatabaseSchema_migrateVersion4to5WithMigration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindDouble:atPosition:", 1, *(double *)(a1 + 32));
}

+ (void)migrateVersion5to6WithMigration:(id)a3
{
  objc_msgSend(a3, "executeStatement:", CFSTR("ALTER TABLE identifiers ADD server_provided_at REAL;"));
}

@end
