@implementation FPDFilePresenter

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[FPItemID hash](self->_observedItemID, "hash");
  return objc_msgSend(self->_filePresenterID, "hash") ^ v3;
}

- (FPDFilePresenter)initWithIdentifier:(id)a3 itemID:(id)a4 auditToken:(id *)a5 urlHint:(id)a6 domain:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FPDFilePresenter *v17;
  FPDFilePresenter *v18;
  __int128 v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  __int128 v23;
  void *v24;
  NSObject *v25;
  const __CFString *v27;
  objc_super v28;
  _BYTE buf[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)FPDFilePresenter;
  v17 = -[FPDFilePresenter init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_observedItemID, a4);
    objc_storeStrong((id *)&v18->_domain, a7);
    objc_storeStrong((id *)&v18->_presentedItemURL, a6);
    objc_storeStrong(&v18->_filePresenterID, a3);
    v19 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)v18->_auditToken.val = *(_OWORD *)a5->var0;
    *(_OWORD *)&v18->_auditToken.val[4] = v19;
    objc_msgSend(MEMORY[0x1E0CB3600], "_observedUbiquityAttributesForPresenterWithID:", v13);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = -[__CFString count](v20, "count");
      v18->_presenterWantsUbiqitousAttributes = v22 != 0;
      if (!v22)
      {
        v23 = *(_OWORD *)&v18->_auditToken.val[4];
        *(_OWORD *)buf = *(_OWORD *)v18->_auditToken.val;
        *(_OWORD *)&buf[16] = v23;
        FPEntitlementValueForAuditToken();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18->_passivePresenterRequested = objc_msgSend(v24, "BOOLValue");
        }

      }
    }
    else
    {
      v18->_presenterWantsUbiqitousAttributes = 1;
    }
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v27 = CFSTR("all");
      *(_DWORD *)buf = 138412802;
      if (v21)
        v27 = v21;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v27;
      _os_log_debug_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] new presenter %@ for %@, watching attributes: %@", buf, 0x20u);
    }

  }
  return v18;
}

- (int)requestEffectivePID
{
  __int128 v2;
  audit_token_t v4;

  v2 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pid(&v4);
}

