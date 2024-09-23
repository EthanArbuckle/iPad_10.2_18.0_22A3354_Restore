@implementation CXCallDirectoryHost

void __47__CXCallDirectoryHost_performDelegateCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v5, *(dispatch_block_t *)(a1 + 40));

    }
  }
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (CXCallDirectoryHostDelegate)delegate
{
  return (CXCallDirectoryHostDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)performDelegateCallback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CXCallDirectoryHost_performDelegateCallback___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)_connectionContainsCallDirectoryHostEntitlementCapability:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.CallKit.call-directory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = CFSTR("com.apple.CallKit.call-directory");
      _os_log_impl(&dword_1A402D000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] XPC connection %@ does not contain entitlement '%@'", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:].cold.1((uint64_t)v4, (uint64_t)v5, v7);
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  v6 = objc_msgSend(v5, "containsObject:", v3);
LABEL_9:

  return v6;
}

- (CXCallDirectoryHost)init
{
  CXCallDirectoryHost *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXCallDirectoryHost;
  v2 = -[CXCallDirectoryHost init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.callkit.calldirectoryhost", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CXCallDirectoryHost queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CXCallDirectoryHost_setDelegate_queue___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __41__CXCallDirectoryHost_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    v2 = *(_QWORD *)(a1 + 48);
  else
    v2 = MEMORY[0x1E0C80D38];
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", v2);
}

- (void)reloadExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "identifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E4B88B80;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[CXCallDirectoryHost _nsExtensionWithIdentifier:completion:](self, "_nsExtensionWithIdentifier:completion:", v9, v11);

}

void __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_2;
    v9[3] = &unk_1E4B88B58;
    v9[4] = v5;
    v10 = v3;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v5, "performDelegateCallback:", v9);

  }
  else
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_cold_1();

    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedReloadForExtension:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)resetLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "resetLiveLookupExtensionWithIdentifier identifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E4B88B80;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[CXCallDirectoryHost _nsExtensionWithIdentifier:completion:](self, "_nsExtensionWithIdentifier:completion:", v9, v11);

}

void __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_2;
    v11[3] = &unk_1E4B88B58;
    v11[4] = v7;
    v12 = v5;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v7, "performDelegateCallback:", v11);

  }
  else
  {
    CXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_cold_1();

    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

void __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedResetForLiveLookupExtension:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)refreshPIRParametersForLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "refreshPIRParametersForLiveLookupExtensionWithIdentifier identifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__CXCallDirectoryHost_refreshPIRParametersForLiveLookupExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E4B88B80;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[CXCallDirectoryHost _nsExtensionWithIdentifier:completion:](self, "_nsExtensionWithIdentifier:completion:", v9, v11);

}

void __86__CXCallDirectoryHost_refreshPIRParametersForLiveLookupExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__CXCallDirectoryHost_refreshPIRParametersForLiveLookupExtensionWithIdentifier_reply___block_invoke_2;
    v11[3] = &unk_1E4B88B58;
    v11[4] = v7;
    v12 = v5;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v7, "performDelegateCallback:", v11);

  }
  else
  {
    CXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_cold_1();

    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

void __86__CXCallDirectoryHost_refreshPIRParametersForLiveLookupExtensionWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedRefreshPIRParametersForLiveLookupExtension:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getEnabledStatusForExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "getEnabledStatusForExtensionWithIdentifieridentifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__CXCallDirectoryHost_getEnabledStatusForExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E4B88B80;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[CXCallDirectoryHost _nsExtensionWithIdentifier:completion:](self, "_nsExtensionWithIdentifier:completion:", v9, v11);

}

void __72__CXCallDirectoryHost_getEnabledStatusForExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__CXCallDirectoryHost_getEnabledStatusForExtensionWithIdentifier_reply___block_invoke_2;
    v9[3] = &unk_1E4B88B58;
    v9[4] = v5;
    v10 = v3;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v5, "performDelegateCallback:", v9);

  }
  else
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_cold_1();

    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

