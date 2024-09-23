@implementation ML3DatabaseImportManager

- (ML3DatabaseImportManager)init
{
  ML3DatabaseImportManager *v2;
  NSOperationQueue *v3;
  NSOperationQueue *importOperationQueue;
  NSMutableArray *v5;
  NSMutableArray *suspendedImportOperations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ML3DatabaseImportManager;
  v2 = -[ML3DatabaseImportManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    importOperationQueue = v2->_importOperationQueue;
    v2->_importOperationQueue = v3;

    -[NSOperationQueue setName:](v2->_importOperationQueue, "setName:", CFSTR("com.apple.medialibraryd.importOperationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_importOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_importOperationQueue, "setQualityOfService:", -1);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    suspendedImportOperations = v2->_suspendedImportOperations;
    v2->_suspendedImportOperations = v5;

  }
  return v2;
}

- (unint64_t)operationsCount
{
  return -[NSOperationQueue operationCount](self->_importOperationQueue, "operationCount");
}

- (unint64_t)suspendedOperationsCount
{
  return -[NSMutableArray count](self->_suspendedImportOperations, "count");
}

- (BOOL)isSuspended
{
  return -[NSOperationQueue isSuspended](self->_importOperationQueue, "isSuspended");
}

- (void)performImport:(id)a3 fromSource:(unint64_t)a4 progressBlock:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  +[ML3ImportOperation importOperationWithSourceType:databaseImport:](ML3ImportOperation, "importOperationWithSourceType:databaseImport:", a4, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setClientCompletionHandler:", v12);
  objc_msgSend(v13, "setProgressBlock:", v11);
  objc_initWeak(&location, v13);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__ML3DatabaseImportManager_performImport_fromSource_progressBlock_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E5B62588;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  objc_msgSend(v13, "setCompletionBlock:", v14);
  -[NSOperationQueue addOperation:](self->_importOperationQueue, "addOperation:", v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (float)currentOperationProgressWithError:(id *)a3
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;

  -[NSOperationQueue operations](self->_importOperationQueue, "operations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = 0;
    v7 = -1.0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v5, "progress");
  v7 = v6;
  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v8);
LABEL_4:

  return v7;
}

- (void)cancelAllImportOperations
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all import operations.", v4, 2u);
  }

  -[NSOperationQueue setSuspended:](self->_importOperationQueue, "setSuspended:", 0);
  -[NSOperationQueue cancelAllOperations](self->_importOperationQueue, "cancelAllOperations");
  -[NSMutableArray removeAllObjects](self->_suspendedImportOperations, "removeAllObjects");
}

- (void)cancelImportOperationsOriginatingFromClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  ML3DatabaseImportManager *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v6;
    v39 = 1024;
    v40 = objc_msgSend(v4, "processID");
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling any active or suspended import operations in progress for process %{public}@ (process ID = %d)", buf, 0x12u);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSOperationQueue operations](self->_importOperationQueue, "operations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v12, "import");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "client");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v4);

        if (v15)
          objc_msgSend(v12, "cancel");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = self;
  v17 = self->_suspendedImportOperations;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v22, "import");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "client");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqual:", v4);

        if (v25)
          objc_msgSend(v16, "addObject:", v22);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  -[NSMutableArray removeObjectsInArray:](v26->_suspendedImportOperations, "removeObjectsInArray:", v16);
}

- (void)cancelImportOperationsForSource:(unint64_t)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
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
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[NSOperationQueue operations](self->_importOperationQueue, "operations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
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
        if (objc_msgSend(v12, "importSource") == a3)
          objc_msgSend(v12, "cancel");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  if (v6)
    v6[2](v6, 1, 0);

}

- (void)suspendImportOperations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  ML3DatabaseImportManager *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[NSOperationQueue operationCount](self->_importOperationQueue, "operationCount"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = self;
    -[NSOperationQueue operations](self->_importOperationQueue, "operations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "import");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isSuspendable");

          v12 = os_log_create("com.apple.amp.medialibrary", "Service");
          v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (v13)
            {
              *(_DWORD *)buf = 138543362;
              v22 = v9;
              _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Suspending import operation %{public}@", buf, 0xCu);
            }

            v6 = 1;
            objc_msgSend(v9, "setSuspended:", 1);
            objc_msgSend(v9, "cancel");
          }
          else
          {
            if (v13)
            {
              *(_DWORD *)buf = 138543362;
              v22 = v9;
              _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Import operation %{public}@ is not suspendable - skipping", buf, 0xCu);
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    v14 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "Waiting for suspended import operations to finish...", buf, 2u);
    }

    if ((v6 & 1) != 0 && !-[NSOperationQueue isSuspended](v16->_importOperationQueue, "isSuspended"))
    {
      -[NSOperationQueue waitUntilAllOperationsAreFinished](v16->_importOperationQueue, "waitUntilAllOperationsAreFinished");
      -[NSOperationQueue setSuspended:](v16->_importOperationQueue, "setSuspended:", 1);
    }
    v15 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "Suspended import operations finished.", buf, 2u);
    }

  }
}