+ (id)presenter:(id)a3 withItemID:(id)a4 auditToken:(id *)a5 urlHint:(id)a6 domain:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  void *v18;
  _OWORD v20[2];

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc((Class)a1);
  v17 = *(_OWORD *)&a5->var0[4];
  v20[0] = *(_OWORD *)a5->var0;
  v20[1] = v17;
  v18 = (void *)objc_msgSend(v16, "initWithIdentifier:itemID:auditToken:urlHint:domain:", v15, v14, v20, v13, v12);

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "itemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", self->_observedItemID))
    {
      objc_msgSend(v4, "filePresenterID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", self->_filePresenterID);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_presentedItemDescription:(BOOL)a3
{
  void *v4;
  NSURL *presentedItemURL;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  presentedItemURL = self->_presentedItemURL;
  if (a3)
  {
    -[NSURL fp_shortDescription](presentedItemURL, "fp_shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v6, self->_observedItemID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSURL lastPathComponent](presentedItemURL, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fp_obfuscatedFilename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItemID identifier](self->_observedItemID, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  audit_token_t atoken;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPDFilePresenter _presentedItemDescription:](self, "_presentedItemDescription:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v6;
  FPExecutableNameForAuditToken();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v8;
  v9 = audit_token_to_pid(&atoken);
  if (self->_isEnumeratorActive)
    v10 = "";
  else
    v10 = " (passive)";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ presented by %@[%i]%s>"), v4, self, v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)enumerator
{
  FPXEnumerator *enumerator;
  FPXEnumerator *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__14;
  v24 = __Block_byref_object_dispose__14;
  v25 = 0;
  if (!self->_isRunning)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: enumerator requested on non-running presenter %@"), self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDFilePresenter enumerator]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDFilePresenter.m", 129, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  if (self->_isEnumeratorActive)
  {
    enumerator = self->_enumerator;
    if (!enumerator)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ we should have an enumerator if it's active"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDFilePresenter enumerator]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDFilePresenter.m", 140, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
    }
    v4 = enumerator;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setEnumeratedItemID:", self->_observedItemID);
    objc_msgSend(v5, "setPresenterEnumeration:", 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("enumerator for %@"), self->_observedItemID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    -[FPDDomain defaultBackend](self->_domain, "defaultBackend");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __30__FPDFilePresenter_enumerator__block_invoke;
    v16[3] = &unk_1E8C78628;
    v16[4] = self;
    v19 = &v20;
    v9 = v6;
    v17 = v9;
    v10 = v7;
    v18 = v10;
    objc_msgSend(v8, "enumerateWithSettings:lifetimeExtender:observer:completionHandler:", v5, self, self, v16);

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v4 = (FPXEnumerator *)(id)v21[5];

  }
  _Block_object_dispose(&v20, 8);

  return v4;
}

void __30__FPDFilePresenter_enumerator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a3;
  if (!v10 || v6)
  {
    if (!v6)
    {
      FPProviderNotFoundErrorForURL();
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAACE8]), "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1EFBBBA70, v6, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "requestEffectivePID"));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
    objc_msgSend(*(id *)(a1 + 32), "setIsEnumeratorActive:", 1);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

- (void)start
{
  void *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  FPItemID *observedItemID;
  const char *v8;
  FPItemID *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  FPItemID *v14;
  _QWORD block[5];
  uint8_t buf[4];
  FPItemID *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[FPDDomain provider](self->_domain, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentersQueue");
  v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  self->_queue = v4;

  if (self->_queue)
  {
    if (self->_passivePresenterRequested)
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        observedItemID = self->_observedItemID;
        *(_DWORD *)buf = 138412290;
        v17 = observedItemID;
        v8 = "[INFO] ignoring presenter for item %@ because process requested passive presenters";
LABEL_7:
        _os_log_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_INFO, v8, buf, 0xCu);
      }
    }
    else
    {
      -[FPDDomain provider](self->_domain, "provider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "fp_isiCloudDriveOrCloudDocsIdentifier");

      if (!v12 || self->_presenterWantsUbiqitousAttributes)
      {
        v13 = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __25__FPDFilePresenter_start__block_invoke;
        block[3] = &unk_1E8C75E48;
        block[4] = self;
        dispatch_async(v13, block);
        return;
      }
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v14 = self->_observedItemID;
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        v8 = "[INFO] ignoring presenter for item %@ for ubiquity attributes";
        goto LABEL_7;
      }
    }
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = self->_observedItemID;
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      v8 = "[INFO] cannot start presenter for %@, provider has been discarded";
      goto LABEL_7;
    }
  }

}

void __25__FPDFilePresenter_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 64))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] presenter %@ started while already running", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    *(_BYTE *)(v2 + 64) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerLifetimeExtensionForObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsEnumeration");

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "_fetchChangeToken");
  }
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__FPDFilePresenter_stop__block_invoke;
    block[3] = &unk_1E8C75E48;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

void __24__FPDFilePresenter_stop__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 64))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_INFO, "[INFO] stopping presenter %@", (uint8_t *)&v6, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_destroyEnumerator");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterLifetimeExtensionForObject:", *(_QWORD *)(a1 + 32));

  }
  else if (*(_QWORD *)(v1 + 16))
  {
    __24__FPDFilePresenter_stop__block_invoke_cold_1();
  }
}

- (void)_enumeratorRequestDidFailWithXPCError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDFilePresenter _enumeratorRequestDidFailWithXPCError:].cold.1((uint64_t)self, v4, v5);

  -[FPDFilePresenter _destroyEnumerator](self, "_destroyEnumerator");
}

- (void)_destroyEnumerator
{
  FPXEnumerator *enumerator;
  FPXEnumerator *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_isFetchingChanges = 0;
  enumerator = self->_enumerator;
  if (enumerator)
  {
    -[FPXEnumerator invalidate](enumerator, "invalidate");
    v4 = self->_enumerator;
    self->_enumerator = 0;

  }
  if (self->_isEnumeratorActive)
    self->_isEnumeratorActive = 0;
}

