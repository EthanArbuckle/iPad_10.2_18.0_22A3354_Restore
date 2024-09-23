@implementation FPXExtensionContext

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2080;
    v12 = "-[FPXExtensionContext fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:]_block_invoke_2";
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = 0;
    _os_log_debug_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log(&v6);

}

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
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
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSFileProviderSearch *v33;
  void *v34;
  void *v35;
  void *v36;
  NSFileProviderSearch *v37;
  uint64_t v38;
  BOOL v39;
  FPXEnumerator *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  FPXEnumerator *v47;
  void *v48;
  char v49;
  NSObject *v50;
  NSObject *v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD block[5];
  FPXEnumerator *v71;
  id v72;
  _QWORD v73[4];
  FPXEnumerator *v74;
  NSObject *v75;
  void *v76;
  id v77;
  id v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  NSObject *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "enumeratedItemID");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("FPXExtensionContext.m"), 2110, CFSTR("Enumerated item ID missing"));

  }
  objc_msgSend(*(id *)(a1 + 40), "domainContextForItemID:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v69, "domain");
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
      objc_msgSend(v69, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2112, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "searchQuery");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v69, "vendorInstance");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "conformsToProtocol:", &unk_1EE5DCDB8))
      v24 = (uint64_t)v23;
    else
      v24 = 0;
    v67 = v23;

    if (v24)
    {
      objc_msgSend(*(id *)(a1 + 32), "searchQuery");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "toSpotlightServerQueryString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = [NSFileProviderSearch alloc];
      objc_msgSend(v31, "scopedToItemIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "searchContainerItemIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "searchQuery");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[NSFileProviderSearch initWithSpotlightQueryString:scopedToItemIdentifier:searchContainerItemIdentifier:legacySearchQuery:](v33, "initWithSpotlightQueryString:scopedToItemIdentifier:searchContainerItemIdentifier:legacySearchQuery:", v32, v34, v35, v36);

      v38 = *(_QWORD *)(a1 + 48);
      v78 = 0;
      objc_msgSend((id)v24, "enumeratorForSearch:request:error:", v37, v38, &v78);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v78;

    }
    else
    {
      FPNotSupportedError();
      v29 = objc_claimAutoreleasedReturnValue();
      v28 = 0;
    }

    v30 = 0;
    LOBYTE(v24) = 1;
  }
  else
  {
    objc_msgSend(v68, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "isEqualToString:", CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"));

    objc_msgSend(v69, "vendorInstance");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 48);
    v77 = 0;
    objc_msgSend(v67, "enumeratorForContainerItemIdentifier:request:error:", v26, v27, &v77);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v77;

    if ((_DWORD)v24)
    {
      CheckAndWarn(v28, sel_currentSyncAnchorWithCompletionHandler_);
      CheckAndWarn(v28, sel_enumerateChangesForObserver_fromSyncAnchor_);
    }
    if (!v28)
    {
      if ((-[NSObject fp_isFeatureUnsupportedError](v29, "fp_isFeatureUnsupportedError") & 1) == 0
        || (objc_msgSend(v68, "identifier"),
            v48 = (void *)objc_claimAutoreleasedReturnValue(),
            v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("NSFileProviderTrashContainerItemIdentifier")),
            v48,
            (v49 & 1) == 0))
      {
        v28 = 0;
        v39 = v29 != 0;
        goto LABEL_33;
      }
      fp_current_or_default_log();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_cold_2();

      v28 = (void *)objc_opt_new();
    }
    v30 = v24;
  }
  v39 = v29 != 0;
  if (v28 && !v29)
  {
    v40 = -[FPXEnumerator initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:]([FPXEnumerator alloc], "initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:", v68, v69, v28, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v30, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
    v29 = dispatch_group_create();
    v41 = MEMORY[0x1E0C809B0];
    if ((v24 & 1) == 0 && (objc_msgSend(v69, "usesFPFS") & 1) == 0)
    {
      dispatch_group_enter(v29);
      objc_msgSend(v68, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v41;
      v73[1] = 3221225472;
      v73[2] = __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_388;
      v73[3] = &unk_1E444A498;
      v74 = v40;
      v75 = v29;
      v44 = (id)objc_msgSend(v67, "itemForIdentifier:request:completionHandler:", v42, v43, v73);

    }
    v45 = *(_QWORD *)(a1 + 40);
    v46 = *(NSObject **)(v45 + 16);
    block[0] = v41;
    block[1] = 3221225472;
    block[2] = __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_2;
    block[3] = &unk_1E4449B98;
    block[4] = v45;
    v71 = v40;
    v72 = *(id *)(a1 + 64);
    v47 = v40;
    dispatch_group_notify(v29, v46, block);

    goto LABEL_45;
  }
LABEL_33:
  fp_current_or_default_log();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "providerIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "fp_fpIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v80 = v68;
    v81 = 2112;
    v82 = v63;
    v83 = 2112;
    v84 = (const char *)v29;
    _os_log_debug_impl(&dword_1A0A34000, v51, OS_LOG_TYPE_DEBUG, "[DEBUG] can't create vendor enumerator for %@ owned by %@; %@",
      buf,
      0x20u);

  }
  if (v28)
    v52 = 1;
  else
    v52 = v39;
  if ((v52 & 1) == 0)
  {
    NSStringFromSelector(sel_enumeratorForContainerItemIdentifier_error_);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    fp_simulate_crash(CFSTR("-[%@ %@] must return an enumerator or an error."), v53, v54, v55, v56, v57, v58, v59, (uint64_t)v67);

    fp_current_or_default_log();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_cold_1((int)v67, sel_enumeratorForContainerItemIdentifier_error_);

  }
  objc_msgSend(v69, "internalErrorFromVendorError:callerDescription:", v29, CFSTR("fetchAndStartEnumeratingWithSettings"));
  v47 = (FPXEnumerator *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    v64 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
    v65 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    v80 = v64;
    v81 = 2112;
    v82 = v65;
    v83 = 2080;
    v84 = "-[FPXExtensionContext fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:]_block_invoke";
    v85 = 2112;
    v86 = 0;
    v87 = 2112;
    v88 = v29;
    _os_log_debug_impl(&dword_1A0A34000, v61, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  __fp_pop_log(&v76);

LABEL_45:
}

uint64_t __48__FPXExtensionContext_enumeratorWasInvalidated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)fetchAndStartEnumeratingWithSettings:(id)a3 observer:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  OS_dispatch_queue *instanceQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  FPXExtensionContext *v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  void *v28;
  uint8_t buf[4];
  FPXExtensionContext *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  fpfs_adopt_log(self->_log);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v30 = self;
    v31 = 2080;
    v32 = "-[FPXExtensionContext fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:]";
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v13;
    _os_log_debug_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }

  instanceQueue = self->_instanceQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke;
  v21[3] = &unk_1E444A4C0;
  v17 = v11;
  v27 = a2;
  v22 = v17;
  v23 = self;
  v18 = v13;
  v24 = v18;
  v19 = v14;
  v26 = v19;
  v20 = v12;
  v25 = v20;
  fp_dispatch_async_with_logs(instanceQueue, v21);

  __fp_pop_log(&v28);
}

- (void)enumeratorWasInvalidated:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__FPXExtensionContext_enumeratorWasInvalidated___block_invoke;
  v7[3] = &unk_1E4449A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

- (id)domainContext
{
  FPXExtensionContext *v2;
  FPXDomainContext *domainContext;
  FPXDomainContext *v4;
  NSObject *v6;

  v2 = self;
  objc_sync_enter(v2);
  domainContext = v2->_domainContext;
  if (!domainContext)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FPXExtensionContext domainContext].cold.1();

    exit(1);
  }
  v4 = domainContext;
  objc_sync_exit(v2);

  return v4;
}

- (id)domainContextForItemID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "domainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXExtensionContext domainContext](self, "domainContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXExtensionContext.m"), 424, CFSTR("Sent to wrong instance, itemID=%@, domainContext.domain=%@"), v5, v14);

  }
  return v7;
}

- (FPXExtensionContext)init
{
  FPXExtensionContext *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *notificationQueue;
  dispatch_workloop_t v6;
  OS_dispatch_queue *instanceQueue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  void *v11;
  uint64_t v12;
  NSString *providerIdentifier;
  uint64_t v14;
  NSHashTable *runningEnumerators;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FPXExtensionContext;
  v2 = -[FPXExtensionContext init](&v17, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("fpx-notif-fetching", v3);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_workloop_create("fpx-instance");
    instanceQueue = v2->_instanceQueue;
    v2->_instanceQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("fpx-queue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    providerIdentifier = v2->_providerIdentifier;
    v2->_providerIdentifier = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    runningEnumerators = v2->_runningEnumerators;
    v2->_runningEnumerators = (NSHashTable *)v14;

  }
  return v2;
}

+ (Class)principalClass
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  Class v8;
  objc_class *v9;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FPXExtensionContext could not get the bundle record for the current process."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[FPXExtensionContext principalClass].cold.1();

    __assert_rtn("+[FPXExtensionContext principalClass]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 156, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
  }
  v3 = v2;
  objc_msgSend(v2, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:ofClass:valuesOfClass:", CFSTR("NSExtension"), v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("NSExtensionPrincipalClass"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSClassFromString(v7);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Extension Info.plist does not define a principal class, or class was not found (expected class name: %@)"), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      +[FPXExtensionContext principalClass].cold.1();

    __assert_rtn("+[FPXExtensionContext principalClass]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 162, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  }
  v9 = v8;

  return v9;
}

- (void)beginRequestWithDomain:(id)a3 alternateContentsDictionary:(id)a4 domainServicer:(id)a5 providerDomain:(id)a6 domainVersion:(id)a7 completionHandler:(id)a8
{
  id v14;
  char *v15;
  FPXExtensionContext *v16;
  void *v17;
  NSString *providerIdentifier;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  OS_os_log *log;
  NSObject *v24;
  void *v25;
  OS_os_log *v26;
  id WeakRetained;
  NSObject *v28;
  FPXExtensionContext *v29;
  void *v30;
  void *v31;
  void *v32;
  char *v33;
  BOOL v34;
  FPXPCAutomaticErrorProxy *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  FPDDomainServicing *domainServicer;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  objc_class *Superclass;
  NSObject *v52;
  FPXV2ExtensionWrapper *v53;
  FPXV2ExtensionWrapper *v54;
  FPXV2ExtensionWrapper *v55;
  void *v56;
  FPDocumentAlternateContents *v57;
  FPDocumentAlternateContents *alternateContents;
  FPXDomainContext *v59;
  FPXDomainContext *domainContext;
  NSObject *v61;
  void *v62;
  FPXExtensionContext *v63;
  uint64_t v64;
  NSUserDefaults *userDefaults;
  NSObject *v66;
  NSObject *v67;
  char *v68;
  uint64_t v69;
  NSObject *v70;
  FPXExtensionContext *v71;
  void *v72;
  objc_class *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v80;
  id v81;
  id v82;
  id v83;
  char *v84;
  void *v85;
  void *v86;
  void *v87[2];
  uint8_t buf[4];
  FPXExtensionContext *v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  uint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v80 = a4;
  v81 = a5;
  v15 = (char *)a6;
  v82 = a7;
  v83 = a8;
  v16 = self;
  objc_sync_enter(v16);
  v17 = (void *)MEMORY[0x1E0CB3940];
  providerIdentifier = v16->_providerIdentifier;
  objc_msgSend(v14, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fp_providerDomainIDFromProviderID:domainIdentifier:", providerIdentifier, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fp_obfuscatedProviderDomainID");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fpfs_create_log_for_provider((char *)objc_msgSend(v21, "UTF8String"));
  v22 = objc_claimAutoreleasedReturnValue();
  log = v16->_log;
  v16->_log = (OS_os_log *)v22;

  v86 = 0;
  fpfs_adopt_log(v16->_log);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v89 = v16;
    v90 = 2080;
    v91 = "-[FPXExtensionContext beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:domainV"
          "ersion:completionHandler:]";
    v92 = 2112;
    v93 = v15;
    v94 = 2048;
    v95 = (uint64_t)v82;
    _os_log_debug_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %ld", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v16->_xpcConnection, v25);

  v26 = v16->_log;
  WeakRetained = objc_loadWeakRetained((id *)&v16->_xpcConnection);
  +[FPXPCLogDelegate setupWithLog:forConnection:](FPXPCLogDelegate, "setupWithLog:forConnection:", v26, WeakRetained);

  fp_current_or_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v29 = (FPXExtensionContext *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v89 = v29;
    _os_log_impl(&dword_1A0A34000, v28, OS_LOG_TYPE_INFO, "[INFO] [helena] call to beginRequest from connection %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "currentPersona");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "userPersonaUniqueString");
  v84 = (char *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "personaIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "isEqualToString:", v84))
  {

  }
  else
  {
    objc_msgSend(v14, "personaIdentifier");
    v33 = (char *)objc_claimAutoreleasedReturnValue();
    v34 = v84 == v33;

    if (!v34)
    {
      fp_current_or_default_log();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "personaIdentifier");
        v68 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v89 = v16;
        v90 = 2112;
        v91 = v84;
        v92 = 2112;
        v93 = v68;
        _os_log_error_impl(&dword_1A0A34000, v67, OS_LOG_TYPE_ERROR, "[ERROR] Non matching personas for the extension %@ (%@, expect %@)", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 18, MEMORY[0x1E0C9AA70]);
      v69 = objc_claimAutoreleasedReturnValue();
      fpfs_adopt_log(v16->_log);
      v87[0] = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
      {
        v71 = (FPXExtensionContext *)FPPopLogSectionForBlock(v83);
        *(_DWORD *)buf = 134218754;
        v89 = v71;
        v90 = 2112;
        v91 = (const char *)v16;
        v92 = 2080;
        v93 = "-[FPXExtensionContext beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:dom"
              "ainVersion:completionHandler:]";
        v94 = 2112;
        v95 = v69;
        _os_log_debug_impl(&dword_1A0A34000, v70, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }

      (*((void (**)(id, uint64_t))v83 + 2))(v83, v69);
      __fp_pop_log(v87);

      exit(1);
    }
  }
  v35 = [FPXPCAutomaticErrorProxy alloc];
  v36 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("domain servicer for %@ (handshake)"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:](v35, "initWithConnection:protocol:orError:name:requestPid:", v81, &unk_1EE5F7E00, 0, v38, 0);
  domainServicer = v16->_domainServicer;
  v16->_domainServicer = (FPDDomainServicing *)v39;

  +[NSFileProviderManager registerDomainServicer:forDomain:](NSFileProviderManager, "registerDomainServicer:forDomain:", v16->_domainServicer, v14);
  objc_msgSend(v15, "storageURLs");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "firstObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v15, "storageURLs");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "firstObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSFileProviderManager registerRootURL:forDomain:](NSFileProviderManager, "registerRootURL:forDomain:", v44, v14);

  }
  v45 = +[FPXExtensionContext principalClass](FPXExtensionContext, "principalClass");
  if (objc_msgSend(v15, "isUsingFPFS"))
  {
    objc_msgSend(v15, "providerID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")))
    {

    }
    else
    {
      objc_msgSend(v15, "providerID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.FileProvider.TestingHarness.TestFileProvider"));

      if ((v48 & 1) == 0)
      {
        if ((-[objc_class conformsToProtocol:](v45, "conformsToProtocol:", &unk_1EE5DCD30) & 1) == 0)
        {
          objc_msgSend(v14, "identifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "providerDisplayName");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          __FILEPROVIDER_BAD_EXTENSION__(v77, v78, (uint64_t)v45);
        }
        goto LABEL_29;
      }
    }
  }
  if ((objc_msgSend(v15, "isUsingFPFS") & 1) == 0)
  {
    objc_msgSend(v15, "identifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "fp_toDomainIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v50, "isEqual:", CFSTR("NSFileProviderDomainDefaultIdentifier"))
      || !-[objc_class conformsToProtocol:](v45, "conformsToProtocol:", &unk_1EE5DCD30))
    {
LABEL_25:

      goto LABEL_26;
    }
    if (v45)
    {
      Superclass = v45;
      while ((objc_class *)objc_opt_class() != Superclass)
      {
        if ((objc_class *)objc_opt_class() != Superclass)
        {
          Superclass = class_getSuperclass(Superclass);
          if (Superclass)
            continue;
        }
        goto LABEL_22;
      }
      goto LABEL_25;
    }
LABEL_22:

    fp_current_or_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0A34000, v52, OS_LOG_TYPE_INFO, "[INFO] Trying to build a non-FPFS default domain for an FPFS provider", buf, 2u);
    }

    v45 = (objc_class *)FPXFakeDefaultDomainExtension;
LABEL_29:
    v55 = (FPXV2ExtensionWrapper *)objc_msgSend([v45 alloc], "initWithDomain:", v14);
    v56 = 0;
    goto LABEL_30;
  }
LABEL_26:
  if ((-[objc_class isSubclassOfClass:](v45, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(v14, "identifier");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "domainDisplayName");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    __FILEPROVIDER_V2_EXTENSION_WITHOUT_IMPL(v75, v76, (uint64_t)v45);
  }
  v53 = [FPXV2ExtensionWrapper alloc];
  -[FPXV2ExtensionWrapper setExtensionClass:](v53, "setExtensionClass:", v45);
  v54 = v53;
  v55 = -[FPXV2ExtensionWrapper initWithDomain:](v54, "initWithDomain:", v14);
  -[FPXV2ExtensionWrapper extension](v54, "extension");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
  if (!-[FPXV2ExtensionWrapper conformsToProtocol:](v55, "conformsToProtocol:", &unk_1EE5DCD30)
    && !-[FPXV2ExtensionWrapper conformsToProtocol:](v55, "conformsToProtocol:", &unk_1EE5DCD30))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (objc_class *)objc_opt_class();
    NSStringFromClass(v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("FPXExtensionContext.m"), 240, CFSTR("The principal class of the extension is not of type NSFileProviderReplicatedExtension: %@"), v74);

  }
  v16->_usesFPFS = objc_msgSend(v15, "isUsingFPFS");
  v57 = -[FPDocumentAlternateContents initWithAlternateContentsDictionary:]([FPDocumentAlternateContents alloc], "initWithAlternateContentsDictionary:", v80);
  alternateContents = v16->_alternateContents;
  v16->_alternateContents = v57;

  v59 = -[FPXDomainContext initWithVendorInstance:domain:extensionContext:providerDomain:domainVersion:]([FPXDomainContext alloc], "initWithVendorInstance:domain:extensionContext:providerDomain:domainVersion:", v55, v14, v16, v15, v82);
  domainContext = v16->_domainContext;
  v16->_domainContext = v59;

  objc_storeStrong((id *)&v16->_providerDomain, a6);
  objc_msgSend(v56, "beginRequestWithExtensionContext:", v16);
  fp_current_or_default_log();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    -[NSString fp_fpIdentifier](v16->_providerIdentifier, "fp_fpIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:domainVersion:completionHandler:].cold.2(v62, (uint64_t)v87, v61);
  }

  if (v16->_usesFPFS && !v16->_userDefaults)
  {
    v63 = v16;
    objc_sync_enter(v63);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v64 = objc_claimAutoreleasedReturnValue();
    userDefaults = v16->_userDefaults;
    v16->_userDefaults = (NSUserDefaults *)v64;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_userDefaults, "addObserver:forKeyPath:options:context:", v63, CFSTR("NSFileProviderExtensionNonMaterializingProcessNames"), 4, 0);
    objc_sync_exit(v63);

  }
  fpfs_adopt_log(v16->_log);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(v83);
    -[FPXExtensionContext beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:domainVersion:completionHandler:].cold.1();
  }

  (*((void (**)(id, _QWORD))v83 + 2))(v83, 0);
  __fp_pop_log(&v85);

  __fp_pop_log(&v86);
  objc_sync_exit(v16);

}

- (void)dealloc
{
  objc_super v3;

  self->_isBeingDeallocated = 1;
  -[FPXExtensionContext invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FPXExtensionContext;
  -[FPXExtensionContext dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  FPXExtensionContext *v2;
  FPXDomainContext *v3;
  FPXDomainContext *domainContext;
  id WeakRetained;
  void *v6;
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
  FPDDomainServicing *domainServicer;
  FPXExtensionContext *v27;
  NSUserDefaults *userDefaults;
  void **p_runningEnumerators;
  NSHashTable *runningEnumerators;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  NSObject *notificationQueue;
  _QWORD block[5];
  FPXDomainContext *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_domainContext;
  domainContext = v2->_domainContext;
  v2->_domainContext = 0;

  WeakRetained = objc_loadWeakRetained((id *)&v2->_xpcConnection);
  objc_msgSend(WeakRetained, "invalidate");

  objc_sync_exit(v2);
  if (v3)
  {
    -[FPXDomainContext domain](v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[FPXDomainContext domain](v3, "domain");
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
        -[FPXDomainContext domain](v3, "domain");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "personaIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v17, v20, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        fp_current_or_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          +[FPXExtensionContext principalClass].cold.1();

        __assert_rtn("-[FPXExtensionContext invalidate]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 294, (const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"));
      }
    }
    else
    {

    }
  }
  -[FPXDomainContext spotlightIndexer](v3, "spotlightIndexer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "invalidateAsync");

  domainServicer = v2->_domainServicer;
  v2->_domainServicer = 0;

  v27 = v2;
  objc_sync_enter(v27);
  -[NSUserDefaults removeObserver:forKeyPath:](v27->_userDefaults, "removeObserver:forKeyPath:", v27, CFSTR("NSFileProviderExtensionNonMaterializingProcessNames"));
  userDefaults = v27->_userDefaults;
  v27->_userDefaults = 0;

  objc_sync_exit(v27);
  if (v27->_isBeingDeallocated)
  {
    runningEnumerators = v27->_runningEnumerators;
    p_runningEnumerators = (void **)&v27->_runningEnumerators;
    -[NSHashTable allObjects](runningEnumerators, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *p_runningEnumerators;
    *p_runningEnumerators = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v33 = v31;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v41 != v35)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "_invalidate");
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v34);
    }

    -[FPXDomainContext invalidate](v3, "invalidate");
  }
  else
  {
    notificationQueue = v27->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__FPXExtensionContext_invalidate__block_invoke;
    block[3] = &unk_1E4449A40;
    block[4] = v27;
    v39 = v3;
    dispatch_async(notificationQueue, block);

  }
}

void __33__FPXExtensionContext_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPXExtensionContext_invalidate__block_invoke_2;
  block[3] = &unk_1E4449A40;
  v9 = v2;
  v10 = v5;
  v7 = v2;
  dispatch_async_and_wait(v6, block);

}

uint64_t __33__FPXExtensionContext_invalidate__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "_invalidate", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)sendBlockedProcessNamesUpdateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

void __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "arrayForKey:", CFSTR("NSFileProviderExtensionNonMaterializingProcessNames"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "fp_filter:", &__block_literal_global_1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E4449A88;
  v12 = *(id *)(a1 + 40);
  +[FPDaemonConnection remoteObjectProxyWithErrorHandler:](FPDaemonConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_4;
  v9[3] = &unk_1E4449A88;
  v10 = v7;
  objc_msgSend(v6, "updateBlockedProcessNamesForProvider:processNames:completionHandler:", v8, v4, v9);

}

uint64_t __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__FPXExtensionContext_sendBlockedProcessNamesUpdateWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSFileProviderExtensionNonMaterializingProcessNames"), a4, a5, a6))-[FPXExtensionContext sendBlockedProcessNamesUpdateWithCompletionHandler:](self, "sendBlockedProcessNamesUpdateWithCompletionHandler:", &__block_literal_global_172);
}

- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__FPXExtensionContext_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke;
  v7[3] = &unk_1E4449AF8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[FPXExtensionContext sendBlockedProcessNamesUpdateWithCompletionHandler:](self, "sendBlockedProcessNamesUpdateWithCompletionHandler:", v7);

}

void __82__FPXExtensionContext_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext forceUpdateBlockedProcessNamesFromDomain:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (id)domainContextForIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v11;

  v5 = a3;
  -[FPXExtensionContext domainContext](self, "domainContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXExtensionContext.m"), 391, CFSTR("Sent to wrong instance"));

  }
  return v6;
}

- (id)v2Instance
{
  FPXExtensionContext *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[FPXDomainContext v2Instance](v2->_domainContext, "v2Instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)instanceWithPrivateSelector:(SEL)a3
{
  FPXExtensionContext *v4;
  void *v5;

  v4 = self;
  objc_sync_enter(v4);
  -[FPXDomainContext instanceWithPrivateSelector:](v4->_domainContext, "instanceWithPrivateSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v5;
}

- (id)instanceForItemID:(id)a3
{
  void *v3;
  void *v4;

  -[FPXExtensionContext domainContextForItemID:](self, "domainContextForItemID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vendorInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)domainContextForItemIDs:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXExtensionContext domainContextForItemID:](self, "domainContextForItemID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_deleteIndexInDomainContexts:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *queue;
  id v14;
  id v15;
  id obj;
  _QWORD block[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  NSObject *v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = a4;
  v7 = dispatch_group_create();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v28 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        dispatch_group_enter(v7);
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke;
        v20[3] = &unk_1E4449B48;
        v20[4] = self;
        v22 = v27;
        v21 = v7;
        objc_msgSend(v12, "prepareForDomainRemovalWithCompletionHandler:", v20);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v8);
  }

  queue = self->_queue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke_3;
  block[3] = &unk_1E4449B70;
  v18 = v15;
  v19 = v27;
  v14 = v15;
  dispatch_group_notify(v7, queue, block);

  _Block_object_dispose(v27, 8);
}

void __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke_2;
  block[3] = &unk_1E4449B20;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __70__FPXExtensionContext__deleteIndexInDomainContexts_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)dropDomainWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9[0] = self->_domainContext;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FPXExtensionContext_dropDomainWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FPXExtensionContext _deleteIndexInDomainContexts:completionHandler:](self, "_deleteIndexInDomainContexts:completionHandler:", v5, v7);

}

void __55__FPXExtensionContext_dropDomainWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext dropDomainWithCompletionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (void)didChangeItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *notificationQueue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  FPXExtensionContext *v14;
  id v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  fpfs_adopt_log(self->_log);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext didChangeItemID:completionHandler:].cold.1();

  notificationQueue = self->_notificationQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__FPXExtensionContext_didChangeItemID_completionHandler___block_invoke;
  v12[3] = &unk_1E4449B98;
  v10 = v6;
  v13 = v10;
  v14 = self;
  v11 = v7;
  v15 = v11;
  fp_dispatch_async_with_logs(notificationQueue, v12);

  __fp_pop_log(&v16);
}

void __57__FPXExtensionContext_didChangeItemID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id obj;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ shouldn't be here'"), CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      +[FPXExtensionContext principalClass].cold.1();

    __assert_rtn("-[FPXExtensionContext didChangeItemID:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 466, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 16));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "copy");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")))
        {

        }
        else
        {
          objc_msgSend(v8, "observedItemID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToItemID:", *(_QWORD *)(a1 + 32));

          if (!v11)
            continue;
        }
        objc_msgSend(v8, "observer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "enumerationResultsDidChange");

        v5 = 1;
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (!v4)
      {

        if ((v5 & 1) != 0)
          goto LABEL_19;
        goto LABEL_16;
      }
    }
  }

LABEL_16:
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v25 = v14;
    _os_log_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_INFO, "[PERF] Received observation update for item identifier %@, which isn't being observed. Ignoring.", buf, 0xCu);
  }

LABEL_19:
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 48));
    __57__FPXExtensionContext_didChangeItemID_completionHandler___block_invoke_cold_2();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log(&v19);

}

- (void)startProvidingItemAtURL:(id)a3 readingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  OS_dispatch_queue *instanceQueue;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  unint64_t v20;
  void *v21;
  uint8_t buf[4];
  FPXExtensionContext *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  fpfs_adopt_log(self->_log);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "fp_shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v23 = self;
    v24 = 2080;
    v25 = "-[FPXExtensionContext startProvidingItemAtURL:readingOptions:completionHandler:]";
    v26 = 2112;
    v27 = v15;
    v28 = 2048;
    v29 = a4;
    _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, 0x%lx", buf, 0x2Au);

  }
  instanceQueue = self->_instanceQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke;
  v16[3] = &unk_1E4449BE8;
  v16[4] = self;
  v13 = v10;
  v18 = v13;
  v14 = v9;
  v17 = v14;
  v19 = a2;
  v20 = a4;
  fp_dispatch_async_with_logs(instanceQueue, v16);

  __fp_pop_log(&v21);
}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _BYTE *v22;
  uint64_t v23;
  void *v24;
  _BYTE buf[24];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "v2Instance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_cold_1(a1, (uint64_t)v2, v3);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v26) = 0;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_180;
    v18 = &unk_1E4449BC0;
    v4 = *(_QWORD *)(a1 + 56);
    v22 = buf;
    v23 = v4;
    v5 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 32);
    v20 = v5;
    v21 = *(id *)(a1 + 48);
    v6 = (void *)MEMORY[0x1A1B00850](&v15);
    v7 = objc_opt_respondsToSelector();
    v8 = *(_QWORD *)(a1 + 40);
    if ((v7 & 1) != 0)
      objc_msgSend(v2, "startProvidingItemAtURL:readingOptions:completionHandler:", v8, *(_QWORD *)(a1 + 64), v6, v15, v16, v17, v18, v19, v20);
    else
      objc_msgSend(v2, "startProvidingItemAtURL:completionHandler:", v8, v6, v15, v16, v17, v18, v19, v20);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v13 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2080;
      v26 = "-[FPXExtensionContext startProvidingItemAtURL:readingOptions:completionHandler:]_block_invoke";
      v27 = 2112;
      v28 = v14;
      _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v10 = *(_QWORD *)(a1 + 48);
    FPNotSupportedError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    __fp_pop_log(&v24);
  }

}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_180(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel_startProvidingItemAtURL_completionHandler_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("FPXExtensionContext.m"), 509, CFSTR("completion for %@ has been called twice!"), v8);

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_BYTE *)(v4 + 24) = 1;
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v10)
      __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_180_cold_2((uint64_t)v3, a1, v9);

    -[NSObject fp_strippedError](v3, "fp_strippedError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10)
      __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_180_cold_1(a1, v9);
    v11 = 0;
    v3 = v9;
  }

  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "fp_annotatedErrorWithURL:variant:", *(_QWORD *)(a1 + 40), CFSTR("Open"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    v23 = 2080;
    v24 = "-[FPXExtensionContext startProvidingItemAtURL:readingOptions:completionHandler:]_block_invoke";
    v25 = 2112;
    v26 = v17;
    _os_log_debug_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

  }
  v13 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v11, "fp_annotatedErrorWithURL:variant:", *(_QWORD *)(a1 + 40), CFSTR("Open"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  __fp_pop_log(&v18);
}

