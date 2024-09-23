@implementation ENRegionHistoryManager

- (void)updateFileStatus
{
  ENSecureArchiveFileWrapper *regionHistoryFileWrapper;
  uint64_t v4;
  uint64_t v5;

  regionHistoryFileWrapper = self->_regionHistoryFileWrapper;
  v5 = 0;
  if (-[ENSecureArchiveFileWrapper openWithError:](regionHistoryFileWrapper, "openWithError:", &v5))
    v4 = 2;
  else
    v4 = 1;
  -[ENRegionHistoryManager setFileStatus:](self, "setFileStatus:", v4);
}

- (void)setFileStatus:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  ENSecureArchiveFileWrapper *regionHistoryFileWrapper;
  BOOL v9;
  ENRegionHistory *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  if (self->_fileStatus != a3)
  {
    if (gLogCategory_ENRegionHistoryManager <= 30
      && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      -[ENRegionHistoryManager regionHistoryFileWrapper](self, "regionHistoryFileWrapper");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionHistoryFileStatusToString:", self->_fileStatus);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionHistoryFileStatusToString:", a3);
      v16 = v7;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v6;
      LogPrintF_safe();

    }
    self->_fileStatus = a3;
    if (a3 == 2)
    {
      regionHistoryFileWrapper = self->_regionHistoryFileWrapper;
      v19 = 0;
      v18 = 0;
      v9 = -[ENSecureArchiveFileWrapper readObject:ofClass:error:](regionHistoryFileWrapper, "readObject:ofClass:error:", &v19, objc_opt_class(), &v18);
      v10 = (ENRegionHistory *)v19;
      v11 = v18;
      if (v9)
      {
        if (!v10)
        {
          if (gLogCategory_ENRegionHistoryManager <= 30
            && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
          {
            -[ENRegionHistoryManager regionHistoryFileWrapper](self, "regionHistoryFileWrapper", v14, v16, v17);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "path");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
          v10 = objc_alloc_init(ENRegionHistory);
        }
        -[ENRegionHistoryManager mergeRegionHistoryOnDisk:inMemory:](self, "mergeRegionHistoryOnDisk:inMemory:", v10, self->_regionHistory, v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENRegionHistoryManager setRegionHistory:](self, "setRegionHistory:", v13);
      }
      else
      {
        if (gLogCategory_ENRegionHistoryManager > 90
          || gLogCategory_ENRegionHistoryManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_21;
        }
        -[ENRegionHistoryManager regionHistoryFileWrapper](self, "regionHistoryFileWrapper", v14, v16, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
LABEL_21:

    }
  }
}

+ (id)regionHistoryFileStatusToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Inaccessible");
  if (a3 == 2)
    return CFSTR("Accessible");
  else
    return (id)v3;
}

- (ENRegionHistoryManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ENRegionHistoryManager *v10;

  v6 = a4;
  v7 = a3;
  ENDataVaultPath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Regions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ENRegionHistoryManager initWithDelegate:queue:directoryPath:](self, "initWithDelegate:queue:directoryPath:", v7, v6, v9);
  return v10;
}

- (ENRegionHistoryManager)initWithDelegate:(id)a3 queue:(id)a4 directoryPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  ENRegionHistoryManager *v12;
  ENRegionHistory *v13;
  ENRegionHistory *regionHistory;
  uint64_t v15;
  NSString *directoryPath;
  const char *v17;
  NSObject *queue;
  void *v20;
  void *v21;
  void *v22;
  _QWORD handler[4];
  id v24;
  id location;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRegionHistoryManager.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRegionHistoryManager.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRegionHistoryManager.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryPath != nil"));

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)ENRegionHistoryManager;
  v12 = -[ENRegionHistoryManager init](&v26, sel_init);
  if (v12)
  {
    v13 = objc_alloc_init(ENRegionHistory);
    regionHistory = v12->_regionHistory;
    v12->_regionHistory = v13;

    v15 = objc_msgSend(v11, "copy");
    directoryPath = v12->_directoryPath;
    v12->_directoryPath = (NSString *)v15;

    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_queue, a4);
    v12->_fileStatus = 0;
    v12->_resetToken = -1;
    location = 0;
    objc_initWeak(&location, v12);
    v17 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0C9E2D8]), "UTF8String");
    queue = v12->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __63__ENRegionHistoryManager_initWithDelegate_queue_directoryPath___block_invoke;
    handler[3] = &unk_1E87DB850;
    objc_copyWeak(&v24, &location);
    notify_register_dispatch(v17, &v12->_resetToken, queue, handler);
    -[ENRegionHistoryManager setupPersistedRegionHistory](v12, "setupPersistedRegionHistory");
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __63__ENRegionHistoryManager_initWithDelegate_queue_directoryPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetRegionHistory");

}

