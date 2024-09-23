@implementation FPDXPCDomainServicer

- (void)startExtendingLifetime
{
  OS_os_transaction *v3;
  OS_os_transaction *serviceTransaction;
  void *v6;
  id v7;

  if (self->_isALifetimerExtender)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDXPCDomainServicer.m"), 214, CFSTR("it's unsupported to call -_startAccessingProviderEndpointForProtocolName:itemURL:completionHandler: twice"));

  }
  -[FPDXPCDomainServicer _registerLifetimeExtension](self, "_registerLifetimeExtension");
  -[FPDXPCDomainServicer description](self, "description");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  v3 = (OS_os_transaction *)os_transaction_create();
  serviceTransaction = self->_serviceTransaction;
  self->_serviceTransaction = v3;

}

- (FPDExtensionSession)sessionOrNil
{
  void *v2;
  void *v3;

  -[FPDXPCDomainServicer domainOrNil:](self, "domainOrNil:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FPDExtensionSession *)v3;
}

- (id)providerOrNilWithReason:(unint64_t *)a3
{
  FPDXPCDomainServicer *v4;
  FPDProvider *v5;
  FPDProvider *v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  FPDProvider *provider;
  FPDProvider *v13;

  v4 = self;
  objc_sync_enter(v4);
  -[FPDXPCDomainServicer __providerIfExists](v4, "__providerIfExists");
  v5 = (FPDProvider *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v4->_server);

    if (WeakRetained)
    {
      v8 = objc_loadWeakRetained((id *)&v4->_server);
      objc_msgSend(v8, "extensionManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString fp_toProviderID](v4->_providerDomainID, "fp_toProviderID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "providerWithIdentifier:reason:", v10, a3);
      v11 = objc_claimAutoreleasedReturnValue();
      provider = v4->__provider;
      v4->__provider = (FPDProvider *)v11;

    }
    if (v4->_isALifetimerExtender)
      -[FPDXPCDomainServicer _registerLifetimeExtension](v4, "_registerLifetimeExtension");
    v6 = v4->__provider;
  }
  v13 = v6;

  objc_sync_exit(v4);
  return v13;
}

- (NSString)providerDomainID
{
  return self->_providerDomainID;
}

- (int)pid
{
  return -[FPDXPCDomainServicerLifetimeExtender requestEffectivePID](self->_lifetimeExtender, "requestEffectivePID");
}

- (void)invalidate
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] invalidating %@", (uint8_t *)&v2, 0xCu);
}

- (FPDXPCDomainServicer)initWithServer:(id)a3 providerDomainID:(id)a4 domain:(id)a5 connection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FPDXPCDomainServicer *v14;
  FPDXPCDomainServicer *v15;
  void *v16;
  void *v17;
  OS_os_log *v18;
  OS_os_log *log;
  uint64_t v20;
  OS_os_log *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *requestQueue;
  uint64_t v25;
  FPDXPCDomainServicerLifetimeExtender *lifetimeExtender;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)FPDXPCDomainServicer;
  v14 = -[FPDXPCDomainServicer init](&v31, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_server, v10);
    objc_storeStrong((id *)&v15->_providerDomainID, a4);
    objc_storeWeak((id *)&v15->_domain, v12);
    objc_msgSend(v12, "log");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
      log = v15->_log;
      v15->_log = v18;
    }
    else
    {
      objc_msgSend(v11, "fp_obfuscatedProviderDomainID");
      log = (OS_os_log *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[OS_os_log UTF8String](log, "UTF8String");
      fpfs_create_log_for_provider();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v15->_log;
      v15->_log = (OS_os_log *)v20;

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("FPDXPCDomainServicer request queue", v22);
    requestQueue = v15->_requestQueue;
    v15->_requestQueue = (OS_dispatch_queue *)v23;

    objc_storeWeak((id *)&v15->_connection, v13);
    v25 = objc_opt_new();
    lifetimeExtender = v15->_lifetimeExtender;
    v15->_lifetimeExtender = (FPDXPCDomainServicerLifetimeExtender *)v25;

    -[FPDXPCDomainServicerLifetimeExtender setRequestEffectivePID:](v15->_lifetimeExtender, "setRequestEffectivePID:", objc_msgSend(v13, "processIdentifier"));
    v27 = (void *)MEMORY[0x1E0CB3940];
    FPExecutableNameForProcessIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("servicer for %@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDXPCDomainServicerLifetimeExtender setPrettyDescription:](v15->_lifetimeExtender, "setPrettyDescription:", v29);

  }
  return v15;
}

- (id)domainOrNil:(unint64_t *)a3
{
  FPDXPCDomainServicer *v4;
  id WeakRetained;
  void *v6;
  FPDXPCDomainServicer *v7;
  void *v8;

  v4 = self;
  objc_sync_enter(v4);
  WeakRetained = objc_loadWeakRetained((id *)&v4->_domain);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&v4->_domain);
    objc_sync_exit(v4);
  }
  else
  {
    objc_sync_exit(v4);

    -[FPDXPCDomainServicer providerOrNilWithReason:](v4, "providerOrNilWithReason:", a3);
    v7 = (FPDXPCDomainServicer *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSString fp_toDomainIdentifier](v4->_providerDomainID, "fp_toDomainIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDXPCDomainServicer domainForIdentifier:reason:](v7, "domainForIdentifier:reason:", v8, a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    v4 = v7;
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSString fp_obfuscatedProviderDomainID](self->_providerDomainID, "fp_obfuscatedProviderDomainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDXPCDomainServicer pid](self, "pid");
  FPExecutableNameForProcessIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p:%@> for %@[%d]"), v4, self, v5, v6, -[FPDXPCDomainServicer pid](self, "pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[FPDXPCDomainServicer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FPDXPCDomainServicer;
  -[FPDXPCDomainServicer dealloc](&v3, sel_dealloc);
}

- (void)_unregisterLifetimeExtension
{
  void *v3;
  id v4;

  if (self->_isALifetimerExtender)
  {
    self->_isALifetimerExtender = 0;
    -[FPDXPCDomainServicer sessionOrNil](self, "sessionOrNil");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, "asyncUnregisterLifetimeExtensionForObject:", self->_lifetimeExtender);
      v3 = v4;
    }

  }
}

