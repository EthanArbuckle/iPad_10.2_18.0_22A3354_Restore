@implementation FPDItemIterator

- (FPDItemIterator)initWithItem:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  FPDItemIterator *v8;
  FPDItemIterator *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  NSMutableArray *remainingItemsByDepth;
  uint64_t v15;
  NSMutableArray *enumeratorByDepth;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)FPDItemIterator;
  v8 = -[FPDItemIterator init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_provider, v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("FileProvider.provider-iterator", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new();
    remainingItemsByDepth = v9->_remainingItemsByDepth;
    v9->_remainingItemsByDepth = (NSMutableArray *)v13;

    v15 = objc_opt_new();
    enumeratorByDepth = v9->_enumeratorByDepth;
    v9->_enumeratorByDepth = (NSMutableArray *)v15;

    v17 = v9->_enumeratorByDepth;
    v18 = (void *)objc_opt_new();
    -[NSMutableArray addObject:](v17, "addObject:", v18);

    v19 = v9->_remainingItemsByDepth;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v19, "addObject:", v20);

    WeakRetained = objc_loadWeakRetained((id *)&v9->_provider);
    objc_msgSend(v6, "domainIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "domainForIdentifier:reason:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_domain, v23);

    v24 = objc_loadWeakRetained((id *)&v9->_domain);
    objc_msgSend(v24, "session");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "registerLifetimeExtensionForObject:", v9);

  }
  return v9;
}

- (void)_popFolder
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 64), "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v5, "[DEBUG] iterator: popped %@", v6);

  OUTLINED_FUNCTION_2();
}

- (void)_pushFolder:(id)a3
{
  id v4;
  NSMutableArray *remainingItemsByDepth;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setParentItem:", v4);

  objc_msgSend(v7, "setEnumerator:", 0);
  objc_msgSend(v7, "setNextPage:", 0);
  -[NSMutableArray addObject:](self->_enumeratorByDepth, "addObject:", v7);
  remainingItemsByDepth = self->_remainingItemsByDepth;
  v6 = (void *)objc_opt_new();
  -[NSMutableArray addObject:](remainingItemsByDepth, "addObject:", v6);

}

- (id)_popItem
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableArray lastObject](self->_remainingItemsByDepth, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray lastObject](self->_remainingItemsByDepth, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectAtIndex:", 0);

  -[FPDItemIterator _decorateItem:](self, "_decorateItem:", v4);
  return v4;
}

- (BOOL)_createEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  NSObject *v25;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  id v34;
  FPDItemIterator *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[24];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[NSMutableArray lastObject](self->_enumeratorByDepth, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnumeratedItemID:", v6);

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__2;
  v49 = __Block_byref_object_dispose__2;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__2;
  v43 = __Block_byref_object_dispose__2;
  v44 = 0;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "enumeratedItemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDItemIterator _createEnumerator].cold.3(v8, (uint64_t)v51, v7);
  }

  objc_msgSend(v3, "enumeratedItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ only enumerating items is supported"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDItemIterator _createEnumerator]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDItemIterator.m", 127, (const char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String"));
  }
  objc_msgSend(v3, "enumeratedItemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "domainIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "domainForIdentifier:reason:", v12, &v38);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    FPProviderNotFoundError();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v40[5];
    v40[5] = v15;

  }
  objc_msgSend(v14, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "newFileProviderProxyWithTimeout:pid:", 0, 180.0);
  objc_msgSend(v18, "synchronousRemoteObjectProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __36__FPDItemIterator__createEnumerator__block_invoke;
  v32 = &unk_1E8C76340;
  v36 = &v39;
  v20 = v3;
  v33 = v20;
  v37 = &v45;
  v21 = v14;
  v34 = v21;
  v35 = self;
  objc_msgSend(v19, "fetchAndStartEnumeratingWithSettings:observer:request:completionHandler:", v20, self, 0, &v29);

  v22 = v40[5];
  v23 = v46[5];
  if (v22)
  {
    if (v23)
    {
LABEL_14:
      -[FPDItemIterator _invalidateWithError:](self, "_invalidateWithError:", v22, v29, v30, v31, v32, v33);
      v24 = 0;
      goto LABEL_15;
    }
LABEL_11:
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[FPDItemIterator _createEnumerator].cold.2(v25);

    v22 = v40[5];
    goto LABEL_14;
  }
  if (!v23)
    goto LABEL_11;
  objc_msgSend(v4, "setEnumerator:", v46[5], v29, v30, v31, v32, v33);
  objc_msgSend(v4, "setNextPage:", *MEMORY[0x1E0CAAB80]);
  v24 = 1;
LABEL_15:

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v24;
}

