@implementation FPXEnumerator

uint64_t __27__FPXEnumerator_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__FPXEnumerator_invalidate__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidateVendorEnumeration
{
  FPXEnumerator *v2;
  NSObject *v3;
  NSFileProviderEnumerator *v4;
  NSFileProviderEnumerator *vendorEnumerator;
  uint64_t section;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  FPXEnumerator *v10;
  __int16 v11;
  NSFileProviderEnumerator *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_vendorEnumerator)
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      vendorEnumerator = v2->_vendorEnumerator;
      *(_DWORD *)buf = 134218498;
      v8 = section;
      v9 = 2112;
      v10 = v2;
      v11 = 2112;
      v12 = vendorEnumerator;
      _os_log_debug_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: invalidating vendor enumeration: %@", buf, 0x20u);
    }

    -[NSFileProviderEnumerator invalidate](v2->_vendorEnumerator, "invalidate");
    v4 = v2->_vendorEnumerator;
    v2->_vendorEnumerator = 0;

    __fp_leave_section_Debug((uint64_t)&section);
  }
  objc_sync_exit(v2);

}

- (FPXEnumerator)initWithObservedItemID:(id)a3 domainContext:(id)a4 vendorEnumerator:(id)a5 nsFileProviderRequest:(id)a6 observer:(id)a7 isWorkingSetEnum:(BOOL)a8 queue:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FPXEnumerator *v21;
  FPXEnumerator *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  OS_os_log *log;
  uint64_t v48;
  FPXEnumeratorObserver *observer;
  NSObject *v50;
  id *p_domainContext;
  char v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id obj;
  id v61;
  _QWORD v63[4];
  id v64;
  id location;
  objc_super v66;

  v15 = a3;
  v16 = a4;
  obj = a5;
  v17 = a5;
  v61 = a6;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v66.receiver = self;
  v66.super_class = (Class)FPXEnumerator;
  v21 = -[FPXEnumerator init](&v66, sel_init);
  v22 = v21;
  if (v21)
  {
    v58 = v17;
    v59 = a7;
    v55 = a3;
    v56 = v20;
    v57 = v18;
    v54 = v15;
    objc_storeStrong((id *)&v21->_domainContext, a4);
    -[FPXDomainContext log](v22->_domainContext, "log");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = fpfs_adopt_log(v23);

    -[FPXDomainContext domain](v22->_domainContext, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "personaIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      p_domainContext = (id *)&v22->_domainContext;
      -[FPXDomainContext domain](v22->_domainContext, "domain");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "personaIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v30 = v16;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "currentPersona");
      v32 = v19;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "userPersonaUniqueString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v29, "isEqualToString:", v34);

      v19 = v32;
      v16 = v30;

      if ((v53 & 1) == 0)
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "currentPersona");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "userPersonaUniqueString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "currentPersona");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "uid");
        objc_msgSend(*p_domainContext, "domain");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "personaIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v38, v41, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        fp_current_or_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          +[FPXExtensionContext principalClass].cold.1();

        __assert_rtn("-[FPXEnumerator initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 360, (const char *)objc_msgSend(objc_retainAutorelease(v44), "UTF8String"));
      }
    }
    else
    {

    }
    objc_storeStrong((id *)&v22->_vendorEnumerator, obj);
    objc_storeStrong((id *)&v22->_nsFileProviderRequest, v61);
    v22->_isWorkingSetEnum = a8;
    objc_storeStrong((id *)&v22->_queue, a9);
    objc_msgSend(v16, "log");
    v46 = objc_claimAutoreleasedReturnValue();
    log = v22->_log;
    v22->_log = (OS_os_log *)v46;

    location = 0;
    objc_initWeak(&location, v22);
    v18 = v57;
    v17 = v58;
    v20 = v56;
    if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EE5F08B8))
    {
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __125__FPXEnumerator_initWithObservedItemID_domainContext_vendorEnumerator_nsFileProviderRequest_observer_isWorkingSetEnum_queue___block_invoke;
      v63[3] = &unk_1E444C728;
      objc_copyWeak(&v64, &location);
      objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v63);
      v48 = objc_claimAutoreleasedReturnValue();
      observer = v22->_observer;
      v22->_observer = (FPXEnumeratorObserver *)v48;

      objc_destroyWeak(&v64);
    }
    else
    {
      objc_storeStrong((id *)&v22->_observer, v59);
    }
    objc_storeStrong((id *)&v22->_observedItemID, v55);
    fp_current_or_default_log();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      -[FPXEnumerator initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:].cold.1();

    objc_destroyWeak(&location);
    v15 = v54;
  }

  return v22;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: dealloc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_invalidate
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[FPXDomainContext log](self->_domainContext, "log");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = fpfs_adopt_log(v3);

  -[FPXDomainContext domain](self->_domainContext, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[FPXDomainContext domain](self->_domainContext, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentPersona");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userPersonaUniqueString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqualToString:", v12);

    if ((v13 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentPersona");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "userPersonaUniqueString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentPersona");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "uid");
      -[FPXDomainContext domain](self->_domainContext, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "personaIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v17, v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXEnumerator _invalidate]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 403, (const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"));
    }
  }
  else
  {

  }
  -[FPXDomainContext extensionContext](self->_domainContext, "extensionContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "enumeratorWasInvalidated:", self);

  -[FPXEnumerator invalidateVendorEnumeration](self, "invalidateVendorEnumeration");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observedItemID, 0);
  objc_storeStrong((id *)&self->_nsFileProviderRequest, 0);
  objc_storeStrong((id *)&self->_vendorEnumerator, 0);
  objc_storeStrong((id *)&self->_domainContext, 0);
}