- (void)_registerLifetimeExtension
{
  void *v3;

  -[FPDXPCDomainServicer sessionOrNil](self, "sessionOrNil");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerLifetimeExtensionForObject:", self->_lifetimeExtender);

  self->_isALifetimerExtender = 1;
}

- (id)__providerIfExists
{
  FPDXPCDomainServicer *v2;
  FPDProvider *provider;
  FPDProvider *v4;

  v2 = self;
  objc_sync_enter(v2);
  provider = v2->__provider;
  if (provider && !-[FPDProvider invalidated](provider, "invalidated"))
    v4 = v2->__provider;
  else
    v4 = 0;
  objc_sync_exit(v2);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadProxy, 0);
  objc_storeStrong((id *)&self->_uploadProxy, 0);
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_serviceTransaction, 0);
  objc_storeStrong((id *)&self->_lifetimeExtender, 0);
  objc_storeStrong(&self->_activePresenterObservation, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->__provider, 0);
  objc_destroyWeak((id *)&self->_server);
}

- (id)newFileProviderProxy
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[FPDXPCDomainServicer sessionOrNil](self, "sessionOrNil");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "newFileProviderProxyWithTimeout:pid:", -[FPDXPCDomainServicer pid](self, "pid"), 180.0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CAACE8]);
    FPProviderNotFoundError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (not found)"), self->_providerDomainID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1EFBBB940, v6, v7, -[FPDXPCDomainServicer pid](self, "pid"));

  }
  return v4;
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *requestQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  v9 = a5;
  -[NSString fp_toDomainIdentifier](self->_providerDomainID, "fp_toDomainIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__FPDXPCDomainServicer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke;
  block[3] = &unk_1E8C75558;
  block[4] = self;
  v16 = v8;
  v18 = v9;
  v19 = a4;
  v17 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(requestQueue, block);

}

void __106__FPDXPCDomainServicer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newFileProviderProxy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__FPDXPCDomainServicer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2;
  v6[3] = &unk_1E8C75530;
  v3 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "deleteSearchableItemsWithSpotlightDomainIdentifiers:domainIdentifier:indexReason:completionHandler:", v3, v4, v5, v6);

}

void __106__FPDXPCDomainServicer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer deleteSearchableItemsWithSpotlightDomainIdentifiers:indexReason:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)didChangeItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v10 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_235;
    v6[3] = &unk_1E8C75530;
    v6[4] = *(_QWORD *)(a1 + 32);
    v5 = &v7;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v2, "didChangeItemID:request:completionHandler:", v3, v4, v6);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_2;
    v8[3] = &unk_1E8C75530;
    v8[4] = *(_QWORD *)(a1 + 32);
    v5 = &v9;
    v9 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_2((uint64_t)v8, v4);
  }

}

void __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer didChangeItemID:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_235(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer didChangeItemID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)resolveItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_236;
    v8[3] = &unk_1E8C755A8;
    v8[4] = *(_QWORD *)(a1 + 32);
    v7 = &v9;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v5, 0, 1, 0, v6, v8);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_2;
    v10[3] = &unk_1E8C75530;
    v10[4] = *(_QWORD *)(a1 + 32);
    v7 = &v11;
    v11 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_2((uint64_t)v10, v4);
  }

}

void __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer resolveItemID:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_236(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  fpfs_adopt_log();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = FPPopLogSectionForBlock();
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2080;
    v22 = "-[FPDXPCDomainServicer resolveItemID:completionHandler:]_block_invoke";
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v7);

  __fp_pop_log();
}

- (void)setDomainEjectable:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *requestQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke;
  block[3] = &unk_1E8C755D0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync(requestQueue, block);

}

void __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "providerOrNilWithReason:", &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "providerDomainID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fp_toDomainIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_238;
    v9[3] = &unk_1E8C75530;
    v6 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v7 = &v10;
    v10 = v6;
    objc_msgSend(v2, "setEjectable:forDomainIdentifier:completionHandler:", v3, v5, v9);

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_2;
    v11[3] = &unk_1E8C75530;
    v8 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v7 = &v12;
    v12 = v8;
    FPProviderNotFoundError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_2((uint64_t)v11, v4);
  }

}

void __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer setDomainEjectable:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_238(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "signalProviderChanges");

  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2080;
    v14 = "-[FPDXPCDomainServicer setDomainEjectable:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)ingestFromCacheItemWithIdentifier:(id)a3 requestedFields:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *requestQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke;
  block[3] = &unk_1E8C755F8;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_sync(requestQueue, block);

}

