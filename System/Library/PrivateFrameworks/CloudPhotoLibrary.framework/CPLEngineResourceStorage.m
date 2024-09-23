@implementation CPLEngineResourceStorage

- (CPLEngineResourceStorage)initWithEngineStore:(id)a3 name:(id)a4
{
  id v6;
  CPLEngineResourceStorage *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *tempFolderURL;
  CPLEngineFileStorage *v12;
  void *v13;
  uint64_t v14;
  CPLEngineFileStorage *fileStorage;
  NSMutableDictionary *v16;
  NSMutableDictionary *identitiesToCommit;
  NSMutableDictionary *v18;
  NSMutableDictionary *identitiesToDelete;
  void *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *pruneStatsQueue;
  _CPLPruneRequestCounter *v24;
  _CPLPruneRequestCounter *pruneRequests;
  _CPLPruneRequestCounter *v26;
  _CPLPruneRequestCounter *purgeabilityCheckRequests;
  objc_super v29;

  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CPLEngineResourceStorage;
  v7 = -[CPLEngineStorage initWithEngineStore:name:](&v29, sel_initWithEngineStore_name_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "engineLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudLibraryResourceStorageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 1);
    v10 = objc_claimAutoreleasedReturnValue();
    tempFolderURL = v7->_tempFolderURL;
    v7->_tempFolderURL = (NSURL *)v10;

    v7->_shouldCreateTempFolder = 1;
    v12 = [CPLEngineFileStorage alloc];
    objc_msgSend(v8, "cloudLibraryResourceStorageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CPLEngineFileStorage initWithBaseURL:](v12, "initWithBaseURL:", v13);
    fileStorage = v7->_fileStorage;
    v7->_fileStorage = (CPLEngineFileStorage *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identitiesToCommit = v7->_identitiesToCommit;
    v7->_identitiesToCommit = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identitiesToDelete = v7->_identitiesToDelete;
    v7->_identitiesToDelete = v18;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_shouldCheckFilesForUpload = objc_msgSend(v20, "BOOLForKey:", CFSTR("CPLDontCheckFilesFingerprintForUpload")) ^ 1;

    CPLCopyDefaultSerialQueueAttributes();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.cpl.prune.stats", v21);
    pruneStatsQueue = v7->_pruneStatsQueue;
    v7->_pruneStatsQueue = (OS_dispatch_queue *)v22;

    v24 = -[_CPLPruneRequestCounter initWithTitle:statusKey:]([_CPLPruneRequestCounter alloc], "initWithTitle:statusKey:", CFSTR("Recent prune requests"), CFSTR("pruneRequests"));
    pruneRequests = v7->_pruneRequests;
    v7->_pruneRequests = v24;

    v26 = -[_CPLPruneRequestCounter initWithTitle:statusKey:]([_CPLPruneRequestCounter alloc], "initWithTitle:statusKey:", CFSTR("Recent purgeability checks"), CFSTR("purgeabilityChecks"));
    purgeabilityCheckRequests = v7->_purgeabilityCheckRequests;
    v7->_purgeabilityCheckRequests = v26;

  }
  return v7;
}

- (BOOL)_clearAndCreateTempFolderIfNecessaryWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_shouldCreateTempFolder)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "cplFileExistsAtURL:", self->_tempFolderURL))
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_186();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          -[NSURL path](self->_tempFolderURL, "path");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412290;
          v14 = v7;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Cleaning temporary folder at %@", (uint8_t *)&v13, 0xCu);

        }
      }
      objc_msgSend(v5, "removeItemAtURL:error:", self->_tempFolderURL, 0);
    }
    else if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_186();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[NSURL path](self->_tempFolderURL, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Creating temporary folder at %@", (uint8_t *)&v13, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", self->_tempFolderURL, 1, 0, a3);

    if (v8)
      self->_shouldCreateTempFolder = 0;

  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)openWithError:(id *)a3
{
  unsigned int v5;
  CPLEngineFileStorage *fileStorage;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLEngineResourceStorage;
  v5 = -[CPLEngineStorage openWithError:](&v9, sel_openWithError_);
  if (v5)
  {
    fileStorage = self->_fileStorage;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__CPLEngineResourceStorage_openWithError___block_invoke;
    v8[3] = &unk_1E60DD6D0;
    v8[4] = self;
    v5 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v8, a3);
    if (v5)
      LOBYTE(v5) = -[CPLEngineResourceStorage _clearAndCreateTempFolderIfNecessaryWithError:](self, "_clearAndCreateTempFolderIfNecessaryWithError:", a3);
  }
  return v5;
}