- (void)receiveUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSURL *v13;
  void *v14;
  void *v15;
  int v16;
  NSURL *presentedItemURL;
  _BOOL4 v18;
  id v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  FPDFilePresenter *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  FPDFilePresenter *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  FPDFilePresenter *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id *location;
  id v56;
  FPDFilePresenter *v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t section;
  _QWORD v65[2];
  uint8_t buf[4];
  FPDFilePresenter *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v47 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v57 = self;
  if (self->_enumerator)
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FPDFilePresenter receiveUpdatedItems:deletedItemsIdentifiers:].cold.1();

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v48;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16, v47);
    if (v7)
    {
      v53 = *(_QWORD *)v61;
      v52 = *MEMORY[0x1E0C998C8];
      location = (id *)&self->_currentItem;
      v50 = *MEMORY[0x1E0C99B30];
      v49 = *MEMORY[0x1E0C99B68];
      do
      {
        v54 = v7;
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v61 != v53)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if (v57->_observedItemID)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "itemID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v10, "isEqual:", v57->_observedItemID) & 1) != 0)
            {
              v11 = 1;
            }
            else
            {
              objc_msgSend(v9, "formerItemID");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v12, "isEqual:", v57->_observedItemID);

            }
          }
          else
          {
            v11 = 0;
          }
          v13 = v57->_presentedItemURL;
          objc_msgSend(v9, "fileURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v56 = 0;
            v19 = 0;
            goto LABEL_24;
          }
          objc_msgSend(v9, "fileURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0;
          v16 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v59, v52, 0);
          v56 = v59;
          if (v16)
          {
            presentedItemURL = v57->_presentedItemURL;
            v58 = 0;
            v18 = -[NSURL getResourceValue:forKey:error:](presentedItemURL, "getResourceValue:forKey:error:", &v58, v52, 0);
            v19 = v58;
            if (v18)
            {
              v20 = objc_msgSend(v56, "isEqualToString:", v19);

              if ((v20 & 1) != 0)
                goto LABEL_24;
              objc_msgSend(v9, "fileURL");
              v14 = v13;
              v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
          }
          else
          {
            v19 = 0;
          }

LABEL_23:
LABEL_24:
          if ((v11 & 1) != 0)
          {
            if (*location)
              objc_msgSend(*location, "ubiquitousResourceKeysDiffAgainstItem:", v9);
            else
              objc_msgSend(MEMORY[0x1E0CAAC60], "allUbiquitousResourceKeys");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(*location, "capabilities");
            if (v27 == objc_msgSend(v9, "capabilities"))
            {
              v28 = (void *)MEMORY[0x1E0C99E60];
              v65[0] = v50;
              v65[1] = v49;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setWithArray:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v25, "intersectsSet:", v30);

            }
            else
            {
              v31 = 1;
            }
            objc_storeStrong(location, v9);
            objc_msgSend(MEMORY[0x1E0CB3600], "_observedUbiquityAttributesForPresenterWithID:", v57->_filePresenterID);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)objc_msgSend(v32, "mutableCopy");
            v34 = v33;
            if (v33)
            {
              v26 = v33;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CAAC60], "allUbiquitousResourceKeys");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (FPDFilePresenter *)objc_msgSend(v35, "mutableCopy");

            }
            -[FPDFilePresenter intersectSet:](v26, "intersectSet:", v25);
            if (-[FPDFilePresenter count](v26, "count"))
            {
              v36 = -[FPDFilePresenter _newCoordinator](v57, "_newCoordinator");
              fp_current_or_default_log();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v9, "fileURL");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "fp_shortDescription");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v67 = v26;
                v68 = 2112;
                v69 = v39;
                _os_log_impl(&dword_1CF55F000, v37, OS_LOG_TYPE_INFO, "[INFO] 🎖 posting did change ubiquity attributes (%@) for updated file %@", buf, 0x16u);

              }
              objc_msgSend(v36, "itemAtURL:didChangeUbiquityAttributes:", v13, v26);
              if ((v31 & 1) != 0)
              {
                if (!v36)
                  goto LABEL_46;
LABEL_47:
                fp_current_or_default_log();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  -[NSURL fp_shortDescription](v13, "fp_shortDescription");
                  v46 = (FPDFilePresenter *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v67 = v46;
                  _os_log_impl(&dword_1CF55F000, v45, OS_LOG_TYPE_INFO, "[INFO] 🎖 posting sharing did change for updated file %@", buf, 0xCu);

                }
                objc_msgSend(v36, "sharingDidChangeForItemAtURL:", v13);
              }
            }
            else
            {
              fp_current_or_default_log();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                -[NSURL fp_shortDescription](v13, "fp_shortDescription");
                v41 = (FPDFilePresenter *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v67 = v41;
                _os_log_impl(&dword_1CF55F000, v40, OS_LOG_TYPE_INFO, "[INFO] 🎖 posting did change ubiquity for updated file %@", buf, 0xCu);

              }
              v42 = (void *)MEMORY[0x1E0CB3600];
              -[FPDDomain provider](v57->_domain, "provider");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "purposeIdentifier");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "__itemAtURL:didChangeUbiquityWithPurposeID:", v13, v44);

              if ((v31 & 1) != 0)
              {
LABEL_46:
                v36 = -[FPDFilePresenter _newCoordinator](v57, "_newCoordinator");
                goto LABEL_47;
              }
              v36 = 0;
            }

            goto LABEL_52;
          }
          fp_current_or_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "fileURL");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "fp_shortDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v67 = v57;
            v68 = 2112;
            v69 = v23;
            _os_log_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: 🎖 posting did change ubiquity for updated file %@", buf, 0x16u);

          }
          v24 = (void *)MEMORY[0x1E0CB3600];
          -[FPDDomain provider](v57->_domain, "provider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "purposeIdentifier");
          v26 = (FPDFilePresenter *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "__itemAtURL:didChangeUbiquityWithPurposeID:", v13, v26);
LABEL_52:

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      }
      while (v7);
    }

    __fp_leave_section_Debug();
  }

}

