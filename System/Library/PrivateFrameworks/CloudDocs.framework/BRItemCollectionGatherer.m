@implementation BRItemCollectionGatherer

- (BRItemCollectionGatherer)initWithDelegate:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  BRItemCollectionGatherer *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *itemIDToItemCollectionMap;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSPredicate *predicate;
  NSMutableSet *v17;
  NSMutableSet *watchedAppLibraryFPItemIDs;
  NSMutableSet *v19;
  NSMutableSet *waitingToBeGatheredCollections;
  NSMutableSet *v21;
  NSMutableSet *collectionsSet;
  NSMutableDictionary *v23;
  NSMutableDictionary *itemOwnersMap;
  NSMutableSet *v25;
  NSMutableSet *boostedAppLibraries;
  NSObject *accountTokenDidChangeNotificationObserver;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)BRItemCollectionGatherer;
  v8 = -[BRItemCollectionGatherer init](&v29, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemIDToItemCollectionMap = v8->_itemIDToItemCollectionMap;
    v8->_itemIDToItemCollectionMap = v9;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.br.item-collection-gatherer", v12);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_query, a4);
    -[NSMetadataQuery predicate](v8->_query, "predicate");
    v15 = objc_claimAutoreleasedReturnValue();
    predicate = v8->_predicate;
    v8->_predicate = (NSPredicate *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    watchedAppLibraryFPItemIDs = v8->_watchedAppLibraryFPItemIDs;
    v8->_watchedAppLibraryFPItemIDs = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    waitingToBeGatheredCollections = v8->_waitingToBeGatheredCollections;
    v8->_waitingToBeGatheredCollections = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    collectionsSet = v8->_collectionsSet;
    v8->_collectionsSet = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemOwnersMap = v8->_itemOwnersMap;
    v8->_itemOwnersMap = v23;

    v8->_finishedInitialGathering = 0;
    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    boostedAppLibraries = v8->_boostedAppLibraries;
    v8->_boostedAppLibraries = v25;

    accountTokenDidChangeNotificationObserver = v8->_accountTokenDidChangeNotificationObserver;
    v8->_accountTokenDidChangeNotificationObserver = 0;

  }
  return v8;
}

- (id)test_getQueue
{
  return self->_queue;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BRItemCollectionGatherer<%p>"), self);
}

- (void)_stopObservingAccountTokenDidChangeNotification
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - Stop observing BRAccountTokenDidChangeNotification%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_startObservingAccountTokenDidChangeNotification
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - Already observing BRAccountTokenDidChangeNotification%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 293);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_4();

  v29 = 0;
  +[BRAccount currentCachedLoggedInAccountWithError:](BRAccount, "currentCachedLoggedInAccountWithError:", &v29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v29;
  if (v5)
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 298);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v28 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v31 = v28;
      v32 = 2112;
      v33 = v5;
      v34 = 2112;
      v35 = v6;
      _os_log_fault_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ - Failed to get current cached logged in account with error [%@]%@", buf, 0x20u);
    }

  }
  else if (v4
         && (objc_msgSend(v4, "perAppAccountIdentifier"),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             v8,
             v8))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v9 = (id *)(a1 + 32);
    v11 = *(void **)(v10 + 112);
    if (!v11
      || (objc_msgSend(v4, "perAppAccountIdentifier"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "isEqual:", v12),
          v12,
          (v13 & 1) == 0))
    {
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 305);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_3();

      v16 = (void *)*((_QWORD *)*v9 + 14);
      objc_msgSend(v4, "perAppAccountIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = objc_msgSend(v16, "isEqual:", v17);

      if ((v16 & 1) == 0 && objc_msgSend(*((id *)*v9 + 12), "count"))
      {
        brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 308);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_2();

        objc_msgSend(*((id *)*v9 + 12), "removeAllObjects");
      }
      objc_msgSend(v4, "perAppAccountIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      v22 = (void *)*((_QWORD *)*v9 + 14);
      *((_QWORD *)*v9 + 14) = v21;

      objc_msgSend(*v9, "_startWatchingRootItemWithConfig:", *((_QWORD *)*v9 + 6));
    }
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 32);
    v23 = (id *)(a1 + 32);
    if (*(_QWORD *)(v24 + 112))
    {
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification]_block_invoke", 316);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_1();

      v27 = (void *)*((_QWORD *)*v23 + 14);
      *((_QWORD *)*v23 + 14) = 0;

      objc_msgSend(*v23, "_invalidateAndNotifyDelegate:", 1);
    }
  }

}

- (void)_addItemCollectionOnItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  BRItemCollectionGatherer *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_itemIDToItemCollectionMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _addItemCollectionOnItem:]", 332);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "providerItemIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v21 = self;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v7;
      _os_log_debug_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Adding Item Collection on itemID = %@, providerItemIdentifier = %@%@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0CAAC78], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newCollectionWithItemID:", v5);

    v11 = (void *)MEMORY[0x1E0CB3880];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__BRItemCollectionGatherer__addItemCollectionOnItem___block_invoke;
    v17[3] = &unk_1E3DA7510;
    v17[4] = self;
    v12 = v5;
    v18 = v12;
    v19 = v4;
    objc_msgSend(v11, "predicateWithBlock:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setItemFilteringPredicate:", v13);

    objc_msgSend(v10, "setDelegate:", self);
    objc_msgSend(v10, "setWorkingQueue:", self->_queue);
    objc_msgSend(v10, "setShowHiddenFiles:", 1);
    objc_msgSend(v10, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRequireSandboxAccess:", 1);

    objc_msgSend(v10, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUnbounded:", 1);

    -[NSMutableDictionary setObject:forKey:](self->_itemIDToItemCollectionMap, "setObject:forKey:", v10, v12);
    -[NSMutableSet addObject:](self->_waitingToBeGatheredCollections, "addObject:", v10);
    -[NSMutableSet addObject:](self->_collectionsSet, "addObject:", v10);
    objc_msgSend(v10, "startObserving");

  }
}

