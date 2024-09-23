@implementation _SFDownloadManager

- (id)initAsReadonly:(BOOL)a3
{
  _SFDownloadManager *v4;
  NSMutableArray *v5;
  NSMutableArray *downloads;
  _SFDownloadIconCache *v7;
  _SFDownloadIconCache *iconCache;
  void *v9;
  uint64_t v10;
  NSURL *downloadsRootURL;
  uint64_t v12;
  NSURL *downloadHistoryURL;
  uint64_t v14;
  NSMapTable *downloadsToDeferAdding;
  id v16;
  NSURL *v17;
  uint64_t v18;
  WBSCoalescedAsynchronousWriter *historyWriter;
  void *v20;
  void *v21;
  _SFDownloadManager *v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)_SFDownloadManager;
  v4 = -[_SFDownloadManager init](&v30, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    downloads = v4->_downloads;
    v4->_downloads = v5;

    v7 = objc_alloc_init(_SFDownloadIconCache);
    iconCache = v4->_iconCache;
    v4->_iconCache = v7;

    v4->_totalProgress = -2.0;
    _SFSafariContainerURL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Safari/Downloads"), 1);
    v10 = objc_claimAutoreleasedReturnValue();
    downloadsRootURL = v4->_downloadsRootURL;
    v4->_downloadsRootURL = (NSURL *)v10;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v4->_downloadsRootURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("Downloads.plist"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
    downloadHistoryURL = v4->_downloadHistoryURL;
    v4->_downloadHistoryURL = (NSURL *)v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    downloadsToDeferAdding = v4->_downloadsToDeferAdding;
    v4->_downloadsToDeferAdding = (NSMapTable *)v14;

    if (!a3)
    {
      objc_initWeak(&location, v4);
      v16 = objc_alloc(MEMORY[0x1E0D8A858]);
      v17 = v4->_downloadHistoryURL;
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __37___SFDownloadManager_initAsReadonly___block_invoke;
      v27 = &unk_1E4AC74B8;
      objc_copyWeak(&v28, &location);
      v18 = objc_msgSend(v16, "initWithName:fileURL:dataSourceBlock:", CFSTR("DownloadHistory"), v17, &v24);
      historyWriter = v4->_historyWriter;
      v4->_historyWriter = (WBSCoalescedAsynchronousWriter *)v18;

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults", v24, v25, v26, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:forKeyPath:options:context:", v4, *MEMORY[0x1E0D4F4A0], 1, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v4, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], v4);

    -[_SFDownloadManager _loadDownloadHistory](v4, "_loadDownloadHistory");
    v22 = v4;
  }

  return v4;
}

- (void)_loadDownloadHistory
{
  -[_SFDownloadManager _loadDownloadHistoryAsynchronous:](self, "_loadDownloadHistoryAsynchronous:", 1);
}

- (void)_loadDownloadHistoryAsynchronous:(BOOL)a3
{
  _BOOL4 v3;
  NSURL *v5;
  uint64_t v6;
  void *v7;
  NSURL *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  NSURL *v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  BOOL v19;
  _QWORD v20[7];
  _QWORD v21[3];
  char v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v3 = a3;
  v5 = self->_downloadHistoryURL;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__13;
  v25[4] = __Block_byref_object_dispose__13;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__13;
  v23[4] = __Block_byref_object_dispose__13;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke;
  v20[3] = &unk_1E4AC7580;
  v20[4] = self;
  v20[5] = v23;
  v20[6] = v21;
  v7 = (void *)MEMORY[0x1A8598C40](v20);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke_2;
  v13[3] = &unk_1E4AC75D0;
  v16 = v25;
  v13[4] = self;
  v8 = v5;
  v14 = v8;
  v17 = v23;
  v18 = v21;
  v19 = v3;
  v9 = v7;
  v15 = v9;
  v10 = MEMORY[0x1A8598C40](v13);
  v11 = (void *)v10;
  if (v3)
  {
    dispatch_get_global_queue(25, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v12, v11);

  }
  else
  {
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
}

- (double)totalProgress
{
  return self->_totalProgress;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_63);
  return (id)sharedManager_manager;
}

- (void)_removeDeletedDownloads
{
  id v3;

  -[NSMutableArray safari_filterObjectsUsingBlock:](self->_downloads, "safari_filterObjectsUsingBlock:", &__block_literal_global_40);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    -[_SFDownloadManager removeDownloads:](self, "removeDownloads:", v3);

}

