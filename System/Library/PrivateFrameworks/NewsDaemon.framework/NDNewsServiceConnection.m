@implementation NDNewsServiceConnection

- (NDNewsServiceConnection)initWithClient:(id)a3
{
  id v4;
  NDNewsServiceConnection *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  objc_super v10;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsServiceConnection initWithClient:].cold.1();
  v10.receiver = self;
  v10.super_class = (Class)NDNewsServiceConnection;
  v5 = -[NDNewsServiceConnection init](&v10, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.newsdaemon.accessQueue", v6);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_client, v4);
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NDNewsServiceConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)NDNewsServiceConnection;
  -[NDNewsServiceConnection dealloc](&v4, sel_dealloc);
}

- (void)serviceHasNewTodayResults
{
  id v2;

  -[NDNewsServiceConnection client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceHasNewTodayResults");

}

- (void)fetchModuleDescriptorsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsServiceConnection fetchModuleDescriptorsWithCompletion:].cold.1();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__NDNewsServiceConnection_fetchModuleDescriptorsWithCompletion___block_invoke;
  v6[3] = &unk_1E9BD9EB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NDNewsServiceConnection _establishConnectionIfNeededWithCompletion:](self, "_establishConnectionIfNeededWithCompletion:", v6);

}

void __64__NDNewsServiceConnection_fetchModuleDescriptorsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NDSharedClientLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[NDNewsServiceConnection fetchModuleDescriptorsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1D7105000, v2, OS_LOG_TYPE_INFO, "Calling %s on daemon", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__NDNewsServiceConnection_fetchModuleDescriptorsWithCompletion___block_invoke_60;
  v5[3] = &unk_1E9BD9E88;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fetchModuleDescriptorsWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __64__NDNewsServiceConnection_fetchModuleDescriptorsWithCompletion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLatestResultsWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsServiceConnection fetchLatestResultsWithParameters:completion:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsServiceConnection fetchLatestResultsWithParameters:completion:].cold.1();
LABEL_6:
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__NDNewsServiceConnection_fetchLatestResultsWithParameters_completion___block_invoke;
  v10[3] = &unk_1E9BD9ED8;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[NDNewsServiceConnection _establishConnectionIfNeededWithCompletion:](self, "_establishConnectionIfNeededWithCompletion:", v10);

}

void __71__NDNewsServiceConnection_fetchLatestResultsWithParameters_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NDSharedClientLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[NDNewsServiceConnection fetchLatestResultsWithParameters:completion:]_block_invoke";
    _os_log_impl(&dword_1D7105000, v2, OS_LOG_TYPE_INFO, "Calling %s on daemon", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__NDNewsServiceConnection_fetchLatestResultsWithParameters_completion___block_invoke_64;
  v5[3] = &unk_1E9BD9E88;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fetchLatestResultsWithParameters:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __71__NDNewsServiceConnection_fetchLatestResultsWithParameters_completion___block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)markAnalyticsElements:(id)a3 asSeenAtDate:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsServiceConnection markAnalyticsElements:asSeenAtDate:withCompletion:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsServiceConnection markAnalyticsElements:asSeenAtDate:withCompletion:].cold.1();
LABEL_6:
  if (objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__NDNewsServiceConnection_markAnalyticsElements_asSeenAtDate_withCompletion___block_invoke;
    v11[3] = &unk_1E9BD9F00;
    v11[4] = self;
    v14 = v10;
    v12 = v8;
    v13 = v9;
    -[NDNewsServiceConnection _establishConnectionIfNeededWithCompletion:](self, "_establishConnectionIfNeededWithCompletion:", v11);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __77__NDNewsServiceConnection_markAnalyticsElements_asSeenAtDate_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  const void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NDSharedClientLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[NDNewsServiceConnection markAnalyticsElements:asSeenAtDate:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1D7105000, v2, OS_LOG_TYPE_INFO, "Calling %s on daemon", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_3;
  v6 = _Block_copy(v5);
  objc_msgSend(v4, "markAnalyticsElements:asSeenAtDate:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);

}

- (void)markAnalyticsElement:(id)a3 asReadAtDate:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsServiceConnection markAnalyticsElement:asReadAtDate:withCompletion:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsServiceConnection markAnalyticsElement:asReadAtDate:withCompletion:].cold.1();
LABEL_6:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__NDNewsServiceConnection_markAnalyticsElement_asReadAtDate_withCompletion___block_invoke;
  v14[3] = &unk_1E9BD9F00;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[NDNewsServiceConnection _establishConnectionIfNeededWithCompletion:](self, "_establishConnectionIfNeededWithCompletion:", v14);

}