void __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v24);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x1E0CAAC70]);
      objc_msgSend(v3, "providerDomainID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithProviderDomainID:itemIdentifier:", v7, *(_QWORD *)(a1 + 40));

      objc_msgSend(v3, "defaultBackend");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 56);
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_242;
      v19[3] = &unk_1E8C75530;
      v19[4] = *(_QWORD *)(a1 + 32);
      v20 = *(id *)(a1 + 48);
      objc_msgSend(v9, "ingestFromCacheItemWithID:requestedFields:request:completionHandler:", v8, v10, v11, v19);

    }
    else
    {
      fpfs_adopt_log();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v16 = FPPopLogSectionForBlock();
        v17 = *(_QWORD *)(a1 + 32);
        FPNotSupportedError();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v26 = v16;
        v27 = 2112;
        v28 = v17;
        v29 = 2080;
        v30 = "-[FPDXPCDomainServicer ingestFromCacheItemWithIdentifier:requestedFields:completionHandler:]_block_invoke";
        v31 = 2112;
        v32 = v18;
        _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      v14 = *(_QWORD *)(a1 + 48);
      FPNotSupportedError();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

      __fp_pop_log();
    }
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2;
    v22[3] = &unk_1E8C75530;
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2((uint64_t)v22, v12);

  }
}

void __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer ingestFromCacheItemWithIdentifier:requestedFields:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_242(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer ingestFromCacheItemWithIdentifier:requestedFields:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)reimportItemsBelowItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CAAC70]);
    objc_msgSend(v2, "providerDomainID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithProviderDomainID:itemIdentifier:", v4, *(_QWORD *)(a1 + 40));

    objc_msgSend(v2, "defaultBackend");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_243;
    v8[3] = &unk_1E8C75530;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "reimportItemsBelowItemWithID:markItemDataless:completionHandler:", v5, 0, v8);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2;
    v10[3] = &unk_1E8C75530;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2((uint64_t)v10, v7);

  }
}

void __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer reimportItemsBelowItemWithIdentifier:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_243(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer reimportItemsBelowItemWithIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)evictItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CAAC70]);
    objc_msgSend(v2, "providerDomainID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithProviderDomainID:itemIdentifier:", v4, *(_QWORD *)(a1 + 40));

    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProviderInitiated:", 1);
    objc_msgSend(v2, "defaultBackend");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_244;
    v9[3] = &unk_1E8C75530;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v7, "evictItemWithID:evictionReason:request:completionHandler:", v5, 4, v6, v9);

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_2;
    v11[3] = &unk_1E8C75530;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_2((uint64_t)v11, v8);

  }
}

void __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer evictItemWithIdentifier:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_244(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer evictItemWithIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)materializeItemWithIdentifier:(id)a3 requestedRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSObject *requestQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  NSUInteger v17;
  NSUInteger v18;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke;
  block[3] = &unk_1E8C75620;
  v16 = v10;
  v17 = location;
  v18 = length;
  block[4] = self;
  v15 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_sync(requestQueue, block);

}

void __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (*(_QWORD *)(a1 + 56) == 0x7FFFFFFFFFFFFFFFLL || (fpfs_supports_partial_materialization() & 1) != 0)
    {
      v3 = objc_alloc(MEMORY[0x1E0CAAC70]);
      objc_msgSend(v2, "providerDomainID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v3, "initWithProviderDomainID:itemIdentifier:", v4, *(_QWORD *)(a1 + 40));

      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProviderInitiated:", 1);
      objc_msgSend(v2, "defaultBackend");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_245;
      v15[3] = &unk_1E8C75530;
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = *(id *)(a1 + 48);
      objc_msgSend(v7, "materializeItemWithID:requestedRange:request:completionHandler:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6, v15);

    }
    else
    {
      fpfs_adopt_log();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v12 = FPPopLogSectionForBlock();
        v13 = *(_QWORD *)(a1 + 32);
        FPNotSupportedError();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v22 = v12;
        v23 = 2112;
        v24 = v13;
        v25 = 2080;
        v26 = "-[FPDXPCDomainServicer materializeItemWithIdentifier:requestedRange:completionHandler:]_block_invoke";
        v27 = 2112;
        v28 = v14;
        _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      v10 = *(_QWORD *)(a1 + 48);
      FPNotSupportedError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

      __fp_pop_log();
    }
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_2;
    v18[3] = &unk_1E8C75530;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_2((uint64_t)v18, v8);

  }
}

void __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer materializeItemWithIdentifier:requestedRange:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_245(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer materializeItemWithIdentifier:requestedRange:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *requestQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke;
  block[3] = &unk_1E8C755F8;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_sync(requestQueue, block);

}

void __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_246;
    v8[3] = &unk_1E8C75648;
    v5 = *(_QWORD *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v6 = &v9;
    v7 = *(_QWORD *)(a1 + 56);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "enumerateMaterializedSetFromSyncAnchor:suggestedBatchSize:completionHandler:", v5, v7, v8);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2;
    v10[3] = &unk_1E8C75530;
    v10[4] = *(_QWORD *)(a1 + 32);
    v6 = &v11;
    v11 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2((uint64_t)v10, v4);
  }

}