- (void)_removeOldDownloadsAndUpdateTimerIfNeeded
{
  void *v3;
  double v4;
  double v5;
  NSTimer *removeDownloadsTimer;
  void *v7;
  NSMutableArray *downloads;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  id *p_removeDownloadsTimer;
  NSTimer *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  double v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForKey:", *MEMORY[0x1E0D4F4A0]);
  v5 = v4;

  -[NSTimer invalidate](self->_removeDownloadsTimer, "invalidate");
  removeDownloadsTimer = self->_removeDownloadsTimer;
  self->_removeDownloadsTimer = 0;

  if (v5 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    downloads = self->_downloads;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __63___SFDownloadManager__removeOldDownloadsAndUpdateTimerIfNeeded__block_invoke;
    v35[3] = &unk_1E4AC7640;
    v9 = v7;
    v36 = v9;
    v37 = v5;
    -[NSMutableArray safari_filterObjectsUsingBlock:](downloads, "safari_filterObjectsUsingBlock:", v35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
      -[_SFDownloadManager removeDownloads:](self, "removeDownloads:", v10);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = self->_downloads;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v12)
    {
      v13 = 0;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dateFinished");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && (!v13 || objc_msgSend(v16, "compare:", v13) == -1))
          {
            v18 = v17;

            v13 = v18;
          }

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v12);

      if (!v13)
        goto LABEL_19;
      objc_initWeak(&location, self);
      objc_msgSend(v9, "timeIntervalSinceDate:", v13);
      v20 = v19;
      v21 = (void *)MEMORY[0x1E0C99E88];
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __63___SFDownloadManager__removeOldDownloadsAndUpdateTimerIfNeeded__block_invoke_2;
      v28 = &unk_1E4AC1450;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v21, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v25, v5 - v20);
      v22 = objc_claimAutoreleasedReturnValue();
      v24 = self->_removeDownloadsTimer;
      p_removeDownloadsTimer = (id *)&self->_removeDownloadsTimer;
      *p_removeDownloadsTimer = (id)v22;

      objc_msgSend(*p_removeDownloadsTimer, "setTolerance:", v5 / 10.0, v25, v26, v27, v28);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      v13 = v11;
    }

LABEL_19:
  }
}

- (NSDate)_lastUnviewedDownloadDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sf_dateForKey:", *MEMORY[0x1E0D4F538]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setExtraDownloadDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_extraDownloadDelegate, a3);
}

- (BOOL)hasUnviewedDownloads
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[_SFDownloadManager _lastUnviewedDownloadDate](self, "_lastUnviewedDownloadDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "safari_timeIntervalUntilNow");
    v5 = v4 < 28800.0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)downloads
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_downloads, "copy");
}

+ (id)downloadRepresentationsAtURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_arrayForKey:", CFSTR("DownloadHistory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (void)getDownloadsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id blockToExecuteWhenDownloadHistoryIsLoaded;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (self->_loadedDownloadHistory)
  {
    dispatch_async(MEMORY[0x1E0C80D38], v4);
  }
  else if (self->_blockToExecuteWhenDownloadHistoryIsLoaded)
  {
    v5 = (void *)MEMORY[0x1A8598C40]();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56___SFDownloadManager_getDownloadsWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E4AC1748;
    v12 = v5;
    v13 = v4;
    v6 = v5;
    v7 = (void *)MEMORY[0x1A8598C40](v11);
    blockToExecuteWhenDownloadHistoryIsLoaded = self->_blockToExecuteWhenDownloadHistoryIsLoaded;
    self->_blockToExecuteWhenDownloadHistoryIsLoaded = v7;

  }
  else
  {
    v9 = (void *)MEMORY[0x1A8598C40](v4);
    v10 = self->_blockToExecuteWhenDownloadHistoryIsLoaded;
    self->_blockToExecuteWhenDownloadHistoryIsLoaded = v9;

  }
}

+ (id)defaultDownloadsHistoryURL
{
  void *v2;
  void *v3;

  _SFSafariContainerURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("/Library/Safari/Downloads/Downloads.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, *MEMORY[0x1E0D4F4A0]);

  v4.receiver = self;
  v4.super_class = (Class)_SFDownloadManager;
  -[_SFDownloadManager dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD block[4];
  id v15;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D4F4A0]))
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69___SFDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E4ABFF20;
    objc_copyWeak(&v15, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFDownloadManager;
    -[_SFDownloadManager observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_applicationDidEnterBackground:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  -[_SFDownloadManager _busyDownloads](self, "_busyDownloads", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didMoveToBackgroundWithNumberOfOnGoingDownloads:", v4);

  }
}

- (id)_dataForPersistingToHistory
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray safari_mapObjectsUsingBlock:](self->_downloads, "safari_mapObjectsUsingBlock:", &__block_literal_global_32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("DownloadHistory");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)runningDownloadsCount
{
  void *v2;
  unint64_t v3;

  -[NSMutableArray safari_filterObjectsUsingBlock:](self->_downloads, "safari_filterObjectsUsingBlock:", &__block_literal_global_35);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)reloadDownloadsSynchronously
{
  -[_SFDownloadManager _loadDownloadHistoryAsynchronous:](self, "_loadDownloadHistoryAsynchronous:", 0);
}