- (void)setupPersistedRegionHistory
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  ENSecureArchiveFileWrapper *v19;
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  const char *v25;
  id v26;
  id v27;
  id v28;

  -[ENRegionHistoryManager setFileStatus:](self, "setFileStatus:", 0);
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionHistoryManager directoryPath](self, "directoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v6 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v28);
  v7 = v28;

  if ((v6 & 1) != 0)
  {
    -[ENRegionHistoryManager directoryPath](self, "directoryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("regionCache.plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogCategory_ENRegionHistoryManager <= 30
      && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "fileExistsAtPath:", v9);
      v13 = "no";
      if (v12)
        v13 = "yes";
      v24 = v9;
      v25 = v13;
      v23 = v10;
      LogPrintF_safe();

    }
    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager", v23, v24, v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attributesOfItemAtPath:error:", v9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v15, "fileSize") < 0x25801)
    {
      v18 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v7;
      v17 = objc_msgSend(v16, "removeItemAtPath:error:", v9, &v27);
      v18 = v27;

      if (v17)
      {
        if (gLogCategory_ENRegionHistoryManager > 30
          || gLogCategory_ENRegionHistoryManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_20;
        }
      }
      else if (gLogCategory__ENRegionHistoryManager > 90
             || gLogCategory__ENRegionHistoryManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_20;
      }
      LogPrintF_safe();
    }
LABEL_20:
    v19 = -[ENSecureArchiveFileWrapper initWithPath:]([ENSecureArchiveFileWrapper alloc], "initWithPath:", v9);
    -[ENRegionHistoryManager setRegionHistoryFileWrapper:](self, "setRegionHistoryFileWrapper:", v19);

    -[ENRegionHistoryManager updateFileStatus](self, "updateFileStatus");
    objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0C999E0];
    v26 = v18;
    v22 = objc_msgSend(v20, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAA8], v21, &v26);
    v7 = v26;

    if ((v22 & 1) == 0
      && gLogCategory__ENRegionHistoryManager <= 90
      && (gLogCategory__ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    goto LABEL_26;
  }
  if (gLogCategory__ENRegionHistoryManager <= 90
    && (gLogCategory__ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    -[ENRegionHistoryManager directoryPath](self, "directoryPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
LABEL_26:

  }
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_resetToken);
  self->_resetToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)ENRegionHistoryManager;
  -[ENRegionHistoryManager dealloc](&v3, sel_dealloc);
}

