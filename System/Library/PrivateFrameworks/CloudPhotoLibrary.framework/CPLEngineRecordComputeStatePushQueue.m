@implementation CPLEngineRecordComputeStatePushQueue

- (CPLEngineRecordComputeStatePushQueue)initWithEngineStore:(id)a3 name:(id)a4
{
  id v6;
  CPLEngineRecordComputeStatePushQueue *v7;
  void *v8;
  void *v9;
  void *v10;
  CPLEngineFileStorage *v11;
  CPLEngineFileStorage *fileStorage;
  NSMutableArray *v13;
  NSMutableArray *filesToCommit;
  NSMutableArray *v15;
  NSMutableArray *filesToDelete;
  void *v17;
  uint64_t v18;
  NSURL *incomingDownloadFolderURL;
  uint64_t v20;
  NSURL *outgoingUploadFolderURL;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  v7 = -[CPLEngineStorage initWithEngineStore:name:](&v23, sel_initWithEngineStore_name_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "engineLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientLibraryBaseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("outgoingRecordComputeStates"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[CPLEngineFileStorage initWithBaseURL:]([CPLEngineFileStorage alloc], "initWithBaseURL:", v10);
    fileStorage = v7->_fileStorage;
    v7->_fileStorage = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    filesToCommit = v7->_filesToCommit;
    v7->_filesToCommit = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    filesToDelete = v7->_filesToDelete;
    v7->_filesToDelete = v15;

    objc_msgSend(v8, "clientLibraryBaseURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("incomingRecordComputeStates"), 1);
    v18 = objc_claimAutoreleasedReturnValue();
    incomingDownloadFolderURL = v7->_incomingDownloadFolderURL;
    v7->_incomingDownloadFolderURL = (NSURL *)v18;

    objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("outgoingRecordComputeStatesFromClient"), 1);
    v20 = objc_claimAutoreleasedReturnValue();
    outgoingUploadFolderURL = v7->_outgoingUploadFolderURL;
    v7->_outgoingUploadFolderURL = (NSURL *)v20;

    v7->_lastComputeStateDownloadRequestDateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (BOOL)openWithError:(id *)a3
{
  CPLEngineFileStorage *fileStorage;
  _BOOL4 v6;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  if (-[CPLEngineStorage openWithError:](&v9, sel_openWithError_))
  {
    fileStorage = self->_fileStorage;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__CPLEngineRecordComputeStatePushQueue_openWithError___block_invoke;
    v8[3] = &unk_1E60DD6D0;
    v8[4] = self;
    v6 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v8, a3);
    if (v6)
    {
      -[CPLEngineRecordComputeStatePushQueue deleteIncomingDownloadFolderWithError:](self, "deleteIncomingDownloadFolderWithError:", 0);
      -[CPLEngineRecordComputeStatePushQueue deleteTempUploadFolderWithError:](self, "deleteTempUploadFolderWithError:", 0);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)scopeType
{
  return 1;
}

- (BOOL)performMaintenanceWithError:(id *)a3
{
  CPLEngineFileStorage *fileStorage;
  _BOOL4 v6;
  id v7;
  id v8;
  BOOL v9;
  NSDate *lastComputeStateDownloadRequestDate;
  double v11;
  id v13;

  if (-[CPLEngineStorage isEmpty](self, "isEmpty"))
  {
    fileStorage = self->_fileStorage;
    v13 = 0;
    v6 = -[CPLEngineFileStorage resetWithError:](fileStorage, "resetWithError:", &v13);
    v7 = v13;
    v8 = v7;
    if (!v6)
    {
      if (a3)
      {
        v8 = objc_retainAutorelease(v7);
        v9 = 0;
        *a3 = v8;
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v8 = 0;
  }
  lastComputeStateDownloadRequestDate = self->_lastComputeStateDownloadRequestDate;
  if (lastComputeStateDownloadRequestDate)
  {
    -[NSDate timeIntervalSinceNow](lastComputeStateDownloadRequestDate, "timeIntervalSinceNow");
    if (v11 < -3600.0)
      -[CPLEngineRecordComputeStatePushQueue deleteIncomingDownloadFolderWithError:](self, "deleteIncomingDownloadFolderWithError:", 0);
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)addComputeState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CPLEngineFileStorage *fileStorage;
  id v11;
  void *v12;
  int v13;
  id v14;
  int v15;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setFileStorageIdentifier:", v9);
    fileStorage = self->_fileStorage;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__CPLEngineRecordComputeStatePushQueue_addComputeState_error___block_invoke;
    v18[3] = &unk_1E60DD918;
    v18[4] = self;
    v19 = v6;
    v11 = v9;
    v20 = v11;
    v21 = &v22;
    if (!-[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v18, a4))
    {

      v14 = 0;
      LOBYTE(v13) = 0;
      goto LABEL_12;
    }
    if (*((_BYTE *)v23 + 24))
      -[NSMutableArray addObject:](self->_filesToCommit, "addObject:", v11);

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v13 = objc_msgSend(v12, "addComputeState:discardedFileStorageIdentifier:error:", v6, &v17, a4);
  v14 = v17;

  if (v14)
    v15 = v13;
  else
    v15 = 0;
  if (v15 == 1)
  {
    -[NSMutableArray addObject:](self->_filesToDelete, "addObject:", v14);
    LOBYTE(v13) = 1;
  }
LABEL_12:

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (BOOL)updateLocalStateForComputeState:(id)a3 newLocalState:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "updateLocalStateForComputeState:newLocalState:error:", v8, a4, a5);

  return (char)a5;
}

- (BOOL)updateFileURLForComputeState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  int v13;
  int v14;
  CPLEngineFileStorage *fileStorage;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  CPLEngineRecordComputeStatePushQueue *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  id v32;
  char v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setFileStorageIdentifier:", v9);
    v33 = 0;
    -[CPLEngineStorage platformObject](self, "platformObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v11 = objc_msgSend(v10, "updateFileURLForComputeState:discardedFileStorageIdentifier:hasUpdated:error:", v6, &v32, &v33, a4);
    v12 = v32;

    if (v12)
      v13 = v11;
    else
      v13 = 0;
    if (v13 == 1)
      -[NSMutableArray addObject:](self->_filesToDelete, "addObject:", v12);
    if (v33)
      v14 = v11;
    else
      v14 = 0;
    if (v14 == 1)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      fileStorage = self->_fileStorage;
      v31 = 0;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __75__CPLEngineRecordComputeStatePushQueue_updateFileURLForComputeState_error___block_invoke;
      v23 = &unk_1E60DD918;
      v24 = self;
      v16 = v6;
      v25 = v16;
      v17 = v9;
      v26 = v17;
      v27 = &v28;
      v11 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", &v20, a4);
      if (v11 && *((_BYTE *)v29 + 24))
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_17660();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v16;
            _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Storing updated file URL for %@", buf, 0xCu);
          }

        }
        -[NSMutableArray addObject:](self->_filesToCommit, "addObject:", v17, v20, v21, v22, v23, v24, v25);
      }

      _Block_object_dispose(&v28, 8);
    }

  }
  else if (a4)
  {
    +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("fileURL"));
    LOBYTE(v11) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)removeComputeState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "itemScopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustmentFingerprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[CPLEngineRecordComputeStatePushQueue removeComputeStateWithLocalScopedIdentifier:version:adjustmentFingerprint:error:](self, "removeComputeStateWithLocalScopedIdentifier:version:adjustmentFingerprint:error:", v7, v8, v9, a4);
  return (char)a4;
}