- (void)evictItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *instanceQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void *v15[7];

  v15[6] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  fpfs_adopt_log(self->_log);
  v15[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext evictItemAtURL:completionHandler:].cold.1();
  }

  instanceQueue = self->_instanceQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__FPXExtensionContext_evictItemAtURL_completionHandler___block_invoke;
  v12[3] = &unk_1E4449B98;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  fp_dispatch_async_with_logs(instanceQueue, v12);

  __fp_pop_log(v15);
}

void __56__FPXExtensionContext_evictItemAtURL_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "domainContextForURL:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceWithPrivateSelector:", sel_evictItemWithIdentifier_completionHandler_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentIdentifierForItemAtURL:", *v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[NSFileProviderExtension instanceMethodForSelector:](NSFileProviderExtension, "instanceMethodForSelector:", sel_evictItemWithIdentifier_completionHandler_);
  if (objc_msgSend(v4, "methodForSelector:", sel_evictItemWithIdentifier_completionHandler_) == v6)
  {
    objc_msgSend(v4, "stopProvidingItemAtURL:", *(_QWORD *)(a1 + 40));
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "itemIDFromVendorItemID:", v5, v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2080;
      v22 = "-[FPXExtensionContext evictItemAtURL:completionHandler:]_block_invoke";
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = 0;
      _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "itemIDFromVendorItemID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

    __fp_pop_log(&v13);
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__FPXExtensionContext_evictItemAtURL_completionHandler___block_invoke_2;
    v14[3] = &unk_1E4449C10;
    v14[4] = *(_QWORD *)(a1 + 32);
    v16 = *(id *)(a1 + 48);
    v15 = v3;
    objc_msgSend(v4, "evictItemWithIdentifier:completionHandler:", v5, v14);

  }
}

void __56__FPXExtensionContext_evictItemAtURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v5, "itemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemIDFromVendorItemID:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("evictItemWithIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v21 = v13;
    v22 = 2112;
    v23 = v15;
    v24 = 2080;
    v25 = "-[FPXExtensionContext evictItemAtURL:completionHandler:]_block_invoke_2";
    v26 = 2112;
    v27 = v17;
    v28 = 2112;
    v29 = v18;
    _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

  }
  v9 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "itemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIDFromVendorItemID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("evictItemWithIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v11, v12);

  __fp_pop_log(&v19);
}

- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15[9];

  v15[8] = *(void **)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:].cold.2();

  objc_msgSend(v9, "fp_toDomainIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:](self, "createUserInteractionSuppressingWithDomainIdentifier:withPurpose:", v12, CFSTR("UserCheckedSuppressionCheckbox"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInteractionSuppressed:forIdentifier:", 1, v8);
  fpfs_adopt_log(self->_log);
  v15[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(v10);
    -[FPXExtensionContext userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:].cold.1();
  }

  (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  __fp_pop_log(v15);

}

- (id)createUserInteractionSuppressingWithDomainIdentifier:(id)a3 withPurpose:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:].cold.1();
    goto LABEL_17;
  }
  -[FPXExtensionContext domainContextForIdentifier:](self, "domainContextForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vendorInstance");
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:].cold.2();
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSObject target](v9, "target");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = v10;
  }
  if (!-[NSObject conformsToProtocol:](v9, "conformsToProtocol:", &unk_1EE5DD150))
  {
    v12 = objc_msgSend(v7, "isEqualToString:", CFSTR("UserCheckedSuppressionCheckbox"));
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:].cold.3();
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:].cold.4();
    }

LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  v9 = v9;
  v11 = v9;
LABEL_18:

  return v11;
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 domainIdentifier:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  _BYTE v44[32];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = a4;
  v35 = a6;
  fpfs_adopt_log(self->_log);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext deleteSearchableItemsWithSpotlightDomainIdentifiers:domainIdentifier:indexReason:completionHandler:].cold.2((uint64_t)self, objc_msgSend(v38, "count"), (uint64_t)v44);

  -[FPXExtensionContext domainContextForIdentifier:](self, "domainContextForIdentifier:", v37);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v10, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personaIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentPersona");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userPersonaUniqueString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "isEqualToString:", v17);

    if ((v18 & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentPersona");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userPersonaUniqueString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "currentPersona");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "uid");
      objc_msgSend(v10, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "personaIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v22, v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext deleteSearchableItemsWithSpotlightDomainIdentifiers:domainIdentifier:indexReason:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 629, (const char *)objc_msgSend(objc_retainAutorelease(v28), "UTF8String"));
    }
  }
  else
  {

  }
  v30 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __122__FPXExtensionContext_deleteSearchableItemsWithSpotlightDomainIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke;
  v41[3] = &unk_1E4449C38;
  v31 = v37;
  v42 = v31;
  objc_msgSend(v38, "fp_map:", v41);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "spotlightIndexer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v30;
  v39[1] = 3221225472;
  v39[2] = __122__FPXExtensionContext_deleteSearchableItemsWithSpotlightDomainIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2;
  v39[3] = &unk_1E4449AF8;
  v39[4] = self;
  v34 = v35;
  v40 = v34;
  objc_msgSend(v33, "deleteSearchableItemsWithSpotlightDomainIdentifiers:indexReason:completionHandler:", v32, a5, v39);

  __fp_pop_log(&v43);
}

uint64_t __122__FPXExtensionContext_deleteSearchableItemsWithSpotlightDomainIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathExtension:", a2);
}

void __122__FPXExtensionContext_deleteSearchableItemsWithSpotlightDomainIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext deleteSearchableItemsWithSpotlightDomainIdentifiers:domainIdentifier:indexReason:complet"
          "ionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (void)removeTrashedItemsOlderThanDate:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  OS_dispatch_queue *instanceQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  fpfs_adopt_log(self->_log);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext removeTrashedItemsOlderThanDate:domainIdentifier:completionHandler:].cold.1();

  instanceQueue = self->_instanceQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E4449C60;
  v16[4] = self;
  v13 = v9;
  v17 = v13;
  v14 = v8;
  v18 = v14;
  v15 = v10;
  v19 = v15;
  fp_dispatch_async_with_logs(instanceQueue, v16);

  __fp_pop_log(&v20);
}

void __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
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
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "domainContextForIdentifier:", *(_QWORD *)(a1 + 40));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v25, "domain");
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
      objc_msgSend(v25, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext removeTrashedItemsOlderThanDate:domainIdentifier:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 651, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(*v2, "instanceWithPrivateSelector:", sel__removeTrashedItemsOlderThanDate_completionHandler_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_2;
    v27[3] = &unk_1E4449AB0;
    v27[4] = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 48);
    v28 = *(id *)(a1 + 56);
    objc_msgSend(v22, "_removeTrashedItemsOlderThanDate:completionHandler:", v23, v27);

  }
  else
  {
    fpfs_adopt_log(*((void **)*v2 + 9));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 56));
      __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log(&v26);

  }
}

void __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3[9];

  v3[8] = *(void **)MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v3[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(v3);

}

- (void)dumpInternalStateToTermDumper:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *notificationQueue;
  id v11;
  OS_dispatch_queue *instanceQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[5];
  id v19;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E4449A40;
  block[4] = self;
  v11 = v7;
  v19 = v11;
  dispatch_sync(notificationQueue, block);
  -[FPDocumentAlternateContents dumpToDumper:](self->_alternateContents, "dumpToDumper:", v11);
  instanceQueue = self->_instanceQueue;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_2;
  v15[3] = &unk_1E4449B98;
  v15[4] = self;
  v16 = v11;
  v17 = v8;
  v13 = v8;
  v14 = v11;
  fp_dispatch_async_with_logs(instanceQueue, v15);

}

void __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR("  + running enumerator (%ld):\n"), objc_msgSend(v2, "count"));
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR("%15s- %@\n"), ", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), (_QWORD)v8);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "put:", CFSTR("  + running enumerator: none\n"));
  }

}

void __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_2(id *a1)
{
  id *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 4;
  objc_msgSend(a1[4], "instanceWithPrivateSelector:", sel__dumpInternalStateToTermDumper_completionHandler_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1[5], "put:", CFSTR("\n"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_3;
    v7[3] = &unk_1E4449AF8;
    v4 = a1[5];
    v7[4] = a1[4];
    v8 = a1[6];
    objc_msgSend(v3, "_dumpInternalStateToTermDumper:completionHandler:", v4, v7);

  }
  else
  {
    fpfs_adopt_log(*((void **)*v2 + 9));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(a1[6]);
      __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_2_cold_1();
    }

    (*((void (**)(void))a1[6] + 2))();
    __fp_pop_log(&v6);

  }
}

void __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext dumpInternalStateToTermDumper:domainIdentifier:completionHandler:]_block_invoke_3";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (void)itemChangedAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void *v15[7];

  v15[6] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  fpfs_adopt_log(self->_log);
  v15[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext itemChangedAtURL:completionHandler:].cold.1();
  }

  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__FPXExtensionContext_itemChangedAtURL_completionHandler___block_invoke;
  v12[3] = &unk_1E4449C88;
  v12[4] = self;
  v10 = v7;
  v14 = v10;
  v11 = v6;
  v13 = v11;
  fp_dispatch_async_with_logs(queue, v12);

  __fp_pop_log(v15);
}

void __58__FPXExtensionContext_itemChangedAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "v2Instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "itemChangedAtURL:", *(_QWORD *)(a1 + 40));
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 48));
      __58__FPXExtensionContext_itemChangedAtURL_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    __fp_pop_log(&v12);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*v2 + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v10 = *v2;
      FPNotSupportedError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2080;
      v18 = "-[FPXExtensionContext itemChangedAtURL:completionHandler:]_block_invoke";
      v19 = 2112;
      v20 = v11;
      _os_log_debug_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v7 = *(_QWORD *)(a1 + 48);
    FPNotSupportedError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    __fp_pop_log(&v12);
  }

}

- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  OS_dispatch_queue *instanceQueue;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  FPXExtensionContext *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  fpfs_adopt_log(self->_log);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "fp_shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fp_shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = self;
    v25 = 2080;
    v26 = "-[FPXExtensionContext movingItemAtURL:requiresProvidingWithDestinationURL:completionHandler:]";
    v27 = 2112;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);

  }
  instanceQueue = self->_instanceQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__FPXExtensionContext_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler___block_invoke;
  v18[3] = &unk_1E4449C60;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v15 = v10;
  v21 = v15;
  fp_dispatch_async_with_logs(instanceQueue, v18);

  __fp_pop_log(&v22);
}

void __93__FPXExtensionContext_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "instanceWithPrivateSelector:", sel_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__FPXExtensionContext_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler___block_invoke_2;
    v12[3] = &unk_1E4449CB0;
    v3 = *(_QWORD *)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v2, "movingItemAtURL:requiresProvidingWithDestinationURL:completionHandler:", v3, v4, v12);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      v9 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2080;
      v19 = "-[FPXExtensionContext movingItemAtURL:requiresProvidingWithDestinationURL:completionHandler:]_block_invoke";
      v20 = 1024;
      v21 = 0;
      v22 = 2112;
      v23 = v10;
      _os_log_debug_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);

    }
    v6 = *(_QWORD *)(a1 + 56);
    FPNotSupportedError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    __fp_pop_log(&v11);
  }

}

void __93__FPXExtensionContext_movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2080;
    v15 = "-[FPXExtensionContext movingItemAtURL:requiresProvidingWithDestinationURL:completionHandler:]_block_invoke_2";
    v16 = 1024;
    v17 = a2;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v9);

}

- (id)fetchContentsForItemWithID:(id)a3 version:(id)a4 request:(id)a5 estimatedItemSize:(int64_t)a6 isSymlink:(BOOL)a7 extent:(id)a8 alignment:(unint64_t)a9 options:(unint64_t)a10 completionHandler:(id)a11
{
  _BOOL4 v12;
  id v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  OS_dispatch_queue *instanceQueue;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  SEL v45;
  int64_t v46;
  unint64_t v47;
  unint64_t v48;
  BOOL v49;
  void *v50;
  uint8_t buf[4];
  FPXExtensionContext *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  int64_t v58;
  __int16 v59;
  _BOOL4 v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v12 = a7;
  v63 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a11;
  if (v20)
  {
    objc_msgSend(v20, "rangeValue");
    a6 = v22;
  }
  if (a6 <= 1)
    a6 = 1;
  fpfs_adopt_log(self->_log);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413570;
    v52 = self;
    v53 = 2080;
    v54 = "-[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:"
          "options:completionHandler:]";
    v55 = 2112;
    v56 = v36;
    v57 = 2048;
    v58 = a6;
    v59 = 1024;
    v60 = v12;
    v61 = 2112;
    v62 = v19;
    _os_log_debug_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, estimated size=%lld, symlink=%{BOOL}d, %@", buf, 0x3Au);
  }

  v24 = v18;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  instanceQueue = self->_instanceQueue;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke;
  v38[3] = &unk_1E4449D78;
  v38[4] = self;
  v35 = v36;
  v39 = v35;
  v37 = v19;
  v40 = v37;
  v27 = v21;
  v44 = v27;
  v45 = a2;
  v49 = v12;
  v28 = v25;
  v41 = v28;
  v46 = a6;
  v29 = v20;
  v42 = v29;
  v30 = v24;
  v43 = v30;
  v47 = a9;
  v48 = a10;
  fp_dispatch_async_with_logs(instanceQueue, v38);
  fp_current_or_default_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:].cold.1((uint64_t)buf, objc_msgSend(v28, "totalUnitCount"), v31);

  v32 = v43;
  v33 = v28;

  __fp_pop_log(&v50);
  return v33;
}

void __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
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
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[5];
  _QWORD v59[5];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD v68[5];
  id v69;
  _BYTE v70[16];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "domainContextForItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "domain");
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
      objc_msgSend(v2, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 806, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v2, "vendorInstance");
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy_;
  v68[4] = __Block_byref_object_dispose_;
  v69 = 0;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EE5F7E60))
    v53 = v22;
  else
    v53 = 0;

  v23 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_2;
  v61[3] = &unk_1E4449CD8;
  v24 = v2;
  v62 = v24;
  v25 = *(id *)(a1 + 48);
  v26 = *(_QWORD *)(a1 + 32);
  v63 = v25;
  v64 = v26;
  v27 = *(id *)(a1 + 80);
  v28 = *(_QWORD *)(a1 + 88);
  v65 = v27;
  v66 = v68;
  v67 = v28;
  v29 = (void *)MEMORY[0x1A1B00850](v61);
  if (*(_BYTE *)(a1 + 120))
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(a1 + 48);
    v59[0] = v23;
    v59[1] = 3221225472;
    v59[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_232;
    v59[3] = &unk_1E4449D00;
    v32 = v29;
    v59[4] = *(_QWORD *)(a1 + 32);
    v60 = v32;
    objc_msgSend(v22, "itemForIdentifier:request:completionHandler:", v30, v31, v59);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(*(id *)(a1 + 56), "addChild:withPendingUnitCount:", v33, *(_QWORD *)(a1 + 96));
      objc_msgSend(*(id *)(a1 + 56), "setCancellable:", objc_msgSend(v33, "isCancellable"));
    }

    v34 = &v60;
  }
  else
  {
    v35 = *(void **)(a1 + 64);
    if (v35 && v53)
    {
      v36 = objc_msgSend(v35, "rangeValue");
      v38 = v37;
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "versionRewritingBeforeFirstSync");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v24;
      v41 = *(_QWORD *)(a1 + 48);
      v42 = *(_QWORD *)(a1 + 112);
      v51 = *(_QWORD *)(a1 + 104);
      v56[0] = v23;
      v56[1] = 3221225472;
      v56[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_2_240;
      v56[3] = &unk_1E4449D28;
      v58[0] = v29;
      v58[2] = v36;
      v58[3] = v38;
      v58[4] = *(_QWORD *)(a1 + 104);
      v57 = *(id *)(a1 + 40);
      v58[1] = v68;
      v43 = v41;
      v24 = v52;
      objc_msgSend(v53, "fetchPartialContentsForItemWithIdentifier:version:request:minimalRange:aligningTo:options:completionHandler:", v39, v40, v43, v36, v38, v51, v42, v56);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        objc_msgSend(*(id *)(a1 + 56), "addChild:withPendingUnitCount:", v44, *(_QWORD *)(a1 + 96));
        objc_msgSend(*(id *)(a1 + 56), "setCancellable:", objc_msgSend(v44, "isCancellable"));
      }

      v34 = (id *)v58;
    }
    else
    {
      v54[0] = v23;
      v54[1] = 3221225472;
      v54[2] = __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_3;
      v54[3] = &unk_1E4449D50;
      v55 = v29;
      v45 = (void *)MEMORY[0x1A1B00850](v54);
      v46 = *(_QWORD *)(a1 + 112);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v46 & 1) != 0)
        v48 = *(_QWORD *)(a1 + 72);
      else
        v48 = 0;
      objc_msgSend(v22, "fetchContentsForItemWithIdentifier:version:request:completionHandler:", v47, v48, *(_QWORD *)(a1 + 48), v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(*(id *)(a1 + 56), "addChild:withPendingUnitCount:", v49, *(_QWORD *)(a1 + 96));
        objc_msgSend(*(id *)(a1 + 56), "setCancellable:", objc_msgSend(v49, "isCancellable"));
      }
      fp_current_or_default_log();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        -[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:].cold.1((uint64_t)v70, objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"), v50);

      v34 = &v55;
    }
  }

  _Block_object_dispose(v68, 8);
}

void __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = a5;
  objc_msgSend(v11, "currentResponseWithRequest:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", v13, CFSTR("fetchContentsForItemWithID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 48) + 72));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v29 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      v30 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134220034;
      v37 = v29;
      v38 = 2112;
      v39 = v30;
      v40 = 2080;
      v41 = "-[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignmen"
            "t:options:completionHandler:]_block_invoke_2";
      v42 = 2112;
      v43 = 0;
      v44 = 2112;
      v45 = 0;
      v46 = 2112;
      v47 = v14;
      v48 = 2112;
      v49 = 0;
      v50 = 2048;
      v51 = a4;
      v52 = 2112;
      v53 = v15;
      _os_log_debug_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %lu, %@", buf, 0x5Cu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log(&v35);

    goto LABEL_13;
  }
  if (v10)
  {
    if (!v9)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 72);
    v19 = *(_QWORD *)(a1 + 48);
    NSStringFromSelector(sel_fetchContentsForItemWithIdentifier_version_completionHandler_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("FPXExtensionContext.m"), 823, CFSTR("Call to %@ returned no item but no error"), v20);

    if (!v9)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 72);
      v23 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(sel_fetchContentsForItemWithIdentifier_version_completionHandler_);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, CFSTR("FPXExtensionContext.m"), 824, CFSTR("Call to %@ returned no contents but no error"), v24);

    }
  }
  v34 = 0;
  +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v9, 0, &v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v34;
  objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 48) + 72));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v31 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    v32 = *(_QWORD *)(a1 + 48);
    v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 134220034;
    v37 = v31;
    v38 = 2112;
    v39 = v32;
    v40 = 2080;
    v41 = "-[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:"
          "options:completionHandler:]_block_invoke";
    v42 = 2112;
    v43 = v25;
    v44 = 2112;
    v45 = v27;
    v46 = 2112;
    v47 = v14;
    v48 = 2112;
    v49 = v33;
    v50 = 2048;
    v51 = a4;
    v52 = 2112;
    v53 = v26;
    _os_log_debug_impl(&dword_1A0A34000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %lu, %@", buf, 0x5Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  __fp_pop_log(&v35);

LABEL_13:
}

void __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_232(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "contentType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CEC3F8];
      objc_msgSend(v5, "typeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fp_cachedTypeWithIdentifier:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x1E0CEC5F8])
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = *(void **)(a1 + 32);
      v23 = 0;
      objc_msgSend(v11, "createFPTempDirectoryWithError:", &v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v23;
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLByAppendingPathComponent:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "symlinkTargetPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
          v18 = (const char *)objc_msgSend(objc_retainAutorelease(v17), "fileSystemRepresentation");
        else
          v18 = "";
        v21 = objc_retainAutorelease(v16);
        if (symlink(v18, (const char *)objc_msgSend(v21, "fileSystemRepresentation")))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeItemAtURL:error:", v21, 0);

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          v7 = 0;
        }

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v7 = 0;
      }

    }
    else
    {
      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v19 + 16))(v19, 0, 0, 0, v20);

      v7 = 0;
    }

  }
}

void __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_2_240(uint64_t a1, void *a2, void *a3, unint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a2;
  v12 = a3;
  v13 = v12;
  if (a7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v12, "documentSize");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "longLongValue");
    v16 = *(_QWORD *)(a1 + 56);
    if (a4 > v16)
      goto LABEL_8;
    v17 = a4 + a5;
    v18 = *(_QWORD *)(a1 + 64) + v16;
    if (v18 >= v15)
      v18 = v15;
    if (v17 < v18 || (v19 = *(_QWORD *)(a1 + 72), a4 % v19) || v17 != v15 && a5 % v19)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0;
    }
    else
    {
      v20 = 0;
      v21 = 1;
    }
    v22 = v20;

    if ((v21 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a4, a5);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

    }
    else
    {
      __FILEPROVIDER_BAD_EXTENT__(*(void **)(a1 + 32), a4, a5);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __137__FPXExtensionContext_fetchContentsForItemWithID_version_request_estimatedItemSize_isSymlink_extent_alignment_options_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchContentsForItemWithID:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 request:(id)a7 estimatedItemSize:(int64_t)a8 isSymlink:(BOOL)a9 completionHandler:(id)a10
{
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  int64_t v38;
  NSObject *v39;
  void *v40;
  OS_dispatch_queue *instanceQueue;
  id v42;
  void *v43;
  id v44;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  FPXExtensionContext *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  SEL v65;
  int64_t v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  uint8_t buf[4];
  FPXExtensionContext *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  int64_t v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v49 = a4;
  v47 = a5;
  v48 = a6;
  v52 = a7;
  v50 = a10;
  v51 = v16;
  -[FPXExtensionContext domainContextForItemID:](self, "domainContextForItemID:", v16);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "personaIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v53, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "personaIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentPersona");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "userPersonaUniqueString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v20, "isEqualToString:", v23);

    if ((v24 & 1) == 0)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "currentPersona");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "userPersonaUniqueString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "currentPersona");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "uid");
      objc_msgSend(v53, "domain");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "personaIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v28, v31, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:request:estimatedItemSize:isSymlink:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 952, (const char *)objc_msgSend(objc_retainAutorelease(v34), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v53, "vendorInstance");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "conformsToProtocol:", &unk_1EE5DCE90))
    v37 = v36;
  else
    v37 = 0;

  if (v37)
  {
    if (a8 <= 1)
      v38 = 1;
    else
      v38 = a8;
    fpfs_adopt_log(self->_log);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      v71 = self;
      v72 = 2080;
      v73 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:request:"
            "estimatedItemSize:isSymlink:completionHandler:]";
      v74 = 2112;
      v75 = v51;
      v76 = 2048;
      v77 = v38;
      v78 = 2112;
      v79 = v52;
      _os_log_debug_impl(&dword_1A0A34000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, estimated size=%lld, %@", buf, 0x34u);
    }

    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    instanceQueue = self->_instanceQueue;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke_249;
    v54[3] = &unk_1E4449DF0;
    v55 = v47;
    v56 = v53;
    v57 = v52;
    v58 = self;
    v64 = v50;
    v65 = a2;
    v59 = v37;
    v60 = v51;
    v61 = v49;
    v62 = v48;
    v42 = v40;
    v63 = v42;
    v66 = v38;
    fp_dispatch_async_with_logs(instanceQueue, v54);
    v43 = v63;
    v44 = v42;

    __fp_pop_log(&v67);
  }
  else
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke;
    v68[3] = &unk_1E4449DA0;
    v69 = v50;
    -[FPXExtensionContext fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:](self, "fetchContentsForItemWithID:version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:", v51, v49, v52, a8, a9, 0, 0, 0, v68);
    v44 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v44;
}

uint64_t __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke_249(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  char v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startAccessingSecurityScopedResource");
  v36 = 0;
  v4 = *MEMORY[0x1E0C99948];
  v35 = 0;
  v5 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v36, v4, &v35);
  v6 = v36;
  v7 = v35;
  if ((v5 & 1) != 0)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke_250;
    v24 = &unk_1E4449DC8;
    v25 = *(id *)(a1 + 40);
    v26 = *(id *)(a1 + 48);
    v33 = v3;
    v8 = v2;
    v9 = *(_QWORD *)(a1 + 56);
    v27 = v8;
    v28 = v9;
    v10 = *(id *)(a1 + 104);
    v11 = *(_QWORD *)(a1 + 112);
    v31 = v10;
    v32 = v11;
    v29 = v6;
    v30 = *(id *)(a1 + 32);
    v12 = (void *)MEMORY[0x1A1B00850](&v21);
    v13 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 72), "identifier", v21, v22, v23, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "versionRewritingBeforeFirstSync");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchContentsForItemWithIdentifier:version:usingExistingContentsAtURL:existingVersion:request:completionHandler:", v14, v15, v8, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(*(id *)(a1 + 96), "addChild:withPendingUnitCount:", v16, *(_QWORD *)(a1 + 120));

    v17 = v25;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "currentResponseWithRequest:", *(_QWORD *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 56) + 72));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = FPPopLogSectionForBlock(*(void **)(a1 + 104));
      v20 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134219778;
      v38 = v19;
      v39 = 2112;
      v40 = v20;
      v41 = 2080;
      v42 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:request:"
            "estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
      v43 = 2112;
      v44 = 0;
      v45 = 2112;
      v46 = 0;
      v47 = 2112;
      v48 = v17;
      v49 = 2048;
      v50 = 0;
      v51 = 2112;
      v52 = v7;
      _os_log_debug_impl(&dword_1A0A34000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
    __fp_pop_log(&v34);

  }
}

void __155__FPXExtensionContext_fetchContentsForItemWithID_version_usingExistingContentsAtURL_existingVersion_request_estimatedItemSize_isSymlink_completionHandler___block_invoke_250(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "currentResponseWithRequest:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 96))
    objc_msgSend(*(id *)(a1 + 48), "stopAccessingSecurityScopedResource");
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", v9, CFSTR("fetchContentsForItemWithIDIncremental"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 56) + 72));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v30 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
      v31 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134219778;
      v44 = v30;
      v45 = 2112;
      v46 = v31;
      v47 = 2080;
      v48 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:request:"
            "estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
      v49 = 2112;
      v50 = 0;
      v51 = 2112;
      v52 = 0;
      v53 = 2112;
      v54 = v10;
      v55 = 2048;
      v56 = 0;
      v57 = 2112;
      v58 = v11;
      _os_log_debug_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    __fp_pop_log(&v42);

  }
  else
  {
    v41 = 0;
    v13 = *MEMORY[0x1E0C99948];
    v40 = 0;
    v14 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v41, v13, &v40);
    v15 = v41;
    v11 = v40;
    if ((v14 & 1) != 0)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 88);
        v18 = *(_QWORD *)(a1 + 56);
        NSStringFromSelector(sel_fetchContentsForItemWithIdentifier_version_usingExistingContentsAtURL_existingVersion_completionHandler_);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v17, v18, CFSTR("FPXExtensionContext.m"), 1017, CFSTR("Call to %@ returned no item but no error"), v19);

      }
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 88);
        v22 = *(_QWORD *)(a1 + 56);
        NSStringFromSelector(sel_fetchContentsForItemWithIdentifier_version_usingExistingContentsAtURL_existingVersion_completionHandler_);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v21, v22, CFSTR("FPXExtensionContext.m"), 1018, CFSTR("Call to %@ returned no contents but no error"), v23);

      }
      objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 64)))
      {
        fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 56) + 72));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v34 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
          v35 = *(_QWORD *)(a1 + 56);
          v36 = *(void **)(a1 + 72);
          *(_DWORD *)buf = 134219778;
          v44 = v34;
          v45 = 2112;
          v46 = v35;
          v47 = 2080;
          v48 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:requ"
                "est:estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
          v49 = 2112;
          v50 = v36;
          v51 = 2112;
          v52 = v24;
          v53 = 2112;
          v54 = v10;
          v55 = 2048;
          v56 = 0;
          v57 = 2112;
          v58 = 0;
          _os_log_debug_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
        __fp_pop_log(&v42);

      }
      else
      {
        v39 = v11;
        +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v7, 0, &v39);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v39;

        fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 56) + 72));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v37 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
          v38 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 134219778;
          v44 = v37;
          v45 = 2112;
          v46 = v38;
          v47 = 2080;
          v48 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:requ"
                "est:estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
          v49 = 2112;
          v50 = v27;
          v51 = 2112;
          v52 = v24;
          v53 = 2112;
          v54 = v10;
          v55 = 2048;
          v56 = 0;
          v57 = 2112;
          v58 = v28;
          _os_log_debug_impl(&dword_1A0A34000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
        __fp_pop_log(&v42);

        v11 = v28;
      }

    }
    else
    {
      fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 56) + 72));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v32 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
        v33 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 134219778;
        v44 = v32;
        v45 = 2112;
        v46 = v33;
        v47 = 2080;
        v48 = "-[FPXExtensionContext fetchContentsForItemWithID:version:usingExistingContentsAtURL:existingVersion:reques"
              "t:estimatedItemSize:isSymlink:completionHandler:]_block_invoke";
        v49 = 2112;
        v50 = 0;
        v51 = 2112;
        v52 = 0;
        v53 = 2112;
        v54 = v10;
        v55 = 2048;
        v56 = 0;
        v57 = 2112;
        v58 = v11;
        _os_log_debug_impl(&dword_1A0A34000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %lu, %@", buf, 0x52u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      __fp_pop_log(&v42);

    }
  }

}

- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  OS_dispatch_queue *instanceQueue;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint8_t buf[4];
  FPXExtensionContext *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  fpfs_adopt_log(self->_log);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    v48 = self;
    v49 = 2080;
    v50 = "-[FPXExtensionContext modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]";
    v51 = 2112;
    v52 = v14;
    v53 = 1024;
    v54 = a5;
    v55 = 1024;
    v56 = a7;
    v57 = 2112;
    v58 = v16;
    v59 = 2112;
    v60 = v17;
    _os_log_debug_impl(&dword_1A0A34000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@ fields=%x options=%x contentURL=%@ %@", buf, 0x40u);
  }

  if (v16)
  {
    objc_msgSend(v14, "documentSize");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "longLongValue");

    if (v21 <= 1)
      v22 = 1;
    else
      v22 = v21;
  }
  else
  {
    v22 = 100;
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v22, a7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  instanceQueue = self->_instanceQueue;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __103__FPXExtensionContext_modifyItem_baseVersion_changedFields_contents_options_request_completionHandler___block_invoke;
  v36[3] = &unk_1E4449E40;
  v36[4] = self;
  v25 = v14;
  v37 = v25;
  v26 = v16;
  v38 = v26;
  v27 = v17;
  v39 = v27;
  v28 = v18;
  v42 = v28;
  v29 = v15;
  v40 = v29;
  v43 = a5;
  v44 = v35;
  v30 = v23;
  v41 = v30;
  v45 = v22;
  fp_dispatch_async_with_logs(instanceQueue, v36);
  v31 = v41;
  v32 = v30;

  __fp_pop_log(&v46);
  return v32;
}

void __103__FPXExtensionContext_modifyItem_baseVersion_changedFields_contents_options_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainContextForItemID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "personaIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentPersona");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userPersonaUniqueString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentPersona");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userPersonaUniqueString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentPersona");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "uid");
      objc_msgSend(v4, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personaIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v16, v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1071, (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v4, "vendorInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "url");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "startAccessingSecurityScopedResource");
  v25 = *(void **)(a1 + 32);
  v26 = *(_QWORD *)(a1 + 40);
  v50 = 0;
  v51 = v24;
  v27 = objc_msgSend(v25, "_inlineSymlinkTarget:url:error:", v26, &v51, &v50);
  v28 = v51;

  v29 = v50;
  if ((v27 & 1) != 0)
  {
    v30 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 64), "versionRewritingBeforeFirstSync");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 88);
    v33 = *(_QWORD *)(a1 + 96);
    v34 = *(_QWORD *)(a1 + 56);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __103__FPXExtensionContext_modifyItem_baseVersion_changedFields_contents_options_request_completionHandler___block_invoke_255;
    v43[3] = &unk_1E4449E18;
    v35 = v28;
    v36 = *(_QWORD *)(a1 + 32);
    v44 = v35;
    v45 = v36;
    v46 = v4;
    v47 = *(id *)(a1 + 56);
    v48 = *(id *)(a1 + 80);
    objc_msgSend(v42, "modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:", v30, v31, v32, v35, v33, v34, v43);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      objc_msgSend(*(id *)(a1 + 72), "addChild:withPendingUnitCount:", v37, *(_QWORD *)(a1 + 104));

    v38 = v44;
  }
  else
  {
    objc_msgSend(v4, "currentResponseWithRequest:", *(_QWORD *)(a1 + 56));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v40 = FPPopLogSectionForBlock(*(void **)(a1 + 80));
      v41 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219778;
      v53 = v40;
      v54 = 2112;
      v55 = v41;
      v56 = 2080;
      v57 = "-[FPXExtensionContext modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]_block_invoke";
      v58 = 2112;
      v59 = 0;
      v60 = 1024;
      v61 = 0;
      v62 = 1024;
      v63 = 0;
      v64 = 2112;
      v65 = v38;
      v66 = 2112;
      v67 = v29;
      _os_log_debug_impl(&dword_1A0A34000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, 0x%x, %{BOOL}d, %@, %@", buf, 0x4Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    __fp_pop_log(&v49);

  }
}

void __103__FPXExtensionContext_modifyItem_baseVersion_changedFields_contents_options_request_completionHandler___block_invoke_255(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = *(void **)(a1 + 32);
  v11 = a5;
  objc_msgSend(v10, "stopAccessingSecurityScopedResource");
  objc_msgSend(*(id *)(a1 + 48), "itemFromVendorItem:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "currentResponseWithRequest:", *(_QWORD *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "internalErrorFromVendorError:callerDescription:", v11, CFSTR("modifyItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134219778;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    v23 = 2080;
    v24 = "-[FPXExtensionContext modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]_block_invoke";
    v25 = 2112;
    v26 = v12;
    v27 = 2048;
    v28 = a3;
    v29 = 1024;
    v30 = a4;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = v14;
    _os_log_debug_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, 0x%lx, %{BOOL}d, %@, %@", buf, 0x4Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  __fp_pop_log(&v18);

}

- (void)singleItemChange:(id)a3 changedFields:(unint64_t)a4 bounce:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__FPXExtensionContext_singleItemChange_changedFields_bounce_completionHandler___block_invoke;
  v14[3] = &unk_1E4449E90;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  -[FPXExtensionContext _singleItemChange:changedFields:bounce:bounceIndex:request:completionHandler:](self, "_singleItemChange:changedFields:bounce:bounceIndex:request:completionHandler:", v11, a4, v6, 1, v12, v14);

}

void __79__FPXExtensionContext_singleItemChange_changedFields_bounce_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v27[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__FPXExtensionContext_singleItemChange_changedFields_bounce_completionHandler___block_invoke_2;
    v13[3] = &unk_1E4449E68;
    v13[4] = *(_QWORD *)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    v14 = v5;
    v15 = v6;
    objc_msgSend(v7, "_indexOutOfBandUpdatedItems:deletedItems:indexReason:completionHandler:", v8, MEMORY[0x1E0C9AA60], 1, v13);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2080;
      v22 = "-[FPXExtensionContext singleItemChange:changedFields:bounce:completionHandler:]_block_invoke";
      v23 = 2112;
      v24 = 0;
      v25 = 2112;
      v26 = v6;
      _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v12);

  }
}

void __79__FPXExtensionContext_singleItemChange_changedFields_bounce_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134219010;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2080;
    v13 = "-[FPXExtensionContext singleItemChange:changedFields:bounce:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_debug_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  __fp_pop_log(&v7);

}

- (void)_singleItemChange:(id)a3 changedFields:(unint64_t)a4 bounce:(BOOL)a5 bounceIndex:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  OS_dispatch_queue *instanceQueue;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;

  v14 = a3;
  v15 = a7;
  v16 = a8;
  instanceQueue = self->_instanceQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke;
  v21[3] = &unk_1E4449F08;
  v21[4] = self;
  v22 = v14;
  v25 = a4;
  v26 = a6;
  v27 = a5;
  v23 = v15;
  v24 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  fp_dispatch_async_with_logs(instanceQueue, v21);

}

void __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  char v42;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainContextForItemID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "domain");
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
      objc_msgSend(v4, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "personaIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v17, v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext _singleItemChange:changedFields:bounce:bounceIndex:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1147, (const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v4, "vendorInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(id *)(a1 + 40);
  v27 = *(_QWORD *)(a1 + 64);
  if (*(_QWORD *)(a1 + 72) >= 2uLL)
  {
    v28 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");

    objc_msgSend(*(id *)(a1 + 40), "filename");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fp_bouncedNameWithIndex:isDir:", *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 40), "isFolder"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFilename:", v30);

    v27 |= 2uLL;
    v26 = v28;
  }
  objc_msgSend(*(id *)(a1 + 40), "itemVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_2;
  v36[3] = &unk_1E4449EE0;
  v42 = *(_BYTE *)(a1 + 80);
  v32 = *(void **)(a1 + 40);
  v33 = *(_QWORD *)(a1 + 48);
  v36[4] = *(_QWORD *)(a1 + 32);
  v37 = v4;
  v38 = v32;
  v41 = *(_OWORD *)(a1 + 64);
  v39 = *(id *)(a1 + 48);
  v40 = *(id *)(a1 + 56);
  v34 = v4;
  v35 = (id)objc_msgSend(v25, "modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:", v26, v31, v27, 0, 0x10000, v33, v36);

}

void __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  char v23;

  v7 = a2;
  v8 = a5;
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_3;
  v14[3] = &unk_1E4449EB8;
  v15 = v9;
  v16 = v8;
  v23 = *(_BYTE *)(a1 + 88);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(id *)(a1 + 48);
  v22 = *(_OWORD *)(a1 + 72);
  v19 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v20 = v7;
  v21 = v11;
  v12 = v7;
  v13 = v8;
  dispatch_async(v10, v14);

}

void __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", *(_QWORD *)(a1 + 40), CFSTR("singleItemChange"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 104)
    && (objc_msgSend(v2, "fp_userInfoItem"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_3_cold_1();

    objc_msgSend(*(id *)(a1 + 48), "_singleItemChange:changedFields:bounce:bounceIndex:request:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 104), *(_QWORD *)(a1 + 96) + 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", *(_QWORD *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v3);

  }
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  OS_dispatch_queue *instanceQueue;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19[9];

  v19[8] = *(void **)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    instanceQueue = self->_instanceQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke;
    v14[3] = &unk_1E4449FA8;
    v14[4] = self;
    v15 = v10;
    v16 = v8;
    v18 = a4;
    v17 = v9;
    fp_dispatch_async_with_logs(instanceQueue, v14);

  }
  else
  {
    fpfs_adopt_log(self->_log);
    v19[0] = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(v9);
      -[FPXExtensionContext bulkItemChanges:changedFields:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    __fp_pop_log(v19);

  }
}

void __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
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
  NSObject *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  id obj;
  uint64_t v37;
  void *v38;
  void *v40;
  _QWORD block[5];
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[4];
  id v46;
  NSObject *v47;
  id v48;
  _QWORD *v49;
  _QWORD *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "domainContextForItemID:", v2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v40, "domain");
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
      objc_msgSend(v40, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext bulkItemChanges:changedFields:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1202, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v40, "vendorInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = dispatch_group_create();
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy_;
  v57[4] = __Block_byref_object_dispose_;
  v58 = 0;
  v58 = (id)objc_opt_new();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy_;
  v55[4] = __Block_byref_object_dispose_;
  v56 = 0;
  v56 = (id)objc_opt_new();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = *(id *)(a1 + 48);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v23)
  {
    v37 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v52 != v37)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x1A1B00664]();
        dispatch_group_enter(v22);
        objc_msgSend(v25, "itemIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "itemVersion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "versionRewritingBeforeFirstSync");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(a1 + 64);
        +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_2;
        v45[3] = &unk_1E4449F30;
        v46 = v40;
        v47 = v22;
        v49 = v57;
        v32 = v27;
        v48 = v32;
        v50 = v55;
        v33 = (id)objc_msgSend(v38, "modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:", v25, v29, v30, 0, 0x10000, v31, v45);

        objc_autoreleasePoolPop(v26);
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v23);
  }

  v34 = *(_QWORD *)(a1 + 32);
  v35 = *(NSObject **)(v34 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_3;
  block[3] = &unk_1E4449F80;
  block[4] = v34;
  v43 = v57;
  v42 = *(id *)(a1 + 56);
  v44 = v55;
  dispatch_group_notify(v22, v35, block);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

}

void __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v7 = a5;
  objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", v7, CFSTR("bulkItemChanges"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(id *)(a1 + 40);
  objc_sync_enter(v10);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 48));
  objc_sync_exit(v10);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_3(int8x16_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  int8x16_t v7;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[3].i64[0] + 8) + 40), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_4;
  v5[3] = &unk_1E4449F58;
  v4 = (void *)a1[2].i64[1];
  v5[4] = a1[2].i64[0];
  v6 = v4;
  v7 = vextq_s8(a1[3], a1[3], 8uLL);
  objc_msgSend(v2, "_indexOutOfBandUpdatedItems:deletedItems:indexReason:completionHandler:", v3, MEMORY[0x1E0C9AA60], 1, v5);

}

void __71__FPXExtensionContext_bulkItemChanges_changedFields_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 32);
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
      v8 = 0;
    else
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    else
      v9 = 0;
    *(_DWORD *)buf = 134219010;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2080;
    v16 = "-[FPXExtensionContext bulkItemChanges:changedFields:completionHandler:]_block_invoke_4";
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_debug_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  v3 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    v4 = 0;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  else
    v5 = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, v5, 0);
  __fp_pop_log(&v10);

}

- (void)indexOneBatchInDomain:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  id v37;
  _QWORD v39[5];
  id v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = a4;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v5;
    _os_log_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] fileproviderd ask us to index one batch for %@", buf, 0xCu);
  }

  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext indexOneBatchInDomain:completionHandler:].cold.7();

  -[FPXExtensionContext domainContextForIdentifier:](self, "domainContextForIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "personaIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentPersona");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userPersonaUniqueString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentPersona");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userPersonaUniqueString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentPersona");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "uid");
      objc_msgSend(v8, "domain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "personaIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v20, v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext indexOneBatchInDomain:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1250, (const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String"));
    }
  }
  else
  {

  }
  if (v8)
  {
    objc_msgSend(v8, "log");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = fpfs_adopt_log(v28);

    if (objc_msgSend(v8, "usesFPFS"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trying to use %s on a domain that is backed by FPFS"), "-[FPXExtensionContext indexOneBatchInDomain:completionHandler:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext indexOneBatchInDomain:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1260, (const char *)objc_msgSend(objc_retainAutorelease(v35), "UTF8String"));
    }
    objc_msgSend(v8, "spotlightIndexer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __63__FPXExtensionContext_indexOneBatchInDomain_completionHandler___block_invoke;
      v39[3] = &unk_1E4449CB0;
      v39[4] = self;
      v40 = v37;
      objc_msgSend(v30, "indexOneBatchWithCompletionHandler:", v39);

    }
    else
    {
      fp_current_or_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        -[FPXExtensionContext indexOneBatchInDomain:completionHandler:].cold.5();

      fpfs_adopt_log(self->_log);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock(v37);
        -[FPXExtensionContext indexOneBatchInDomain:completionHandler:].cold.1();
      }

      (*((void (**)(id, _QWORD, _QWORD))v37 + 2))(v37, 0, 0);
      __fp_pop_log(&v41);

    }
  }
  else
  {
    fp_current_or_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[FPXExtensionContext indexOneBatchInDomain:completionHandler:].cold.2();

    fpfs_adopt_log(self->_log);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(v37);
      -[FPXExtensionContext indexOneBatchInDomain:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD, _QWORD))v37 + 2))(v37, 0, 0);
    __fp_pop_log(&v41);

  }
}

void __63__FPXExtensionContext_indexOneBatchInDomain_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] index one batch: done (responding to fileproviderd)", buf, 2u);
  }

  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPXExtensionContext indexOneBatchInDomain:completionHandler:]_block_invoke";
    v17 = 1024;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v10);

}

- (void)dropIndexForDomain:(id)a3 dropReason:(unint64_t)a4 completionHandler:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v37;
  _QWORD v38[5];
  id v39;
  void *v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v6 = a5;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v37;
    _os_log_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] fileproviderd ask us to drop index for %@", buf, 0xCu);
  }

  -[FPXExtensionContext domainContextForIdentifier:](self, "domainContextForIdentifier:", v37);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "personaIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentPersona");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userPersonaUniqueString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentPersona");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userPersonaUniqueString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentPersona");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "uid");
      objc_msgSend(v8, "domain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "personaIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v20, v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1287, (const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String"));
    }
  }
  else
  {

  }
  if (v8)
  {
    objc_msgSend(v8, "log");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = fpfs_adopt_log(v28);

    objc_msgSend(v8, "spotlightIndexer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:].cold.4();

      fpfs_adopt_log(self->_log);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock(v6);
        -[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:].cold.1();
      }

      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
      __fp_pop_log(&v40);

    }
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __71__FPXExtensionContext_dropIndexForDomain_dropReason_completionHandler___block_invoke;
    v38[3] = &unk_1E4449AF8;
    v38[4] = self;
    v39 = v6;
    objc_msgSend(v30, "dropIndexWithDropReason:completionHandler:", a4, v38);

  }
  else
  {
    fp_current_or_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:].cold.2();

    fpfs_adopt_log(self->_log);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(v6);
      -[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    __fp_pop_log(&v40);

  }
}

void __71__FPXExtensionContext_dropIndexForDomain_dropReason_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext dropIndexForDomain:dropReason:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (void)signalNeedsReindexItemsWithIdentifiers:(id)a3 domainIdentifier:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *instanceQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  instanceQueue = self->_instanceQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke;
  v17[3] = &unk_1E4449FF8;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v20 = v12;
  v21 = a5;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  fp_dispatch_async_with_logs(instanceQueue, v17);

}

void __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;

  objc_msgSend(*(id *)(a1 + 32), "v2Instance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "domainContextForIdentifier:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personaIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v3, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "personaIdentifier");
      v34 = v2;
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentPersona");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userPersonaUniqueString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "isEqualToString:", v11);

      v2 = v34;
      if ((v12 & 1) == 0)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "currentPersona");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "userPersonaUniqueString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "currentPersona");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "uid");
        objc_msgSend(v3, "domain");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "personaIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v16, v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        fp_current_or_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          +[FPXExtensionContext principalClass].cold.1();

        __assert_rtn("-[FPXExtensionContext signalNeedsReindexItemsWithIdentifiers:domainIdentifier:indexReason:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1321, (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
      }
    }
    else
    {

    }
    v27 = (void *)objc_opt_new();
    v28 = *(void **)(a1 + 48);
    v29 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2;
    v37[3] = &unk_1E4449FD0;
    v38 = v2;
    v26 = v3;
    v39 = v26;
    v30 = v27;
    v40 = v30;
    objc_msgSend(v28, "fp_map:", v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count") || objc_msgSend(v30, "count"))
    {
      objc_msgSend(v26, "spotlightIndexer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v29;
      v35[1] = 3221225472;
      v35[2] = __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_270;
      v35[3] = &unk_1E4449A88;
      v33 = *(_QWORD *)(a1 + 64);
      v36 = *(id *)(a1 + 56);
      objc_msgSend(v32, "indexOutOfBandUpdatedItems:deletedItems:indexReason:completionHandler:", v31, v30, v33, v35);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_cold_1();

    v25 = *(_QWORD *)(a1 + 56);
    FPNotSupportedError();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v25 + 16))(v25, v26);
  }

}

id __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  FPItemID *v11;
  void *v12;
  void *v13;
  FPItemID *v14;
  void *v15;
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v4, "itemForIdentifier:error:", v3, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("NSFileProviderErrorDomain")))
    v8 = objc_msgSend(v6, "code") == -1005;
  else
    v8 = 0;

  if (!v6 || v8)
  {
    if (v5)
      v10 = v8;
    else
      v10 = 1;
    if (v10 != 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "itemFromVendorItem:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v11 = [FPItemID alloc];
    objc_msgSend(*(id *)(a1 + 40), "providerDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FPItemID initWithProviderDomainID:itemIdentifier:](v11, "initWithProviderDomainID:itemIdentifier:", v13, v3);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
  }
  else
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2_cold_1(v6, v9);

  }
  v15 = 0;
LABEL_16:

  return v15;
}

uint64_t __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_270(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dumpIndexStateForDomain:(id)a3 toFileHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  FPCTLTermDumper *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35[9];

  v35[8] = *(void **)MEMORY[0x1E0C80C00];
  v8 = a3;
  v33 = a4;
  v9 = a5;
  v32 = v8;
  -[FPXExtensionContext domainContextForIdentifier:](self, "domainContextForIdentifier:", v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personaIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v34, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "personaIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentPersona");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userPersonaUniqueString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "isEqualToString:", v16);

    if ((v17 & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "currentPersona");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "userPersonaUniqueString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "currentPersona");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "uid");
      objc_msgSend(v34, "domain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "personaIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v21, v24, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext dumpIndexStateForDomain:toFileHandler:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1356, (const char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v34, "spotlightIndexer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[FPCTLTermDumper initWithFd:forceColor:]([FPCTLTermDumper alloc], "initWithFd:forceColor:", objc_msgSend(v33, "fileDescriptor"), 1);
  objc_msgSend(v29, "dumpStateTo:", v30);

  fpfs_adopt_log(self->_log);
  v35[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(v9);
    -[FPXExtensionContext dumpIndexStateForDomain:toFileHandler:completionHandler:].cold.1();
  }

  (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  __fp_pop_log(v35);

}

- (void)preflightTrashItemIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *instanceQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  instanceQueue = self->_instanceQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke;
  v11[3] = &unk_1E4449B98;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  fp_dispatch_async_with_logs(instanceQueue, v11);

}

void __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD block[4];
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v38 = (void *)objc_opt_new();
  v36 = a1;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a1 + 32;
  objc_msgSend(v2, "domainContextForItemIDs:", v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v37, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "personaIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentPersona");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userPersonaUniqueString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentPersona");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userPersonaUniqueString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentPersona");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "uid");
      objc_msgSend(v37, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personaIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v16, v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext preflightTrashItemIDs:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1371, (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v37, "instanceWithPrivateSelector:", sel_preflightTrashItemWithIdentifier_completionHandler_);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v24 = dispatch_group_create();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v25 = *(id *)(v36 + 40);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v49 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v30 = (void *)MEMORY[0x1A1B00664]();
          dispatch_group_enter(v24);
          objc_msgSend(v29, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_274;
          v45[3] = &unk_1E444A020;
          v46 = v24;
          v47 = v38;
          objc_msgSend(v39, "preflightTrashItemWithIdentifier:completionHandler:", v31, v45);

          objc_autoreleasePoolPop(v30);
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v26);
    }

    v32 = *(NSObject **)(*(_QWORD *)(v36 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_2;
    block[3] = &unk_1E4449C60;
    v41 = v38;
    v33 = v37;
    v34 = *(_QWORD *)(v36 + 32);
    v42 = v33;
    v43 = v34;
    v44 = *(id *)(v36 + 48);
    dispatch_group_notify(v24, v32, block);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)v4 + 72));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(v36 + 48));
      __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(v36 + 48) + 16))();
    __fp_pop_log(&v52);

  }
}

void __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_274(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);
  objc_sync_exit(v3);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_3;
  v8[3] = &unk_1E444A048;
  v2 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fp_map:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 48) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2080;
    v15 = "-[FPXExtensionContext preflightTrashItemIDs:completionHandler:]_block_invoke_2";
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  __fp_pop_log(&v7);

}

uint64_t __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", a2, CFSTR("preflightTrashItemIDs"));
}

- (void)providePlaceholderAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *instanceQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  instanceQueue = self->_instanceQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__FPXExtensionContext_providePlaceholderAtURL_completionHandler___block_invoke;
  v11[3] = &unk_1E4449C88;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  fp_dispatch_async_with_logs(instanceQueue, v11);

}

void __65__FPXExtensionContext_providePlaceholderAtURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "v2Instance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "placeholderURLForURL:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__FPXExtensionContext_providePlaceholderAtURL_completionHandler___block_invoke_279;
    v13[3] = &unk_1E444A070;
    v13[4] = *(_QWORD *)(a1 + 32);
    v5 = *(id *)(a1 + 48);
    v14 = v3;
    v15 = v5;
    v6 = v3;
    objc_msgSend(v2, "providePlaceholderAtURL:completionHandler:", v4, v13);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v11 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2080;
      v22 = "-[FPXExtensionContext providePlaceholderAtURL:completionHandler:]_block_invoke";
      v23 = 2112;
      v24 = 0;
      v25 = 2112;
      v26 = v12;
      _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v8 = *(_QWORD *)(a1 + 48);
    FPNotSupportedError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    __fp_pop_log(&v16);
  }

}

void __65__FPXExtensionContext_providePlaceholderAtURL_completionHandler___block_invoke_279(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "fp_strippedError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    v17 = 2080;
    v18 = "-[FPXExtensionContext providePlaceholderAtURL:completionHandler:]_block_invoke";
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "fp_strippedError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  __fp_pop_log(&v12);
}

- (id)alternateContentsURLWrapperForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  NSObject *v11;

  v4 = a3;
  -[FPDocumentAlternateContents getAlternateContentsURLWrapperForItemID:](self->_alternateContents, "getAlternateContentsURLWrapperForItemID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "startAccessingSecurityScopedResource");
  v9 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0);
  if (v8)
    objc_msgSend(v7, "stopAccessingSecurityScopedResource");
  if (!v9)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FPXExtensionContext alternateContentsURLWrapperForItemID:].cold.1(v7, v11);

    -[FPDocumentAlternateContents removeAlternateContentsURLForDocumentWithItemID:](self->_alternateContents, "removeAlternateContentsURLForDocumentWithItemID:", v4);
    goto LABEL_9;
  }
  objc_msgSend(v7, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C998D8]);
  objc_msgSend(v7, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99998]);
  v10 = v6;

LABEL_10:
  return v10;
}

- (void)fetchAlternateContentsURLWrapperForURL:(id)a3 completionHandler:(id)a4
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
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__FPXExtensionContext_fetchAlternateContentsURLWrapperForURL_completionHandler___block_invoke;
  v10[3] = &unk_1E444A098;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[FPXExtensionContext identifierForItemAtURL:completionHandler:](self, "identifierForItemAtURL:completionHandler:", v9, v10);

}

void __80__FPXExtensionContext_fetchAlternateContentsURLWrapperForURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __80__FPXExtensionContext_fetchAlternateContentsURLWrapperForURL_completionHandler___block_invoke_cold_1();

  if (v5)
  {
    objc_msgSend(*v7, "alternateContentsURLWrapperForItemID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  fpfs_adopt_log(*((void **)*v7 + 9));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v12 = *v7;
    *(_DWORD *)buf = 134219010;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2080;
    v20 = "-[FPXExtensionContext fetchAlternateContentsURLWrapperForURL:completionHandler:]_block_invoke";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v6;
    _os_log_debug_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log(&v13);

  __fp_pop_log(&v14);
}

- (void)setAlternateContentsURL:(id)a3 forDocumentWithURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__FPXExtensionContext_setAlternateContentsURL_forDocumentWithURL_completionHandler___block_invoke;
  v12[3] = &unk_1E444A098;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[FPXExtensionContext identifierForItemAtURL:completionHandler:](self, "identifierForItemAtURL:completionHandler:", a4, v12);

}

void __84__FPXExtensionContext_setAlternateContentsURL_forDocumentWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fp_shortDescription");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v17 = v9;
    v18 = 2080;
    v19 = "-[FPXExtensionContext setAlternateContentsURL:forDocumentWithURL:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v5;
    _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);

  }
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlternateContentsURLWrapper:forDocumentWithItemID:", *(_QWORD *)(a1 + 40), v5);
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v13 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2080;
    v21 = "-[FPXExtensionContext setAlternateContentsURL:forDocumentWithURL:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_debug_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log(&v14);

  __fp_pop_log(&v15);
}

- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke;
  v8[3] = &unk_1E4449E90;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[FPXExtensionContext itemForURL:completionHandler:](self, "itemForURL:completionHandler:", a3, v8);

}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v40 = a3;
  v41 = v5;
  if (v5)
  {
    objc_msgSend(v5, "itemID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "domainContextForItemID:", v39);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "personaIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "personaIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentPersona");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userPersonaUniqueString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "isEqualToString:", v13);

      if ((v14 & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "currentPersona");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "userPersonaUniqueString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "currentPersona");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "uid");
        objc_msgSend(v6, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "personaIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v18, v21, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        fp_current_or_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          +[FPXExtensionContext principalClass].cold.1();

        __assert_rtn("-[FPXExtensionContext didUpdateAlternateContentsDocumentForDocumentWithURL:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1490, (const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String"));
      }
    }
    else
    {

    }
    objc_msgSend(v6, "vendorInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "providerItemID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2;
    v42[3] = &unk_1E444A0E8;
    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(void **)(a1 + 40);
    v43 = v29;
    v44 = v31;
    v46 = v6;
    v47 = v32;
    v45 = v39;
    v33 = v6;
    v34 = v39;
    v35 = v29;
    v36 = (id)objc_msgSend(v27, "itemForIdentifier:request:completionHandler:", v35, v30, v42);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v37 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v38 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      v50 = v37;
      v51 = 2112;
      v52 = v38;
      v53 = 2080;
      v54 = "-[FPXExtensionContext didUpdateAlternateContentsDocumentForDocumentWithURL:completionHandler:]_block_invoke";
      v55 = 2112;
      v56 = v40;
      _os_log_debug_impl(&dword_1A0A34000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v48);

  }
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "alternateContentsURLWrapperForItemID:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(NSObject **)(v8 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_281;
      block[3] = &unk_1E444A0C0;
      block[4] = v8;
      v21 = *(id *)(a1 + 56);
      v22 = v5;
      v23 = v7;
      dispatch_async(v9, block);
      fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock(*(void **)(a1 + 64));
        __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_4();
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      __fp_pop_log(&v24);

    }
    else
    {
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_3();

      fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock(*(void **)(a1 + 64));
        __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_2();
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      __fp_pop_log(&v24);

    }
  }
  else
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_1(a1, v6, v11);

    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v17 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      v18 = *(_QWORD *)(a1 + 40);
      FPItemNotFoundError(*(_QWORD *)(a1 + 32));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      v29 = 2080;
      v30 = "-[FPXExtensionContext didUpdateAlternateContentsDocumentForDocumentWithURL:completionHandler:]_block_invoke";
      v31 = 2112;
      v32 = v19;
      _os_log_debug_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v13 = *(_QWORD *)(a1 + 64);
    FPItemNotFoundError(*(_QWORD *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

    __fp_pop_log(&v24);
  }

}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_281(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "itemFromVendorItem:", *(_QWORD *)(a1 + 48), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alternateContentsWereUpdatedAtURL:forItem:", v9, v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)identifierForItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *instanceQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void *v15[7];

  v15[6] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  fpfs_adopt_log(self->_log);
  v15[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext identifierForItemAtURL:completionHandler:].cold.1();
  }

  instanceQueue = self->_instanceQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__FPXExtensionContext_identifierForItemAtURL_completionHandler___block_invoke;
  v12[3] = &unk_1E4449B98;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  fp_dispatch_async_with_logs(instanceQueue, v12);

  __fp_pop_log(v15);
}