- (void)addRegionVisit:(id)a3
{
  id v4;
  void *v5;
  int v6;
  ENSecureArchiveFileWrapper *regionHistoryFileWrapper;
  ENRegionHistory *regionHistory;
  BOOL v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSensitiveLoggingAllowed");

    if (v6
      && gLogCategory_ENRegionHistoryManager <= 30
      && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend((id)objc_opt_class(), "regionHistoryFileStatusToString:", -[ENRegionHistoryManager fileStatus](self, "fileStatus"));
      v11 = v4;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    -[ENRegionHistory addRegionVisit:](self->_regionHistory, "addRegionVisit:", v4, v11, v12);
    if (self->_fileStatus == 2)
    {
      regionHistoryFileWrapper = self->_regionHistoryFileWrapper;
      regionHistory = self->_regionHistory;
      v13 = 0;
      v9 = -[ENSecureArchiveFileWrapper saveObject:error:](regionHistoryFileWrapper, "saveObject:error:", regionHistory, &v13);
      v10 = v13;
      if (!v9
        && gLogCategory__ENRegionHistoryManager <= 90
        && (gLogCategory__ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }

}

- (id)getAllRegions
{
  return -[ENRegionHistory getRegions](self->_regionHistory, "getRegions");
}

- (id)getAllRegionVisits
{
  return -[ENRegionHistory getRegionVisits](self->_regionHistory, "getRegionVisits");
}

- (BOOL)purgeAllRegionHistoryWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v11;

  if (gLogCategory_ENRegionHistoryManager <= 30
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend((id)objc_opt_class(), "regionHistoryFileStatusToString:", -[ENRegionHistoryManager fileStatus](self, "fileStatus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[ENRegionHistory removeAllRegionVisits](self->_regionHistory, "removeAllRegionVisits", v11);
  -[ENRegionHistoryManager regionHistoryFileWrapper](self, "regionHistoryFileWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "close");

  -[ENRegionHistoryManager regionHistoryFileWrapper](self, "regionHistoryFileWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fileExistsAtPath:", v7))
    v9 = objc_msgSend(v8, "removeItemAtPath:error:", v7, a3);
  else
    v9 = 1;
  -[ENRegionHistoryManager setupPersistedRegionHistory](self, "setupPersistedRegionHistory");

  return v9;
}

- (void)resetRegionHistory
{
  BOOL v2;
  id v3;
  id v4;

  v4 = 0;
  v2 = -[ENRegionHistoryManager purgeAllRegionHistoryWithError:](self, "purgeAllRegionHistoryWithError:", &v4);
  v3 = v4;
  if (!v2
    && gLogCategory_ENRegionHistoryManager <= 90
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (BOOL)purgeRegionsOlderThanDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  ENSecureArchiveFileWrapper *regionHistoryFileWrapper;
  ENRegionHistory *regionHistory;
  BOOL v19;
  id v20;
  id *v22;
  ENRegionHistoryManager *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_fileStatus == 2)
  {
    v22 = a4;
    v23 = self;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[ENRegionHistory getRegionVisits](self->_regionHistory, "getRegionVisits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "earlierDate:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "date");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToDate:", v15);

          if (v16)
            -[ENRegionHistory removeRegionVisit:](v23->_regionHistory, "removeRegionVisit:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }

    regionHistoryFileWrapper = v23->_regionHistoryFileWrapper;
    regionHistory = v23->_regionHistory;
    v24 = 0;
    v19 = -[ENSecureArchiveFileWrapper saveObject:error:](regionHistoryFileWrapper, "saveObject:error:", regionHistory, &v24);
    v20 = v24;
    if (!v19)
    {
      if (gLogCategory_ENRegionHistoryManager <= 90
        && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      if (v22)
        *v22 = objc_retainAutorelease(v20);
    }

  }
  else
  {
    if (gLogCategory_ENRegionHistoryManager <= 30
      && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v19 = 0;
  }

  return v19;
}

- (void)setRegionHistory:(id)a3
{
  id v5;
  ENSecureArchiveFileWrapper *regionHistoryFileWrapper;
  ENRegionHistory *regionHistory;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v5 = a3;
  objc_storeStrong((id *)&self->_regionHistory, a3);
  regionHistoryFileWrapper = self->_regionHistoryFileWrapper;
  regionHistory = self->_regionHistory;
  v17 = 0;
  v8 = -[ENSecureArchiveFileWrapper saveObject:error:](regionHistoryFileWrapper, "saveObject:error:", regionHistory, &v17);
  v9 = v17;
  if (!v8
    && gLogCategory_ENRegionHistoryManager <= 90
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    v15 = v9;
    LogPrintF_safe();
  }
  -[ENRegionHistory getRegionVisits](self->_regionHistory, "getRegionVisits", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isSensitiveLoggingAllowed");

  if (v13
    && gLogCategory_ENRegionHistoryManager <= 30
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    v16 = v11;
    LogPrintF_safe();
  }
  -[ENRegionHistoryManager delegate](self, "delegate", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentRegionVisitDidChange:", v11);

}

- (id)mergeRegionHistoryOnDisk:(id)a3 inMemory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRegionHistoryManager.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("onDiskHistory"));

    if (v9)
      goto LABEL_3;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRegionHistoryManager.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inMemoryHistory"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_22;
LABEL_3:
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSensitiveLoggingAllowed");

  if (v11
    && gLogCategory_ENRegionHistoryManager <= 30
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    v24 = v7;
    v25 = v9;
    LogPrintF_safe();
  }
  objc_msgSend(v9, "getRegionVisits", v24, v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "copy");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v13, "addRegionVisit:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isSensitiveLoggingAllowed");

  if (v20
    && gLogCategory_ENRegionHistoryManager <= 30
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v13;
}

- (ENRegionHistoryManagerDelegate)delegate
{
  return (ENRegionHistoryManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)fileStatus
{
  return self->_fileStatus;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setDirectoryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ENSecureArchiveFileWrapper)regionHistoryFileWrapper
{
  return self->_regionHistoryFileWrapper;
}

- (void)setRegionHistoryFileWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_regionHistoryFileWrapper, a3);
}

- (ENRegionHistory)regionHistory
{
  return self->_regionHistory;
}

- (int)resetToken
{
  return self->_resetToken;
}

- (void)setResetToken:(int)a3
{
  self->_resetToken = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_regionHistory, 0);
  objc_storeStrong((id *)&self->_regionHistoryFileWrapper, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
