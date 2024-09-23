@implementation BLDownloadQueueServerProgressObserver

- (NSArray)downloads
{
  os_unfair_lock_s *p_activeDownloadsLock;
  void *v4;
  void *v5;
  void *v6;

  p_activeDownloadsLock = &self->_activeDownloadsLock;
  os_unfair_lock_lock(&self->_activeDownloadsLock);
  -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  os_unfair_lock_unlock(p_activeDownloadsLock);
  return (NSArray *)v6;
}

- (void)reconnectingToServiceForProxy:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  BLDownloadQueueServiceProgressMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEFAULT, "[BLDownloadQueueServerProgressObserver] registering to monitor progress.", v5, 2u);
  }

  objc_msgSend(v3, "monitorProgressWithReply:", &unk_24CE8B598);
}

- (BLDownloadQueueServerProgressObserver)initWithDownloadQueue:(id)a3
{
  id v4;
  BLDownloadQueueServerProgressObserver *v5;
  BLDownloadQueueServerProgressObserver *v6;
  uint64_t v7;
  NSHashTable *observers;
  uint64_t v9;
  NSMutableDictionary *activeDownloads;
  BLServiceProxy *v11;
  BLServiceProxy *serviceProxy;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLDownloadQueueServerProgressObserver;
  v5 = -[BLDownloadQueueServerProgressObserver init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_downloadQueue, v4);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    *(_QWORD *)&v6->_observersLock._os_unfair_lock_opaque = 0;
    v9 = objc_opt_new();
    activeDownloads = v6->_activeDownloads;
    v6->_activeDownloads = (NSMutableDictionary *)v9;

    v11 = -[BLServiceProxy initWithProgressReceiver:error:]([BLServiceProxy alloc], "initWithProgressReceiver:error:", v6, 0);
    serviceProxy = v6->_serviceProxy;
    v6->_serviceProxy = v11;

    -[BLServiceProxy setConnectionMonitor:](v6->_serviceProxy, "setConnectionMonitor:", v6);
    -[BLDownloadQueueServerProgressObserver reconnectingToServiceForProxy:](v6, "reconnectingToServiceForProxy:", v6->_serviceProxy);
  }

  return v6;
}

- (void)registerObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[BLDownloadQueueServerProgressObserver observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    os_unfair_lock_unlock(&self->_observersLock);
    BLDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Added observer: %@", (uint8_t *)&v7, 0xCu);
    }

    -[BLDownloadQueueServerProgressObserver _postUpdatesForCurrentlyPausedDownloadsForObserver:](self, "_postUpdatesForCurrentlyPausedDownloadsForObserver:", v4);
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)_postUpdatesForCurrentlyPausedDownloadsForObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[BLDownloadQueueServerProgressObserver serviceProxy](self, "serviceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212C7B27C;
  v7[3] = &unk_24CE8B558;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "fetchDownloadListWithReply:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (BLServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (NSMutableDictionary)activeDownloads
{
  return self->_activeDownloads;
}

- (void)dealloc
{
  objc_super v3;

  -[BLServiceProxy shutdown](self->_serviceProxy, "shutdown");
  v3.receiver = self;
  v3.super_class = (Class)BLDownloadQueueServerProgressObserver;
  -[BLDownloadQueueServerProgressObserver dealloc](&v3, sel_dealloc);
}

- (void)cancelAllPausedDownloads
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    BLDownloadQueueServiceProgressMonitorLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: _cancelAllPausedDownloads", buf, 2u);
    }

    os_unfair_lock_lock(&self->_observersLock);
    -[BLDownloadQueueServerProgressObserver observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v6, "copy");

    -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    os_unfair_lock_unlock(&self->_observersLock);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      v24 = *(_QWORD *)v34;
      do
      {
        v13 = 0;
        v26 = v11;
        do
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
          if (objc_msgSend(v14, "downloadPhase") == 3)
          {
            v28 = v13;
            objc_msgSend(v14, "setDownloadPhase:", 4);
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v15 = v25;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v30 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    BLDownloadQueueServiceProgressMonitorLog();
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v39 = v20;
                      _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifyComplete: for observer %@", buf, 0xCu);
                    }

                    -[BLDownloadQueueServerProgressObserver downloadQueue](self, "downloadQueue");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = v14;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "downloadQueue:downloadStates:didCompleteWithError:", v22, v23, 0);

                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
              }
              while (v17);
            }

            v12 = v24;
            v11 = v26;
            v13 = v28;
          }
          ++v13;
        }
        while (v13 != v11);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v11);
    }

    os_unfair_lock_lock(&self->_activeDownloadsLock);
    -[BLDownloadQueueServerProgressObserver setActiveDownloads:](self, "setActiveDownloads:", 0);
    os_unfair_lock_unlock(&self->_activeDownloadsLock);

  }
}

- (void)notifyPurchaseAttemptForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v4;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: NotifyPurchaseAttemptForRequest: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_observersLock);
  -[BLDownloadQueueServerProgressObserver observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(&self->_observersLock);
  -[BLDownloadQueueServerProgressObserver downloadQueue](self, "downloadQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v26)
  {
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      v10 = sel_downloadQueue_purchaseAttemptForRequest_;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          BLDefaultLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v11;
            _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifying observer %@ of purchaseAttemptForRequest:", buf, 0xCu);
          }

          objc_msgSend(v11, "downloadQueue:purchaseAttemptForRequest:", v27, v4);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v13 = v10;
          v14 = v8;
          BLDefaultLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v11;
            _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifying observer %@ of downloadQueuePurchaseAttemptForIDWithUserInfo", buf, 0xCu);
          }

          objc_msgSend(v4, "storeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "buyParameters");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v4, "isAudiobook");
          objc_msgSend(v4, "analyticsInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "downloadQueue:purchaseAttemptForID:buyParams:isAudioBook:userInfo:", v27, v17, v18, v19, v20);

          v8 = v14;
          v10 = v13;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          BLDefaultLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v11;
            _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifying observer %@ of downloadQueuePurchaseAttemptForID", buf, 0xCu);
          }

          objc_msgSend(v4, "storeIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "buyParameters");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "downloadQueue:purchaseAttemptForID:buyParams:isAudioBook:", v27, v23, v24, objc_msgSend(v4, "isAudiobook"));

        }
        ++v9;
      }
      while (v26 != v9);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v26);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    -[BLDownloadQueueServerProgressObserver observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      -[BLDownloadQueueServerProgressObserver observers](self, "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v4);

    }
    os_unfair_lock_unlock(p_observersLock);
    BLDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Removed observer: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)notifyDidCompleteForDownloadID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  os_unfair_lock_s *p_activeDownloadsLock;
  void *v20;
  void *v21;
  BLDownloadQueueServerProgressObserver *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v4;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifyDidCompleteForDownloadID", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_observersLock);
  -[BLDownloadQueueServerProgressObserver observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_observersLock);
  if (objc_msgSend(v9, "downloadPhase") == 3 || objc_msgSend(v9, "downloadPhase") == 1)
  {
    v23 = v4;
    objc_msgSend(v9, "setDownloadPhase:", 4);
    v22 = self;
    -[BLDownloadQueueServerProgressObserver downloadQueue](self, "downloadQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            BLDefaultLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v16;
              _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: notifyComplete: for observer %@", buf, 0xCu);
            }

            v28 = v9;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "downloadQueue:downloadStates:didCompleteWithError:", v10, v18, 0);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v13);
    }

    self = v22;
    v4 = v23;
    v7 = v21;
  }
  p_activeDownloadsLock = &self->_activeDownloadsLock;
  os_unfair_lock_lock(&self->_activeDownloadsLock);
  -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v4);

  os_unfair_lock_unlock(p_activeDownloadsLock);
}

