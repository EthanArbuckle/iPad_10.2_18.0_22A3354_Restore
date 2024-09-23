@implementation FPDSpotlightDaemonClient

- (FPDSpotlightDaemonClient)initWithExtensionManager:(id)a3
{
  id v5;
  FPDSpotlightDaemonClient *v6;
  FPDSpotlightDaemonClient *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *reindexQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FPDSpotlightDaemonClient;
  v6 = -[FPDSpotlightDaemonClient init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionManager, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("reindex-queue", v8);
    reindexQueue = v7->_reindexQueue;
    v7->_reindexQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  NSObject *reindexQueue;
  _QWORD block[5];
  id v13;
  void (**v14)(_QWORD);
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if ((objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CB2AC0]) & 1) != 0)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_INFO, "[INFO] Received call to reindex all items for bundle ID %@", buf, 0xCu);
    }

    reindexQueue = self->_reindexQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__FPDSpotlightDaemonClient_reindexAllItemsForBundleID_protectionClass_acknowledgementHandler___block_invoke;
    block[3] = &unk_1E8C75C50;
    block[4] = self;
    v13 = v8;
    v14 = v9;
    dispatch_async(reindexQueue, block);

  }
  else
  {
    v9[2](v9);
  }

}

void __94__FPDSpotlightDaemonClient_reindexAllItemsForBundleID_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id obj;
  _QWORD v26[4];
  id v27;
  void *v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "defaultProviderWithTopLevelBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "domainsByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v8 = MEMORY[0x1E0C809B0];
    v24 = a1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        dispatch_group_enter(v2);
        fp_current_or_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = v2;
          v13 = v6;
          v14 = v7;
          v15 = v8;
          v16 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v10, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "fp_obfuscatedFilename");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v16;
          v8 = v15;
          v7 = v14;
          v6 = v13;
          v2 = v12;
          v36 = 2114;
          v37 = v18;
          _os_log_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_INFO, "[INFO] Started running reindex-all for bundleID %{public}@ with domain %{public}@", buf, 0x16u);

          a1 = v24;
        }

        objc_msgSend(v10, "defaultBackend");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v8;
        v26[1] = 3221225472;
        v26[2] = __94__FPDSpotlightDaemonClient_reindexAllItemsForBundleID_protectionClass_acknowledgementHandler___block_invoke_1;
        v26[3] = &unk_1E8C75358;
        v27 = *(id *)(a1 + 40);
        v28 = v10;
        v29 = v2;
        objc_msgSend(v19, "reindexAllItemsWithDropReason:completionHandler:", 5, v26);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v6);
  }

  fp_current_or_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v35 = v21;
    _os_log_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_INFO, "[INFO] Completing call to reindex all items for bundle ID %@", buf, 0xCu);
  }

  dispatch_get_global_queue(0, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v2, v22, *(dispatch_block_t *)(a1 + 48));

}