void __125__FPXEnumerator_initWithObservedItemID_domainContext_vendorEnumerator_nsFileProviderRequest_observer_isWorkingSetEnum_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __125__FPXEnumerator_initWithObservedItemID_domainContext_vendorEnumerator_nsFileProviderRequest_observer_isWorkingSetEnum_queue___block_invoke_cold_1();

  objc_msgSend(WeakRetained, "invalidate");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@ %@>"), objc_opt_class(), self, self->_domainContext, self->_observedItemID);
}

- (id)vendorEnumerator
{
  FPXEnumerator *v2;
  NSFileProviderEnumerator *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_vendorEnumerator;
  objc_sync_exit(v2);

  return v3;
}

- (void)forceItemUpdate:(id)a3
{
  id v4;

  -[FPXDomainContext itemFromVendorItem:](self->_domainContext, "itemFromVendorItem:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FPXEnumeratorObserver didUpdateItem:](self->_observer, "didUpdateItem:", v4);

}

- (void)forceAddFileURLsForItems:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FPXDomainContext v2Instance](self->_domainContext, "v2Instance");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isWorkingSetEnum && v5 != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "fileURL", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(v13, "itemIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "URLForItemWithPersistentIdentifier:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setFileURL:", v16);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
}

- (void)currentSyncAnchorWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FPXEnumerator_currentSyncAnchorWithCompletion___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  fp_dispatch_async_with_logs(queue, v7);

}

void __49__FPXEnumerator_currentSyncAnchorWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personaIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentPersona");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userPersonaUniqueString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentPersona");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userPersonaUniqueString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentPersona");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "uid");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "personaIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v13, v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXEnumerator currentSyncAnchorWithCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 462, (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "vendorEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __49__FPXEnumerator_currentSyncAnchorWithCompletion___block_invoke_162;
      v39[3] = &unk_1E444C750;
      v22 = *(void **)(a1 + 40);
      v39[4] = *(_QWORD *)(a1 + 32);
      v40 = v22;
      objc_msgSend(v21, "currentSyncAnchorWithCompletionHandler:", v39);

    }
    else
    {
      fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 56));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v36 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
        v37 = *(_QWORD *)(a1 + 32);
        v30 = *MEMORY[0x1E0CB28A8];
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v43 = v36;
        v44 = 2112;
        v45 = v37;
        v46 = 2080;
        v47 = "-[FPXEnumerator currentSyncAnchorWithCompletion:]_block_invoke";
        v48 = 2112;
        v49 = 0;
        v50 = 2112;
        v51 = v38;
        _os_log_debug_impl(&dword_1A0A34000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      else
      {
        v30 = *MEMORY[0x1E0CB28A8];
      }

      v31 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v30, 3328, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v31 + 16))(v31, 0, v32);

      __fp_pop_log(&v41);
    }
  }
  else
  {
    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v43 = v24;
      _os_log_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] request on invalidated enumerator: %@", buf, 0xCu);
    }

    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 56));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v33 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v34 = *(_QWORD *)(a1 + 32);
      v26 = *MEMORY[0x1E0CB28A8];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v43 = v33;
      v44 = 2112;
      v45 = v34;
      v46 = 2080;
      v47 = "-[FPXEnumerator currentSyncAnchorWithCompletion:]_block_invoke";
      v48 = 2112;
      v49 = 0;
      v50 = 2112;
      v51 = v35;
      _os_log_debug_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    else
    {
      v26 = *MEMORY[0x1E0CB28A8];
    }

    v27 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v26, 260, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v27 + 16))(v27, 0, v28);

    __fp_pop_log(&v41);
  }

}

