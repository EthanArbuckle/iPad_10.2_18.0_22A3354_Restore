@implementation EDAddDomainAndBusinessColumnsUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EDAddDomainAndBusinessColumnsUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (id)log_log_3;
}

void __47__EDAddDomainAndBusinessColumnsUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3 databaseName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  sqlite3 *v18;
  id v19;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  +[EDMessagePersistence addressesTableDomainColumnName](EDMessagePersistence, "addressesTableDomainColumnName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence addressesTableName](EDMessagePersistence, "addressesTableName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "columnExists:inTable:type:", v7, v8, 0);

  if (v9)
  {
    +[EDAddDomainAndBusinessColumnsUpgradeStep log](EDAddDomainAndBusinessColumnsUpgradeStep, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Domain and category columns already exist, skipping upgrade step.", buf, 2u);
    }

    v11 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    +[EDMessagePersistence addressesTableName](EDMessagePersistence, "addressesTableName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessagePersistence addressesTableDomainColumnName](EDMessagePersistence, "addressesTableDomainColumnName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessagePersistence addressesTableName](EDMessagePersistence, "addressesTableName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessagePersistence addressesTableBusinessesColumnName](EDMessagePersistence, "addressesTableBusinessesColumnName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("ALTER TABLE %@.%@ ADD COLUMN %@ TEXT COLLATE NOCASE; ALTER TABLE %@.%@ ADD COLUMN %@ INTEGER;"),
      v6,
      v13,
      v14,
      v6,
      v15,
      v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (sqlite3 *)objc_msgSend(v5, "sqlDB");
    v19 = objc_retainAutorelease(v17);
    v11 = sqlite3_exec(v18, (const char *)objc_msgSend(v19, "UTF8String"), 0, 0, 0);

  }
  return v11;
}

@end