void __94__FPDSpotlightDaemonClient_reindexAllItemsForBundleID_protectionClass_acknowledgementHandler___block_invoke_1(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fp_obfuscatedFilename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] Finished running reindex-all for bundleID %{public}@ with domain %{public}@", (uint8_t *)&v6, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  NSObject *reindexQueue;
  _QWORD v15[4];
  id v16;
  FPDSpotlightDaemonClient *v17;
  id v18;
  void (**v19)(_QWORD);
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  if ((objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CB2AC0]) & 1) != 0)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v21 = objc_msgSend(v10, "count");
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_INFO, "[INFO] Received call to reindex %lu items for bundle ID %@", buf, 0x16u);
    }

    reindexQueue = self->_reindexQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke;
    v15[3] = &unk_1E8C75710;
    v16 = v10;
    v17 = self;
    v18 = v11;
    v19 = v12;
    dispatch_async(reindexQueue, v15);

  }
  else
  {
    v12[2](v12);
  }

}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id *v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  __int128 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint8_t v58[4];
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v37 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v50 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        v47 = 0;
        v48 = 0;
        objc_msgSend(MEMORY[0x1E0CAAC70], "getDomainIdentifier:andIdentifier:fromCoreSpotlightIdentifier:", &v48, &v47, v8);
        v9 = v48;
        v10 = v47;
        v11 = v10;
        if (v9)
        {
          if (v10)
          {
            objc_msgSend(v2, "objectForKeyedSubscript:", v9);
            v12 = objc_claimAutoreleasedReturnValue();
            if (!v12)
              v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[NSObject addObject:](v12, "addObject:", v8);
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v9);
          }
          else
          {
            fp_current_or_default_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_cold_1(v58, &v59, v12);
          }
        }
        else
        {
          fp_current_or_default_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v8;
            _os_log_error_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_ERROR, "[ERROR] Error converting CS identifier %@ to FP domain during reindex", buf, 0xCu);
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v5);
  }

  v13 = dispatch_group_create();
  v14 = (id *)v37;
  objc_msgSend(*(id *)(*(_QWORD *)(v37 + 40) + 16), "defaultProviderWithTopLevelBundleIdentifier:", *(_QWORD *)(v37 + 48));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = v2;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v16)
  {
    v18 = v16;
    v38 = *(_QWORD *)v44;
    *(_QWORD *)&v17 = 138543618;
    v35 = v17;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v44 != v38)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20, v35);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {
          v22 = v13;
          dispatch_group_enter(v13);
          objc_msgSend(v36, "domainsByID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          fp_current_or_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = *(_QWORD *)(v37 + 48);
            objc_msgSend(v24, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "fp_obfuscatedFilename");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v35;
            v54 = v26;
            v14 = (id *)v37;
            v55 = 2114;
            v56 = v28;
            _os_log_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_INFO, "[INFO] Started running reindex items for bundleID %{public}@ with domain %{public}@", buf, 0x16u);

          }
          objc_msgSend(v24, "defaultBackend");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_6;
          v39[3] = &unk_1E8C75358;
          v40 = v24;
          v41 = v14[6];
          v13 = v22;
          v42 = v22;
          v30 = v24;
          objc_msgSend(v29, "reindexItemsWithIndexReason:identifiers:completionHandler:", 7, v21, v39);

        }
      }
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    }
    while (v18);
  }

  fp_current_or_default_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = objc_msgSend(v14[4], "count");
    v33 = v14[6];
    *(_DWORD *)buf = 134218242;
    v54 = v32;
    v55 = 2112;
    v56 = v33;
    _os_log_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_INFO, "[INFO] Completing call to reindex %lu items for bundle ID %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v13, v34, v14[7]);

}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_6(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_6_cold_1((uint64_t)a1, v3, v5);

    objc_msgSend(a1[4], "defaultBackend");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_7;
    v10[3] = &unk_1E8C75358;
    v11 = a1[5];
    v12 = a1[4];
    v13 = a1[6];
    objc_msgSend(v6, "reindexAllItemsWithDropReason:completionHandler:", 4, v10);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = a1[5];
      objc_msgSend(a1[4], "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fp_obfuscatedFilename");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v7;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_INFO, "[INFO] Finished running reindex items for bundleID %{public}@ with domain %{public}@", buf, 0x16u);

    }
    dispatch_group_leave((dispatch_group_t)a1[6]);
  }

}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fp_obfuscatedFilename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] Finished running fallback reindex-all for bundleID %{public}@ with domain %{public}@", (uint8_t *)&v6, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v9;
  id v10;

  v9 = a8;
  FPNotSupportedError();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a8 + 2))(v9, 0, v10);

}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  NSObject *reindexQueue;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  FPDSpotlightDaemonClient *v22;
  id v23;
  int64_t v24;

  v12 = a3;
  v13 = a5;
  v14 = a8;
  reindexQueue = self->_reindexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  block[3] = &unk_1E8C78740;
  v23 = v14;
  v24 = a7;
  v20 = v13;
  v21 = v12;
  v22 = self;
  v16 = v14;
  v17 = v12;
  v18 = v13;
  dispatch_async(reindexQueue, block);

}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;

  v2 = (uint64_t *)(a1 + 64);
  if (*(_QWORD *)(a1 + 64))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_3(v2, v3, v4);

  }
  v23 = 0;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CAAC70], "getDomainIdentifier:andIdentifier:fromCoreSpotlightIdentifier:", &v24, &v23, *(_QWORD *)(a1 + 32));
  v5 = v24;
  v6 = v23;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || !*(_QWORD *)(a1 + 40))
  {
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "defaultProviderWithTopLevelBundleIdentifier:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v9, "domainForIdentifier:reason:", v5, &v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CAAC70]);
      objc_msgSend(v9, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithProviderID:domainIdentifier:itemIdentifier:", v12, v5, v7);

      objc_msgSend(v10, "defaultBackend");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForXPCConnection:](FPDRequest, "requestForXPCConnection:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_11;
      v20[3] = &unk_1E8C78718;
      v21 = *(id *)(a1 + 56);
      objc_msgSend(v14, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v13, 1, 0, 0, v16, v20);

    }
    else
    {
      fp_current_or_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_2();

      v19 = *(_QWORD *)(a1 + 56);
      FPProviderNotFoundError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v13);
    }

  }
}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "url");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

}

- (FPDExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_reindexQueue, 0);
}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a2 = 0;
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a3, (uint64_t)a3, "[ERROR] Error converting CS identifier %@ to FP identifier during reindex", a1);
}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_6_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Error reindexing specific items for domain %@, falling back to reindex all %@", (uint8_t *)&v7, 0x16u);

}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_2_1(&dword_1CF55F000, v0, v1, "[ERROR] Spotlight provideFileForURL failed to get fp item identifiers %@ for bundle %@");
  OUTLINED_FUNCTION_8_0();
}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_2_1(&dword_1CF55F000, v0, v1, "[ERROR] Providing url for bundle id %@, missing domain for identifier %@");
  OUTLINED_FUNCTION_8_0();
}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_3(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, a3, "[ERROR] Options are not supported in FileProvider %ld", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

@end