void __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134220034;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer enumerateMaterializedSetFromSyncAnchor:suggestedBatchSize:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = MEMORY[0x1E0C9AA60];
    v16 = 2112;
    v17 = MEMORY[0x1E0C9AA60];
    v18 = 1024;
    v19 = 0;
    v20 = 2112;
    v21 = 0;
    v22 = 2112;
    v23 = 0;
    v24 = 2112;
    v25 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %{BOOL}d, %@, %@, %@", buf, 0x58u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_246(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  fpfs_adopt_log();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = FPPopLogSectionForBlock();
    v20 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134220034;
    v23 = v19;
    v24 = 2112;
    v25 = v20;
    v26 = 2080;
    v27 = "-[FPDXPCDomainServicer enumerateMaterializedSetFromSyncAnchor:suggestedBatchSize:completionHandler:]_block_invoke";
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v14;
    v32 = 1024;
    v33 = a4;
    v34 = 2112;
    v35 = v15;
    v36 = 2112;
    v37 = v16;
    v38 = 2112;
    v39 = v17;
    _os_log_debug_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %{BOOL}d, %@, %@, %@", buf, 0x58u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke;
  block[3] = &unk_1E8C75698;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(requestQueue, block);

}

void __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_248;
    v8[3] = &unk_1E8C75670;
    v5 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v6 = &v9;
    v9 = v5;
    objc_msgSend(v4, "currentMaterializedSetSyncAnchorWithCompletionHandler:", v8);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E8C75530;
    v7 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v6 = &v11;
    v11 = v7;
    FPProviderNotFoundError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2((uint64_t)v10, v4);
  }

}

void __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  fpfs_adopt_log();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock();
    __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_248(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer currentMaterializedSetSyncAnchorWithCompletionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *requestQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke;
  block[3] = &unk_1E8C755F8;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_sync(requestQueue, block);

}

void __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_250;
    v8[3] = &unk_1E8C756C0;
    v5 = *(_QWORD *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v6 = &v9;
    v7 = *(_QWORD *)(a1 + 56);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "enumeratePendingSetFromSyncAnchor:suggestedBatchSize:completionHandler:", v5, v7, v8);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2;
    v10[3] = &unk_1E8C75530;
    v10[4] = *(_QWORD *)(a1 + 32);
    v6 = &v11;
    v11 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2((uint64_t)v10, v4);
  }

}

void __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134220546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer enumeratePendingSetFromSyncAnchor:suggestedBatchSize:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = MEMORY[0x1E0C9AA60];
    v16 = 2112;
    v17 = MEMORY[0x1E0C9AA60];
    v18 = 1024;
    v19 = 0;
    v20 = 1024;
    v21 = 0;
    v22 = 2048;
    v23 = 0;
    v24 = 2112;
    v25 = 0;
    v26 = 2112;
    v27 = 0;
    v28 = 2112;
    v29 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %{BOOL}d, %{BOOL}d, %lf, %@, %@, %@", buf, 0x68u);
  }

  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.0);
  __fp_pop_log();

}

void __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_250(uint64_t a1, void *a2, void *a3, int a4, int a5, void *a6, void *a7, void *a8, double a9)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  double v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v18 = a3;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  fpfs_adopt_log();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = FPPopLogSectionForBlock();
    v24 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134220546;
    v27 = v23;
    v28 = 2112;
    v29 = v24;
    v30 = 2080;
    v31 = "-[FPDXPCDomainServicer enumeratePendingSetFromSyncAnchor:suggestedBatchSize:completionHandler:]_block_invoke";
    v32 = 2112;
    v33 = v17;
    v34 = 2112;
    v35 = v18;
    v36 = 1024;
    v37 = a4;
    v38 = 1024;
    v39 = a5;
    v40 = 2048;
    v41 = a9;
    v42 = 2112;
    v43 = v19;
    v44 = 2112;
    v45 = v20;
    v46 = 2112;
    v47 = v21;
    _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %{BOOL}d, %{BOOL}d, %lf, %@, %@, %@", buf, 0x68u);
  }

  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a9);
  __fp_pop_log();

}

- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke;
  block[3] = &unk_1E8C75698;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(requestQueue, block);

}

void __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_252;
    v8[3] = &unk_1E8C756E8;
    v5 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v6 = &v9;
    v9 = v5;
    objc_msgSend(v4, "currentPendingSetSyncAnchorWithCompletionHandler:", v8);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E8C75530;
    v7 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v6 = &v11;
    v11 = v7;
    FPProviderNotFoundError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2((uint64_t)v10, v4);
  }

}

void __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  fpfs_adopt_log();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock();
    __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.0);
  __fp_pop_log();

}

void __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_252(uint64_t a1, int a2, void *a3, double a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  fpfs_adopt_log();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = FPPopLogSectionForBlock();
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2080;
    v17 = "-[FPDXPCDomainServicer currentPendingSetSyncAnchorWithCompletionHandler:]_block_invoke";
    v18 = 1024;
    v19 = a2;
    v20 = 2048;
    v21 = a4;
    v22 = 2112;
    v23 = v7;
    _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %lf, %@", buf, 0x3Au);
  }

  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a4);
  __fp_pop_log();

}

- (void)waitForChangesOnItemsBelowItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v21);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v3, "defaultBackend");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_256;
      v16[3] = &unk_1E8C75530;
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = *(id *)(a1 + 48);
      objc_msgSend(v6, "waitForChangesOnItemsBelowItemWithIdentifier:request:completionHandler:", v7, v8, v16);

    }
    else
    {
      fpfs_adopt_log();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v13 = FPPopLogSectionForBlock();
        v14 = *(_QWORD *)(a1 + 32);
        FPNotSupportedError();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v23 = v13;
        v24 = 2112;
        v25 = v14;
        v26 = 2080;
        v27 = "-[FPDXPCDomainServicer waitForChangesOnItemsBelowItemWithIdentifier:completionHandler:]_block_invoke";
        v28 = 2112;
        v29 = v15;
        _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      v11 = *(_QWORD *)(a1 + 48);
      FPNotSupportedError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

      __fp_pop_log();
    }
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_2;
    v19[3] = &unk_1E8C75530;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_2((uint64_t)v19, v9);

  }
}