void __36__FPDItemIterator__createEnumerator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v5)
  {
    if (!v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAACE8]), "initWithConnection:protocol:orError:name:requestPid:", v5, &unk_1EFBBBA70, 0, CFSTR("item iterator"), 0);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;
      v11 = v8;

      objc_msgSend(*(id *)(a1 + 40), "session");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject registerLifetimeExtensionForObject:](v12, "registerLifetimeExtensionForObject:", *(_QWORD *)(a1 + 48));

      goto LABEL_8;
    }
  }
  else if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __36__FPDItemIterator__createEnumerator__block_invoke_cold_1(a1, a1 + 56);
LABEL_8:

}

- (BOOL)_enumerateMoreItems
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, void *, void *, void *);
  void *v21;
  FPDItemIterator *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  -[NSMutableArray lastObject](self->_remainingItemsByDepth, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ still have items to process"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDItemIterator _enumerateMoreItems]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDItemIterator.m", 178, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
  }
  if (-[NSMutableArray count](self->_enumeratorByDepth, "count") == 1)
    return 0;
  -[NSMutableArray lastObject](self->_enumeratorByDepth, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && !-[FPDItemIterator _createEnumerator](self, "_createEnumerator"))
    return 0;
  -[NSMutableArray lastObject](self->_enumeratorByDepth, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextPage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[FPDItemIterator _enumerateMoreItems].cold.1(v8, v10);

    objc_msgSend(v8, "enumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__2;
      v36 = __Block_byref_object_dispose__2;
      v37 = 0;
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__2;
      v30 = __Block_byref_object_dispose__2;
      v31 = 0;
      objc_msgSend(v11, "synchronousRemoteObjectProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nextPage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __38__FPDItemIterator__enumerateMoreItems__block_invoke;
      v21 = &unk_1E8C76390;
      v24 = &v32;
      v22 = self;
      v23 = v8;
      v25 = &v26;
      objc_msgSend(v13, "enumerateItemsFromPage:suggestedPageSize:reply:", v14, 200, &v18);

      if (v33[5])
      {
        -[FPDItemIterator _invalidateWithError:](self, "_invalidateWithError:", v18, v19, v20, v21, v22);
        v5 = 0;
      }
      else
      {
        v5 = v27[5] != 0;
      }

      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v32, 8);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __38__FPDItemIterator__enumerateMoreItems__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v15)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a6);
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __38__FPDItemIterator__enumerateMoreItems__block_invoke_cold_2();

  }
  else
  {
    if (v11)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __38__FPDItemIterator__enumerateMoreItems__block_invoke_91;
      v20[3] = &unk_1E8C76368;
      v21 = *(id *)(a1 + 40);
      objc_msgSend(v11, "fp_filter:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObjectsFromArray:", v18);

    }
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      __38__FPDItemIterator__enumerateMoreItems__block_invoke_cold_1(v11);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    objc_msgSend(*(id *)(a1 + 40), "setNextPage:", v12);
  }

}

uint64_t __38__FPDItemIterator__enumerateMoreItems__block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "parentItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v6))
  {
    objc_msgSend(v3, "providerItemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providerItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9) ^ 1;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_decorateItem:(id)a3
{
  id v4;
  FPDDomain **p_domain;
  id WeakRetained;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  NSObject *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FPDIterator shouldDecorateItems](self, "shouldDecorateItems")
    || objc_msgSend(v4, "isFolder")
    && -[FPDIterator skipMaterializedTreeTraversal](self, "skipMaterializedTreeTraversal"))
  {
    p_domain = &self->_domain;
    WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    objc_msgSend(WeakRetained, "defaultBackend");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = dispatch_group_create();
      dispatch_group_enter(v9);
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[FPDItemIterator _decorateItem:].cold.1(v4);

      v11 = objc_loadWeakRetained((id *)p_domain);
      objc_msgSend(v11, "defaultBackend");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __33__FPDItemIterator__decorateItem___block_invoke;
      v15[3] = &unk_1E8C763B8;
      v16 = v4;
      v17 = v9;
      v14 = v9;
      objc_msgSend(v12, "decorateItems:completionHandler:", v13, v15);

      dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    }
  }

}