void __64__FPXExtensionContext_identifierForItemAtURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "domainContextForURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "domain");
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
      objc_msgSend(v2, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext identifierForItemAtURL:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1533, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "v2Instance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "persistentIdentifierForItemAtURL:", *(_QWORD *)(a1 + 40));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v31 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v32 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v2, "itemIDFromVendorItemID:", v24);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v39 = v31;
      v40 = 2112;
      v41 = v32;
      v42 = 2080;
      v43 = "-[FPXExtensionContext identifierForItemAtURL:completionHandler:]_block_invoke";
      v44 = 2112;
      v45 = v33;
      v46 = 2112;
      v47 = 0;
      _os_log_debug_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v26 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "itemIDFromVendorItemID:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v26 + 16))(v26, v27, 0);

    __fp_pop_log(&v37);
  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v34 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v35 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v39 = v34;
      v40 = 2112;
      v41 = v35;
      v42 = 2080;
      v43 = "-[FPXExtensionContext identifierForItemAtURL:completionHandler:]_block_invoke";
      v44 = 2112;
      v45 = 0;
      v46 = 2112;
      v47 = v36;
      _os_log_debug_impl(&dword_1A0A34000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v29 = *(_QWORD *)(a1 + 48);
    FPNotSupportedError();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v29 + 16))(v29, 0, v30);

    __fp_pop_log(&v37);
  }

}

- (void)itemForItemID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  OS_dispatch_queue *instanceQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  void *v20;
  uint8_t buf[4];
  FPXExtensionContext *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  fpfs_adopt_log(self->_log);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v22 = self;
    v23 = 2080;
    v24 = "-[FPXExtensionContext itemForItemID:request:completionHandler:]";
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }

  instanceQueue = self->_instanceQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__FPXExtensionContext_itemForItemID_request_completionHandler___block_invoke;
  v16[3] = &unk_1E4449C60;
  v16[4] = self;
  v13 = v8;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v15 = v10;
  v19 = v15;
  fp_dispatch_async_with_logs(instanceQueue, v16);

  __fp_pop_log(&v20);
}

void __63__FPXExtensionContext_itemForItemID_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;

  objc_msgSend(*(id *)(a1 + 32), "domainContextForItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v2, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPersonaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPersona");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userPersonaUniqueString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "uid");
      objc_msgSend(v2, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personaIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v15, v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext itemForItemID:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1553, (const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v2, "vendorInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __63__FPXExtensionContext_itemForItemID_request_completionHandler___block_invoke_2;
  v30[3] = &unk_1E444A110;
  v31 = v2;
  v25 = *(void **)(a1 + 48);
  v32 = v25;
  v26 = *(id *)(a1 + 40);
  v27 = *(_QWORD *)(a1 + 32);
  v33 = v26;
  v34 = v27;
  v35 = *(id *)(a1 + 56);
  v28 = v2;
  v29 = (id)objc_msgSend(v23, "itemForIdentifier:request:completionHandler:", v24, v25, v30);

}

void __63__FPXExtensionContext_itemForItemID_request_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  FPItem *v13;
  void *v14;
  void *v15;
  void *v16;
  FPItem *v17;
  NSObject *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  FPItem *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "currentResponseWithRequest:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(v5 | v6))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("NSFileProviderTrashContainerItemIdentifier"));

  if (v9)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", v5);
    v17 = (FPItem *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("itemForItemID"));
    v11 = objc_claimAutoreleasedReturnValue();

    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 56) + 72));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v20 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      v21 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134219266;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      v29 = 2080;
      v30 = "-[FPXExtensionContext itemForItemID:request:completionHandler:]_block_invoke";
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v7;
      v35 = 2112;
      v36 = v11;
      _os_log_debug_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log(&v24);

    v6 = v11;
  }
  else
  {
    v13 = [FPItem alloc];
    objc_msgSend(*(id *)(a1 + 48), "providerDomainID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FPItem initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:isDirectory:](v13, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:isDirectory:", v14, v15, v16, CFSTR(".Trash"), 1);

    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 56) + 72));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v22 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      v23 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134219266;
      v26 = v22;
      v27 = 2112;
      v28 = v23;
      v29 = 2080;
      v30 = "-[FPXExtensionContext itemForItemID:request:completionHandler:]_block_invoke_2";
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v7;
      v35 = 2112;
      v36 = 0;
      _os_log_debug_impl(&dword_1A0A34000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log(&v24);

  }
}

- (void)itemForURL:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  void *v34[7];

  v34[6] = *(void **)MEMORY[0x1E0C80C00];
  v30 = a3;
  v29 = a4;
  fpfs_adopt_log(self->_log);
  v34[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v30, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext itemForURL:completionHandler:].cold.2();
  }

  -[FPXExtensionContext domainContextForURL:](self, "domainContextForURL:", v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personaIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "personaIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentPersona");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userPersonaUniqueString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentPersona");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userPersonaUniqueString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentPersona");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "uid");
      objc_msgSend(v7, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "personaIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v19, v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext itemForURL:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1586, (const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
    }
  }
  else
  {

  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52__FPXExtensionContext_itemForURL_completionHandler___block_invoke;
  v31[3] = &unk_1E444A160;
  v31[4] = self;
  v27 = v29;
  v33 = v27;
  v28 = v7;
  v32 = v28;
  -[FPXExtensionContext identifierForItemAtURL:completionHandler:](self, "identifierForItemAtURL:completionHandler:", v30, v31);

  __fp_pop_log(v34);
}

void __52__FPXExtensionContext_itemForURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v17 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("itemForURL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      v30 = 2080;
      v31 = "-[FPXExtensionContext itemForURL:completionHandler:]_block_invoke";
      v32 = 2112;
      v33 = 0;
      v34 = 2112;
      v35 = v19;
      _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("itemForURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    __fp_pop_log(&v25);
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __52__FPXExtensionContext_itemForURL_completionHandler___block_invoke_289;
      v23[3] = &unk_1E444A138;
      v23[4] = *(_QWORD *)(a1 + 32);
      v24 = *(id *)(a1 + 48);
      objc_msgSend(v11, "itemForItemID:request:completionHandler:", v5, v12, v23);

    }
    else
    {
      fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v20 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
        v21 = *(_QWORD *)(a1 + 32);
        v14 = *MEMORY[0x1E0CB28A8];
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v27 = v20;
        v28 = 2112;
        v29 = v21;
        v30 = 2080;
        v31 = "-[FPXExtensionContext itemForURL:completionHandler:]_block_invoke";
        v32 = 2112;
        v33 = 0;
        v34 = 2112;
        v35 = v22;
        _os_log_debug_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      else
      {
        v14 = *MEMORY[0x1E0CB28A8];
      }

      v15 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v14, 256, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

      __fp_pop_log(&v25);
    }
  }

}

void __52__FPXExtensionContext_itemForURL_completionHandler___block_invoke_289(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2080;
    v19 = "-[FPXExtensionContext itemForURL:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v9;
    _os_log_debug_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v13);

}

- (void)_persistedDocumentURLForURL:(id)a3 itemID:(id)a4 extension:(id)a5 creatingPlaceholderIfMissing:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, id, _QWORD);

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, id, _QWORD))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_instanceQueue);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXExtensionContext.m"), 1614, CFSTR("url should not be nil"));

  }
  if ((objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    _CFURLPromiseSetPhysicalURL();
    v16[2](v16, v13, 0);
  }
  else
  {
    +[NSFileProviderManager placeholderURLForURL:](NSFileProviderManager, "placeholderURLForURL:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _CFURLPromiseSetPhysicalURL();
    if (v18 && objc_msgSend(v18, "checkResourceIsReachableAndReturnError:", 0))
    {
      v16[2](v16, v13, 0);
    }
    else if (v8)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __115__FPXExtensionContext__persistedDocumentURLForURL_itemID_extension_creatingPlaceholderIfMissing_completionHandler___block_invoke;
      v21[3] = &unk_1E444A188;
      v23 = v16;
      v22 = v13;
      objc_msgSend(v15, "providePlaceholderAtURL:completionHandler:", v22, v21);

    }
    else
    {
      objc_msgSend(v14, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundError((uint64_t)v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, void *))v16)[2](v16, 0, v20);

    }
  }

}

void __115__FPXExtensionContext__persistedDocumentURLForURL_itemID_extension_creatingPlaceholderIfMissing_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "fp_strippedError");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  OS_dispatch_queue *instanceQueue;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  BOOL v20;
  void *v21;
  uint8_t buf[4];
  FPXExtensionContext *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v7 = a5;
  v8 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  fpfs_adopt_log(self->_log);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v23 = self;
    v24 = 2080;
    v25 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
    v26 = 2112;
    v27 = v10;
    v28 = 1024;
    v29 = v8;
    v30 = 1024;
    v31 = v7;
    _os_log_debug_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %{BOOL}d, %{BOOL}d", buf, 0x2Cu);
  }

  instanceQueue = self->_instanceQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke;
  v16[3] = &unk_1E444A1D8;
  v16[4] = self;
  v14 = v10;
  v17 = v14;
  v15 = v11;
  v18 = v15;
  v19 = v7;
  v20 = v8;
  fp_dispatch_async_with_logs(instanceQueue, v16);

  __fp_pop_log(&v21);
}

void __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "v2Instance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "domainContextForItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "domainContextForItemID:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPersonaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPersona");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userPersonaUniqueString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "uid");
      objc_msgSend(*(id *)(a1 + 32), "domainContextForItemID:", *(_QWORD *)(a1 + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personaIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v15, v18, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1655, (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    }
  }
  else
  {

  }
  if (v46)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v24 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "alternateContentsURLWrapperForItemID:", *(_QWORD *)(a1 + 40));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "URLForItemWithPersistentIdentifier:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = *(void **)(a1 + 32);
      v31 = *(_QWORD *)(a1 + 40);
      v32 = *(unsigned __int8 *)(a1 + 57);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_293;
      v48[3] = &unk_1E444A1B0;
      v48[4] = v30;
      v51 = *(id *)(a1 + 48);
      v49 = v29;
      v50 = v24;
      objc_msgSend(v30, "_persistedDocumentURLForURL:itemID:extension:creatingPlaceholderIfMissing:completionHandler:", v49, v31, v46, v32, v48);

    }
    else
    {
      if (v24)
      {
        fp_current_or_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v54 = v34;
          _os_log_impl(&dword_1A0A34000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] alternate contents URL found for item ID: %@, but original item URL was not found", buf, 0xCu);
        }

      }
      fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v42 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
        v43 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        FPItemNotFoundError((uint64_t)v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        v54 = v42;
        v55 = 2112;
        v56 = v43;
        v57 = 2080;
        v58 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandl"
              "er:]_block_invoke";
        v59 = 2112;
        v60 = 0;
        v61 = 2112;
        v62 = 0;
        v63 = 2112;
        v64 = v45;
        _os_log_debug_impl(&dword_1A0A34000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

      }
      v36 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundError((uint64_t)v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v36 + 16))(v36, 0, 0, v38);

      __fp_pop_log(&v52);
    }

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v39 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v40 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v54 = v39;
      v55 = 2112;
      v56 = v40;
      v57 = 2080;
      v58 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]_block_invoke";
      v59 = 2112;
      v60 = 0;
      v61 = 2112;
      v62 = 0;
      v63 = 2112;
      v64 = v41;
      _os_log_debug_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

    }
    v26 = *(_QWORD *)(a1 + 48);
    FPNotSupportedError();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v26 + 16))(v26, 0, 0, v27);

    __fp_pop_log(&v52);
  }

}

void __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_293(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v17 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      v31 = 2080;
      v32 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]_block_invoke";
      v33 = 2112;
      v34 = 0;
      v35 = 2112;
      v36 = 0;
      v37 = 2112;
      v38 = v6;
      _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log(&v26);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v25 = 0;
    +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v8, 0, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v25;
    if (v9)
    {
      fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v19 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(void **)(a1 + 48);
        if (v21)
        {
          v22 = v9;
        }
        else
        {
          v21 = v9;
          v22 = 0;
        }
        *(_DWORD *)buf = 134219266;
        v28 = v19;
        v29 = 2112;
        v30 = v20;
        v31 = 2080;
        v32 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandl"
              "er:]_block_invoke";
        v33 = 2112;
        v34 = v21;
        v35 = 2112;
        v36 = v22;
        v37 = 2112;
        v38 = v10;
        _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
      }

      v12 = *(_QWORD *)(a1 + 48);
      if (v12)
        v13 = *(void **)(a1 + 48);
      else
        v13 = v9;
      if (v12)
        v14 = v9;
      else
        v14 = 0;
      (*(void (**)(_QWORD, void *, void *, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v13, v14, v10);
      __fp_pop_log(&v26);

    }
    else
    {
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_293_cold_1();

      fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v23 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
        v24 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134219266;
        v28 = v23;
        v29 = 2112;
        v30 = v24;
        v31 = 2080;
        v32 = "-[FPXExtensionContext URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandl"
              "er:]_block_invoke";
        v33 = 2112;
        v34 = 0;
        v35 = 2112;
        v36 = 0;
        v37 = 2112;
        v38 = v10;
        _os_log_debug_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      __fp_pop_log(&v26);

    }
  }

}

- (void)_setupItemForTrashing:(id)a3 usesFPFS:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void (**v9)(id, void *, uint64_t);

  v5 = a4;
  v9 = (void (**)(id, void *, uint64_t))a5;
  objc_msgSend(a3, "strippedCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTrashed:", 1);
  if (v5)
  {
    objc_msgSend(v7, "setParentItemIdentifier:", CFSTR("NSFileProviderTrashContainerItemIdentifier"));
    v8 = 1073741828;
  }
  else
  {
    v8 = 0x40000000;
  }
  v9[2](v9, v7, v8);

}

- (void)trashItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *instanceQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  instanceQueue = self->_instanceQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke;
  v11[3] = &unk_1E4449B98;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  fp_dispatch_async_with_logs(instanceQueue, v11);

}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "domainContextForURL:", *(_QWORD *)(a1 + 40));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "v2Instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_297;
      v16[3] = &unk_1E444A200;
      v4 = *(_QWORD *)(a1 + 40);
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = *(id *)(a1 + 48);
      v18 = v20;
      objc_msgSend(v3, "_trashItemAtURLWithoutCoordination:completionHandler:", v4, v16);

    }
    else
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_300;
      v13[3] = &unk_1E444A2A0;
      v13[4] = v8;
      v14 = *(id *)(a1 + 48);
      v15 = v20;
      objc_msgSend(v8, "identifierForItemAtURL:completionHandler:", v9, v13);

    }
  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v11 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      v26 = 2080;
      v27 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
      v28 = 2112;
      v29 = 0;
      v30 = 2112;
      v31 = v12;
      _os_log_debug_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    FPNotSupportedError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    __fp_pop_log(&v19);
  }

  _Block_object_dispose(v20, 8);
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_297(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("trashItemAtURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2080;
    v19 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v12;
    _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

  }
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("trashItemAtURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v9);

  __fp_pop_log(&v13);
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_300(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_301;
    v14[3] = &unk_1E444A278;
    v14[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v15 = v9;
    v16 = v10;
    objc_msgSend(v7, "itemForItemID:request:completionHandler:", v5, v8, v14);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2080;
      v23 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
      v24 = 2112;
      v25 = 0;
      v26 = 2112;
      v27 = v6;
      _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v17);

  }
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_301(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v38 = a3;
  v39 = a4;
  if (v7)
  {
    objc_msgSend(v7, "itemID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v43 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domainContextForItemIDs:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personaIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "personaIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentPersona");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userPersonaUniqueString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v16, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "currentPersona");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "userPersonaUniqueString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "currentPersona");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "uid");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "domain");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "personaIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v24, v27, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        fp_current_or_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          +[FPXExtensionContext principalClass].cold.1();

        __assert_rtn("-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1744, (const char *)objc_msgSend(objc_retainAutorelease(v30), "UTF8String"));
      }
    }
    else
    {

    }
    v33 = *(void **)(a1 + 32);
    v34 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "usesFPFS");
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_2;
    v40[3] = &unk_1E444A250;
    v40[4] = *(_QWORD *)(a1 + 32);
    v41 = *(id *)(a1 + 40);
    objc_msgSend(v33, "_setupItemForTrashing:usesFPFS:completionHandler:", v7, v34, v40);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v35 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v36 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v45 = v35;
      v46 = 2112;
      v47 = v36;
      v48 = 2080;
      v49 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
      v50 = 2112;
      v51 = 0;
      v52 = 2112;
      v53 = v39;
      _os_log_debug_impl(&dword_1A0A34000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v42);

  }
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_3;
  v6[3] = &unk_1E4449E90;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v5;
  objc_msgSend(v7, "singleItemChange:changedFields:bounce:completionHandler:", a2, a3, 0, v6);

}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2080;
      v25 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke_3";
      v26 = 2112;
      v27 = 0;
      v28 = 2112;
      v29 = v6;
      _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v19);

  }
  else
  {
    objc_msgSend(v5, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v15 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v24 = 2080;
        v25 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
        v26 = 2112;
        v27 = v8;
        v28 = 2112;
        v29 = 0;
        _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      __fp_pop_log(&v19);

    }
    else
    {
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_3_cold_1();

      v11 = *(void **)(a1 + 32);
      objc_msgSend(v5, "itemID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_302;
      v17[3] = &unk_1E444A228;
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = *(id *)(a1 + 40);
      objc_msgSend(v11, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:", v12, 0, 0, v17);

    }
  }

}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_302(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
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
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2080;
    v22 = "-[FPXExtensionContext trashItemAtURL:completionHandler:]_block_invoke";
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v9;
    _os_log_debug_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v9);

  __fp_pop_log(&v16);
}

- (void)startOperation:(id)a3 toFetchThumbnailsForItemIdentifiers:(id)a4 size:(CGSize)a5 completionHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  id v14;
  OS_dispatch_queue *instanceQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  FPXExtensionContext *v21;
  id v22;
  id v23;
  SEL v24;
  CGFloat v25;
  CGFloat v26;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  instanceQueue = self->_instanceQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke;
  v19[3] = &unk_1E444A3A8;
  v20 = v13;
  v21 = self;
  v22 = v12;
  v23 = v14;
  v24 = a2;
  v25 = width;
  v26 = height;
  v16 = v12;
  v17 = v14;
  v18 = v13;
  fp_dispatch_async_with_logs(instanceQueue, v19);

}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
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
  id v22;
  uint64_t v23;
  void *v24;
  dispatch_group_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  unint64_t v59;
  _QWORD v61[4];
  NSObject *v62;
  uint64_t v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  NSObject *v69;
  id v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 40), "domainContextForItemIDs:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "domain");
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
      objc_msgSend(v2, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext startOperation:toFetchThumbnailsForItemIdentifiers:size:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1776, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v2, "vendorInstance");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EE5DCF58))
    v59 = (unint64_t)v22;
  else
    v59 = 0;

  objc_msgSend(*(id *)(a1 + 40), "instanceWithPrivateSelector:", sel_fetchThumbnailsForItemIdentifiers_requestedSize_perThumbnailCompletionHandlerWithType_completionHandler_);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v59 | v23)
  {
    objc_msgSend(*(id *)(a1 + 40), "_proxyWithCancellationHandler:forClientOperation:", 0, *(_QWORD *)(a1 + 48));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fp_map:", &__block_literal_global_315);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = dispatch_group_create();
    v26 = MEMORY[0x1E0C809B0];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2;
    v68[3] = &unk_1E444A330;
    v27 = v25;
    v69 = v27;
    v70 = *(id *)(a1 + 48);
    v28 = v2;
    v74 = *(_QWORD *)(a1 + 64);
    v29 = *(_QWORD *)(a1 + 40);
    v71 = v28;
    v72 = v29;
    v57 = v24;
    v73 = v57;
    v66[0] = v26;
    v66[1] = 3221225472;
    v66[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_328;
    v66[3] = &unk_1E444A358;
    v30 = (id)MEMORY[0x1A1B00850](v68);
    v67 = v30;
    v31 = (void *)MEMORY[0x1A1B00850](v66);
    v61[0] = v26;
    v61[1] = 3221225472;
    v61[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_330;
    v61[3] = &unk_1E444A380;
    v32 = v27;
    v33 = *(_QWORD *)(a1 + 40);
    v62 = v32;
    v63 = v33;
    v65 = *(id *)(a1 + 56);
    v64 = v28;
    v34 = (void *)MEMORY[0x1A1B00850](v61);
    v35 = *(double *)(a1 + 72);
    v36 = *(double *)(a1 + 80);
    if (v23)
      objc_msgSend((id)v23, "fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandlerWithType:completionHandler:", v58, v30, v34, v35, v36);
    else
      objc_msgSend((id)v59, "fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandler:completionHandler:", v58, v31, v34, v35, v36);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (id)objc_msgSend(*(id *)(a1 + 40), "_proxyWithCancellationHandler:forClientOperation:", v46, *(_QWORD *)(a1 + 48));

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v48 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      v49 = *(_QWORD *)(a1 + 40);
      FPInvalidParameterError((uint64_t)CFSTR("item identifiers"), 0, v50, v51, v52, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v77 = v48;
      v78 = 2112;
      v79 = v49;
      v80 = 2080;
      v81 = "-[FPXExtensionContext startOperation:toFetchThumbnailsForItemIdentifiers:size:completionHandler:]_block_invoke";
      v82 = 2112;
      v83 = v56;
      _os_log_debug_impl(&dword_1A0A34000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v38 = *(_QWORD *)(a1 + 56);
    FPInvalidParameterError((uint64_t)CFSTR("item identifiers"), 0, v39, v40, v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v45);

    __fp_pop_log(&v75);
  }

}

uint64_t __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_313(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_cold_1();

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "internalErrorFromVendorError:callerDescription:", v12, CFSTR("startFetchThumbnailOperation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("thumbnailData"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("contentType"));
    v16 = *(void **)(a1 + 64);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_326;
    v18[3] = &unk_1E444A308;
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v16, "operationDidProgressWithInfo:error:completionHandler:", v15, v14, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), CFSTR("FPXExtensionContext.m"), 1804, CFSTR("UNREACHABLE: thumbnail completion callback was called with a nil identifier"));

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_326(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_326_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_328(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_330(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_330_cold_1();

  v6 = *(NSObject **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(v5 + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_331;
  v9[3] = &unk_1E4449E68;
  v9[4] = v5;
  v12 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v8 = v3;
  dispatch_group_notify(v6, v7, v9);

}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_331(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", *(_QWORD *)(a1 + 48), CFSTR("startFetchThumbnailOperationOverall"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2080;
    v14 = "-[FPXExtensionContext startOperation:toFetchThumbnailsForItemIdentifiers:size:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v7;
    _os_log_debug_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

  }
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", *(_QWORD *)(a1 + 48), CFSTR("startFetchThumbnailOperationOverall"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  __fp_pop_log(&v8);
}

- (id)createFPTempDirectoryWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;

  -[FPXDomainContext domain](self->_domainContext, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSFileProviderManager managerForDomain:](NSFileProviderManager, "managerForDomain:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend(v5, "temporaryDirectoryURLWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FPXExtensionContext createFPTempDirectoryWithError:].cold.1(v7, v9);

    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  return v6;
}

- (id)createFPTempDirectoryAppropriateForURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v5, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FPXExtensionContext createFPTempDirectoryAppropriateForURL:error:].cold.1((uint64_t)v5, v8, v10);

    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v7;
}

- (id)createTempThumbnailURLForVersion:(id)a3 appropriateForURL:(id)a4 itemIdentifier:(id)a5 isFromData:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12)
    objc_msgSend(v12, "etagHash");
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_current"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = &stru_1E4450B40;
  if (v8)
    v20 = CFSTR("_from_data");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_%@%@"), v18, v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[FPXExtensionContext createFPTempDirectoryAppropriateForURL:error:](self, "createFPTempDirectoryAppropriateForURL:error:", v13, a7);
  else
    -[FPXExtensionContext createFPTempDirectoryWithError:](self, "createFPTempDirectoryWithError:", a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", v21, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)startOperation:(id)a3 toFetchThumbnailsWithDictionary:(id)a4 size:(CGSize)a5 completionHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  id v14;
  OS_dispatch_queue *instanceQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  FPXExtensionContext *v21;
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  SEL v26;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  instanceQueue = self->_instanceQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke;
  v19[3] = &unk_1E444A3A8;
  v20 = v13;
  v21 = self;
  v22 = v12;
  v23 = v14;
  v24 = width;
  v25 = height;
  v26 = a2;
  v16 = v12;
  v17 = v14;
  v18 = v13;
  fp_dispatch_async_with_logs(instanceQueue, v19);

}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  void *v35;
  void *v36;
  dispatch_group_t v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id obj;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  NSObject *v81;
  uint64_t v82;
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[4];
  NSObject *v90;
  id v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  const char *v107;
  __int16 v108;
  void *v109;
  void *v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_cold_3(a1, v2);

  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainContextForItemIDs:", v4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v74, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v74, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "personaIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentPersona");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userPersonaUniqueString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentPersona");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userPersonaUniqueString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentPersona");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "uid");
      objc_msgSend(v74, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personaIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v16, v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext startOperation:toFetchThumbnailsWithDictionary:size:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 1918, (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v74, "vendorInstance");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "conformsToProtocol:", &unk_1EE5F7EC0))
  {
    v24 = v70;
    v25 = v70;
    v73 = v24;
  }
  else
  {
    v73 = 0;
    v25 = v70;
  }

  objc_msgSend(*(id *)(a1 + 40), "instanceWithPrivateSelector:", sel_fetchThumbnailsForDictionary_requestedSize_perThumbnailCompletionHandlerWithMetadata_completionHandler_);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceWithPrivateSelector:", sel_fetchThumbnailsForDictionary_requestedSize_perThumbnailCompletionHandlerDataURLWithMetadata_completionHandler_);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73 || v71 || v72)
  {
    objc_msgSend(*(id *)(a1 + 40), "_proxyWithCancellationHandler:forClientOperation:", 0, *(_QWORD *)(a1 + 48));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = dispatch_group_create();
    v38 = MEMORY[0x1E0C809B0];
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_352;
    v89[3] = &unk_1E444A3D0;
    v39 = v37;
    v90 = v39;
    v91 = *(id *)(a1 + 48);
    v40 = v74;
    v95 = *(_QWORD *)(a1 + 80);
    v41 = *(_QWORD *)(a1 + 40);
    v92 = v40;
    v93 = v41;
    obj = v36;
    v94 = obj;
    v87[0] = v38;
    v87[1] = 3221225472;
    v87[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_363;
    v87[3] = &unk_1E444A3F8;
    v42 = (id)MEMORY[0x1A1B00850](v89);
    v87[4] = *(_QWORD *)(a1 + 40);
    v88 = v42;
    v85[0] = v38;
    v85[1] = 3221225472;
    v85[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_2;
    v85[3] = &unk_1E444A420;
    v69 = (id)MEMORY[0x1A1B00850](v87);
    v86 = v69;
    v68 = (void *)MEMORY[0x1A1B00850](v85);
    v80[0] = v38;
    v80[1] = 3221225472;
    v80[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_3;
    v80[3] = &unk_1E444A380;
    v43 = v39;
    v44 = *(_QWORD *)(a1 + 40);
    v67 = v43;
    v81 = v43;
    v82 = v44;
    v84 = *(id *)(a1 + 56);
    v83 = v40;
    v45 = (void *)MEMORY[0x1A1B00850](v80);
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v77 != v49)
            objc_enumerationMutation(v47);
          v51 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v52, v53);

        }
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
      }
      while (v48);
    }

    v54 = *(double *)(a1 + 64);
    v55 = *(double *)(a1 + 72);
    if (v72)
    {
      objc_msgSend(v73, "fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerDataURLWithMetadata:completionHandler:", v46, v42, v45, v54, v55);
      v56 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v71)
        objc_msgSend(v73, "fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerWithMetadata:completionHandler:", v46, v69, v45, v54, v55);
      else
        objc_msgSend(v73, "fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandler:completionHandler:", v46, v68, v45, v54, v55);
      v56 = objc_claimAutoreleasedReturnValue();
    }
    v62 = (void *)v56;
    v63 = (id)objc_msgSend(*(id *)(a1 + 40), "_proxyWithCancellationHandler:forClientOperation:", v56, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v98;
      while (2)
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v98 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
          if (v29)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = v30;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v29, "isEqual:", v31) & 1) != 0 || !objc_msgSend(v29, "count"))
            {

            }
            else
            {
              objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32 == 0;

              if (!v33)
              {
                fp_current_or_default_log();
                v57 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                  __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_cold_1();

                fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                fp_current_or_default_log();
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                {
                  v64 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
                  v65 = *(_QWORD *)(a1 + 40);
                  FPNotSupportedError();
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218754;
                  v103 = v64;
                  v104 = 2112;
                  v105 = v65;
                  v106 = 2080;
                  v107 = "-[FPXExtensionContext startOperation:toFetchThumbnailsWithDictionary:size:completionHandler:]_block_invoke";
                  v108 = 2112;
                  v109 = v66;
                  _os_log_debug_impl(&dword_1A0A34000, v59, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

                }
                v60 = *(_QWORD *)(a1 + 56);
                FPNotSupportedError();
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *))(v60 + 16))(v60, v61);

                __fp_pop_log(&v96);
                goto LABEL_48;
              }
            }
          }
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
        if (v26)
          continue;
        break;
      }
    }

    v35 = *(void **)(a1 + 40);
    v34 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "startOperation:toFetchThumbnailsForItemIdentifiers:size:completionHandler:", v34, obj, *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