void __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer waitForChangesOnItemsBelowItemWithIdentifier:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_256(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer waitForChangesOnItemsBelowItemWithIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)waitForStabilizationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke;
  block[3] = &unk_1E8C75698;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(requestQueue, block);

}

void __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_257;
    v9[3] = &unk_1E8C75530;
    v6 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v7 = &v10;
    v10 = v6;
    objc_msgSend(v4, "waitForStabilizationForRequest:completionHandler:", v5, v9);

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E8C75530;
    v8 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v7 = &v12;
    v12 = v8;
    FPProviderNotFoundError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_2((uint64_t)v11, v4);
  }

}

void __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer waitForStabilizationWithCompletionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_257(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer waitForStabilizationWithCompletionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)signalErrorResolved:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v16 = 0;
  objc_msgSend(a1[4], "domainOrNil:", &v16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "serialQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_258;
    block[3] = &unk_1E8C75710;
    v10 = v3;
    v5 = a1[5];
    v6 = a1[4];
    v11 = v5;
    v12 = v6;
    v13 = a1[6];
    dispatch_async(v4, block);

    v7 = v10;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2;
    v14[3] = &unk_1E8C75530;
    v14[4] = a1[4];
    v15 = a1[6];
    FPProviderNotFoundError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2((uint64_t)v14, v8);

    v7 = v15;
  }

}

void __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer signalErrorResolved:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_258(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2_261;
    v13[3] = &unk_1E8C75530;
    v5 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v4, "signalErrorResolved:completionHandler:", v5, v13);

  }
  else
  {
    fpfs_adopt_log();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = FPPopLogSectionForBlock();
      v10 = *(_QWORD *)(a1 + 48);
      FPNotSupportedError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2080;
      v20 = "-[FPDXPCDomainServicer signalErrorResolved:completionHandler:]_block_invoke";
      v21 = 2112;
      v22 = v11;
      _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v7 = *(_QWORD *)(a1 + 56);
    FPNotSupportedError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    __fp_pop_log();
  }
}

void __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2_261(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer signalErrorResolved:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)temporaryDirectoryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke;
  block[3] = &unk_1E8C75698;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(requestQueue, block);

}

void __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "volume");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v4, "temporaryDirectoryURL:error:", v3, &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v20;

    if (v5)
    {
      v19 = v6;
      objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v5, 0, &v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v19;

      fpfs_adopt_log();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = FPPopLogSectionForBlock();
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        v25 = v13;
        v26 = 2112;
        v27 = v14;
        v28 = 2080;
        v29 = "-[FPDXPCDomainServicer temporaryDirectoryWithCompletionHandler:]_block_invoke";
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v8;
        _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      __fp_pop_log();

    }
    else
    {
      fpfs_adopt_log();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v15 = FPPopLogSectionForBlock();
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        v28 = 2080;
        v29 = "-[FPDXPCDomainServicer temporaryDirectoryWithCompletionHandler:]_block_invoke";
        v30 = 2112;
        v31 = 0;
        v32 = 2112;
        v33 = v6;
        _os_log_debug_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      __fp_pop_log();

      v8 = v6;
    }

  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E8C75530;
    v10 = *(void **)(a1 + 40);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v10;
    FPProviderNotFoundError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke_2((uint64_t)v21, v11);

  }
}

void __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer temporaryDirectoryWithCompletionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)stateDirectoryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke;
  block[3] = &unk_1E8C75698;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(requestQueue, block);

}

void __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "volume");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v4, "stateDirectoryURL:error:", v3, &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v20;

    if (v5)
    {
      v19 = v6;
      objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v5, 0, &v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v19;

      fpfs_adopt_log();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = FPPopLogSectionForBlock();
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        v25 = v13;
        v26 = 2112;
        v27 = v14;
        v28 = 2080;
        v29 = "-[FPDXPCDomainServicer stateDirectoryWithCompletionHandler:]_block_invoke";
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v8;
        _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      __fp_pop_log();

    }
    else
    {
      fpfs_adopt_log();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v15 = FPPopLogSectionForBlock();
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        v28 = 2080;
        v29 = "-[FPDXPCDomainServicer stateDirectoryWithCompletionHandler:]_block_invoke";
        v30 = 2112;
        v31 = 0;
        v32 = 2112;
        v33 = v6;
        _os_log_debug_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      __fp_pop_log();

      v8 = v6;
    }

  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E8C75530;
    v10 = *(void **)(a1 + 40);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v10;
    FPProviderNotFoundError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke_2((uint64_t)v21, v11);

  }
}

void __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer stateDirectoryWithCompletionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)listAvailableTestingOperationsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E8C75698;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(requestQueue, block);

}