- (void)savePendingChangesBeforeTermination
{
  if (self->_loadedDownloadHistory)
    -[WBSCoalescedAsynchronousWriter completePendingWriteSynchronously](self->_historyWriter, "completePendingWriteSynchronously");
}

- (void)_noteDownloadsChanged
{
  id v3;

  -[WBSCoalescedAsynchronousWriter scheduleWrite](self->_historyWriter, "scheduleWrite");
  if (self->_loadedDownloadHistory)
  {
    -[_SFDownloadManager _startUpdateTotalProgressTimerIfNeeded](self, "_startUpdateTotalProgressTimerIfNeeded");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("_SFDownloadsDidChangeNotification"), self);

  }
}

- (void)removeDownloads:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_downloads);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intersectSet:", v6);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v12, "cancel", (_QWORD)v13);
          objc_msgSend(v12, "removeDataAndPlaceholderFromDisk");
          -[NSMutableArray removeObject:](self->_downloads, "removeObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    -[_SFDownloadManager _noteDownloadsChanged](self, "_noteDownloadsChanged");
  }

}

- (void)removeDownloadsStartedAfterDate:(id)a3
{
  id v4;
  NSMutableArray *downloads;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  downloads = self->_downloads;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54___SFDownloadManager_removeDownloadsStartedAfterDate___block_invoke;
  v8[3] = &unk_1E4AC75F8;
  v9 = v4;
  v7 = v4;
  -[NSMutableArray safari_filterObjectsUsingBlock:](downloads, "safari_filterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDownloadManager removeDownloads:](self, "removeDownloads:", v6);

}

- (void)_addDownload:(id)a3
{
  BOOL v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[_SFDownloadManager shouldExcludeDownloadFromList:](self, "shouldExcludeDownloadFromList:", v6);
  v5 = v6;
  if (!v4)
  {
    if ((-[NSMutableArray containsObject:](self->_downloads, "containsObject:", v6) & 1) == 0)
      -[NSMutableArray insertObject:atIndex:](self->_downloads, "insertObject:atIndex:", v6, 0);
    -[_SFDownloadManager _noteDownloadsChanged](self, "_noteDownloadsChanged");
    -[_SFDownloadManager _removeOldDownloadsAndUpdateTimerIfNeeded](self, "_removeOldDownloadsAndUpdateTimerIfNeeded");
    v5 = v6;
  }

}

- (void)deferAddingDownloadWhenStarted:(id)a3
{
  -[NSMapTable setObject:forKey:](self->_downloadsToDeferAdding, "setObject:forKey:", a3, a3);
}

- (BOOL)shouldExcludeDownloadFromFileSystem:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[_SFDownloadManager shouldExcludeDownloadFromList:](self, "shouldExcludeDownloadFromList:", v4))
  {
    if (objc_msgSend(v4, "dataOwner") != 2)
    {
      v5 = 0;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "mayOpenFromManagedToUnmanaged") & 1) != 0)
    {
      if ((objc_msgSend(v6, "mayOpenFromUnmanagedToManaged") & 1) != 0)
      {
        v5 = 0;
LABEL_14:

        goto LABEL_15;
      }
      v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = v4;
        v8 = "Excluding %{public}@ from Files because Managed Configuration prohibits moving unmanaged content to managed destinations";
        goto LABEL_12;
      }
    }
    else
    {
      v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = v4;
        v8 = "Excluding %{public}@ from Files because Managed Configuration prohibits moving managed content to unmanaged destinations";
LABEL_12:
        _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
      }
    }
    v5 = 1;
    goto LABEL_14;
  }
  v5 = 1;
LABEL_15:

  return v5;
}

- (BOOL)shouldExcludeDownloadFromList:(id)a3
{
  id v3;
  uint64_t v4;
  int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "fileType");
  if ((unint64_t)(v4 - 3) < 5 || v4 == 1)
    v7 = objc_msgSend(v3, "explicitlySaved") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (id)_busyDownloads
{
  return (id)-[NSMutableArray safari_filterObjectsUsingBlock:](self->_downloads, "safari_filterObjectsUsingBlock:", &__block_literal_global_45_0);
}

