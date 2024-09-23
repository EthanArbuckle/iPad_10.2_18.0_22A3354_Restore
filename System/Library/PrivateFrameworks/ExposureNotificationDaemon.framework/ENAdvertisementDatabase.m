@implementation ENAdvertisementDatabase

- (ENAdvertisementDatabase)init
{
  return -[ENAdvertisementDatabase initWithDatabaseFolderPath:cacheCount:](self, "initWithDatabaseFolderPath:cacheCount:", CFSTR("/var/root/"), 1);
}

- (ENAdvertisementDatabase)initWithDatabaseFolderPath:(id)a3 cacheCount:(unint64_t)a4
{
  return -[ENAdvertisementDatabase initWithDatabaseFolderPath:cacheCount:errorMetricReporter:](self, "initWithDatabaseFolderPath:cacheCount:errorMetricReporter:", a3, a4, &__block_literal_global_10);
}

- (ENAdvertisementDatabase)initWithDatabaseFolderPath:(id)a3 cacheCount:(unint64_t)a4 errorMetricReporter:(id)a5
{
  unsigned int v6;
  id v9;
  id v10;
  ENAdvertisementDatabase *v11;
  uint64_t v12;
  id errorMetricReporter;
  $8B507D830E6EE36862B76123793C2CB9 *v14;
  ENAdvertisementDatabase *v15;
  const char *v17;
  objc_super v18;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v17 = -[NSString UTF8String](self->_databaseFolderPath, "UTF8String");
    LogPrintF_safe();
  }
  v18.receiver = self;
  v18.super_class = (Class)ENAdvertisementDatabase;
  v11 = -[ENAdvertisementDatabase init](&v18, sel_init, v17);
  if (!v11)
    goto LABEL_8;
  v12 = MEMORY[0x1D17A7E5C](v10);
  errorMetricReporter = v11->_errorMetricReporter;
  v11->_errorMetricReporter = (id)v12;

  objc_storeStrong((id *)&v11->_databaseFolderPath, a3);
  v11->_advertisementInsertionCacheCount = v6;
  v11->_advertisementInsertionIndex = 0;
  v11->_storageFullAlertInterval = 60.0;
  v11->_previousStoreFullAlertTimestamp = 0;
  v11->_currentStoreType = 2;
  v14 = ($8B507D830E6EE36862B76123793C2CB9 *)malloc_type_malloc(40 * v6, 0x10000400A747E1EuLL);
  v11->_advertisementInsertionCache = v14;
  if (v14)
  {
    -[ENAdvertisementDatabase openStoreAndReturnError:](v11, "openStoreAndReturnError:", 0);
LABEL_8:
    v15 = v11;
    goto LABEL_14;
  }
  if (gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_advertisementInsertionCache);
  v3.receiver = self;
  v3.super_class = (Class)ENAdvertisementDatabase;
  -[ENAdvertisementDatabase dealloc](&v3, sel_dealloc);
}

- (void)reportErrorMetric:(unsigned int)a3
{
  void (**errorMetricReporter)(id, _QWORD);

  errorMetricReporter = (void (**)(id, _QWORD))self->_errorMetricReporter;
  if (errorMetricReporter)
    errorMetricReporter[2](errorMetricReporter, *(_QWORD *)&a3);
}

- (void)reportStoreError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ENAdvertisementStoreErrorDomain"));

    v4 = v8;
    if (v6)
    {
      v7 = objc_msgSend(v8, "code") - 1;
      v4 = v8;
      if (v7 <= 6 && ((0x47u >> v7) & 1) != 0)
      {
        -[ENAdvertisementDatabase reportErrorMetric:](self, "reportErrorMetric:", dword_1CC251440[v7]);
        v4 = v8;
      }
    }
  }

}

- (BOOL)openStoreAndReturnError:(id *)a3
{
  const char *v5;

  if (-[ENAdvertisementDatabase openCentralStoreAndReturnError:](self, "openCentralStoreAndReturnError:", a3))
  {
    -[ENAdvertisementDatabase mergeTemporaryStores](self, "mergeTemporaryStores");
    return 1;
  }
  if (-[ENAdvertisementDatabase openTemporaryStore](self, "openTemporaryStore"))
    return 1;
  if (gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v5 = -[NSString UTF8String](self->_databaseFolderPath, "UTF8String");
    LogPrintF_safe();
  }
  self->_currentStoreType = 2;
  -[ENAdvertisementDatabase reportErrorMetric:](self, "reportErrorMetric:", 1003, v5);
  return 0;
}