- (void)sendInitialProgressNotificationForDownloadWithStoreID:(id)a3 storePlaylistID:(id)a4 orPermlink:(id)a5 downloadID:(id)a6 title:(id)a7 collectionTitle:(id)a8 assetKind:(id)a9 isPaused:(BOOL)a10 targetObserver:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  os_unfair_lock_s *p_observersLock;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  NSObject *v51;
  _BYTE v52[128];
  NSObject *v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  NSObject *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v45 = a9;
  v23 = a11;
  BLDefaultLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v20;
    _os_log_impl(&dword_212C78000, v24, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: sendInitialProgressNotificationForDownloadWithStoreID...", buf, 0xCu);
  }

  v44 = v22;
  if (v20)
  {
    LOBYTE(v40) = a10;
    v25 = v45;
    -[BLDownloadQueueServerProgressObserver _downloadStatusStoreID:storePlaylistID:orPermLink:downloadID:title:collectionTitle:assetKind:isPaused:](self, "_downloadStatusStoreID:storePlaylistID:orPermLink:downloadID:title:collectionTitle:assetKind:isPaused:", v17, v18, v19, v20, v21, v22, v45, v40);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v43 = v17;
      -[BLDownloadQueueServerProgressObserver downloadQueue](self, "downloadQueue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        BLDefaultLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v55 = v20;
          v56 = 2112;
          v57 = v23;
          v58 = 2112;
          v59 = v26;
          _os_log_impl(&dword_212C78000, v28, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying target observer: %@ of downloadStatesDidChange: %@", buf, 0x20u);
        }

        v53 = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "downloadQueue:downloadStatesDidChange:", v27, v29);
      }
      else
      {
        v41 = v23;
        v42 = v21;
        v46 = v20;
        p_observersLock = &self->_observersLock;
        os_unfair_lock_lock(&self->_observersLock);
        -[BLDownloadQueueServerProgressObserver observers](self, "observers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "copy");

        os_unfair_lock_unlock(p_observersLock);
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v29 = v32;
        v33 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v48 != v35)
                objc_enumerationMutation(v29);
              v37 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              if ((!-[NSObject isAudiobook](v26, "isAudiobook") || (sub_212C93C70(v37) & 1) == 0)
                && (objc_opt_respondsToSelector() & 1) != 0)
              {
                BLDefaultLog();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543874;
                  v55 = v46;
                  v56 = 2112;
                  v57 = v37;
                  v58 = 2112;
                  v59 = v26;
                  _os_log_impl(&dword_212C78000, v38, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer: %@ of downloadStatesDidChange: %@", buf, 0x20u);
                }

                v51 = v26;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "downloadQueue:downloadStatesDidChange:", v27, v39);

              }
            }
            v34 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          }
          while (v34);
        }

        v20 = v46;
        v23 = v41;
        v21 = v42;
        v25 = v45;
      }

      v17 = v43;
    }
  }
  else
  {
    BLDefaultLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v25 = v45;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_ERROR, "[DownloadQueue]: nil passed for downloadID to _sendInitialProgressNotificationFor...", buf, 2u);
    }
  }

}

- (void)sendCancelCompletionNotificationForDownloadWithDownloadID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  NSObject *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v4;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: sendCancelCompletionNotificationForDownloadWithDownloadID", buf, 0xCu);
  }

  if (v4)
  {
    os_unfair_lock_lock(&self->_activeDownloadsLock);
    -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v4);

    os_unfair_lock_unlock(&self->_activeDownloadsLock);
    if (v7)
    {
      v22 = v4;
      -[NSObject setDownloadPhase:](v7, "setDownloadPhase:", 4);
      os_unfair_lock_lock(&self->_observersLock);
      -[BLDownloadQueueServerProgressObserver observers](self, "observers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      os_unfair_lock_unlock(&self->_observersLock);
      -[BLDownloadQueueServerProgressObserver downloadQueue](self, "downloadQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v13)
      {
        v15 = v13;
        v16 = *(_QWORD *)v24;
        *(_QWORD *)&v14 = 138543618;
        v21 = v14;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
            if ((!-[NSObject isAudiobook](v7, "isAudiobook", v21) || (sub_212C93C70(v18) & 1) == 0)
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              BLDefaultLog();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v21;
                v29 = v22;
                v30 = 2112;
                v31 = v18;
                _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: sendingCancelComplete for observer %@", buf, 0x16u);
              }

              v27 = v7;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "downloadQueue:downloadStates:didCompleteWithError:", v11, v20, 0);

            }
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        }
        while (v15);
      }

      v4 = v22;
    }
  }
  else
  {
    BLDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "[DownloadQueue]: _sendCancelCompleteNotification: nil passed for downloadID", buf, 2u);
    }
  }

}

