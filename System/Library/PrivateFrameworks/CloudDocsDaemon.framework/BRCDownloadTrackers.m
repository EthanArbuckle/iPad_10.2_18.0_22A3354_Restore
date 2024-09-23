@implementation BRCDownloadTrackers

- (BRCDownloadTrackers)initWithSession:(id)a3
{
  id v4;
  BRCDownloadTrackers *v5;
  BRCDownloadTrackers *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCDownloadTrackers;
  v5 = -[BRCDownloadTrackers init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_session, v4);

  return v6;
}

- (id)trackedFileObjectIDs
{
  BRCDownloadTrackers *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allKeys](v2->_trackersByFileObjectID, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)addDownloadTracker:(id)a3 forFileObjectID:(id)a4 withEtagIfLoser:(id)a5
{
  id v8;
  id v9;
  id v10;
  BRCDownloadTrackers *v11;
  void *v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *trackersByFileObjectID;
  void *v16;
  id v17;
  NSMapTable *fileObjectIDsByTracker;
  uint64_t v19;
  NSMapTable *v20;
  id v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v22 = 134219010;
    v23 = v8;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] addDownloadTracker %p %@ forFileObjectID %@ withEtagIfLoser %@%@", (uint8_t *)&v22, 0x34u);
  }

  if (!v11->_trackersByFileObjectID)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackersByFileObjectID = v11->_trackersByFileObjectID;
    v11->_trackersByFileObjectID = v14;

  }
  +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v9, v10, objc_msgSend(v8, "kind"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v11->_trackersByFileObjectID, "objectForKeyedSubscript:", v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_trackersByFileObjectID, "setObject:forKeyedSubscript:", v17, v16);
  }
  objc_msgSend(v17, "addObject:", v8);
  fileObjectIDsByTracker = v11->_fileObjectIDsByTracker;
  if (!fileObjectIDsByTracker)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v11->_fileObjectIDsByTracker;
    v11->_fileObjectIDsByTracker = (NSMapTable *)v19;

    fileObjectIDsByTracker = v11->_fileObjectIDsByTracker;
  }
  -[NSMapTable objectForKey:](fileObjectIDsByTracker, "objectForKey:", v8);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMapTable setObject:forKey:](v11->_fileObjectIDsByTracker, "setObject:forKey:", v21, v8);
  }
  objc_msgSend(v21, "addObject:", v16);

  objc_sync_exit(v11);
}

- (void)removeDownloadTracker:(id)a3
{
  id v4;
  BRCDownloadTrackers *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *trackersByFileObjectID;
  NSMapTable *fileObjectIDsByTracker;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCDownloadTrackers removeDownloadTracker:].cold.1((uint64_t)v4, (uint64_t)v6, v7);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable objectForKey:](v5->_fileObjectIDsByTracker, "objectForKey:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v5->_trackersByFileObjectID, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObject:", v4);
        if (!objc_msgSend(v13, "count"))
          -[NSMutableDictionary removeObjectForKey:](v5->_trackersByFileObjectID, "removeObjectForKey:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if (!-[NSMutableDictionary count](v5->_trackersByFileObjectID, "count"))
  {
    trackersByFileObjectID = v5->_trackersByFileObjectID;
    v5->_trackersByFileObjectID = 0;

  }
  -[NSMapTable removeObjectForKey:](v5->_fileObjectIDsByTracker, "removeObjectForKey:", v4);
  if (!-[NSMapTable count](v5->_fileObjectIDsByTracker, "count"))
  {
    fileObjectIDsByTracker = v5->_fileObjectIDsByTracker;
    v5->_fileObjectIDsByTracker = 0;

  }
  objc_sync_exit(v5);

}

- (void)document:(id)a3 didCompleteDownloadWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BRCDownloadTrackers *v10;
  NSMutableDictionary *trackersByFileObjectID;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "fileObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(v6, "orig"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "fileObjectID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8))
  {
    v10 = self;
    objc_sync_enter(v10);
    trackersByFileObjectID = v10->_trackersByFileObjectID;
    +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v8, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](trackersByFileObjectID, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    objc_sync_exit(v10);
    if (v14)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v27 = v6;
        v28 = 2112;
        v29 = 0;
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v15;
        _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[NOTIF] document %@ didCompleteDownloadEtagIfLoser %@ withError %@ -- notifying trackers%@", buf, 0x2Au);
      }

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:", v8, 0, v7, (_QWORD)v21);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v18);
    }

  }
}

- (BRCAccountSession)session
{
  return (BRCAccountSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectIDsByTracker, 0);
  objc_storeStrong((id *)&self->_trackersByFileObjectID, 0);
  objc_destroyWeak((id *)&self->_session);
}

- (unint64_t)spaceRequiredForTrackers
{
  void *v3;
  void *v4;
  BRCDownloadTrackers *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[BRCDownloadTrackers session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertOnQueue");

  v5 = self;
  objc_sync_enter(v5);
  -[BRCDownloadTrackers trackedFileObjectIDs](v5, "trackedFileObjectIDs");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "fileObjectID", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "itemByFileObjectID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "desiredVersion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "size");

        v7 += v14;
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)hasPendingTrackerForFileObjectID:(id)a3
{
  id v4;
  BRCDownloadTrackers *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[BRCDownloadTrackers trackedFileObjectIDs](v5, "trackedFileObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__BRCDownloadTrackers_LegacyAdditions__hasPendingTrackerForFileObjectID___block_invoke;
  v9[3] = &unk_1E8761DB0;
  v11 = &v12;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  objc_sync_exit(v5);

  return (char)v6;
}

void __73__BRCDownloadTrackers_LegacyAdditions__hasPendingTrackerForFileObjectID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a2, "fileObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (void)removeDownloadTracker:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 134218498;
  v4 = a1;
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[NOTIF] Removing download tracker %p %@%@", (uint8_t *)&v3, 0x20u);
}

@end