- (BOOL)removeComputeStateWithLocalScopedIdentifier:(id)a3 version:(id)a4 adjustmentFingerprint:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  id v17;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14 = objc_msgSend(v13, "removeComputeStateWithLocalScopedIdentifier:version:adjustmentFingerprint:discardedFileStorageIdentifier:error:", v12, v11, v10, &v17, a6);

  v15 = v17;
  if (v14 && v15)
    -[NSMutableArray addObject:](self->_filesToDelete, "addObject:", v15);

  return v14;
}

- (id)computeStatesToUploadWithScopeIdentifier:(id)a3 localState:(unint64_t)a4 maximumCount:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "computeStatesToUploadWithScopeIdentifier:localState:maximumCount:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasChangesInScopeWithIdentifier:", v4);

  return v6;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v11;
  int v12;
  id v13;
  id v15;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12 = objc_msgSend(v11, "deleteRecordsForScopeIndex:discardedFileStorageIdentifiers:maxCount:deletedCount:error:", a3, &v15, a4, a5, a6);
  v13 = v15;

  if (v12 && objc_msgSend(v13, "count"))
    -[NSMutableArray addObjectsFromArray:](self->_filesToDelete, "addObjectsFromArray:", v13);

  return v12;
}

- (unint64_t)countOfComputeStates
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfComputeStates");

  return v3;
}