void __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v34 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v34);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    v45[0] = *MEMORY[0x1E0CAAEC0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(WeakRetained, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v4, 0, 2);

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v2, "nsDomain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_msgSend(v6, "testingModes") & 2) == 0;

      if (v7)
      {
        fpfs_adopt_log();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v23 = FPPopLogSectionForBlock();
          v24 = *(_QWORD *)(a1 + 32);
          FPNotSupportedError();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v36 = v23;
          v37 = 2112;
          v38 = v24;
          v39 = 2080;
          v40 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke";
          v41 = 2112;
          v42 = 0;
          v43 = 2112;
          v44 = v25;
          _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
      }
      else
      {
        objc_msgSend(v2, "defaultBackend");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_opt_respondsToSelector();

        if ((v17 & 1) != 0)
        {
          objc_msgSend(v2, "defaultBackend");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_266;
          v29[3] = &unk_1E8C75738;
          v29[4] = *(_QWORD *)(a1 + 32);
          v30 = *(id *)(a1 + 40);
          objc_msgSend(v18, "listAvailableTestingOperationsWithRequest:completionHandler:", v19, v29);

          goto LABEL_11;
        }
        fpfs_adopt_log();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v26 = FPPopLogSectionForBlock();
          v27 = *(_QWORD *)(a1 + 32);
          FPNotSupportedError();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v36 = v26;
          v37 = 2112;
          v38 = v27;
          v39 = 2080;
          v40 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke";
          v41 = 2112;
          v42 = 0;
          v43 = 2112;
          v44 = v28;
          _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
      }

      v9 = *(_QWORD *)(a1 + 40);
      FPNotSupportedError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

      __fp_pop_log();
    }
    else
    {
      fpfs_adopt_log();
      v31 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v20 = FPPopLogSectionForBlock();
        v21 = *(_QWORD *)(a1 + 32);
        FPNotPermittedError();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v36 = v20;
        v37 = 2112;
        v38 = v21;
        v39 = 2080;
        v40 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke";
        v41 = 2112;
        v42 = 0;
        v43 = 2112;
        v44 = v22;
        _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      v14 = *(_QWORD *)(a1 + 40);
      FPNotPermittedError();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

      __fp_pop_log();
    }
  }
  else
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_2;
    v32[3] = &unk_1E8C75530;
    v11 = *(void **)(a1 + 40);
    v32[4] = *(_QWORD *)(a1 + 32);
    v33 = v11;
    FPProviderNotFoundError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_2((uint64_t)v32, v12);

  }
LABEL_11:

}

void __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_266(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)runTestingOperations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v34 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v34);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    v45[0] = *MEMORY[0x1E0CAAEC0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(WeakRetained, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v4, 0, 2);

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v2, "nsDomain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_msgSend(v6, "testingModes") & 2) == 0;

      if (v7)
      {
        fpfs_adopt_log();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v23 = FPPopLogSectionForBlock();
          v24 = *(_QWORD *)(a1 + 32);
          FPNotSupportedError();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v36 = v23;
          v37 = 2112;
          v38 = v24;
          v39 = 2080;
          v40 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke";
          v41 = 2112;
          v42 = 0;
          v43 = 2112;
          v44 = v25;
          _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
      }
      else
      {
        objc_msgSend(v2, "defaultBackend");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          objc_msgSend(v2, "defaultBackend");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 40);
          +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_270;
          v29[3] = &unk_1E8C75760;
          v29[4] = *(_QWORD *)(a1 + 32);
          v30 = *(id *)(a1 + 48);
          objc_msgSend(v17, "runTestingOperations:request:completionHandler:", v18, v19, v29);

          goto LABEL_11;
        }
        fpfs_adopt_log();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v26 = FPPopLogSectionForBlock();
          v27 = *(_QWORD *)(a1 + 32);
          FPNotSupportedError();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v36 = v26;
          v37 = 2112;
          v38 = v27;
          v39 = 2080;
          v40 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke";
          v41 = 2112;
          v42 = 0;
          v43 = 2112;
          v44 = v28;
          _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
      }

      v9 = *(_QWORD *)(a1 + 48);
      FPNotSupportedError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

      __fp_pop_log();
    }
    else
    {
      fpfs_adopt_log();
      v31 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v20 = FPPopLogSectionForBlock();
        v21 = *(_QWORD *)(a1 + 32);
        FPNotPermittedError();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v36 = v20;
        v37 = 2112;
        v38 = v21;
        v39 = 2080;
        v40 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke";
        v41 = 2112;
        v42 = 0;
        v43 = 2112;
        v44 = v22;
        _os_log_debug_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      v13 = *(_QWORD *)(a1 + 48);
      FPNotPermittedError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

      __fp_pop_log();
    }
  }
  else
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_2;
    v32[3] = &unk_1E8C75530;
    v32[4] = *(_QWORD *)(a1 + 32);
    v33 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_2((uint64_t)v32, v11);

  }
LABEL_11:

}

void __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)subscribeToUploadProgressUpdates:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v16 = 0;
  objc_msgSend(a1[4], "domainOrNil:", &v16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "serialQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_272;
    block[3] = &unk_1E8C75710;
    v10 = v3;
    v5 = a1[5];
    v6 = a1[4];
    v11 = v5;
    v12 = v6;
    v13 = a1[6];
    dispatch_async(v4, block);

    v7 = v10;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2;
    v14[3] = &unk_1E8C75530;
    v14[4] = a1[4];
    v15 = a1[6];
    FPProviderNotFoundError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2((uint64_t)v14, v8);

    v7 = v15;
  }

}