- (id)_downloadStatusFromDictionary:(id)a3 outParamNewlyTrackedDownload:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *p_activeDownloadsLock;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("downloadIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    p_activeDownloadsLock = &self->_activeDownloadsLock;
    os_unfair_lock_lock(&self->_activeDownloadsLock);
    -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v11 = (void *)objc_opt_new();
      -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v8);

      if (a4)
        *a4 = 1;
    }
    os_unfair_lock_unlock(&self->_activeDownloadsLock);
    objc_msgSend(v11, "setDownloadID:", v8);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storeItemIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14 && (-[NSObject isEqual:](v14, "isEqual:", &unk_24CEA0898) & 1) == 0)
      objc_msgSend(v11, "setStoreID:", v14);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storePlaylistIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v11, "setStorePlaylistID:", v16);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("permLink"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(v11, "setPermLink:", v18);
    v64 = (void *)v18;
    v65 = (void *)v16;
    BLDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("percentComplete"), v18, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v8;
      v68 = 2112;
      v69 = v21;
      _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_DEBUG, "(dID=%{public}@) [DownloadQueue]: notifying percentComplete:[%@]", buf, 0x16u);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("percentComplete"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPercentComplete:", v23);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("estimatedTimeRemaining"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEstimatedTimeRemaining:", v25);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bytesDownloaded"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTransferBytesWritten:", v27);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bytesTotal"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTransferBytesExpected:", v29);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("downloadPhase"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setDownloadPhase:", objc_msgSend(v31, "integerValue"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("artistName"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setArtistName:", v33);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v35);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSubtitle:", v37);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("collectionArtistName"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCollectionArtistName:", v39);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("collectionTitle"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCollectionTitle:", v41);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("genre"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGenre:", v43);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kind"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssetKind:", v45);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("thumbnailImageURL"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _stringFromObject:](self, "_stringFromObject:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setThumbnailImageURL:", v47);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isAudiobook"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsAudiobook:", objc_msgSend(v49, "BOOLValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRestore"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsRestore:", objc_msgSend(v51, "BOOLValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSample"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsSample:", objc_msgSend(v53, "BOOLValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPurchase"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsPurchase:", objc_msgSend(v55, "BOOLValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("purchaseDate"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _dateFromObject:](self, "_dateFromObject:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPurchaseDate:", v57);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("persistentIdentifier"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPersistentIdentifier:", objc_msgSend(v59, "unsignedLongValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storeAccountIdentifier"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadQueueServerProgressObserver _numberFromObject:](self, "_numberFromObject:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStoreAccountIdentifier:", v61);

    os_unfair_lock_lock(&self->_activeDownloadsLock);
    -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v11, v8);

    os_unfair_lock_unlock(p_activeDownloadsLock);
  }
  else
  {
    BLDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v6;
      _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_ERROR, "[DownloadQueue]: _downloadStatusFromDictionary: failed to retrieve downloadID from dictionary %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (void)_postDownloadProgressNotificationWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char v38;
  void *v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38 = 0;
  -[BLDownloadQueueServerProgressObserver _downloadStatusFromDictionary:outParamNewlyTrackedDownload:](self, "_downloadStatusFromDictionary:outParamNewlyTrackedDownload:", v4, &v38);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "downloadID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v43 = v7;
    v44 = 2048;
    v45 = v5;
    v46 = 2048;
    v47 = v6;
    v48 = 2112;
    v49 = v4;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue] Copied download status %p to download status %p for dictionary %@", buf, 0x2Au);
  }

  if (v7)
  {
    v29 = v7;
    v27 = v5;
    v28 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    -[BLDownloadQueueServerProgressObserver observers](self, "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    os_unfair_lock_unlock(&self->_observersLock);
    if (v38)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v26 = v10;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v35 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              BLDefaultLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v43 = v29;
                v44 = 2112;
                v45 = v16;
                _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer %@ of downloadManagerDownloadsDidChange", buf, 0x16u);
              }

              objc_msgSend(v16, "downloadQueueDownloadsDidChange:", 0);
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        }
        while (v13);
      }

      v10 = v26;
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = v10;
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if ((!objc_msgSend(v6, "isAudiobook") || (sub_212C93C70(v23) & 1) == 0)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            BLDefaultLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v43 = v29;
              v44 = 2112;
              v45 = v23;
              v46 = 2112;
              v47 = v6;
              _os_log_impl(&dword_212C78000, v24, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer: %@ of downloadStatesDidChange: %@", buf, 0x20u);
            }

            v39 = v6;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "downloadQueue:downloadStatesDidChange:", 0, v25);

          }
        }
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v20);
    }

    v5 = v27;
    v4 = v28;
    v7 = v29;
  }
  else
  {
    BLDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "[DownloadQueue]: _notifyProgress: nil passed for downloadID", buf, 2u);
    }
  }

}

