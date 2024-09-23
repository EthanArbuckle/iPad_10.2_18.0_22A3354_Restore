@implementation CPLEngineOutgoingResources

- (unint64_t)scopeType
{
  return 1;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  LODWORD(a4) = objc_msgSend(v11, "deleteRecordsForScopeIndex:maxCount:deletedCount:discardedResources:error:", a3, a4, a5, &v26, a6);
  v12 = v26;

  if ((_DWORD)a4)
  {
    if (objc_msgSend(v12, "count"))
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resourceStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v15);
            if (!objc_msgSend(v14, "dropResourceForUpload:error:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), a6, (_QWORD)v22))
            {
              v20 = 0;
              goto LABEL_14;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v17)
            continue;
          break;
        }
      }
      v20 = 1;
LABEL_14:

    }
    else
    {
      v20 = 1;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)storeResourcesToUpload:(id)a3 withUploadIdentifier:(id)a4 shouldCheckResources:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  char v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v34;
  void *v35;
  void *v36;
  SEL v37;
  _BOOL4 v38;
  id obj;
  CPLEngineOutgoingResources *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v38 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v40 = self;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resourceStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v14)
  {
    v15 = v14;
    v37 = a2;
    v16 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v18, "identity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fingerPrint");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20
          || (v21 = (void *)v20,
              objc_msgSend(v19, "fileUTI"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v22,
              v21,
              !v22))
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_19619();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v18;
              _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_ERROR, "Resource should be fully formed here: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineOutgoingResources.m");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v37, v40, v36, 46, CFSTR("Resource should be fully formed here: %@"), v18);

          abort();
        }
        objc_msgSend(v19, "fileURL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_19619();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v18;
              _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEBUG, "Storing for upload: %@", buf, 0xCu);
            }

          }
          -[CPLEngineStorage platformObject](v40, "platformObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "storeResourceToUpload:withUploadIdentifier:error:", v18, v11, a6);

          if (!v26)
            goto LABEL_28;
          v27 = objc_msgSend(v13, "storeResourceForUpload:shouldCheckResource:error:", v18, v38, a6);

          if ((v27 & 1) == 0)
            goto LABEL_29;
        }
        else
        {
          v41 = 0;
          v28 = objc_msgSend(v13, "storeResourceCopyForUpload:error:", v18, &v41);
          v29 = v41;
          v30 = v29;
          if ((v28 & 1) != 0)
          {
            -[CPLEngineStorage platformObject](v40, "platformObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "storeResourceToUpload:withUploadIdentifier:error:", v18, v11, a6);

            if (!v32)
              goto LABEL_30;
          }
          else
          {
            if (!objc_msgSend(v29, "isCPLErrorWithCode:", 27))
            {
              if (a6)
                *a6 = objc_retainAutorelease(v30);

LABEL_28:
LABEL_29:
              LOBYTE(v32) = 0;
              goto LABEL_30;
            }

          }
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      LOBYTE(v32) = 1;
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v32) = 1;
  }
LABEL_30:

  return v32;
}

- (BOOL)deleteResourcesToUploadWithUploadIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  char v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CPLEngineStorage platformObject](self, "platformObject", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourcesToUploadForUploadIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v8, "dropResourceForUpload:error:", v15, a4) & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_19619();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v15;
              _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Failed to drop resource for upload: %@", buf, 0xCu);
            }

          }
          v16 = 0;
          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v12)
        continue;
      break;
    }
  }

  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "deleteResourcesToUploadWithUploadIdentifier:error:", v6, a4);
LABEL_15:

  return v16;
}

- (id)resourceTypesToUploadForChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "_pushContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uploadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_19619();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "%@ has no upload identifiers but has resources to upload", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineOutgoingResources.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 98, CFSTR("%@ has no upload identifiers but has resources to upload"), v5);

    abort();
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceTypesToUploadForUploadIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)availableResourceSizeForUploadIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "availableResourceSizeForUploadIdentifier:", v4);

  return v6;
}

- (BOOL)shouldUploadResource:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldUploadResource:", v4);

  return v6;
}

- (unint64_t)countOfOriginalImages
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfOriginalImages");

  return v3;
}

- (unint64_t)countOfOriginalVideos
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfOriginalVideos");

  return v3;
}

- (unint64_t)countOfOriginalOthers
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfOriginalOthers");

  return v3;
}

- (BOOL)openWithError:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPLEngineOutgoingResources;
  return -[CPLEngineStorage openWithError:](&v4, sel_openWithError_, a3);
}

- (unint64_t)sizeOfResourcesToUpload
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sizeOfResourcesToUpload");

  return v3;
}

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sizeOfOriginalResourcesToUpload");

  return v3;
}

@end