- (id)_newCoordinator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FPDDomain provider](self->_domain, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purposeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[FPDDomain provider](self->_domain, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "purposeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPurposeIdentifier:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)enumerationResultsDidChange
{
  void *v3;
  void *v4;
  char v5;
  NSObject *queue;
  _QWORD block[5];

  -[FPDDomain provider](self->_domain, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fp_isiCloudDriveOrCloudDocsIdentifier");

  if (self->_presenterWantsUbiqitousAttributes || (v5 & 1) == 0)
  {
    queue = self->_queue;
    if (queue)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__FPDFilePresenter_enumerationResultsDidChange__block_invoke;
      block[3] = &unk_1E8C75E48;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

uint64_t __47__FPDFilePresenter_enumerationResultsDidChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  __fp_create_section();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __47__FPDFilePresenter_enumerationResultsDidChange__block_invoke_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 65))
  {
    *(_BYTE *)(v3 + 66) = 1;
  }
  else if (*(_QWORD *)(v3 + 40))
  {
    objc_msgSend((id)v3, "_fetchUpdates");
  }
  else
  {
    objc_msgSend((id)v3, "_fetchChangeToken");
  }
  return __fp_leave_section_Debug();
}

- (void)didUpdateItem:(id)a3
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
    v7[2] = __34__FPDFilePresenter_didUpdateItem___block_invoke;
    v7[3] = &unk_1E8C75850;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __34__FPDFilePresenter_didUpdateItem___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "receiveUpdatedItems:deletedItemsIdentifiers:", v2, MEMORY[0x1E0C9AA60]);

}

- (void)_fetchChangeToken
{
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  LODWORD(v4) = 134218242;
  *(_QWORD *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_7(&dword_1CF55F000, v2, v3, "[DEBUG] ┣%llx %@: fetching current change token", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_8_0();
}

void __37__FPDFilePresenter__fetchChangeToken__block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v9 = a2;
  v10 = a4;
  v11 = a6;
  v12 = a1[4];
  v13 = (void *)a1[5];
  v14 = *(NSObject **)(v12 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FPDFilePresenter__fetchChangeToken__block_invoke_2;
  block[3] = &unk_1E8C78650;
  v23 = a1[6];
  block[4] = v12;
  v19 = v13;
  v20 = v11;
  v24 = a1[7];
  v21 = v9;
  v22 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v11;
  dispatch_async(v14, block);

}

uint64_t __37__FPDFilePresenter__fetchChangeToken__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  NSObject *v4;
  int v5;
  _BYTE *v6;
  _QWORD *v8;
  void *v9;
  _BYTE *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = *(_QWORD *)(a1 + 72);
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_3();

  v3 = (_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != *(_QWORD *)(a1 + 40))
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_2();
LABEL_12:

    return __fp_leave_section_Debug();
  }
  v5 = objc_msgSend(*(id *)(a1 + 48), "fp_isRemoteCrashError");
  v6 = (_BYTE *)*v3;
  if (v5)
  {
    objc_msgSend(v6, "_enumeratorRequestDidFailWithXPCError:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!v6[64])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ received changes on active enumerator for stopped presenter %@"), *v3, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDFilePresenter _fetchChangeToken]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDFilePresenter.m", 411, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
    }
    v6[65] = 0;
    if (*(_QWORD *)(a1 + 48))
    {
      fp_current_or_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*v3 + 32), "fp_prettyDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138412802;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        v21 = 2112;
        v22 = v13;
        _os_log_error_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_ERROR, "[ERROR] no change token returned for %@: %@\n on url: %@", buf, 0x20u);

      }
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 32), "receiveUpdatedItems:deletedItemsIdentifiers:", *(_QWORD *)(a1 + 56), MEMORY[0x1E0C9AA60]);
    v9 = *(void **)(a1 + 64);
    v8 = (_QWORD *)(a1 + 64);
    objc_storeStrong((id *)(*(v8 - 4) + 40), v9);
    v10 = (_BYTE *)*(v8 - 4);
    if (*v8)
    {
      objc_msgSend(v10, "_fetchUpdates");
    }
    else if (v10[66])
    {
      objc_msgSend(v10, "_fetchChangeToken");
    }
  }
  return __fp_leave_section_Debug();
}