- (void)_postDownloadCompleteNotificationWithDictionary:(id)a3 failed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  const char *v35;
  uint32_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  _BOOL4 v47;
  BLDownloadQueueServerProgressObserver *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char v63;
  _BYTE v64[128];
  void *v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  id v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v4 = a4;
  v74 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v63 = 0;
  v48 = self;
  -[BLDownloadQueueServerProgressObserver _downloadStatusFromDictionary:outParamNewlyTrackedDownload:](self, "_downloadStatusFromDictionary:outParamNewlyTrackedDownload:", v6, &v63);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downloadID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BLDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v69 = v8;
    v70 = 2048;
    v71 = (uint64_t)v7;
    v72 = 2112;
    v73 = v6;
    _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue] Obtained download status %p for dictionary %@", buf, 0x20u);
  }

  if (v8)
  {
    v46 = v6;
    os_unfair_lock_lock(&v48->_observersLock);
    -[BLDownloadQueueServerProgressObserver observers](v48, "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    os_unfair_lock_unlock(&v48->_observersLock);
    BLDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 138543618;
      v69 = v8;
      v70 = 2048;
      v71 = v13;
      _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: _postDownloadCompleteNotification: About to notify %lu observers", buf, 0x16u);
    }
    v50 = v8;

    v49 = v7;
    if (v63)
    {
      v47 = v4;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v45 = v11;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v60 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              BLDefaultLog();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v69 = v50;
                v70 = 2112;
                v71 = (uint64_t)v19;
                _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: download added, notifying observer %@ of downloadQueueDownloadsDidChange", buf, 0x16u);
              }

              -[BLDownloadQueueServerProgressObserver downloadQueue](v48, "downloadQueue");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "downloadQueueDownloadsDidChange:", v21);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v16);
      }

      v4 = v47;
      v11 = v45;
    }
    if (v4)
    {
      BLError(33, CFSTR("download failed"), CFSTR("Download either failed or was cancelled by the user"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    -[BLDownloadQueueServerProgressObserver downloadQueue](v48, "downloadQueue", v45);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v25 = v11;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v56 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
          if ((!objc_msgSend(v7, "isAudiobook") || (sub_212C93C70(v30) & 1) == 0)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            BLDefaultLog();
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v22)
            {
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v69 = v50;
                v70 = 2112;
                v71 = (uint64_t)v30;
                v72 = 2112;
                v73 = v22;
                v33 = v32;
                v34 = OS_LOG_TYPE_ERROR;
                v35 = "(dID=%{public}@) [DownloadQueue]: notifying observer %@ download completed with error:  %@";
                v36 = 32;
                goto LABEL_37;
              }
            }
            else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v69 = v50;
              v70 = 2112;
              v71 = (uint64_t)v30;
              v33 = v32;
              v34 = OS_LOG_TYPE_DEFAULT;
              v35 = "(dID=%{public}@) [DownloadQueue]: notifying observer %@ download completed";
              v36 = 22;
LABEL_37:
              _os_log_impl(&dword_212C78000, v33, v34, v35, buf, v36);
            }

            v7 = v49;
            v65 = v49;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "downloadQueue:downloadStates:didCompleteWithError:", v24, v37, v22);

            continue;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
      }
      while (v27);
    }

    os_unfair_lock_lock(&v48->_activeDownloadsLock);
    -[BLDownloadQueueServerProgressObserver activeDownloads](v48, "activeDownloads");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", 0, v50);

    os_unfair_lock_unlock(&v48->_activeDownloadsLock);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v23 = v25;
    v39 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v40; ++k)
        {
          if (*(_QWORD *)v52 != v41)
            objc_enumerationMutation(v23);
          v43 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            BLDefaultLog();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v69 = v50;
              v70 = 2112;
              v71 = (uint64_t)v43;
              _os_log_impl(&dword_212C78000, v44, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer %@ of downloadQueueDownloadsDidChange", buf, 0x16u);
            }

            objc_msgSend(v43, "downloadQueueDownloadsDidChange:", v24);
          }
        }
        v40 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v40);
    }

    v6 = v46;
    v7 = v49;
    v8 = v50;
  }
  else
  {
    BLDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v6;
      _os_log_impl(&dword_212C78000, v23, OS_LOG_TYPE_ERROR, "[DownloadQueue]: _postDownloadCompleteNotificationWithDictionary: failed to retrieve downloadID from downloadStatus %@", buf, 0xCu);
    }
  }

}

- (void)purchaseDidCompleteWithResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "downloadID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: purchaseDidCompleteWithResponse", buf, 0xCu);

  }
  os_unfair_lock_lock(&self->_observersLock);
  -[BLDownloadQueueServerProgressObserver observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  os_unfair_lock_unlock(&self->_observersLock);
  -[BLDownloadQueueServerProgressObserver downloadQueue](self, "downloadQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          BLDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "downloadID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v23 = v17;
            v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer %@ of purchaseDidComplete", buf, 0x16u);

          }
          objc_msgSend(v15, "downloadQueue:purchasedDidCompleteWithResponse:", v9, v4);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

}

- (void)purchaseDidFailedWithResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "downloadID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: purchaseDidFailedWithResponse", buf, 0xCu);

  }
  os_unfair_lock_lock(&self->_observersLock);
  -[BLDownloadQueueServerProgressObserver observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  os_unfair_lock_unlock(&self->_observersLock);
  -[BLDownloadQueueServerProgressObserver downloadQueue](self, "downloadQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          BLDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "downloadID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v23 = v17;
            v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: notifying observer %@ of purchaseDidFail", buf, 0x16u);

          }
          objc_msgSend(v15, "downloadQueue:purchasedDidFailWithResponse:", v9, v4);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

}

- (id)_stringFromObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      BUDynamicCast();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    BLDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = (id)objc_opt_class();
      v7 = v12;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to neither an NSString nor an NSNumber", (uint8_t *)&v9, 0x16u);

    }
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  BUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v4;
}

- (id)_numberFromObject:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v3;
      v10 = 2112;
      v11 = (id)objc_opt_class();
      v6 = v11;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to an NSNumber", (uint8_t *)&v8, 0x16u);

    }
    goto LABEL_7;
  }
  objc_opt_class();
  BUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

- (id)_dateFromObject:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v3;
      v10 = 2112;
      v11 = (id)objc_opt_class();
      v6 = v11;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to an NSDate", (uint8_t *)&v8, 0x16u);

    }
    goto LABEL_7;
  }
  objc_opt_class();
  BUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

