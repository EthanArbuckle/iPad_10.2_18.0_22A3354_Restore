@implementation FPSpotlightCollector

- (id)allItems
{
  void *v3;
  NSMutableDictionary *itemsByBundleAndCSID;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  itemsByBundleAndCSID = self->_itemsByBundleAndCSID;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__FPSpotlightCollector_allItems__block_invoke;
  v7[3] = &unk_1E444B6A0;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](itemsByBundleAndCSID, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __32__FPSpotlightCollector_allItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "query:didUpdateItems:", v2, *(_QWORD *)(a1 + 40));

}

- (void)query:(id)a3 didUpdateItems:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  FPItem *v16;
  FPItem *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *itemsByProviderAndCollaborationIdentifier;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  id v57;
  unint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  NSMutableDictionary *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  FPSpotlightCollector *v69;
  NSMutableSet *obj;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  id v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  if (!-[FPSpotlightCollector isQueryCancelled:](self, "isQueryCancelled:", v6))
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v69 = self;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[FPSpotlightCollector description](self, "description");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v7, "count");
      if (self->_gathering)
        v56 = "initially gathered";
      else
        v56 = "updated";
      v57 = v7;
      v58 = objc_msgSend(v57, "count");
      v59 = (void *)MEMORY[0x1E0CB3940];
      if (v58 > 0xA)
      {
        objc_msgSend(v57, "subarrayWithRange:", 0, 10);
        v61 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v59, "stringWithFormat:", CFSTR("%@..."), v61);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (id)v61;
        self = v69;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v57);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }

      *(_DWORD *)buf = 138413314;
      v83 = v54;
      v84 = 2048;
      v85 = v55;
      v86 = 2080;
      v87 = (uint64_t)v56;
      v88 = 2112;
      v89 = v6;
      v90 = 2112;
      v91 = v60;
      _os_log_debug_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Did receive %ld %s items from query:%@ -- %@", buf, 0x34u);

    }
    v63 = v6;

    v68 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    v65 = self->_itemsByBundleAndCSID;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v62 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    v67 = v9;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v77;
      v64 = v10;
      v66 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v77 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          v16 = -[FPItem initWithSearchableItem:]([FPItem alloc], "initWithSearchableItem:", v15);
          v17 = v16;
          if (v16)
          {
            -[FPItem itemIdentifier](v16, "itemIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier"));

            if ((v19 & 1) == 0)
            {
              objc_msgSend(v9, "addObject:", v17);
              objc_msgSend(v15, "bundleID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                -[NSMutableDictionary objectForKeyedSubscript:](v65, "objectForKeyedSubscript:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v21)
                {
                  v21 = (void *)objc_opt_new();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v65, "setObject:forKeyedSubscript:", v21, v20);
                }
                objc_msgSend(v15, "uniqueIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, v22);
                -[FPItem collaborationIdentifier](v17, "collaborationIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  itemsByProviderAndCollaborationIdentifier = self->_itemsByProviderAndCollaborationIdentifier;
                  -[FPItem providerIDForDeduplication](v17, "providerIDForDeduplication");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary objectForKeyedSubscript:](itemsByProviderAndCollaborationIdentifier, "objectForKeyedSubscript:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FPItem collaborationIdentifier](v17, "collaborationIdentifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "objectForKeyedSubscript:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  self = v69;
                  if (!v28
                    || (objc_msgSend(v28, "isEqual:", v17) & 1) == 0
                    && !-[FPItem isCollaborationInvitation](v17, "isCollaborationInvitation"))
                  {
                    v29 = v69->_itemsByProviderAndCollaborationIdentifier;
                    -[FPItem providerIDForDeduplication](v17, "providerIDForDeduplication");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", v30);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v31)
                    {
                      v31 = (void *)objc_opt_new();
                      v32 = v69->_itemsByProviderAndCollaborationIdentifier;
                      -[FPItem providerIDForDeduplication](v17, "providerIDForDeduplication");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v31, v33);

                    }
                    -[FPItem collaborationIdentifier](v17, "collaborationIdentifier");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "setObject:forKeyedSubscript:", v17, v34);

                    if (v28)
                    {
                      objc_msgSend(v28, "itemID");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v68, "addObject:", v35);

                    }
                    self = v69;
                  }

                  v9 = v67;
                }

                v10 = v64;
              }

              v13 = v66;
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      }
      while (v12);
    }

    if (!self->_gathering)
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      obj = self->_observers;
      v36 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v73;
        do
        {
          v39 = 0;
          do
          {
            if (*(_QWORD *)v73 != v38)
              objc_enumerationMutation(obj);
            v40 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v39);
            v41 = (void *)MEMORY[0x1A1B00664]();
            if (-[FPSpotlightCollector _shouldFilterUpdatesForObserver:](self, "_shouldFilterUpdatesForObserver:", v40))
            {
              v71 = 0;
              -[FPSpotlightCollector filterItems:forObserver:excludedItemIDs:](self, "filterItems:forObserver:excludedItemIDs:", v9, v40, &v71);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v71;
              v44 = objc_msgSend(v42, "count");
              v45 = objc_msgSend(v43, "count") + v44;
              v46 = objc_msgSend(v68, "count");
              fp_current_or_default_log();
              v47 = objc_claimAutoreleasedReturnValue();
              v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG);
              if (v45 + v46)
              {
                self = v69;
                if (v48)
                {
                  -[FPSpotlightCollector description](v69, "description");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v83 = v53;
                  v84 = 2112;
                  v85 = (uint64_t)v40;
                  v86 = 2112;
                  v87 = (uint64_t)v42;
                  v88 = 2112;
                  v89 = v43;
                  _os_log_debug_impl(&dword_1A0A34000, v47, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Observer:%@ notifying updates: %@ removal: %@", buf, 0x2Au);

                }
                if (objc_msgSend(v42, "count"))
                  objc_msgSend(v40, "collector:didUpdateItems:", v69, v42);
                v9 = v67;
                if (objc_msgSend(v43, "count"))
                  objc_msgSend(v40, "collector:didRemoveItemIDs:", v69, v43);
                if (objc_msgSend(v68, "count"))
                  objc_msgSend(v40, "collector:didRemoveItemIDs:", v69, v68);
              }
              else
              {
                self = v69;
                if (v48)
                {
                  -[FPSpotlightCollector description](v69, "description");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v83 = v52;
                  v84 = 2112;
                  v85 = (uint64_t)v40;
                  _os_log_debug_impl(&dword_1A0A34000, v47, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Skipping observer %@", buf, 0x16u);

                }
                v9 = v67;
              }

            }
            else
            {
              fp_current_or_default_log();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                -[FPSpotlightCollector description](self, "description");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v67, "count");
                *(_DWORD *)buf = 138412802;
                v83 = v50;
                v84 = 2112;
                v85 = (uint64_t)v40;
                v86 = 2048;
                v87 = v51;
                _os_log_debug_impl(&dword_1A0A34000, v49, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Observer:%@: notifying with delta updates (%ld items)", buf, 0x20u);

                v9 = v67;
              }

              objc_msgSend(v40, "collector:didUpdateItems:", self, v9);
            }
            objc_autoreleasePoolPop(v41);
            ++v39;
          }
          while (v37 != v39);
          v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        }
        while (v37);
      }

      -[FPSpotlightCollector setNeedsItemsOriginUpdate](self, "setNeedsItemsOriginUpdate");
    }

    v7 = v62;
    v6 = v63;
  }

}