void __49__FPXEnumerator_currentSyncAnchorWithCompletion___block_invoke_162(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXEnumerator currentSyncAnchorWithCompletion:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    v16 = 2112;
    v17 = 0;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke;
  v13[3] = &unk_1E444C7C8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  fp_dispatch_async_with_logs(queue, v13);

}

void __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  FPXItemsObserver *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  FPXItemsObserver *v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  void *v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 56));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 8), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentPersona");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userPersonaUniqueString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentPersona");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userPersonaUniqueString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentPersona");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "uid");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXEnumerator enumerateItemsFromPage:suggestedPageSize:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 486, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", *(_QWORD *)(a1 + 40));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "vendorEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v42 = v25;
    v43 = 2112;
    v44 = v23;
    v45 = 2114;
    v46 = v22;
    _os_log_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: enumerate items on %@ from page %{public}@", buf, 0x20u);
  }

  if (v23)
  {
    v26 = -[FPXItemsObserver initWithObservedItemID:domainContext:nsFileProviderRequest:]([FPXItemsObserver alloc], "initWithObservedItemID:domainContext:nsFileProviderRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    -[FPXItemsObserver setSuggestedPageSize:](v26, "setSuggestedPageSize:", *(_QWORD *)(a1 + 56));
    v27 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_165;
    v36[3] = &unk_1E444C778;
    v28 = *(void **)(a1 + 40);
    v36[4] = *(_QWORD *)(a1 + 32);
    v37 = v28;
    v39 = *(id *)(a1 + 48);
    v38 = v22;
    -[FPXItemsObserver setFinishedBlock:](v26, "setFinishedBlock:", v36);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v32[0] = v27;
      v32[1] = 3221225472;
      v32[2] = __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_171;
      v32[3] = &unk_1E444C7A0;
      v32[4] = *(_QWORD *)(a1 + 32);
      v35 = *(id *)(a1 + 48);
      v33 = v26;
      v34 = *(id *)(a1 + 40);
      objc_msgSend(v23, "currentSyncAnchorWithCompletionHandler:", v32);

    }
    else
    {
      objc_msgSend(v23, "enumerateItemsForObserver:startingAtPage:", v26, *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    fp_current_or_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v42 = v30;
      _os_log_impl(&dword_1A0A34000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] request on invalidated enumerator: %@", buf, 0xCu);
    }

    v31 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
    v26 = (FPXItemsObserver *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, FPXItemsObserver *))(v31 + 16))(v31, MEMORY[0x1E0C9AA60], 0, 0, 0, v26);
  }

  __fp_pop_log(&v40);
}

void __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_165(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  _BYTE v56[14];
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v45 = a2;
  v44 = a3;
  v42 = a4;
  v43 = a5;
  v11 = a6;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 56));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "vendorEnumerator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(const char **)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v52 = v13;
      v53 = 2114;
      v54 = v14;
      v55 = 2112;
      *(_QWORD *)v56 = v11;
      _os_log_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_INFO, "[INFO] item enumeration on %@ from page %{public}@ returned error %@", buf, 0x20u);

    }
LABEL_4:

    goto LABEL_5;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToData:", v44))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 41))
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 32), "forceAddFileURLsForItems:", v45);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "internalErrorFromVendorError:callerDescription:", v11, CFSTR("enumerateItemsFromPage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v35 = *(void **)(a1 + 32);
        v36 = objc_msgSend(v45, "count");
        *(_DWORD *)buf = 138413314;
        v52 = v35;
        v53 = 2080;
        v54 = "-[FPXEnumerator enumerateItemsFromPage:suggestedPageSize:reply:]_block_invoke";
        v55 = 1024;
        *(_DWORD *)v56 = v36;
        *(_WORD *)&v56[4] = 2112;
        *(_QWORD *)&v56[6] = v43;
        v57 = 2112;
        v58 = v15;
        _os_log_debug_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@, reply of %s %d, %@, %@", buf, 0x30u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_8;
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v12 = v45;
    v27 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    if (!v27)
      goto LABEL_4;
    v28 = *(_QWORD *)v47;
    v41 = 138543618;
LABEL_18:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v28)
        objc_enumerationMutation(v12);
      v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v29);
      objc_msgSend(v30, "parentItemID", v41);
      v31 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isEqualToItemID:](v31, "isEqualToItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)) & 1) != 0)
        goto LABEL_25;
      objc_msgSend(v30, "itemID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

      if ((v33 & 1) == 0)
        break;
LABEL_26:
      if (v27 == ++v29)
      {
        v27 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
        if (!v27)
          goto LABEL_4;
        goto LABEL_18;
      }
    }
    fp_current_or_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "vendorEnumerator");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v41;
      v52 = v34;
      v53 = 2114;
      v54 = (const char *)v30;
      _os_log_error_impl(&dword_1A0A34000, v31, OS_LOG_TYPE_ERROR, "[ERROR] Enumerator %{public}@ returned the %{public}@ item whose parent is not the expected one. This may reveal a bug in the provider implementation.", buf, 0x16u);

    }
