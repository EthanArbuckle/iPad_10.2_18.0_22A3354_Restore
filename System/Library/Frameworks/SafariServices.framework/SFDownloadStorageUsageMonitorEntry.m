@implementation SFDownloadStorageUsageMonitorEntry

- (SFDownloadStorageUsageMonitorEntry)initWithIdentifier:(id)a3
{
  id v5;
  SFDownloadStorageUsageMonitorEntry *v6;
  SFDownloadStorageUsageMonitorEntry *v7;
  SFDownloadStorageUsageMonitorEntry *v8;

  v5 = a3;
  v6 = -[SFDownloadStorageUsageMonitorEntry init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

- (void)_didGainProgress:(id)a3
{
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "fileOperationKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB30B8]);

  if (v6)
  {
    objc_storeStrong((id *)&self->_progress, a3);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("completedUnitCount"), 1, entryProgressCompletedUnitCountKVOContext);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id WeakRetained;
  objc_super v8;

  if ((void *)entryProgressCompletedUnitCountKVOContext == a6)
  {
    self->_cachedUsage = -[NSProgress completedUnitCount](self->_progress, "completedUnitCount", a3, a4, a5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "entryDidChangeUsage:", self);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFDownloadStorageUsageMonitorEntry;
    -[SFDownloadStorageUsageMonitorEntry observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_didLoseProgress:(id)a3
{
  NSProgress *progress;
  void *v5;
  void *v6;
  int64_t cachedUsage;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;

  if (self->_progress == a3)
  {
    objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("completedUnitCount"), entryProgressCompletedUnitCountKVOContext);
    progress = self->_progress;
    self->_progress = 0;

    _SFSafariContainerURL();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("/"), 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:relativeToURL:", self->_destinationPath, 0, v13);
    cachedUsage = self->_cachedUsage;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributesOfItemAtPath:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_numberForKey:", *MEMORY[0x1E0CB2AF0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cachedUsage = objc_msgSend(v11, "integerValue");

    if (cachedUsage != self->_cachedUsage)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "entryDidChangeUsage:", self);

    }
  }
}

- (void)_updateProgressSubscriptionWithData:(id)a3
{
  id v5;
  id progressSubscriber;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v5 = a3;
  progressSubscriber = self->_progressSubscriber;
  if (progressSubscriber)
  {
    if (self->_progress)
    {
      -[SFDownloadStorageUsageMonitorEntry _didLoseProgress:](self, "_didLoseProgress:", self->_progress);
      progressSubscriber = self->_progressSubscriber;
    }
    objc_msgSend(MEMORY[0x1E0CB38A8], "removeSubscriber:", progressSubscriber);
    v7 = self->_progressSubscriber;
    self->_progressSubscriber = 0;

  }
  objc_storeStrong((id *)&self->_progressData, a3);
  if (v5)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v5, 0, 0, 0, 0);
    if (v8)
    {
      v9 = (void *)v8;
      objc_initWeak(&location, self);
      v10 = (void *)MEMORY[0x1E0CB38A8];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __74__SFDownloadStorageUsageMonitorEntry__updateProgressSubscriptionWithData___block_invoke;
      v13[3] = &unk_1E4AC0D68;
      objc_copyWeak(&v14, &location);
      objc_msgSend(v10, "addSubscriberForFileURL:withPublishingHandler:", v9, v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_progressSubscriber;
      self->_progressSubscriber = v11;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

    }
  }

}

id __74__SFDownloadStorageUsageMonitorEntry__updateProgressSubscriptionWithData___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "_didGainProgress:", v3);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SFDownloadStorageUsageMonitorEntry__updateProgressSubscriptionWithData___block_invoke_2;
  v8[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v10, a1);
  v9 = v3;
  v5 = v3;
  v6 = (void *)MEMORY[0x1A8598C40](v8);

  objc_destroyWeak(&v10);
  return v6;
}

void __74__SFDownloadStorageUsageMonitorEntry__updateProgressSubscriptionWithData___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didLoseProgress:", *(_QWORD *)(a1 + 32));

}

- (void)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  NSString *v5;
  NSString *destinationPath;
  int64_t cachedUsage;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("Path"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  destinationPath = self->_destinationPath;
  self->_destinationPath = v5;

  objc_msgSend(v4, "safari_dataForKey:", CFSTR("PlaceholderBookmarkData"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if ((WBSIsEqual() & 1) == 0)
    -[SFDownloadStorageUsageMonitorEntry _updateProgressSubscriptionWithData:](self, "_updateProgressSubscriptionWithData:", v17);
  if (!self->_progress)
  {
    cachedUsage = self->_cachedUsage;
    v8 = (int64_t)self->_destinationPath;
    if (v8)
    {
      _SFSafariContainerURL();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("/"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:relativeToURL:", self->_destinationPath, 0, v10);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attributesOfItemAtPath:error:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safari_numberForKey:", *MEMORY[0x1E0CB2AF0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_cachedUsage = objc_msgSend(v15, "integerValue");

      v8 = self->_cachedUsage;
    }
    else
    {
      self->_cachedUsage = 0;
    }
    if (v8 != cachedUsage)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "entryDidChangeUsage:", self);

    }
  }

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (void)setProgressSubscriber:(id)a3
{
  objc_storeStrong(&self->_progressSubscriber, a3);
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationPath, a3);
}

- (NSData)progressData
{
  return self->_progressData;
}

- (void)setProgressData:(id)a3
{
  objc_storeStrong((id *)&self->_progressData, a3);
}

- (int64_t)cachedUsage
{
  return self->_cachedUsage;
}

- (void)setCachedUsage:(int64_t)a3
{
  self->_cachedUsage = a3;
}

- (SFDownloadStorageUsageMonitorEntryDelegate)delegate
{
  return (SFDownloadStorageUsageMonitorEntryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressData, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