void __72__CXCallDirectoryHost_getEnabledStatusForExtensionWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedEnabledStatusForExtension:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getEnabledForLiveLookupExtensionWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "getEnabledForLiveLookupExtensionWithIdentifier identifier %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__CXCallDirectoryHost_getEnabledForLiveLookupExtensionWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E4B88B80;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[CXCallDirectoryHost _nsExtensionWithIdentifier:completion:](self, "_nsExtensionWithIdentifier:completion:", v9, v11);

}

void __76__CXCallDirectoryHost_getEnabledForLiveLookupExtensionWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callDirectoryHost:requestedEnabledForLiveLookupExtension:completionHandler:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 48));
  }
  else
  {
    CXDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_cold_1();

    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v4);
  }

}

- (void)setEnabled:(BOOL)a3 forLiveLookupExtensionWithIdentifier:(id)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t);
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  void (**v27)(id, uint64_t);
  BOOL v28;
  id v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  _BOOL4 v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v6 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  CXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v33 = v6;
    v34 = 2112;
    v35 = v8;
    _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "enabled %d identifier %@", buf, 0x12u);
  }

  if (!-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("modify-any-extension")))
  {
    CXDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost setEnabled:forLiveLookupExtensionWithIdentifier:reply:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("modify-any-extension"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v11);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v8, &v29);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v29;
  if (!v11)
  {
    CXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost setEnabled:forLiveLookupExtensionWithIdentifier:reply:].cold.1((uint64_t)v8);

    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v24 = (void *)v22;
    v9[2](v9, v22);

    goto LABEL_13;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__CXCallDirectoryHost_setEnabled_forLiveLookupExtensionWithIdentifier_reply___block_invoke;
  v25[3] = &unk_1E4B88BA8;
  v25[4] = self;
  v28 = v6;
  v11 = v11;
  v26 = v11;
  v27 = v9;
  -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v25);

LABEL_13:
}

void __77__CXCallDirectoryHost_setEnabled_forLiveLookupExtensionWithIdentifier_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedSetEnabled:forLiveLookupExtension:completionHandler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_nsExtensionWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  CXCallDirectoryNSExtensionManager *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[8];
  _QWORD v12[4];
  id v13;
  id v14;
  int v15;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(CXCallDirectoryNSExtensionManager);
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "processIdentifier");

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__CXCallDirectoryHost__nsExtensionWithIdentifier_completion___block_invoke;
    v12[3] = &unk_1E4B88BD0;
    v14 = v6;
    v13 = v5;
    v15 = v9;
    -[CXCallDirectoryNSExtensionManager extensionWithIdentifier:inContainingAppWithProcessIdentifier:completion:](v7, "extensionWithIdentifier:inContainingAppWithProcessIdentifier:completion:", v13, v9, v12);

  }
  else
  {
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] identifier is nil", v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v7 = (CXCallDirectoryNSExtensionManager *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, CXCallDirectoryNSExtensionManager *))v6 + 2))(v6, 0, v7);
  }

}

void __61__CXCallDirectoryHost__nsExtensionWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    CXDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61__CXCallDirectoryHost__nsExtensionWithIdentifier_completion___block_invoke_cold_1();

    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

- (void)setEnabled:(BOOL)a3 forExtensionWithIdentifier:(id)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t);
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  void (**v27)(id, uint64_t);
  BOOL v28;
  id v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  _BOOL4 v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v6 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  CXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v33 = v6;
    v34 = 2112;
    v35 = v8;
    _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "enabled %d identifier %@", buf, 0x12u);
  }

  if (!-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("modify-any-extension")))
  {
    CXDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost setEnabled:forLiveLookupExtensionWithIdentifier:reply:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("modify-any-extension"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v11);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v8, &v29);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v29;
  if (!v11)
  {
    CXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost setEnabled:forLiveLookupExtensionWithIdentifier:reply:].cold.1((uint64_t)v8);

    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v24 = (void *)v22;
    v9[2](v9, v22);

    goto LABEL_13;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __67__CXCallDirectoryHost_setEnabled_forExtensionWithIdentifier_reply___block_invoke;
  v25[3] = &unk_1E4B88BA8;
  v25[4] = self;
  v28 = v6;
  v11 = v11;
  v26 = v11;
  v27 = v9;
  -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v25);

