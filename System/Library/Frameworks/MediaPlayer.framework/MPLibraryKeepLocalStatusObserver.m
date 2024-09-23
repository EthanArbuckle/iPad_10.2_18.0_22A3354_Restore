@implementation MPLibraryKeepLocalStatusObserver

- (MPLibraryActiveKeepLocalStatus)currentStatus
{
  double downloadProgress;
  int64_t statusType;
  MPLibraryActiveKeepLocalStatus result;

  downloadProgress = self->_currentStatus.downloadProgress;
  statusType = self->_currentStatus.statusType;
  result.downloadProgress = downloadProgress;
  result.statusType = statusType;
  return result;
}

- (unint64_t)downloadPausedReason
{
  return self->_downloadPausedReason;
}

- (MPLibraryKeepLocalStatusObserverConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)_updateActiveDownloadsAllowingDownloadRemoval:(BOOL)a3
{
  NSSet *v4;
  NSSet *v5;
  void *v6;
  MPLibraryKeepLocalStatusObserverConfiguration *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSSet *activeDownloads;
  uint64_t v21;
  NSSet *v22;
  BOOL v23;
  NSSet *v24;
  NSSet **p_pausedDownloads;
  NSSet *pausedDownloads;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPLibraryKeepLocalStatusObserverConfiguration pendingItemIdentifiers](self->_configuration, "pendingItemIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = self->_configuration;
      if ((-[MPLibraryKeepLocalStatusObserverConfiguration isCollectionType](v7, "isCollectionType") & 1) != 0
        || (-[MPLibraryKeepLocalStatusObserverConfiguration identifyingModelObject](v7, "identifyingModelObject"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "identifiers"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            !v9))
      {
        v6 = 0;
      }
      else
      {
        v35[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v6 = 0;
    }
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v29 = 0;
        +[MPMediaDownloadManager sharedManager](MPMediaDownloadManager, "sharedManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "downloadForIdentifierSet:downloadState:", v15, &v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          if (v29 > 1)
          {
            if (v29 == 2)
            {
              -[NSSet addObject:](v5, "addObject:", v17);
              self->_downloadPausedReason = objc_msgSend(v18, "downloadPausedReason");
            }
          }
          else if ((unint64_t)(objc_msgSend(v17, "downloadReason") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            -[NSSet addObject:](v4, "addObject:", v18);
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v12);
  }

  if (!a3)
  {
    v19 = -[NSSet count](v4, "count");
    activeDownloads = self->_activeDownloads;
    if (v19)
    {
      if (-[NSSet count](activeDownloads, "count"))
        -[NSSet unionSet:](v4, "unionSet:", self->_activeDownloads);
    }
    else
    {
      v21 = -[NSSet mutableCopy](activeDownloads, "mutableCopy");

      v4 = (NSSet *)v21;
    }
  }
  v22 = self->_activeDownloads;
  if (v22 == v4 || -[NSSet isEqualToSet:](v22, "isEqualToSet:", v4))
  {
    v23 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_activeDownloads, v4);
    v23 = 1;
  }
  pausedDownloads = self->_pausedDownloads;
  p_pausedDownloads = &self->_pausedDownloads;
  v24 = pausedDownloads;
  if (pausedDownloads != v5 && !-[NSSet isEqualToSet:](v24, "isEqualToSet:", v5))
  {
    objc_storeStrong((id *)p_pausedDownloads, v5);
    v23 = 1;
  }

  return v23;
}

- (void)setStatusBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setConfiguration:(id)a3
{
  MPLibraryKeepLocalStatusObserverConfiguration *v5;
  MPLibraryKeepLocalStatusObserverConfiguration *configuration;
  MPLibraryKeepLocalStatusObserverConfiguration **p_configuration;
  BOOL v8;
  MPLibraryKeepLocalStatusObserverConfiguration *v9;
  void *v10;
  MPLibraryKeepLocalStatusObserverConfiguration *v11;

  v5 = (MPLibraryKeepLocalStatusObserverConfiguration *)a3;
  p_configuration = &self->_configuration;
  configuration = self->_configuration;
  if (configuration != v5)
  {
    v11 = v5;
    v8 = -[MPLibraryKeepLocalStatusObserverConfiguration isEqual:](configuration, "isEqual:", v5);
    v5 = v11;
    if (!v8)
    {
      v9 = *p_configuration;
      objc_storeStrong((id *)&self->_configuration, a3);
      if (!*p_configuration || v9)
      {
        if (*p_configuration || !v9)
          goto LABEL_10;
        +[MPMediaDownloadManager sharedManager](MPMediaDownloadManager, "sharedManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unregisterObserver:", self);
      }
      else
      {
        +[MPMediaDownloadManager sharedManager](MPMediaDownloadManager, "sharedManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "registerObserver:", self);
      }

LABEL_10:
      -[MPLibraryKeepLocalStatusObserver _updateActiveDownloadsAllowingDownloadRemoval:](self, "_updateActiveDownloadsAllowingDownloadRemoval:", 1);
      -[MPLibraryKeepLocalStatusObserver _updateCurrentStatus](self, "_updateCurrentStatus");
      v5 = v11;
    }
  }

}

- (MPLibraryKeepLocalStatusObserver)init
{
  MPLibraryKeepLocalStatusObserver *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPLibraryKeepLocalStatusObserver;
  v2 = -[MPLibraryKeepLocalStatusObserver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelLibraryTransientStateController sharedDeviceLibraryController](MPModelLibraryTransientStateController, "sharedDeviceLibraryController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__transientStateDidChangeNotification_, CFSTR("MPModelLibraryTransientStateControllerDidChangeNotification"), v4);

  }
  return v2;
}

- (void)_updateCurrentStatus
{
  int64_t v3;
  double v4;
  int64_t v5;
  void (**statusBlock)(id, _QWORD, double);

  v3 = -[MPLibraryKeepLocalStatusObserver _calculateCurrentStatus](self, "_calculateCurrentStatus");
  v5 = v3;
  if (self->_currentStatus.statusType != v3 || vabdd_f64(self->_currentStatus.downloadProgress, v4) > 0.00000011920929)
  {
    self->_currentStatus.statusType = v3;
    self->_currentStatus.downloadProgress = v4;
    statusBlock = (void (**)(id, _QWORD, double))self->_statusBlock;
    if (statusBlock)
      statusBlock[2](statusBlock, v5, COERCE_DOUBLE(*(_QWORD *)&v4));
  }
}

- (MPLibraryActiveKeepLocalStatus)_calculateCurrentStatus
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MPLibraryKeepLocalStatusObserverConfiguration *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  double downloadProgress;
  int64_t v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  MPLibraryActiveKeepLocalStatus result;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = self->_activeDownloads;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "downloadProgress", (_QWORD)v24);
        v7 = v7 + v9;
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  -[MPLibraryKeepLocalStatusObserverConfiguration identifyingModelObject](self->_configuration, "identifyingModelObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[MPModelLibraryTransientStateController sharedDeviceLibraryController](MPModelLibraryTransientStateController, "sharedDeviceLibraryController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "transientKeepLocalStateForModelObject:", v10);

  }
  else
  {
    v12 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = 0;
      goto LABEL_45;
    }
    v13 = self->_configuration;
    if (-[MPLibraryKeepLocalStatusObserverConfiguration hasNonPurgeableAsset](v13, "hasNonPurgeableAsset"))goto LABEL_20;
    if (-[MPLibraryKeepLocalStatusObserverConfiguration isCollectionType](v13, "isCollectionType"))
    {
      v18 = -[MPLibraryKeepLocalStatusObserverConfiguration managedStatus](v13, "managedStatus");
      if (v18)
      {
        if (v18 == 1)
          goto LABEL_36;
        if (v18 != 2)
        {
LABEL_37:
          v17 = 0;
          goto LABEL_44;
        }
LABEL_20:
        self->_downloadProgress = 1.0;
        v17 = 4;
        goto LABEL_44;
      }
    }
    else
    {
      if (-[NSSet count](self->_activeDownloads, "count"))
      {
        self->_downloadProgress = v7;
        goto LABEL_36;
      }
      if (-[NSSet count](self->_pausedDownloads, "count"))
      {
        self->_downloadProgress = 0.0;
        v17 = 6;
        goto LABEL_44;
      }
      v20 = -[MPLibraryKeepLocalStatusObserverConfiguration managedStatus](v13, "managedStatus");
      if (v20 <= 5 && ((1 << v20) & 0x32) != 0)
      {
LABEL_42:
        v17 = 2;
        goto LABEL_44;
      }
    }
    v17 = -[MPLibraryKeepLocalStatusObserverConfiguration isStoreRedownloadable](v13, "isStoreRedownloadable", (_QWORD)v24);
    goto LABEL_44;
  }
  v13 = self->_configuration;
  v14 = -[MPLibraryKeepLocalStatusObserverConfiguration redownloadableItemCount](v13, "redownloadableItemCount");
  v15 = -[MPLibraryKeepLocalStatusObserverConfiguration nonPurgeableItemCount](v13, "nonPurgeableItemCount");
  v16 = -[MPLibraryKeepLocalStatusObserverConfiguration downloadEnabledItemCount](v13, "downloadEnabledItemCount");
  if (!v14)
  {
    v17 = 0;
    self->_downloadProgress = 0.0;
    goto LABEL_44;
  }
  if (v15 >= v14)
    goto LABEL_20;
  if (v14 <= v16)
  {
    if (v16 >= 1)
    {
      v19 = (v7 + (double)v15) / (double)v16;
      if (v19 > 1.0)
        v19 = 1.0;
      self->_downloadProgress = fmax(v19, 0.0);
      if (!-[NSSet count](self->_activeDownloads, "count", (_QWORD)v24) && self->_downloadProgress <= 0.00000011920929)
        goto LABEL_42;
LABEL_36:
      v17 = 3;
      goto LABEL_44;
    }
    goto LABEL_37;
  }
  v17 = 1;