- (id)_downloadStatusStoreID:(id)a3 storePlaylistID:(id)a4 orPermLink:(id)a5 downloadID:(id)a6 title:(id)a7 collectionTitle:(id)a8 assetKind:(id)a9 isPaused:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char v27;
  NSObject *v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (v19)
  {
    os_unfair_lock_lock(&self->_activeDownloadsLock);
    -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v24 = (void *)objc_opt_new();
      -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v19);

    }
    os_unfair_lock_unlock(&self->_activeDownloadsLock);
    objc_msgSend(v24, "setDownloadID:", v19);
    if (v16)
    {
      if (objc_msgSend(v16, "longLongValue"))
      {
        objc_msgSend(v24, "setStoreID:", v16);
        if (objc_msgSend(v17, "longLongValue"))
          objc_msgSend(v24, "setStorePlaylistID:", v17);
        goto LABEL_13;
      }
    }
    else
    {
      if (objc_msgSend(v18, "length"))
      {
        objc_msgSend(v24, "setPermLink:", v18);
LABEL_13:
        v27 = 0;
LABEL_18:
        if (objc_msgSend(v22, "length"))
          objc_msgSend(v24, "setAssetKind:", v22);
        if (v24)
          v29 = v27;
        else
          v29 = 1;
        if ((v29 & 1) == 0)
        {
          objc_msgSend(v24, "setIsAudiobook:", objc_msgSend(v22, "isEqualToString:", CFSTR("book")));
          if (a10)
          {
            v30 = 3;
          }
          else
          {
            BLDefaultLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v35 = v19;
              _os_log_impl(&dword_212C78000, v31, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: setting percentComplete 5 percent", buf, 0xCu);
            }

            objc_msgSend(v24, "setPercentComplete:", &unk_24CEA08F8);
            v30 = 1;
          }
          objc_msgSend(v24, "setDownloadPhase:", v30);
          os_unfair_lock_lock(&self->_activeDownloadsLock);
          -[BLDownloadQueueServerProgressObserver activeDownloads](self, "activeDownloads");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v24, v19);

          os_unfair_lock_unlock(&self->_activeDownloadsLock);
        }
        if (objc_msgSend(v20, "length"))
          objc_msgSend(v24, "setTitle:", v20);
        if (objc_msgSend(v21, "length"))
          objc_msgSend(v24, "setCollectionTitle:", v21);
        goto LABEL_34;
      }
      BLDefaultLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212C78000, v28, OS_LOG_TYPE_ERROR, "[DownloadQueue]: we do not have enough information to post initial progress for this download", buf, 2u);
      }

      v24 = 0;
    }
    v27 = 1;
    goto LABEL_18;
  }
  BLDefaultLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_ERROR, "[DownloadQueue]: nil downloadID passed to _downloadStatusSToreID:storePlaylistID:orPermLink:downloadID:isPaused:isAudiobook:", buf, 2u);
  }

  v24 = 0;
LABEL_34:

  return v24;
}

- (void)didFailWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] didFailWithUserInfo:", v6, 2u);
  }

  -[BLDownloadQueueServerProgressObserver _postDownloadCompleteNotificationWithDictionary:failed:](self, "_postDownloadCompleteNotificationWithDictionary:failed:", v4, 1);
}

- (void)downloadCompleteWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] downloadCompleteWithUserInfo:", v6, 2u);
  }

  -[BLDownloadQueueServerProgressObserver _postDownloadCompleteNotificationWithDictionary:failed:](self, "_postDownloadCompleteNotificationWithDictionary:failed:", v4, 0);
}

- (void)progressWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] progressWithUserInfo", v6, 2u);
  }

  -[BLDownloadQueueServerProgressObserver _postDownloadProgressNotificationWithDictionary:](self, "_postDownloadProgressNotificationWithDictionary:", v4);
}

- (void)purchaseFailedWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] purchaseFailedWithUserInfo", v7, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.BLService.DownloadQueue.Purchase.Failed"), self, v4);

}

- (void)purchaseSucceededWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue] purchaseSucceededWithUserInfo", v7, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.BLService.DownloadQueue.Purchase.Succeeded"), self, v4);

}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setActiveDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_activeDownloads, a3);
}

- (BLDownloadQueueNonUI)downloadQueue
{
  return (BLDownloadQueueNonUI *)objc_loadWeakRetained((id *)&self->_downloadQueue);
}

- (void)setDownloadQueue:(id)a3
{
  objc_storeWeak((id *)&self->_downloadQueue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_downloadQueue);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