void __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer subscribeToUploadProgressUpdates:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_272(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2_275;
    v13[3] = &unk_1E8C75788;
    v5 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v4, "subscribeToUploadProgressUpdates:completionHandler:", v5, v13);

  }
  else
  {
    fpfs_adopt_log();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = FPPopLogSectionForBlock();
      v10 = *(_QWORD *)(a1 + 48);
      FPNotSupportedError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2080;
      v21 = "-[FPDXPCDomainServicer subscribeToUploadProgressUpdates:completionHandler:]_block_invoke";
      v22 = 2112;
      v23 = v11;
      _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v7 = *(_QWORD *)(a1 + 56);
    FPNotSupportedError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    __fp_pop_log();
  }
}

void __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2_275(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fpfs_adopt_log();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = FPPopLogSectionForBlock();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 2080;
      v13 = "-[FPDXPCDomainServicer subscribeToUploadProgressUpdates:completionHandler:]_block_invoke_2";
      v14 = 2112;
      v15 = v3;
      _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  }

}

- (void)subscribeToDownloadProgressUpdates:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v16 = 0;
  objc_msgSend(a1[4], "domainOrNil:", &v16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "serialQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_276;
    block[3] = &unk_1E8C75710;
    v10 = v3;
    v5 = a1[5];
    v6 = a1[4];
    v11 = v5;
    v12 = v6;
    v13 = a1[6];
    dispatch_async(v4, block);

    v7 = v10;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2;
    v14[3] = &unk_1E8C75530;
    v14[4] = a1[4];
    v15 = a1[6];
    FPProviderNotFoundError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2((uint64_t)v14, v8);

    v7 = v15;
  }

}

void __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer subscribeToDownloadProgressUpdates:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_276(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2_279;
    v13[3] = &unk_1E8C75788;
    v5 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v4, "subscribeToDownloadProgressUpdates:completionHandler:", v5, v13);

  }
  else
  {
    fpfs_adopt_log();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = FPPopLogSectionForBlock();
      v10 = *(_QWORD *)(a1 + 48);
      FPNotSupportedError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2080;
      v21 = "-[FPDXPCDomainServicer subscribeToDownloadProgressUpdates:completionHandler:]_block_invoke";
      v22 = 2112;
      v23 = v11;
      _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v7 = *(_QWORD *)(a1 + 56);
    FPNotSupportedError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    __fp_pop_log();
  }
}

void __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2_279(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fpfs_adopt_log();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = FPPopLogSectionForBlock();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 2080;
      v13 = "-[FPDXPCDomainServicer subscribeToDownloadProgressUpdates:completionHandler:]_block_invoke_2";
      v14 = 2112;
      v15 = v3;
      _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  }

}

- (void)startAccessingServiceWithName:(id)a3 itemID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *requestQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke;
  block[3] = &unk_1E8C75800;
  block[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_sync(requestQueue, block);

}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;

  v15 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_280;
    v9[3] = &unk_1E8C757D8;
    v9[4] = *(_QWORD *)(a1 + 32);
    v7 = &v12;
    v12 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 48);
    v11 = v3;
    objc_msgSend(v4, "fetchServicesForItemID:allowRestrictedSources:request:completionHandler:", v5, 1, v6, v9);

    v8 = v10;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_2;
    v13[3] = &unk_1E8C75530;
    v13[4] = *(_QWORD *)(a1 + 32);
    v7 = &v14;
    v14 = *(id *)(a1 + 56);
    FPProviderNotFoundError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_2((uint64_t)v13, v8);
  }

}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = 0;
    v18 = 2112;
    v19 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_280(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id location;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "serviceName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (v16)
          {
            v18 = (void *)objc_opt_new();
            objc_msgSend(v18, "setRequestEffectivePID:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestEffectivePID"));
            v19 = (void *)MEMORY[0x1E0CB3940];
            v20 = *(_QWORD *)(a1 + 40);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestEffectivePID");
            FPExecutableNameForProcessIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", CFSTR("service %@ for %@[%u]"), v20, v21, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestEffectivePID"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setPrettyDescription:", v22);

            location = 0;
            objc_msgSend(*(id *)(a1 + 48), "session");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(&location, v23);

            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_286;
            v33[3] = &unk_1E8C757B0;
            objc_copyWeak(&v34, &location);
            objc_msgSend(v18, "setStopBlock:", v33);
            if (!v18)
              __assert_rtn("-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke_2", "FPDXPCDomainServicer.m", 692, "extender");
            objc_msgSend(*(id *)(a1 + 48), "session");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "registerLifetimeExtensionForObject:", v18);

            fpfs_adopt_log();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            fp_current_or_default_log();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v28 = FPPopLogSectionForBlock();
              v29 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 134219266;
              v42 = v28;
              v43 = 2112;
              v44 = v29;
              v45 = 2080;
              v46 = "-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke_2";
              v47 = 2112;
              v48 = v7;
              v49 = 2112;
              v50 = v18;
              v51 = 2112;
              v52 = 0;
              _os_log_debug_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
            __fp_pop_log();

            objc_destroyWeak(&v34);
            objc_destroyWeak(&location);

            goto LABEL_24;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v12)
          continue;
        break;
      }
    }

    fpfs_adopt_log();
    location = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_280_cold_2();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
  else
  {
    if (!v9)
    {
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_280_cold_1(v26);

      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("error"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    fpfs_adopt_log();
    location = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v30 = FPPopLogSectionForBlock();
      v31 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      v42 = v30;
      v43 = 2112;
      v44 = v31;
      v45 = 2080;
      v46 = "-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke";
      v47 = 2112;
      v48 = 0;
      v49 = 2112;
      v50 = 0;
      v51 = 2112;
      v52 = v10;
      _os_log_debug_impl(&dword_1CF55F000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
LABEL_24:

}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_286(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "unregisterLifetimeExtensionForObject:", v3);

}

- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke;
  block[3] = &unk_1E8C75580;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(requestQueue, block);

}

void __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v28 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainOrNil:", &v28);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    v39[0] = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(WeakRetained, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v4, 0, 2);

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v2, "defaultBackend");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        objc_msgSend(v2, "defaultBackend");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_293;
        v23[3] = &unk_1E8C75738;
        v9 = *(_QWORD *)(a1 + 40);
        v23[4] = *(_QWORD *)(a1 + 32);
        v24 = *(id *)(a1 + 48);
        objc_msgSend(v8, "getDiagnosticAttributesForItems:completionHandler:", v9, v23);

      }
      else
      {
        fpfs_adopt_log();
        v25 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v20 = FPPopLogSectionForBlock();
          v21 = *(_QWORD *)(a1 + 32);
          FPNotSupportedError();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v30 = v20;
          v31 = 2112;
          v32 = v21;
          v33 = 2080;
          v34 = "-[FPDXPCDomainServicer getDiagnosticAttributesForItems:completionHandler:]_block_invoke";
          v35 = 2112;
          v36 = 0;
          v37 = 2112;
          v38 = v22;
          _os_log_debug_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        v15 = *(_QWORD *)(a1 + 48);
        FPNotSupportedError();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v17 = FPPopLogSectionForBlock();
        v18 = *(_QWORD *)(a1 + 32);
        FPNotPermittedError();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v30 = v17;
        v31 = 2112;
        v32 = v18;
        v33 = 2080;
        v34 = "-[FPDXPCDomainServicer getDiagnosticAttributesForItems:completionHandler:]_block_invoke";
        v35 = 2112;
        v36 = 0;
        v37 = 2112;
        v38 = v19;
        _os_log_debug_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      v12 = *(_QWORD *)(a1 + 48);
      FPNotPermittedError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

      __fp_pop_log();
    }
  }
  else
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_2;
    v26[3] = &unk_1E8C75530;
    v26[4] = *(_QWORD *)(a1 + 32);
    v27 = *(id *)(a1 + 48);
    FPProviderNotFoundError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_2((uint64_t)v26, v10);

  }
}