void __64__FPSpotlightCollector_filterItems_forObserver_excludedItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    v5 = objc_msgSend(v4, "evaluateWithObject:", v3) ^ 1;
  else
    v5 = 0;
  objc_msgSend(v3, "collaborationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    objc_msgSend(v3, "providerIDForDeduplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collaborationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_msgSend(v3, "isEqual:", v11) ^ 1;
    }
    else
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __64__FPSpotlightCollector_filterItems_forObserver_excludedItemIDs___block_invoke_cold_1();

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  if (((v5 | v12) & 1) != 0)
  {
    v14 = *(void **)(a1 + 56);
    if (v14)
    {
      objc_msgSend(v3, "itemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }

}

- (void)setNeedsItemsOriginUpdate
{
  void *v3;
  unint64_t v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[FPSpotlightCollector allItems](self, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FPSpotlightCollector _itemsOriginForItems:](self, "_itemsOriginForItems:", v3);

  if (v4 != -[FPSpotlightCollector itemsOrigin](self, "itemsOrigin"))
  {
    -[FPSpotlightCollector setItemsOrigin:](self, "setItemsOrigin:", v4);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_observers;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "collector:didUpdateItemsOrigin:", self, -[FPSpotlightCollector itemsOrigin](self, "itemsOrigin", (_QWORD)v10));
        }
        while (v7 != v9);
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (unint64_t)itemsOrigin
{
  return self->_itemsOrigin;
}

- (unint64_t)_itemsOriginForItems:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[5];
  id v12;

  v3 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__3;
  v11[4] = __Block_byref_object_dispose__3;
  v12 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__FPSpotlightCollector__itemsOriginForItems___block_invoke;
  v6[3] = &unk_1E444B808;
  v6[4] = v11;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);

  return v4;
}

- (void)_removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightCollector _removeObserver:].cold.1();

  -[NSMutableSet removeObject:](self->_observers, "removeObject:", v4);
  if (!-[NSMutableSet count](self->_observers, "count"))
  {
    -[FPSpotlightCollector queryDescriptor](self, "queryDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "keepCollectorsAlive");

    if ((v7 & 1) == 0)
    {
      -[FPSpotlightCollector _stop](self, "_stop");
      -[FPSpotlightCollector delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collectorDidFinish:", self);

    }
  }

}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_6(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "queryDidFinishGathering:", v2);

}

- (void)queryDidFinishGathering:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v5 = -[FPSpotlightCollector isQueryCancelled:](self, "isQueryCancelled:", v4);
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[FPSpotlightCollector description](self, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v27 = v19;
    v28 = 2112;
    if (v5)
      v20 = CFSTR("YES");
    v29 = (uint64_t)v20;
    v30 = 2112;
    v31 = v4;
    _os_log_debug_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Query did finish gathering (cancelled: %@): %@", buf, 0x20u);

  }
  if (!v5)
  {
    -[FPSpotlightCollector setNeedsItemsOriginUpdate](self, "setNeedsItemsOriginUpdate");
    self->_gathering = 0;
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[FPSpotlightCollector queryDidFinishGathering:].cold.1();
    v21 = v4;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = self->_observers;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1A1B00664]();
          -[FPSpotlightCollector allItemsForObserver:](self, "allItemsForObserver:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          fp_current_or_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            -[FPSpotlightCollector description](self, "description");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v15, "count");
            *(_DWORD *)buf = 138413058;
            v27 = v17;
            v28 = 2048;
            v29 = v18;
            v30 = 2112;
            v31 = v13;
            v32 = 2112;
            v33 = v15;
            _os_log_debug_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → %ld item(s) to observer %@: %@", buf, 0x2Au);

          }
          objc_msgSend(v13, "collector:didGatherItems:", self, v15);

          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v10);
    }

    v4 = v21;
  }

}

- (BOOL)isQueryCancelled:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FPSpotlightCollector queries](self, "queries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1;
}

void __36__FPSpotlightCollector_addObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_addObserver:", *(_QWORD *)(a1 + 32));

}

- (void)_addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  if ((-[NSMutableSet containsObject:](self->_observers, "containsObject:", v4) & 1) == 0)
    -[NSMutableSet addObject:](self->_observers, "addObject:", v4);
  if (self->_suspended)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[FPSpotlightCollector _addObserver:].cold.1();

  }
  else
  {
    if (!self->_gathering)
    {
      -[FPSpotlightCollector allItemsForObserver:](self, "allItemsForObserver:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[FPSpotlightCollector description](self, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412802;
        v12 = v10;
        v13 = 2112;
        v14 = v4;
        v15 = 2048;
        v16 = objc_msgSend(v6, "count");
        _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Adding observer %@: gathering %ld items", (uint8_t *)&v11, 0x20u);

      }
      objc_msgSend(v4, "collector:didGatherItems:", self, v6);

    }
    -[FPSpotlightCollector queries](self, "queries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
      -[FPSpotlightCollector _start](self, "_start");
  }

}