LABEL_25:

    goto LABEL_26;
  }
  fp_current_or_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "vendorEnumerator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *(const char **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v52 = v37;
    v53 = 2114;
    v54 = v38;
    v55 = 2114;
    *(_QWORD *)v56 = v39;
    _os_log_error_impl(&dword_1A0A34000, v17, OS_LOG_TYPE_ERROR, "[ERROR] Enumerator %{public}@ was asked to enumerate from page %{public}@ (%{public}@), but returned the same page back. This is an implementation error in the enumerator.", buf, 0x20u);

  }
  fp_simulate_crash(CFSTR("Enumerator was asked to enumerate from a page, but returned the same page back. This is an implementation error in the enumerator."), v18, v19, v20, v21, v22, v23, v24, v40);
  fp_current_or_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_165_cold_1(v25);

  v26 = *(_QWORD *)(a1 + 56);
  FPPluginOperationFailedError(0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id, void *))(v26 + 16))(v26, MEMORY[0x1E0C9AA60], 0, 0, v43, v15);
LABEL_8:

  __fp_pop_log(&v50);
}

void __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_171(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "vendorEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "verifyVendorToken:", v3);
    objc_msgSend(*(id *)(a1 + 40), "setSyncAnchor:", v3);
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_INFO, "[INFO] current change token is %{public}@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "vendorEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumerateItemsForObserver:startingAtPage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] request on invalidated enumerator: %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v10 + 16))(v10, MEMORY[0x1E0C9AA60], 0, 0, 0, v7);
  }

}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;
  int64_t v18;

  v10 = a3;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_upTo_reply___block_invoke;
  v14[3] = &unk_1E444C818;
  v16 = v11;
  v17 = a5;
  v14[4] = self;
  v15 = v10;
  v18 = a4;
  v12 = v10;
  v13 = v11;
  -[FPXEnumerator enumerateItemsFromPage:suggestedPageSize:reply:](self, "enumerateItemsFromPage:suggestedPageSize:reply:", v12, a4, v14);

}

void __69__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_upTo_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void *v28;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 56));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v16 = objc_msgSend(v11, "count");
    v17 = *(_QWORD *)(a1 + 56);
    if (v16 >= v17)
      v18 = *(_QWORD *)(a1 + 56);
    else
      v18 = v16;
    if (v17 <= 0)
      v19 = v16;
    else
      v19 = v18;
    objc_msgSend(v11, "subarrayWithRange:", 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    if (!v12 || *(id *)(a1 + 40) == v12 || (v22 = v19 - v21, v22 < 1))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v23 = *(void **)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 64);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __69__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_upTo_reply___block_invoke_2;
      v25[3] = &unk_1E444C7F0;
      v27 = *(id *)(a1 + 48);
      v26 = v20;
      objc_msgSend(v23, "enumerateItemsFromPage:suggestedPageSize:upTo:reply:", v12, v24, v22, v25);

    }
  }
  __fp_pop_log(&v28);

}

void __69__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_upTo_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5
{
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  FPXEnumerator *v16;
  id v17;
  SEL v18;
  int64_t v19;

  v9 = a3;
  v10 = a5;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke;
  v14[3] = &unk_1E444C868;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = a2;
  v19 = a4;
  v12 = v10;
  v13 = v9;
  fp_dispatch_async_with_logs(queue, v14);

}