uint64_t __53__BRItemCollectionGatherer__addItemCollectionOnItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (uint64_t *)(a1 + 32);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "watchTypes") & 0x40) == 0
    || objc_msgSend(v3, "isFolder"))
  {
    if ((objc_msgSend(*(id *)(*v4 + 48), "watchTypes") & 1) != 0)
    {
      objc_msgSend(v3, "itemID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v28, "isEqualToItemID:", *(_QWORD *)(a1 + 40));

      goto LABEL_26;
    }
    objc_msgSend(v3, "parentItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _addItemCollectionOnItem:]_block_invoke", 348);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v36 = *v4;
        *(_DWORD *)buf = 138412802;
        v39 = v36;
        v40 = 2112;
        v41 = v3;
        v42 = 2112;
        v43 = v6;
        _os_log_fault_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ - fp items should always have a parentItemID set on it - %@%@", buf, 0x20u);
      }

    }
    objc_msgSend(v3, "parentItemID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_15;
    v9 = (void *)v8;
    v10 = *(void **)(*v4 + 56);
    objc_msgSend(v3, "parentItemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

    if (!(_DWORD)v10)
      goto LABEL_15;
    objc_msgSend(v3, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", CFSTR("Documents"));

    if ((objc_msgSend(*(id *)(*v4 + 48), "watchTypes") & 6) != 0 || v13)
    {
      objc_msgSend(*(id *)(a1 + 48), "providerItemIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CAAB30]);

      if (!v15
        || (v13 & 1) == 0
        && (objc_msgSend(v3, "displayName"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isEqual:", CFSTR("Desktop")),
            v16,
            (v17 & 1) == 0))
      {
LABEL_15:
        objc_msgSend(*(id *)(*v4 + 48), "gatherPrefix");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = (void *)MEMORY[0x1E0CB38E8];
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*v4 + 48), "gatherPrefix");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("^%@"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0;
          objc_msgSend(v19, "regularExpressionWithPattern:options:error:", v22, 0, &v37);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v37;

          if (v24)
          {
            brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _addItemCollectionOnItem:]_block_invoke", 387);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              __53__BRItemCollectionGatherer__addItemCollectionOnItem___block_invoke_cold_1();

            goto LABEL_20;
          }
          objc_msgSend(v3, "displayName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "displayName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v23, "numberOfMatchesInString:options:range:", v29, 0, 0, objc_msgSend(v30, "length"));

          if (!v31)
          {
LABEL_20:

            goto LABEL_21;
          }

        }
        objc_msgSend(v3, "fileURL");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "br_isExcludedWithMaximumDepth:", 1);

        v27 = v34 ^ 1u;
        goto LABEL_26;
      }
    }
  }
LABEL_21:
  v27 = 0;
LABEL_26:

  return v27;
}

- (BOOL)_canWatchItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableSet *watchedAppLibraryFPItemIDs;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  char v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[BRWatchingConfiguration watchTypes](self->_config, "watchTypes") & 2) != 0
    || (-[BRWatchingConfiguration watchTypes](self->_config, "watchTypes") & 1) != 0)
  {
    v14 = -[NSMutableDictionary count](self->_itemIDToItemCollectionMap, "count") == 0;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_itemIDToItemCollectionMap, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6
      || !objc_msgSend(v4, "isFolder")
      || !-[BRWatchingConfiguration watchTypes](self->_config, "watchTypes"))
    {
      goto LABEL_12;
    }
    watchedAppLibraryFPItemIDs = self->_watchedAppLibraryFPItemIDs;
    objc_msgSend(v4, "parentItemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(watchedAppLibraryFPItemIDs) = -[NSMutableSet containsObject:](watchedAppLibraryFPItemIDs, "containsObject:", v8);

    if (!(_DWORD)watchedAppLibraryFPItemIDs
      || ((objc_msgSend(v4, "displayName"),
           v9 = (void *)objc_claimAutoreleasedReturnValue(),
           v10 = objc_msgSend(v9, "isEqual:", CFSTR("Documents")),
           v9,
           (-[BRWatchingConfiguration watchTypes](self->_config, "watchTypes") & 8) != 0)
       || (v10 & 1) == 0)
      && ((-[BRWatchingConfiguration watchTypes](self->_config, "watchTypes") >> 2) & 1 | v10) == 1)
    {
      objc_msgSend(v4, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "br_isExcludedWithMaximumDepth:", 1024);

      v14 = v13 ^ 1;
    }
    else
    {
LABEL_12:
      v14 = 0;
    }
  }

  return v14;
}

- (BOOL)_buildCollectionOnItemIfPossible:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v9;
  void *v10;
  int v11;
  BRItemCollectionGatherer *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _buildCollectionOnItemIfPossible:]", 479);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerItemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = self;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - _buildCollectionOnItemIfPossible itemID = %@, providerItemIdentifier = %@%@", (uint8_t *)&v11, 0x2Au);

  }
  v7 = -[BRItemCollectionGatherer _canWatchItem:](self, "_canWatchItem:", v4);
  if (v7)
    -[BRItemCollectionGatherer _addItemCollectionOnItem:](self, "_addItemCollectionOnItem:", v4);

  return v7;
}