LABEL_48:

}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_352(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_cold_1();

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "internalErrorFromVendorError:callerDescription:", v15, CFSTR("startFetchThumbnailOperation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 56), "createTempThumbnailURLForVersion:appropriateForURL:itemIdentifier:isFromData:error:", v12, v13, v11, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = objc_retainAutorelease(v13);
        v20 = (const char *)objc_msgSend(v19, "fileSystemRepresentation");
        v21 = objc_retainAutorelease(v18);
        if ((clonefile(v20, (const char *)objc_msgSend(v21, "fileSystemRepresentation"), 0) & 0x80000000) == 0)
        {
          v32 = v17;
          +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v21, 0, &v32);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v32;

          v17 = v22;
LABEL_10:
          v24 = (void *)objc_opt_new();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v11, CFSTR("identifier"));
          if (v18)
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, CFSTR("thumbnailDataURLWrapper"));
          if (v14)
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, CFSTR("thumbnailMetaData"));
          if (v12)
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v12, CFSTR("version"));
          v25 = *(void **)(a1 + 64);
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_361;
          v30[3] = &unk_1E444A308;
          v31 = *(id *)(a1 + 32);
          objc_msgSend(v25, "operationDidProgressWithInfo:error:completionHandler:", v24, v17, v30);

          goto LABEL_19;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 56);
        v29 = *(_QWORD *)(a1 + 72);
        v27 = __error();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v29, v28, CFSTR("FPXExtensionContext.m"), 1963, CFSTR("UNREACHABLE: failed to clone thumbnail file %@ to %@: %s"), v19, v21, strerror(*v27));

      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_19:

      goto LABEL_20;
    }
    v18 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), CFSTR("FPXExtensionContext.m"), 1945, CFSTR("UNREACHABLE: thumbnail completion callback was called with a nil identifier"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_20:

}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_361(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_326_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_363(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  id v22;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v15 = *(void **)(a1 + 32);
    v22 = 0;
    objc_msgSend(v15, "createTempThumbnailURLForVersion:appropriateForURL:itemIdentifier:isFromData:error:", v12, 0, v11, 1, &v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v22;
    if (v16)
    {
      objc_msgSend(v16, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v19 = objc_msgSend(v13, "writeToFile:options:error:", v18, 1, &v21);
      v20 = v21;

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      if (v19)
      {

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeItemAtURL:error:", v16, 0);
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

uint64_t __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_330_cold_1();

  v6 = *(NSObject **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(v5 + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_366;
  v9[3] = &unk_1E4449E68;
  v9[4] = v5;
  v12 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v8 = v3;
  dispatch_group_notify(v6, v7, v9);

}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_366(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", *(_QWORD *)(a1 + 48), CFSTR("startFetchThumbnailOperationOverall"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2080;
    v14 = "-[FPXExtensionContext startOperation:toFetchThumbnailsWithDictionary:size:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v7;
    _os_log_debug_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

  }
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", *(_QWORD *)(a1 + 48), CFSTR("startFetchThumbnailOperationOverall"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  __fp_pop_log(&v8);
}

- (void)valuesForAttributes:(id)a3 forItemID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *instanceQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  instanceQueue = self->_instanceQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__FPXExtensionContext_valuesForAttributes_forItemID_completionHandler___block_invoke;
  v15[3] = &unk_1E444A470;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  fp_dispatch_async_with_logs(instanceQueue, v15);

}

void __71__FPXExtensionContext_valuesForAttributes_forItemID_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;

  objc_msgSend(a1[4], "domainContextForItemID:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v2, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPersonaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPersona");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userPersonaUniqueString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "uid");
      objc_msgSend(v2, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personaIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v15, v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext valuesForAttributes:forItemID:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2057, (const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v2, "vendorInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __71__FPXExtensionContext_valuesForAttributes_forItemID_completionHandler___block_invoke_2;
  v28[3] = &unk_1E444A448;
  v28[4] = a1[4];
  v32 = a1[7];
  v29 = v2;
  v30 = a1[5];
  v31 = a1[6];
  v26 = v2;
  v27 = (id)objc_msgSend(v23, "itemForIdentifier:request:completionHandler:", v24, v25, v28);

}

void __71__FPXExtensionContext_valuesForAttributes_forItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  FPXEnumeratorAlternateContentsItem *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FPXEnumeratorAlternateContentsItem *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v36 = *MEMORY[0x1E0C99A38];
  v37[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "alternateContentsURLWrapperForItemID:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "itemFromVendorItem:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[FPXEnumeratorAlternateContentsItem initWithOriginalDocumentItem:alternateContentsURL:]([FPXEnumeratorAlternateContentsItem alloc], "initWithOriginalDocumentItem:alternateContentsURL:", v10, v9);

      v5 = v11;
    }
    FPDictFromVendorItem((uint64_t)v5, *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      v30 = 2080;
      v31 = "-[FPXExtensionContext valuesForAttributes:forItemID:completionHandler:]_block_invoke";
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = 0;
      _os_log_debug_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log(&v25);

  }
  else if (v6)
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v20 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("valueForAttributesForItemID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2080;
      v31 = "-[FPXExtensionContext valuesForAttributes:forItemID:completionHandler:]_block_invoke_2";
      v32 = 2112;
      v33 = 0;
      v34 = 2112;
      v35 = v22;
      _os_log_debug_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v15 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("valueForAttributesForItemID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

    __fp_pop_log(&v25);
  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v23 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v27 = v23;
      v28 = 2112;
      v29 = v24;
      v30 = 2080;
      v31 = "-[FPXExtensionContext valuesForAttributes:forItemID:completionHandler:]_block_invoke";
      v32 = 2112;
      v33 = v7;
      v34 = 2112;
      v35 = 0;
      _os_log_debug_impl(&dword_1A0A34000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log(&v25);

  }
}

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_388(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "forceItemUpdate:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)addListenerDelegate:(id)a3
{
  FPXExtensionContext *v4;
  NSMutableSet *listenerDelegates;
  uint64_t v6;
  NSMutableSet *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  listenerDelegates = v4->_listenerDelegates;
  if (!listenerDelegates)
  {
    v6 = objc_opt_new();
    v7 = v4->_listenerDelegates;
    v4->_listenerDelegates = (NSMutableSet *)v6;

    listenerDelegates = v4->_listenerDelegates;
  }
  -[NSMutableSet addObject:](listenerDelegates, "addObject:", v8);
  objc_sync_exit(v4);

}

- (void)removeListenerDelegate:(id)a3
{
  FPXExtensionContext *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](v4->_listenerDelegates, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (id)additionalServiceSourcesForItemID:(id)a3 domain:(id)a4 extension:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (additionalServiceSourcesForItemID_domain_extension__onceToken != -1)
    dispatch_once(&additionalServiceSourcesForItemID_domain_extension__onceToken, &__block_literal_global_390);
  v10 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = (id)additionalServiceSourcesForItemID_domain_extension__sourceClasses;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_alloc(*(Class *)(*((_QWORD *)&v20 + 1) + 8 * i));
        objc_msgSend(v7, "identifier", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithItemIdentifier:domain:extension:", v17, v8, v9);

        if (v18)
          objc_msgSend(v10, "addObject:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v10;
}

void __74__FPXExtensionContext_additionalServiceSourcesForItemID_domain_extension___block_invoke()
{
  Class v0;
  Class v1;
  Class v2;
  Class v3;
  Class v4;
  Class v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = (id)objc_opt_new();
  v0 = NSClassFromString(CFSTR("_SWYCollaborationServiceSource"));
  if (v0)
  {
    v1 = v0;
    if (-[objc_class instancesRespondToSelector:](v0, "instancesRespondToSelector:", sel_initWithItemIdentifier_domain_extension_))objc_msgSend(v8, "addObject:", v1);
  }
  v2 = NSClassFromString(CFSTR("_SWCollaborationServiceSource"));
  if (v2)
  {
    v3 = v2;
    if (-[objc_class instancesRespondToSelector:](v2, "instancesRespondToSelector:", sel_initWithItemIdentifier_domain_extension_))objc_msgSend(v8, "addObject:", v3);
  }
  v4 = NSClassFromString(CFSTR("_SWCollaborationServiceSourceEntitled"));
  if (v4)
  {
    v5 = v4;
    if (-[objc_class instancesRespondToSelector:](v4, "instancesRespondToSelector:", sel_initWithItemIdentifier_domain_extension_))objc_msgSend(v8, "addObject:", v5);
  }
  v6 = objc_msgSend(v8, "copy");
  v7 = (void *)additionalServiceSourcesForItemID_domain_extension__sourceClasses;
  additionalServiceSourcesForItemID_domain_extension__sourceClasses = v6;

}

- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  OS_dispatch_queue *instanceQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  void *v18;

  v8 = a3;
  v9 = a5;
  fpfs_adopt_log(self->_log);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext fetchServicesForItemID:allowRestrictedSources:completionHandler:].cold.1();

  instanceQueue = self->_instanceQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke;
  v14[3] = &unk_1E444A570;
  v14[4] = self;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  v17 = a4;
  fp_dispatch_async_with_logs(instanceQueue, v14);

  __fp_pop_log(&v18);
}

void __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;

  objc_msgSend(*(id *)(a1 + 32), "domainContextForItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v2, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPersonaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPersona");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userPersonaUniqueString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "uid");
      objc_msgSend(v2, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personaIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v15, v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext fetchServicesForItemID:allowRestrictedSources:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2268, (const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v2, "vendorInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23;
  if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EE5DD0A0))
    v26 = v25;
  else
    v26 = 0;

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke_2;
  v32[3] = &unk_1E444A548;
  v32[4] = *(_QWORD *)(a1 + 32);
  v36 = *(id *)(a1 + 48);
  v33 = v2;
  v34 = *(id *)(a1 + 40);
  v27 = v26;
  v35 = v27;
  v37 = *(_BYTE *)(a1 + 56);
  v28 = v2;
  v29 = MEMORY[0x1A1B00850](v32);
  v30 = (void *)v29;
  if (v27)
    v31 = (id)objc_msgSend(v27, "supportedServiceSourcesForItemIdentifier:completionHandler:", v24, v29);
  else
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v29 + 16))(v29, MEMORY[0x1E0C9AA60], 0);

}

void __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  FPXServiceEndpointFactory *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v34 = a3;
  v35 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalServiceSourcesForItemID:domain:extension:", v7, v9, *(_QWORD *)(a1 + 56));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v33);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (!v11)
      goto LABEL_20;
    v12 = *(_QWORD *)v37;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v14, "serviceName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (*(_BYTE *)(a1 + 72)
            || (objc_opt_respondsToSelector() & 1) == 0
            || !objc_msgSend(v14, "isRestricted"))
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);
            goto LABEL_18;
          }
          fp_current_or_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v43 = v15;
            _os_log_debug_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring restricted source %@", buf, 0xCu);
          }
        }
        else
        {
          fp_current_or_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v43 = v14;
            _os_log_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] source %@ returned nil service name", buf, 0xCu);
          }
        }

LABEL_18:
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (!v11)
      {
LABEL_20:

        objc_msgSend(v6, "allValues");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fp_map:", &__block_literal_global_409);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D4C98);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setInterface:", v20);

        v21 = -[FPXServiceEndpointFactory initWithServiceSources:domainContext:]([FPXServiceEndpointFactory alloc], "initWithServiceSources:domainContext:", v6, *(_QWORD *)(a1 + 40));
        objc_msgSend(v19, "setExportedObject:", v21);

        objc_msgSend(v19, "setContext:", *(_QWORD *)(a1 + 32));
        objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "endpoint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "addListenerDelegate:", v19);
        objc_msgSend(v22, "setDelegate:", v19);
        objc_msgSend(v22, "resume");
        fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v28 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
          v29 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134219266;
          v43 = v28;
          v44 = 2112;
          v45 = v29;
          v46 = 2080;
          v47 = "-[FPXExtensionContext fetchServicesForItemID:allowRestrictedSources:completionHandler:]_block_invoke_2";
          v48 = 2112;
          v49 = v23;
          v50 = 2112;
          v51 = v18;
          v52 = 2112;
          v53 = 0;
          _os_log_debug_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        __fp_pop_log(&v40);

        goto LABEL_26;
      }
    }
  }
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v30 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
    v31 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v34, CFSTR("fetchServicesForItemID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v43 = v30;
    v44 = 2112;
    v45 = v31;
    v46 = 2080;
    v47 = "-[FPXExtensionContext fetchServicesForItemID:allowRestrictedSources:completionHandler:]_block_invoke_2";
    v48 = 2112;
    v49 = 0;
    v50 = 2112;
    v51 = 0;
    v52 = 2112;
    v53 = v32;
    _os_log_debug_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

  }
  v26 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v34, CFSTR("fetchServicesForItemID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v26 + 16))(v26, 0, 0, v27);

  __fp_pop_log(&v40);
LABEL_26:

}

id __87__FPXExtensionContext_fetchServicesForItemID_allowRestrictedSources_completionHandler___block_invoke_407(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceName:", v4);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "requiredEntitlement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRequiredEntitlement:", v5);

  }
  return v3;
}

- (void)fetchOperationServiceEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  FPXExtensionContext *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  FPXOperationServiceXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "setContext:", self);
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXExtensionContext addListenerDelegate:](self, "addListenerDelegate:", v5);
  objc_msgSend(v7, "setDelegate:", v5);
  objc_msgSend(v7, "resume");
  fpfs_adopt_log(self->_log);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    v12 = FPPopLogSectionForBlock(v4);
    v13 = 2112;
    v14 = self;
    v15 = 2080;
    v16 = "-[FPXExtensionContext fetchOperationServiceEndpoint:]";
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = 0;
    _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v8, 0);
  __fp_pop_log(&v10);

}

- (void)fetchVendorEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  FPXExtensionContext *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  FPXVendorXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "setContext:", self);
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXExtensionContext addListenerDelegate:](self, "addListenerDelegate:", v5);
  objc_msgSend(v7, "setDelegate:", v5);
  objc_msgSend(v7, "resume");
  fpfs_adopt_log(self->_log);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    v12 = FPPopLogSectionForBlock(v4);
    v13 = 2112;
    v14 = self;
    v15 = 2080;
    v16 = "-[FPXExtensionContext fetchVendorEndpoint:]";
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = 0;
    _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v8, 0);
  __fp_pop_log(&v10);

}

- (id)_proxyWithCancellationHandler:(id)a3 forClientOperation:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__FPXExtensionContext__proxyWithCancellationHandler_forClientOperation___block_invoke;
  v10[3] = &unk_1E444A598;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCancellationHandler:", v7);

  return v6;
}

void __72__FPXExtensionContext__proxyWithCancellationHandler_forClientOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__FPXExtensionContext__proxyWithCancellationHandler_forClientOperation___block_invoke_cold_1(v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)preflightReparentItemIDs:(id)a3 underParentID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  OS_dispatch_queue *instanceQueue;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  FPXExtensionContext *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  fpfs_adopt_log(self->_log);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    logStringForObjects(v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = self;
    v23 = 2080;
    v24 = "-[FPXExtensionContext preflightReparentItemIDs:underParentID:reply:]";
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v9;
    _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);

  }
  if (objc_msgSend(v8, "count"))
  {
    instanceQueue = self->_instanceQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke;
    v15[3] = &unk_1E444A470;
    v15[4] = self;
    v16 = v8;
    v18 = v10;
    v17 = v9;
    fp_dispatch_async_with_logs(instanceQueue, v15);

  }
  else
  {
    fpfs_adopt_log(self->_log);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(v10);
      -[FPXExtensionContext preflightReparentItemIDs:underParentID:reply:].cold.1();
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    __fp_pop_log(&v19);

  }
  __fp_pop_log(&v20);

}

void __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  id obj;
  void *v36;
  void *v37;
  _QWORD block[5];
  id v39;
  _QWORD *v40;
  _QWORD v41[4];
  id v42;
  NSObject *v43;
  _QWORD *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  _BYTE v50[128];
  _QWORD v51[5];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "domainContextForItemID:", v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v37, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPersonaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPersona");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userPersonaUniqueString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "uid");
      objc_msgSend(v37, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personaIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v15, v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext preflightReparentItemIDs:underParentID:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2398, (const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v37, "instanceWithPrivateSelector:", sel_preflightReparentItemWithIdentifier_toParentItemWithIdentifier_completionHandler_);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy_;
    v51[4] = __Block_byref_object_dispose_;
    v52 = 0;
    v23 = dispatch_group_create();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = *(id *)(a1 + 40);
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v28 = (void *)MEMORY[0x1A1B00664]();
          dispatch_group_enter(v23);
          objc_msgSend(v27, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_423;
          v41[3] = &unk_1E444A5C0;
          v42 = v37;
          v43 = v23;
          v44 = v51;
          objc_msgSend(v36, "preflightReparentItemWithIdentifier:toParentItemWithIdentifier:completionHandler:", v29, v30, v41);

          objc_autoreleasePoolPop(v28);
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v24);
    }

    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(NSObject **)(v31 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_3;
    block[3] = &unk_1E444A5E8;
    block[4] = v31;
    v39 = *(id *)(a1 + 56);
    v40 = v51;
    dispatch_group_notify(v23, v32, block);

    _Block_object_dispose(v51, 8);
  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)v2 + 72));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 56));
      __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log(&v49);

  }
}

void __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_423(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_2;
  v8[3] = &unk_1E444A048;
  v9 = *(id *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v7, "fp_map:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 40);
  objc_sync_enter(v5);
  if (v4)
    v6 = v4;
  else
    v6 = v7;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);
  objc_sync_exit(v5);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", a2, CFSTR("preflightReparentItemIDs"));
}

void __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 134218754;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2080;
    v12 = "-[FPXExtensionContext preflightReparentItemIDs:underParentID:reply:]_block_invoke_3";
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v6);

}

- (void)_indexOutOfBandUpdatedItems:(id)a3 deletedItems:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  FPXDomainContext *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void (**v35)(_QWORD);
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  FPXExtensionContext *v41;
  void (**v42)(_QWORD);

  v37 = a3;
  v36 = a4;
  v35 = (void (**)(_QWORD))a6;
  v9 = self->_domainContext;
  -[FPXDomainContext domain](v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personaIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[FPXDomainContext domain](v9, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personaIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentPersona");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userPersonaUniqueString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "isEqualToString:", v17);

    if ((v18 & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentPersona");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userPersonaUniqueString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "currentPersona");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "uid");
      -[FPXDomainContext domain](v9, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "personaIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v22, v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext _indexOutOfBandUpdatedItems:deletedItems:indexReason:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2441, (const char *)objc_msgSend(objc_retainAutorelease(v28), "UTF8String"));
    }
  }
  else
  {

  }
  -[FPXDomainContext spotlightIndexer](v9, "spotlightIndexer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXExtensionContext providerIdentifier](self, "providerIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isEqual:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0)
  {
    v32 = 0;
  }
  else
  {
    -[FPXExtensionContext providerIdentifier](self, "providerIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v33, "isEqual:", CFSTR("com.apple.SMBClientProvider.FileProvider")) ^ 1;

  }
  if (!self->_usesFPFS && v32 && v30 && (objc_msgSend(v37, "count") || objc_msgSend(v36, "count")))
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __94__FPXExtensionContext__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke;
    v38[3] = &unk_1E444A610;
    v39 = v37;
    v40 = v36;
    v41 = self;
    v42 = v35;
    objc_msgSend(v30, "indexOutOfBandUpdatedItems:deletedItems:indexReason:completionHandler:", v39, v40, a5, v38);

  }
  else
  {
    v35[2](v35);
  }

}

void __94__FPXExtensionContext__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      v6 = objc_msgSend(*(id *)(a1 + 40), "count");
      objc_msgSend(v3, "fp_prettyDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = 67109634;
      v8[1] = v5;
      v9 = 1024;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] out-of-band indexing of %u updates, %u deletions failed with error %@", (uint8_t *)v8, 0x18u);

    }
  }
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 48) + 32), *(dispatch_block_t *)(a1 + 56));

}

- (void)deleteItemsWithIDs:(id)a3 baseVersions:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  OS_dispatch_queue *instanceQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  FPXExtensionContext *v22;
  id v23;
  SEL v24;
  unint64_t v25;
  void *v26[7];

  v26[6] = *(void **)MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  fpfs_adopt_log(self->_log);
  v26[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    logStringForObjects(v11);
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext deleteItemsWithIDs:baseVersions:options:reply:].cold.1();
  }

  instanceQueue = self->_instanceQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke;
  v19[3] = &unk_1E444A6B0;
  v16 = v11;
  v20 = v16;
  v17 = v12;
  v24 = a2;
  v21 = v17;
  v22 = self;
  v18 = v13;
  v23 = v18;
  v25 = a5;
  fp_dispatch_async_with_logs(instanceQueue, v19);

  __fp_pop_log(v26);
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  BOOL v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD block[5];
  id v54;
  _QWORD *v55;
  _BYTE *v56;
  _QWORD *v57;
  void **v58;
  uint64_t v59;
  _QWORD v60[4];
  NSObject *v61;
  id v62;
  id v63;
  _QWORD *v64;
  _BYTE *v65;
  void **v66;
  _QWORD *v67;
  BOOL v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  void *v73[5];
  id v74;
  _BYTE buf[24];
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2 != objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), CFSTR("FPXExtensionContext.m"), 2477, CFSTR("Number of itemIDs %lu doesn't match number of versions %lu"), v2, objc_msgSend(*(id *)(a1 + 40), "count"));

  }
  v50 = v2;
  if (v2)
  {
    v3 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "domainContextForItemID:", v4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v52, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "personaIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentPersona");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userPersonaUniqueString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "currentPersona");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "userPersonaUniqueString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "currentPersona");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "uid");
        objc_msgSend(v52, "domain");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "personaIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v16, v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        fp_current_or_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          +[FPXExtensionContext principalClass].cold.1();

        __assert_rtn("-[FPXExtensionContext deleteItemsWithIDs:baseVersions:options:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2483, (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
      }
    }
    else
    {

    }
    objc_msgSend(v52, "vendorInstance");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 72);
    v48 = (v25 & 0xFFFFFFFF80000000) == 0xFFFFFFFF80000000;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 112))
      v26 = 0;
    else
      v26 = 0xFFFFFFFF80000000;
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    v49 = v26 | v25 & 0x7FFFFFFF;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = objc_msgSend(*(id *)(a1 + 32), "count");
      v29 = CFSTR("recursively ");
      if (!(v26 & 1 | v25 & 1))
        v29 = &stru_1E4450B40;
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v29;
      if ((v25 & 0xFFFFFFFF80000000) == 0xFFFFFFFF80000000)
        v30 = CFSTR("ignoring versions");
      else
        v30 = &stru_1E4450B40;
      *(_WORD *)&buf[22] = 2112;
      v76 = (uint64_t (*)(uint64_t, uint64_t))v30;
      _os_log_impl(&dword_1A0A34000, v27, OS_LOG_TYPE_INFO, "[INFO] Received request to delete %lu itemIDs %@%@", buf, 0x20u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v76 = __Block_byref_object_copy_;
    v77 = __Block_byref_object_dispose_;
    v78 = 0;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = (void *)0x3032000000;
    v73[3] = __Block_byref_object_copy_;
    v73[4] = __Block_byref_object_dispose_;
    v74 = 0;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = __Block_byref_object_copy_;
    v71[4] = __Block_byref_object_dispose_;
    v72 = 0;
    v72 = (id)objc_opt_new();
    v31 = dispatch_group_create();
    v32 = 0;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = __Block_byref_object_copy_;
    v69[4] = __Block_byref_object_dispose_;
    v70 = 0;
    do
    {
      v33 = (void *)MEMORY[0x1A1B00664]();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "versionRewritingBeforeFirstSync");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_group_enter(v31);
      objc_msgSend(v34, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_436;
      v60[3] = &unk_1E444A638;
      v39 = v31;
      v61 = v39;
      v64 = v71;
      v40 = v34;
      v68 = v48;
      v62 = v40;
      v65 = buf;
      v66 = v73;
      v41 = v52;
      v63 = v41;
      v67 = v69;
      v42 = (id)objc_msgSend(v51, "deleteItemWithIdentifier:baseVersion:options:request:completionHandler:", v37, v36, v49, v38, v60);

      objc_autoreleasePoolPop(v33);
      ++v32;
    }
    while (v50 != v32);
    v43 = *(_QWORD *)(a1 + 48);
    v44 = *(void **)(a1 + 56);
    v45 = *(NSObject **)(v43 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_441;
    block[3] = &unk_1E444A688;
    block[4] = v43;
    v55 = v71;
    v56 = buf;
    v57 = v69;
    v46 = *(_QWORD *)(a1 + 72);
    v58 = v73;
    v59 = v46;
    v54 = v44;
    dispatch_group_notify(v39, v45, block);

    _Block_object_dispose(v69, 8);
    _Block_object_dispose(v71, 8);

    _Block_object_dispose(v73, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 48) + 72));
    v73[0] = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 56));
      __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log(v73);

  }
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_436(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "fp_isFileProviderError:", -1005);
  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v5);

    goto LABEL_22;
  }
  if (!objc_msgSend(v3, "fp_isFileProviderError:", -1006))
    goto LABEL_16;
  if (!*(_BYTE *)(a1 + 88))
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1A0A34000, v18, OS_LOG_TYPE_INFO, "[INFO] Received out-of-date error, but no retry requested", (uint8_t *)&v22, 2u);
    }
    goto LABEL_15;
  }
  objc_msgSend(v3, "fp_userInfoItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_deleteItemWithIdentifier_baseVersion_options_completionHandler_);
      objc_claimAutoreleasedReturnValue();
      __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_436_cold_1();
    }
LABEL_15:

LABEL_16:
    objc_msgSend(*(id *)(a1 + 48), "internalErrorFromVendorError:callerDescription:", v3, CFSTR("deleteItemsWithID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v20 = v6;
    if (!v6)
      v20 = *(void **)(v19 + 40);
    objc_storeStrong((id *)(v19 + 40), v20);
    goto LABEL_19;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  objc_msgSend(*(id *)(a1 + 48), "itemFromVendorItem:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v22 = 138412290;
    v23 = v14;
    _os_log_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_INFO, "[INFO] Adding item %@ to retry list because of version conflict", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v14);
  v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(v13, "itemVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

LABEL_19:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    v21 = *(id *)(a1 + 32);
    objc_sync_enter(v21);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v21);

  }
  objc_sync_exit(v5);

LABEL_22:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_441(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_2;
  v4[3] = &unk_1E444A660;
  v7 = *(_OWORD *)(a1 + 56);
  v2 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = v3;
  v6 = v2;
  objc_msgSend(v5, "_indexOutOfBandUpdatedItems:deletedItems:indexReason:completionHandler:", MEMORY[0x1E0C9AA60], v1, 0, v4);

}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 48;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count")
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_2_cold_1(v2, v4);

    objc_msgSend(*(id *)(a1 + 32), "deleteItemsWithIDs:baseVersions:options:reply:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 72) & 0x7FFFFFFFLL, *(_QWORD *)(a1 + 40));
  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 134218754;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2080;
      v14 = "-[FPXExtensionContext deleteItemsWithIDs:baseVersions:options:reply:]_block_invoke";
      v15 = 2112;
      v16 = v7;
      _os_log_debug_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v8);

  }
}

- (id)deleteItemWithID:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  OS_dispatch_queue *instanceQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  void *v34;
  uint8_t buf[4];
  FPXExtensionContext *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  fpfs_adopt_log(self->_log);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v36 = self;
    v37 = 2080;
    v38 = "-[FPXExtensionContext deleteItemWithID:baseVersion:options:request:completionHandler:]";
    v39 = 2112;
    v40 = v12;
    v41 = 2112;
    v42 = v14;
    _os_log_debug_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  instanceQueue = self->_instanceQueue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __86__FPXExtensionContext_deleteItemWithID_baseVersion_options_request_completionHandler___block_invoke;
  v27[3] = &unk_1E444A6D8;
  v27[4] = self;
  v19 = v12;
  v28 = v19;
  v33 = a5;
  v20 = v13;
  v29 = v20;
  v21 = v14;
  v30 = v21;
  v22 = v15;
  v32 = v22;
  v23 = v17;
  v31 = v23;
  fp_dispatch_async_with_logs(instanceQueue, v27);
  v24 = v31;
  v25 = v23;

  __fp_pop_log(&v34);
  return v25;
}