- (unint64_t)scopeType
{
  return 0;
}

- (BOOL)performMaintenanceWithError:(id *)a3
{
  void *v5;
  void *v6;
  int v7;

  if (-[CPLEngineStorage isEmpty](self, "isEmpty")
    && (-[CPLEngineStorage engineStore](self, "engineStore"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "downloadQueue"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEmpty"),
        v6,
        v5,
        v7))
  {
    return -[CPLEngineResourceStorage resetWithError:](self, "resetWithError:", a3);
  }
  else
  {
    return 1;
  }
}

- (BOOL)storeResourceForUpload:(id)a3 shouldCheckResource:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  int v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  CPLEngineFileStorage *fileStorage;
  int v26;
  id v27;
  CPLEngineFileStorage *v28;
  NSObject *v29;
  _BOOL8 v30;
  void *v31;
  BOOL v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  BOOL v37;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  __int128 *v55;
  BOOL v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  __int128 *p_buf;
  BOOL v62;
  id v63;
  id v64;
  id v65;
  uint8_t v66[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  __int128 buf;
  uint64_t v73;
  char v74;
  uint64_t v75;

  v5 = a4;
  v75 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  v9 = v5 && self->_shouldCheckFilesForUpload;
  objc_msgSend(v7, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v73 = 0x2020000000;
    v74 = 0;
    v12 = objc_msgSend(v8, "resourceType") == 1;
    objc_msgSend(v10, "fingerPrint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 50, CFSTR("fingerPrint is nil"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v20 = 1;
      v14 = v16;
      goto LABEL_14;
    }
    objc_msgSend(v10, "identityForStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_identitiesToDelete, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_identitiesToDelete, "removeObjectForKey:", v14);
      objc_msgSend(v10, "setFileURL:", 0);
      v16 = 0;
LABEL_38:
      v30 = +[CPLResource resourceTypeTrackedForUpload:](CPLResource, "resourceTypeTrackedForUpload:", objc_msgSend(v8, "resourceType"));
      objc_msgSend(v10, "fileURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31 == 0;

      if (!v32)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_186();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v66 = 138412290;
            v67 = v10;
            _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_ERROR, "%@ should not have an URL anymore", v66, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceStorage.m");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v43, 206, CFSTR("%@ should not have an URL anymore"), v10);

        abort();
      }
      -[CPLEngineStorage platformObject](self, "platformObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v16;
      v34 = objc_msgSend(v33, "retainIdentity:isTrackedOriginal:error:", v10, v30, &v50);
      v19 = v50;

      if (v34)
      {
        if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identitiesToCommit, "setObject:forKeyedSubscript:", v10, v14);
        v20 = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_186();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "path");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v66 = 138412802;
            v67 = v8;
            v68 = 2112;
            v69 = v36;
            v70 = 2112;
            v71 = v19;
            _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_ERROR, "Unable to retain %@ (%@): %@", v66, 0x20u);

          }
        }
        if (a5)
          *a5 = objc_retainAutorelease(v19);
        if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
          -[CPLEngineFileStorage discardUncommittedFileWithIdentity:error:](self->_fileStorage, "discardUncommittedFileWithIdentity:error:", v10, 0);
        v20 = 0;
      }