- (NSMutableArray)queries
{
  return self->_queries;
}

- (id)allItemsForObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  NSObject *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  NSUInteger v24;
  __int16 v25;
  void *v26;
  _QWORD v27[4];
  NSRange v28;

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FPSpotlightCollector allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightCollector filterItems:forObserver:excludedItemIDs:](self, "filterItems:forObserver:excludedItemIDs:", v5, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "maximumNumberOfItems");

  if (objc_msgSend(v6, "count") > v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastUsedDate"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("contentModificationDate"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v9;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("displayName"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortUsingDescriptors:", v11);

    v12 = objc_msgSend(v6, "count") - v7;
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[FPSpotlightCollector description](self, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v6, "count");
      v28.location = v7;
      v28.length = v12;
      NSStringFromRange(v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v16;
      v21 = 2048;
      v22 = v17;
      v23 = 2048;
      v24 = v7;
      v25 = 2112;
      v26 = v18;
      _os_log_debug_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Too many results (%ld > %ld), will cut off the items in range %@.", (uint8_t *)&v19, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v7, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsAtIndexes:", v14);

  }
  return v6;
}

- (id)filterItems:(id)a3 forObserver:(id)a4 excludedItemIDs:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  FPSpotlightCollector *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v10 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count")));
    *a5 = v10;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v9, "itemPredicateForCollector:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64__FPSpotlightCollector_filterItems_forObserver_excludedItemIDs___block_invoke;
  v19[3] = &unk_1E444B678;
  v20 = v11;
  v21 = self;
  v13 = v12;
  v22 = v13;
  v23 = v10;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v19);
  v16 = v23;
  v17 = v13;

  return v17;
}

- (void)_start
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_6_3();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v5, v6, "[DEBUG] %@: Mount point(s) for %{public}@: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_9_1();
}

- (FPSpotlightQueryDescriptor)queryDescriptor
{
  return self->_queryDescriptor;
}

