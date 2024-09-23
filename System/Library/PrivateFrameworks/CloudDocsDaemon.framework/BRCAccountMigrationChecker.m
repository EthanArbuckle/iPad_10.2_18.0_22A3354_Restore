@implementation BRCAccountMigrationChecker

- (void)perform
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] No ACAccount found%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __37__BRCAccountMigrationChecker_perform__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "br_personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("__defaultPersonaID__")))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "br_personaIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = 0;
      goto LABEL_8;
    }
  }
  if (WALRUS_LOCALIZATION_TABLE_block_invoke___personaOnceToken != -1)
    dispatch_once(&WALRUS_LOCALIZATION_TABLE_block_invoke___personaOnceToken, &__block_literal_global_7);
  v5 = (id)WALRUS_LOCALIZATION_TABLE_block_invoke___personalPersona;
  v6 = 1;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  objc_msgSend(v8, "userPersonaUniqueString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == v5 || (objc_msgSend(v9, "isEqualToString:", v5) & 1) != 0)
  {
    v11 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v28 = 0;
    v16 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v28);
    v17 = v28;
    v18 = v29;
    v29 = v16;

    if (v17)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        -[_BRCOperation completedWithResult:error:].cold.1();

    }
    objc_msgSend(v8, "generateAndRestorePersonaContextWithPersonaUniqueString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        objc_msgSend(*(id *)(a1 + 32), "br_personaIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v23;
        v32 = 2112;
        v33 = v11;
        v34 = 2112;
        v35 = v21;
        _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);

      }
LABEL_31:

    }
  }
  else
  {
    if (v6 && (objc_msgSend(v8, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v11 = 0;
      goto LABEL_31;
    }
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __37__BRCAccountMigrationChecker_perform__block_invoke_cold_2(a2, (uint64_t)v12, v13);

  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getOrCreateAccountHandlerForACAccount:", *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      __29__BRCAccountMigrator_perform__block_invoke_cold_1();

  }
  objc_msgSend(v15, "setMigrationStatus:forDSID:shouldUpdateAccount:completion:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 1, 0);
  objc_msgSend(*(id *)(a1 + 40), "_close");

  _BRRestorePersona();
}

void __37__BRCAccountMigrationChecker_perform__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WALRUS_LOCALIZATION_TABLE_block_invoke___personalPersona;
  WALRUS_LOCALIZATION_TABLE_block_invoke___personalPersona = v0;

}

void __37__BRCAccountMigrationChecker_perform__block_invoke_102(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17[3];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCAccountMigrationChecker perform]_block_invoke", 246, v17);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v19 = v17[0];
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Request for CloudKit migration status done. response: %@, error: %@%@", buf, 0x2Au);
  }

  if (v8 && !v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __37__BRCAccountMigrationChecker_perform__block_invoke_102_cold_1();

    if (v12)
      objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CFAAF0]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isNetworkReachable");

    if (v16)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "scheduleNextEvent");
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  __brc_leave_section(v17);

}

void __37__BRCAccountMigrationChecker_perform__block_invoke_cold_2(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] migration status: %d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __37__BRCAccountMigrationChecker_perform__block_invoke_102_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] migration state: %@%@");
  OUTLINED_FUNCTION_2();
}

@end
