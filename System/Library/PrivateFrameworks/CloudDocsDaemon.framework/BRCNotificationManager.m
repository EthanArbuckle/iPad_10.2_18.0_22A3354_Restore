@implementation BRCNotificationManager

- (void)queueProgressUpdates:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD *v14;
  uint64_t v15;
  const char *label;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  uint64_t v20;
  _BYTE block[24];
  void *v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__BRCNotificationManager_LegacyAdditions__queueProgressUpdates___block_invoke;
  v17[3] = &unk_1E875D470;
  v17[4] = self;
  v7 = v4;
  v18 = v7;
  v8 = queue;
  v9 = v17;
  v10 = (void *)MEMORY[0x1D17A6BE8]();
  v19 = 0uLL;
  v20 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v19);
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = v19;
    label = dispatch_queue_get_label(v8);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v15;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v22 = v11;
    _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v25 = v19;
  v26 = v20;
  *(_QWORD *)block = v6;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke_0;
  v22 = &unk_1E875D578;
  v13 = v8;
  v23 = v13;
  v14 = v9;
  v24 = v14;
  dispatch_async(v13, block);

  objc_autoreleasePoolPop(v10);
}

void __64__BRCNotificationManager_LegacyAdditions__queueProgressUpdates___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D17A6BE8](v3);
        objc_msgSend(v7, "processProgressUpdates:", *(_QWORD *)(a1 + 40), (_QWORD)v9);
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = v3;
    }
    while (v3);
  }

}

- (BOOL)hasActiveAliasWatchers
{
  unint64_t v2;

  v2 = atomic_load(&self->_activeAliasQueries);
  return v2 != 0;
}

- (BOOL)hasWatcherForDocumentID:(id)a3
{
  id v4;
  void *v5;
  BRCNotificationManager *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E68]), "initWithDocIDNumber:", v4);
  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary objectForKeyedSubscript:](v6->_watchersByFileObjectID, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  objc_sync_exit(v6);
  return v8;
}

- (BRCNotificationManager)initWithAccountSession:(id)a3
{
  id v5;
  BRCNotificationManager *v6;
  BRCNotificationManager *v7;
  uint64_t v8;
  BRCClientRanksPersistedState *state;
  uint64_t v10;
  NSHashTable *pipes;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  BRNotificationQueue *v16;
  BRNotificationQueue *notifs;
  NSMutableSet *v18;
  NSMutableSet *additionalUpdatesItemRowID;
  void *v20;
  NSObject *v21;
  BRCNotificationManager *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *watchersByFileObjectID;
  uint64_t v25;
  NSMapTable *fileObjectIDByWatcher;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  BRCNotificationManager *v33;
  objc_super v34;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BRCNotificationManager;
  v6 = -[BRCNotificationManager init](&v34, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", v7->_session);
    v8 = objc_claimAutoreleasedReturnValue();
    state = v7->_state;
    v7->_state = (BRCClientRanksPersistedState *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    pipes = v7->_pipes;
    v7->_pipes = (NSHashTable *)v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.brc.notififcation-mgr", v13);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v14;

    v16 = (BRNotificationQueue *)objc_alloc_init(MEMORY[0x1E0D10E90]);
    notifs = v7->_notifs;
    v7->_notifs = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    additionalUpdatesItemRowID = v7->_additionalUpdatesItemRowID;
    v7->_additionalUpdatesItemRowID = v18;

    -[BRCAccountSession clientDB](v7->_session, "clientDB");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "serialQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __49__BRCNotificationManager_initWithAccountSession___block_invoke;
    v31 = &unk_1E875D470;
    v32 = v5;
    v22 = v7;
    v33 = v22;
    dispatch_sync(v21, &v28);

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    watchersByFileObjectID = v22->_watchersByFileObjectID;
    v22->_watchersByFileObjectID = v23;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable", v28, v29, v30, v31);
    v25 = objc_claimAutoreleasedReturnValue();
    fileObjectIDByWatcher = v22->_fileObjectIDByWatcher;
    v22->_fileObjectIDByWatcher = (NSMapTable *)v25;

  }
  return v7;
}

void __49__BRCNotificationManager_initWithAccountSession___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nextNotifRank");

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) = v3;
}