void __86__FPXExtensionContext_deleteItemWithID_baseVersion_options_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;

  objc_msgSend(*(id *)(a1 + 32), "domainContextForItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v2, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPersonaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPersona");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userPersonaUniqueString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "uid");
      objc_msgSend(v2, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personaIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v15, v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext deleteItemWithID:baseVersion:options:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2596, (const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v2, "vendorInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 112))
    v24 = 0;
  else
    v24 = 0xFFFFFFFF80000000;
  v25 = v24 | *(_QWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "versionRewritingBeforeFirstSync");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(_QWORD *)(a1 + 56);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __86__FPXExtensionContext_deleteItemWithID_baseVersion_options_request_completionHandler___block_invoke_2;
  v31[3] = &unk_1E444A610;
  v31[4] = *(_QWORD *)(a1 + 32);
  v29 = v2;
  v32 = v29;
  v33 = *(id *)(a1 + 56);
  v34 = *(id *)(a1 + 72);
  objc_msgSend(v23, "deleteItemWithIdentifier:baseVersion:options:request:completionHandler:", v26, v27, v25, v28, v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    objc_msgSend(*(id *)(a1 + 64), "addChild:withPendingUnitCount:", v30, 100);

}

void __86__FPXExtensionContext_deleteItemWithID_baseVersion_options_request_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = (id *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "currentResponseWithRequest:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v5, "internalErrorFromVendorError:callerDescription:", v6, CFSTR("deleteItemWithID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  fpfs_adopt_log(*((void **)*(v5 - 1) + 9));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2080;
    v18 = "-[FPXExtensionContext deleteItemWithID:baseVersion:options:request:completionHandler:]_block_invoke_2";
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  __fp_pop_log(&v12);

}

- (BOOL)_inlineSymlinkTarget:(id)a3 url:(id *)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  ssize_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  stat v19;
  char v20[1025];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = *a4;
  if (!v8)
    goto LABEL_9;
  objc_msgSend(v7, "contentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC5F8]) & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v7, "symlinkTargetPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_9:
    v12 = 1;
    goto LABEL_10;
  }
  memset(&v19, 0, sizeof(v19));
  v11 = objc_retainAutorelease(v8);
  if (lstat((const char *)objc_msgSend(v11, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v19))
  {
    goto LABEL_5;
  }
  if ((~v19.st_mode & 0xA000) == 0)
  {
    bzero(v20, 0x401uLL);
    v14 = readlink((const char *)objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation"), v20, 0x400uLL);
    if (v14 < 0)
    {
LABEL_5:
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_7;
    }
    v20[v14] = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_pathWithFileSystemRepresentation:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSymlinkTargetPath:", v15);

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v11, 4, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSymlinkTargetPath:", v16);

  objc_msgSend(v7, "symlinkTargetPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
LABEL_15:
    objc_msgSend(v11, "stopAccessingSecurityScopedResource");
    *a4 = 0;
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[FPXExtensionContext _inlineSymlinkTarget:url:error:].cold.1();

    goto LABEL_9;
  }
LABEL_7:
  v12 = 0;
LABEL_10:

  return v12;
}

- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 bounce:(BOOL)a8 completionHandler:(id)a9
{
  NSObject *v12;
  FPXExtensionContext *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  BOOL v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  FPXExtensionContext *v41;
  _BOOL4 v42;
  id v45;
  id v46;
  id v47;
  char *v48;
  FPXDomainContext *v49;
  _QWORD v50[4];
  id v51;
  FPXExtensionContext *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  uint8_t buf[4];
  FPXExtensionContext *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  _BYTE v65[10];
  _BYTE v66[10];
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v42 = a8;
  v71 = *MEMORY[0x1E0C80C00];
  v48 = (char *)a3;
  v47 = a5;
  v45 = a7;
  v46 = a9;
  fpfs_adopt_log(self->_log);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413570;
    v59 = self;
    v60 = 2080;
    v61 = "-[FPXExtensionContext createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:]";
    v62 = 2112;
    v63 = v48;
    v64 = 1024;
    *(_DWORD *)v65 = a4;
    *(_WORD *)&v65[4] = 1024;
    *(_DWORD *)&v65[6] = a6;
    *(_WORD *)v66 = 2112;
    *(_QWORD *)&v66[2] = v47;
    _os_log_debug_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@ fields=%x options=%x contentURL=%@", buf, 0x36u);
  }

  v13 = self;
  objc_sync_enter(v13);
  v49 = v13->_domainContext;
  objc_sync_exit(v13);

  -[FPXDomainContext domain](v49, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "personaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[FPXDomainContext domain](v49, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "personaIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentPersona");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userPersonaUniqueString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "isEqualToString:", v20);

    if ((v21 & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "currentPersona");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "userPersonaUniqueString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "currentPersona");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "uid");
      -[FPXDomainContext domain](v49, "domain");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "personaIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v25, v28, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2684, (const char *)objc_msgSend(objc_retainAutorelease(v31), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v47, "url");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "startAccessingSecurityScopedResource");
  v55 = 0;
  v56 = v33;
  v34 = -[FPXExtensionContext _inlineSymlinkTarget:url:error:](v13, "_inlineSymlinkTarget:url:error:", v48, &v56, &v55);
  v35 = v56;

  v36 = v55;
  if (v34)
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __106__FPXExtensionContext_createItemBasedOnTemplate_fields_contents_options_request_bounce_completionHandler___block_invoke;
    v50[3] = &unk_1E444A700;
    v51 = v35;
    v52 = v13;
    v53 = v46;
    -[FPXExtensionContext _createItemBasedOnTemplate:fields:contents:options:request:bounce:bounceNumber:completionHandler:](v13, "_createItemBasedOnTemplate:fields:contents:options:request:bounce:bounceNumber:completionHandler:", v48, a4, v51, a6, v45, v42, 0, v50);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v51;
  }
  else
  {
    -[FPXDomainContext currentResponseWithRequest:](v49, "currentResponseWithRequest:", v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    fpfs_adopt_log(self->_log);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v41 = (FPXExtensionContext *)FPPopLogSectionForBlock(v46);
      *(_DWORD *)buf = 134219778;
      v59 = v41;
      v60 = 2112;
      v61 = (const char *)v13;
      v62 = 2080;
      v63 = "-[FPXExtensionContext createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:]";
      v64 = 2112;
      *(_QWORD *)v65 = 0;
      *(_WORD *)&v65[8] = 1024;
      *(_DWORD *)v66 = 0;
      *(_WORD *)&v66[4] = 1024;
      *(_DWORD *)&v66[6] = 0;
      v67 = 2112;
      v68 = v38;
      v69 = 2112;
      v70 = v36;
      _os_log_debug_impl(&dword_1A0A34000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, 0x%x, %{BOOL}d, %@, %@", buf, 0x4Au);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *, id))v46 + 2))(v46, 0, 0, 0, v38, v36);
    __fp_pop_log(&v54);

    v37 = 0;
  }

  __fp_pop_log(&v57);
  return v37;
}

void __106__FPXExtensionContext_createItemBasedOnTemplate_fields_contents_options_request_bounce_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a5;
  v13 = a6;
  objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v17 = *(_QWORD *)(a1 + 40);
    if (v13)
      v18 = 0;
    else
      v18 = v11;
    *(_DWORD *)buf = 134219778;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    v24 = 2080;
    v25 = "-[FPXExtensionContext createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:]_block_invoke";
    v26 = 2112;
    v27 = v18;
    v28 = 2048;
    v29 = a3;
    v30 = 1024;
    v31 = a4;
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v13;
    _os_log_debug_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, 0x%lx, %{BOOL}d, %@, %@", buf, 0x4Eu);
  }

  if (v13)
    v15 = 0;
  else
    v15 = v11;
  (*(void (**)(_QWORD, id, uint64_t, uint64_t, id, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v15, a3, a4, v12, v13);
  __fp_pop_log(&v19);

}

- (void)_freeSlotHeldByItem:(id)a3 request:(id)a4 bounceIndex:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "filename");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = 0;
  objc_msgSend(v13, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v32, &v31, objc_msgSend(v10, "isFolder"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v32;
  v16 = v31;

  if (objc_msgSend(v15, "unsignedIntegerValue") == a5)
  {
    v17 = objc_msgSend(v15, "unsignedIntegerValue");
    if ((unint64_t)(v17 + 1) > 2)
      a5 = v17 + 1;
    else
      a5 = 2;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fp_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v18, v16, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  fp_current_or_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext _freeSlotHeldByItem:request:bounceIndex:completionHandler:].cold.1((uint64_t)v10);

  objc_msgSend(v10, "setFilename:", v19);
  objc_msgSend(v10, "itemVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __81__FPXExtensionContext__freeSlotHeldByItem_request_bounceIndex_completionHandler___block_invoke;
  v26[3] = &unk_1E444A728;
  v26[4] = self;
  v27 = v10;
  v29 = v12;
  v30 = a5;
  v28 = v11;
  v22 = v12;
  v23 = v11;
  v24 = v10;
  v25 = -[FPXExtensionContext modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:](self, "modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:", v24, v21, 2, 0, 0, v23, v26);

}

void __81__FPXExtensionContext__freeSlotHeldByItem_request_bounceIndex_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v7;
  id v8;

  v8 = a6;
  objc_msgSend(v8, "fp_userInfoItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "_freeSlotHeldByItem:request:bounceIndex:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 56));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)_createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 bounce:(BOOL)a8 bounceNumber:(id)a9 completionHandler:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  OS_dispatch_queue *instanceQueue;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  BOOL v45;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a9;
  v18 = a10;
  if (v15)
  {
    objc_msgSend(v14, "documentSize");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "longLongValue");

    if (v20 <= 1)
      v21 = 1;
    else
      v21 = v20;
  }
  else
  {
    v21 = 100;
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  instanceQueue = self->_instanceQueue;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke;
  v35[3] = &unk_1E444A7A0;
  v35[4] = self;
  v36 = v14;
  v42 = a6;
  v43 = a4;
  v37 = v17;
  v38 = v16;
  v45 = a8;
  v39 = v15;
  v41 = v18;
  v24 = v22;
  v40 = v24;
  v44 = v21;
  v25 = v18;
  v26 = v15;
  v27 = v16;
  v28 = v17;
  v29 = v14;
  fp_dispatch_async_with_logs(instanceQueue, v35);
  v30 = v40;
  v31 = v24;

  return v31;
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  uint64_t v26;
  BOOL v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  BOOL v59;
  char v60;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainContextForItemID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "domain");
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
      objc_msgSend(v4, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "personaIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v17, v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext _createItemBasedOnTemplate:fields:contents:options:request:bounce:bounceNumber:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2772, (const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v4, "vendorInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(a1 + 88);
  v27 = (v26 & 0x10000) == 0;
  v28 = *(id *)(a1 + 40);
  v29 = *(_QWORD *)(a1 + 96);
  if ((v26 & 0x10000) != 0 && *(_QWORD *)(a1 + 48))
  {
    v30 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");

    objc_msgSend(*(id *)(a1 + 40), "filename");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(*(id *)(a1 + 48), "longValue"), objc_msgSend(*(id *)(a1 + 40), "isFolder"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFilename:", v32);

    v29 |= 2uLL;
    v28 = v30;
  }
  v33 = (v26 >> 17) & 1;
  fp_current_or_default_log();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_cold_1(v28, a1, v34);

  v35 = *(unsigned __int16 *)(a1 + 88);
  v37 = *(_QWORD *)(a1 + 56);
  v36 = *(_QWORD *)(a1 + 64);
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446;
  v47[3] = &unk_1E444A778;
  v38 = v4;
  v48 = v38;
  v58 = *(_BYTE *)(a1 + 112);
  v59 = v27;
  v49 = *(id *)(a1 + 40);
  v39 = *(id *)(a1 + 48);
  v60 = v33;
  v40 = *(_QWORD *)(a1 + 32);
  v50 = v39;
  v51 = v40;
  v41 = v28;
  v52 = v41;
  v53 = *(id *)(a1 + 56);
  v42 = *(id *)(a1 + 80);
  v43 = *(_QWORD *)(a1 + 96);
  v55 = v42;
  v56 = v43;
  v44 = *(id *)(a1 + 64);
  v45 = *(_QWORD *)(a1 + 88);
  v54 = v44;
  v57 = v45;
  objc_msgSend(v25, "createItemBasedOnTemplate:fields:contents:options:request:completionHandler:", v41, v29, v36, v35, v37, v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    objc_msgSend(*(id *)(a1 + 72), "addChild:withPendingUnitCount:", v46, *(_QWORD *)(a1 + 104));

}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  unint64_t v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  NSObject *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  NSObject *v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  char v100;
  id v101;
  id v102;
  id v103[2];

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", a5, CFSTR("createItemBasedOnTemplate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((*(_BYTE *)(a1 + 112) || *(_BYTE *)(a1 + 113))
    && (objc_msgSend(v10, "fp_userInfoItem"), (v12 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v13 = (void *)v12, v14 = objc_msgSend(v11, "fp_isFileProviderError:", -1001), v13, v14))
  {
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    if (!*(_BYTE *)(a1 + 114) && !*(_BYTE *)(a1 + 113))
    {
      v17 = (void *)objc_msgSend(v15, "copy");

      objc_msgSend(v17, "filename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v103[0] = v16;
      objc_msgSend(v18, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", v103, 0, objc_msgSend(v17, "isFolder"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v103[0];
      v21 = v16;
      v16 = v20;

      objc_msgSend(v17, "setFilename:", v19);
      v15 = v17;
    }
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = objc_msgSend(v16, "longValue");
    if (v23 <= 1)
      v24 = 1;
    else
      v24 = v23;
    objc_msgSend(v22, "numberWithLong:", v24 + 1);
    v86 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "supportsPickingFolders")
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 104), "isUsingFPFS") & 1) == 0)
    {
      fp_current_or_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_6(a1);

      objc_msgSend(*(id *)(a1 + 32), "v2Instance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "parentItemIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v26;
      objc_msgSend(v26, "URLForItemWithPersistentIdentifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 64), "filename");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(*(id *)(a1 + 64), "isFolder");
      v102 = 0;
      v81 = v28;
      objc_msgSend(v28, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v29, v30, 0, &v102, 0);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v102;

      v83 = (void *)v31;
      if (v31 && v32)
      {
        v84 = v16;
        v33 = (void *)MEMORY[0x1E0CB37E8];
        v34 = -[NSObject longValue](v32, "longValue");
        v35 = -[NSObject longValue](v86, "longValue");
        if (v34 + 1 > v35)
          v36 = v34 + 1;
        else
          v36 = v35;
        objc_msgSend(v33, "numberWithLong:", v36);
        v37 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 64), "filename");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = 0;
        objc_msgSend(v38, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v101, 0, objc_msgSend(*(id *)(a1 + 64), "isFolder"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v101;

        objc_msgSend(v83, "lastPathComponent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v37;
        objc_msgSend(v40, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", 0, 0, objc_msgSend(v83, "fp_isFolder"));
        v42 = objc_claimAutoreleasedReturnValue();

        v78 = (void *)v42;
        v79 = v39;
        v43 = v42;
        v44 = v77;
        v80 = v41;
        if (objc_msgSend(v39, "isEqualToString:", v43)
          && v41 > v77
          && (v45 = -[NSObject unsignedIntegerValue](v41, "unsignedIntegerValue"),
              v45 < objc_msgSend(MEMORY[0x1E0CB3940], "fp_maximumBounceLevel")))
        {
          v46 = v41;

          fp_current_or_default_log();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_3((uint64_t)v77);
        }
        else
        {
          fp_current_or_default_log();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_4((uint64_t)v41);
          v46 = v86;
        }
        v16 = v84;

        v86 = v46;
        v32 = v80;
      }
      else
      {
        fp_current_or_default_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_5();
      }

    }
    v51 = *(unsigned __int8 *)(a1 + 113);
    fp_current_or_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
    if (v51)
    {
      v85 = v16;
      if (v53)
        __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_2(a1);

      v54 = *(void **)(a1 + 32);
      objc_msgSend(v11, "fp_userInfoItem");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "itemFromVendorItem:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v57 = *(void **)(a1 + 56);
      v58 = *(_QWORD *)(a1 + 72);
      v59 = -[NSObject unsignedIntegerValue](v86, "unsignedIntegerValue");
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_449;
      v87[3] = &unk_1E444A750;
      v95 = *(id *)(a1 + 88);
      v88 = *(id *)(a1 + 32);
      v89 = v9;
      v96 = a3;
      v99 = a4;
      v60 = *(id *)(a1 + 72);
      v61 = *(_QWORD *)(a1 + 56);
      v62 = *(void **)(a1 + 64);
      v90 = v60;
      v91 = v61;
      v63 = v62;
      v64 = *(_QWORD *)(a1 + 96);
      v92 = v63;
      v97 = v64;
      v65 = *(id *)(a1 + 80);
      v66 = *(_QWORD *)(a1 + 104);
      v93 = v65;
      v98 = v66;
      v100 = *(_BYTE *)(a1 + 112);
      v67 = *(void **)(a1 + 48);
      v68 = v86;
      v94 = v67;
      objc_msgSend(v57, "_freeSlotHeldByItem:request:bounceIndex:completionHandler:", v56, v58, v59, v87);

      v16 = v85;
    }
    else
    {
      if (v53)
        __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_1(a1);

      v69 = *(void **)(a1 + 56);
      v70 = *(_QWORD *)(a1 + 96);
      v71 = *(_QWORD *)(a1 + 104) | 0x20000;
      v73 = *(_QWORD *)(a1 + 72);
      v72 = *(_QWORD *)(a1 + 80);
      v74 = *(unsigned __int8 *)(a1 + 112);
      v75 = *(_QWORD *)(a1 + 88);
      v68 = v86;
      v76 = (id)objc_msgSend(v69, "_createItemBasedOnTemplate:fields:contents:options:request:bounce:bounceNumber:completionHandler:", v15, v70, v72, v71, v73, v74, v86, v75);
    }

  }
  else
  {
    v48 = *(_QWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", v9);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentResponseWithRequest:", *(_QWORD *)(a1 + 72));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t, void *, void *))(v48 + 16))(v48, v49, a3, a4, v50, v11);

  }
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_449(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    v3 = *(_QWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 96);
    v6 = *(unsigned __int8 *)(a1 + 120);
    objc_msgSend(*(id *)(a1 + 32), "currentResponseWithRequest:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t, void *, id))(v3 + 16))(v3, v4, v5, v6, v7, v9);

  }
  else
  {
    v8 = (id)objc_msgSend(*(id *)(a1 + 56), "_createItemBasedOnTemplate:fields:contents:options:request:bounce:bounceNumber:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 112) | 0x20000, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 121), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  }

}

- (void)_fetchHierarchyForItemID:(id)a3 into:(id)a4 maxDepth:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__FPXExtensionContext__fetchHierarchyForItemID_into_maxDepth_completionHandler___block_invoke;
  v17[3] = &unk_1E444A7C8;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a5;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  -[FPXExtensionContext itemForItemID:request:completionHandler:](self, "itemForItemID:request:completionHandler:", v16, v13, v17);

}

void __80__FPXExtensionContext__fetchHierarchyForItemID_into_maxDepth_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  char v47;
  char v48;
  id v49;
  void *v50;
  id v51;
  void *v52;

  v7 = a2;
  v51 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "domainContextForItemID:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personaIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v52 = v9;
  if (!v11)
  {

    if (v7)
      goto LABEL_4;
LABEL_11:
    fp_current_or_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    v20 = v52;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      __80__FPXExtensionContext__fetchHierarchyForItemID_into_maxDepth_completionHandler___block_invoke_cold_1();

    v33 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v52, "internalErrorFromVendorError:callerDescription:", v8, CFSTR("fetchHierarchyForItemID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v33 + 16))(v33, 0, v34);
    goto LABEL_14;
  }
  v12 = (void *)v11;
  objc_msgSend(v9, "domain");
  v49 = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personaIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v15 = a1;
  v16 = v8;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentPersona");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "userPersonaUniqueString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v14, "isEqualToString:", v19);

  v8 = v16;
  a1 = v15;

  v7 = v49;
  if ((v47 & 1) == 0)
  {
    v36 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "currentPersona");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "userPersonaUniqueString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "currentPersona");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "uid");
    objc_msgSend(v52, "domain");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "personaIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v39, v42, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      +[FPXExtensionContext principalClass].cold.1();

    __assert_rtn("-[FPXExtensionContext _fetchHierarchyForItemID:into:maxDepth:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2913, (const char *)objc_msgSend(objc_retainAutorelease(v45), "UTF8String"));
  }
  if (!v49)
    goto LABEL_11;
LABEL_4:
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  v20 = v52;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= *(_QWORD *)(a1 + 64))
    goto LABEL_16;
  objc_msgSend(v7, "itemIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentItemIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isEqualToString:", v22) & 1) != 0
    || (objc_msgSend(v7, "parentItemIdentifier"), (v23 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_16;
  }
  v24 = (void *)v23;
  objc_msgSend(v7, "fp_parentDomainIdentifier");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v7;
  if (v25)
  {
    v27 = (void *)v25;
    objc_msgSend(v26, "fp_parentDomainIdentifier");
    v50 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "domain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = v8;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v28, "isEqualToString:", v31);

    v8 = v30;
    v7 = v50;
    if ((v48 & 1) != 0)
      goto LABEL_19;
LABEL_16:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_17;
  }

LABEL_19:
  v35 = *(void **)(a1 + 32);
  objc_msgSend(v7, "parentItemID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_fetchHierarchyForItemID:into:maxDepth:completionHandler:", v34, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
LABEL_14:

LABEL_17:
}

- (void)fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 ignoreAlternateContentURL:(BOOL)a5 reply:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  void *v17;
  uint8_t buf[4];
  FPXExtensionContext *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v7 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  fpfs_adopt_log(self->_log);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v19 = self;
    v20 = 2080;
    v21 = "-[FPXExtensionContext fetchHierarchyForItemID:recursively:ignoreAlternateContentURL:reply:]";
    v22 = 2112;
    v23 = v9;
    v24 = 1024;
    v25 = v7;
    _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %{BOOL}d", buf, 0x26u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v13 = 200;
  else
    v13 = 2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__FPXExtensionContext_fetchHierarchyForItemID_recursively_ignoreAlternateContentURL_reply___block_invoke;
  v15[3] = &unk_1E444A7F0;
  v15[4] = self;
  v14 = v10;
  v16 = v14;
  -[FPXExtensionContext _fetchHierarchyForItemID:into:maxDepth:completionHandler:](self, "_fetchHierarchyForItemID:into:maxDepth:completionHandler:", v9, v12, v13, v15);

  __fp_pop_log(&v17);
}

void __91__FPXExtensionContext_fetchHierarchyForItemID_recursively_ignoreAlternateContentURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
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
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPXExtensionContext fetchHierarchyForItemID:recursively:ignoreAlternateContentURL:reply:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v10);

}

- (void)fetchItemID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  fpfs_adopt_log(self->_log);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext fetchItemID:reply:].cold.1();

  +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__FPXExtensionContext_fetchItemID_reply___block_invoke;
  v11[3] = &unk_1E444A138;
  v11[4] = self;
  v10 = v7;
  v12 = v10;
  -[FPXExtensionContext itemForItemID:request:completionHandler:](self, "itemForItemID:request:completionHandler:", v6, v9, v11);

  __fp_pop_log(&v13);
}

void __41__FPXExtensionContext_fetchItemID_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2080;
    v19 = "-[FPXExtensionContext fetchItemID:reply:]_block_invoke";
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v9;
    _os_log_debug_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v13);

}

- (void)fetchDefaultContainerForBundleIdentifier:(id)a3 defaultName:(id)a4 inDomainIdentifier:(id)a5 lookupOnly:(BOOL)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  OS_dispatch_queue *instanceQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  instanceQueue = self->_instanceQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke;
  v21[3] = &unk_1E444A8B8;
  v21[4] = self;
  v22 = v14;
  v24 = v12;
  v25 = v15;
  v26 = a6;
  v23 = v13;
  v17 = v12;
  v18 = v13;
  v19 = v15;
  v20 = v14;
  fp_dispatch_async_with_logs(instanceQueue, v21);

}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  void (**v41)(_QWORD);
  id v42;
  char v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  id v53;

  objc_msgSend(*(id *)(a1 + 32), "domainContextForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v2, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPersonaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPersona");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userPersonaUniqueString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "uid");
      objc_msgSend(v2, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personaIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v15, v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext fetchDefaultContainerForBundleIdentifier:defaultName:inDomainIdentifier:lookupOnly:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 2969, (const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "instanceWithPrivateSelector:", sel__defaultApplicationContainerForBundleIdentifier_completionHandler_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_2;
  v50[3] = &unk_1E444A818;
  v25 = v2;
  v26 = *(_QWORD *)(a1 + 32);
  v51 = v25;
  v52 = v26;
  v53 = *(id *)(a1 + 64);
  v27 = (void *)MEMORY[0x1A1B00850](v50);
  v28 = v27;
  if (*(_BYTE *)(a1 + 72))
  {
    v48[0] = v24;
    v48[1] = 3221225472;
    v48[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_456;
    v48[3] = &unk_1E444A840;
    v49 = v27;
    v29 = (void (**)(_QWORD))MEMORY[0x1A1B00850](v48);
    v30 = v49;
  }
  else
  {
    v44[0] = v24;
    v44[1] = 3221225472;
    v44[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_2_457;
    v44[3] = &unk_1E4449C60;
    v31 = *(void **)(a1 + 40);
    v44[4] = *(_QWORD *)(a1 + 32);
    v45 = v31;
    v46 = *(id *)(a1 + 48);
    v47 = v28;
    v29 = (void (**)(_QWORD))MEMORY[0x1A1B00850](v44);

    v30 = v45;
  }

  if (v23)
  {
    v36[0] = v24;
    v36[1] = 3221225472;
    v36[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4;
    v36[3] = &unk_1E444A890;
    v32 = *(_QWORD *)(a1 + 56);
    v40 = *(id *)(a1 + 64);
    v37 = v25;
    v43 = *(_BYTE *)(a1 + 72);
    v33 = *(id *)(a1 + 48);
    v34 = *(_QWORD *)(a1 + 32);
    v38 = v33;
    v39 = v34;
    v41 = v29;
    v42 = v28;
    v35 = (id)objc_msgSend(v23, "_defaultApplicationContainerForBundleIdentifier:completionHandler:", v32, v36);

  }
  else
  {
    v29[2](v29);
  }

}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", a3, CFSTR("fetchDefaultContainerForBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_userInfoFPItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "fp_userInfoFPItem");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = 0;
    v5 = (id)v8;
  }
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2080;
    v18 = "-[FPXExtensionContext fetchDefaultContainerForBundleIdentifier:defaultName:inDomainIdentifier:lookupOnly:reply"
          ":]_block_invoke_2";
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log(&v12);

}

uint64_t __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_456(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_2_457(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  int v4;
  __CFString *v5;
  FPItem *v6;
  void *v7;
  FPItem *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = CFSTR("NSFileProviderRootContainerItemIdentifier");
  objc_msgSend(*(id *)(a1 + 32), "providerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fp_isiCloudDriveIdentifier");

  if (v4)
  {
    v5 = CFSTR("a1");

    v2 = v5;
  }
  v6 = [FPItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "providerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPItem initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:isDirectory:](v6, "initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:isDirectory:", v7, *(_QWORD *)(a1 + 40), CFSTR("__"), v2, *(_QWORD *)(a1 + 48), 1);

  -[FPItem setFileSystemFlags:](v8, "setFileSystemFlags:", 7);
  v9 = *(void **)(a1 + 32);
  +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_3;
  v12[3] = &unk_1E444A868;
  v13 = *(id *)(a1 + 56);
  v11 = (id)objc_msgSend(v9, "createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:", v8, 262, 0, 65537, v10, 0, v12);

}

uint64_t __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "fp_userInfoItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "fp_userInfoItem");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = 0;
    v5 = (id)v8;
  }
  objc_msgSend(v6, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("NSFileProviderInternalErrorDomain")))
  {
    v10 = objc_msgSend(v6, "code");

    if (v10 == 3)
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4_cold_1(v6, v11);

      v12 = *(_QWORD *)(a1 + 56);
      FPNotSupportedError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);
      goto LABEL_14;
    }
  }
  else
  {

  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (*(_BYTE *)(a1 + 80))
  {
LABEL_13:
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v13, v6);
    goto LABEL_14;
  }
  if (v6)
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "fp_prettyDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v15;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] can't get default location, fallback on default name '%@'; %@",
        (uint8_t *)&v25,
        0x16u);

    }
    goto LABEL_28;
  }
  if (!v13)
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v19 = *(_QWORD *)(a1 + 40);
    v25 = 138412546;
    v26 = v19;
    v27 = 2112;
    v28 = v5;
    v18 = "[WARNING] can't create item, fallback on default name '%@'; %@";
    goto LABEL_27;
  }
  if ((objc_msgSend(v13, "isFolder") & 1) == 0)
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v20 = *(_QWORD *)(a1 + 40);
    v25 = 138412546;
    v26 = v20;
    v27 = 2112;
    v28 = v13;
    v18 = "[WARNING] default location must be a folder, fallback on default name '%@'; %@";
    goto LABEL_27;
  }
  if ((objc_msgSend(v13, "isWritable") & 1) != 0)
  {
LABEL_32:
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4_cold_2((uint64_t)v13, v6, v24);

    goto LABEL_13;
  }
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 40);
    v25 = 138412546;
    v26 = v17;
    v27 = 2112;
    v28 = v13;
    v18 = "[WARNING] default location must be writable, fallback on default name '%@'; %@";
LABEL_27:
    _os_log_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v25, 0x16u);
  }
LABEL_28:

  if (!*(_QWORD *)(a1 + 40))
    goto LABEL_32;
  fp_current_or_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "fp_prettyDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v22;
    v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1A0A34000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to get default location, fallback on default name '%@'; %@",
      (uint8_t *)&v25,
      0x16u);

  }
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 48) + 32), *(dispatch_block_t *)(a1 + 64));
LABEL_14:

}

- (id)fetchPublishingURLForItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  OS_dispatch_queue *instanceQueue;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  fpfs_adopt_log(self->_log);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext fetchPublishingURLForItemID:completionHandler:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  instanceQueue = self->_instanceQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__FPXExtensionContext_fetchPublishingURLForItemID_completionHandler___block_invoke;
  v17[3] = &unk_1E444A470;
  v17[4] = self;
  v11 = v6;
  v18 = v11;
  v12 = v7;
  v20 = v12;
  v13 = v9;
  v19 = v13;
  fp_dispatch_async_with_logs(instanceQueue, v17);
  v14 = v19;
  v15 = v13;

  __fp_pop_log(&v21);
  return v15;
}