LABEL_52:
      v37 = v13 == 0;

      _Block_object_dispose(&buf, 8);
      v18 = v20 != 0;
      if (v37)
        v18 = 0;
      goto LABEL_54;
    }
    if (v9)
    {
      +[CPLFingerprintScheme fingerprintSchemeForFingerprint:](CPLFingerprintScheme, "fingerprintSchemeForFingerprint:", v13);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v47, "canMatchSignatureToFingerprint"))
      {
        v65 = 0;
        -[CPLEngineResourceStorage createTempDestinationURLForResource:error:](self, "createTempDestinationURLForResource:error:", v8, &v65);
        v21 = objc_claimAutoreleasedReturnValue();
        v16 = v65;
        v46 = (void *)v21;
        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v16;
          v44 = objc_msgSend(v22, "cplCopyItemAtURL:toURL:error:", v11, v21, &v64);
          v23 = v64;

          if (v44)
          {
            v63 = v23;
            objc_msgSend(v47, "fingerPrintForFileAtURL:error:", v46, &v63);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v63;

            if (v45)
            {
              if ((objc_msgSend(v45, "isEqualToString:", v13) & 1) != 0)
              {
                fileStorage = self->_fileStorage;
                v58[0] = MEMORY[0x1E0C809B0];
                v58[1] = 3221225472;
                v58[2] = __77__CPLEngineResourceStorage_storeResourceForUpload_shouldCheckResource_error___block_invoke;
                v58[3] = &unk_1E60DC0C8;
                v58[4] = self;
                v59 = v46;
                v62 = v12;
                v60 = v10;
                p_buf = &buf;
                v57 = v24;
                v26 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v58, &v57);
                v27 = v57;

              }
              else
              {
                if (!_CPLSilentLogging)
                {
                  __CPLStorageOSLogDomain_186();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v66 = 138412546;
                    v67 = v8;
                    v68 = 2112;
                    v69 = v45;
                    _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_ERROR, "Client trying to store %@ but actual finger print is %@", v66, 0x16u);
                  }

                }
                +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("identity.fingerPrint"));
                v27 = (id)objc_claimAutoreleasedReturnValue();

                v26 = 0;
              }
              v24 = v27;
            }
            else
            {
              v26 = 0;
            }

            v23 = v24;
          }
          else
          {
            v26 = 0;
          }
          objc_msgSend(v22, "removeItemAtURL:error:", v46, 0);

          v16 = v23;
        }
        else
        {
          v26 = 1;
        }

        goto LABEL_37;
      }
    }
    else
    {
      v47 = 0;
    }
    v28 = self->_fileStorage;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __77__CPLEngineResourceStorage_storeResourceForUpload_shouldCheckResource_error___block_invoke_2;
    v52[3] = &unk_1E60DC0C8;
    v52[4] = self;
    v53 = v11;
    v56 = v12;
    v54 = v10;
    v55 = &buf;
    v51 = 0;
    v26 = -[CPLEngineFileStorage doWrite:error:](v28, "doWrite:error:", v52, &v51);
    v16 = v51;

LABEL_37:
    if (v26)
      goto LABEL_38;
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_186();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "path");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v66 = 138412802;
        v67 = v8;
        v68 = 2112;
        v69 = v40;
        v70 = 2112;
        v71 = v16;
        _os_log_impl(&dword_1B03C2000, v39, OS_LOG_TYPE_ERROR, "Unable to store %@ (%@): %@", v66, 0x20u);

      }
    }
    v20 = 0;
    v19 = v16;
LABEL_14:
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    goto LABEL_52;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_186();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEBUG, "%@ has no attached resource file. Hopefully we won't need to upload it", (uint8_t *)&buf, 0xCu);
    }

  }
  v18 = 1;
LABEL_54:

  return v18;
}

- (BOOL)storeResourceCopyForUpload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "retainCountForIdentity:", v8);

  if (v9)
  {
    v10 = +[CPLResource resourceTypeTrackedForUpload:](CPLResource, "resourceTypeTrackedForUpload:", objc_msgSend(v6, "resourceType"));
    -[CPLEngineStorage platformObject](self, "platformObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "retainIdentity:isTrackedOriginal:error:", v12, v10, a4);

  }
  else if (a4)
  {
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 27, CFSTR("resource is not available locally"));
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)dropResourceForUpload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CPLEngineFileStorage *fileStorage;
  _BOOL8 v9;
  void *v10;
  char v11;
  id v12;
  NSMutableDictionary *identitiesToDelete;
  void *v14;
  NSObject *v15;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = 0;
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "fileSize"))
  {
    fileStorage = self->_fileStorage;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__CPLEngineResourceStorage_dropResourceForUpload_error___block_invoke;
    v18[3] = &unk_1E60D6EC0;
    v18[4] = self;
    v19 = v7;
    v20 = v6;
    -[CPLEngineFileStorage doRead:](fileStorage, "doRead:", v18);

  }
  v9 = +[CPLResource resourceTypeTrackedForUpload:](CPLResource, "resourceTypeTrackedForUpload:", objc_msgSend(v6, "resourceType"));
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v11 = objc_msgSend(v10, "releaseIdentity:lastReference:isTrackedOriginal:error:", v7, &v21, v9, &v17);
  v12 = v17;

  if (v21)
  {
    identitiesToDelete = self->_identitiesToDelete;
    objc_msgSend(v7, "identityForStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](identitiesToDelete, "setObject:forKeyedSubscript:", v7, v14);

  }
  if ((v11 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_186();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v6;
        v24 = 2112;
        v25 = v12;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Unable to drop resource to upload %@: %@", buf, 0x16u);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v11;
}

- (unint64_t)sizeOfResourcesToUpload
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalResourceSize");

  return v3;
}

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalOriginalResourceSize");

  return v3;
}