- (void)close
{
  NSObject *queue;
  BRCNotificationManager *v4;
  NSMutableDictionary *watchersByFileObjectID;
  NSMapTable *fileObjectIDByWatcher;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__BRCNotificationManager_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = self;
  objc_sync_enter(v4);
  watchersByFileObjectID = v4->_watchersByFileObjectID;
  v4->_watchersByFileObjectID = 0;

  fileObjectIDByWatcher = v4->_fileObjectIDByWatcher;
  v4->_fileObjectIDByWatcher = 0;

  objc_sync_exit(v4);
}

uint64_t __31__BRCNotificationManager_close__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6++), "close");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (void)registerAppLibraries:(id)a3 forFlags:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t *p_activeAliasQueries;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if ((a4 & 4) != 0)
  {
    p_activeAliasQueries = &self->_activeAliasQueries;
    do
      v9 = __ldaxr(p_activeAliasQueries);
    while (__stlxr(v9 + 1, p_activeAliasQueries));
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    v13 = (a4 >> 2) & 1;
    v14 = (a4 >> 1) & 1;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "registerQueryWithAliases:isRecursive:", v13, v14);
      }
      while (v11 != v15);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)unregisterAppLibraries:(id)a3 forFlags:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_activeAliasQueries;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "unregisterQueryWithAliases:isRecursive:", (a4 >> 2) & 1, (a4 >> 1) & 1);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  if ((a4 & 4) != 0)
  {
    p_activeAliasQueries = &self->_activeAliasQueries;
    do
      v12 = __ldaxr(p_activeAliasQueries);
    while (__stlxr(v12 - 1, p_activeAliasQueries));
  }

}

- (void)registerPipe:(id)a3 asWatcherForFileObjectID:(id)a4
{
  id v6;
  id v7;
  BRCNotificationManager *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[BRCNotificationManager unregisterPipeAsWatcher:](v8, "unregisterPipeAsWatcher:", v6);
  -[NSMapTable objectForKey:](v8->_fileObjectIDByWatcher, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_watchersByFileObjectID, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v6);

  }
  -[NSMapTable setObject:forKey:](v8->_fileObjectIDByWatcher, "setObject:forKey:", v7, v6);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_watchersByFileObjectID, "objectForKeyedSubscript:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_watchersByFileObjectID, "setObject:forKeyedSubscript:", v11, v7);
  }
  objc_msgSend(v11, "addObject:", v6);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412802;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] Pipe %@ watching %@%@", (uint8_t *)&v14, 0x20u);
  }

  objc_sync_exit(v8);
}

- (void)unregisterPipeAsWatcher:(id)a3
{
  id v4;
  BRCNotificationManager *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](v5->_fileObjectIDByWatcher, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v5->_watchersByFileObjectID, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v4);
    if (!objc_msgSend(v7, "count"))
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_watchersByFileObjectID, "setObject:forKeyedSubscript:", 0, v6);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412802;
      v11 = v4;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] Pipe %@ no longer watching %@%@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_sync_exit(v5);

}

- (void)getPipeWithXPCReceiver:(id)a3 client:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  BRCNotificationManager *v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCNotificationManager getPipeWithXPCReceiver:client:reply:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

  }
  queue = self->_queue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __62__BRCNotificationManager_getPipeWithXPCReceiver_client_reply___block_invoke;
  v23[3] = &unk_1E875DDA0;
  v24 = v8;
  v25 = v9;
  v26 = self;
  v27 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v23);

}