LABEL_13:
}

void __67__CXCallDirectoryHost_setEnabled_forExtensionWithIdentifier_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedToSetEnabled:forExtension:completionHandler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getLastUpdatedCallDirectoryInfoWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "getLastUpdatedCallDirectoryInfoWithReply", buf, 2u);
  }

  if (-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("query-identification-entries")))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__CXCallDirectoryHost_getLastUpdatedCallDirectoryInfoWithReply___block_invoke;
    v18[3] = &unk_1E4B88B30;
    v18[4] = self;
    v19 = v4;
    -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v18);

  }
  else
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost getLastUpdatedCallDirectoryInfoWithReply:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("query-identification-entries"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v17);

  }
}

void __64__CXCallDirectoryHost_getLastUpdatedCallDirectoryInfoWithReply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedLastUpdatedInfoWithCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a3 cacheOnly:(BOOL)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  CXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "phoneNumbers %@", buf, 0xCu);
  }

  if (-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("query-identification-entries")))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __102__CXCallDirectoryHost_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_reply___block_invoke;
    v23[3] = &unk_1E4B88BA8;
    v23[4] = self;
    v24 = v8;
    v26 = a4;
    v25 = v9;
    -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v23);

  }
  else
  {
    CXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:reply:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("query-identification-entries"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v22);

  }
}

void __102__CXCallDirectoryHost_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedFirstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)fetchLiveBlockingInfoForHandle:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "blockingInfoFor handle=%@", buf, 0xCu);
  }

  if (-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("query-identification-entries")))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__CXCallDirectoryHost_fetchLiveBlockingInfoForHandle_reply___block_invoke;
    v21[3] = &unk_1E4B88B58;
    v21[4] = self;
    v22 = v6;
    v23 = v7;
    -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v21);

  }
  else
  {
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:reply:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("query-identification-entries"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v20);

  }
}

void __60__CXCallDirectoryHost_fetchLiveBlockingInfoForHandle_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedLiveBlockingInfoFor:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("query-identification-entries")))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87__CXCallDirectoryHost_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_reply___block_invoke;
    v20[3] = &unk_1E4B88B58;
    v20[4] = self;
    v21 = v6;
    v22 = v7;
    -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v20);

  }
  else
  {
    CXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:reply:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("query-identification-entries"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v19);

  }
}

void __87__CXCallDirectoryHost_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedFirstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getExtensionsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  if (-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("query-extension-priorities")))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__CXCallDirectoryHost_getExtensionsWithReply___block_invoke;
    v18[3] = &unk_1E4B88B30;
    v18[4] = self;
    v19 = v4;
    -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v18);

  }
  else
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost getExtensionsWithReply:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("query-extension-priorities"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v17);

  }
}

void __46__CXCallDirectoryHost_getExtensionsWithReply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedExtensionsWithCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setPrioritizedExtensionIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "prioritizedExtensionIdentifiers %@", buf, 0xCu);
  }

  if (-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("modify-extension-priorities")))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__CXCallDirectoryHost_setPrioritizedExtensionIdentifiers_reply___block_invoke;
    v21[3] = &unk_1E4B88B58;
    v21[4] = self;
    v22 = v6;
    v23 = v7;
    -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v21);

  }
  else
  {
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost setPrioritizedExtensionIdentifiers:reply:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("modify-extension-priorities"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v20);

  }
}

void __64__CXCallDirectoryHost_setPrioritizedExtensionIdentifiers_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedToSetPrioritizedExtensionIdentifiers:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)synchronizeExtensionsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  if (-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("synchronize-extensions")))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__CXCallDirectoryHost_synchronizeExtensionsWithReply___block_invoke;
    v18[3] = &unk_1E4B88B30;
    v18[4] = self;
    v19 = v4;
    -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v18);

  }
  else
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost synchronizeExtensionsWithReply:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("synchronize-extensions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v17);

  }
}