- (id)retainFileURLForResource:(id)a3 error:(id *)a4
{
  id v6;
  CPLEngineFileStorage *fileStorage;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
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
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  fileStorage = self->_fileStorage;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__CPLEngineResourceStorage_retainFileURLForResource_error___block_invoke;
  v17[3] = &unk_1E60DDB30;
  v19 = &v20;
  v17[4] = self;
  v8 = v6;
  v18 = v8;
  v16 = 0;
  v9 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v17, &v16);
  v10 = v16;
  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_186();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)v21[5], "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v8;
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
      __CPLStorageOSLogDomain_186();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v8;
        v28 = 2112;
        v29 = v10;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEBUG, "Unable to retain URL for %@: %@", buf, 0x16u);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v14;
}

- (BOOL)releaseFileURL:(id)a3 forResource:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *identitiesToDelete;
  void *v15;
  CPLEngineFileStorage *fileStorage;
  id v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "retainCountForIdentity:", v11);

  if (!v12)
  {
    objc_msgSend(v9, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    identitiesToDelete = self->_identitiesToDelete;
    objc_msgSend(v13, "identityForStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](identitiesToDelete, "setObject:forKeyedSubscript:", v13, v15);

  }
  fileStorage = self->_fileStorage;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__CPLEngineResourceStorage_releaseFileURL_forResource_error___block_invoke;
  v24[3] = &unk_1E60DDA30;
  v24[4] = self;
  v17 = v8;
  v25 = v17;
  v23 = 0;
  v18 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v24, &v23);
  v19 = v23;
  if (!v18)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_186();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v9;
        v28 = 2112;
        v29 = v21;
        v30 = 2112;
        v31 = v19;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Unable to release %@ / %@: %@", buf, 0x20u);

      }
    }
    if (a5)
      *a5 = objc_retainAutorelease(v19);
  }

  return v18;
}

- (BOOL)hasResource:(id)a3
{
  CPLEngineFileStorage *fileStorage;
  void *v4;

  fileStorage = self->_fileStorage;
  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(fileStorage) = -[CPLEngineFileStorage hasFileWithIdentity:](fileStorage, "hasFileWithIdentity:", v4);

  return (char)fileStorage;
}

- (id)createTempDestinationURLForResource:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_shouldCreateTempFolder
    && !-[CPLEngineResourceStorage _clearAndCreateTempFolderIfNecessaryWithError:](self, "_clearAndCreateTempFolderIfNecessaryWithError:", a4))
  {
    if (_CPLSilentLogging)
    {
      v17 = 0;
      goto LABEL_25;
    }
    __CPLStorageOSLogDomain_186();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[NSURL path](self->_tempFolderURL, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Failed to create temp folder at %@", buf, 0xCu);

    }
    goto LABEL_23;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_186();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Creating a temporary URL for %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "bestFileNameForResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathExtension:", v11);
    v16 = objc_claimAutoreleasedReturnValue();

    -[NSURL URLByAppendingPathComponent:isDirectory:](self->_tempFolderURL, "URLByAppendingPathComponent:isDirectory:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && !_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_186();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v6;
        v24 = 2112;
        v25 = v17;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEBUG, "Temporary destination URL for %@ is %@", buf, 0x16u);
      }

    }
    goto LABEL_24;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_186();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Can't find a good filename for %@", buf, 0xCu);
    }

  }
  if (!a4)
  {
    v16 = 0;
LABEL_23:
    v17 = 0;
    goto LABEL_24;
  }
  +[CPLErrors unknownError](CPLErrors, "unknownError");
  v16 = 0;
  v17 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:
  return v17;
}