- (id)retainFileURLForComputeState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CPLEngineFileStorage *fileStorage;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "fileStorageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__17678;
    v24 = __Block_byref_object_dispose__17679;
    v25 = 0;
    fileStorage = self->_fileStorage;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__CPLEngineRecordComputeStatePushQueue_retainFileURLForComputeState_error___block_invoke;
    v17[3] = &unk_1E60DDB30;
    v19 = &v20;
    v17[4] = self;
    v9 = v6;
    v18 = v9;
    v16 = 0;
    LOBYTE(fileStorage) = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v17, &v16);
    v10 = v16;
    if ((fileStorage & 1) != 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_17660();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)v21[5], "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v9;
          v28 = 2112;
          v29 = v12;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEBUG, "Retained file path for %@ is: %@", buf, 0x16u);

        }
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_17660();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v27 = v9;
          v28 = 2112;
          v29 = v10;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "Unable to retain URL for %@: %@", buf, 0x16u);
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v10);
    }
    v13 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else if (a4)
  {
    +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("fileStorageIdentifier"));
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)releaseFileURL:(id)a3 forComputeState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CPLEngineFileStorage *fileStorage;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  fileStorage = self->_fileStorage;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__CPLEngineRecordComputeStatePushQueue_releaseFileURL_forComputeState_error___block_invoke;
  v18[3] = &unk_1E60DDA30;
  v18[4] = self;
  v11 = v8;
  v19 = v11;
  v17 = 0;
  v12 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v18, &v17);
  v13 = v17;
  if (!v12)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_17660();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v9;
        v22 = 2112;
        v23 = v15;
        v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Unable to release %@ / %@: %@", buf, 0x20u);

      }
    }
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }

  return v12;
}

- (void)writeTransactionDidFail
{
  CPLEngineFileStorage *fileStorage;
  id v4;
  objc_super v5;
  id v6;
  _QWORD v7[5];

  -[CPLEngineFileStorage writeTransactionDidFail](self->_fileStorage, "writeTransactionDidFail");
  if (-[NSMutableArray count](self->_filesToCommit, "count"))
  {
    fileStorage = self->_fileStorage;
    v6 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__CPLEngineRecordComputeStatePushQueue_writeTransactionDidFail__block_invoke;
    v7[3] = &unk_1E60DD6D0;
    v7[4] = self;
    -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v7, &v6);
    v4 = v6;
    -[NSMutableArray removeAllObjects](self->_filesToCommit, "removeAllObjects");

  }
  -[CPLEngineFileStorage setTrackAllStoresAndDeletesUntilEndOfTransaction:](self->_fileStorage, "setTrackAllStoresAndDeletesUntilEndOfTransaction:", 0);
  -[NSMutableArray removeAllObjects](self->_filesToDelete, "removeAllObjects");
  v5.receiver = self;
  v5.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  -[CPLEngineStorage writeTransactionDidFail](&v5, sel_writeTransactionDidFail);
}

- (void)writeTransactionDidSucceed
{
  CPLEngineFileStorage *fileStorage;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSMutableArray *filesToCommit;
  NSMutableArray *filesToDelete;
  objc_super v9;
  id v10;
  _QWORD v11[5];
  uint8_t buf[4];
  NSMutableArray *v13;
  __int16 v14;
  NSMutableArray *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CPLEngineFileStorage writeTransactionDidSucceed](self->_fileStorage, "writeTransactionDidSucceed");
  if (-[NSMutableArray count](self->_filesToDelete, "count") || -[NSMutableArray count](self->_filesToCommit, "count"))
  {
    fileStorage = self->_fileStorage;
    v10 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke;
    v11[3] = &unk_1E60DD6D0;
    v11[4] = self;
    v4 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v11, &v10);
    v5 = v10;
    if (!v4 && !_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_17660();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        filesToCommit = self->_filesToCommit;
        filesToDelete = self->_filesToDelete;
        *(_DWORD *)buf = 138412802;
        v13 = filesToCommit;
        v14 = 2112;
        v15 = filesToDelete;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Unable to commit %@ or delete %@ to file storage: %@", buf, 0x20u);
      }

    }
    -[NSMutableArray removeAllObjects](self->_filesToCommit, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_filesToDelete, "removeAllObjects");

  }
  -[CPLEngineFileStorage setTrackAllStoresAndDeletesUntilEndOfTransaction:](self->_fileStorage, "setTrackAllStoresAndDeletesUntilEndOfTransaction:", 0);
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  -[CPLEngineStorage writeTransactionDidSucceed](&v9, sel_writeTransactionDidSucceed);
}

- (BOOL)deleteIncomingDownloadFolderWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSURL *incomingDownloadFolderURL;
  char v9;
  id v10;
  NSDate *incomingDownloadFolderCreationDate;
  BOOL v12;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_17660();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[NSURL path](self->_incomingDownloadFolderURL, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Deleting incoming download folder at %@", buf, 0xCu);

    }
  }
  incomingDownloadFolderURL = self->_incomingDownloadFolderURL;
  v16 = 0;
  v9 = objc_msgSend(v5, "removeItemAtURL:error:", incomingDownloadFolderURL, &v16);
  v10 = v16;
  if ((v9 & 1) != 0 || objc_msgSend(v5, "cplIsFileDoesNotExistError:", v10))
  {
    incomingDownloadFolderCreationDate = self->_incomingDownloadFolderCreationDate;
    self->_incomingDownloadFolderCreationDate = 0;

    v12 = 1;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_17660();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[NSURL path](self->_incomingDownloadFolderURL, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Failed to delete temporary folder at %@: %@", buf, 0x16u);

      }
    }
    v12 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v10);
  }

  return v12;
}

- (id)createNewTempDownloadFolderWithError:(id *)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v5 = -[CPLEngineRecordComputeStatePushQueue createIncomingDownloadFolderIfNecessaryWithError:](self, "createIncomingDownloadFolderIfNecessaryWithError:", &v18);
  v6 = v18;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), self->_tempFolderIndex);
    -[NSURL URLByAppendingPathComponent:isDirectory:](self->_incomingDownloadFolderURL, "URLByAppendingPathComponent:isDirectory:", v8, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 0, 0, &v17);
    v12 = v17;

    ++self->_tempFolderIndex;
    if (v11)
    {
      v9 = v9;
      v13 = v9;
      goto LABEL_16;
    }
    if (v9)
      v14 = _CPLSilentLogging == 0;
    else
      v14 = 0;
    if (v14)
    {
      __CPLStorageOSLogDomain_17660();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v9;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Failed to create temporary download folder at %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v9 = 0;
    v12 = v6;
  }
  if (a3)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a3 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_16:

  return v13;
}

- (BOOL)createIncomingDownloadFolderIfNecessaryWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSURL *incomingDownloadFolderURL;
  char v9;
  id v10;
  NSDate *v11;
  NSDate *incomingDownloadFolderCreationDate;
  BOOL v13;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_17660();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[NSURL path](self->_incomingDownloadFolderURL, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Creating incoming download folder at %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  incomingDownloadFolderURL = self->_incomingDownloadFolderURL;
  v17 = 0;
  v9 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", incomingDownloadFolderURL, 0, 0, &v17);
  v10 = v17;
  if ((v9 & 1) != 0 || objc_msgSend(v7, "cplIsFileExistsError:", v10))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    incomingDownloadFolderCreationDate = self->_incomingDownloadFolderCreationDate;
    self->_incomingDownloadFolderCreationDate = v11;

    v13 = 1;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_17660();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[NSURL path](self->_incomingDownloadFolderURL, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v16;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEFAULT, "Failed to create incoming download folder at %@: %@", buf, 0x16u);

      }
    }
    v13 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v10);
  }

  return v13;
}

- (id)createTempUploadFolderWithError:(id *)a3
{
  void *v5;
  NSURL *outgoingUploadFolderURL;
  char v7;
  id v8;
  void *v9;
  int v10;
  NSURL *v11;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  outgoingUploadFolderURL = self->_outgoingUploadFolderURL;
  v13 = 0;
  v7 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", outgoingUploadFolderURL, 0, 0, &v13);
  v8 = v13;

  if ((v7 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "cplIsFileExistsError:", v8),
        v9,
        v10))
  {
    v11 = self->_outgoingUploadFolderURL;
  }
  else
  {
    v11 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v11;
}

