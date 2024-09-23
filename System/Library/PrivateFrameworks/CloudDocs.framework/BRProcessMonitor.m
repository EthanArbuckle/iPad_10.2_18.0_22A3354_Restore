@implementation BRProcessMonitor

- (BOOL)_isProcessForeground:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  char v7;
  int v8;
  char v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (_isProcessForeground_bundleID__onceToken != -1)
    dispatch_once(&_isProcessForeground_bundleID__onceToken, &__block_literal_global_8);
  v7 = objc_msgSend((id)_isProcessForeground_bundleID__EXTENSION_BUNDLE_IDS, "containsObject:", v6);
  v8 = objc_msgSend(v5, "taskState");
  if (v8 == 4)
    v9 = v7;
  else
    v9 = 0;
  if ((v7 & 1) == 0 && v8 == 4)
  {
    objc_msgSend(v5, "endowmentNamespaces");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

  }
  return v9;
}

void __50__BRProcessMonitor__isProcessForeground_bundleID___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3DC2690);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_isProcessForeground_bundleID__EXTENSION_BUNDLE_IDS;
  _isProcessForeground_bundleID__EXTENSION_BUNDLE_IDS = v0;

}

- (id)_bundleIDForPID:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D87D68];
  v4 = (void *)MEMORY[0x1E0D87DA0];
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateMatchingTarget:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleForPredicate:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)initForProcessID:(int)a3 observer:(id)a4
{
  uint64_t v4;
  id v6;
  BRProcessMonitor *v7;
  void *v8;
  void *v9;
  id v10;
  BRProcessMonitor *v11;
  uint64_t v12;
  id monitor;
  BRProcessMonitor *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  BRProcessMonitor *v20;
  id v21;
  int v22;
  id location;
  objc_super v24;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BRProcessMonitor;
  v7 = -[BRProcessMonitor init](&v24, sel_init);
  if (!v7)
    goto LABEL_4;
  objc_initWeak(&location, v6);
  -[BRProcessMonitor _bundleIDForPID:](v7, "_bundleIDForPID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D87D90];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__BRProcessMonitor_initForProcessID_observer___block_invoke;
    v18[3] = &unk_1E3DA5668;
    v22 = v4;
    v10 = v8;
    v19 = v10;
    objc_copyWeak(&v21, &location);
    v11 = v7;
    v20 = v11;
    objc_msgSend(v9, "monitorWithConfiguration:", v18);
    v12 = objc_claimAutoreleasedReturnValue();
    monitor = v11->_monitor;
    v11->_monitor = (id)v12;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
LABEL_4:
    v14 = v7;
    goto LABEL_8;
  }
  brc_bread_crumbs((uint64_t)"-[BRProcessMonitor initForProcessID:observer:]", 55);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[BRProcessMonitor initForProcessID:observer:].cold.1((uint64_t)v15, v4, v16);

  objc_destroyWeak(&location);
  v14 = 0;
LABEL_8:

  return v14;
}

void __46__BRProcessMonitor_initForProcessID_observer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  int v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs((uint64_t)"-[BRProcessMonitor initForProcessID:observer:]_block_invoke", 59);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __46__BRProcessMonitor_initForProcessID_observer___block_invoke_cold_1(a1, (uint64_t)v4, v5);

  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setPredicates:", v7);
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValues:", 1);
  objc_msgSend(v8, "setEndowmentNamespaces:", &unk_1E3DC26A8);
  objc_msgSend(v3, "setStateDescriptor:", v8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__BRProcessMonitor_initForProcessID_observer___block_invoke_18;
  v9[3] = &unk_1E3DA5640;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v13 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v3, "setUpdateHandler:", v9);

  objc_destroyWeak(&v12);
}

void __46__BRProcessMonitor_initForProcessID_observer___block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v5, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "_isProcessForeground:bundleID:", v7, *(_QWORD *)(a1 + 40));
    brc_bread_crumbs((uint64_t)"-[BRProcessMonitor initForProcessID:observer:]_block_invoke", 71);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_DWORD *)(a1 + 56);
      v13 = 138413314;
      v14 = v11;
      v15 = 1024;
      v16 = v12;
      v17 = 1024;
      v18 = v8;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v9;
      _os_log_debug_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Received an update handler for bundleID = %@, pid = %d, isForeground = %d, update = %@%@", (uint8_t *)&v13, 0x2Cu);
    }

    objc_msgSend(WeakRetained, "process:didBecomeForeground:", *(unsigned int *)(a1 + 56), v8);
  }

}

- (void)invalidate
{
  id monitor;

  objc_msgSend(self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[BRProcessMonitor invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BRProcessMonitor;
  -[BRProcessMonitor dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_monitor, 0);
}

- (void)initForProcessID:(os_log_t)log observer:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] There is no bundleID for the provided pid %d%@", (uint8_t *)v3, 0x12u);
}

void __46__BRProcessMonitor_initForProcessID_observer___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = 67109634;
  v5[1] = v3;
  v6 = 2112;
  v7 = v4;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] creating monitor for %d with bundleID = %@%@", (uint8_t *)v5, 0x1Cu);
}

@end
