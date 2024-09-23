@implementation BRCAccountMigrator

- (void)perform
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  BRDSIDString *dsid;
  _QWORD v14[5];
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  BRCAccountMigrator *v19;
  uint64_t v20[3];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  BRDSIDString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRCAccountMigrator perform]", 179, v20);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    dsid = self->super._dsid;
    *(_DWORD *)buf = 134218498;
    v22 = v20[0];
    v23 = 2112;
    v24 = dsid;
    v25 = 2112;
    v26 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx performing migration for %@%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_appleAccountWithPersonID:", self->super._dsid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __29__BRCAccountMigrator_perform__block_invoke;
  v17[3] = &unk_1E875D470;
  v8 = v6;
  v18 = v8;
  v19 = self;
  v9 = (void *)MEMORY[0x1D17A6DB0](v17);
  if (v8)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFABF0]), "initWithAccount:", v8);
    BRSetupAARequest(v10);
    v11 = dispatch_semaphore_create(0);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __29__BRCAccountMigrator_perform__block_invoke_90;
    v14[3] = &unk_1E875E6D8;
    v16 = v9;
    v14[4] = self;
    v12 = v11;
    v15 = v12;
    objc_msgSend(v10, "performRequestWithHandler:", v14);
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  }
  __brc_leave_section(v20);
}

void __29__BRCAccountMigrator_perform__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __29__BRCAccountMigrator_perform__block_invoke_cold_2();

  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountHandlerForACAccountID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __29__BRCAccountMigrator_perform__block_invoke_cold_1();

  }
  objc_msgSend(v6, "setMigrationStatus:forDSID:shouldUpdateAccount:completion:", 3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 1, 0);
  objc_msgSend(*(id *)(a1 + 40), "_close");

}

void __29__BRCAccountMigrator_perform__block_invoke_90(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  uint64_t v19[3];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(v8, "error");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  memset(v19, 0, sizeof(v19));
  __brc_create_section(0, (uint64_t)"-[BRCAccountMigrator perform]_block_invoke", 199, v19);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v21 = v19[0];
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Setting migration state. response: %@, error: %@%@", buf, 0x2Au);
  }

  if (!v8
    || v9
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v8, "status"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "integerValue") == -1,
        v12,
        v13))
  {
    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isNetworkReachable");

    if (v18)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "scheduleNextEvent");
  }
  else
  {
    objc_msgSend(v8, "status");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __29__BRCAccountMigrator_perform__block_invoke_90_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  __brc_leave_section(v19);

}

void __29__BRCAccountMigrator_perform__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: handler%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __29__BRCAccountMigrator_perform__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] migration completed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __29__BRCAccountMigrator_perform__block_invoke_90_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] status: %@%@");
  OUTLINED_FUNCTION_2();
}

@end