- (BOOL)deleteTempUploadFolderWithError:(id *)a3
{
  void *v5;
  NSURL *outgoingUploadFolderURL;
  char v7;
  id v8;
  char v9;
  void *v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  outgoingUploadFolderURL = self->_outgoingUploadFolderURL;
  v12 = 0;
  v7 = objc_msgSend(v5, "removeItemAtURL:error:", outgoingUploadFolderURL, &v12);
  v8 = v12;

  if ((v7 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "cplIsFileDoesNotExistError:", v8);

    if (a3 && (v9 & 1) == 0)
    {
      v9 = 0;
      *a3 = objc_retainAutorelease(v8);
    }
  }

  return v9;
}

- (void)noteComputeStateDownloadRequest
{
  os_unfair_lock_s *p_lastComputeStateDownloadRequestDateLock;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  CPLEngineRecordComputeStatePushQueue *v7;

  p_lastComputeStateDownloadRequestDateLock = &self->_lastComputeStateDownloadRequestDateLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __71__CPLEngineRecordComputeStatePushQueue_noteComputeStateDownloadRequest__block_invoke;
  v6 = &unk_1E60D65B8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_lastComputeStateDownloadRequestDateLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_lastComputeStateDownloadRequestDateLock);

}

- (NSURL)incomingDownloadFolderURL
{
  return self->_incomingDownloadFolderURL;
}

- (unint64_t)fileSizeForComputeStatePayloadFileURL:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0;
  v6 = *MEMORY[0x1E0C99998];
  v14 = 0;
  v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v15, v6, &v14);
  v8 = v15;
  v9 = v14;
  v10 = v9;
  if (v7)
  {
    v11 = objc_msgSend(v8, "unsignedIntegerValue");
  }
  else if (a4)
  {
    v11 = 0;
    *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_17660();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Failed to determine filesize for compute state payload file at url: %@. Error: %@", buf, 0x16u);
      }

    }
    v11 = 0;
  }

  return v11;
}

- (id)status
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  NSDate *incomingDownloadFolderCreationDate;
  void *v13;
  os_unfair_lock_s *p_lastComputeStateDownloadRequestDateLock;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  _QWORD v21[2];
  void (*v22)(_QWORD *);
  void *v23;
  CPLEngineRecordComputeStatePushQueue *v24;
  id v25;
  id v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  -[CPLEngineStorage status](&v27, sel_status);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[CPLEngineRecordComputeStatePushQueue throttlingDate](self, "throttlingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;
    +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v5, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 <= 0.0)
      v11 = CFSTR("\nUploads have been throttled until %@ and will resume during the next sync session");
    else
      v11 = CFSTR("\nUploads will resume %@");
    objc_msgSend(v4, "appendFormat:", v11, v9);

  }
  incomingDownloadFolderCreationDate = self->_incomingDownloadFolderCreationDate;
  if (incomingDownloadFolderCreationDate)
  {
    +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", incomingDownloadFolderCreationDate, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\nIncoming download folder creation: %@"), v13);

  }
  p_lastComputeStateDownloadRequestDateLock = &self->_lastComputeStateDownloadRequestDateLock;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __46__CPLEngineRecordComputeStatePushQueue_status__block_invoke;
  v23 = &unk_1E60D6EC0;
  v24 = self;
  v15 = v4;
  v25 = v15;
  v16 = v6;
  v26 = v16;
  v17 = v21;
  os_unfair_lock_lock(p_lastComputeStateDownloadRequestDateLock);
  v22(v17);
  os_unfair_lock_unlock(p_lastComputeStateDownloadRequestDateLock);

  v18 = v26;
  v19 = v15;

  return v19;
}

- (id)statusDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  -[CPLEngineStorage statusDictionary](&v13, sel_statusDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;

  -[CPLEngineRecordComputeStatePushQueue throttlingDate](self, "throttlingDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("throttlingDate"));

  }
  return v7;
}

- (CPLEngineFileStorage)fileStorage
{
  return self->_fileStorage;
}

- (NSDate)throttlingDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setThrottlingDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlingDate, 0);
  objc_storeStrong((id *)&self->_fileStorage, 0);
  objc_storeStrong((id *)&self->_incomingDownloadFolderURL, 0);
  objc_storeStrong((id *)&self->_lastComputeStateDownloadRequestDate, 0);
  objc_storeStrong((id *)&self->_outgoingUploadFolderURL, 0);
  objc_storeStrong((id *)&self->_incomingDownloadFolderCreationDate, 0);
  objc_storeStrong((id *)&self->_filesToDelete, 0);
  objc_storeStrong((id *)&self->_filesToCommit, 0);
}