LABEL_44:

LABEL_45:
  if (v12 == 3)
  {
    if (v17 == 2)
      v17 = 1;
  }
  else if (v12 == 1 && v17 == 1)
  {
    v17 = 2;
  }
  downloadProgress = self->_downloadProgress;

  v22 = v17;
  v23 = downloadProgress;
  result.downloadProgress = v23;
  result.statusType = v22;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_configuration)
  {
    +[MPMediaDownloadManager sharedManager](MPMediaDownloadManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterObserver:", self);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelLibraryTransientStateController sharedDeviceLibraryController](MPModelLibraryTransientStateController, "sharedDeviceLibraryController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MPModelLibraryTransientStateControllerDidChangeNotification"), v5);

  v6.receiver = self;
  v6.super_class = (Class)MPLibraryKeepLocalStatusObserver;
  -[MPLibraryKeepLocalStatusObserver dealloc](&v6, sel_dealloc);
}

- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5
{
  void (**v5)(_QWORD);
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__MPLibraryKeepLocalStatusObserver_downloadManager_didEnqueueAssetDownloads_didRemoveAssetDownloads___block_invoke;
  v6[3] = &unk_1E3163508;
  v6[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x19403A810](v6, a2, a3, a4, a5);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v5[2](v5);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v5);

}

