@implementation AXSiriShortcutsManager

+ (id)shortcutsManagerForSource:(unint64_t)a3
{
  void *v4;
  AXSiriShortcutsManager *v5;

  if (shortcutsManagerForSource__onceToken != -1)
    dispatch_once(&shortcutsManagerForSource__onceToken, &__block_literal_global_43);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)shortcutsManagerForSource__ShortcutManagers, "objectForKeyedSubscript:", v4);
  v5 = (AXSiriShortcutsManager *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[AXSiriShortcutsManager initWithSource:]([AXSiriShortcutsManager alloc], "initWithSource:", a3);
    objc_msgSend((id)shortcutsManagerForSource__ShortcutManagers, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

void __52__AXSiriShortcutsManager_shortcutsManagerForSource___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shortcutsManagerForSource__ShortcutManagers;
  shortcutsManagerForSource__ShortcutManagers = v0;

}

+ (AXSiriShortcutsManager)sharedManager
{
  return (AXSiriShortcutsManager *)objc_msgSend(a1, "shortcutsManagerForSource:", 0);
}

- (AXSiriShortcutsManager)initWithSource:(unint64_t)a3
{
  AXSiriShortcutsManager *v4;
  AXSiriShortcutsManager *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSMutableDictionary *updateBlocks;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  objc_super v19;
  id location[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v19.receiver = self;
  v19.super_class = (Class)AXSiriShortcutsManager;
  v4 = -[AXSiriShortcutsManager init](&v19, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_source = a3;
    v6 = dispatch_queue_create("AXSiriShortcutsUpdateQueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    updateBlocks = v5->_updateBlocks;
    v5->_updateBlocks = (NSMutableDictionary *)v8;

    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v10 = (void *)getVCVoiceShortcutClientClass_softClass;
    v24 = getVCVoiceShortcutClientClass_softClass;
    if (!getVCVoiceShortcutClientClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getVCVoiceShortcutClientClass_block_invoke;
      location[3] = &unk_1E24C4AE0;
      location[4] = &v21;
      __getVCVoiceShortcutClientClass_block_invoke((uint64_t)location);
      v10 = (void *)v22[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v21, 8);
    objc_msgSend(v11, "standardClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSiriShortcutsManager setShortcutClient:](v5, "setShortcutClient:", v12);

    -[AXSiriShortcutsManager _loadShortcuts](v5, "_loadShortcuts");
    if (MKBDeviceFormattedForContentProtection())
    {
      objc_initWeak(location, v5);
      v13 = (const char *)*MEMORY[0x1E0D4E600];
      v14 = MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __41__AXSiriShortcutsManager_initWithSource___block_invoke;
      v17[3] = &unk_1E24C9120;
      objc_copyWeak(&v18, location);
      notify_register_dispatch(v13, &v5->_contentProtectionNotifyToken, v14, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(location);
    }
  }
  return v5;
}

void __41__AXSiriShortcutsManager_initWithSource___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    AXLogSiriShortcuts();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_18C62B000, v2, OS_LOG_TYPE_DEFAULT, "Auth state changed so reloading siri shortcuts", v3, 2u);
    }

    objc_msgSend(WeakRetained, "_loadShortcuts");
  }

}

- (NSArray)shortcuts
{
  NSObject *queue;
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__AXSiriShortcutsManager_shortcuts__block_invoke;
  v6[3] = &unk_1E24C52F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v3 = (void *)v8[5];
  if (!v3)
  {
    v8[5] = MEMORY[0x1E0C9AA60];

    v3 = (void *)v8[5];
  }
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __35__AXSiriShortcutsManager_shortcuts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)observableResultDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  AXLogSiriShortcuts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_INFO, "shortcuts did change!", v5, 2u);
  }

  -[AXSiriShortcutsManager _loadShortcuts](self, "_loadShortcuts");
}

- (id)registerShortcutsDidChangeBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__14;
  v17 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AXSiriShortcutsManager_registerShortcutsDidChangeBlock___block_invoke;
  block[3] = &unk_1E24C9148;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_async(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __58__AXSiriShortcutsManager_registerShortcutsDidChangeBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v2 = _Block_copy(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)unregisterShortcutsDidChangeBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__AXSiriShortcutsManager_unregisterShortcutsDidChangeBlock___block_invoke;
    v7[3] = &unk_1E24C5200;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __60__AXSiriShortcutsManager_unregisterShortcutsDidChangeBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)shortcutForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  AXSiriShortcut *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  AXSiriShortcut *v14;
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  -[AXSiriShortcutsManager shortcuts](self, "shortcuts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__AXSiriShortcutsManager_shortcutForIdentifier___block_invoke;
  v17[3] = &unk_1E24C9170;
  v6 = v4;
  v18 = v6;
  objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    -[AXSiriShortcutsManager shortcutClient](self, "shortcutClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "accessibilityWorkflowForIdentifier:error:", v6, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;

    if (v12)
    {
      AXLogSiriShortcuts();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AXSiriShortcutsManager shortcutForIdentifier:].cold.1((uint64_t)v6, (uint64_t)v12, v13);
      v9 = 0;
    }
    else
    {
      v14 = [AXSiriShortcut alloc];
      objc_msgSend(v11, "value");
      v13 = objc_claimAutoreleasedReturnValue();
      v9 = -[AXSiriShortcut initWithAccessibilityWorkflow:](v14, "initWithAccessibilityWorkflow:", v13);
    }

  }
  return v9;
}

uint64_t __48__AXSiriShortcutsManager_shortcutForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (void)_loadShortcuts
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogSiriShortcuts();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_INFO, "reloading shortcuts", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AXSiriShortcutsManager__loadShortcuts__block_invoke;
  block[3] = &unk_1E24C4C38;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__AXSiriShortcutsManager__loadShortcuts__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_loadShortcuts");
}

- (void)_queue_loadShortcuts
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a2, a3, "Could not fetch siri shortcuts: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

AXSiriShortcut *__46__AXSiriShortcutsManager__queue_loadShortcuts__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AXSiriShortcut *v3;

  v2 = a2;
  v3 = -[AXSiriShortcut initWithAccessibilityWorkflow:]([AXSiriShortcut alloc], "initWithAccessibilityWorkflow:", v2);

  return v3;
}

uint64_t __46__AXSiriShortcutsManager__queue_loadShortcuts__block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)performShortcut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[AXBackBoardServer server](AXBackBoardServer, "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRestrictedForAAC");

    if (v7)
    {
      AXLogSiriShortcuts();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20[0]) = 0;
        _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "Could not perform shortcut during Assessment Mode.", (uint8_t *)v20, 2u);
      }

      GAXLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20[0]) = 0;
        _os_log_impl(&dword_18C62B000, v9, OS_LOG_TYPE_DEFAULT, "Guided Access blocking attempt to perform shortcut during Assessment Mode.", (uint8_t *)v20, 2u);
      }
    }
    else
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2050000000;
      v16 = (void *)getWFAccessibilityWorkflowRunnerClientClass_softClass;
      v24 = getWFAccessibilityWorkflowRunnerClientClass_softClass;
      if (!getWFAccessibilityWorkflowRunnerClientClass_softClass)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __getWFAccessibilityWorkflowRunnerClientClass_block_invoke;
        v20[3] = &unk_1E24C4AE0;
        v20[4] = &v21;
        __getWFAccessibilityWorkflowRunnerClientClass_block_invoke((uint64_t)v20);
        v16 = (void *)v22[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v21, 8);
      v18 = [v17 alloc];
      objc_msgSend(v4, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v18, "initWithWorkflowIdentifier:", v19);

      -[NSObject setDelegate:](v9, "setDelegate:", self);
      -[NSObject start](v9, "start");
    }
  }
  else
  {
    AXLogSiriShortcuts();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXSiriShortcutsManager performShortcut:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  AXLogSiriShortcuts();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_INFO, "did start workflow: %@, with progress: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  AXLogSiriShortcuts();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromBOOL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413058;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_INFO, "did finish running workflow: %@, with output: %@, error: %@, cancelled: %@", (uint8_t *)&v13, 0x2Au);

  }
}

- (unint64_t)source
{
  return self->_source;
}

- (VCVoiceShortcutClient)shortcutClient
{
  return self->_shortcutClient;
}

- (void)setShortcutClient:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutClient, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_observedWorkflows, 0);
  objc_storeStrong((id *)&self->_cachedShortcuts, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)shortcutForIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_18C62B000, log, OS_LOG_TYPE_ERROR, "Could not fetch siri shortcut with identifier: %@. %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)performShortcut:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a2, a3, "Could not perform short cut no identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