- (BOOL)openCentralStoreAndReturnError:(id *)a3
{
  BOOL result;
  ENAdvertisementSQLiteStore *v5;
  ENAdvertisementSQLiteStore *centralStore;
  ENAdvertisementSQLiteStore *temporaryStore;

  if (self->_centralStore)
    return 1;
  +[ENAdvertisementSQLiteStore centralStoreInFolderPath:error:](ENAdvertisementSQLiteStore, "centralStoreInFolderPath:error:", self->_databaseFolderPath, a3);
  v5 = (ENAdvertisementSQLiteStore *)objc_claimAutoreleasedReturnValue();
  centralStore = self->_centralStore;
  self->_centralStore = v5;

  if (!self->_centralStore)
    return 0;
  temporaryStore = self->_temporaryStore;
  self->_temporaryStore = 0;

  result = 1;
  self->_currentStoreType = 1;
  return result;
}

- (BOOL)openTemporaryStore
{
  BOOL v3;
  NSString *databaseFolderPath;
  ENAdvertisementSQLiteStore *v6;
  id v7;
  ENAdvertisementSQLiteStore *temporaryStore;
  ENAdvertisementSQLiteStore *v9;
  id v10;

  if (self->_centralStore || self->_temporaryStore)
    return 0;
  databaseFolderPath = self->_databaseFolderPath;
  v10 = 0;
  +[ENAdvertisementSQLiteStore temporaryStoreInFolderPath:error:](ENAdvertisementSQLiteStore, "temporaryStoreInFolderPath:error:", databaseFolderPath, &v10);
  v6 = (ENAdvertisementSQLiteStore *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  temporaryStore = self->_temporaryStore;
  self->_temporaryStore = v6;

  v9 = self->_temporaryStore;
  v3 = v9 != 0;
  if (v9)
    self->_currentStoreType = 0;
  else
    -[ENAdvertisementDatabase reportStoreError:](self, "reportStoreError:", v7);

  return v3;
}

- (BOOL)temporaryStoresPresent
{
  return +[ENAdvertisementSQLiteStore temporaryStoresPresentInFolderPath:](ENAdvertisementSQLiteStore, "temporaryStoresPresentInFolderPath:", self->_databaseFolderPath);
}

- (BOOL)switchToCentralStore
{
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    -[NSString UTF8String](self->_databaseFolderPath, "UTF8String");
    LogPrintF_safe();
  }
  return !self->_centralStore
      && -[ENAdvertisementDatabase openCentralStoreAndReturnError:](self, "openCentralStoreAndReturnError:", 0);
}

- (BOOL)mergeStores:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  void *v12;
  ENAdvertisementSQLiteStore *centralStore;
  _BOOL4 v14;
  id v16;
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
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    v9 = 1;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        v11 = v7;
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        centralStore = self->_centralStore;
        v16 = v7;
        v14 = -[ENAdvertisementSQLiteStore importContentsOfStore:error:](centralStore, "importContentsOfStore:error:", v12, &v16);
        v7 = v16;

        if (v14)
        {
          v9 &= objc_msgSend(v12, "purgeAndRemoveFromDisk:", 1);
        }
        else
        {
          -[ENAdvertisementDatabase reportStoreError:](self, "reportStoreError:", v7);
          if (objc_msgSend(v7, "code") == 4)
          {
            -[ENAdvertisementDatabase closeAllStores](self, "closeAllStores");
          }
          else if (objc_msgSend(v7, "code") == 3)
          {
            -[ENAdvertisementSQLiteStore purgeAndRemoveFromDisk:](self->_centralStore, "purgeAndRemoveFromDisk:", 0);
            -[ENAdvertisementDatabase closeAllStores](self, "closeAllStores");
            LOBYTE(v9) = 0;
            goto LABEL_16;
          }
          v9 = 0;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)mergeTemporaryStores
{
  NSString *databaseFolderPath;
  char v4;
  const char *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v6 = -[NSString UTF8String](self->_databaseFolderPath, "UTF8String");
    LogPrintF_safe();
  }
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  databaseFolderPath = self->_databaseFolderPath;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ENAdvertisementDatabase_mergeTemporaryStores__block_invoke;
  v7[3] = &unk_1E87DC0E0;
  v7[4] = self;
  v7[5] = &v8;
  +[ENAdvertisementSQLiteStore enumerateTemporaryStoresInFolderPath:handler:](ENAdvertisementSQLiteStore, "enumerateTemporaryStoresInFolderPath:handler:", databaseFolderPath, v7, v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __47__ENAdvertisementDatabase_mergeTemporaryStores__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "mergeStores:", v5);

  if ((v4 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

- (BOOL)mergeStoresFromFolderPath:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[ENAdvertisementSQLiteStore storesPresentInFolderPath:](ENAdvertisementSQLiteStore, "storesPresentInFolderPath:", v4))
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      v11 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      v12 = -[NSString UTF8String](self->_databaseFolderPath, "UTF8String");
      LogPrintF_safe();
    }
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    +[ENAdvertisementSQLiteStore centralStoreInFolderPath:error:](ENAdvertisementSQLiteStore, "centralStoreInFolderPath:error:", v4, 0, v11, v12);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v20[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v20, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ENAdvertisementDatabase mergeStores:](self, "mergeStores:", v8);

      if (!v9)
      {
        if (gLogCategory__ENAdvertisementDatabase <= 90
          && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
          LogPrintF_safe();
        }
        *((_BYTE *)v17 + 24) = 0;
      }
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__ENAdvertisementDatabase_mergeStoresFromFolderPath___block_invoke;
    v13[3] = &unk_1E87DC108;
    v13[4] = self;
    v14 = v4;
    v15 = &v16;
    +[ENAdvertisementSQLiteStore enumerateTemporaryStoresInFolderPath:handler:](ENAdvertisementSQLiteStore, "enumerateTemporaryStoresInFolderPath:handler:", v14, v13);
    v5 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