void __46__CPLEngineRecordComputeStatePushQueue_status__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1[4] + 80);
  if (v1)
  {
    v2 = (void *)a1[5];
    +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v1, a1[6]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("\nLast download request: %@"), v3);

  }
}

void __71__CPLEngineRecordComputeStatePushQueue_noteComputeStateDownloadRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

BOOL __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  _QWORD v12[7];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__17678;
  v18 = __Block_byref_object_dispose__17679;
  v19 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke_2;
  v13[3] = &unk_1E60DC5F0;
  v13[4] = v4;
  v13[5] = &v20;
  v13[6] = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke_3;
  v12[3] = &unk_1E60DC5F0;
  v12[4] = v7;
  v12[5] = &v20;
  v12[6] = &v14;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  v9 = *((unsigned __int8 *)v21 + 24);
  if (a2 && !*((_BYTE *)v21 + 24))
  {
    *a2 = objc_retainAutorelease((id)v15[5]);
    v9 = *((unsigned __int8 *)v21 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  id obj;

  v3 = *(void **)(a1[4] + 104);
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "commitFileWithIdentifier:error:", a2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[5] + 8);
  if (v5)
    v7 = *(_BYTE *)(v6 + 24) != 0;
  else
    v7 = 0;
  *(_BYTE *)(v6 + 24) = v7;
}

void __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke_3(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  id obj;

  v3 = *(void **)(a1[4] + 104);
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "deleteFileWithIdentifier:error:", a2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[5] + 8);
  if (v5)
    v7 = *(_BYTE *)(v6 + 24) != 0;
  else
    v7 = 0;
  *(_BYTE *)(v6 + 24) = v7;
}

BOOL __63__CPLEngineRecordComputeStatePushQueue_writeTransactionDidFail__block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__17678;
  v17 = __Block_byref_object_dispose__17679;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CPLEngineRecordComputeStatePushQueue_writeTransactionDidFail__block_invoke_2;
  v8[3] = &unk_1E60DC5F0;
  v8[4] = v3;
  v8[5] = &v9;
  v8[6] = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  v5 = *((unsigned __int8 *)v10 + 24);
  if (a2 && !*((_BYTE *)v10 + 24))
  {
    *a2 = objc_retainAutorelease((id)v14[5]);
    v5 = *((unsigned __int8 *)v10 + 24);
  }
  v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __63__CPLEngineRecordComputeStatePushQueue_writeTransactionDidFail__block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  id obj;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *(void **)(a1[4] + 104);
  v8 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "discardUncommittedFileWithIdentifier:error:", v6, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_17660();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Unable to discard %@ from file storage", buf, 0xCu);
      }

    }
    *a4 = 1;
  }

}

uint64_t __77__CPLEngineRecordComputeStatePushQueue_releaseFileURL_forComputeState_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "releaseFileURL:error:", *(_QWORD *)(a1 + 40), a2);
}

BOOL __75__CPLEngineRecordComputeStatePushQueue_retainFileURLForComputeState_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(*(id *)(a1 + 40), "fileStorageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "retainFileURLForIdentifier:error:", v5, a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

uint64_t __75__CPLEngineRecordComputeStatePushQueue_updateFileURLForComputeState_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(*(id *)(a1 + 40), "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "storeFileAtURL:identifier:moveIfPossible:needsCommit:error:", v5, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, a2);

  return v6;
}

uint64_t __62__CPLEngineRecordComputeStatePushQueue_addComputeState_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(*(id *)(a1 + 40), "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "storeFileAtURL:identifier:moveIfPossible:needsCommit:error:", v5, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, a2);

  return v6;
}

uint64_t __54__CPLEngineRecordComputeStatePushQueue_openWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__CPLEngineRecordComputeStatePushQueue_openWithError___block_invoke_2;
  v5[3] = &unk_1E60DC5C8;
  v5[4] = v2;
  return objc_msgSend(v3, "openWithFileRecoveryHandler:error:", v5, a2);
}

uint64_t __54__CPLEngineRecordComputeStatePushQueue_openWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSomeComputeStateWithFileStorageIdentifier:", v3);

  return v5 ^ 1u;
}

@end