- (BOOL)storeDownloadedResource:(id)a3 atURL:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CPLEngineFileStorage *fileStorage;
  BOOL v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  void *v21;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  BOOL v30;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURL");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_186();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "We should not try to store a resource that is not on disk", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceStorage.m");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v25, 354, CFSTR("We should not try to store a resource that is not on disk"));

    abort();
  }
  v13 = (void *)v12;
  v14 = objc_msgSend(v9, "resourceType");
  fileStorage = self->_fileStorage;
  v16 = v14 == 1;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__CPLEngineResourceStorage_storeDownloadedResource_atURL_error___block_invoke;
  v27[3] = &unk_1E60D74D8;
  v27[4] = self;
  v17 = v13;
  v28 = v17;
  v18 = v11;
  v29 = v18;
  v30 = v16;
  v26 = 0;
  v19 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v27, &v26);
  v20 = v26;
  v21 = v20;
  if (a5 && !v19)
    *a5 = objc_retainAutorelease(v20);

  return v19;
}

- (BOOL)compactWithError:(id *)a3
{
  CPLEngineFileStorage *fileStorage;
  _QWORD v5[5];

  fileStorage = self->_fileStorage;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CPLEngineResourceStorage_compactWithError___block_invoke;
  v5[3] = &unk_1E60DD6D0;
  v5[4] = self;
  return -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v5, a3);
}

- (BOOL)resetWithError:(id *)a3
{
  void *v5;
  int v6;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "resetWithError:", a3);

  return v6 && -[CPLEngineFileStorage resetWithError:](self->_fileStorage, "resetWithError:", a3);
}

- (BOOL)checkIsEmpty
{
  CPLEngineFileStorage *fileStorage;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  fileStorage = self->_fileStorage;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__CPLEngineResourceStorage_checkIsEmpty__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  -[CPLEngineFileStorage doRead:](fileStorage, "doRead:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)writeTransactionDidFail
{
  CPLEngineFileStorage *fileStorage;
  id v4;
  objc_super v5;
  id v6;
  _QWORD v7[5];

  -[CPLEngineFileStorage writeTransactionDidFail](self->_fileStorage, "writeTransactionDidFail");
  if (-[NSMutableDictionary count](self->_identitiesToCommit, "count"))
  {
    fileStorage = self->_fileStorage;
    v6 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__CPLEngineResourceStorage_writeTransactionDidFail__block_invoke;
    v7[3] = &unk_1E60DD6D0;
    v7[4] = self;
    -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v7, &v6);
    v4 = v6;
    -[NSMutableDictionary removeAllObjects](self->_identitiesToCommit, "removeAllObjects");

  }
  -[CPLEngineFileStorage setTrackAllStoresAndDeletesUntilEndOfTransaction:](self->_fileStorage, "setTrackAllStoresAndDeletesUntilEndOfTransaction:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CPLEngineResourceStorage;
  -[CPLEngineStorage writeTransactionDidFail](&v5, sel_writeTransactionDidFail);
}

- (void)writeTransactionDidSucceed
{
  CPLEngineFileStorage *fileStorage;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSMutableDictionary *identitiesToCommit;
  NSMutableDictionary *identitiesToDelete;
  objc_super v9;
  id v10;
  _QWORD v11[5];
  uint8_t buf[4];
  NSMutableDictionary *v13;
  __int16 v14;
  NSMutableDictionary *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CPLEngineFileStorage writeTransactionDidSucceed](self->_fileStorage, "writeTransactionDidSucceed");
  if (-[NSMutableDictionary count](self->_identitiesToDelete, "count")
    || -[NSMutableDictionary count](self->_identitiesToCommit, "count"))
  {
    fileStorage = self->_fileStorage;
    v10 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke;
    v11[3] = &unk_1E60DD6D0;
    v11[4] = self;
    v4 = -[CPLEngineFileStorage doWrite:error:](fileStorage, "doWrite:error:", v11, &v10);
    v5 = v10;
    if (!v4 && !_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_186();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        identitiesToCommit = self->_identitiesToCommit;
        identitiesToDelete = self->_identitiesToDelete;
        *(_DWORD *)buf = 138412802;
        v13 = identitiesToCommit;
        v14 = 2112;
        v15 = identitiesToDelete;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Unable to commit %@ or delete %@ to file storage: %@", buf, 0x20u);
      }

    }
    -[NSMutableDictionary removeAllObjects](self->_identitiesToCommit, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_identitiesToDelete, "removeAllObjects");

  }
  -[CPLEngineFileStorage setTrackAllStoresAndDeletesUntilEndOfTransaction:](self->_fileStorage, "setTrackAllStoresAndDeletesUntilEndOfTransaction:", 0);
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineResourceStorage;
  -[CPLEngineStorage writeTransactionDidSucceed](&v9, sel_writeTransactionDidSucceed);
}

