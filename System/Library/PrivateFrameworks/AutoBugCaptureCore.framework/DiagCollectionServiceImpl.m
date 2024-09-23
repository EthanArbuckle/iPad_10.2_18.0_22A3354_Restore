@implementation DiagCollectionServiceImpl

- (DiagCollectionServiceImpl)initWithQueue:(id)a3
{
  id v5;
  DiagCollectionServiceImpl *v6;
  DiagCollectionServiceImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DiagCollectionServiceImpl;
  v6 = -[DiagCollectionServiceImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->queue, a3);

  return v7;
}

- (void)collectPayloadsWithIdentifier:(id)a3 diagnosticExtensions:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  -[DiagCollectionServiceImpl collectPayloadsWithIdentifier:diagnosticExtensionsWithParameters:reply:](self, "collectPayloadsWithIdentifier:diagnosticExtensionsWithParameters:reply:", v7, v10, v9);
}

- (void)collectPayloadsWithIdentifier:(id)a3 diagnosticExtensionsWithParameters:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  DiagCollectionServiceImpl *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__DiagCollectionServiceImpl_collectPayloadsWithIdentifier_diagnosticExtensionsWithParameters_reply___block_invoke;
  v15[3] = &unk_1EA3B5AC8;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

void __100__DiagCollectionServiceImpl_collectPayloadsWithIdentifier_diagnosticExtensionsWithParameters_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  xpcLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "DiagCollectionService: collectPayloadsForDiagnosticExtensions:%@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "diagnosticExtensionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__DiagCollectionServiceImpl_collectPayloadsWithIdentifier_diagnosticExtensionsWithParameters_reply___block_invoke_4;
  v9[3] = &unk_1EA3B59A0;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v8;
  objc_msgSend(v4, "collectDEPayloadsWithIdentifier:diagnosticExtensionsWithParameters:queue:reply:", v7, v5, v6, v9);

}

void __100__DiagCollectionServiceImpl_collectPayloadsWithIdentifier_diagnosticExtensionsWithParameters_reply___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int *v15;
  char *v16;
  int v17;
  id v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  xpcLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v17 = 138412290;
    v18 = v3;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "DiagCollectionService: collected DE payloads:%@", (uint8_t *)&v17, 0xCu);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "diagnosticExtensionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destinationRootDirectory");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "UTF8String");
    v7 = (void *)sandbox_extension_issue_file();

    xpcLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "diagnosticExtensionController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "destinationRootDirectory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "DiagCollectionService: Issued RW sandbox extension for: %@", (uint8_t *)&v17, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      free(v7);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "diagnosticExtensionController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "destinationRootDirectory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = __error();
        v16 = strerror(*v15);
        v17 = 138412546;
        v18 = v14;
        v19 = 2080;
        v20 = v16;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "DiagCollectionService: Failed to issue RW sandbox extension for: %@ due to error: %s", (uint8_t *)&v17, 0x16u);

      }
      v12 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (BOOL)assertEntitlement:(id)a3 entitlement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "valueForEntitlement:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    xpcLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12[0] = 67109378;
      v12[1] = objc_msgSend(v5, "processIdentifier");
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "DiagCollectionService: connection %d is missing entitlement %@", (uint8_t *)v12, 0x12u);
    }

    v9 = 0;
  }

  return v9;
}

- (void)shutdown
{
  DiagnosticExtensionController *deController;

  deController = self->deController;
  self->deController = 0;

}

- (id)diagnosticExtensionController
{
  DiagnosticExtensionController *deController;
  void *v4;
  NSObject *v5;
  DiagnosticExtensionController *v6;
  DiagnosticExtensionController *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  deController = self->deController;
  if (!deController)
  {
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    xpcLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "DiagCollectionService: creating DiagnosticExtensionsController with destination %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = -[DiagnosticExtensionController initWithDestinationDirectory:]([DiagnosticExtensionController alloc], "initWithDestinationDirectory:", v4);
    v7 = self->deController;
    self->deController = v6;

    deController = self->deController;
  }
  return deController;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[DiagCollectionServiceImpl assertEntitlement:entitlement:](self, "assertEntitlement:entitlement:", v5, CFSTR("com.apple.symptom_diagnostics.collect"));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F031BD18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v7);

    objc_msgSend(v5, "setExportedObject:", self);
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exportedInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_collectPayloadsWithIdentifier_diagnosticExtensions_reply_, 0, 1);

    objc_msgSend(v5, "resume");
  }
  else
  {
    xpcLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "DiagCollectionService: connection (%@) lacks proper entitlements", buf, 0xCu);
    }
  }

  return v6;
}

- (ABCAdministrator)administrator
{
  return (ABCAdministrator *)objc_loadWeakRetained((id *)&self->_administrator);
}

- (void)setAdministrator:(id)a3
{
  objc_storeWeak((id *)&self->_administrator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_administrator);
  objc_storeStrong((id *)&self->deController, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end