void __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCDomainServicer getDiagnosticAttributesForItems:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_293(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCDomainServicer getDiagnosticAttributesForItems:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_t_setFilePresenterObserver:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__FPDXPCDomainServicer__t_setFilePresenterObserver___block_invoke;
  v7[3] = &unk_1E8C75850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(requestQueue, v7);

}

void __52__FPDXPCDomainServicer__t_setFilePresenterObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v10 = 0;
  objc_msgSend(*(id *)(a1 + 32), "providerOrNilWithReason:", &v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "finishObserving");
    objc_msgSend(v2, "domainForIdentifier:reason:", *MEMORY[0x1E0CAAB38], 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", v3, "filePresenters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__FPDXPCDomainServicer__t_setFilePresenterObserver___block_invoke_3;
    v8[3] = &unk_1E8C75828;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "addObserverBlock:", v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = v5;

  }
  else
  {
    FPProviderNotFoundError();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

}

void __52__FPDXPCDomainServicer__t_setFilePresenterObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v12 = a1;
  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v13 = v2;
  objc_msgSend(v2, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "presentedItemURL", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v3, "addObject:", v10);
        }
        else
        {
          fp_current_or_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v9;
            _os_log_error_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_ERROR, "[ERROR] nil presentedItemURL for presenter: %@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(v12 + 32), "observePresentedFilesDidChange:", v3);
}

- (FPProgressProtocol)uploadProxy
{
  return self->_uploadProxy;
}

- (void)setUploadProxy:(id)a3
{
  objc_storeStrong((id *)&self->_uploadProxy, a3);
}

- (FPProgressProtocol)downloadProxy
{
  return self->_downloadProxy;
}

- (void)setDownloadProxy:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProxy, a3);
}

void __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8523e-34, v0, v1, v2);
  *(_QWORD *)(v3 + 24) = "-[FPDXPCDomainServicer currentMaterializedSetSyncAnchorWithCompletionHandler:]_block_invoke_2";
  *(_WORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 34) = 0;
  _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, 0x2Au);
}

void __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8526e-34, v0, v1, v2);
  *(_QWORD *)(v3 + 24) = "-[FPDXPCDomainServicer currentPendingSetSyncAnchorWithCompletionHandler:]_block_invoke_2";
  *(_WORD *)(v3 + 32) = 1024;
  *(_DWORD *)(v3 + 34) = 0;
  *(_WORD *)(v3 + 38) = 2048;
  *(_QWORD *)(v3 + 40) = 0;
  *(_WORD *)(v3 + 48) = v4;
  *(_QWORD *)(v3 + 50) = 0;
  _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %lf, %@", v5, 0x3Au);
}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_280_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF55F000, log, OS_LOG_TYPE_ERROR, "[ERROR] there should be an error specified", v1, 2u);
}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_280_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8526e-34, v0, v1, v2);
  *(_QWORD *)(v3 + 24) = "-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke";
  *(_WORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 34) = 0;
  *(_WORD *)(v3 + 42) = v4;
  *(_QWORD *)(v3 + 44) = 0;
  *(_WORD *)(v3 + 52) = v4;
  *(_QWORD *)(v3 + 54) = 0;
  _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", v5, 0x3Eu);
}

@end