- (id)_getAppLibraryURLFromConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[BRWatchingConfiguration appLibraryIDToURLMapOfSuppliedAppIDs](self->_config, "appLibraryIDToURLMapOfSuppliedAppIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[BRWatchingConfiguration appLibraryIDToURLMapOfSuppliedURLs](self->_config, "appLibraryIDToURLMapOfSuppliedURLs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_boostAppLibraryOfItemIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  BRItemCollectionGatherer *v10;

  objc_msgSend(a3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "br_containerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[NSMutableSet containsObject:](self->_boostedAppLibraries, "containsObject:", v5) & 1) == 0)
  {
    -[BRItemCollectionGatherer _getAppLibraryURLFromConfig:](self, "_getAppLibraryURLFromConfig:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[BRFileProviderServicesFactory itemServiceSyncProxyForURL:](BRFileProviderServicesFactory, "itemServiceSyncProxyForURL:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __59__BRItemCollectionGatherer__boostAppLibraryOfItemIfNeeded___block_invoke;
      v8[3] = &unk_1E3DA5780;
      v9 = v5;
      v10 = self;
      objc_msgSend(v7, "boostFilePresenter:", v8);

    }
  }

}

void __59__BRItemCollectionGatherer__boostAppLibraryOfItemIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _boostAppLibraryOfItemIfNeeded:]_block_invoke", 512);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_debug_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] boosted %@ with %@%@", (uint8_t *)&v7, 0x20u);
  }

  if (!v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)_startWatchingURLs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *queue;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD block[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  BRItemCollectionGatherer *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  NSObject *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]", 520);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRItemCollectionGatherer _startWatchingURLs:].cold.1((uint64_t)self);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    v25 = v7;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]", 522);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fp_obfuscatedPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v33 = self;
        v34 = 2112;
        v35 = v19;
        v36 = 2112;
        v37 = v13;
        _os_log_debug_impl(&dword_19CBF0000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - -- _startWatchingURLsIfNeeded working on %@%@", buf, 0x20u);

        v7 = v25;
      }

      if (v12)
      {
        if ((objc_msgSend(v12, "br_isInSyncedLocation") & 1) == 0)
        {
          brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]", 528);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
          {
            objc_msgSend(v12, "path");
            v22 = objc_claimAutoreleasedReturnValue();
            -[NSObject fp_obfuscatedPath](v22, "fp_obfuscatedPath");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v33 = self;
            v34 = 2112;
            v35 = v23;
            v36 = 2112;
            v37 = v17;
            _os_log_error_impl(&dword_19CBF0000, v21, (os_log_type_t)0x90u, "[ERROR] %@ - Can't Watch url %@ since its not in a synced location.%@", buf, 0x20u);
            goto LABEL_24;
          }
LABEL_21:

          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x1E0CAAC78], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        objc_msgSend(v15, "itemForURL:error:", v12, &v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v27;

        if (!v16)
        {
          brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]", 535);
          v21 = objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v22 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v22, (os_log_type_t)0x90u))
            goto LABEL_20;
          objc_msgSend(v12, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "fp_obfuscatedPath");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v33 = self;
          v34 = 2112;
          v35 = v24;
          v36 = 2112;
          v37 = v17;
          v38 = 2112;
          v39 = v21;
          _os_log_error_impl(&dword_19CBF0000, v22, (os_log_type_t)0x90u, "[ERROR] %@ - Can't build an fpItem for %@ - %@%@", buf, 0x2Au);

LABEL_24:
LABEL_20:

          goto LABEL_21;
        }
        -[BRItemCollectionGatherer _boostAppLibraryOfItemIfNeeded:](self, "_boostAppLibraryOfItemIfNeeded:", v16);
        -[BRItemCollectionGatherer _startWatchingNewSubItem:](self, "_startWatchingNewSubItem:", v16);

      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v9)
          goto LABEL_5;
        break;
      }
    }
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__BRItemCollectionGatherer__startWatchingURLs___block_invoke;
  block[3] = &unk_1E3DA4738;
  block[4] = self;
  dispatch_async(queue, block);
LABEL_22:

}

unint64_t __47__BRItemCollectionGatherer__startWatchingURLs___block_invoke(uint64_t a1)
{
  id *v1;
  unint64_t result;
  void *v3;
  NSObject *v4;

  v1 = (id *)(a1 + 32);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
  if (!result)
  {
    result = objc_msgSend(*((id *)*v1 + 6), "watchTypes");
    if (result <= 3)
    {
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingURLs:]_block_invoke", 546);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __47__BRItemCollectionGatherer__startWatchingURLs___block_invoke_cold_1();

      return objc_msgSend(*v1, "_queueSignalDelegateIfNeededOnFinishGathering");
    }
  }
  return result;
}

- (void)_startWatchingAppLibraries:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  dispatch_time_t v10;
  NSObject *queue;
  void *v12;
  NSObject *v13;
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  BRItemCollectionGatherer *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingAppLibraries:]", 554);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v26 = self;
    v27 = 2112;
    v28 = v4;
    v29 = 2112;
    v30 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ -  _startWatchingAppLibrariesIfNeeded(%@)%@", buf, 0x20u);
  }

  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke;
  v18[3] = &unk_1E3DA7538;
  v18[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_2;
  v15[3] = &unk_1E3DA7560;
  v8 = (id)MEMORY[0x1A1AD85E4](v18);
  v15[4] = self;
  v16 = v8;
  v17 = &v19;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v15);
  if (objc_msgSend((id)v20[5], "count"))
  {
    v9 = self->_appLibrariesLookupAttempts + 1;
    self->_appLibrariesLookupAttempts = v9;
    self->_finishedLookingUpAppLibraries = 0;
    v10 = dispatch_time(0, 1000000000 * (1 << v9));
    queue = self->_queue;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_53;
    v14[3] = &unk_1E3DA6D80;
    v14[4] = self;
    v14[5] = &v19;
    dispatch_after(v10, queue, v14);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingAppLibraries:]", 582);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BRItemCollectionGatherer _startWatchingAppLibraries:].cold.1();

    self->_finishedLookingUpAppLibraries = 1;
    -[BRItemCollectionGatherer _queueSignalDelegateIfNeededOnFinishGathering](self, "_queueSignalDelegateIfNeededOnFinishGathering");
  }

  _Block_object_dispose(&v19, 8);
}

void __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "_boostAppLibraryOfItemIfNeeded:", v6);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v6, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_startWatchingNewSubItem:", v6);
}