- (void)resumeSuspendedImportOperations
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableArray count](self->_suspendedImportOperations, "count");
    *(_DWORD *)buf = 134217984;
    v23 = v4;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Resuming %lu suspended import operation(s)", buf, 0xCu);
  }

  v5 = (void *)-[NSMutableArray copy](self->_suspendedImportOperations, "copy");
  -[NSMutableArray removeAllObjects](self->_suspendedImportOperations, "removeAllObjects");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = os_log_create("com.apple.amp.medialibrary", "Service");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = (uint64_t)v10;
          _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "Resuming import operation %{public}@", buf, 0xCu);
        }

        objc_msgSend(v10, "import");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "importSource");
        objc_msgSend(v10, "_clientCompletionHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "progressBlock");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ML3DatabaseImportManager performImport:fromSource:progressBlock:withCompletionHandler:](self, "performImport:fromSource:progressBlock:withCompletionHandler:", v12, v13, v15, v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[NSOperationQueue setSuspended:](self->_importOperationQueue, "setSuspended:", 0);
}

- (id)_importOperations
{
  void *v2;
  void *v3;

  -[NSOperationQueue operations](self->_importOperationQueue, "operations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_suspendedImportOperations
{
  return (id)-[NSMutableArray copy](self->_suspendedImportOperations, "copy");
}

- (void)_handleImportOperationCompleted:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSError *v7;
  NSError *lastImportError;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "success");
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v7 = (NSError *)objc_claimAutoreleasedReturnValue();
  lastImportError = self->_lastImportError;
  self->_lastImportError = v7;

  v9 = os_log_create("com.apple.amp.medialibrary", "Service");
  v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)v20 = 138543362;
    *(_QWORD *)&v20[4] = v4;
    v11 = "Successfully executed import operation %{public}@";
    v12 = v10;
    v13 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)v20 = 138543362;
    *(_QWORD *)&v20[4] = v6;
    v11 = "Import operation failed: %{public}@";
    v12 = v10;
    v13 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1AC149000, v12, v13, v11, v20, 0xCu);
LABEL_7:

  objc_msgSend(v4, "_clientCompletionHandler");
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = objc_msgSend(v4, "success");
    objc_msgSend(v4, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "returnData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *, void *))v14)[2](v14, v15, v16, v17);

  }
  objc_msgSend(v4, "import", *(_OWORD *)v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "library");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "notifyLibraryImportDidFinish");

}

- (void)_handleImportOperationCancelled:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_ERROR, "Operation %{public}@ cancelled.", (uint8_t *)&v9, 0xCu);
  }

  if (objc_msgSend(v4, "isSuspended"))
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ suspended--adding to suspension queue.", (uint8_t *)&v9, 0xCu);
    }

    -[NSMutableArray addObject:](self->_suspendedImportOperations, "addObject:", v4);
  }
  else
  {
    objc_msgSend(v4, "_clientCompletionHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 400, CFSTR("Operation was cancelled by the media library service."));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *, _QWORD))v7)[2](v7, 0, v8, 0);

    }
  }

}

- (NSError)lastImportError
{
  return self->_lastImportError;
}

- (void)setLastImportError:(id)a3
{
  objc_storeStrong((id *)&self->_lastImportError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastImportError, 0);
  objc_storeStrong((id *)&self->_suspendedImportOperations, 0);
  objc_storeStrong((id *)&self->_importOperationQueue, 0);
}

void __89__ML3DatabaseImportManager_performImport_fromSource_progressBlock_withCompletionHandler___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_msgSend(WeakRetained, "isCancelled");
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "_handleImportOperationCancelled:", WeakRetained);
  else
    objc_msgSend(v3, "_handleImportOperationCompleted:", WeakRetained);

}

@end