- (void)_fetchUpdates
{
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  LODWORD(v4) = 134218242;
  *(_QWORD *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_7(&dword_1CF55F000, v2, v3, "[DEBUG] ┣%llx %@: fetching changes", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_8_0();
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke(_QWORD *a1, void *a2, void *a3, char a4, void *a5, uint64_t a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v12 = a2;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  v16 = a1[4];
  v17 = (void *)a1[5];
  v18 = *(NSObject **)(v16 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPDFilePresenter__fetchUpdates__block_invoke_2;
  block[3] = &unk_1E8C786A0;
  v30 = a1[6];
  block[4] = v16;
  v25 = v17;
  v26 = v15;
  v19 = a1[7];
  v32 = a4;
  v27 = v14;
  v28 = v13;
  v31 = v19;
  v29 = v12;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v23 = v15;
  dispatch_async(v18, block);

}

uint64_t __33__FPDFilePresenter__fetchUpdates__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  NSObject *v4;
  int v5;
  _BYTE *v6;
  id *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v35 = *(_QWORD *)(a1 + 80);
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_7();

  v3 = (id *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != *(_QWORD *)(a1 + 40))
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_2();

    return __fp_leave_section_Debug();
  }
  v5 = objc_msgSend(*(id *)(a1 + 48), "fp_isRemoteCrashError");
  v6 = *v3;
  if (v5)
  {
    objc_msgSend(v6, "_enumeratorRequestDidFailWithXPCError:", *(_QWORD *)(a1 + 48));
    return __fp_leave_section_Debug();
  }
  if (!v6[64])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ received changes on active enumerator for stopped presenter %@"), *v3, v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDFilePresenter _fetchUpdates]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDFilePresenter.m", 480, (const char *)objc_msgSend(objc_retainAutorelease(v33), "UTF8String"));
  }
  v6[65] = 0;
  v7 = (id *)(a1 + 56);
  if (objc_msgSend(*(id *)(a1 + 56), "isEqualToData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    && !*(_QWORD *)(a1 + 48))
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_5();

    if (*(_BYTE *)(a1 + 96))
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_4(v9, v10, v11, v12, v13, v14, v15, v16);

    }
    if (objc_msgSend(*(id *)(a1 + 64), "count") || objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_3(v17, v18, v19, v20, v21, v22, v23, v24);

    }
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "fp_isFileProviderError:", -1002) & 1) != 0)
    v25 = 1;
  else
    v25 = objc_msgSend(*(id *)(a1 + 48), "fp_isFileProviderError:", -1002);
  objc_storeStrong((id *)*v3 + 5, *v7);
  if (*v7)
    v26 = 0;
  else
    v26 = v25;
  if (v26 == 1)
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_2(v27);
    goto LABEL_37;
  }
  objc_msgSend(*(id *)(a1 + 32), "receiveUpdatedItems:deletedItemsIdentifiers:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  if (*(_QWORD *)(a1 + 48))
  {
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*((id *)*v3 + 4), "fp_prettyDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(a1 + 48);
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138412802;
      v37 = v30;
      v38 = 2112;
      v39 = v31;
      v40 = 2112;
      v41 = v32;
      _os_log_error_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_ERROR, "[ERROR] error when getting changes for %@: %@\n on url: %@", buf, 0x20u);

    }
    if (*((_BYTE *)*v3 + 66))
    {
      *((_BYTE *)*v3 + 66) = 0;
      v27 = *((_QWORD *)*v3 + 5);
      *((_QWORD *)*v3 + 5) = 0;
LABEL_37:

      objc_msgSend(*v3, "_fetchChangeToken");
    }
  }
  else if (*((_BYTE *)*v3 + 66) || *(_BYTE *)(a1 + 96))
  {
    objc_msgSend(*v3, "_fetchUpdates");
  }
  return __fp_leave_section_Debug();
}