void __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CAAC78], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemForURL:error:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) < 7uLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setValue:forKey:", v6, v5);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingAppLibraries:]_block_invoke_2", 566);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_2_cold_1((uint64_t)v9, v10);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_queueSignalDelegateIfNeededOnFinishGathering");
  }

}

uint64_t __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_53(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingAppLibraries:]_block_invoke", 578);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_53_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_startWatchingAppLibraries:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)startWatchingRootItemWithScopes:(id)a3
{
  id v4;
  BRWatchingConfiguration *v5;

  v4 = a3;
  v5 = -[BRWatchingConfiguration initWithScopes:predicate:]([BRWatchingConfiguration alloc], "initWithScopes:predicate:", v4, self->_predicate);

  -[BRItemCollectionGatherer _startWatchingRootItemWithConfig:](self, "_startWatchingRootItemWithConfig:", v5);
  -[BRItemCollectionGatherer _startObservingAccountTokenDidChangeNotification](self, "_startObservingAccountTokenDidChangeNotification");

}

- (void)_startWatchingRootItemWithConfig:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke;
  v7[3] = &unk_1E3DA4A70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id **v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id *v10;
  void *v11;
  id *v12;

  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingRootItemWithConfig:]_block_invoke", 612);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke_cold_2();

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = (id **)(a1 + 32);
  objc_storeStrong((id *)(v5 + 48), v4);
  objc_msgSend((*v6)[6], "urls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v10 = *v6;
    objc_msgSend((*v6)[6], "urls");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_startWatchingURLs:", v11);

    v12 = *v6;
    objc_msgSend(v12[6], "appLibraryIDToURLMapOfSuppliedAppIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_startWatchingAppLibraries:", v8);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _startWatchingRootItemWithConfig:]_block_invoke", 616);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke_cold_1();

  }
}

- (void)_startWatchingNewSubItem:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__BRItemCollectionGatherer__startWatchingNewSubItem___block_invoke;
  v7[3] = &unk_1E3DA4A70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __53__BRItemCollectionGatherer__startWatchingNewSubItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildCollectionOnItemIfPossible:", *(_QWORD *)(a1 + 40));
}

- (void)_stopWatchingItemIDRecusively:(id)a3 itemIDsInItem:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  BRItemCollectionGatherer *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:]", 635);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v35 = self;
    v36 = 2112;
    v37 = v6;
    v38 = 2112;
    v39 = (unint64_t)v7;
    _os_log_debug_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - stop watching itemID %@ recursively%@", buf, 0x20u);
  }

  if (v6)
  {
    objc_msgSend(v28, "addObject:", v6);
    -[NSMutableDictionary objectForKey:](self->_itemIDToItemCollectionMap, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "stopObserving");
      -[NSMutableSet removeObject:](self->_collectionsSet, "removeObject:", v10);
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:]", 649);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "items");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v35 = self;
        v36 = 2112;
        v37 = v6;
        v38 = 2112;
        v39 = (unint64_t)v26;
        v40 = 2112;
        v41 = v11;
        _os_log_debug_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item %@ collection childs %@%@", buf, 0x2Au);

      }
      v27 = v6;

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v10, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v30 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v18, "itemID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[BRItemCollectionGatherer _itemID:wasDeletedByCollection:](self, "_itemID:wasDeletedByCollection:", v19, v10);

            if (v20)
            {
              brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:]", 656);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(1);
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v18, "itemID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v35 = self;
                v36 = 2112;
                v37 = v23;
                v38 = 2048;
                v39 = v20;
                v40 = 2112;
                v41 = v21;
                _os_log_debug_impl(&dword_19CBF0000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item ID %@ is owned by %lu other collections. Stopping the recursive traverse%@", buf, 0x2Au);

              }
            }
            else
            {
              objc_msgSend(v18, "itemID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:](self, "_stopWatchingItemIDRecusively:itemIDsInItem:", v21, v28);
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v15);
      }

      v6 = v27;
      -[NSMutableDictionary removeObjectForKey:](self->_itemIDToItemCollectionMap, "removeObjectForKey:", v27);
      -[BRItemCollectionGatherer _removeCollectionFromGatherSet:](self, "_removeCollectionFromGatherSet:", v10);
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:]", 643);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v35 = self;
        v36 = 2112;
        v37 = v6;
        v38 = 2112;
        v39 = (unint64_t)v24;
        _os_log_debug_impl(&dword_19CBF0000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - No collection found for item %@%@", buf, 0x20u);
      }

    }
  }

}

- (void)_unboostApplibrariesIfNeeded
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  id obj;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_boostedAppLibraries, "count"))
  {
    v3 = (void *)-[NSMutableSet copy](self->_boostedAppLibraries, "copy");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v20;
      *(_QWORD *)&v5 = 138412290;
      v15 = v5;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
          -[BRItemCollectionGatherer _getAppLibraryURLFromConfig:](self, "_getAppLibraryURLFromConfig:", v10, v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _unboostApplibrariesIfNeeded]", 671);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(0);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v15;
              v24 = v16;
              _os_log_fault_impl(&dword_19CBF0000, v13, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: appLibraryURL%@", buf, 0xCu);
            }

          }
          +[BRFileProviderServicesFactory itemServiceSyncProxyForURL:](BRFileProviderServicesFactory, "itemServiceSyncProxyForURL:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = v8;
          v18[1] = 3221225472;
          v18[2] = __56__BRItemCollectionGatherer__unboostApplibrariesIfNeeded__block_invoke;
          v18[3] = &unk_1E3DA5780;
          v18[4] = v10;
          v18[5] = self;
          objc_msgSend(v12, "unboostFilePresenter:", v18);

          ++v9;
        }
        while (v6 != v9);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        v6 = v14;
      }
      while (v14);
    }

  }
}

