@implementation EDMigrateCategoryTypeUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__EDMigrateCategoryTypeUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_58 != -1)
    dispatch_once(&log_onceToken_58, block);
  return (id)log_log_58;
}

void __39__EDMigrateCategoryTypeUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_58;
  log_log_58 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  if (objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("model_category"), CFSTR("message_global_data"), 0))
  {
    v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "UPDATE message_global_data SET model_category = null;",
           0,
           0,
           0);
    if (v4)
      goto LABEL_25;
  }
  else
  {
    +[EDMigrateCategoryTypeUpgradeStep log](EDMigrateCategoryTypeUpgradeStep, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "model_category column does not exist in message_global_data table", buf, 2u);
    }

  }
  if (objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("model_subcategory"), CFSTR("message_global_data"), 0))
  {
    v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "UPDATE message_global_data SET model_subcategory = null;",
           0,
           0,
           0);
    if (v4)
      goto LABEL_25;
  }
  else
  {
    +[EDMigrateCategoryTypeUpgradeStep log](EDMigrateCategoryTypeUpgradeStep, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "model_subcategory column does not exist in message_global_data table", v12, 2u);
    }

  }
  if (objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("user_category"), CFSTR("message_global_data"), 0))
  {
    v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "UPDATE message_global_data SET user_category = null;",
           0,
           0,
           0);
    if (v4)
      goto LABEL_25;
  }
  else
  {
    +[EDMigrateCategoryTypeUpgradeStep log](EDMigrateCategoryTypeUpgradeStep, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "user_category column does not exist in message_global_data table", v11, 2u);
    }

  }
  if ((objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("model_high_impact"), CFSTR("message_global_data"), 0) & 1) != 0)
  {
    +[EDMigrateCategoryTypeUpgradeStep log](EDMigrateCategoryTypeUpgradeStep, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "model_high_impact column already exists in message_global_data table", v10, 2u);
    }

    goto LABEL_24;
  }
  v4 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE message_global_data ADD COLUMN model_high_impact INTEGER NOT NULL DEFAULT 0;",
         0,
         0,
         0);
  if (!v4)
LABEL_24:
    v4 = 0;
LABEL_25:

  return v4;
}

@end
