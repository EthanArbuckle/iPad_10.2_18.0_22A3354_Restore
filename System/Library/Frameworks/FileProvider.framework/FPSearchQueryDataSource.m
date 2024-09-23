@implementation FPSearchQueryDataSource

- (FPSearchQueryDataSource)initWithQueryDescriptor:(id)a3 predicate:(id)a4
{
  id v8;
  id v9;
  FPSearchQueryDataSource *v10;
  FPSearchQueryDataSource *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  FPSpotlightDataSource *v28;
  FPSpotlightDataSource *spotlightDataSource;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v48;
  void *v49;
  _QWORD block[4];
  NSObject *v51;
  id v52;
  FPSearchQueryDataSource *v53;
  objc_super v54;

  v8 = a3;
  v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)FPSearchQueryDataSource;
  v10 = -[FPSearchQueryDataSource init](&v54, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queryDescriptor, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.FileProvider.ExtensionDataSource.queue (%p)"), v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    FPDataSourceBaseQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create_with_target_V2(v13, v14, v15);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

    objc_msgSend(v8, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "searchQuery");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "providerDomainID");
    v20 = objc_claimAutoreleasedReturnValue();
    -[NSObject fp_toProviderID](v20, "fp_toProviderID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider"));

    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[FPSearchQueryDataSource initWithQueryDescriptor:predicate:].cold.3(v22, v23, v24);

    if ((v22 & 1) != 0 || (objc_msgSend(v8, "avoidCoreSpotlightSearch") & 1) != 0)
    {
      if ((objc_msgSend(v19, "shouldPerformServerSearch") & 1) != 0
        || (objc_msgSend(v19, "shouldPerformServerSearch") & 1) != 0)
      {
        if (!v20)
          goto LABEL_9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("FPSearchQueryDataSource.m"), 58, CFSTR("When search on USB, server-side search should be requested."));

        if (!v20)
        {
LABEL_9:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("FPSearchQueryDataSource.m"), 59, CFSTR("When search on USB, the provider domain ID should be set to the USB provider domain ID."));

          if ((objc_msgSend(v19, "shouldPerformServerSearch") & 1) != 0)
            goto LABEL_20;
          goto LABEL_18;
        }
      }
    }
    else
    {
      objc_msgSend(v8, "searchQueryString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        objc_msgSend(v8, "searchQueryString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("FPSearchQueryDataSource.m"), 52, CFSTR("search query should always be expressible by spotlight query"));

        }
      }
      v28 = -[FPSpotlightDataSource initWithQueryDescriptor:predicate:]([FPSpotlightDataSource alloc], "initWithQueryDescriptor:predicate:", v8, v9);
      spotlightDataSource = v11->_spotlightDataSource;
      v11->_spotlightDataSource = v28;

    }
    if ((objc_msgSend(v19, "shouldPerformServerSearch") & 1) != 0)
    {
      if (v20)
      {
        v30 = v11->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke;
        block[3] = &unk_1E444AB48;
        v51 = v20;
        v52 = v8;
        v53 = v11;
        v31 = v20;
        dispatch_async(v30, block);

        v32 = v51;
LABEL_22:

        goto LABEL_23;
      }
LABEL_20:
      fp_current_or_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[FPSearchQueryDataSource initWithQueryDescriptor:predicate:].cold.1(v32, v40, v41, v42, v43, v44, v45, v46);
      goto LABEL_22;
    }
LABEL_18:
    fp_current_or_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[FPSearchQueryDataSource initWithQueryDescriptor:predicate:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_22;
  }