void __53__ENAdvertisementDatabase_mergeStoresFromFolderPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "mergeStores:", v5);

  if ((v4 & 1) == 0)
  {
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
      LogPrintF_safe();
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (void)closeAllStores
{
  ENAdvertisementSQLiteStore *centralStore;
  ENAdvertisementSQLiteStore *temporaryStore;

  centralStore = self->_centralStore;
  self->_centralStore = 0;

  temporaryStore = self->_temporaryStore;
  self->_temporaryStore = 0;

  self->_currentStoreType = 2;
}

- (id)currentStore
{
  unint64_t currentStoreType;
  uint64_t v3;

  currentStoreType = self->_currentStoreType;
  if (!currentStoreType)
  {
    v3 = 56;
    return *(id *)((char *)&self->super.isa + v3);
  }
  if (currentStoreType == 1)
  {
    v3 = 48;
    return *(id *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (void)displayStorageFullAlert
{
  __uint64_t v3;
  unint64_t v4;
  unint64_t previousStoreFullAlertTimestamp;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  const __CFAllocator *v13;
  __CFUserNotification *v14;
  __CFUserNotification *v15;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v17;
  __CFRunLoop *Main;
  __CFRunLoopSource *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  if (alertActive == 1)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
    v4 = v3;
    previousStoreFullAlertTimestamp = self->_previousStoreFullAlertTimestamp;
    if (!previousStoreFullAlertTimestamp
      || v3 > (unint64_t)((double)previousStoreFullAlertTimestamp + self->_storageFullAlertInterval
                                                                         * 1000000000.0))
    {
      if (gLogCategory_ENAdvertisementDatabase <= 50
        && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      ENLocalizedString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ENLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ENLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ENLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x1E0C9B808];
      v20[0] = *MEMORY[0x1E0C9B7F8];
      v20[1] = v10;
      v21[0] = v6;
      v21[1] = v7;
      v11 = *MEMORY[0x1E0C9B828];
      v20[2] = *MEMORY[0x1E0C9B840];
      v20[3] = v11;
      v21[2] = v8;
      v21[3] = v9;
      v20[4] = *MEMORY[0x1E0DABB18];
      v21[4] = MEMORY[0x1E0C9AAA8];
      objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
      v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE08];
      v14 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE08], 0.0, 0, 0, v12);
      if (v14)
      {
        v15 = v14;
        RunLoopSource = CFUserNotificationCreateRunLoopSource(v13, v14, (CFUserNotificationCallBack)_ENAdvertisementDatabaseStorageFullResponseHandler, 0);
        if (RunLoopSource)
        {
          v17 = RunLoopSource;
          alertActive = 1;
          self->_previousStoreFullAlertTimestamp = v4;
          Main = CFRunLoopGetMain();
          CFRunLoopAddSource(Main, v17, (CFRunLoopMode)*MEMORY[0x1E0C9B278]);
          v19 = v17;
        }
        else
        {
          if (gLogCategory__ENAdvertisementDatabase <= 90
            && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v19 = v15;
        }
        CFRelease(v19);
      }
      else if (gLogCategory__ENAdvertisementDatabase <= 90
             && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
}

- (BOOL)saveContactTracingAdvertisement:(id)a3
{
  id v4;
  void *v5;
  $8B507D830E6EE36862B76123793C2CB9 *advertisementInsertionCache;
  unsigned int advertisementInsertionIndex;
  char *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v4 = a3;
  v5 = v4;
  advertisementInsertionCache = self->_advertisementInsertionCache;
  advertisementInsertionIndex = self->_advertisementInsertionIndex;
  self->_advertisementInsertionIndex = advertisementInsertionIndex + 1;
  v8 = (char *)advertisementInsertionCache + 40 * advertisementInsertionIndex;
  if (v4)
  {
    objc_msgSend(v4, "structRepresentation");
  }
  else
  {
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
  }
  *((_QWORD *)v8 + 4) = v13;
  *(_OWORD *)v8 = v11;
  *((_OWORD *)v8 + 1) = v12;
  v9 = self->_advertisementInsertionIndex != self->_advertisementInsertionCacheCount
    || -[ENAdvertisementDatabase flushCache](self, "flushCache");

  return v9;
}

- (unsigned)cacheRecordCount
{
  uint64_t v2;

  v2 = 16;
  if (!self->_advertisementInsertionCacheOverflowed)
    v2 = 20;
  return *(_DWORD *)((char *)&self->super.isa + v2);
}

- (BOOL)flushCache
{
  void *v3;
  uint64_t v4;
  void *v5;
  $8B507D830E6EE36862B76123793C2CB9 *advertisementInsertionCache;
  char v7;
  id v8;
  unsigned int *p_advertisementInsertionIndex;
  void *v10;
  int v11;
  unint64_t currentStoreType;
  unint64_t v14;
  uint64_t v15;
  uint64_t advertisementInsertionIndex;
  id v17;

  -[ENAdvertisementDatabase currentStore](self, "currentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    -[ENAdvertisementDatabase openStoreAndReturnError:](self, "openStoreAndReturnError:", 0);
  }
  v4 = -[ENAdvertisementDatabase cacheRecordCount](self, "cacheRecordCount");
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    currentStoreType = self->_currentStoreType;
    v15 = v4;
    LogPrintF_safe();
  }
  -[ENAdvertisementDatabase currentStore](self, "currentStore", currentStoreType, v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  advertisementInsertionCache = self->_advertisementInsertionCache;
  v17 = 0;
  v7 = objc_msgSend(v5, "saveContactTracingAdvertisementBuffer:count:error:", advertisementInsertionCache, v4, &v17);
  v8 = v17;

  if ((v7 & 1) != 0)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_advertisementInsertionCacheOverflowed = 0;
    p_advertisementInsertionIndex = &self->_advertisementInsertionIndex;
LABEL_34:
    *p_advertisementInsertionIndex = 0;
    goto LABEL_35;
  }
  if (gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v14 = self->_currentStoreType;
    advertisementInsertionIndex = self->_advertisementInsertionIndex;
    LogPrintF_safe();
  }
  -[ENAdvertisementDatabase reportStoreError:](self, "reportStoreError:", v8, v14, advertisementInsertionIndex);
  if (objc_msgSend(v8, "code") != 4)
  {
    if (objc_msgSend(v8, "code") != 3)
      goto LABEL_25;
    -[ENAdvertisementSQLiteStore purgeAndRemoveFromDisk:](self->_centralStore, "purgeAndRemoveFromDisk:", 0);
  }
  -[ENAdvertisementDatabase closeAllStores](self, "closeAllStores");
LABEL_25:
  p_advertisementInsertionIndex = &self->_advertisementInsertionIndex;
  if (self->_advertisementInsertionIndex == self->_advertisementInsertionCacheCount)
  {
    if (objc_msgSend(v8, "code") == 2
      || (+[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isSensitiveLoggingAllowed"),
          v10,
          v11))
    {
      -[ENAdvertisementDatabase displayStorageFullAlert](self, "displayStorageFullAlert");
    }
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_advertisementInsertionCacheOverflowed = 1;
    goto LABEL_34;
  }
LABEL_35:

  return v7;
}

- (NSNumber)storedAdvertisementCount
{
  ENAdvertisementSQLiteStore *centralStore;
  void *v4;
  void *v5;
  void *v6;

  centralStore = self->_centralStore;
  if (!centralStore)
  {
    v4 = 0;
    if (!-[ENAdvertisementDatabase openCentralStoreAndReturnError:](self, "openCentralStoreAndReturnError:", 0))
      return (NSNumber *)v4;
    centralStore = self->_centralStore;
  }
  -[ENAdvertisementSQLiteStore storedAdvertisementCount](centralStore, "storedAdvertisementCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", -[ENAdvertisementDatabase cacheRecordCount](self, "cacheRecordCount")+ objc_msgSend(v5, "unsignedIntValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (id)queryFilterWithBufferSize:(unint64_t)a3 hashCount:(unint64_t)a4 attenuationThreshold:(unsigned __int8)a5
{
  uint64_t v5;
  void *v9;
  int v10;
  void *v11;
  unint64_t v13;
  unint64_t v14;

  v5 = a5;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

  if (v10
    && gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v13 = a3;
    v14 = a4;
    LogPrintF_safe();
  }
  if (self->_currentStoreType != 1)
    goto LABEL_14;
  if (-[ENAdvertisementDatabase cacheRecordCount](self, "cacheRecordCount")
    && !-[ENAdvertisementDatabase flushCache](self, "flushCache"))
  {
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
LABEL_14:
    v11 = 0;
    return v11;
  }
  -[ENAdvertisementSQLiteStore queryFilterWithBufferSize:hashCount:attenuationThreshold:](self->_centralStore, "queryFilterWithBufferSize:hashCount:attenuationThreshold:", a3, a4, v5, v13, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (id)beaconCountMetricsWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a4;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSensitiveLoggingAllowed");

  if (v11
    && gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v16 = a5;
    v14 = v8;
    v15 = v9;
    LogPrintF_safe();
  }
  if (self->_currentStoreType != 1)
    goto LABEL_14;
  if (-[ENAdvertisementDatabase cacheRecordCount](self, "cacheRecordCount")
    && !-[ENAdvertisementDatabase flushCache](self, "flushCache"))
  {
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  -[ENAdvertisementSQLiteStore beaconCountMetricsWithStartDate:endDate:windowDuration:](self->_centralStore, "beaconCountMetricsWithStartDate:endDate:windowDuration:", v8, v9, a5, v14, v15, *(_QWORD *)&v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v12;
}

- (id)matchingAdvertisementBufferForRPIBuffer:(id)a3 exposureKeys:(id)a4
{
  id v6;
  size_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  char v18;
  void *v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v26;
  unint64_t v27;
  size_t v28;
  size_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;

  v6 = a3;
  v31 = a4;
  if (self->_currentStoreType != 1)
  {
    if (!-[ENAdvertisementDatabase switchToCentralStore](self, "switchToCentralStore"))
      goto LABEL_32;
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  if (-[ENAdvertisementDatabase cacheRecordCount](self, "cacheRecordCount")
    && !-[ENAdvertisementDatabase flushCache](self, "flushCache"))
  {
    if (gLogCategory__ENAdvertisementDatabase > 90
      || gLogCategory__ENAdvertisementDatabase == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  v7 = (unint64_t)objc_msgSend(v6, "length") >> 4;
  v8 = malloc_type_calloc(v7, 1uLL, 0x100004077774924uLL);
  if (v8)
  {
    v9 = v8;
    v29 = v7;
    v30 = v6;
    v10 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
    if (objc_msgSend(v31, "count"))
    {
      v11 = 0;
      v12 = 0;
      LODWORD(v13) = 0;
      v14 = 0;
      do
      {
        v15 = 0;
        v16 = v12;
        do
        {
          if (!-[ENQueryFilter shouldIgnoreRPI:](self->_inlineQueryFilter, "shouldIgnoreRPI:", v10 + v16))
          {
            v9[(v11 + v15)] = 1;
            ++v14;
          }
          ++v15;
          v16 += 16;
        }
        while (v15 != 144);
        v13 = (v13 + 1);
        v12 += 2304;
        v11 += 144;
      }
      while (objc_msgSend(v31, "count") > v13);
    }
    else
    {
      v14 = 0;
    }
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

    if ((v18 & 1) != 0
      && gLogCategory_ENAdvertisementDatabase <= 40
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      v26 = v14;
      v28 = v29 - v14;
      LogPrintF_safe();
    }
    v32 = 0;
    v33 = 0;
    v20 = -[ENAdvertisementSQLiteStore getAdvertisementsMatchingRPIBuffer:count:validityBuffer:validRPICount:matchingAdvertisementBuffer:error:](self->_centralStore, "getAdvertisementsMatchingRPIBuffer:count:validityBuffer:validRPICount:matchingAdvertisementBuffer:error:", v10, v29, v9, v14, &v33, &v32, v26, v28);
    v21 = v32;
    free(v9);
    v22 = v33;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isSensitiveLoggingAllowed");

    if (v22)
    {
      if (v24
        && gLogCategory_ENAdvertisementDatabase <= 40
        && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
      {
        v27 = v20;
        LogPrintF_safe();
      }
      objc_msgSend(MEMORY[0x1E0C99D58], "dataWithBytesNoCopy:length:", v33, 40 * v20, v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v30;
      goto LABEL_51;
    }
    if (v24
      && gLogCategory_ENAdvertisementDatabase <= 90
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    -[ENAdvertisementDatabase reportStoreError:](self, "reportStoreError:", v21);
    v6 = v30;
    if (objc_msgSend(v21, "code") != 4)
    {
      if (objc_msgSend(v21, "code") != 3)
      {
LABEL_50:
        v19 = 0;
LABEL_51:

        goto LABEL_52;
      }
      -[ENAdvertisementSQLiteStore purgeAndRemoveFromDisk:](self->_centralStore, "purgeAndRemoveFromDisk:", 0);
    }
    -[ENAdvertisementDatabase closeAllStores](self, "closeAllStores");
    goto LABEL_50;
  }
  if (gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
LABEL_23:
    LogPrintF_safe();
  }
LABEL_32:
  v19 = 0;
LABEL_52:

  return v19;
}

- (id)advertisementsBufferMatchingDailyKeys:(id)a3 attenuationThreshold:(unsigned __int8)a4 timestampTolerance:(double)a5
{
  id v7;
  void *v8;
  int v9;
  size_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFAbsoluteTime Current;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  double v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  const char *v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  unsigned int v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  void *v65;

  v60 = a4;
  v7 = a3;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSensitiveLoggingAllowed");

  if (v9
    && gLogCategory_ENAdvertisementDatabase <= 40
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v50 = objc_msgSend(v7, "count");
    LogPrintF_safe();
  }
  v62 = 0;
  v63 = &v62;
  v10 = 2304 * objc_msgSend(v7, "count", v50);
  v64 = 0x2020000000;
  v65 = 0;
  v65 = malloc_type_malloc(v10, 0xC86D1DD6uLL);
  if (v63[3])
  {
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __105__ENAdvertisementDatabase_advertisementsBufferMatchingDailyKeys_attenuationThreshold_timestampTolerance___block_invoke;
    v61[3] = &unk_1E87DC130;
    v61[4] = &v62;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v61);
    v11 = objc_alloc(MEMORY[0x1E0C99D58]);
    v12 = objc_msgSend(v11, "initWithBytesNoCopy:length:", v63[3], v10);
    -[ENAdvertisementDatabase matchingAdvertisementBufferForRPIBuffer:exposureKeys:](self, "matchingAdvertisementBufferForRPIBuffer:exposureKeys:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13
      && gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v15 = objc_msgSend(v13, "length");
    v59 = (void *)v12;
    v58 = objc_retainAutorelease(v13);
    v16 = objc_msgSend(v58, "bytes");
    if (v13 && v15 >= 0x28)
    {
      v17 = v16;
      Current = CFAbsoluteTimeGetCurrent();
      v19 = *MEMORY[0x1E0C9ADF0];
      v20 = Current + *MEMORY[0x1E0C9ADF0];
      if (v15 / 0x28 <= 1)
        v21 = 1;
      else
        v21 = v15 / 0x28;
      v22 = v20 + -1209600.0;
      do
      {
        v23 = (void *)MEMORY[0x1D17A7CB8]();
        objc_msgSend(v7, "objectAtIndex:", *(unsigned int *)(v17 + 28));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (*(double *)(v17 + 20) >= v22)
        {
          v28 = objc_msgSend(v24, "rollingStartNumber") + *(unsigned __int16 *)(v17 + 32);
          v29 = *(double *)(v17 + 20);
          if (v19 + (double)v28 * 600.0 - v19 - a5 <= v29
            && v29 <= v19 + (double)(v28 + 1) * 600.0 - v19 + a5)
          {
            +[ENAdvertisement decryptedMetadataForTemporaryExposureKey:encryptedAEM:RPI:](ENAdvertisement, "decryptedMetadataForTemporaryExposureKey:encryptedAEM:RPI:", v25, v17 + 16, v17);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32;
            if (v32)
            {
              v34 = objc_msgSend(v32, "attenuationForRSSI:saturated:", *(char *)(v17 + 36), *(unsigned __int8 *)(v17 + 38));
              +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "isRPILoggingAllowed");

              if (v36
                && gLogCategory_ENAdvertisementDatabase <= 10
                && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
              {
                CUPrintHex();
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v33, "txPower");
                v38 = *(char *)(v17 + 36);
                v39 = objc_msgSend(v33, "calibrationConfidence");
                v40 = "?";
                if (v39 <= 3)
                  v40 = off_1E87DC150[(char)v39];
                v55 = v40;
                v56 = *(unsigned __int8 *)(v17 + 38);
                v53 = v37;
                v54 = v38;
                v51 = *(double *)&v57;
                v52 = v34;
                LogPrintF_safe();

              }
              if (v34 >= v60)
              {
                +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v47, "isSensitiveLoggingAllowed");

                if (v48
                  && gLogCategory_ENAdvertisementDatabase <= 50
                  && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                goto LABEL_69;
              }
            }
            else
            {
              if (gLogCategory__ENAdvertisementDatabase <= 90
                && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              -[ENAdvertisementDatabase reportErrorMetric:](self, "reportErrorMetric:", 1006, *(_QWORD *)&v51);
LABEL_69:
              *(_DWORD *)(v17 + 28) = -1;
              ++self->_droppedAdvertisementCount;
            }

            goto LABEL_58;
          }
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", *(_QWORD *)&v51, v52, v53, v54, v55, v56);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isSensitiveLoggingAllowed");

          if (v31
            && gLogCategory_ENAdvertisementDatabase <= 50
            && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isRPILoggingAllowed");

          if (v44
            && gLogCategory_ENAdvertisementDatabase <= 50
            && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v7, "objectAtIndex:", *(unsigned int *)(v17 + 28));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "keyData");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v28;
            v52 = *(_QWORD *)(v17 + 20);
            v51 = *(double *)&v46;
            LogPrintF_safe();

          }
        }
        else
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isSensitiveLoggingAllowed");

          if (v27
            && gLogCategory_ENAdvertisementDatabase <= 50
            && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            v51 = v22;
            LogPrintF_safe();
          }
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", *(_QWORD *)&v51);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isRPILoggingAllowed");

          if (v42
            && gLogCategory_ENAdvertisementDatabase <= 50
            && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            v52 = *(_QWORD *)(v17 + 20);
            v51 = *(double *)&v25;
            LogPrintF_safe();
          }
        }
        *(_DWORD *)(v17 + 28) = -1;
        ++self->_droppedAdvertisementCount;
LABEL_58:

        objc_autoreleasePoolPop(v23);
        v17 += 40;
        --v21;
      }
      while (v21);
    }

    v14 = v58;
  }
  else
  {
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v14 = 0;
  }
  _Block_object_dispose(&v62, 8);

  return v14;
}

uint64_t __105__ENAdvertisementDatabase_advertisementsBufferMatchingDailyKeys_attenuationThreshold_timestampTolerance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "deriveRollingProximityIdentifiersWithBuffer:count:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 2304 * a3, 144);
}

- (id)createQuerySessionWithAttenuationThreshold:(unsigned __int8)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  ENAdvertisementDatabaseQuerySession *v12;

  v6 = a3;
  v8 = a4;
  if (-[ENAdvertisementDatabase openCentralStoreAndReturnError:](self, "openCentralStoreAndReturnError:", a5))
  {
    -[ENAdvertisementDatabase storedAdvertisementCount](self, "storedAdvertisementCount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isSensitiveLoggingAllowed");

      if (v11
        && gLogCategory_ENAdvertisementDatabase <= 50
        && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v12 = -[ENAdvertisementDatabaseQuerySession initWithDatabase:attenuationThreshold:advertisementCount:queue:]([ENAdvertisementDatabaseQuerySession alloc], "initWithDatabase:attenuationThreshold:advertisementCount:queue:", self, v6, objc_msgSend(v9, "unsignedIntValue"), v8);
    }
    else
    {
      if (gLogCategory__ENAdvertisementDatabase <= 90
        && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)purgeAdvertismentsOlderThan:(double)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSinceNow:", -a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ENAdvertisementDatabase purgeAdvertismentsSeenBeforeDate:](self, "purgeAdvertismentsSeenBeforeDate:", v4);

  return (char)self;
}

- (BOOL)purgeAdvertismentsSeenBeforeDate:(id)a3
{
  char *v4;
  ENAdvertisementSQLiteStore *centralStore;
  BOOL v6;
  id v7;
  BOOL v8;
  const char *v10;
  const char *v11;
  id v12;

  v4 = (char *)a3;
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v10 = v4;
    LogPrintF_safe();
  }
  centralStore = self->_centralStore;
  if (!centralStore)
  {
    v7 = 0;
    goto LABEL_11;
  }
  v12 = 0;
  v6 = -[ENAdvertisementSQLiteStore purgeAdvertismentsRecordedPriorToDate:error:](centralStore, "purgeAdvertismentsRecordedPriorToDate:error:", v4, &v12);
  v7 = v12;
  if (v6)
  {
LABEL_11:
    v8 = 1;
    goto LABEL_18;
  }
  if (gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v10 = -[NSString UTF8String](self->_databaseFolderPath, "UTF8String", v10);
    LogPrintF_safe();
  }
  -[ENAdvertisementDatabase reportStoreError:](self, "reportStoreError:", v7, v10);
  if (objc_msgSend(v7, "code") == 4)
    goto LABEL_16;
  if (objc_msgSend(v7, "code") == 3)
  {
    -[ENAdvertisementSQLiteStore purgeAndRemoveFromDisk:](self->_centralStore, "purgeAndRemoveFromDisk:", 0);
LABEL_16:
    -[ENAdvertisementDatabase closeAllStores](self, "closeAllStores");
  }
  v8 = 0;
LABEL_18:
  if (self->_temporaryStore)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    -[ENAdvertisementDatabase closeAllStores](self, "closeAllStores", v10);
  }
  if (!+[ENAdvertisementSQLiteStore removeAllTemporaryStoresFromDiskWithFolderPath:lastModifiedBeforeDate:](ENAdvertisementSQLiteStore, "removeAllTemporaryStoresFromDiskWithFolderPath:lastModifiedBeforeDate:", self->_databaseFolderPath, v4, v10))
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      v11 = -[NSString UTF8String](self->_databaseFolderPath, "UTF8String");
      LogPrintF_safe();
    }
    v8 = 0;
  }
  -[ENAdvertisementDatabase openStoreAndReturnError:](self, "openStoreAndReturnError:", 0, v11);

  return v8;
}

- (BOOL)purgeAllStoresInActiveDatabasePath
{
  self->_advertisementInsertionIndex = 0;
  bzero(self->_advertisementInsertionCache, 40 * self->_advertisementInsertionCacheCount);
  self->_advertisementInsertionCacheOverflowed = 0;
  -[ENAdvertisementDatabase closeAllStores](self, "closeAllStores");
  return +[ENAdvertisementDatabase purgeAllStoresInPath:](ENAdvertisementDatabase, "purgeAllStoresInPath:", self->_databaseFolderPath);
}

+ (BOOL)purgeAllStoresInPath:(id)a3
{
  id v3;
  BOOL v4;
  id v6;

  v3 = a3;
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v6 = v3;
    LogPrintF_safe();
  }
  v4 = +[ENAdvertisementSQLiteStore removeAllStoresFromDiskWithFolderPath:](ENAdvertisementSQLiteStore, "removeAllStoresFromDiskWithFolderPath:", v3, v6);
  if (!v4
    && gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v4;
}

- (BOOL)cloneDatabaseTo:(id)a3
{
  id v4;
  BOOL v5;
  id v7;

  v4 = a3;
  if (self->_centralStore)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      v7 = v4;
      LogPrintF_safe();
    }
    -[ENAdvertisementDatabase flushCache](self, "flushCache", v7);
    v5 = -[ENAdvertisementSQLiteStore cloneStoreTo:](self->_centralStore, "cloneStoreTo:", v4);
  }
  else
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v5 = 0;
  }

  return v5;
}

- (unint64_t)currentStoreType
{
  return self->_currentStoreType;
}

- (ENQueryFilter)inlineQueryFilter
{
  return self->_inlineQueryFilter;
}

- (void)setInlineQueryFilter:(id)a3
{
  objc_storeStrong((id *)&self->_inlineQueryFilter, a3);
}

- (unint64_t)droppedAdvertisementCount
{
  return self->_droppedAdvertisementCount;
}

- (double)storageFullAlertInterval
{
  return self->_storageFullAlertInterval;
}

- (void)setStorageFullAlertInterval:(double)a3
{
  self->_storageFullAlertInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineQueryFilter, 0);
  objc_storeStrong(&self->_errorMetricReporter, 0);
  objc_storeStrong((id *)&self->_temporaryStore, 0);
  objc_storeStrong((id *)&self->_centralStore, 0);
  objc_storeStrong((id *)&self->_databaseFolderPath, 0);
}

@end
