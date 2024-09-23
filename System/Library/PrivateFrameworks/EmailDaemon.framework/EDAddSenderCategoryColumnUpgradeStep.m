@implementation EDAddSenderCategoryColumnUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EDAddSenderCategoryColumnUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1)
    dispatch_once(&log_onceToken_7, block);
  return (id)log_log_7;
}

void __43__EDAddSenderCategoryColumnUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = a3;
  +[EDSenderPersistence sendersCategoryColumnName](EDSenderPersistence, "sendersCategoryColumnName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSenderPersistence sendersTableName](EDSenderPersistence, "sendersTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "columnExists:inTable:type:", v4, v5, 0);

  if ((v6 & 1) != 0)
  {
    +[EDAddSenderCategoryColumnUpgradeStep log](EDAddSenderCategoryColumnUpgradeStep, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "senders.category column already exists", v11, 2u);
    }

    v8 = 0;
  }
  else
  {
    +[EDAddSenderCategoryColumnUpgradeStep log](EDAddSenderCategoryColumnUpgradeStep, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Create category column in senders", buf, 2u);
    }

    v8 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE senders ADD COLUMN category INTEGER;CREATE INDEX IF NOT EXISTS senders_category_index ON senders(category);",
           0,
           0,
           0);
  }

  return v8;
}

@end