- (void)_startUpdateTotalProgressTimerIfNeeded
{
  void *v3;
  uint64_t v4;
  NSTimer *v5;
  NSTimer *updateTotalProgressTimer;
  void *v7;

  if (!-[NSTimer isValid](self->_updateTotalProgressTimer, "isValid"))
  {
    -[_SFDownloadManager _busyDownloads](self, "_busyDownloads");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateTotalProgress_, 0, 1, 0.2);
      v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      updateTotalProgressTimer = self->_updateTotalProgressTimer;
      self->_updateTotalProgressTimer = v5;

      -[NSTimer setTolerance:](self->_updateTotalProgressTimer, "setTolerance:", 1.0);
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addTimer:forMode:", self->_updateTotalProgressTimer, *MEMORY[0x1E0C99860]);

      -[NSTimer fire](self->_updateTotalProgressTimer, "fire");
    }
  }
}

- (void)_updateTotalProgress:(id)a3
{
  double v4;
  NSTimer *updateTotalProgressTimer;
  id v6;

  -[_SFDownloadManager _calculateTotalProgress](self, "_calculateTotalProgress", a3);
  self->_totalProgress = v4;
  if (v4 == -2.0)
  {
    -[NSTimer invalidate](self->_updateTotalProgressTimer, "invalidate");
    updateTotalProgressTimer = self->_updateTotalProgressTimer;
    self->_updateTotalProgressTimer = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("_SFDownloadManagerTotalProgressDidChangeNotification"), self);

}

- (double)_calculateTotalProgress
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[_SFDownloadManager _busyDownloads](self, "_busyDownloads");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = 0;
      v8 = *(_QWORD *)v17;
      v9 = 1;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v3);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "bytesExpected", (_QWORD)v16);
          if (v12 != -1)
          {
            v13 = v12;
            v9 = 0;
            v6 += objc_msgSend(v11, "bytesLoaded");
            v7 += v13;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);

      v14 = -1.0;
      if ((v9 & 1) == 0)
      {
        if (v7)
          v14 = (double)v6 / (double)v7;
        else
          v14 = 1.0;
      }
    }
    else
    {

      v14 = -1.0;
    }
  }
  else
  {
    v14 = -2.0;
  }

  return v14;
}

- (BOOL)_canExpireDownloadOnCompletion:(id)a3
{
  return objc_msgSend(a3, "canReveal");
}

- (void)_setLastUnviewedDownloadDate:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "_sf_safariDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0D4F538]);

}

- (void)setHasUnviewedDownloads:(BOOL)a3
{
  int v3;
  int v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = -[_SFDownloadManager hasUnviewedDownloads](self, "hasUnviewedDownloads");
  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDownloadManager _setLastUnviewedDownloadDate:](self, "_setLastUnviewedDownloadDate:", v6);

  }
  else
  {
    -[_SFDownloadManager _setLastUnviewedDownloadDate:](self, "_setLastUnviewedDownloadDate:", 0);
  }
  if (v5 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("_SFDownloadManagerHasUnviewedDownloadsDidChangeNotification"), self);

  }
}

- (void)_setHasUnviewedDownloadsIfNeeded
{
  if (!self->_viewingDownloadsCount)
    -[_SFDownloadManager setHasUnviewedDownloads:](self, "setHasUnviewedDownloads:", 1);
}

- (void)didBeginViewingDownloads
{
  ++self->_viewingDownloadsCount;
  -[_SFDownloadManager setHasUnviewedDownloads:](self, "setHasUnviewedDownloads:", 0);
}

- (void)didEndViewingDownloads
{
  --self->_viewingDownloadsCount;
}

- (void)downloadDidFinish:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);
  objc_msgSend(WeakRetained, "downloadDidFinish:", v4);

  -[WBSCoalescedAsynchronousWriter scheduleWrite](self->_historyWriter, "scheduleWrite");
  -[_SFDownloadManager _removeOldDownloadsAndUpdateTimerIfNeeded](self, "_removeOldDownloadsAndUpdateTimerIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleForKey:", *MEMORY[0x1E0D4F4A0]);
  v8 = v7;

  if (v8 == -2.0 && -[_SFDownloadManager _canExpireDownloadOnCompletion:](self, "_canExpireDownloadOnCompletion:", v4))
  {
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDownloadManager removeDownloads:](self, "removeDownloads:", v9);

  }
  else
  {
    -[_SFDownloadIconCache regenerateIconForSource:](self->_iconCache, "regenerateIconForSource:", v4);
  }
  -[_SFDownloadManager _busyDownloads](self, "_busyDownloads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("_SFDownloadManagerDidFinishLastDownloadNotification"), self);

  }
  if (-[NSMutableArray containsObject:](self->_downloads, "containsObject:", v4))
    -[_SFDownloadManager _setHasUnviewedDownloadsIfNeeded](self, "_setHasUnviewedDownloadsIfNeeded");

}