void __56__BRItemCollectionGatherer__unboostApplibrariesIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;

  if (a2)
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _unboostApplibrariesIfNeeded]_block_invoke", 675);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __56__BRItemCollectionGatherer__unboostApplibrariesIfNeeded__block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "removeObject:", *(_QWORD *)(a1 + 32));
  }
}

- (void)_invalidateAndNotifyDelegate:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__BRItemCollectionGatherer__invalidateAndNotifyDelegate___block_invoke;
  v4[3] = &unk_1E3DA59E8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

void __57__BRItemCollectionGatherer__invalidateAndNotifyDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _invalidateAndNotifyDelegate:]_block_invoke", 685);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __57__BRItemCollectionGatherer__invalidateAndNotifyDelegate___block_invoke_cold_1();

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "itemCollectionGathererDidInvalidate");

  }
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v9++), "stopObserving", (_QWORD)v24);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  *(_QWORD *)(v12 + 64) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 72);
  *(_QWORD *)(v14 + 72) = 0;

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 80);
  *(_QWORD *)(v16 + 80) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 96);
  *(_QWORD *)(v18 + 96) = 0;

  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 120);
  *(_QWORD *)(v20 + 120) = 0;

  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 16);
  *(_QWORD *)(v22 + 16) = 0;

}

- (void)invalidate
{
  -[BRItemCollectionGatherer _invalidateAndNotifyDelegate:](self, "_invalidateAndNotifyDelegate:", 0);
}

- (void)disableUpdates
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8_1(&dword_19CBF0000, v0, v1, "[DEBUG] %@ - Disabling Updates of collections of %@%@");
  OUTLINED_FUNCTION_5_1();
}

- (void)enableUpdates
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8_1(&dword_19CBF0000, v0, v1, "[DEBUG] %@ - Enabling Updates of collections of %@%@");
  OUTLINED_FUNCTION_5_1();
}

- (void)pauseWatchingWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__BRItemCollectionGatherer_pauseWatchingWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E3DA6E48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __61__BRItemCollectionGatherer_pauseWatchingWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer pauseWatchingWithCompletionBlock:]_block_invoke", 727);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __61__BRItemCollectionGatherer_pauseWatchingWithCompletionBlock___block_invoke_cold_1();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "stopObserving");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)resumeWatching
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__BRItemCollectionGatherer_resumeWatching__block_invoke;
  block[3] = &unk_1E3DA4738;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__BRItemCollectionGatherer_resumeWatching__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer resumeWatching]_block_invoke", 737);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __42__BRItemCollectionGatherer_resumeWatching__block_invoke_cold_1();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "startObserving");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_queueSignalDelegateIfNeededOnFinishGathering
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__BRItemCollectionGatherer__queueSignalDelegateIfNeededOnFinishGathering__block_invoke;
  block[3] = &unk_1E3DA4738;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __73__BRItemCollectionGatherer__queueSignalDelegateIfNeededOnFinishGathering__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_signalDelegateIfNeededOnFinishGathering");
}

- (BOOL)_signalDelegateIfNeededOnFinishGathering
{
  BOOL v3;
  void *v5;
  NSObject *v6;
  id WeakRetained;

  if (self->_finishedInitialGathering
    || -[NSMutableSet count](self->_waitingToBeGatheredCollections, "count")
    || !self->_finishedLookingUpAppLibraries)
  {
    return 0;
  }
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _signalDelegateIfNeededOnFinishGathering]", 755);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRItemCollectionGatherer _signalDelegateIfNeededOnFinishGathering].cold.1((uint64_t)self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "itemCollectionGathererFinishedGathering");

  self->_finishedInitialGathering = 1;
  return v3;
}

- (void)_removeCollectionFromGatherSet:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  BRItemCollectionGatherer *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet removeObject:](self->_waitingToBeGatheredCollections, "removeObject:", a3);
  if (!-[BRItemCollectionGatherer _signalDelegateIfNeededOnFinishGathering](self, "_signalDelegateIfNeededOnFinishGathering"))
  {
    if (!self->_finishedLookingUpAppLibraries)
    {
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _removeCollectionFromGatherSet:]", 768);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[BRItemCollectionGatherer _removeCollectionFromGatherSet:].cold.1();

    }
    if (-[NSMutableSet count](self->_waitingToBeGatheredCollections, "count"))
    {
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _removeCollectionFromGatherSet:]", 771);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[NSMutableSet anyObject](self->_waitingToBeGatheredCollections, "anyObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSMutableSet count](self->_waitingToBeGatheredCollections, "count");
        v10 = 138413058;
        v11 = self;
        v12 = 2112;
        v13 = v8;
        v14 = 2048;
        v15 = v9 - 1;
        v16 = 2112;
        v17 = v6;
        _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - still waiting on %@ (and %lu more collections) to finish gathering%@", (uint8_t *)&v10, 0x2Au);

      }
    }
  }
}

- (unint64_t)_itemID:(id)a3 becameOwnedByCollection:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_itemOwnersMap, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary setObject:forKey:](self->_itemOwnersMap, "setObject:forKey:", v8, v6);
  }
  objc_msgSend(v8, "addObject:", v7);
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (unint64_t)_itemID:(id)a3 wasDeletedByCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_itemOwnersMap, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer _itemID:wasDeletedByCollection:]", 788);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRItemCollectionGatherer _itemID:wasDeletedByCollection:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

  }
  objc_msgSend(v8, "removeObject:", v7);
  if (!objc_msgSend(v8, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_itemOwnersMap, "removeObjectForKey:", v6);
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (BOOL)_isItemOwnedByAnyCollection:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_itemOwnersMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[BRItemCollectionGatherer dataForCollectionShouldBeReloaded:deleteItemsWithIDs:](self, "dataForCollectionShouldBeReloaded:deleteItemsWithIDs:", v5, MEMORY[0x1E0C9AA60]);

}