- (void)dumpStateTo:(id)a3
{
  id v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  audit_token_t atoken;

  v4 = a3;
  v5 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v5;
  v6 = audit_token_to_pid(&atoken);
  objc_msgSend(v4, "write:", CFSTR("  presenter: "));
  if ((_DWORD)v6 == -1)
  {
    objc_msgSend(v4, "startFgColor:", 1);
    objc_msgSend(v4, "write:", CFSTR("unknown process"));
  }
  else
  {
    if (-[FPDFilePresenter isEnumeratorActive](self, "isEnumeratorActive"))
      v7 = 2;
    else
      v7 = 3;
    objc_msgSend(v4, "startFgColor:", v7);
    v8 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&atoken.val[4] = v8;
    FPExecutableNameForAuditToken();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "write:", CFSTR("%@[%d]"), v9, v6);

  }
  if (!self->_presenterWantsUbiqitousAttributes)
  {
    v10 = CFSTR(" (ignored)");
    goto LABEL_11;
  }
  if (!-[FPDFilePresenter isEnumeratorActive](self, "isEnumeratorActive"))
  {
    v10 = CFSTR(" (passive)");
LABEL_11:
    objc_msgSend(v4, "write:", v10);
  }
  objc_msgSend(v4, "reset");
  -[FPDFilePresenter _presentedItemDescription:](self, "_presentedItemDescription:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "write:", CFSTR(" presenting %@ (%@)\n"), v11, self->_filePresenterID);

}

- (NSString)prettyDescription
{
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  void *v8;
  audit_token_t atoken;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FPDFilePresenter _presentedItemDescription:](self, "_presentedItemDescription:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v5;
  FPExecutableNameForAuditToken();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("presenter for %@ by %@[%u]"), v4, v6, audit_token_to_pid(&atoken));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)filePresenterID
{
  return self->_filePresenterID;
}

- (void)setFilePresenterID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isEnumeratorActive
{
  return self->_isEnumeratorActive;
}

- (void)setIsEnumeratorActive:(BOOL)a3
{
  self->_isEnumeratorActive = a3;
}

- (FPItemID)observedItemID
{
  return self->_observedItemID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[3].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (FPItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (NSURL)presentedItemURL
{
  return self->_presentedItemURL;
}

- (FPDDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong(&self->_filePresenterID, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_observedItemID, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_destroyWeak((id *)&self->_manager);
}

void __24__FPDFilePresenter_stop__block_invoke_cold_1()
{
  __assert_rtn("-[FPDFilePresenter stop]_block_invoke", "FPDFilePresenter.m", 221, "self->_enumerator == nil");
}

- (void)_enumeratorRequestDidFailWithXPCError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: received error from the enumerator: %@", (uint8_t *)&v6, 0x16u);

}

- (void)receiveUpdatedItems:deletedItemsIdentifiers:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[24];

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = v0;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = v1;
  OUTLINED_FUNCTION_0_7(&dword_1CF55F000, v1, v2, "[DEBUG] ┏%llx received update for items %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_8_0();
}

void __47__FPDFilePresenter_enumerationResultsDidChange__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_7(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx %@: received notification of changes");
  OUTLINED_FUNCTION_8_0();
}

void __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_7(&dword_1CF55F000, v0, v1, "[DEBUG] changes is from an outdated enumerator %@, current is %@");
  OUTLINED_FUNCTION_8_0();
}

void __37__FPDFilePresenter__fetchChangeToken__block_invoke_2_cold_3()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@: received current change token from %@", v3, 0x20u);
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] change token was reset", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, a1, a3, "[ERROR] Received state changes, but change token remains the same", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, a1, a3, "[ERROR] There shouldn't be more changes if change token has not changed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_7(&dword_1CF55F000, v0, v1, "[DEBUG] Change token has not changed: was %@ now %@");
  OUTLINED_FUNCTION_8_0();
}

void __33__FPDFilePresenter__fetchUpdates__block_invoke_2_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┳%llx received changes", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_8_0();
}

@end