void __62__BRCNotificationManager_getPipeWithXPCReceiver_client_reply___block_invoke(_QWORD *a1)
{
  BRCNotificationPipe *v2;

  v2 = -[BRCNotificationPipe initWithXPCReceiver:client:manager:startingRank:]([BRCNotificationPipe alloc], "initWithXPCReceiver:client:manager:startingRank:", a1[4], a1[5], a1[6], *(_QWORD *)(a1[6] + 96));
  -[BRCNotificationPipe setDelegate:](v2, "setDelegate:", a1[5]);
  objc_msgSend(*(id *)(a1[6] + 16), "addObject:", v2);
  (*(void (**)(void))(a1[7] + 16))();

}

- (id)pipeWithReceiver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  BRCNotificationManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__BRCNotificationManager_pipeWithReceiver___block_invoke;
  block[3] = &unk_1E875D528;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __43__BRCNotificationManager_pipeWithReceiver___block_invoke(_QWORD *a1)
{
  BRCNotificationPipe *v2;
  uint64_t v3;
  void *v4;

  v2 = -[BRCNotificationPipe initWithReceiver:manager:startingRank:]([BRCNotificationPipe alloc], "initWithReceiver:manager:startingRank:", a1[4], a1[5], *(_QWORD *)(a1[5] + 96));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[5] + 16), "addObject:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)queueUpdate:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *queue;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  objc_msgSend(v4, "fileObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCNotificationManager queueUpdate:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __38__BRCNotificationManager_queueUpdate___block_invoke;
  v16[3] = &unk_1E875D470;
  v16[4] = self;
  v17 = v4;
  v7 = v4;
  dispatch_async_with_logs_1(queue, v16);

}

uint64_t __38__BRCNotificationManager_queueUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addNotification:asDead:", *(_QWORD *)(a1 + 40), 0);
}

- (void)queueUpdateForItemAtRowID:(unint64_t)a3
{
  NSMutableSet *additionalUpdatesItemRowID;
  void *v6;
  NSMutableSet *obj;

  obj = self->_additionalUpdatesItemRowID;
  objc_sync_enter(obj);
  additionalUpdatesItemRowID = self->_additionalUpdatesItemRowID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](additionalUpdatesItemRowID, "addObject:", v6);

  objc_sync_exit(obj);
}

- (void)fetchLastFlushedRankWithReply:(id)a3
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
  v7[2] = __56__BRCNotificationManager_fetchLastFlushedRankWithReply___block_invoke;
  v7[3] = &unk_1E875F7C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __56__BRCNotificationManager_fetchLastFlushedRankWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)_dispatchUpdatesToPipesWithRank:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_previousMaxRank != a3)
  {
    objc_msgSend(MEMORY[0x1E0D10E78], "br_getDomainIdentifierForCurrentPersona");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CAAD28], "br_sharedProviderManagerWithDomainID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "br_signalWorkingSetEnumeratorWithCompletionHandler:", &__block_literal_global_11);

  }
  self->_previousMaxRank = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_pipes;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D17A6BE8](v8);
        objc_msgSend(v12, "processUpdates:withRank:", self->_notifs, a3, (_QWORD)v14);
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v9 = v8;
    }
    while (v8);
  }

  -[BRNotificationQueue removeAllObjects](self->_notifs, "removeAllObjects");
}

void __58__BRCNotificationManager__dispatchUpdatesToPipesWithRank___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      __58__BRCNotificationManager__dispatchUpdatesToPipesWithRank___block_invoke_cold_1((uint64_t)v2, (uint64_t)v3, v4);

  }
}

- (void)_queueAdditionalUpdates
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableSet *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20[3];
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  obj = self->_additionalUpdatesItemRowID;
  objc_sync_enter(obj);
  if (-[NSMutableSet count](self->_additionalUpdatesItemRowID, "count"))
  {
    v3 = (void *)-[NSMutableSet copy](self->_additionalUpdatesItemRowID, "copy");
    -[NSMutableSet removeAllObjects](self->_additionalUpdatesItemRowID, "removeAllObjects");
    objc_sync_exit(obj);

    memset(v20, 0, sizeof(v20));
    __brc_create_section(0, (uint64_t)"-[BRCNotificationManager _queueAdditionalUpdates]", 265, v20);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v13 = v20[0];
      v14 = objc_msgSend(v3, "count");
      *(_DWORD *)buf = 134218498;
      v23 = v13;
      v24 = 2048;
      v25 = v14;
      v26 = 2112;
      v27 = v4;
      _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx collecting %lu additional folder updates%@", buf, 0x20u);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
          v11 = (void *)MEMORY[0x1D17A6BE8]();
          -[BRCAccountSession itemByRowID:](self->_session, "itemByRowID:", objc_msgSend(v10, "unsignedLongLongValue"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "triggerNotificationIfNeeded");

          objc_autoreleasePoolPop(v11);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v7);
    }

    __brc_leave_section(v20);
  }
  else
  {
    objc_sync_exit(obj);

  }
}