- (void)downloadManager:(id)a3 didUpdateDownloadProgress:(id)a4
{
  -[MPLibraryKeepLocalStatusObserver _handleDownloadStateChanged:](self, "_handleDownloadStateChanged:", a4);
}

- (void)downloadManager:(id)a3 didChangeDownloadPausedReasonForAssets:(id)a4
{
  -[MPLibraryKeepLocalStatusObserver _handleDownloadStateChanged:](self, "_handleDownloadStateChanged:", a4);
}

- (void)_transientStateDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MPLibraryKeepLocalStatusObserver__transientStateDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_handleDownloadStateChanged:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  MPLibraryKeepLocalStatusObserver *v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __64__MPLibraryKeepLocalStatusObserver__handleDownloadStateChanged___block_invoke;
    v9 = &unk_1E31635F8;
    v10 = self;
    v11 = v4;
    v5 = (void (**)(_QWORD))MEMORY[0x19403A810](&v6);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v6, v7, v8, v9, v10))
      v5[2](v5);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

- (id)statusBlock
{
  return self->_statusBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_pausedDownloads, 0);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
}

void __64__MPLibraryKeepLocalStatusObserver__handleDownloadStateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "_updateActiveDownloadsAllowingDownloadRemoval:", 0) & 1) != 0
    || (v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8),
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40)),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v2) = objc_msgSend(v2, "intersectsSet:", v3),
        v3,
        (_DWORD)v2))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStatus");
  }
}

uint64_t __73__MPLibraryKeepLocalStatusObserver__transientStateDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStatus");
}

uint64_t __101__MPLibraryKeepLocalStatusObserver_downloadManager_didEnqueueAssetDownloads_didRemoveAssetDownloads___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateActiveDownloadsAllowingDownloadRemoval:", 0);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStatus");
  return result;
}

@end
