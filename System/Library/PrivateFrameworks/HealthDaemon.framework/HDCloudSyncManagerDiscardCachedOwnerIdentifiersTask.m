@implementation HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask

- (HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask)initWithDaemon:(id)a3
{
  id v4;
  HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask *v5;
  HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask;
  v5 = -[HDCloudSyncManagerTask init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_daemon, v4);

  return v6;
}

- (void)main
{
  HDDaemon **p_daemon;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  p_daemon = &self->_daemon;
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "profileManager", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allProfileIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = objc_loadWeakRetained((id *)p_daemon);
        objc_msgSend(v12, "profileManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "profileForIdentifier:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "cloudSyncManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ownerIdentifierManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "discardCachedIdentifiers");

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[HDCloudSyncManagerTask finish](self, "finish");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
}

@end
