@implementation BRBlockRememberPersona

void ___BRBlockRememberPersona_block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (v2 = *(id *)(a1 + 32)) == 0)
  {
    if (_block_invoke___personaOnceToken_2 != -1)
      dispatch_once(&_block_invoke___personaOnceToken_2, &__block_literal_global_190);
    v3 = (id)_block_invoke___personalPersona_2;
    v4 = 1;
  }
  else
  {
    v3 = v2;
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == v3 || (objc_msgSend(v7, "isEqualToString:", v3) & 1) != 0)
    goto LABEL_9;
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && (objc_msgSend(v6, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();

    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_25;
    }
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  v24 = 0;
  v9 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v24);
  v10 = v24;
  v11 = v25;
  v25 = v9;

  if (v10)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      -[_BRCOperation completedWithResult:error:].cold.1();

  }
  objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_9;
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v27 = v23;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_error_impl(&dword_1CBD43000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    ___BRBlockRememberPersona_block_invoke_cold_1();

LABEL_10:
  _BRRestorePersona();

}

void ___BRBlockRememberPersona_block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke___personalPersona_2;
  _block_invoke___personalPersona_2 = v0;

}

void ___BRBlockRememberPersona_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Failed to adopt persona for block adoption%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
