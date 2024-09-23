@implementation EDMessageGlobalDataBlackPearlUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EDMessageGlobalDataBlackPearlUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_50 != -1)
    dispatch_once(&log_onceToken_50, block);
  return (id)log_log_50;
}

void __47__EDMessageGlobalDataBlackPearlUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_50;
  log_log_50 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v31[16];

  v3 = a3;
  if (sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "DROP INDEX IF EXISTS message_global_data_model_version_model_category_index;",
         0,
         0,
         0))
  {
    +[EDMessageGlobalDataBlackPearlUpgradeStep log](EDMessageGlobalDataBlackPearlUpgradeStep, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[EDMessageGlobalDataBlackPearlUpgradeStep runWithConnection:].cold.3(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  if (objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("user_category"), CFSTR("message_global_data"), 0))
  {
    +[EDMessageGlobalDataBlackPearlUpgradeStep log](EDMessageGlobalDataBlackPearlUpgradeStep, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_INFO, "category schema already up to date", v31, 2u);
    }

    v13 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "columnExists:inTable:type:", CFSTR("category"), CFSTR("message_global_data"), 0))
    {
      if (sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "UPDATE message_global_data SET category = NULL, categorizedBy = NULL", 0, 0, 0))
      {
        +[EDMessageGlobalDataBlackPearlUpgradeStep log](EDMessageGlobalDataBlackPearlUpgradeStep, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[EDMessageGlobalDataBlackPearlUpgradeStep runWithConnection:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

      }
      if (sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "DROP TABLE IF EXISTS category_model_versions;DROP INDEX IF EXISTS message_global_data_category_categorizedB"
             "y_index;DROP INDEX IF EXISTS message_global_data_category_categorized_by_user_index;DROP INDEX IF EXISTS me"
             "ssage_global_data_category_category_model_version_index;",
             0,
             0,
             0))
      {
        +[EDMessageGlobalDataBlackPearlUpgradeStep log](EDMessageGlobalDataBlackPearlUpgradeStep, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          +[EDMessageGlobalDataBlackPearlUpgradeStep runWithConnection:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

      }
    }
    +[EDCategoryPersistence initializeCategorizationVersion:](EDCategoryPersistence, "initializeCategorizationVersion:", v3);
    v13 = sqlite3_exec((sqlite3 *)objc_msgSend(v3, "sqlDB"), "ALTER TABLE message_global_data ADD COLUMN model_analytics TEXT COLLATE BINARY;ALTER TABLE message_global_da"
            "ta ADD COLUMN model_category INTEGER;ALTER TABLE message_global_data ADD COLUMN category_model_version INTEG"
            "ER;ALTER TABLE message_global_data ADD COLUMN user_category INTEGER;ALTER TABLE message_global_data ADD COLU"
            "MN model_subcategory INTEGER;CREATE INDEX IF NOT EXISTS message_global_data_user_category_model_category_ind"
            "ex ON message_global_data(user_category, model_category);CREATE INDEX IF NOT EXISTS message_global_data_cate"
            "gory_model_version_model_category_index ON message_global_data(category_model_version, model_category);",
            0,
            0,
            0);
  }

  return v13;
}

+ (void)runWithConnection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "error dropping old indexes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)runWithConnection:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "failed to clear out old data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)runWithConnection:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Failed to drop message_global_data_model_version_model_category_index index", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