- (id)status
{
  void *v3;
  void *v4;
  NSObject *pruneStatsQueue;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v15;
  CPLEngineResourceStorage *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CPLEngineResourceStorage;
  -[CPLEngineStorage status](&v17, sel_status);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  pruneStatsQueue = self->_pruneStatsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CPLEngineResourceStorage_status__block_invoke;
  block[3] = &unk_1E60D6F88;
  v6 = v4;
  v15 = v6;
  v16 = self;
  dispatch_sync(pruneStatsQueue, block);
  -[CPLEngineStorage engineStore](self, "engineStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "derivativesFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v8, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n\t"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("\nDerivatives filter: %@"), v11);

  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR("\nDerivatives filter: none"));
  }
  v12 = v6;

  return v12;
}

- (id)statusDictionary
{
  void *v3;
  void *v4;
  NSObject *pruneStatsQueue;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  CPLEngineResourceStorage *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CPLEngineResourceStorage;
  -[CPLEngineStorage statusDictionary](&v18, sel_statusDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  pruneStatsQueue = self->_pruneStatsQueue;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __44__CPLEngineResourceStorage_statusDictionary__block_invoke;
  v15 = &unk_1E60D6F88;
  v6 = v4;
  v16 = v6;
  v17 = self;
  dispatch_sync(pruneStatsQueue, &v12);
  -[CPLEngineStorage engineStore](self, "engineStore", v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "derivativesFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "plistDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("derivativesFilter"));

  v10 = v6;
  return v10;
}

- (void)notePruningRequestForResource:(id)a3 realPrune:(BOOL)a4 successful:(BOOL)a5 prunedSize:(unint64_t)a6
{
  id v10;
  OS_dispatch_queue *pruneStatsQueue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  _QWORD block[4];
  id v23;

  v10 = a3;
  pruneStatsQueue = self->_pruneStatsQueue;
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__CPLEngineResourceStorage_notePruningRequestForResource_realPrune_successful_prunedSize___block_invoke;
  v17[3] = &unk_1E60D7550;
  v20 = a4;
  v17[4] = self;
  v18 = v10;
  v21 = a5;
  v19 = a6;
  v13 = v17;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_3;
  block[3] = &unk_1E60D71F8;
  v23 = v13;
  v14 = pruneStatsQueue;
  v15 = v10;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v16);

}

- (void)notePruningRequestForResource:(id)a3 realPrune:(BOOL)a4 successful:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v11 = v8;
  if (v5)
  {
    objc_msgSend(v8, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineResourceStorage notePruningRequestForResource:realPrune:successful:prunedSize:](self, "notePruningRequestForResource:realPrune:successful:prunedSize:", v11, v6, 1, objc_msgSend(v9, "fileSize"));

    v10 = v9;
  }
  else
  {
    -[CPLEngineResourceStorage notePruningRequestForResource:realPrune:successful:prunedSize:](self, "notePruningRequestForResource:realPrune:successful:prunedSize:", v8, v6, 0, 0);
    v10 = v11;
  }

}

- (CPLEngineFileStorage)fileStorage
{
  return self->_fileStorage;
}

- (BOOL)shouldCheckFilesForUpload
{
  return self->_shouldCheckFilesForUpload;
}

- (void)setShouldCheckFilesForUpload:(BOOL)a3
{
  self->_shouldCheckFilesForUpload = a3;
}

- (NSURL)tempFolderURL
{
  return self->_tempFolderURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileStorage, 0);
  objc_storeStrong((id *)&self->_purgeabilityCheckRequests, 0);
  objc_storeStrong((id *)&self->_pruneRequests, 0);
  objc_storeStrong((id *)&self->_pruneStatsQueue, 0);
  objc_storeStrong((id *)&self->_tempFolderURL, 0);
  objc_storeStrong((id *)&self->_identitiesToDelete, 0);
  objc_storeStrong((id *)&self->_identitiesToCommit, 0);
}

uint64_t __90__CPLEngineResourceStorage_notePruningRequestForResource_realPrune_successful_prunedSize___block_invoke(uint64_t a1)
{
  int *v1;

  if (*(_BYTE *)(a1 + 56))
    v1 = &OBJC_IVAR___CPLEngineResourceStorage__pruneRequests;
  else
    v1 = &OBJC_IVAR___CPLEngineResourceStorage__purgeabilityCheckRequests;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *v1), "noteRequestForResource:successful:prunedSize:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
}