- (void)setQueries:(id)a3
{
  objc_storeStrong((id *)&self->_queries, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (id)_mountPointsForDescriptor
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[FPSpotlightCollector queryDescriptor](self, "queryDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsQueryingAllMountPoints");

  if (v4
    && (-[FPSpotlightCollector delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[FPSpotlightCollector delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mountPointsForCollector:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (FPSpotlightCollectorDelegate)delegate
{
  return (FPSpotlightCollectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)_createQueriesForMountPoints:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[FPSpotlightCollector _createQueryForMountPoint:](self, "_createQueryForMountPoint:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_createQueryForMountPoint:(id)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  objc_class *v24;
  NSObject *v25;
  void *v26;
  OS_dispatch_queue *v27;
  OS_dispatch_queue *v28;
  id v29;
  void *v30;
  OS_dispatch_queue *v31;
  id v32;
  OS_dispatch_queue *v33;
  id v34;
  OS_dispatch_queue *v35;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  id *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  OS_dispatch_queue *v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  OS_dispatch_queue *v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  OS_dispatch_queue *v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  OS_dispatch_queue *v60;
  id v61;
  id v62;
  id v63;
  id from;
  id *p_from;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  _BYTE location[24];
  void *v72;
  id *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  -[FPSpotlightCollector queryDescriptor](self, "queryDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryStringForMountPoint:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v6 = objc_msgSend(v5, "supportsSemanticSearch");
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      from = 0;
      p_from = &from;
      v66 = 0x2050000000;
      v8 = (id)getCSUserQueryContextClass_softClass;
      v67 = getCSUserQueryContextClass_softClass;
      if (!getCSUserQueryContextClass_softClass)
      {
        *(_QWORD *)location = MEMORY[0x1E0C809B0];
        *(_QWORD *)&location[8] = 3221225472;
        *(_QWORD *)&location[16] = __getCSUserQueryContextClass_block_invoke;
        v72 = &unk_1E444B188;
        v73 = &from;
        __getCSUserQueryContextClass_block_invoke((uint64_t)location);
        v8 = p_from[3];
      }
      v9 = (objc_class *)objc_retainAutorelease(v8);
      _Block_object_dispose(&from, 8);
      v10 = objc_alloc_init(v9);
      objc_msgSend(v10, "setEnableRankedResults:", 0);
    }
    else
    {
      from = 0;
      p_from = &from;
      v66 = 0x2050000000;
      v12 = (id)getCSSearchQueryContextClass_softClass;
      v67 = getCSSearchQueryContextClass_softClass;
      if (!getCSSearchQueryContextClass_softClass)
      {
        *(_QWORD *)location = MEMORY[0x1E0C809B0];
        *(_QWORD *)&location[8] = 3221225472;
        *(_QWORD *)&location[16] = __getCSSearchQueryContextClass_block_invoke;
        v72 = &unk_1E444B188;
        v73 = &from;
        __getCSSearchQueryContextClass_block_invoke((uint64_t)location);
        v12 = p_from[3];
      }
      v13 = (objc_class *)objc_retainAutorelease(v12);
      _Block_object_dispose(&from, 8);
      v10 = objc_alloc_init(v13);
    }
    FPDefaultFetchedAttributes();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFetchAttributes:", v14);

    objc_msgSend(v10, "setLive:", 1);
    if (objc_msgSend(v5, "desiredCount") != -1)
      objc_msgSend(v10, "setMaxCount:", objc_msgSend(v5, "desiredCount"));
    if ((objc_msgSend(v43, "isEqualToString:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier")) & 1) == 0)
    {
      v70 = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMountPoints:", v15);

    }
    objc_msgSend(v5, "augmentQueryContext:", v10);
    if (objc_msgSend(v5, "supportsSemanticSearch"))
    {
      objc_msgSend(v5, "settings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "searchQuery");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "userQueryString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      from = 0;
      p_from = &from;
      v66 = 0x2050000000;
      v19 = (id)getCSUserQueryClass_softClass;
      v67 = getCSUserQueryClass_softClass;
      if (!getCSUserQueryClass_softClass)
      {
        *(_QWORD *)location = v7;
        *(_QWORD *)&location[8] = 3221225472;
        *(_QWORD *)&location[16] = __getCSUserQueryClass_block_invoke;
        v72 = &unk_1E444B188;
        v73 = &from;
        __getCSUserQueryClass_block_invoke((uint64_t)location);
        v19 = p_from[3];
      }
      v20 = (objc_class *)objc_retainAutorelease(v19);
      _Block_object_dispose(&from, 8);
      v21 = (void *)objc_msgSend([v20 alloc], "initWithUserQueryString:userQueryContext:", v18, v10);
      v69 = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFilterQueries:", v22);

    }
    else
    {
      from = 0;
      p_from = &from;
      v66 = 0x2050000000;
      v23 = (id)getCSSearchQueryClass_softClass;
      v67 = getCSSearchQueryClass_softClass;
      if (!getCSSearchQueryClass_softClass)
      {
        *(_QWORD *)location = v7;
        *(_QWORD *)&location[8] = 3221225472;
        *(_QWORD *)&location[16] = __getCSSearchQueryClass_block_invoke;
        v72 = &unk_1E444B188;
        v73 = &from;
        __getCSSearchQueryClass_block_invoke((uint64_t)location);
        v23 = p_from[3];
      }
      v24 = (objc_class *)objc_retainAutorelease(v23);
      _Block_object_dispose(&from, 8);
      v21 = (void *)objc_msgSend([v24 alloc], "initWithQueryString:context:", v42, v10);
    }
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (id *)objc_claimAutoreleasedReturnValue();
      -[FPSpotlightCollector queryDescriptor](self, "queryDescriptor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPSpotlightCollector.m"), 875, CFSTR("Unable to create query for descriptor '%@'"), v40);

    }
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      -[FPSpotlightCollector description](self, "description");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = v37;
      *(_WORD *)&location[12] = 2112;
      *(_QWORD *)&location[14] = v43;
      *(_WORD *)&location[22] = 2112;
      v72 = v21;
      _os_log_debug_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Creating query for mount point '%@': %@", location, 0x20u);

    }
    -[NSMapTable setObject:forKey:](self->_queryToMountPoint, "setObject:forKey:", v43, v21);
    v68 = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setProtectionClasses:", v26);

    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, v21);
    from = 0;
    objc_initWeak(&from, self);
    v27 = self->_processingQueue;
    v59[0] = v7;
    v59[1] = 3221225472;
    v59[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke;
    v59[3] = &unk_1E444B718;
    v28 = v27;
    v60 = v28;
    v29 = v43;
    v61 = v29;
    objc_copyWeak(&v62, &from);
    objc_copyWeak(&v63, (id *)location);
    objc_msgSend(v21, "setFoundItemsHandler:", v59);
    objc_msgSend(v21, "foundItemsHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setChangedItemsHandler:", v30);

    v54[0] = v7;
    v54[1] = 3221225472;
    v54[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_3;
    v54[3] = &unk_1E444B768;
    v31 = v28;
    v55 = v31;
    v32 = v29;
    v56 = v32;
    objc_copyWeak(&v57, &from);
    objc_copyWeak(&v58, (id *)location);
    objc_msgSend(v21, "setRemovedItemsHandler:", v54);
    v49[0] = v7;
    v49[1] = 3221225472;
    v49[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_5;
    v49[3] = &unk_1E444B7B8;
    v33 = v31;
    v50 = v33;
    v34 = v32;
    v51 = v34;
    objc_copyWeak(&v52, &from);
    objc_copyWeak(&v53, (id *)location);
    objc_msgSend(v21, "setGatherEndedHandler:", v49);
    v44[0] = v7;
    v44[1] = 3221225472;
    v44[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_7;
    v44[3] = &unk_1E444B7E0;
    v35 = v33;
    v45 = v35;
    v46 = v34;
    objc_copyWeak(&v47, &from);
    objc_copyWeak(&v48, (id *)location);
    objc_msgSend(v21, "setCompletionHandler:", v44);
    v11 = v21;
    objc_destroyWeak(&v48);
    objc_destroyWeak(&v47);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&v52);

    objc_destroyWeak(&v58);
    objc_destroyWeak(&v57);

    objc_destroyWeak(&v63);
    objc_destroyWeak(&v62);

    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __45__FPSpotlightCollector__itemsOriginForItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(a2, "providerIDForDeduplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  v10 = v6;
  if (v9)
  {
    if ((objc_msgSend(v6, "isEqualToString:") & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    objc_storeStrong(v8, v6);
  }

}

uint64_t __39__FPSpotlightCollector_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FPSpotlightCollector_addObserver___block_invoke;
  block[3] = &unk_1E444B628;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FPSpotlightCollector_removeObserver___block_invoke;
  block[3] = &unk_1E4449A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(processingQueue, block);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FPSpotlightCollector)initWithDescriptor:(id)a3
{
  id v5;
  FPSpotlightCollector *v6;
  FPSpotlightCollector *v7;
  uint64_t v8;
  OS_dispatch_queue *processingQueue;
  uint64_t v10;
  NSMutableArray *queries;
  uint64_t v12;
  NSMapTable *queryToMountPoint;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPSpotlightCollector;
  v6 = -[FPSpotlightCollector init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queryDescriptor, a3);
    objc_msgSend((id)objc_opt_class(), "processingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    queries = v7->_queries;
    v7->_queries = (NSMutableArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 261, 256, 10);
    queryToMountPoint = v7->_queryToMountPoint;
    v7->_queryToMountPoint = (NSMapTable *)v12;

    -[FPSpotlightCollector _clear](v7, "_clear");
  }

  return v7;
}

- (void)_clear
{
  NSMutableSet *v3;
  NSMutableSet *observers;
  NSMutableDictionary *v5;
  NSMutableDictionary *itemsByBundleAndCSID;
  NSMutableDictionary *v7;
  NSMutableDictionary *itemsByProviderAndCollaborationIdentifier;

  v3 = (NSMutableSet *)objc_opt_new();
  observers = self->_observers;
  self->_observers = v3;

  self->_gathering = 1;
  v5 = (NSMutableDictionary *)objc_opt_new();
  itemsByBundleAndCSID = self->_itemsByBundleAndCSID;
  self->_itemsByBundleAndCSID = v5;

  v7 = (NSMutableDictionary *)objc_opt_new();
  itemsByProviderAndCollaborationIdentifier = self->_itemsByProviderAndCollaborationIdentifier;
  self->_itemsByProviderAndCollaborationIdentifier = v7;

}

+ (id)processingQueue
{
  if (processingQueue_onceToken != -1)
    dispatch_once(&processingQueue_onceToken, &__block_literal_global_11);
  return (id)processingQueue_processingQueue;
}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_6;
  block[3] = &unk_1E444B790;
  v2 = *(NSObject **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_copyWeak(&v6, (id *)(a1 + 56));
  dispatch_async(v2, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

}

void __39__FPSpotlightCollector_processingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.DocumentManager.Spotlight.processingQueue", v2);
  v1 = (void *)processingQueue_processingQueue;
  processingQueue_processingQueue = (uint64_t)v0;

}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_2;
  v6[3] = &unk_1E444B6F0;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(&v10, (id *)(a1 + 56));
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);

}

+ (id)_recursiveDescription
{
  void *v2;
  void *v3;

  +[FPSpotlightCollectorManager sharedInstance](FPSpotlightCollectorManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recursiveDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FPSpotlightCollector)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPSpotlightCollector.m"), 119, CFSTR("UNREACHABLE: call -initWithDescriptor: instead"));

  return -[FPSpotlightCollector initWithDescriptor:](self, "initWithDescriptor:", 0);
}

- (id)description
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
  -[FPSpotlightCollector queryDescriptor](self, "queryDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p n:%@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isSuspended
{
  NSObject *processingQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__FPSpotlightCollector_isSuspended__block_invoke;
  v5[3] = &unk_1E444B600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__FPSpotlightCollector_isSuspended__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (id)allObservers
{
  return (id)-[NSMutableSet copy](self->_observers, "copy");
}

- (void)_stop
{
  const char *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_6_3();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "queries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  NSStringFromSelector(v0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v6, v7, "[DEBUG] %@: About to cancel %ld queries (%@).", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_9_1();
}

- (void)suspend
{
  NSObject *processingQueue;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__FPSpotlightCollector_suspend__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_sync(processingQueue, block);
}

_BYTE *__31__FPSpotlightCollector_suspend__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
  {
    result = (_BYTE *)objc_msgSend(result, "_stop");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  }
  return result;
}

- (void)resume
{
  NSObject *processingQueue;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__FPSpotlightCollector_resume__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_sync(processingQueue, block);
}

_BYTE *__30__FPSpotlightCollector_resume__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[24])
  {
    result = (_BYTE *)objc_msgSend(result, "_start");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
  return result;
}

- (void)mountPointsDidChange:(id)a3
{
  id v5;
  NSObject *processingQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FPSpotlightCollector_mountPointsDidChange___block_invoke;
  block[3] = &unk_1E444B650;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(processingQueue, block);

}

void __45__FPSpotlightCollector_mountPointsDidChange___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "count") && (v2 = *(_BYTE **)(a1 + 32), !v2[24]))
  {
    objc_msgSend(v2, "queryDescriptor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsQueryingAllMountPoints");

    if (v4)
    {
      v41 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (id)objc_opt_new();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "queries");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v53;
        v39 = v6;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v53 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 32), "_mountPointForExistingSearchQuery:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("FPSpotlightCollector.m"), 288, CFSTR("Shouldn't be nil."));

            }
            if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12))
            {
              objc_msgSend(v41, "removeObject:", v12);
            }
            else
            {
              if (objc_msgSend(v12, "isEqualToString:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier")))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("FPSpotlightCollector.m"), 296, CFSTR("The default mount point should never be removed."));

              }
              fp_current_or_default_log();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(*(id *)(a1 + 32), "description");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(*(SEL *)(a1 + 48));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v57 = v14;
                v58 = 2112;
                v59 = (uint64_t)v11;
                v60 = 2112;
                v61 = (uint64_t)v40;
                _os_log_debug_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Cancelling query %@ (%@)", buf, 0x20u);

                v6 = v39;
              }

              objc_msgSend(v11, "cancel");
              objc_msgSend(v43, "addObject:", v11);
              objc_msgSend(*(id *)(a1 + 32), "_removeItemsForQuery:mountPoint:", v11, v12);
            }

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
        }
        while (v8);
      }

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v17 = v41;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v49 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(a1 + 32), "_createQueryForMountPoint:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v22);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
        }
        while (v19);
      }

      objc_msgSend(*(id *)(a1 + 32), "queries");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeObjectsInArray:", v43);

      objc_msgSend(*(id *)(a1 + 32), "queries");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObjectsFromArray:", v5);

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v25 = v5;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v45;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v45 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
            fp_current_or_default_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(*(id *)(a1 + 32), "description");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v57 = v32;
              v58 = 2048;
              v59 = (uint64_t)v30;
              _os_log_debug_impl(&dword_1A0A34000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Starting query %p", buf, 0x16u);

            }
            objc_msgSend(v30, "start");
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
        }
        while (v27);
      }

      fp_current_or_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "description");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "queries");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");
        v37 = objc_msgSend(v43, "count");
        v38 = objc_msgSend(v25, "count");
        *(_DWORD *)buf = 138413058;
        v57 = v34;
        v58 = 2048;
        v59 = v36;
        v60 = 2048;
        v61 = v37;
        v62 = 2048;
        v63 = v38;
        _os_log_debug_impl(&dword_1A0A34000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Number of queries after mount points changed: %ld (cancelled %ld old query/ies, started %ld new query/ies).", buf, 0x2Au);

      }
    }
  }
  else
  {

  }
}

