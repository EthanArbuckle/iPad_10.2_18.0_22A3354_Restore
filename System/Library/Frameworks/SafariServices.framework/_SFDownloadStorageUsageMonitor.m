@implementation _SFDownloadStorageUsageMonitor

- (_SFDownloadStorageUsageMonitor)init
{
  _SFDownloadStorageUsageMonitor *v2;
  SFDownloadFile *v3;
  void *v4;
  uint64_t v5;
  SFDownloadFile *historyFile;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *entries;
  NSObject *v11;
  _SFDownloadStorageUsageMonitor *v12;
  _SFDownloadStorageUsageMonitor *v13;
  _QWORD block[4];
  _SFDownloadStorageUsageMonitor *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_SFDownloadStorageUsageMonitor;
  v2 = -[_SFDownloadStorageUsageMonitor init](&v17, sel_init);
  if (v2)
  {
    v3 = [SFDownloadFile alloc];
    +[_SFDownloadManager defaultDownloadsHistoryURL](_SFDownloadManager, "defaultDownloadsHistoryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SFDownloadFile initWithURL:](v3, "initWithURL:", v4);
    historyFile = v2->_historyFile;
    v2->_historyFile = (SFDownloadFile *)v5;

    -[SFDownloadFile setDelegate:](v2->_historyFile, "setDelegate:", v2);
    v7 = dispatch_queue_create("_SFDownloadStorageUsageMonitor internal queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    entries = v2->_entries;
    v2->_entries = v9;

    v11 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38___SFDownloadStorageUsageMonitor_init__block_invoke;
    block[3] = &unk_1E4ABFE00;
    v12 = v2;
    v16 = v12;
    dispatch_async(v11, block);
    v13 = v12;

  }
  return v2;
}

- (int64_t)usage
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39___SFDownloadStorageUsageMonitor_usage__block_invoke;
  v5[3] = &unk_1E4AC0D98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_reloadDownloadHistory
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SFDownloadStorageUsageMonitorEntry *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  id obj;
  _QWORD block[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[SFDownloadFile URL](self->_historyFile, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFDownloadManager downloadRepresentationsAtURL:](_SFDownloadManager, "downloadRepresentationsAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[NSMutableDictionary allKeys](self->_entries, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v12, "safari_stringForKey:", CFSTR("Identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);

        -[NSMutableDictionary objectForKeyedSubscript:](self->_entries, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_entries, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v18 = -[SFDownloadStorageUsageMonitorEntry initWithIdentifier:]([SFDownloadStorageUsageMonitorEntry alloc], "initWithIdentifier:", v15);

          -[SFDownloadStorageUsageMonitorEntry setDelegate:](v18, "setDelegate:", self);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entries, "setObject:forKeyedSubscript:", v18, v15);
          v16 = v18;
        }
        objc_msgSend(v16, "updateWithDictionaryRepresentation:", v12);
        objc_msgSend(v7, "removeObject:", v15);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = v7;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_entries, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v22 += objc_msgSend(v26, "cachedUsage");

        -[NSMutableDictionary removeObjectForKey:](self->_entries, "removeObjectForKey:", v25);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);

    if (v22)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56___SFDownloadStorageUsageMonitor__reloadDownloadHistory__block_invoke;
      block[3] = &unk_1E4ABFE00;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {

  }
}

- (void)entryDidChangeUsage:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___SFDownloadStorageUsageMonitor_entryDidChangeUsage___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)downloadFileContentsDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___SFDownloadStorageUsageMonitor_downloadFileContentsDidChange___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_historyFile, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