- (void)flushUpdatesWithRank:(unint64_t)a3
{
  OS_dispatch_queue *queue;
  _QWORD v6[6];

  -[BRCNotificationManager _queueAdditionalUpdates](self, "_queueAdditionalUpdates");
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__BRCNotificationManager_flushUpdatesWithRank___block_invoke;
  v6[3] = &unk_1E875F828;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_with_logs_1(queue, v6);
}

uint64_t __47__BRCNotificationManager_flushUpdatesWithRank___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchUpdatesToPipesWithRank:", *(_QWORD *)(a1 + 40));
}

- (void)invalidatePipesWatchingAppLibraryIDs:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  BRCNotificationManager *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__BRCNotificationManager_invalidatePipesWatchingAppLibraryIDs___block_invoke;
  block[3] = &unk_1E875D470;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __63__BRCNotificationManager_invalidatePipesWatchingAppLibraryIDs___block_invoke(uint64_t a1)
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
  uint64_t v13[3];
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationManager invalidatePipesWatchingAppLibraryIDs:]_block_invoke", 285, v13);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v16 = v13[0];
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx invalidating pipes watching %@%@", buf, 0x20u);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidateIfWatchingAppLibraryIDs:", *(_QWORD *)(a1 + 32));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  __brc_leave_section(v13);
}

- (void)pipeDelegateInvalidated:(id)a3
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
  v7[2] = __50__BRCNotificationManager_pipeDelegateInvalidated___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __50__BRCNotificationManager_pipeDelegateInvalidated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v2, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);

        if (v9 == v10)
          objc_msgSend(v8, "close");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)invalidatePipeReceiversWatchingAppLibraryIDs:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BRCNotificationManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__BRCNotificationManager_invalidatePipeReceiversWatchingAppLibraryIDs_completionBlock___block_invoke;
  v11[3] = &unk_1E875EB70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async_with_logs_1(queue, v11);

}

void __87__BRCNotificationManager_invalidatePipeReceiversWatchingAppLibraryIDs_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13[3];
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationManager invalidatePipeReceiversWatchingAppLibraryIDs:completionBlock:]_block_invoke", 310, v13);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    *(_DWORD *)buf = 134218498;
    v16 = v13[0];
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx invalidating NSMDQs watching %@%@", buf, 0x20u);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(a1[5] + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidateReceiverIfWatchingAppLibraryIDs:", a1[4], (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(a1[6] + 16))();
  __brc_leave_section(v13);
}

- (BOOL)hasWatcherMatchingGlobalItemID:(id)a3
{
  id v4;
  BRCNotificationManager *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5->_pipes;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isWatchingGlobalItemID:", v4, (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectIDByWatcher, 0);
  objc_storeStrong((id *)&self->_additionalUpdatesItemRowID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_transferCache, 0);
  objc_storeStrong((id *)&self->_notifs, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_watchersByFileObjectID, 0);
  objc_storeStrong((id *)&self->_pipes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)getPipeWithXPCReceiver:(uint64_t)a3 client:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: reply%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)queueUpdate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: item.fileObjectID%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __58__BRCNotificationManager__dispatchUpdatesToPipesWithRank___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CBD43000, log, (os_log_type_t)0x90u, "[ERROR] failed to signal enumerator for root container: %@%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