- (BOOL)_shouldFilterUpdatesForObserver:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[FPSpotlightCollector _shouldRemoveItemsFromObserver:](self, "_shouldRemoveItemsFromObserver:", v4))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "itemPredicateForCollector:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (BOOL)_shouldRemoveItemsFromObserver:(id)a3
{
  return objc_msgSend(a3, "maximumNumberOfItems") == -1;
}

- (id)_mountPointForExistingSearchQuery:(id)a3
{
  NSObject *processingQueue;
  id v5;
  void *v6;

  processingQueue = self->_processingQueue;
  v5 = a3;
  dispatch_assert_queue_V2(processingQueue);
  -[NSMapTable objectForKey:](self->_queryToMountPoint, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_allItemsForMountPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByBundleAndCSID, "objectForKeyedSubscript:", CFSTR("com.apple.filesystems.UserFS.FileProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3880];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__FPSpotlightCollector__allItemsForMountPoint___block_invoke;
    v12[3] = &unk_1E444B6C8;
    v13 = v4;
    objc_msgSend(v8, "predicateWithBlock:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

uint64_t __47__FPSpotlightCollector__allItemsForMountPoint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)query:(id)a3 didRemoveItemsWithCSIdentifiers:(id)a4 inBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  FPSpotlightCollector *v37;
  NSMutableSet *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  NSMutableDictionary *itemsByProviderAndCollaborationIdentifier;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableDictionary *v56;
  void *v57;
  void *v58;
  NSMutableDictionary *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  _BOOL4 v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  id obj;
  NSMutableSet *obja;
  void *v87;
  void *v88;
  FPSpotlightCollector *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint8_t v114[128];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  id v118;
  __int16 v119;
  const char *v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  id v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v89 = self;
  if (!-[FPSpotlightCollector isQueryCancelled:](self, "isQueryCancelled:", v8))
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[FPSpotlightCollector description](self, "description");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v116 = v79;
      v117 = 2112;
      v118 = v8;
      v119 = 2080;
      v120 = "removed";
      v121 = 2048;
      v122 = objc_msgSend(v9, "count");
      v123 = 2112;
      v124 = v9;
      _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Did remove items for query:%@ (%s %ld items) %@", buf, 0x34u);

    }
    if (v10)
    {
      if (!self->_gathering)
      {
        v81 = v8;
        v82 = v10;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByBundleAndCSID, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = (void *)objc_opt_new();
        v87 = (void *)objc_opt_new();
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v80 = v9;
        obj = v9;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
        v84 = v12;
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v107;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v107 != v15)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
              objc_msgSend(v12, "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v18)
              {
                objc_msgSend(v18, "itemID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "addObject:", v20);

                objc_msgSend(v87, "addObject:", v19);
                objc_msgSend(v19, "providerIDForDeduplication");
                v21 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "collaborationIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "collaborationIdentifier");
                v23 = objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v24 = (void *)v23;
                  -[NSMutableDictionary objectForKeyedSubscript:](v89->_itemsByProviderAndCollaborationIdentifier, "objectForKeyedSubscript:", v21);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "objectForKeyedSubscript:", v22);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v26, "isEqual:", v19);

                  v12 = v84;
                  if (v27)
                  {
                    -[NSMutableDictionary objectForKeyedSubscript:](v89->_itemsByProviderAndCollaborationIdentifier, "objectForKeyedSubscript:", v21);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, v22);

                  }
                }

              }
              else
              {
                fp_current_or_default_log();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  -[FPSpotlightCollector description](v89, "description");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v116 = v29;
                  v117 = 2112;
                  v118 = v17;
                  _os_log_error_impl(&dword_1A0A34000, v21, OS_LOG_TYPE_ERROR, "[ERROR] %@: Unable to obtain item for identifier %@ when items have been removed from query results.", buf, 0x16u);

                }
              }

            }
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
          }
          while (v14);
        }

        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v30 = obj;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
        v10 = v82;
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v103;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v103 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * j);
              -[NSMutableDictionary objectForKeyedSubscript:](v89->_itemsByBundleAndCSID, "objectForKeyedSubscript:", v82);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", 0, v35);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
          }
          while (v32);
        }

        if (objc_msgSend(v88, "count"))
        {
          v37 = v89;
          if (!-[FPSpotlightCollector _areItemsTransientFromBundleIdentifier:](v89, "_areItemsTransientFromBundleIdentifier:", v82))
          {
            v100 = 0u;
            v101 = 0u;
            v98 = 0u;
            v99 = 0u;
            v38 = v89->_observers;
            v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
            if (v39)
            {
              v40 = v39;
              v41 = *(_QWORD *)v99;
              while (2)
              {
                for (k = 0; k != v40; ++k)
                {
                  if (*(_QWORD *)v99 != v41)
                    objc_enumerationMutation(v38);
                  if (!-[FPSpotlightCollector _shouldRemoveItemsFromObserver:](v89, "_shouldRemoveItemsFromObserver:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * k)))
                  {

                    -[FPSpotlightCollector _regather](v89, "_regather");
                    goto LABEL_73;
                  }
                }
                v40 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
                if (v40)
                  continue;
                break;
              }
            }

            v37 = v89;
          }
          v43 = (void *)objc_opt_new();
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          -[FPSpotlightCollector allItems](v37, "allItems");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v95;
            do
            {
              for (m = 0; m != v46; ++m)
              {
                if (*(_QWORD *)v95 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * m);
                objc_msgSend(v49, "collaborationIdentifier");
                v50 = (void *)objc_claimAutoreleasedReturnValue();

                if (v50)
                {
                  itemsByProviderAndCollaborationIdentifier = v89->_itemsByProviderAndCollaborationIdentifier;
                  objc_msgSend(v49, "providerIDForDeduplication");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary objectForKeyedSubscript:](itemsByProviderAndCollaborationIdentifier, "objectForKeyedSubscript:", v52);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "collaborationIdentifier");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:", v54);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v55)
                  {
                    v56 = v89->_itemsByProviderAndCollaborationIdentifier;
                    objc_msgSend(v49, "providerIDForDeduplication");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v57);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v58)
                    {
                      v58 = (void *)objc_opt_new();
                      v59 = v89->_itemsByProviderAndCollaborationIdentifier;
                      objc_msgSend(v49, "providerIDForDeduplication");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v58, v60);

                    }
                    objc_msgSend(v49, "collaborationIdentifier");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "setObject:forKeyedSubscript:", v49, v61);

                    objc_msgSend(v43, "addObject:", v49);
                  }
                }
              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
            }
            while (v46);
          }

          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          obja = v89->_observers;
          v62 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
          if (v62)
          {
            v63 = v62;
            v64 = *(_QWORD *)v91;
            do
            {
              v65 = 0;
              v83 = v63;
              do
              {
                if (*(_QWORD *)v91 != v64)
                  objc_enumerationMutation(obja);
                v66 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v65);
                v67 = (void *)MEMORY[0x1A1B00664]();
                if (-[FPSpotlightCollector _shouldFilterUpdatesForObserver:](v89, "_shouldFilterUpdatesForObserver:", v66))
                {
                  v68 = v43;
                  v69 = v64;
                  -[FPSpotlightCollector filterItems:forObserver:excludedItemIDs:](v89, "filterItems:forObserver:excludedItemIDs:", v87, v66, 0);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "fp_itemIDs");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v72 = objc_msgSend(v71, "count");
                  fp_current_or_default_log();
                  v73 = objc_claimAutoreleasedReturnValue();
                  v74 = os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG);
                  if (v72)
                  {
                    if (v74)
                    {
                      -[FPSpotlightCollector description](v89, "description");
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v116 = v77;
                      v117 = 2112;
                      v118 = v66;
                      v119 = 2112;
                      v120 = (const char *)v71;
                      _os_log_debug_impl(&dword_1A0A34000, v73, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Observer:%@ to remove: %@", buf, 0x20u);

                    }
                    objc_msgSend(v66, "collector:didRemoveItemIDs:", v89, v71);
                  }
                  else
                  {
                    if (v74)
                    {
                      -[FPSpotlightCollector description](v89, "description");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v116 = v78;
                      v117 = 2112;
                      v118 = v66;
                      _os_log_debug_impl(&dword_1A0A34000, v73, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Nothing to send to observer:%@", buf, 0x16u);

                    }
                  }

                  v64 = v69;
                  v43 = v68;
                  v63 = v83;
                }
                else
                {
                  fp_current_or_default_log();
                  v75 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
                  {
                    -[FPSpotlightCollector description](v89, "description");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v116 = v76;
                    v117 = 2112;
                    v118 = v66;
                    v119 = 2112;
                    v120 = (const char *)v88;
                    _os_log_debug_impl(&dword_1A0A34000, v75, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: → Observer:%@ to receive delta deletion updates: %@", buf, 0x20u);

                  }
                  objc_msgSend(v66, "collector:didRemoveItemIDs:", v89, v88);
                }
                if (objc_msgSend(v43, "count"))
                  objc_msgSend(v66, "collector:didUpdateItems:", v89, v43);
                objc_autoreleasePoolPop(v67);
                ++v65;
              }
              while (v63 != v65);
              v63 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
            }
            while (v63);
          }

          -[FPSpotlightCollector setNeedsItemsOriginUpdate](v89, "setNeedsItemsOriginUpdate");
          v10 = v82;
          v12 = v84;
        }