void __69__FPXExtensionContext_fetchPublishingURLForItemID_completionHandler___block_invoke(id *a1)
{
  void *v2;
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
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void (**v28)(id, _QWORD, void *);
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "domainContextForItemID:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "domain");
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
      objc_msgSend(v2, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext fetchPublishingURLForItemID:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3079, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v2, "instanceWithPrivateSelector:", sel_fetchPublishingURLForItemIdentifier_completionHandler_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(a1[5], "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __69__FPXExtensionContext_fetchPublishingURLForItemID_completionHandler___block_invoke_2;
    v34[3] = &unk_1E444A8E0;
    v24 = v2;
    v25 = a1[4];
    v35 = v24;
    v36 = v25;
    v37 = a1[7];
    objc_msgSend(v22, "fetchPublishingURLForItemIdentifier:completionHandler:", v23, v34);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      objc_msgSend(a1[6], "addChild:withPendingUnitCount:", v26, 100);

  }
  else
  {
    fpfs_adopt_log(*((void **)a1[4] + 9));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v30 = FPPopLogSectionForBlock(a1[7]);
      v31 = a1[4];
      FPNotSupportedError();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v39 = v30;
      v40 = 2112;
      v41 = v31;
      v42 = 2080;
      v43 = "-[FPXExtensionContext fetchPublishingURLForItemID:completionHandler:]_block_invoke";
      v44 = 2112;
      v45 = 0;
      v46 = 2112;
      v47 = v32;
      _os_log_debug_impl(&dword_1A0A34000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v28 = (void (**)(id, _QWORD, void *))a1[7];
    FPNotSupportedError();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, 0, v29);

    __fp_pop_log(&v33);
  }

}

void __69__FPXExtensionContext_fetchPublishingURLForItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", a3, CFSTR("fetchPublishingURLForItemID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPXExtensionContext fetchPublishingURLForItemID:completionHandler:]_block_invoke_2";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log(&v10);

}

- (id)disconnectDomainID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  OS_dispatch_queue *instanceQueue;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  void *v24;

  v8 = a3;
  v9 = a5;
  fpfs_adopt_log(self->_log);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext disconnectDomainID:options:completionHandler:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  instanceQueue = self->_instanceQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke;
  v19[3] = &unk_1E444A908;
  v19[4] = self;
  v13 = v8;
  v20 = v13;
  v23 = a4;
  v14 = v9;
  v22 = v14;
  v15 = v11;
  v21 = v15;
  fp_dispatch_async_with_logs(instanceQueue, v19);
  v16 = v21;
  v17 = v15;

  __fp_pop_log(&v24);
  return v17;
}

void __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
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
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "domainContextForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "domain");
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
      objc_msgSend(v2, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext disconnectDomainID:options:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3110, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v2, "instanceWithPrivateSelector:", sel_disconnectWithOptions_completionHandler_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke_2;
    v32[3] = &unk_1E4449AF8;
    v32[4] = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 64);
    v33 = *(id *)(a1 + 56);
    objc_msgSend(v22, "disconnectWithOptions:completionHandler:", v23, v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(*(id *)(a1 + 48), "addChild:withPendingUnitCount:", v24, 100);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v28 = FPPopLogSectionForBlock(*(void **)(a1 + 56));
      v29 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v35 = v28;
      v36 = 2112;
      v37 = v29;
      v38 = 2080;
      v39 = "-[FPXExtensionContext disconnectDomainID:options:completionHandler:]_block_invoke";
      v40 = 2112;
      v41 = v30;
      _os_log_debug_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v26 = *(_QWORD *)(a1 + 56);
    FPNotSupportedError();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);

    __fp_pop_log(&v31);
  }

}

void __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2080;
      v17 = "-[FPXExtensionContext disconnectDomainID:options:completionHandler:]_block_invoke";
      v18 = 2112;
      v19 = v3;
      _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v9);

  }
  else
  {
    +[NSFileProviderManager legacyDefaultManager](NSFileProviderManager, "legacyDefaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke_3;
    v10[3] = &unk_1E4449AF8;
    v6 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v6;
    objc_msgSend(v5, "setConnected:completionHandler:", 0, v10);

  }
}

void __68__FPXExtensionContext_disconnectDomainID_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext disconnectDomainID:options:completionHandler:]_block_invoke_3";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 domainIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  OS_dispatch_queue *instanceQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  FPXExtensionContext *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint8_t buf[4];
  FPXExtensionContext *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  fpfs_adopt_log(self->_log);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v34 = self;
    v35 = 2080;
    v36 = "-[FPXExtensionContext performActionWithIdentifier:onItemsWithIdentifiers:domainIdentifier:completionHandler:]";
    v37 = 2112;
    v38 = v10;
    v39 = 2112;
    v40 = v11;
    _os_log_debug_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  instanceQueue = self->_instanceQueue;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E444A958;
  v17 = v10;
  v26 = v17;
  v27 = self;
  v18 = v12;
  v28 = v18;
  v19 = v11;
  v29 = v19;
  v20 = v13;
  v31 = v20;
  v21 = v15;
  v30 = v21;
  fp_dispatch_async_with_logs(instanceQueue, v25);
  v22 = v30;
  v23 = v21;

  __fp_pop_log(&v32);
  return v23;
}

void __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 40), "domainContextForIdentifier:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userPersonaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPersona");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userPersonaUniqueString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentPersona");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "uid");
      objc_msgSend(v3, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "personaIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v15, v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext performActionWithIdentifier:onItemsWithIdentifiers:domainIdentifier:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3148, (const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v3, "vendorInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "conformsToProtocol:", &unk_1EE5DD000))
    v24 = v23;
  else
    v24 = 0;

  if (v24)
  {
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 56);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke_2;
    v37[3] = &unk_1E444A930;
    v27 = v3;
    v28 = *(_QWORD *)(a1 + 40);
    v38 = v27;
    v39 = v28;
    v40 = *(id *)(a1 + 72);
    objc_msgSend(v24, "performActionWithIdentifier:onItemsWithIdentifiers:completionHandler:", v25, v26, v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(*(id *)(a1 + 64), "addChild:withPendingUnitCount:", v29, 100);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v33 = FPPopLogSectionForBlock(*(void **)(a1 + 72));
      v34 = *(_QWORD *)(a1 + 40);
      FPNotSupportedError();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v42 = v33;
      v43 = 2112;
      v44 = v34;
      v45 = 2080;
      v46 = "-[FPXExtensionContext performActionWithIdentifier:onItemsWithIdentifiers:domainIdentifier:completionHandler:]_block_invoke";
      v47 = 2112;
      v48 = v35;
      _os_log_debug_impl(&dword_1A0A34000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v31 = *(_QWORD *)(a1 + 72);
    FPNotSupportedError();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v32);

    __fp_pop_log(&v36);
  }

}

void __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
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
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", a2, CFSTR("performActionWithIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext performActionWithIdentifier:onItemsWithIdentifiers:domainIdentifier:completionHandler:]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log(&v7);

}

- (void)wakeForSessionIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *instanceQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  fpfs_adopt_log(self->_log);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext wakeForSessionIdentifier:completionHandler:].cold.1();

  instanceQueue = self->_instanceQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E4449C88;
  v12[4] = self;
  v10 = v7;
  v14 = v10;
  v11 = v6;
  v13 = v11;
  fp_dispatch_async_with_logs(instanceQueue, v12);

  __fp_pop_log(&v15);
}

void __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "instanceWithPrivateSelector:", sel_handleEventsForBackgroundURLSession_completionHandler_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[NSFileProviderExtension instanceMethodForSelector:](NSFileProviderExtension, "instanceMethodForSelector:", sel_handleEventsForBackgroundURLSession_completionHandler_);
  if (v3 == objc_msgSend(v2, "methodForSelector:", sel_handleEventsForBackgroundURLSession_completionHandler_))
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v9 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2080;
      v19 = "-[FPXExtensionContext wakeForSessionIdentifier:completionHandler:]_block_invoke";
      v20 = 2112;
      v21 = v10;
      _os_log_debug_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v6 = *(_QWORD *)(a1 + 48);
    FPNotSupportedError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    __fp_pop_log(&v13);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke_473;
    v11[3] = &unk_1E4449AB0;
    v4 = *(_QWORD *)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v2, "handleEventsForBackgroundURLSession:completionHandler:", v4, v11);

  }
}

void __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke_473(uint64_t a1)
{
  NSObject *v2;
  void *v3[9];

  v3[8] = *(void **)MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v3[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke_473_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(v3);

}

- (void)bulkEvictItemsWithItemIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *instanceQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void *v15[7];

  v15[6] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  fpfs_adopt_log(self->_log);
  v15[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    logStringForObjects(v6);
    objc_claimAutoreleasedReturnValue();
    -[FPXExtensionContext bulkEvictItemsWithItemIDs:completionHandler:].cold.1();
  }

  instanceQueue = self->_instanceQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke;
  v12[3] = &unk_1E4449C88;
  v12[4] = self;
  v10 = v7;
  v14 = v10;
  v11 = v6;
  v13 = v11;
  fp_dispatch_async_with_logs(instanceQueue, v12);

  __fp_pop_log(v15);
}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "instanceWithPrivateSelector:", sel_evictItemWithIdentifier_completionHandler_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = *(void **)(a1 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_474;
    v21[3] = &unk_1E444A980;
    v22 = v3;
    v7 = v2;
    v23 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v21);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_476;
    v17[3] = &unk_1E4449B98;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 32);
    v18 = v9;
    v19 = v10;
    v20 = *(id *)(a1 + 48);
    dispatch_async(v8, v17);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v15 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      v29 = 2080;
      v30 = "-[FPXExtensionContext bulkEvictItemsWithItemIDs:completionHandler:]_block_invoke";
      v31 = 2112;
      v32 = v16;
      _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v12 = *(_QWORD *)(a1 + 48);
    FPNotSupportedError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    __fp_pop_log(&v24);
  }

}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_474(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_2;
  v7[3] = &unk_1E444A498;
  v8 = v3;
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v4, "evictItemWithIdentifier:completionHandler:", v5, v7);

}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_2_cold_1(a1, v4, v5);

    objc_msgSend(v4, "fp_strippedError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_476(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    FPPartialErrorsByItemIdentifiers(*(void **)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2080;
    v12 = "-[FPXExtensionContext bulkEvictItemsWithItemIDs:completionHandler:]_block_invoke";
    v13 = 2112;
    v14 = v2;
    _os_log_debug_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log(&v6);

}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  OS_dispatch_queue *instanceQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  uint8_t buf[4];
  FPXExtensionContext *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  fpfs_adopt_log(self->_log);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v20 = self;
    v21 = 2080;
    v22 = "-[FPXExtensionContext attemptRecoveryFromError:optionIndex:completionHandler:]";
    v23 = 2112;
    v24 = v8;
    v25 = 2048;
    v26 = a4;
    _os_log_debug_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %lu", buf, 0x2Au);
  }

  instanceQueue = self->_instanceQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__FPXExtensionContext_attemptRecoveryFromError_optionIndex_completionHandler___block_invoke;
  v14[3] = &unk_1E444A9A8;
  v14[4] = self;
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  v17 = a4;
  fp_dispatch_async_with_logs(instanceQueue, v14);

  __fp_pop_log(&v18);
}

void __78__FPXExtensionContext_attemptRecoveryFromError_optionIndex_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "instanceWithPrivateSelector:", sel_attemptRecoveryFromError_optionIndex_completionHandler_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__FPXExtensionContext_attemptRecoveryFromError_optionIndex_completionHandler___block_invoke_479;
    v11[3] = &unk_1E4449AF8;
    v3 = *(_QWORD *)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v2, "attemptRecoveryFromError:optionIndex:completionHandler:", v3, v4, v11);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v9 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2080;
      v19 = "-[FPXExtensionContext attemptRecoveryFromError:optionIndex:completionHandler:]_block_invoke";
      v20 = 2112;
      v21 = v10;
      _os_log_debug_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v6 = *(_QWORD *)(a1 + 48);
    FPNotSupportedError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    __fp_pop_log(&v13);
  }

}

void __78__FPXExtensionContext_attemptRecoveryFromError_optionIndex_completionHandler___block_invoke_479(uint64_t a1, void *a2)
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext attemptRecoveryFromError:optionIndex:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (void)userInteractionErrorsForPerformingAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 fpProviderDomainId:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)a9
{
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  FPXExtensionContext *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  char *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  FPXExtensionContext *v40;
  __int16 v41;
  FPXExtensionContext *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v34 = (char *)a3;
  v36 = a4;
  v35 = a5;
  v32 = a6;
  v30 = a7;
  v31 = a8;
  v33 = a9;
  fpfs_adopt_log(self->_log);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    logStringForObjects(v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v40 = self;
    v41 = 2080;
    v42 = (FPXExtensionContext *)"-[FPXExtensionContext userInteractionErrorsForPerformingAction:sourceItems:destinationI"
                                 "tem:fpProviderDomainId:sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:]";
    v43 = 2112;
    v44 = v34;
    v45 = 2112;
    v46 = v28;
    v47 = 2112;
    v48 = v35;
    _os_log_debug_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@, %@", buf, 0x34u);

  }
  objc_msgSend(v32, "fp_toDomainIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXExtensionContext createUserInteractionSuppressingWithDomainIdentifier:withPurpose:](self, "createUserInteractionSuppressingWithDomainIdentifier:withPurpose:", v16, CFSTR("userInteractionErrorsForPerformingAction"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXDomainContext providerDomain](self->_domainContext, "providerDomain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "providerID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXDomainContext providerDomain](self->_domainContext, "providerDomain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPPreflightUserInteraction interactionsForBundle:providerIdentifier:domainIdentifier:](FPPreflightUserInteraction, "interactionsForBundle:providerIdentifier:domainIdentifier:", v18, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPXDomainContext userInfo](self->_domainContext, "userInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPPreflightUserInteraction evaluationObjectsForAction:sourceItems:destinationItem:domainUserInfo:sourceItemKeysAllowList:destinationItemKeysAllowList:](FPPreflightUserInteraction, "evaluationObjectsForAction:sourceItems:destinationItem:domainUserInfo:sourceItemKeysAllowList:destinationItemKeysAllowList:", v34, v36, v35, v24, v30, v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[FPPreflightUserInteraction gatherErrorsForInteractions:evaluationObjects:suppressionDelegate:](FPPreflightUserInteraction, "gatherErrorsForInteractions:evaluationObjects:suppressionDelegate:", v23, v25, v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log(self->_log);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v29 = (FPXExtensionContext *)FPPopLogSectionForBlock(v33);
    *(_DWORD *)buf = 134218754;
    v40 = v29;
    v41 = 2112;
    v42 = self;
    v43 = 2080;
    v44 = "-[FPXExtensionContext userInteractionErrorsForPerformingAction:sourceItems:destinationItem:fpProviderDomainId:"
          "sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:]";
    v45 = 2112;
    v46 = v26;
    _os_log_debug_impl(&dword_1A0A34000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*((void (**)(id, void *))v33 + 2))(v33, v26);
  __fp_pop_log(&v37);

  __fp_pop_log(&v38);
}

- (void)fetchTrashIdentifiersWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *instanceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);

}

void __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "instanceWithPrivateSelector:", sel_fetchTrashIdentifiersWithCompletionHandler_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EE5F7F20) & 1) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke_512;
    v10[3] = &unk_1E444A7F0;
    v3 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v3;
    objc_msgSend(v2, "fetchTrashIdentifiersWithCompletionHandler:", v10);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v8 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2080;
      v18 = "-[FPXExtensionContext fetchTrashIdentifiersWithCompletionHandler:]_block_invoke";
      v19 = 2112;
      v20 = 0;
      v21 = 2112;
      v22 = v9;
      _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v5 = *(_QWORD *)(a1 + 40);
    FPNotSupportedError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    __fp_pop_log(&v12);
  }

}

void __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke_512(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E4449C38;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "fp_map:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2080;
    v18 = "-[FPXExtensionContext fetchTrashIdentifiersWithCompletionHandler:]_block_invoke";
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v6;
    _os_log_debug_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v11);

}

uint64_t __66__FPXExtensionContext_fetchTrashIdentifiersWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "itemIDFromVendorItemID:", a2);
}

- (void)updateIgnoreStateOfItemWithIdentifiers:(id)a3 ignoreState:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  FPXExtensionContext *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  fpfs_adopt_log(self->_log);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = FPPopLogSectionForBlock(v8);
    FPNotSupportedError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v15 = v11;
    v16 = 2112;
    v17 = self;
    v18 = 2080;
    v19 = "-[FPXExtensionContext updateIgnoreStateOfItemWithIdentifiers:ignoreState:completionHandler:]";
    v20 = 2112;
    v21 = 0;
    v22 = 2112;
    v23 = 0;
    v24 = 2112;
    v25 = v12;
    _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

  }
  FPNotSupportedError();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v10);

  __fp_pop_log(&v13);
}

- (void)fetchCustomPushTopicsWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *instanceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__FPXExtensionContext_fetchCustomPushTopicsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);

}

void __66__FPXExtensionContext_fetchCustomPushTopicsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "instanceWithPrivateSelector:", sel_customPushTopics);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EE5F7F20) & 1) != 0)
  {
    objc_msgSend(v2, "customPushTopics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v11 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2080;
      v19 = "-[FPXExtensionContext fetchCustomPushTopicsWithCompletionHandler:]_block_invoke";
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = 0;
      _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v13);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v9 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2080;
      v19 = "-[FPXExtensionContext fetchCustomPushTopicsWithCompletionHandler:]_block_invoke";
      v20 = 2112;
      v21 = 0;
      v22 = 2112;
      v23 = v10;
      _os_log_debug_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v6 = *(_QWORD *)(a1 + 40);
    FPNotSupportedError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    __fp_pop_log(&v13);
  }

}

- (void)wakeForPushWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6[9];

  v6[8] = *(void **)MEMORY[0x1E0C80C00];
  v4 = a3;
  fpfs_adopt_log(self->_log);
  v6[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(v4);
    -[FPXExtensionContext wakeForPushWithCompletionHandler:].cold.1();
  }

  (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  __fp_pop_log(v6);

}

- (void)signalEnumeratorForMaterializedItemsWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *instanceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);

}

void __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 80), "vendorInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E4449AB0;
    v5 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    objc_msgSend(v4, "materializedItemsDidChangeWithCompletionHandler:", v8);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)v2 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 40));
      __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v7);

  }
}

void __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3[9];

  v3[8] = *(void **)MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v3[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(v3);

}

- (void)signalEnumeratorForPendingItemsWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *instanceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);

}

void __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 80), "vendorInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E4449AB0;
    v5 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    objc_msgSend(v4, "pendingItemsDidChangeWithCompletionHandler:", v8);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)v2 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 40));
      __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v7);

  }
}

void __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3[9];

  v3[8] = *(void **)MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v3[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(v3);

}

- (void)importDidFinishWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *instanceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);

}

void __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 80), "vendorInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E4449AB0;
    v5 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    objc_msgSend(v4, "importDidFinishWithCompletionHandler:", v8);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)v2 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 40));
      __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v7);

  }
}

void __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3[9];

  v3[8] = *(void **)MEMORY[0x1E0C80C00];
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v3[0] = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock(*(void **)(a1 + 40));
    __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(v3);

}

- (void)listRemoteVersionsWithSettings:(id)a3 observer:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  OS_dispatch_queue *instanceQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  FPXExtensionContext *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  fpfs_adopt_log(self->_log);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "enumeratedItemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v28 = self;
    v29 = 2080;
    v30 = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]";
    v31 = 2112;
    v32 = v20;
    v33 = 2112;
    v34 = v12;
    _os_log_debug_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@, %@", buf, 0x2Au);

  }
  instanceQueue = self->_instanceQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke;
  v21[3] = &unk_1E444A9D0;
  v21[4] = self;
  v16 = v10;
  v22 = v16;
  v17 = v12;
  v23 = v17;
  v18 = v13;
  v25 = v18;
  v19 = v11;
  v24 = v19;
  fp_dispatch_async_with_logs(instanceQueue, v21);

  __fp_pop_log(&v26);
}

void __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  FPXEnumerator *v31;
  void *v32;
  FPXEnumerator *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  char *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v63;
  void *v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  FPXEnumerator *v73;
  __int16 v74;
  char *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "enumeratedItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "domainContextForItemID:", v4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v63, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "personaIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentPersona");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userPersonaUniqueString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentPersona");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userPersonaUniqueString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentPersona");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "uid");
      objc_msgSend(v63, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personaIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v16, v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3396, (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v63, "vendorInstance");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "conformsToProtocol:", &unk_1EE5F7F80))
    v25 = v24;
  else
    v25 = 0;

  if (v25)
  {
    objc_msgSend(*(id *)(a1 + 40), "enumeratedItemID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 48);
    v65 = 0;
    objc_msgSend(v25, "enumeratorForVersionsOfItemWithIdentifier:request:error:", v27, v28, &v65);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (char *)v65;

    if (!v29 || v30)
    {
      fp_current_or_default_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*v3, "enumeratedItemID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v2, "providerIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "fp_fpIdentifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v67 = v54;
        v68 = 2112;
        v69 = v56;
        v70 = 2112;
        v71 = v30;
        _os_log_debug_impl(&dword_1A0A34000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] can't create vendor enumerator for %@ owned by %@; %@",
          buf,
          0x20u);

      }
      if (v29)
        v39 = 1;
      else
        v39 = v30 != 0;
      if (!v39)
      {
        NSStringFromSelector(sel_listRemoteVersionsWithSettings_observer_request_completionHandler_);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        fp_simulate_crash(CFSTR("-[%@ %@] must return an enumerator or an error."), v40, v41, v42, v43, v44, v45, v46, (uint64_t)v24);

        fp_current_or_default_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
          __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_1((int)v24, sel_listRemoteVersionsWithSettings_observer_request_completionHandler_);

      }
      objc_msgSend(v63, "internalErrorFromVendorError:callerDescription:", v30, CFSTR("fetchAndStartEnumeratingWithSettings"));
      v33 = (FPXEnumerator *)objc_claimAutoreleasedReturnValue();
      fpfs_adopt_log(*((void **)*v2 + 9));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v57 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
        v58 = *v2;
        *(_DWORD *)buf = 134219010;
        v67 = v57;
        v68 = 2112;
        v69 = v58;
        v70 = 2080;
        v71 = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke";
        v72 = 2112;
        v73 = 0;
        v74 = 2112;
        v75 = v30;
        _os_log_debug_impl(&dword_1A0A34000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
    }
    else
    {
      v31 = [FPXEnumerator alloc];
      objc_msgSend(*(id *)(a1 + 40), "enumeratedItemID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[FPXEnumerator initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:](v31, "initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:", v32, v63, v29, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

      if (!v33)
      {
        fp_current_or_default_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_3(v3, v2, v48);

        objc_msgSend(v63, "internalErrorFromVendorError:callerDescription:", 0, CFSTR("fetchAndStartEnumeratingWithSettings"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        fpfs_adopt_log(*((void **)*v2 + 9));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          FPPopLogSectionForBlock(*(void **)(a1 + 64));
          __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_2();
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        __fp_pop_log(&v64);

        goto LABEL_37;
      }
      objc_msgSend(*((id *)*v2 + 5), "addObject:", v33);
      fpfs_adopt_log(*((void **)*v2 + 9));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v59 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
        v60 = *v2;
        *(_DWORD *)buf = 134219010;
        v67 = v59;
        v68 = 2112;
        v69 = v60;
        v70 = 2080;
        v71 = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke";
        v72 = 2112;
        v73 = v33;
        v74 = 2112;
        v75 = 0;
        _os_log_debug_impl(&dword_1A0A34000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log(&v64);

LABEL_37:
    goto LABEL_38;
  }
  fpfs_adopt_log(*((void **)*v2 + 9));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v51 = FPPopLogSectionForBlock(*(void **)(a1 + 64));
    v52 = *v2;
    FPNotSupportedError();
    v53 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v67 = v51;
    v68 = 2112;
    v69 = v52;
    v70 = 2080;
    v71 = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke";
    v72 = 2112;
    v73 = 0;
    v74 = 2112;
    v75 = v53;
    _os_log_debug_impl(&dword_1A0A34000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

  }
  v36 = *(_QWORD *)(a1 + 64);
  FPNotSupportedError();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v36 + 16))(v36, 0, v37);

  __fp_pop_log(&v64);
LABEL_38:

}

- (void)spotlightIndexerDidReindexAllSearchableItems:(id)a3
{
  void *v3;
  id v4;

  -[FPXDomainContext domain](self->_domainContext, "domain", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSFileProviderManager managerForDomain:](NSFileProviderManager, "managerForDomain:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "signalEnumeratorForContainerItemIdentifier:completionHandler:", CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), &__block_literal_global_522);
}

void __68__FPXExtensionContext_spotlightIndexerDidReindexAllSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __68__FPXExtensionContext_spotlightIndexerDidReindexAllSearchableItems___block_invoke_cold_1(v2, v3);

  }
}

- (void)getKnownFolderLocations:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  OS_dispatch_queue *instanceQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  void *v14;

  v6 = a4;
  fpfs_adopt_log(self->_log);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[FPXExtensionContext getKnownFolderLocations:completionHandler:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  instanceQueue = self->_instanceQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke;
  v11[3] = &unk_1E444AA40;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  v13 = a3;
  fp_dispatch_async_with_logs(instanceQueue, v11);

  __fp_pop_log(&v14);
}

void __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "domainContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vendorInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE5F7FE0))
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke_527;
    v15[3] = &unk_1E444AA18;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v16 = v6;
    v17 = v7;
    v18 = v8;
    objc_msgSend(v4, "getKnownFolderLocations:completionHandler:", v5, v15);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v13 = *(_QWORD *)(a1 + 32);
      FPNotSupportedError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2080;
      v25 = "-[FPXExtensionContext getKnownFolderLocations:completionHandler:]_block_invoke";
      v26 = 2112;
      v27 = 0;
      v28 = 2112;
      v29 = v14;
      _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v10 = *(_QWORD *)(a1 + 40);
    FPNotSupportedError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

    __fp_pop_log(&v19);
  }

}

void __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke_527(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "internalErrorFromVendorError:callerDescription:", v6, CFSTR("getKnownFolderLocations"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!(v5 | v7))
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke_527_cold_1();

    FPNotSupportedError();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  if (v7)
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2080;
      v20 = "-[FPXExtensionContext getKnownFolderLocations:completionHandler:]_block_invoke";
      v21 = 2112;
      v22 = 0;
      v23 = 2112;
      v24 = v7;
      _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 40) + 72));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2080;
      v20 = "-[FPXExtensionContext getKnownFolderLocations:completionHandler:]_block_invoke";
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = 0;
      _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log(&v14);

}

- (void)_waitForExtensionStabilizationWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *instanceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__FPXExtensionContext__waitForExtensionStabilizationWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);

}

void __75__FPXExtensionContext__waitForExtensionStabilizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "instanceWithPrivateSelector:", sel_waitForStabilizationWithCompletionHandler_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2;
  if (v2)
    objc_msgSend(v2, "waitForStabilizationWithCompletionHandler:", v3);
  else
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

}

- (void)waitForStabilizationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__FPXExtensionContext_waitForStabilizationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4449AF8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FPXExtensionContext _waitForExtensionStabilizationWithCompletionHandler:](self, "_waitForExtensionStabilizationWithCompletionHandler:", v6);

}

void __65__FPXExtensionContext_waitForStabilizationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2080;
      v17 = "-[FPXExtensionContext waitForStabilizationWithCompletionHandler:]_block_invoke";
      v18 = 2112;
      v19 = v3;
      _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(&v11);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSFileProviderManager managerForDomain:](NSFileProviderManager, "managerForDomain:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__FPXExtensionContext_waitForStabilizationWithCompletionHandler___block_invoke_532;
    v9[3] = &unk_1E4449AF8;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v6, "waitForSignalDeliveryWithCompletionHandler:", v9);

  }
}

void __65__FPXExtensionContext_waitForStabilizationWithCompletionHandler___block_invoke_532(uint64_t a1, void *a2)
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext waitForStabilizationWithCompletionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (void)_test_callFileProviderManagerAPIs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[NSFileProviderManager legacyDefaultManager](NSFileProviderManager, "legacyDefaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__FPXExtensionContext__test_callFileProviderManagerAPIs___block_invoke;
  v7[3] = &unk_1E4449AF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "signalEnumeratorForContainerItemIdentifier:completionHandler:", CFSTR("NSFileProviderRootContainerItemIdentifier"), v7);

}

void __57__FPXExtensionContext__test_callFileProviderManagerAPIs___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPXExtensionContext _test_callFileProviderManagerAPIs:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPProviderDomain identifier](self->_providerDomain, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_obfuscatedProviderDomainID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p domain:%@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)shouldConnectExternalDomainWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *instanceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  instanceQueue = self->_instanceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  fp_dispatch_async_with_logs(instanceQueue, v7);

}

void __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke(uint64_t a1)
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
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  void *v30[9];

  v30[7] = *(void **)MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "domainContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v26, "domain");
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
      objc_msgSend(v26, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected persona %@ (%i) instead of expected %@"), v14, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[FPXExtensionContext principalClass].cold.1();

      __assert_rtn("-[FPXExtensionContext shouldConnectExternalDomainWithCompletionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 3541, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
    }
  }
  else
  {

  }
  objc_msgSend(v26, "vendorInstance");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EE5F8040))
    v23 = v22;
  else
    v23 = 0;

  if (v23)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke_537;
    v27[3] = &unk_1E444A070;
    v24 = *(void **)(a1 + 40);
    v27[4] = *(_QWORD *)(a1 + 32);
    v29 = v24;
    v28 = v26;
    objc_msgSend(v23, "shouldConnectExternalDomainWithCompletionHandler:", v27);

  }
  else
  {
    fpfs_adopt_log(*(void **)(*(_QWORD *)v2 + 72));
    v30[0] = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock(*(void **)(a1 + 40));
      __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log(v30);

  }
}