void __44__CPLEngineResourceStorage_statusDictionary__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__CPLEngineResourceStorage_statusDictionary__block_invoke_2;
  v3[3] = &unk_1E60D7528;
  v4 = *(id *)(a1 + 32);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E08DC4](v3);
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));

}

void __44__CPLEngineResourceStorage_statusDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "statusDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "statusKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  }
}

void __34__CPLEngineResourceStorage_status__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__CPLEngineResourceStorage_status__block_invoke_2;
  v3[3] = &unk_1E60D7528;
  v4 = *(id *)(a1 + 32);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E08DC4](v3);
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));

}

void __34__CPLEngineResourceStorage_status__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\n%@: %@"), v5, v3);

  }
}

BOOL __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke(uint64_t a1, _QWORD *a2)
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
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke_2;
  v13[3] = &unk_1E60D7500;
  v13[4] = v4;
  v13[5] = &v20;
  v13[6] = &v14;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke_3;
  v12[3] = &unk_1E60D7500;
  v12[4] = v7;
  v12[5] = &v20;
  v12[6] = &v14;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
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

void __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  id obj;

  v4 = *(void **)(a1[4] + 96);
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v4, "commitFileWithIdentity:error:", a3, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[5] + 8);
  if (v6)
    v8 = *(_BYTE *)(v7 + 24) != 0;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
}

void __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  id obj;

  v4 = *(void **)(a1[4] + 96);
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v4, "deleteFileWithIdentity:error:", a3, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[5] + 8);
  if (v6)
    v8 = *(_BYTE *)(v7 + 24) != 0;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
}

BOOL __51__CPLEngineResourceStorage_writeTransactionDidFail__block_invoke(uint64_t a1, _QWORD *a2)
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
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CPLEngineResourceStorage_writeTransactionDidFail__block_invoke_2;
  v8[3] = &unk_1E60D7500;
  v8[4] = v3;
  v8[5] = &v9;
  v8[6] = &v13;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
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

void __51__CPLEngineResourceStorage_writeTransactionDidFail__block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
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
  v6 = a3;
  v7 = *(void **)(a1[4] + 96);
  v8 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "discardUncommittedFileWithIdentity:error:", v6, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_186();
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

uint64_t __40__CPLEngineResourceStorage_checkIsEmpty__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "checkIsEmpty");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __45__CPLEngineResourceStorage_compactWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "compactStorage:", a2);
}

uint64_t __64__CPLEngineResourceStorage_storeDownloadedResource_atURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "storeUnretainedFileAtURL:identity:isOriginal:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), a2);
}

uint64_t __61__CPLEngineResourceStorage_releaseFileURL_forResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "releaseFileURL:error:", *(_QWORD *)(a1 + 40), a2);
}

BOOL __59__CPLEngineResourceStorage_retainFileURLForResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "retainFileURLForIdentity:resourceType:error:", v5, objc_msgSend(*(id *)(a1 + 40), "resourceType"), a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

void __56__CPLEngineResourceStorage_dropResourceForUpload_error___block_invoke(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "checkFileSizeForIdentity:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "fileSize"))
    v2 = _CPLSilentLogging == 0;
  else
    v2 = 0;
  if (v2)
  {
    __CPLStorageOSLogDomain_186();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Incorrect file size for %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

uint64_t __77__CPLEngineResourceStorage_storeResourceForUpload_shouldCheckResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "storeFileAtURL:identity:isOriginal:moveIfPossible:needsCommit:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), 1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, a2);
}

uint64_t __77__CPLEngineResourceStorage_storeResourceForUpload_shouldCheckResource_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "storeFileAtURL:identity:isOriginal:moveIfPossible:needsCommit:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), 0, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, a2);
}

uint64_t __42__CPLEngineResourceStorage_openWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CPLEngineResourceStorage_openWithError___block_invoke_2;
  v5[3] = &unk_1E60D74B0;
  v5[4] = v2;
  return objc_msgSend(v3, "openWithRecoveryHandler:error:", v5, a2);
}

BOOL __42__CPLEngineResourceStorage_openWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "retainCountForIdentity:", v3);

  return v5 == 0;
}

@end
