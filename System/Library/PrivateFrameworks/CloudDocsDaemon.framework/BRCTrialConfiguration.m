@implementation BRCTrialConfiguration

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1)
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_39);
  return (id)defaultConfiguration_defaultConfiguration;
}

void __45__BRCTrialConfiguration_defaultConfiguration__block_invoke()
{
  BRCTrialConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(BRCTrialConfiguration);
  v1 = (void *)defaultConfiguration_defaultConfiguration;
  defaultConfiguration_defaultConfiguration = (uint64_t)v0;

}

- (BRCTrialConfiguration)init
{
  BRCTrialConfiguration *v2;
  BRCTrialConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCTrialConfiguration;
  v2 = -[BRCTrialConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BRCTrialConfiguration refresh](v2, "refresh");
  return v3;
}

- (void)refresh
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Failed loading trial client%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (int64_t)longLongForFactor:(id)a3 client:(id)a4 namespace:(id)a5 min:(int64_t)a6 max:(int64_t)a7 byDefault:(int64_t)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  int v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (a6 >= a7)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[BRCTrialConfiguration longLongForFactor:client:namespace:min:max:byDefault:].cold.3();

  }
  if (a6 > a8)
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      -[BRCTrialConfiguration longLongForFactor:client:namespace:min:max:byDefault:].cold.2();

  }
  if (a8 > a7)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[BRCTrialConfiguration longLongForFactor:client:namespace:min:max:byDefault:].cold.1();

  }
  objc_msgSend(v14, "levelForFactor:withNamespaceName:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "longValue");
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v29 = 138412802;
      v30 = v13;
      v31 = 2048;
      v32 = v18;
      v33 = 2112;
      v34 = v19;
      _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Trial config for %@: %lld%@", (uint8_t *)&v29, 0x20u);
    }

    if (v18 <= a7 && v18 >= a6)
      a8 = v18;
  }

  return a8;
}

- (BOOL)BOOLForFactor:(id)a3 client:(id)a4 namespace:(id)a5 byDefault:(BOOL)a6
{
  int v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  LOBYTE(v6) = a6;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(a4, "levelForFactor:withNamespaceName:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v6 = objc_msgSend(v10, "BOOLeanValue");
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412802;
      v16 = v9;
      v17 = 1024;
      v18 = v6;
      v19 = 2112;
      v20 = v12;
      _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Trial config for %@: %d%@", (uint8_t *)&v15, 0x1Cu);
    }

  }
  return v6;
}

- (NSString)factorPackId
{
  return self->factorPackId;
}

- (NSString)rolloutId
{
  return self->rolloutId;
}

- (NSString)rampId
{
  return self->rampId;
}

- (BOOL)enabledForFPFSMigration
{
  return self->enabledForFPFSMigration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->rampId, 0);
  objc_storeStrong((id *)&self->rolloutId, 0);
  objc_storeStrong((id *)&self->factorPackId, 0);
}

- (void)longLongForFactor:client:namespace:min:max:byDefault:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: def <= max%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)longLongForFactor:client:namespace:min:max:byDefault:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: min <= def%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)longLongForFactor:client:namespace:min:max:byDefault:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: min < max%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
