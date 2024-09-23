@implementation BRCSyncContextProvider

- (BRCSyncContextProvider)initWithAccountSession:(id)a3
{
  id v5;
  BRCSyncContextProvider *v6;
  uint64_t v7;
  NSMutableDictionary *syncContexts;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCSyncContextProvider;
  v6 = -[BRCSyncContextProvider init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    syncContexts = v6->_syncContexts;
    v6->_syncContexts = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v6;
}

- (id)_syncContextForContextIdentifier:(id)a3 isShared:(BOOL)a4 createIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  BRCSyncContextProvider *v9;
  BRCSyncContext *v10;
  BOOL v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  -[NSMutableDictionary objectForKeyedSubscript:](v9->_syncContexts, "objectForKeyedSubscript:", v8);
  v10 = (BRCSyncContext *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = 1;
  else
    v11 = !v5;
  if (!v11)
  {
    if (v9->_syncContexts)
    {
      v10 = -[BRCSyncContext initWithSession:contextIdentifier:isShared:]([BRCSyncContext alloc], "initWithSession:contextIdentifier:isShared:", v9->_session, v8, v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_syncContexts, "setObject:forKeyedSubscript:", v10, v8);
      -[BRCSyncContext resume](v10, "resume");
    }
    else
    {
      v10 = 0;
    }
  }
  objc_sync_exit(v9);

  return v10;
}

- (id)_syncContextIdentifierForMangledID:(id)a3 metadata:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "isShared"))
  {
    if (v4)
    {
      v6 = (id)*MEMORY[0x1E0D10DF0];
    }
    else
    {
      objc_msgSend(v5, "aliasTargetContainerString");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  if (!v4 || !objc_msgSend(v5, "isCloudDocsMangledID"))
  {
    objc_msgSend(v5, "appLibraryOrZoneName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v9 = v6;
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "appLibraryOrZoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-metadata"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v9;
}

- (id)defaultSyncContext
{
  return -[BRCSyncContextProvider _syncContextForContextIdentifier:isShared:createIfNeeded:](self, "_syncContextForContextIdentifier:isShared:createIfNeeded:", *MEMORY[0x1E0D10DA0], 0, 1);
}

- (id)sharedMetadataSyncContext
{
  return -[BRCSyncContextProvider _syncContextForContextIdentifier:isShared:createIfNeeded:](self, "_syncContextForContextIdentifier:isShared:createIfNeeded:", *MEMORY[0x1E0D10DF0], 1, 1);
}

- (id)zoneHealthSyncContext
{
  return -[BRCSyncContextProvider _syncContextForContextIdentifier:isShared:createIfNeeded:](self, "_syncContextForContextIdentifier:isShared:createIfNeeded:", *MEMORY[0x1E0D10E20], 0, 1);
}

- (id)sideCarSyncContext
{
  return -[BRCSyncContextProvider _syncContextForContextIdentifier:isShared:createIfNeeded:](self, "_syncContextForContextIdentifier:isShared:createIfNeeded:", *MEMORY[0x1E0D11150], 0, 1);
}

- (id)transferSyncContextForMangledID:(id)a3
{
  return -[BRCSyncContextProvider transferSyncContextForMangledID:createIfNeeded:](self, "transferSyncContextForMangledID:createIfNeeded:", a3, 1);
}

- (id)transferSyncContextForMangledID:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[BRCSyncContextProvider _syncContextIdentifierForMangledID:metadata:](self, "_syncContextIdentifierForMangledID:metadata:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isShared");

  -[BRCSyncContextProvider _syncContextForContextIdentifier:isShared:createIfNeeded:](self, "_syncContextForContextIdentifier:isShared:createIfNeeded:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)metadataSyncContextForMangledID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[BRCSyncContextProvider _syncContextIdentifierForMangledID:metadata:](self, "_syncContextIdentifierForMangledID:metadata:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isShared");

  -[BRCSyncContextProvider _syncContextForContextIdentifier:isShared:createIfNeeded:](self, "_syncContextForContextIdentifier:isShared:createIfNeeded:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allSyncContexts
{
  BRCSyncContextProvider *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allValues](v2->_syncContexts, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)closeSyncContexts
{
  BRCSyncContextProvider *v2;
  void *v3;
  NSMutableDictionary *syncContexts;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[BRCSyncContextProvider allSyncContexts](v2, "allSyncContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  syncContexts = v2->_syncContexts;
  v2->_syncContexts = 0;

  objc_sync_exit(v2);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v23 = 0;
        v24 = 0;
        v25 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCSyncContextProvider closeSyncContexts]", 107, &v23);
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v32 = v23;
          v33 = 2112;
          v34 = v9;
          v35 = 2112;
          v36 = v10;
          _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cancelling %@...%@", buf, 0x20u);
        }

        objc_msgSend(v9, "cancel");
        __brc_leave_section(&v23);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    }
    while (v6);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v23 = 0;
        v24 = 0;
        v25 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCSyncContextProvider closeSyncContexts]", 112, &v23);
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v32 = v23;
          v33 = 2112;
          v34 = v16;
          v35 = 2112;
          v36 = v17;
          _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx closing %@...%@", buf, 0x20u);
        }

        objc_msgSend(v16, "close");
        __brc_leave_section(&v23);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_syncContexts, 0);
}

@end