- (void)dataForCollectionShouldBeReloaded:(id)a3 deleteItemsWithIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  BRItemCollectionGatherer *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[NSMutableSet containsObject:](self->_collectionsSet, "containsObject:", v6) & 1) != 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer dataForCollectionShouldBeReloaded:deleteItemsWithIDs:]", 815);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412802;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - dataForCollectionShouldBeReloaded on collection %@ - forwarding it to the didUpdate method%@", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(v6, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:](self, "collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:", v6, v10, MEMORY[0x1E0C9AA70], v7);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer dataForCollectionShouldBeReloaded:deleteItemsWithIDs:]", 812);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412802;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_19CBF0000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Ignoring events from item collection: %@%@", (uint8_t *)&v12, 0x20u);
    }

  }
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _BOOL4 finishedInitialGathering;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  BRItemCollectionGatherer *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_collectionsSet, "containsObject:", v4) & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collectionDidFinishGathering:]", 821);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v32 = self;
      v33 = 2112;
      v34 = v4;
      v35 = 2112;
      v36 = WeakRetained;
      _os_log_impl(&dword_19CBF0000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Ignoring events from item collection: %@%@", buf, 0x20u);
    }
    goto LABEL_19;
  }
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collectionDidFinishGathering:]", 828);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v32 = self;
    v33 = 2112;
    v34 = v4;
    v35 = 2112;
    v36 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - collectionDidFinishGathering on %@%@", buf, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "itemCollectionGathererGatheredItems:", v8);

  v9 = -[NSMutableDictionary count](self->_itemIDToItemCollectionMap, "count");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "items", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "itemID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRItemCollectionGatherer _itemID:becameOwnedByCollection:](self, "_itemID:becameOwnedByCollection:", v16, v4);

        -[BRItemCollectionGatherer _buildCollectionOnItemIfPossible:](self, "_buildCollectionOnItemIfPossible:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  finishedInitialGathering = self->_finishedInitialGathering;
  -[BRItemCollectionGatherer _removeCollectionFromGatherSet:](self, "_removeCollectionFromGatherSet:", v4);
  if (!finishedInitialGathering
    && self->_finishedInitialGathering
    && v9 != -[NSMutableDictionary count](self->_itemIDToItemCollectionMap, "count"))
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collectionDidFinishGathering:]", 845);
    v18 = objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRItemCollectionGatherer collectionDidFinishGathering:].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

LABEL_19:
  }

}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  id v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  int v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *itemIDToItemCollectionMap;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSMutableDictionary *failureCountByItemID;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  NSObject *v33;
  id WeakRetained;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  const __CFString *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[7];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[4];
  id v48;
  _BYTE *v49;
  uint8_t buf[4];
  BRItemCollectionGatherer *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  _BYTE v60[20];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  if ((-[NSMutableSet containsObject:](self->_collectionsSet, "containsObject:", v6) & 1) != 0)
  {
    v8 = -[NSMutableSet containsObject:](self->_waitingToBeGatheredCollections, "containsObject:", v6);
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 857);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v39 = &stru_1E3DA8AC8;
      *(_DWORD *)v58 = 138413314;
      *(_QWORD *)&v58[4] = self;
      if (v8)
        v39 = CFSTR(" while gathering");
      *(_WORD *)&v58[12] = 2112;
      *(_QWORD *)&v58[14] = v6;
      *(_WORD *)&v58[22] = 2112;
      v59 = v7;
      *(_WORD *)v60 = 2112;
      *(_QWORD *)&v60[2] = v39;
      *(_WORD *)&v60[10] = 2112;
      *(_QWORD *)&v60[12] = v9;
      _os_log_error_impl(&dword_19CBF0000, v10, (os_log_type_t)0x90u, "[ERROR] %@ - collection %@ did encounter error %@%@%@", v58, 0x34u);
    }

    *(_QWORD *)v58 = 0;
    *(_QWORD *)&v58[8] = v58;
    *(_QWORD *)&v58[16] = 0x3032000000;
    v59 = __Block_byref_object_copy__12;
    *(_QWORD *)v60 = __Block_byref_object_dispose__12;
    *(_QWORD *)&v60[8] = 0;
    itemIDToItemCollectionMap = self->_itemIDToItemCollectionMap;
    v12 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke;
    v47[3] = &unk_1E3DA7588;
    v13 = v6;
    v48 = v13;
    v49 = v58;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](itemIDToItemCollectionMap, "enumerateKeysAndObjectsUsingBlock:", v47);
    v14 = *(_QWORD *)(*(_QWORD *)&v58[8] + 40);
    if (!v14)
    {
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 909);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v51 = self;
        v52 = 2112;
        v53 = (uint64_t)v13;
        v54 = 2112;
        v55 = v28;
        _os_log_fault_impl(&dword_19CBF0000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ - Couldn't locate itemID for collection %@%@", buf, 0x20u);
      }

      if (v8)
        -[BRItemCollectionGatherer _removeCollectionFromGatherSet:](self, "_removeCollectionFromGatherSet:", v13);
      goto LABEL_27;
    }
    failureCountByItemID = self->_failureCountByItemID;
    if (!failureCountByItemID)
    {
      v16 = (NSMutableDictionary *)objc_opt_new();
      v17 = self->_failureCountByItemID;
      self->_failureCountByItemID = v16;

      failureCountByItemID = self->_failureCountByItemID;
      v14 = *(_QWORD *)(*(_QWORD *)&v58[8] + 40);
    }
    -[NSMutableDictionary objectForKeyedSubscript:](failureCountByItemID, "objectForKeyedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "longLongValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_failureCountByItemID, "setObject:forKeyedSubscript:", v20, *(_QWORD *)(*(_QWORD *)&v58[8] + 40));

    v21 = v19 + 1;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    if ((unint64_t)(v19 + 1) < 6)
    {
      if (objc_msgSend(v7, "br_isFileProviderErrorCode:", -1005))
      {
        brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 880);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v30 = *(_QWORD *)(*(_QWORD *)&v58[8] + 40);
          *(_DWORD *)buf = 138412802;
          v51 = self;
          v52 = 2112;
          v53 = v30;
          v54 = 2112;
          v55 = v22;
          _os_log_debug_impl(&dword_19CBF0000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Looks like item %@ got deleted -> recursive delete.%@", buf, 0x20u);
        }
        goto LABEL_22;
      }
      if (!objc_msgSend(v7, "br_isCocoaErrorCode:", 257))
      {
        objc_msgSend(MEMORY[0x1E0CAAC78], "defaultManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = *(_QWORD *)(*(_QWORD *)&v58[8] + 40);
        v42[0] = v12;
        v42[1] = 3221225472;
        v42[2] = __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke_61;
        v42[3] = &unk_1E3DA75B0;
        v42[4] = self;
        v42[5] = v58;
        v42[6] = &v43;
        objc_msgSend(v35, "fetchItemForItemID:completionHandler:", v36, v42);

        if (!*((_BYTE *)v44 + 24))
        {
          brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 898);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v51 = self;
            v52 = 2048;
            v53 = v21;
            v54 = 2112;
            v55 = v37;
            _os_log_debug_impl(&dword_19CBF0000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - restart observing the collection. Failure count [%llu]%@", buf, 0x20u);
          }

          objc_msgSend(v13, "startObserving");
          goto LABEL_26;
        }
LABEL_23:
        v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:](self, "_stopWatchingItemIDRecusively:itemIDsInItem:", *(_QWORD *)(*(_QWORD *)&v58[8] + 40), v31);
        brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 904);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v40 = *(void **)(*(_QWORD *)&v58[8] + 40);
          *(_DWORD *)buf = 138413058;
          v51 = self;
          v52 = 2112;
          v53 = (uint64_t)v31;
          v54 = 2112;
          v55 = v40;
          v56 = 2112;
          v57 = v32;
          _os_log_debug_impl(&dword_19CBF0000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - All these items [%@] found under this item [%@] and should be deleted.%@", buf, 0x2Au);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "itemCollectionGathererDidReceiveUpdates:deleteItemsWithIDs:", 0, v31);

LABEL_26:
        _Block_object_dispose(&v43, 8);

LABEL_27:
        _Block_object_dispose(v58, 8);

        goto LABEL_28;
      }
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 883);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v41 = *(_QWORD *)(*(_QWORD *)&v58[8] + 40);
        *(_DWORD *)buf = 138412802;
        v51 = self;
        v52 = 2112;
        v53 = v41;
        v54 = 2112;
        v55 = v22;
        v25 = "[CRIT] UNREACHABLE: %@ - Looks like we don't have permission to view %@%@";
        goto LABEL_9;
      }
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 877);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v24 = *(_QWORD *)(*(_QWORD *)&v58[8] + 40);
        *(_DWORD *)buf = 138412802;
        v51 = self;
        v52 = 2112;
        v53 = v24;
        v54 = 2112;
        v55 = v22;
        v25 = "[CRIT] UNREACHABLE: %@ - BRItemCollectionGatherer - Repeatedly can't watch item %@%@";