LABEL_23:

  return v11;
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t section;
  uint8_t buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  section = __fp_create_section();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1[4], "fp_obfuscatedProviderDomainID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_cold_1(v3, buf, section, v2);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_18;
  v5[3] = &unk_1E444E960;
  v4 = a1[4];
  v6 = a1[5];
  v7 = a1[4];
  v8 = a1[6];
  +[FPProviderDomain fetchProviderDomainWithID:completionHandler:](FPProviderDomain, "fetchProviderDomainWithID:completionHandler:", v4, v5);

  __fp_leave_section_Debug((uint64_t)&section);
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_18(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  FPExtensionEnumerationSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  FPItemID *v12;
  uint64_t v13;
  void *v14;
  FPItemID *v15;
  _QWORD *v16;
  NSObject *v17;
  FPExtensionEnumerationSettings *v18;
  _QWORD v19[4];
  _QWORD *v20;
  FPExtensionEnumerationSettings *v21;

  objc_msgSend(a2, "supportedSearchFilters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_18_cold_1(a1, v4);

    v5 = objc_alloc_init(FPExtensionEnumerationSettings);
    objc_msgSend(*(id *)(a1 + 32), "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPEnumerationSettings setSortDescriptors:](v5, "setSortDescriptors:", v7);

    objc_msgSend(*(id *)(a1 + 32), "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPEnumerationSettings setSearchQuery:](v5, "setSearchQuery:", v9);

    if (objc_msgSend(*(id *)(a1 + 32), "isThirdPartySearchOnServer"))
      -[FPExtensionEnumerationSettings setWantsDirectExtensionEnumeration:](v5, "setWantsDirectExtensionEnumeration:", 0);
    objc_msgSend(*(id *)(a1 + 32), "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchQuery");
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = [FPItemID alloc];
    v13 = *(_QWORD *)(a1 + 40);
    -[NSObject searchContainerItemIdentifier](v11, "searchContainerItemIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FPItemID initWithProviderDomainID:itemIdentifier:](v12, "initWithProviderDomainID:itemIdentifier:", v13, v14);

    -[FPExtensionEnumerationSettings setEnumeratedItemID:](v5, "setEnumeratedItemID:", v15);
    v16 = *(_QWORD **)(a1 + 48);
    v17 = v16[1];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_21;
    v19[3] = &unk_1E4449A40;
    v20 = v16;
    v21 = v5;
    v18 = v5;
    dispatch_async(v17, v19);

    goto LABEL_9;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isThirdPartySearchOnServer") & 1) != 0)
    goto LABEL_4;
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_18_cold_2(a1, v11);
LABEL_9:

}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_21(uint64_t a1)
{
  FPExtensionDataSource *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = -[FPExtensionDataSource initWithEnumerationSettings:]([FPExtensionDataSource alloc], "initWithEnumerationSettings:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 16))
  {
    if (!*(_BYTE *)(v6 + 17))
      objc_msgSend(*(id *)(v6 + 32), "start");
  }
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  -[FPSpotlightDataSource start](self->_spotlightDataSource, "start");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__FPSearchQueryDataSource_start__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__FPSearchQueryDataSource_start__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "start");
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  -[FPSpotlightDataSource invalidate](self->_spotlightDataSource, "invalidate");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FPSearchQueryDataSource_invalidate__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__FPSearchQueryDataSource_invalidate__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
}

- (void)enumerationMightHaveResumed
{
  -[FPSpotlightDataSource enumerationMightHaveResumed](self->_spotlightDataSource, "enumerationMightHaveResumed");
  -[FPExtensionDataSource enumerationMightHaveResumed](self->_serverSearchDataSource, "enumerationMightHaveResumed");
}

- (BOOL)hasMoreIncoming
{
  return -[FPSpotlightDataSource hasMoreIncoming](self->_spotlightDataSource, "hasMoreIncoming")
      || -[FPExtensionDataSource hasMoreIncoming](self->_serverSearchDataSource, "hasMoreIncoming");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "isEqual:", v7);

  if ((v5 & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__FPSearchQueryDataSource_setDelegate___block_invoke;
    block[3] = &unk_1E4449A40;
    block[4] = self;
    v9 = v7;
    dispatch_sync(queue, block);

  }
}

uint64_t __39__FPSearchQueryDataSource_setDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "setDelegate:");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v3;
  }
  else
  {
    objc_msgSend(v2, "setDelegate:", 0);
    v4 = 0;
    v3 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v3 + 32), "setDelegate:", v4);
}

- (unint64_t)lastForcedUpdate
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "lastForcedUpdate");

  return v3;
}

- (void)dataSource:(id)a3 replaceContentsWithItems:(id)a4 hasMoreChanges:(BOOL)a5
{
  FPSpotlightDataSourceDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "dataSource:replaceContentsWithItems:hasMoreChanges:", self, v7, 0);

}

- (void)dataSource:(id)a3 receivedUpdatedItems:(id)a4 deletedItems:(id)a5 hasMoreChanges:(BOOL)a6
{
  FPSpotlightDataSourceDelegate **p_delegate;
  id v9;
  id v10;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v9 = a5;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "dataSource:receivedUpdatedItems:deletedItems:hasMoreChanges:", self, v10, v9, 0);

}

- (void)dataSource:(id)a3 wasInvalidatedWithError:(id)a4
{
  FPSpotlightDataSourceDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "dataSource:wasInvalidatedWithError:", self, v6);

}

- (BOOL)dataSourceShouldAlwaysReplaceContents:(id)a3
{
  return !-[FPSearchQueryDescriptor isThirdPartySearchOnServer](self->_queryDescriptor, "isThirdPartySearchOnServer", a3);
}

- (void)dataSource:(id)a3 didChangeItemsOrigin:(unint64_t)a4
{
  FPSpotlightDataSourceDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "dataSource:didChangeItemsOrigin:", v6, a4);

}

- (FPSpotlightDataSourceDelegate)delegate
{
  return (FPSpotlightDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (FPSearchQueryDescriptor)queryDescriptor
{
  return self->_queryDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverSearchDataSource, 0);
  objc_storeStrong((id *)&self->_spotlightDataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithQueryDescriptor:(uint64_t)a3 predicate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] server search ignored because no provider domain ID specified", a5, a6, a7, a8, 0);
}

- (void)initWithQueryDescriptor:(uint64_t)a3 predicate:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] server search not requested", a5, a6, a7, a8, 0);
}

- (void)initWithQueryDescriptor:(uint64_t)a3 predicate:.cold.3(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, a3, "[DEBUG] Creating search query data source (is search on USB: %@)", (uint8_t *)&v4);
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_cold_1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx checking if '%@' supports server search", buf, 0x16u);

}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_18_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "fp_obfuscatedProviderDomainID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] '%@' supports server search", (uint8_t *)&v5);

  OUTLINED_FUNCTION_6_1();
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_18_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "fp_obfuscatedProviderDomainID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] '%@' does not support server search", (uint8_t *)&v5);

  OUTLINED_FUNCTION_6_1();
}

@end