void __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke_537(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = FPPopLogSectionForBlock(*(void **)(a1 + 48));
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v3, CFSTR("shouldConnectExternalDomain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2080;
    v16 = "-[FPXExtensionContext shouldConnectExternalDomainWithCompletionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v9;
    _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

  }
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "internalErrorFromVendorError:callerDescription:", v3, CFSTR("shouldConnectExternalDomain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  __fp_pop_log(&v10);
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (BOOL)usesFPFS
{
  return self->_usesFPFS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_domainContext, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_domainServicer, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_alternateContents, 0);
  objc_storeStrong((id *)&self->_runningEnumerators, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_instanceQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_listenerDelegates, 0);
}

- (void)applyFieldChangesToItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 lastKnownVendorItem:(id)a7 extensionInstance:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  id *v26;
  id *v27;
  id *v28;
  id *v29;
  void *v30;
  void *v31;
  id *v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  id *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59[2];
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66[2];
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74[2];
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82[2];
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90[2];
  _QWORD v91[4];
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97[2];
  _QWORD v98[4];
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104[2];
  id from;
  id location[2];

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a5;
  v19 = v17;
  v51 = a7;
  v20 = a8;
  v52 = a9;
  location[0] = 0;
  objc_initWeak(location, self);
  from = 0;
  objc_initWeak(&from, v20);
  v49 = v19;
  v50 = v16;
  v48 = v20;
  if ((v18 & 0x40000004) == 4)
  {
    objc_msgSend(v15, "itemIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "parentItemIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filename");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke;
    v98[3] = &unk_1E444C2B0;
    v102 = v52;
    v47 = &v103;
    objc_copyWeak(&v103, location);
    v24 = v15;
    v99 = v15;
    v100 = v16;
    v104[1] = (id)v18;
    v101 = v19;
    objc_copyWeak(v104, &from);
    objc_msgSend(v20, "reparentItemWithIdentifier:toParentItemWithIdentifier:newName:completionHandler:", v21, v22, v23, v98);
    v25 = &v102;
    v26 = &v99;
    v27 = &v100;
    v28 = &v101;

    v29 = v104;
LABEL_3:
    objc_destroyWeak(v29);
LABEL_17:
    v32 = v47;
    goto LABEL_18;
  }
  if ((v18 & 2) != 0)
  {
    objc_msgSend(v15, "itemIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filename");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_2;
    v91[3] = &unk_1E444C2B0;
    v95 = v52;
    v32 = &v96;
    objc_copyWeak(&v96, location);
    v24 = v15;
    v92 = v15;
    v93 = v16;
    v97[1] = (id)v18;
    v94 = v19;
    v33 = v97;
    objc_copyWeak(v97, &from);
    objc_msgSend(v20, "renameItemWithIdentifier:toName:completionHandler:", v30, v31, v91);
    v25 = &v95;
    v26 = &v92;
    v27 = &v93;
    v28 = &v94;

    goto LABEL_12;
  }
  if ((v18 & 8) != 0)
  {
    objc_msgSend(v15, "lastUsedDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itemIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_3;
    v83[3] = &unk_1E444C2D8;
    v88 = v52;
    v47 = &v89;
    objc_copyWeak(&v89, location);
    v24 = v15;
    v84 = v15;
    v85 = v16;
    v90[1] = (id)v18;
    v86 = v19;
    v87 = v51;
    objc_copyWeak(v90, &from);
    objc_msgSend(v20, "setLastUsedDate:forItemIdentifier:completionHandler:", v34, v35, v83);
    v25 = &v88;
    v26 = &v84;
    v27 = &v85;
    v28 = &v86;

    objc_destroyWeak(v90);
    v36 = v87;
LABEL_16:

    goto LABEL_17;
  }
  if ((v18 & 0x10) != 0)
  {
    objc_msgSend(v15, "tagData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itemIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_4;
    v75[3] = &unk_1E444C2D8;
    v80 = v52;
    v47 = &v81;
    objc_copyWeak(&v81, location);
    v24 = v15;
    v76 = v15;
    v77 = v16;
    v82[1] = (id)v18;
    v78 = v19;
    v79 = v51;
    objc_copyWeak(v82, &from);
    objc_msgSend(v20, "setTagData:forItemIdentifier:completionHandler:", v37, v38, v75);
    v25 = &v80;
    v26 = &v76;
    v27 = &v77;
    v28 = &v78;

    objc_destroyWeak(v82);
    v36 = v79;
    goto LABEL_16;
  }
  if ((v18 & 0x20) != 0)
  {
    objc_msgSend(v15, "favoriteRank");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itemIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_5;
    v67[3] = &unk_1E444C2D8;
    v72 = v52;
    v47 = &v73;
    objc_copyWeak(&v73, location);
    v24 = v15;
    v68 = v15;
    v69 = v16;
    v74[1] = (id)v18;
    v70 = v19;
    v71 = v51;
    objc_copyWeak(v74, &from);
    objc_msgSend(v20, "setFavoriteRank:forItemIdentifier:completionHandler:", v39, v40, v67);
    v25 = &v72;
    v26 = &v68;
    v27 = &v69;
    v28 = &v70;

    objc_destroyWeak(v74);
    v36 = v71;
    goto LABEL_16;
  }
  if ((v18 & 0x40000000) != 0)
  {
    v41 = v16;
    if (!objc_msgSend(v15, "isTrashed"))
    {
      objc_msgSend(v15, "itemIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v18 & 4) != 0)
      {
        objc_msgSend(v15, "parentItemIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v20;
        v24 = v15;
      }
      else
      {
        v44 = v20;
        v24 = v15;
        v45 = 0;
      }
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_7;
      v53[3] = &unk_1E444C2B0;
      v57 = v52;
      v47 = &v58;
      objc_copyWeak(&v58, location);
      v54 = v24;
      v55 = v41;
      v46 = v18;
      v59[1] = (id)v18;
      v56 = v19;
      objc_copyWeak(v59, &from);
      objc_msgSend(v44, "untrashItemWithIdentifier:toParentItemIdentifier:completionHandler:", v43, v45, v53);
      v25 = &v57;
      v26 = &v54;
      v27 = &v55;
      v28 = &v56;
      if ((v46 & 4) != 0)

      v29 = v59;
      goto LABEL_3;
    }
    objc_msgSend(v15, "itemIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_6;
    v60[3] = &unk_1E444C2B0;
    v64 = v52;
    v32 = &v65;
    objc_copyWeak(&v65, location);
    v24 = v15;
    v61 = v15;
    v62 = v16;
    v66[1] = (id)v18;
    v63 = v19;
    v33 = v66;
    objc_copyWeak(v66, &from);
    objc_msgSend(v20, "trashItemWithIdentifier:completionHandler:", v42, v60);
    v25 = &v64;
    v26 = &v61;
    v27 = &v62;
    v28 = &v63;

LABEL_12:
    objc_destroyWeak(v33);
LABEL_18:

    objc_destroyWeak(v32);
    v19 = v49;
    v16 = v50;
    v20 = v48;
    v15 = v24;
    goto LABEL_19;
  }
  if ((v18 & 1) != 0)
  {
    if (!v19)
      __assert_rtn("-[FPXExtensionContext(LegacySupport) applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:]", "FPXExtensionContext_Legacy.m", 166, "newContent");
    -[FPXExtensionContext applyItemChange:baseVersion:contents:completionHandler:](self, "applyItemChange:baseVersion:contents:completionHandler:", v15, v16, v19, v52);
  }
  else
  {
    (*((void (**)(id, id, _QWORD))v52 + 2))(v52, v51, 0);
  }
LABEL_19:
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 80) & 0xFFFFFFFFFFFFFFF9;
    v9 = *(_QWORD *)(a1 + 48);
    v10 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:", v6, v7, v8, v9, v11, v10, *(_QWORD *)(a1 + 56));

  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 80) & 0xFFFFFFFFFFFFFFFDLL;
    v9 = *(_QWORD *)(a1 + 48);
    v10 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:", v6, v7, v8, v9, v11, v10, *(_QWORD *)(a1 + 56));

  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "fp_isFeatureUnsupportedError") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 88) & 0xFFFFFFFFFFFFFFF7;
    v11 = *(_QWORD *)(a1 + 48);
    v12 = v14;
    if (!v14)
      v12 = *(id *)(a1 + 56);
    v13 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:", v8, v9, v10, v11, v12, v13, *(_QWORD *)(a1 + 64));

  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "fp_isFeatureUnsupportedError") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 88) & 0xFFFFFFFFFFFFFFEFLL;
    v11 = *(_QWORD *)(a1 + 48);
    v12 = v14;
    if (!v14)
      v12 = *(id *)(a1 + 56);
    v13 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:", v8, v9, v10, v11, v12, v13, *(_QWORD *)(a1 + 64));

  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "fp_isFeatureUnsupportedError") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 88) & 0xFFFFFFFFFFFFFFDFLL;
    v11 = *(_QWORD *)(a1 + 48);
    v12 = v14;
    if (!v14)
      v12 = *(id *)(a1 + 56);
    v13 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:", v8, v9, v10, v11, v12, v13, *(_QWORD *)(a1 + 64));

  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 80) & 0xFFFFFFFFBFFFFFFBLL;
    v9 = *(_QWORD *)(a1 + 48);
    v10 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:", v6, v7, v8, v9, v11, v10, *(_QWORD *)(a1 + 56));

  }
}

void __153__FPXExtensionContext_LegacySupport__applyFieldChangesToItem_baseVersion_changedFields_contents_lastKnownVendorItem_extensionInstance_completionHandler___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 80) & 0xFFFFFFFFBFFFFFFBLL;
    v9 = *(_QWORD *)(a1 + 48);
    v10 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:", v6, v7, v8, v9, v11, v10, *(_QWORD *)(a1 + 56));

  }
}

- (void)applyItemChange:(id)a3 baseVersion:(id)a4 contents:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  objc_msgSend(v10, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPXExtensionContext instanceForItemID:](self, "instanceForItemID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "URLForItemWithPersistentIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__7;
  v39 = __Block_byref_object_dispose__7;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  if (v18)
  {
    v19 = (void *)objc_opt_new();
    v20 = (void *)objc_opt_new();
    v30 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __93__FPXExtensionContext_LegacySupport__applyItemChange_baseVersion_contents_completionHandler___block_invoke;
    v26[3] = &unk_1E444C300;
    v28 = &v31;
    v21 = v20;
    v27 = v21;
    v29 = &v35;
    objc_msgSend(v19, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v12, 0, v18, 0, &v30, v26);
    v22 = v30;
    if (v22)
    {
      v23 = v22;
      v13[2](v13, 0, v22);
    }
    else if (*((_BYTE *)v32 + 24))
    {
      v13[2](v13, 0, (id)v36[5]);
      v23 = 0;
    }
    else
    {
      objc_msgSend(v15, "itemChangedAtURL:", v18);
      v25 = 0;
      objc_msgSend(v15, "itemForIdentifier:error:", v17, &v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v25;
      ((void (**)(id, void *, id))v13)[2](v13, v24, v23);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForNonExistentItemWithIdentifier:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v19);
    v23 = 0;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

}

void __93__FPXExtensionContext_LegacySupport__applyItemChange_baseVersion_contents_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  id obj;
  id v18;
  stat v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[6] + 8);
  v20 = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v5, v6, &v20);
  objc_storeStrong((id *)(v8 + 40), v20);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v9 ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "domain");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
LABEL_15:

      goto LABEL_16;
    }
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "code");

    if (v11 == 516)
    {
      memset(&v19, 0, sizeof(v19));
      v18 = 0;
      objc_msgSend(v6, "getResourceValue:forKey:error:", &v18, *MEMORY[0x1E0C998F8], 0);
      v10 = v18;
      objc_msgSend(v6, "path");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      stat((const char *)objc_msgSend(v12, "fileSystemRepresentation"), &v19);

      v13 = (void *)a1[4];
      v14 = *(_QWORD *)(a1[6] + 8);
      obj = *(id *)(v14 + 40);
      v15 = objc_msgSend(v13, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v6, v5, 0, 1, 0, &obj);
      objc_storeStrong((id *)(v14 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v15 ^ 1;
      if (v10 && objc_msgSend(v10, "intValue") && v19.st_ino)
      {
        while (v19.st_dev)
        {
          objc_msgSend(v10, "unsignedIntValue");
          v16 = GSLibraryResolveDocumentId2();
          if (v16)
          {
            if (v16 != v19.st_ino)
              goto LABEL_15;
          }
          else if (*__error() != 16 && *__error() != 70 && *__error() != 2)
          {
            goto LABEL_15;
          }
          usleep(0x64u);
        }
      }
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (void)importDocumentAtURL:(id)a3 intoFolderWithIdentifier:(id)a4 originalName:(id)a5 extensionInstance:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  char v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  char v29;
  id v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v11;
  objc_msgSend(v16, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", v13);

  v19 = v16;
  if ((v18 & 1) != 0)
  {
LABEL_7:
    v23 = v18 ^ 1;
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[FPXExtensionContext(LegacySupport) importDocumentAtURL:intoFolderWithIdentifier:originalName:extensionInstance:reply:].cold.1((uint64_t)v19, (uint64_t)v12, v24);

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __120__FPXExtensionContext_LegacySupport__importDocumentAtURL_intoFolderWithIdentifier_originalName_extensionInstance_reply___block_invoke;
    v25[3] = &unk_1E444C328;
    v29 = v23;
    v19 = v19;
    v26 = v19;
    v27 = v16;
    v28 = v15;
    objc_msgSend(v14, "importDocumentAtURL:toParentItemIdentifier:completionHandler:", v19, v12, v25);

    v20 = v26;
    goto LABEL_13;
  }
  v30 = 0;
  objc_msgSend(v16, "fp_moveToTempFolderWithFilename:error:", v13, &v30);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v30;

  fp_current_or_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v19 && !v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[FPXExtensionContext(LegacySupport) importDocumentAtURL:intoFolderWithIdentifier:originalName:extensionInstance:reply:].cold.2(v19, v22);

    goto LABEL_7;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[FPXExtensionContext(LegacySupport) importDocumentAtURL:intoFolderWithIdentifier:originalName:extensionInstance:reply:].cold.3((uint64_t)v13, v20, v22);

  (*((void (**)(id, _QWORD, _QWORD, id))v15 + 2))(v15, 0, 0, v20);
LABEL_13:

}

void __120__FPXExtensionContext_LegacySupport__importDocumentAtURL_intoFolderWithIdentifier_originalName_extensionInstance_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 56))
  {
    v6 = (void *)objc_opt_new();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "moveItemAtURL:toURL:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtURL:error:", v8, 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)principalClass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1A0A34000, v0, v1, "[CRIT] %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:domainVersion:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26();
  v3 = OUTLINED_FUNCTION_5(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_24(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)beginRequestWithDomain:(NSObject *)a3 alternateContentsDictionary:domainServicer:providerDomain:domainVersion:completionHandler:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a3, (uint64_t)a3, "[DEBUG] started extension: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_27();
}

- (void)domainContext
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Context does not exist for %@ - is the extension deallocating?", v2);
  OUTLINED_FUNCTION_3();
}

- (void)didChangeItemID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] ipc: %@ %s %@", v1);
  OUTLINED_FUNCTION_17();
}

void __57__FPXExtensionContext_didChangeItemID_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, v6, "[DEBUG] ⭕️  daemon requested providing for URL %@, using instance %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_180_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] ✅  succeeded providing URL %@", v5);

  OUTLINED_FUNCTION_17();
}

void __80__FPXExtensionContext_startProvidingItemAtURL_readingOptions_completionHandler___block_invoke_180_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a2 + 40), "fp_shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, v5, "[DEBUG] ❌  extension reporting error %@ providing url %@", v6);

  OUTLINED_FUNCTION_7();
}

- (void)evictItemAtURL:completionHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  v4 = OUTLINED_FUNCTION_16(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_20(v4, v5, v6);
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);

  OUTLINED_FUNCTION_27();
}

- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26();
  v3 = OUTLINED_FUNCTION_5(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_24(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] User checked the checkbox, recording it in the extension process", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)createUserInteractionSuppressingWithDomainIdentifier:withPurpose:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Passed nil domainIdentifier for purpose %{public}@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)createUserInteractionSuppressingWithDomainIdentifier:withPurpose:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, v0, (uint64_t)v0, "[ERROR] Couldn't retrieve extension for domainIdentifier %{public}@ for purpose %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)createUserInteractionSuppressingWithDomainIdentifier:withPurpose:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, v0, (uint64_t)v0, "[ERROR] Extension didn't conform to protocol NSFileProviderUserInteractionSuppressing for domainIdentifier %@ for purpose %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)createUserInteractionSuppressingWithDomainIdentifier:withPurpose:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] Extension didn't conform to protocol NSFileProviderUserInteractionSuppressing for domainIdentifier %@ for purpose %{public}@. If the extension is trying to use the NSFileProviderUserInteractionSuppressing / SuppressionIdentifier feature, and this line is logged, be sure that the NSExtensionPrincipalClass in the FileProvider app extension conforms to NSFileProviderUserInteractionSuppressing. If the extension is not trying to use those features, ignore this log.", v1);
  OUTLINED_FUNCTION_3();
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(uint64_t)a3 domainIdentifier:indexReason:completionHandler:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_16(a1, 5.7781e-34, a2, a3);
  *(_QWORD *)(v3 + 14) = "-[FPXExtensionContext deleteSearchableItemsWithSpotlightDomainIdentifiers:domainIdentifier:inde"
                         "xReason:completionHandler:]";
  *(_WORD *)(v3 + 22) = 1024;
  *(_DWORD *)(v3 + 24) = v4;
  OUTLINED_FUNCTION_40(&dword_1A0A34000, v6, v3, "[DEBUG] ipc: %@ %s %d", v5);
}

- (void)removeTrashedItemsOlderThanDate:domainIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] ipc: %@ %s %@", v1);
  OUTLINED_FUNCTION_17();
}

void __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __90__FPXExtensionContext_removeTrashedItemsOlderThanDate_domainIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __88__FPXExtensionContext_dumpInternalStateToTermDumper_domainIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)itemChangedAtURL:completionHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  v4 = OUTLINED_FUNCTION_16(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_20(v4, v5, v6);
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);

  OUTLINED_FUNCTION_27();
}

void __58__FPXExtensionContext_itemChangedAtURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)fetchContentsForItemWithID:(NSObject *)a3 version:request:estimatedItemSize:isSymlink:extent:alignment:options:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a3, (uint64_t)a3, "[DEBUG] total unit count %lld", (uint8_t *)a1);
}

void __100__FPXExtensionContext__singleItemChange_changedFields_bounce_bounceIndex_request_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] item creation failed with collision error (%@), retrying with bounced filename", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)bulkItemChanges:changedFields:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_26();
  *(_DWORD *)v0 = 134219010;
  *(_QWORD *)(v0 + 4) = v1;
  *(_WORD *)(v0 + 12) = 2112;
  *(_QWORD *)(v0 + 14) = v2;
  *(_WORD *)(v0 + 22) = 2080;
  *(_QWORD *)(v0 + 24) = "-[FPXExtensionContext bulkItemChanges:changedFields:completionHandler:]";
  *(_WORD *)(v0 + 32) = 2112;
  *(_QWORD *)(v0 + 34) = 0;
  *(_WORD *)(v0 + 42) = 2112;
  *(_QWORD *)(v0 + 44) = 0;
  OUTLINED_FUNCTION_35(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v3, v4);
}

- (void)indexOneBatchInDomain:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26();
  v3 = OUTLINED_FUNCTION_5(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_32(v3, v4);
  OUTLINED_FUNCTION_36(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", v5, v6);
}

- (void)indexOneBatchInDomain:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] no context for domain %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)indexOneBatchInDomain:completionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] no indexer for %@, nothing to do", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)indexOneBatchInDomain:completionHandler:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] index one batch in domain %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dropIndexForDomain:dropReason:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26();
  v3 = OUTLINED_FUNCTION_5(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_24(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)dropIndexForDomain:dropReason:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] [spotlight] not dropping: domain doesn't have a context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dropIndexForDomain:dropReason:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] no indexer, nothing to do", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37(&dword_1A0A34000, v0, v1, "[ERROR] FPFS instance not supported, failed to signal reindex for provider.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __109__FPXExtensionContext_signalNeedsReindexItemsWithIdentifiers_domainIdentifier_indexReason_completionHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Error retrieving item for identifier during reindex: %@", v5);

  OUTLINED_FUNCTION_17();
}

- (void)dumpIndexStateForDomain:toFileHandler:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26();
  v3 = OUTLINED_FUNCTION_5(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_24(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __63__FPXExtensionContext_preflightTrashItemIDs_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)alternateContentsURLWrapperForItemID:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] url %@ is no longer reachable - this means iWork forgot to remove the alternate URL", v5);

  OUTLINED_FUNCTION_17();
}

void __80__FPXExtensionContext_fetchAlternateContentsURLWrapperForURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  v4 = 2080;
  v5 = "-[FPXExtensionContext fetchAlternateContentsURLWrapperForURL:completionHandler:]_block_invoke";
  v6 = 2112;
  v7 = v0;
  v8 = 2112;
  v9 = v1;
  _os_log_debug_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@ %s %@: %@", v3, 0x2Au);
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a3, v5, "[ERROR] error getting vendor item for item identifier %@: %@", v6);

  OUTLINED_FUNCTION_7();
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] FPDidUpdateAlternateContentsDocumentForDocumentAtURL was called with no alternate contents association in place for document with ID: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __94__FPXExtensionContext_didUpdateAlternateContentsDocumentForDocumentWithURL_completionHandler___block_invoke_2_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)identifierForItemAtURL:completionHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  v4 = OUTLINED_FUNCTION_16(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_20(v4, v5, v6);
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);

  OUTLINED_FUNCTION_27();
}

- (void)itemForURL:completionHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  v4 = OUTLINED_FUNCTION_16(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_20(v4, v5, v6);
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);

  OUTLINED_FUNCTION_27();
}

void __110__FPXExtensionContext_URLForItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_293_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  v2 = 138412546;
  v3 = v0;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, v1, (uint64_t)v1, "[ERROR] couldn't create wrapper from original document URL %@: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

void __56__FPXExtensionContext_trashItemAtURL_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] Need to retrieve new url for item since it was not populated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_34(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] got request to start thumbnail fetch operation for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v0, v1, "[DEBUG] entering group: %@ with client proxy %@", v2);
  OUTLINED_FUNCTION_3();
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_326_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_34(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] leaving group: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __97__FPXExtensionContext_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler___block_invoke_2_330_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_34(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] calling completion handler group: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createFPTempDirectoryWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] failed to create tempFolder error: %@", v5);

  OUTLINED_FUNCTION_17();
}

- (void)createFPTempDirectoryAppropriateForURL:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a3, v6, "[ERROR] failed to create tempFolder AppropriateForURL %@: error: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] returning FPNotSupportedError as we have a request with versions %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __93__FPXExtensionContext_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] got request to start thumbnail fetch operation for %@", v5);

  OUTLINED_FUNCTION_17();
}

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_cold_1(int a1, SEL aSelector)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(aSelector);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_33(&dword_1A0A34000, v3, v4, "[SIMCRASH] -[%@ %@] must return an enumerator or an error.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __95__FPXExtensionContext_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] provider returned trash unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)fetchServicesForItemID:allowRestrictedSources:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] ipc: %@ %s %@", v1);
  OUTLINED_FUNCTION_17();
}

void __72__FPXExtensionContext__proxyWithCancellationHandler_forClientOperation___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] cancelling operation because connection was closed: %@", v5);

  OUTLINED_FUNCTION_17();
}

- (void)preflightReparentItemIDs:underParentID:reply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26();
  v3 = OUTLINED_FUNCTION_5(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_24(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __68__FPXExtensionContext_preflightReparentItemIDs_underParentID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)deleteItemsWithIDs:baseVersions:options:reply:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  v4 = OUTLINED_FUNCTION_16(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_20(v4, v5, v6);
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);

  OUTLINED_FUNCTION_27();
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_436_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_25();
  *(_DWORD *)v1 = 138412546;
  *(_QWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(_QWORD *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_19(&dword_1A0A34000, v5, v1, "[ERROR] Received malformed out-of-date error %@ from %@", v4);

  OUTLINED_FUNCTION_27();
}

void __69__FPXExtensionContext_deleteItemsWithIDs_baseVersions_options_reply___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_deleteItemWithIdentifier_baseVersion_options_completionHandler_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a2, v4, "[DEBUG] Item versions were out-of-date during %@ for items %@. Retrying with current versions.", v5);

  OUTLINED_FUNCTION_7();
}

- (void)_inlineSymlinkTarget:url:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] inlined symlink target: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_freeSlotHeldByItem:(uint64_t)a1 request:bounceIndex:completionHandler:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v1, (uint64_t)v1, "[DEBUG] Moving away %@, new filename: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, v5, "[DEBUG] creating item %@ for %@", v6);

  OUTLINED_FUNCTION_7();
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 64);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v2, (uint64_t)v2, "[DEBUG] item creation of %@ failed with collision error (%@), retrying with bounced filename", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 64);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v2, (uint64_t)v2, "[DEBUG] item creation of %@ failed with collision error (%@), boucing colliding item", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_3(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v1, (uint64_t)v1, "[DEBUG] max bounce number was found, jumping from %@ to %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v1, (uint64_t)v1, "[DEBUG] max bounce number was found (%@) but keeping the old one (%@)", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] no max bounce number was found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __120__FPXExtensionContext__createItemBasedOnTemplate_fields_contents_options_request_bounce_bounceNumber_completionHandler___block_invoke_446_cold_6(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 64);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v2, (uint64_t)v2, "[DEBUG] item creation of %@ failed with collision error (%@), looking for the max bounce number existing", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void __80__FPXExtensionContext__fetchHierarchyForItemID_into_maxDepth_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Failed to fetch item %@ during fetchHierarchyForItemID:", v2);
  OUTLINED_FUNCTION_3();
}

- (void)fetchItemID:reply:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] ipc: %@ %s %@", v1);
  OUTLINED_FUNCTION_17();
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_FAULT, "[CRIT] can't get default location, bundle name unknown; %@",
    v4,
    0xCu);

  OUTLINED_FUNCTION_17();
}

void __112__FPXExtensionContext_fetchDefaultContainerForBundleIdentifier_defaultName_inDomainIdentifier_lookupOnly_reply___block_invoke_4_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, v6, "[DEBUG] use %@ as default location; %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

- (void)fetchPublishingURLForItemID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] ipc: %@ %s %@", v1);
  OUTLINED_FUNCTION_17();
}

- (void)disconnectDomainID:options:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] ipc: %@ %s %@", v1);
  OUTLINED_FUNCTION_17();
}

void __109__FPXExtensionContext_performActionWithIdentifier_onItemsWithIdentifiers_domainIdentifier_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_34(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] Requesting to perform action '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)wakeForSessionIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] ipc: %@ %s %@", v1);
  OUTLINED_FUNCTION_17();
}

void __66__FPXExtensionContext_wakeForSessionIdentifier_completionHandler___block_invoke_473_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)bulkEvictItemsWithItemIDs:completionHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  v4 = OUTLINED_FUNCTION_16(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_20(v4, v5, v6);
  OUTLINED_FUNCTION_12(&dword_1A0A34000, v9, v7, "[DEBUG] ipc: %@ %s %@", v8);

  OUTLINED_FUNCTION_27();
}

void __67__FPXExtensionContext_bulkEvictItemsWithItemIDs_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a3, v7, "[ERROR] Failed to evict item %@: %@", v8);

  OUTLINED_FUNCTION_7();
}

- (void)wakeForPushWithCompletionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26();
  v3 = OUTLINED_FUNCTION_5(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_24(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __81__FPXExtensionContext_signalEnumeratorForMaterializedItemsWithCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __76__FPXExtensionContext_signalEnumeratorForPendingItemsWithCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __60__FPXExtensionContext_importDidFinishWithCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_1(int a1, SEL aSelector)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(aSelector);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_33(&dword_1A0A34000, v3, v4, "[SIMCRASH] -[%@ %@] must return an enumerator or an error.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_6();
  *(_DWORD *)v0 = 134219010;
  *(_QWORD *)(v0 + 4) = v1;
  *(_WORD *)(v0 + 12) = 2112;
  *(_QWORD *)(v0 + 14) = v2;
  *(_WORD *)(v0 + 22) = 2080;
  *(_QWORD *)(v0 + 24) = "-[FPXExtensionContext listRemoteVersionsWithSettings:observer:request:completionHandler:]_block_invoke";
  *(_WORD *)(v0 + 32) = 2112;
  *(_QWORD *)(v0 + 34) = 0;
  *(_WORD *)(v0 + 42) = 2112;
  *(_QWORD *)(v0 + 44) = 0;
  OUTLINED_FUNCTION_35(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v3, v4);
}

void __89__FPXExtensionContext_listRemoteVersionsWithSettings_observer_request_completionHandler___block_invoke_cold_3(id *a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "enumeratedItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "providerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_fpIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, v8, "[DEBUG] can't create enumerator for %@ owned by %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_7();
}

void __68__FPXExtensionContext_spotlightIndexerDidReindexAllSearchableItems___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] can't signal changes after reset: %@", v5);

  OUTLINED_FUNCTION_17();
}

- (void)getKnownFolderLocations:completionHandler:.cold.1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  v3 = "-[FPXExtensionContext getKnownFolderLocations:completionHandler:]";
  v4 = 1024;
  v5 = v0;
  OUTLINED_FUNCTION_40(&dword_1A0A34000, v1, (uint64_t)v1, "[DEBUG] ipc: %@ %s %x", v2);
  OUTLINED_FUNCTION_17();
}

void __65__FPXExtensionContext_getKnownFolderLocations_completionHandler___block_invoke_527_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37(&dword_1A0A34000, v0, v1, "[ERROR] Provider answered getKnownFolderLocations without providing locations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __72__FPXExtensionContext_shouldConnectExternalDomainWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4);
  OUTLINED_FUNCTION_2(&dword_1A0A34000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

@end