LABEL_73:

        v9 = v80;
        v8 = v81;
      }
    }
  }

}

- (void)query:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSMutableSet *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  int v28;
  NSDate *lastStartOfRecovery;
  double v30;
  NSDate *v31;
  NSDate *v32;
  unint64_t numberOfRecoveryAttempts;
  unint64_t *p_numberOfRecoveryAttempts;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  id v47;
  _BYTE buf[24];
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  if (!-[FPSpotlightCollector isQueryCancelled:](self, "isQueryCancelled:", v6))
  {
    if (!self->_gathering)
      -[FPSpotlightCollector queryDidFinishGathering:](self, "queryDidFinishGathering:", v6);
    -[FPSpotlightCollector _mountPointForExistingSearchQuery:](self, "_mountPointForExistingSearchQuery:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier"));
    else
      v10 = 1;
    objc_msgSend(v7, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v12 = (_QWORD *)getCSSearchQueryErrorDomainSymbolLoc_ptr;
    v49 = getCSSearchQueryErrorDomainSymbolLoc_ptr;
    if (!getCSSearchQueryErrorDomainSymbolLoc_ptr)
    {
      v13 = (void *)CoreSpotlightLibrary_0();
      v12 = dlsym(v13, "CSSearchQueryErrorDomain");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v12;
      getCSSearchQueryErrorDomainSymbolLoc_ptr = (uint64_t)v12;
    }
    _Block_object_dispose(buf, 8);
    if (!v12)
      -[FPSpotlightCollector query:didFinishWithError:].cold.1();
    v14 = objc_msgSend(v11, "isEqualToString:", *v12);

    objc_msgSend(v7, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[FPSpotlightCollector description](self, "description");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v49 = (uint64_t)v7;
      _os_log_debug_impl(&dword_1A0A34000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Did finish query:%p with error: %@", buf, 0x20u);

    }
    if ((v14 & 1) != 0)
    {
      if (objc_msgSend(v7, "code") == -2003)
      {
        fp_current_or_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[FPSpotlightCollector query:didFinishWithError:].cold.2();
LABEL_32:

        -[FPSpotlightCollector _removeItemsForQuery:mountPoint:](self, "_removeItemsForQuery:mountPoint:", v6, v9);
        -[FPSpotlightCollector queries](self, "queries");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeObject:", v6);

LABEL_33:
        goto LABEL_34;
      }
      if (objc_msgSend(v7, "code") == -2002)
      {
        fp_current_or_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          -[FPSpotlightCollector description](self, "description");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPSpotlightCollector description](self, "description");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "queryString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v39;
          *(_WORD *)&buf[22] = 2114;
          v49 = (uint64_t)v7;
          v50 = 2114;
          v51 = v40;
          _os_log_debug_impl(&dword_1A0A34000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Stopped searching for %{public}@: %{public}@, since query seems invalid: %{public}@", buf, 0x2Au);

        }
LABEL_24:

        v20 = (void *)MEMORY[0x1E0CB35C8];
        v46 = *MEMORY[0x1E0CB3388];
        v47 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.FileProvider.Spotlight"), 0, v21);
        v18 = objc_claimAutoreleasedReturnValue();

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v22 = self->_observers;
        v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v42 != v24)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "collector:didEncounterError:", self, v18, (_QWORD)v41);
            }
            v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v23);
        }

        goto LABEL_32;
      }
    }
    else if (!v16 || objc_msgSend(v7, "code") != 4097)
    {
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      v18 = v19;
      if (!v7)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[FPSpotlightCollector query:didFinishWithError:].cold.6(self);
        goto LABEL_32;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[FPSpotlightCollector query:didFinishWithError:].cold.7();
      goto LABEL_24;
    }
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[FPSpotlightCollector query:didFinishWithError:].cold.5();

    if (v14)
    {
      v28 = objc_msgSend(v7, "code") == -2000 ? v10 : 1;
      if (v28 != 1)
        goto LABEL_33;
    }
    lastStartOfRecovery = self->_lastStartOfRecovery;
    if (lastStartOfRecovery
      && (-[NSDate timeIntervalSinceNow](lastStartOfRecovery, "timeIntervalSinceNow"), v30 >= -15.0))
    {
      p_numberOfRecoveryAttempts = &self->_numberOfRecoveryAttempts;
      numberOfRecoveryAttempts = self->_numberOfRecoveryAttempts;
      if (numberOfRecoveryAttempts > 5)
      {
        fp_current_or_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[FPSpotlightCollector query:didFinishWithError:].cold.4();
        goto LABEL_24;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v31 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v32 = self->_lastStartOfRecovery;
      self->_lastStartOfRecovery = v31;

      numberOfRecoveryAttempts = 0;
      self->_numberOfRecoveryAttempts = 0;
      p_numberOfRecoveryAttempts = &self->_numberOfRecoveryAttempts;
    }
    *p_numberOfRecoveryAttempts = numberOfRecoveryAttempts + 1;
    fp_current_or_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[FPSpotlightCollector query:didFinishWithError:].cold.3();

    -[FPSpotlightCollector _removeItemsForQuery:mountPoint:](self, "_removeItemsForQuery:mountPoint:", v6, v9);
    -[FPSpotlightCollector queries](self, "queries");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeObject:", v6);

    -[FPSpotlightCollector _regather](self, "_regather");
    goto LABEL_33;
  }