- (void)downloadDidFail:(id)a3
{
  _SFDownloadDelegate **p_extraDownloadDelegate;
  id v5;
  id WeakRetained;

  p_extraDownloadDelegate = &self->_extraDownloadDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_extraDownloadDelegate);
  objc_msgSend(WeakRetained, "downloadDidFail:", v5);

  -[WBSCoalescedAsynchronousWriter scheduleWrite](self->_historyWriter, "scheduleWrite");
  -[_SFDownloadManager _removeOldDownloadsAndUpdateTimerIfNeeded](self, "_removeOldDownloadsAndUpdateTimerIfNeeded");
}

- (void)downloadDidStart:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);
  objc_msgSend(WeakRetained, "downloadDidStart:", v6);

  -[NSMapTable objectForKey:](self->_downloadsToDeferAdding, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[_SFDownloadManager _addDownload:](self, "_addDownload:", v6);

}

- (BOOL)downloadShouldImportPlaceholderToDownloadsFolder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0D4F4A8]);

  if ((v6 & 1) != 0)
  {
    v7 = !-[_SFDownloadManager shouldExcludeDownloadFromFileSystem:](self, "shouldExcludeDownloadFromFileSystem:", v4);
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    LOBYTE(v7) = 0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_DEFAULT, "Not importing to the Downloads folder because the internal setting is disabled", v10, 2u);
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (void)downloadDidImportFileToDownloadsFolder:(id)a3
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  -[_SFDownloadManager _containerDirectoryForDownload:](self, "_containerDirectoryForDownload:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___SFDownloadManager_downloadDidImportFileToDownloadsFolder___block_invoke;
  block[3] = &unk_1E4ABFE00;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (void)downloadDidReceiveResponse:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[_SFDownloadIconCache regenerateIconForSource:](self->_iconCache, "regenerateIconForSource:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "downloadDidReceiveResponse:", v5);
  -[WBSCoalescedAsynchronousWriter scheduleWrite](self->_historyWriter, "scheduleWrite");

}

- (id)_containerDirectoryForDownload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_downloadsRootURL, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)createDirectoryForDownload:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[_SFDownloadManager shouldExcludeDownloadFromList:](self, "shouldExcludeDownloadFromList:", v6))
  {
    v7[2](v7, 0);
  }
  else
  {
    -[_SFDownloadManager _containerDirectoryForDownload:](self, "_containerDirectoryForDownload:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67___SFDownloadManager_createDirectoryForDownload_completionHandler___block_invoke;
    v11[3] = &unk_1E4AC13D8;
    v12 = v8;
    v13 = v7;
    v10 = v8;
    dispatch_async(v9, v11);

  }
}

- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id WeakRetained;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_downloadsToDeferAdding, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSMapTable removeObjectForKey:](self->_downloadsToDeferAdding, "removeObjectForKey:", v6);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83___SFDownloadManager_downloadShouldContinueAfterReceivingResponse_decisionHandler___block_invoke;
    v11[3] = &unk_1E4AC7688;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v11);

  }
  else
  {
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v7);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "downloadShouldContinueAfterReceivingResponse:decisionHandler:", v6, v9);
  else
    v9[2](v9, 1);

}

- (void)downloadContentsDidChange:(id)a3
{
  -[_SFDownloadIconCache regenerateIconForSource:](self->_iconCache, "regenerateIconForSource:", a3);
}

- (void)downloadWillBeDeleted:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFDownloadManager removeDownloads:](self, "removeDownloads:", v6, v7, v8);
}

- (NSURL)downloadsRootURL
{
  return self->_downloadsRootURL;
}

- (_SFDownloadDelegate)extraDownloadDelegate
{
  return (_SFDownloadDelegate *)objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);
}

- (_SFDownloadIconCache)iconCache
{
  return self->_iconCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_destroyWeak((id *)&self->_extraDownloadDelegate);
  objc_storeStrong((id *)&self->_downloadsRootURL, 0);
  objc_storeStrong((id *)&self->_updateTotalProgressTimer, 0);
  objc_storeStrong((id *)&self->_removeDownloadsTimer, 0);
  objc_storeStrong((id *)&self->_downloadsToDeferAdding, 0);
  objc_storeStrong(&self->_blockToExecuteWhenDownloadHistoryIsLoaded, 0);
  objc_storeStrong((id *)&self->_historyWriter, 0);
  objc_storeStrong((id *)&self->_downloadHistoryURL, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
}

@end