LABEL_9:
        _os_log_fault_impl(&dword_19CBF0000, v23, OS_LOG_TYPE_FAULT, v25, buf, 0x20u);
      }
    }
LABEL_22:

    *((_BYTE *)v44 + 24) = 1;
    goto LABEL_23;
  }
  brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]", 852);
  v26 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v58 = 138412802;
    *(_QWORD *)&v58[4] = self;
    *(_WORD *)&v58[12] = 2112;
    *(_QWORD *)&v58[14] = v6;
    *(_WORD *)&v58[22] = 2112;
    v59 = v26;
    _os_log_impl(&dword_19CBF0000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Ignoring events from item collection: %@%@", v58, 0x20u);
  }

LABEL_28:
}

void __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

void __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke_61(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]_block_invoke", 888);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v9 = a1[4];
      v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      v11 = 138413058;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] %@ - Couldn't refresh itemID %@ error [%@]%@", (uint8_t *)&v11, 0x2Au);
    }
  }
  else
  {
    if (v5)
      goto LABEL_6;
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didEncounterError:]_block_invoke", 891);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke_61_cold_1();
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
LABEL_6:

}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id WeakRetained;
  id v42;
  id v43;
  NSObject *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  BRItemCollectionGatherer *v55;
  __int16 v56;
  NSObject *v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if ((-[NSMutableSet containsObject:](self->_collectionsSet, "containsObject:", v9) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 932);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:].cold.2((uint64_t)self);

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v43 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v51 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v19, "itemID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRItemCollectionGatherer _itemID:becameOwnedByCollection:](self, "_itemID:becameOwnedByCollection:", v20, v9);

          -[BRItemCollectionGatherer _startWatchingNewSubItem:](self, "_startWatchingNewSubItem:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      }
      while (v16);
    }
    v40 = v14;

    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v42 = v11;
    obj = v11;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v47;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(obj);
          v25 = *(NSObject **)(*((_QWORD *)&v46 + 1) + 8 * v24);
          if (!-[BRItemCollectionGatherer _isItemOwnedByAnyCollection:](self, "_isItemOwnedByAnyCollection:", v25, v40))
          {
            brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 944);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v55 = self;
              v56 = 2112;
              v57 = v25;
              v58 = 2112;
              v59 = (unint64_t)v28;
              _os_log_debug_impl(&dword_19CBF0000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item ID %@ is not known by us, ignoring it%@", buf, 0x20u);
            }

            goto LABEL_24;
          }
          v26 = -[BRItemCollectionGatherer _itemID:wasDeletedByCollection:](self, "_itemID:wasDeletedByCollection:", v25, v9);
          if (v26)
          {
            v27 = v26;
            brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 952);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              v55 = self;
              v56 = 2112;
              v57 = v25;
              v58 = 2048;
              v59 = v27;
              v60 = 2112;
              v61 = v28;
              _os_log_debug_impl(&dword_19CBF0000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item ID %@ is being owned by %lu other collections%@", buf, 0x2Au);
            }