LABEL_34:

}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_4;
  block[3] = &unk_1E444B740;
  v7 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  objc_copyWeak(&v14, (id *)(a1 + 48));
  objc_copyWeak(&v15, (id *)(a1 + 56));
  v12 = v6;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);

}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_4(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "query:didRemoveItemsWithCSIdentifiers:inBundle:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_8;
  v6[3] = &unk_1E444B6F0;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(&v10, (id *)(a1 + 56));
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);

}

void __50__FPSpotlightCollector__createQueryForMountPoint___block_invoke_8(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "query:didFinishWithError:", v2, *(_QWORD *)(a1 + 40));

}

- (void)_regather
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Regathering", (uint8_t *)&v4, 0xCu);

}

- (void)_removeItemsForQuery:(id)a3 mountPoint:(id)a4
{
  id v6;
  NSObject *processingQueue;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  processingQueue = self->_processingQueue;
  v8 = a4;
  dispatch_assert_queue_V2(processingQueue);
  -[FPSpotlightCollector _allItemsForMountPoint:](self, "_allItemsForMountPoint:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__FPSpotlightCollector__removeItemsForQuery_mountPoint___block_invoke;
  v16[3] = &unk_1E444B830;
  v17 = v9;
  v11 = v9;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __56__FPSpotlightCollector__removeItemsForQuery_mountPoint___block_invoke_2;
  v14[3] = &unk_1E444B858;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

}

void __56__FPSpotlightCollector__removeItemsForQuery_mountPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11 = v3;
  objc_msgSend(v3, "providerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v11, "providerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  objc_msgSend(v11, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coreSpotlightIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

}

uint64_t __56__FPSpotlightCollector__removeItemsForQuery_mountPoint___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "query:didRemoveItemsWithCSIdentifiers:inBundle:", *(_QWORD *)(a1 + 40), a3, a2);
}

- (BOOL)_areItemsTransientFromBundleIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider"));
}

- (void)setItemsOrigin:(unint64_t)a3
{
  self->_itemsOrigin = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)isGathering
{
  return self->_gathering;
}

- (void)setGathering:(BOOL)a3
{
  self->_gathering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queryToMountPoint, 0);
  objc_storeStrong((id *)&self->_lastStartOfRecovery, 0);
  objc_storeStrong((id *)&self->_itemsByProviderAndCollaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_itemsByBundleAndCSID, 0);
}

- (void)_addObserver:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_3();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v4, v5, "[DEBUG] %@: Adding observer %{public}@, but not delivering items or starting query, since collector is suspended; %@",
    v6,
    v7,
    v8,
    v9,
    v10);

  OUTLINED_FUNCTION_11_1();
}

- (void)_removeObserver:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_27_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v2, v3, "[DEBUG] %@: Removing observer %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __64__FPSpotlightCollector_filterItems_forObserver_excludedItemIDs___block_invoke_cold_1()
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_27_0();
  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  _os_log_error_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_ERROR, "[ERROR] %@: Cannot find entry for %@ in _itemsByCollaborationIdentifier map", v3, 0x16u);

  OUTLINED_FUNCTION_7();
}

- (void)queryDidFinishGathering:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_27_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v2, v3, "[DEBUG] %@: Did finish gathering items for query:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)query:didFinishWithError:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCSSearchQueryErrorDomain(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSpotlightCollector.m"), 33, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)query:didFinishWithError:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_3();
  objc_msgSend(v1, "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13_1(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v3, v4, "[DEBUG] %@: Stopped searching for %{public}@: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11_1();
}

- (void)query:didFinishWithError:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5_3();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v4, v5, "[DEBUG] %@: Will attempt (attempt #%ld) to relaunch query for %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_11_1();
}

- (void)query:didFinishWithError:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5_3();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v4, v5, "[DEBUG] %@: Will NOT attempt (attempt #%ld) to relaunch query for %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_11_1();
}

- (void)query:didFinishWithError:.cold.5()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_3();
  objc_msgSend(v1, "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13_1(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8_2(&dword_1A0A34000, v3, v4, "[ERROR] %@: Spotlight error occured while searching for %{public}@: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11_1();
}

- (void)query:(void *)a1 didFinishWithError:.cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13_1(), "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v2, v3, "[DEBUG] %@: Finished searching for %{public}@: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11_1();
}

- (void)query:didFinishWithError:.cold.7()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_3();
  objc_msgSend(v1, "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13_1(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8_2(&dword_1A0A34000, v3, v4, "[ERROR] %@: Unknown error occured while searching for %{public}@: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11_1();
}

@end
