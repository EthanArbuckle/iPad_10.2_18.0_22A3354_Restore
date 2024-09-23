@implementation BRCContainerCellularSettings

- (void)_accountDidChangeForPersona:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BRCContainerCellularSettings *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke;
  v7[3] = &unk_1E875D470;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke()
{
  return BRPerformWithPersonaAndError();
}

void __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12[3];

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_3((uint64_t)v3, (uint64_t)v4, v5);

  }
  else
  {
    memset(v12, 0, sizeof(v12));
    __brc_create_section(0, (uint64_t)"-[BRCContainerCellularSettings _accountDidChangeForPersona:]_block_invoke", 44, v12);
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_2();

    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_1((uint64_t)v8, v9);

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(_QWORD *)(v10 + 24) = 0;

    __brc_leave_section(v12);
  }

}

- (BRCContainerCellularSettings)initWithPersonaID:(id)a3
{
  id v4;
  BRCContainerCellularSettings *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSOperationQueue *operationQueue;
  void *v12;
  uint64_t v13;
  NSOperationQueue *v14;
  uint64_t v15;
  NSObject *accountDidChangeNotificationObserver;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCContainerCellularSettings;
  v5 = -[BRCContainerCellularSettings init](&v22, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.bird.cellular-settings", v7);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = (NSOperationQueue *)v10;

    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D10AF0];
    v14 = v5->_operationQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__BRCContainerCellularSettings_initWithPersonaID___block_invoke;
    v18[3] = &unk_1E8767520;
    objc_copyWeak(&v20, &location);
    v19 = v4;
    objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v13, 0, v14, v18);
    v15 = objc_claimAutoreleasedReturnValue();
    accountDidChangeNotificationObserver = v5->_accountDidChangeNotificationObserver;
    v5->_accountDidChangeNotificationObserver = v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __50__BRCContainerCellularSettings_initWithPersonaID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_accountDidChangeForPersona:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_accountDidChangeNotificationObserver);

  v4.receiver = self;
  v4.super_class = (Class)BRCContainerCellularSettings;
  -[BRCContainerCellularSettings dealloc](&v4, sel_dealloc);
}

+ (id)containerCellularSettings
{
  void *v2;
  void *v3;
  id v4;
  BRCContainerCellularSettings *v5;

  if (containerCellularSettings_onceToken != -1)
    dispatch_once(&containerCellularSettings_onceToken, &__block_literal_global_62);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_currentPersonaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)containerCellularSettings_cellularSettingsByPersonaID;
  objc_sync_enter(v4);
  objc_msgSend((id)containerCellularSettings_cellularSettingsByPersonaID, "objectForKeyedSubscript:", v3);
  v5 = (BRCContainerCellularSettings *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[BRCContainerCellularSettings initWithPersonaID:]([BRCContainerCellularSettings alloc], "initWithPersonaID:", v3);
    objc_msgSend((id)containerCellularSettings_cellularSettingsByPersonaID, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

void __57__BRCContainerCellularSettings_containerCellularSettings__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)containerCellularSettings_cellularSettingsByPersonaID;
  containerCellularSettings_cellularSettingsByPersonaID = v0;

}

- (BOOL)isCellularEnabled
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(queue, block);
  return -[NSNumber BOOLValue](self->_isCellularEnabledForDocumentsAndData, "BOOLValue");
}

void __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12[3];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    memset(v12, 0, sizeof(v12));
    __brc_create_section(0, (uint64_t)"-[BRCContainerCellularSettings isCellularEnabled]_block_invoke", 108, v12);
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke_cold_2();

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "br_accountForCurrentPersona");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "aa_useCellularForDataclass:", *MEMORY[0x1E0C8F430]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v7;

    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke_cold_1();

    __brc_leave_section(v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_isCellularEnabledForDocumentsAndData, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] forcing refresh of cellular switch%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx account properties changed%@");
  OUTLINED_FUNCTION_2();
}

void __60__BRCContainerCellularSettings__accountDidChangeForPersona___block_invoke_2_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CBD43000, log, (os_log_type_t)0x90u, "[ERROR] Failed to adopt persona: %@%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] cellular is %@ for D&D%@");
  OUTLINED_FUNCTION_2();
}

void __49__BRCContainerCellularSettings_isCellularEnabled__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx checking if cellular is enabled for D&D%@");
  OUTLINED_FUNCTION_2();
}

@end