void __76__NDNewsServiceConnection_markAnalyticsElement_asReadAtDate_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 56))
    v3 = *(const void **)(a1 + 56);
  else
    v3 = &__block_literal_global_69;
  v4 = _Block_copy(v3);
  objc_msgSend(v5, "markAnalyticsElement:asReadAtDate:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);

}

- (void)fetchPlaceholderResultsWithOperationInfo:(id)a3 syncCompletion:(id)a4
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
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsServiceConnection fetchPlaceholderResultsWithOperationInfo:syncCompletion:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsServiceConnection fetchPlaceholderResultsWithOperationInfo:syncCompletion:].cold.1();
LABEL_6:
  -[NDNewsServiceConnection accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke;
  block[3] = &unk_1E9BD9ED8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

void __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke_2;
  v3[3] = &unk_1E9BD9ED8;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_unsafeEstablishConnectionIfNeededWithCompletion:", v3);

}

void __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke_3;
  v4[3] = &unk_1E9BD9E88;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fetchPlaceholderResultsWithOperationInfo:syncCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_establishConnectionIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NDNewsServiceConnection accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__NDNewsServiceConnection__establishConnectionIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_1E9BD9EB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __70__NDNewsServiceConnection__establishConnectionIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsafeEstablishConnectionIfNeededWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_unsafeEstablishConnectionIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NDNewsServiceConnectionClientProxy *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  NDNewsServiceConnection *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsServiceConnection _unsafeEstablishConnectionIfNeededWithCompletion:].cold.1();
  NDSharedClientLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[NDNewsServiceConnection _unsafeEstablishConnectionIfNeededWithCompletion:]";
    _os_log_impl(&dword_1D7105000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[NDNewsServiceConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
  {
    ++_unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.newsd.today"), 0);
    NDSharedClientLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v30 = (const char *)_unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
      _os_log_impl(&dword_1D7105000, v9, OS_LOG_TYPE_INFO, "Created connection %ld to newsd for NewsToday mach service", buf, 0xCu);
    }

    -[NSObject setInterruptionHandler:](v8, "setInterruptionHandler:", &__block_literal_global_73);
    objc_initWeak((id *)buf, self);
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke_74;
    v26 = &unk_1E9BD9F90;
    v27 = self;
    objc_copyWeak(&v28, (id *)buf);
    -[NSObject setInvalidationHandler:](v8, "setInvalidationHandler:", &v23);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00AEA68);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v10);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00AE900);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setExportedInterface:](v8, "setExportedInterface:", v11);

    -[NSObject remoteObjectInterface](v8, "remoteObjectInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0, v23, v24, v25, v26, v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_fetchLatestResultsWithParameters_completion_, 1, 1);

    -[NSObject remoteObjectInterface](v8, "remoteObjectInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_fetchLatestResultsWithParameters_completion_, 2, 1);

    -[NSObject remoteObjectInterface](v8, "remoteObjectInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_fetchModuleDescriptorsWithCompletion_, 0, 1);

    v22 = objc_alloc_init(NDNewsServiceConnectionClientProxy);
    -[NDNewsServiceConnectionClientProxy setClient:](v22, "setClient:", self);
    -[NSObject setExportedObject:](v8, "setExportedObject:", v22);
    -[NSObject resume](v8, "resume");
    -[NDNewsServiceConnection setConnection:](self, "setConnection:", v8);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    NDSharedClientLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v30 = (const char *)_unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
      _os_log_impl(&dword_1D7105000, v8, OS_LOG_TYPE_INFO, "Reusing connection %ld", buf, 0xCu);
    }
  }

  if (v4)
    v4[2](v4);

}

void __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke()
{
  NSObject *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  NDSharedClientLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 134217984;
    v2 = _unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
    _os_log_impl(&dword_1D7105000, v0, OS_LOG_TYPE_INFO, "Connection %ld was interrupted", (uint8_t *)&v1, 0xCu);
  }

}

void __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke_74(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NDSharedClientLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = _unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
    _os_log_impl(&dword_1D7105000, v2, OS_LOG_TYPE_INFO, "Connection %ld was invalidated", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke_75;
  block[3] = &unk_1E9BD9F68;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke_75(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NDNewsService)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (NDNewsServiceClient)client
{
  return (NDNewsServiceClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithClient:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"client", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchModuleDescriptorsWithCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchLatestResultsWithParameters:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchLatestResultsWithParameters:completion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"parameters", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)markAnalyticsElements:asSeenAtDate:withCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)markAnalyticsElements:asSeenAtDate:withCompletion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headlineAnalyticsElements", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)markAnalyticsElement:asReadAtDate:withCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)markAnalyticsElement:asReadAtDate:withCompletion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElement", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPlaceholderResultsWithOperationInfo:syncCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"syncCompletion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPlaceholderResultsWithOperationInfo:syncCompletion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_unsafeEstablishConnectionIfNeededWithCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