void __33__FPDItemIterator__decorateItem___block_invoke(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33__FPDItemIterator__decorateItem___block_invoke_cold_1(a1);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)_shouldTraverseSubTree:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v17;

  v4 = a3;
  if (-[FPDIterator skipMaterializedTreeTraversal](self, "skipMaterializedTreeTraversal"))
    v5 = objc_msgSend(v4, "isRecursivelyDownloaded") ^ 1;
  else
    LOBYTE(v5) = 1;
  -[NSMutableArray lastObject](self->_enumeratorByDepth, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[NSMutableArray lastObject](self->_enumeratorByDepth, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formerIdentifier");
    v17 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    v10 = v17 & ~v15;
  }

  return v10;
}

- (void)_next
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 72), "count");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v3, "[DEBUG] iterator: fetching next item (remaining depths: %lld)", v4);
  OUTLINED_FUNCTION_1_0();
}

- (id)nextWithError:(id *)a3
{
  NSObject *queue;
  void *v5;
  id v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__FPDItemIterator_nextWithError___block_invoke;
  v8[3] = &unk_1E8C763E0;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  v8[7] = a2;
  dispatch_sync(queue, v8);
  v5 = (void *)v16[5];
  if (a3 && !v5)
  {
    *a3 = objc_retainAutorelease((id)v10[5]);
    v5 = (void *)v16[5];
  }
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __33__FPDItemIterator_nextWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  objc_msgSend(*(id *)(a1 + 32), "_next");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    if (!*(_QWORD *)(v2 + 32) && !*(_BYTE *)(v2 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ invalid state"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDItemIterator nextWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDItemIterator.m", 352, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    }
    objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

}

- (id)error
{
  return self->_error;
}

- (void)_invalidateWithError:(id)a3
{
  id v5;
  NSObject *v6;
  FPItem *current;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_done)
  {
    if (v5)
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[FPDItemIterator _invalidateWithError:].cold.1((uint64_t)v5, (uint64_t)self);

    }
    objc_storeStrong((id *)&self->_error, a3);
    current = self->_current;
    self->_current = 0;

    self->_done = 1;
    while (1)
    {
      -[NSMutableArray lastObject](self->_enumeratorByDepth, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        break;
      -[NSMutableArray lastObject](self->_enumeratorByDepth, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enumerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidate");

      -[NSMutableArray removeLastObject](self->_enumeratorByDepth, "removeLastObject");
    }
    -[NSMutableArray removeAllObjects](self->_remainingItemsByDepth, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_enumeratorByDepth, "removeAllObjects");
    WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    objc_msgSend(WeakRetained, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unregisterLifetimeExtensionForObject:", self);

    objc_storeWeak((id *)&self->_provider, 0);
  }

}

- (BOOL)done
{
  return self->_done;
}

- (unint64_t)numFoldersPopped
{
  return self->_numFoldersPoped;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__FPDItemIterator_dealloc__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)FPDItemIterator;
  -[FPDItemIterator dealloc](&v4, sel_dealloc);
}

uint64_t __26__FPDItemIterator_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithError:", 0);
}

- (NSString)prettyDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("background copy"));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_domain);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_remainingItemsByDepth, 0);
  objc_storeStrong((id *)&self->_enumeratorByDepth, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_createEnumerator
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a3, (uint64_t)a3, "[DEBUG] iterator: creating enumerator for %@", (uint8_t *)a2);

}

void __36__FPDItemIterator__createEnumerator__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v3, v4, "[ERROR] couldn't get enumerator for %@ from extension: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_enumerateMoreItems
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "parentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nextPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] iterator: enumerating more items starting in %@ starting at %@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_2();
}

void __38__FPDItemIterator__enumerateMoreItems__block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v1, v2, "[DEBUG] iterator: received %lld items and next page is %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

void __38__FPDItemIterator__enumerateMoreItems__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] iterator: failed with %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)_decorateItem:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "isDownloaded");
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v1, v2, "[DEBUG] Decorating item %@ isDownloaded ? %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

void __33__FPDItemIterator__decorateItem___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(a1 + 32), "isDownloaded");
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v1, v2, "[DEBUG] Finished decorating item %@ isDownloaded ? %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)_invalidateWithError:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a2 + 64), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v4, v5, "[ERROR] invalidating iterator of %@ with error: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2();
}

@end