void __54__CXCallDirectoryHost_synchronizeExtensionsWithReply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedToSynchronizeExtensionsWithCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)compactStoreWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  if (-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("compact-store")))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45__CXCallDirectoryHost_compactStoreWithReply___block_invoke;
    v18[3] = &unk_1E4B88B30;
    v18[4] = self;
    v19 = v4;
    -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v18);

  }
  else
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost compactStoreWithReply:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("compact-store"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v17);

  }
}

void __45__CXCallDirectoryHost_compactStoreWithReply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedToCompactStoreWithCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)cleanUpLiveLookupDataWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "cleanUpLiveLookupDataWithReply", buf, 2u);
  }

  if (-[CXCallDirectoryHost _connectionContainsCallDirectoryHostEntitlementCapability:](self, "_connectionContainsCallDirectoryHostEntitlementCapability:", CFSTR("compact-store")))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__CXCallDirectoryHost_cleanUpLiveLookupDataWithReply___block_invoke;
    v18[3] = &unk_1E4B88B30;
    v18[4] = self;
    v19 = v4;
    -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v18);

  }
  else
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryHost compactStoreWithReply:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requestor does not contain entitlement capability '%@' in call directory host entitlement capabilities list"), CFSTR("compact-store"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cx_callDirectoryManagerErrorWithCode:userInfo:", 100, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v17);

  }
}

uint64_t __54__CXCallDirectoryHost_cleanUpLiveLookupDataWithReply___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHostRequestedToCleanupLiveLookupData:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)launchCallDirectorySettingsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CXCallDirectoryHost_launchCallDirectorySettingsWithReply___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v7);

}

void __60__CXCallDirectoryHost_launchCallDirectorySettingsWithReply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedToLaunchCallDirectorySettingsWithCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)prepareStoreIfNecessary
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__CXCallDirectoryHost_prepareStoreIfNecessary__block_invoke;
  v2[3] = &unk_1E4B88AE8;
  v2[4] = self;
  -[CXCallDirectoryHost performDelegateCallback:](self, "performDelegateCallback:", v2);
}

void __46__CXCallDirectoryHost_prepareStoreIfNecessary__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryHost:requestedToPrepareStoreWithCompletionHandler:", *(_QWORD *)(a1 + 32), 0);

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_connectionContainsCallDirectoryHostEntitlementCapability:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 138412802;
  v6 = a1;
  v7 = 2112;
  v8 = CFSTR("com.apple.CallKit.call-directory");
  v9 = 2112;
  v10 = (id)objc_opt_class();
  v4 = v10;
  _os_log_error_impl(&dword_1A402D000, a3, OS_LOG_TYPE_ERROR, "XPC connection %@ contains entitlement '%@' but it is of unexpected class %@, should be NSArray", (uint8_t *)&v5, 0x20u);

}

void __59__CXCallDirectoryHost_reloadExtensionWithIdentifier_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1A402D000, v0, v1, "No extension returned with identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__CXCallDirectoryHost_resetLiveLookupExtensionWithIdentifier_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A402D000, v1, v2, "No extension returned with identifier %@ error %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)setEnabled:(uint64_t)a1 forLiveLookupExtensionWithIdentifier:reply:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A402D000, v1, v2, "Error locating extension with identifier %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)setEnabled:(uint64_t)a3 forLiveLookupExtensionWithIdentifier:(uint64_t)a4 reply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Requestor does not contain entitlement capability '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __61__CXCallDirectoryHost__nsExtensionWithIdentifier_completion___block_invoke_cold_1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1A402D000, v1, OS_LOG_TYPE_ERROR, "No extension found with identifier %@ containingAppPID %d", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)getLastUpdatedCallDirectoryInfoWithReply:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Requester does not contain entititlement capability '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(uint64_t)a3 cacheOnly:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Requestor does not contain entitlement capability '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getExtensionsWithReply:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Requestor does not contain entitlement capability '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setPrioritizedExtensionIdentifiers:(uint64_t)a3 reply:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Requestor does not contain entitlement capability '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)synchronizeExtensionsWithReply:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Requestor does not contain entitlement capability '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)compactStoreWithReply:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Requestor does not contain entitlement capability '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