LABEL_24:
            goto LABEL_25;
          }
          brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 949);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v55 = self;
            v56 = 2112;
            v57 = v25;
            v58 = 2112;
            v59 = (unint64_t)v31;
            _os_log_debug_impl(&dword_19CBF0000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - item ID %@ is not owned by any other collection, reporting a deletion for this item%@", buf, 0x20u);
          }

          -[BRItemCollectionGatherer _stopWatchingItemIDRecusively:itemIDsInItem:](self, "_stopWatchingItemIDRecusively:itemIDsInItem:", v25, v44);
LABEL_25:
          ++v24;
        }
        while (v22 != v24);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
        v22 = v33;
      }
      while (v33);
    }

    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 956);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:].cold.1((uint64_t)self);

    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 959);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v37 = objc_claimAutoreleasedReturnValue();
    v10 = v43;
    v38 = v44;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v55 = self;
      v56 = 2112;
      v57 = v44;
      v58 = 2112;
      v59 = (unint64_t)obj;
      v60 = 2112;
      v61 = v36;
      _os_log_debug_impl(&dword_19CBF0000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - All these items [%@] found under these items [%@] and should be deleted.%@", buf, 0x2Au);
    }

    v39 = WeakRetained;
    objc_msgSend(WeakRetained, "itemCollectionGathererDidReceiveUpdates:deleteItemsWithIDs:", v40, v44);
    v11 = v42;
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRItemCollectionGatherer collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:]", 921);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v55 = self;
      v56 = 2112;
      v57 = v9;
      v58 = 2112;
      v59 = (unint64_t)v39;
      _os_log_impl(&dword_19CBF0000, v38, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Ignoring events from item collection: %@%@", buf, 0x20u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountTokenDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_perAppAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_failureCountByItemID, 0);
  objc_storeStrong((id *)&self->_boostedAppLibraries, 0);
  objc_storeStrong((id *)&self->_itemOwnersMap, 0);
  objc_storeStrong((id *)&self->_collectionsSet, 0);
  objc_storeStrong((id *)&self->_waitingToBeGatheredCollections, 0);
  objc_storeStrong((id *)&self->_watchedAppLibraryFPItemIDs, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemIDToItemCollectionMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - Account logged out%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  v1 = *(_QWORD *)(v0 + 96);
  v4 = 138413058;
  v5 = v0;
  v6 = 2112;
  v7 = v1;
  v8 = 2112;
  v9 = v0;
  v10 = 2112;
  v11 = v2;
  _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - remove boosted app libraries [%@] from [%@]%@", (uint8_t *)&v4, 0x2Au);
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - Account logged in%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __76__BRItemCollectionGatherer__startObservingAccountTokenDidChangeNotification__block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - received token change notification%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __53__BRItemCollectionGatherer__addItemCollectionOnItem___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - NSRegularExpression matching prefix is malformed.%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_startWatchingURLs:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - -- _startWatchingURLsIfNeeded%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __47__BRItemCollectionGatherer__startWatchingURLs___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ -  did not create any collection for the given urls -> signal delegate%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_startWatchingAppLibraries:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8_1(&dword_19CBF0000, v0, v1, "[DEBUG] %@ - Managed to watch all the app libraries after %llu attempts%@");
  OUTLINED_FUNCTION_5_1();
}

void __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19CBF0000, a2, (os_log_type_t)0x90u, "[ERROR] Reached maximum retry attempts, giving up on retrying...%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __55__BRItemCollectionGatherer__startWatchingAppLibraries___block_invoke_53_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - Another attempt to watch the missing app libraries%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v1, v2, "[ERROR] %@ - Can't watch more than one url at the same time.%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __61__BRItemCollectionGatherer__startWatchingRootItemWithConfig___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_8_1(&dword_19CBF0000, v0, v1, "[DEBUG] %@ - Start Watching Config %@%@");
  OUTLINED_FUNCTION_5_1();
}

void __56__BRItemCollectionGatherer__unboostApplibrariesIfNeeded__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] Can't unboost app library %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __57__BRItemCollectionGatherer__invalidateAndNotifyDelegate___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  os_log_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(unsigned __int8 *)(v2 + 40);
  v6 = 138413058;
  v7 = v0;
  v8 = 2112;
  v9 = v1;
  v10 = 1024;
  v11 = v3;
  v12 = 2112;
  v13 = v4;
  _os_log_debug_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Invalidating the gatherer of %@ , notifyDelegate = %d%@", (uint8_t *)&v6, 0x26u);
  OUTLINED_FUNCTION_5_1();
}

void __61__BRItemCollectionGatherer_pauseWatchingWithCompletionBlock___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - stop watching the built collections%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __42__BRItemCollectionGatherer_resumeWatching__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - resume watching the built collections%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_signalDelegateIfNeededOnFinishGathering
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - signaling delegate that we finished gathering on all of the initial collections.%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_removeCollectionFromGatherSet:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8_1(&dword_19CBF0000, v0, v1, "[DEBUG] %@ - Still trying to lookup the app libraries with %llu attempts so far%@");
  OUTLINED_FUNCTION_5_1();
}

- (void)_itemID:(uint64_t)a3 wasDeletedByCollection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: itemOwners%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)collectionDidFinishGathering:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: numberOfWatchedItemsBefore == numberOfWatchedItemsAfter%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __57__BRItemCollectionGatherer_collection_didEncounterError___block_invoke_61_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_8_1(&dword_19CBF0000, v0, v1, "[DEBUG] %@ - No error and no item so seems the itemID %@ got deleted -> recursive delete.%@");
  OUTLINED_FUNCTION_5_1();
}

- (void)collection:(uint64_t)a1 didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - signaling delegate about updates.%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)collection:(uint64_t)a1 didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - updating the internal watchers before notifying the delegate%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