void __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  FPXChangesObserver *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("FPXEnumerator.m"), 588, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumeratedFromToken"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentPersona");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userPersonaUniqueString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentPersona");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userPersonaUniqueString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentPersona");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "uid");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXEnumerator enumerateChangesFromToken:suggestedBatchSize:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 589, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", *(_QWORD *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "vendorEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v40 = v25;
    v41 = 2112;
    v42 = v23;
    v43 = 2114;
    v44 = v22;
    _os_log_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: enumerate changes on %@ from token %{public}@", buf, 0x20u);
  }

  if (v23)
  {
    v26 = -[FPXChangesObserver initWithObservedItemID:domainContext:previousChangeToken:nsFileProviderRequest:]([FPXChangesObserver alloc], "initWithObservedItemID:domainContext:previousChangeToken:nsFileProviderRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
    -[FPXChangesObserver setSuggestedBatchSize:](v26, "setSuggestedBatchSize:", *(_QWORD *)(a1 + 64));
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke_176;
    v34[3] = &unk_1E444C840;
    v34[4] = *(_QWORD *)(a1 + 40);
    v27 = v23;
    v35 = v27;
    v36 = v22;
    v37 = *(id *)(a1 + 32);
    v38 = *(id *)(a1 + 48);
    -[FPXChangesObserver setFinishedBlock:](v26, "setFinishedBlock:", v34);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v27, "enumerateChangesForObserver:fromSyncAnchor:", v26, *(_QWORD *)(a1 + 32));
    }
    else
    {
      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke_cold_1(v31);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPXChangesObserver finishEnumeratingWithError:](v26, "finishEnumeratingWithError:", v32);

    }
  }
  else
  {
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v40 = v29;
      _os_log_impl(&dword_1A0A34000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] request on invalidated enumerator: %@", buf, 0xCu);
    }

    v30 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
    v26 = (FPXChangesObserver *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, FPXChangesObserver *))(v30 + 16))(v30, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0, 0, v26);
  }

}

void __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke_176(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  int v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  _BYTE v33[10];
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 56));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(const char **)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v29 = v19;
      v30 = 2114;
      v31 = v20;
      v32 = 2112;
      *(_QWORD *)v33 = v17;
      _os_log_impl(&dword_1A0A34000, v18, OS_LOG_TYPE_INFO, "[INFO] change enumeration on %@ from page %{public}@ returned error %@", buf, 0x20u);
    }

  }
  if (a4)
  {
    if (objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 56)))
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0A34000, v21, OS_LOG_TYPE_INFO, "[INFO] enumeration has more change, but the token is unchanged, discarding hasMoreChanges", buf, 2u);
      }

      a4 = 0;
    }
    else
    {
      a4 = 1;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "forceAddFileURLsForItems:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "internalErrorFromVendorError:callerDescription:", v17, CFSTR("enumerateChangesFromToken"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = *(_QWORD *)(a1 + 32);
    v26 = objc_msgSend(v13, "count");
    v25 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 138413826;
    v29 = v24;
    v30 = 2080;
    v31 = "-[FPXEnumerator enumerateChangesFromToken:suggestedBatchSize:reply:]_block_invoke";
    v32 = 1024;
    *(_DWORD *)v33 = v26;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v25;
    v34 = 1024;
    v35 = a4;
    v36 = 2112;
    v37 = v16;
    v38 = 2112;
    v39 = v22;
    _os_log_debug_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@, reply of %s %d, %d, %{BOOL}d,%@,  %@", buf, 0x3Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  __fp_pop_log(&v27);

}

- (FPItemID)observedItemID
{
  return self->_observedItemID;
}

- (void)alternateContentsWereUpdatedAtURL:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  FPXEnumeratorAlternateContentsItem *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[FPXEnumeratorAlternateContentsItem initWithOriginalDocumentItem:alternateContentsURL:]([FPXEnumeratorAlternateContentsItem alloc], "initWithOriginalDocumentItem:alternateContentsURL:", v7, v6);

  -[FPXDomainContext itemFromVendorItem:](self->_domainContext, "itemFromVendorItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[FPXEnumeratorObserver didUpdateItem:](self->_observer, "didUpdateItem:", v9);
  }
  else
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FPXEnumerator alternateContentsWereUpdatedAtURL:forItem:].cold.1();

  }
}

- (FPXEnumeratorObserver)observer
{
  return (FPXEnumeratorObserver *)objc_getProperty(self, a2, 64, 1);
}

- (void)initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] %@: created with enumerator: %@");
  OUTLINED_FUNCTION_3();
}

void __125__FPXEnumerator_initWithObservedItemID_domainContext_vendorEnumerator_nsFileProviderRequest_observer_isWorkingSetEnum_queue___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] observer was invalidated, invalidating %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_165_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A0A34000, log, OS_LOG_TYPE_FAULT, "[SIMCRASH] Enumerator was asked to enumerate from a page, but returned the same page back. This is an implementation error in the enumerator.", v1, 2u);
}

void __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ⚠️ vendor doesn't implement delta changes support", v1, 2u);
}

- (void)alternateContentsWereUpdatedAtURL:forItem:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_ERROR, "[ERROR] nil item for alternate contents URL: %@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

@end
