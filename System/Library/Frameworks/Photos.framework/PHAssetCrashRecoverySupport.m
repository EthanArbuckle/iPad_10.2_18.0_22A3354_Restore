@implementation PHAssetCrashRecoverySupport

- (PHAssetCrashRecoverySupport)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PHAssetCrashRecoverySupport *v6;
  PHAssetCrashRecoverySupport *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAssetCrashRecoverySupport;
  v6 = -[PHAssetCrashRecoverySupport init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);

  return v7;
}

- (BOOL)_isCrashRecoveryFilename:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("XPCDict"), "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", v5))
  {
    objc_msgSend(v3, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("plist")) == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isSafeToRecoverAfterCrashForCrashRecoveryFileURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  BOOL v9;

  objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", *MEMORY[0x1E0D71C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 36);
  v8 = v7;
  if (v7 < 0)
  {
    if (v7 == -1)
    {
      v9 = *__error() != 35;
      goto LABEL_5;
    }
  }
  else
  {
    flock(v7, 8);
    close(v8);
  }
  v9 = 1;
LABEL_5:

  return v9;
}

- (void)recoverFromCrashIfNeeded
{
  PHAssetCrashRecoverySupport *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  PHAssetCrashRecoveryUnarchiver *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  PHPerformChangesRequest *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id obj;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  PHAssetCrashRecoverySupport *v51;
  void *v52;
  uint64_t v53;
  id v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[5];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  NSObject *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v2 = self;
  v83 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager pathManager](self->_libraryServicesManager, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathsForExternalWriters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v4;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
  if (v48)
  {
    v46 = *(_QWORD *)v72;
    v5 = 0x1E0C99000uLL;
    v53 = *MEMORY[0x1E0CB2CD0];
    v51 = v2;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v72 != v46)
          objc_enumerationMutation(obj);
        v49 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __55__PHAssetCrashRecoverySupport_recoverFromCrashIfNeeded__block_invoke;
        v70[3] = &unk_1E35DC188;
        v70[4] = v7;
        objc_msgSend(v47, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, 0, 0, v70);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v10 = v9;
        v59 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
        if (v59)
        {
          v11 = *(_QWORD *)v67;
          v54 = v10;
          v58 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v59; ++i)
            {
              if (*(_QWORD *)v67 != v11)
                objc_enumerationMutation(v10);
              v13 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              v14 = (void *)MEMORY[0x19AEBEADC]();
              objc_msgSend(v13, "lastPathComponent");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = -[PHAssetCrashRecoverySupport _isCrashRecoveryFilename:](v2, "_isCrashRecoveryFilename:", v15);

              if (v16)
              {
                if (-[PHAssetCrashRecoverySupport _isSafeToRecoverAfterCrashForCrashRecoveryFileURL:](v2, "_isSafeToRecoverAfterCrashForCrashRecoveryFileURL:", v13))
                {
                  v17 = *(void **)(v5 + 3408);
                  v65 = 0;
                  objc_msgSend(v17, "dataWithContentsOfURL:options:error:", v13, 1, &v65);
                  v18 = objc_claimAutoreleasedReturnValue();
                  v19 = v65;
                  if (!v18)
                  {
                    PLBackendGetLog();
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v13);
                      v30 = v22;
                      v31 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v76 = v31;
                      v77 = 2112;
                      v78 = (uint64_t)v19;
                      _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to read data from contents of XPC dictionary with path %@: %@", buf, 0x16u);

                      v22 = v30;
                    }
                    goto LABEL_42;
                  }
                  v20 = [PHAssetCrashRecoveryUnarchiver alloc];
                  v64 = 0;
                  v21 = (void *)-[PHAssetCrashRecoveryUnarchiver initForReadingFromData:error:](v20, "initForReadingFromData:error:", v18, &v64);
                  v22 = v64;
                  objc_msgSend(v21, "setUserInfo:", v2);
                  v56 = v21;
                  objc_msgSend(v21, "decodeObjectOfClass:forKey:", objc_opt_class(), v53);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = v23;
                  if (!v23)
                  {
                    PLBackendGetLog();
                    v32 = objc_claimAutoreleasedReturnValue();
                    v57 = v32;
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to create PHAssetCreationRequest from XPC dictionary, skipping", buf, 2u);
                    }
                    goto LABEL_41;
                  }
                  v25 = objc_msgSend(v23, "retryCount");
                  v55 = v22;
                  if (v25 < 1)
                  {
                    v33 = 1;
                  }
                  else
                  {
                    v26 = v25;
                    PLBackendGetLog();
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (v26 >= 7)
                    {
                      v28 = v27;
                      v57 = v27;
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v13);
                        v29 = objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v76 = v29;
                        _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Skipping recovery attempt of creation request with path %@, exceeded retry count", buf, 0xCu);

                        v5 = 0x1E0C99000;
                      }
                      v22 = v55;
                      goto LABEL_41;
                    }
                    v34 = v27;
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v13);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 134218498;
                      v76 = v26;
                      v77 = 2048;
                      v78 = 6;
                      v79 = 2112;
                      v80 = v35;
                      _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] (%lu/%lu) Retrying recovery of creation request with path %@", buf, 0x20u);

                    }
                    v33 = objc_msgSend(v24, "retryCount") + 1;
                  }
                  objc_msgSend(v24, "setRetryCount:", v33);
                  v63 = 0;
                  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, &v63);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = v63;
                  v52 = v36;
                  if (v36)
                  {
                    v62 = 0;
                    v37 = objc_msgSend(v36, "writeToURL:options:error:", v13, 1, &v62);
                    v38 = v62;
                    if ((v37 & 1) == 0)
                    {
                      PLBackendGetLog();
                      v39 = objc_claimAutoreleasedReturnValue();
                      v22 = v55;
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v13);
                        v50 = objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v76 = v50;
                        v77 = 2112;
                        v78 = (uint64_t)v38;
                        _os_log_impl(&dword_1991EC000, v39, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to write retry creation request data to path %@: %@", buf, 0x16u);

                      }
LABEL_38:

                      v40 = objc_alloc_init(PHPerformChangesRequest);
                      -[PHPerformChangesRequest recordInsertRequest:](v40, "recordInsertRequest:", v24);
                      PLBackendGetLog();
                      v41 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v24, "placeholderForCreatedAsset");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "localIdentifier");
                        v43 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v13);
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        v76 = v43;
                        v77 = 2112;
                        v78 = (uint64_t)v44;
                        _os_log_impl(&dword_1991EC000, v41, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] Attempting asset creation recovery of asset %{public}@ with path %@", buf, 0x16u);

                        v2 = v51;
                        v22 = v55;

                      }
                      v60[0] = MEMORY[0x1E0C809B0];
                      v60[1] = 3221225472;
                      v60[2] = __55__PHAssetCrashRecoverySupport_recoverFromCrashIfNeeded__block_invoke_25;
                      v60[3] = &unk_1E35DC1B0;
                      v61 = v24;
                      -[PHAssetCrashRecoverySupport _commitRequest:reply:](v2, "_commitRequest:reply:", v40, v60);

                      v5 = 0x1E0C99000;
LABEL_41:

                      v10 = v54;
LABEL_42:

LABEL_43:
                      goto LABEL_44;
                    }
                  }
                  else
                  {
                    PLBackendGetLog();
                    v38 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v76 = v57;
                      _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to archive retry creation request data: %@", buf, 0xCu);
                    }
                  }
                  v22 = v55;
                  goto LABEL_38;
                }
                PLBackendGetLog();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v13);
                  v18 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v76 = v18;
                  _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] Someone else is accessing this file, skipping asset creation recovery for path: %@", buf, 0xCu);
                  goto LABEL_43;
                }
LABEL_44:

                v11 = v58;
              }
              objc_autoreleasePoolPop(v14);
            }
            v59 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
          }
          while (v59);
        }

        v6 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    }
    while (v48);
  }

}

- (void)_commitRequest:(id)a3 reply:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0D71B70];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v8, "executeWithLibraryServicesManager:libraryName:executionContext:reply:", self->_libraryServicesManager, "-[PHAssetCrashRecoverySupport _commitRequest:reply:]", v9, v7);

}

- (id)libraryServicesManager
{
  return self->_libraryServicesManager;
}

- (id)persistentStoreCoordinator
{
  return (id)-[PLLibraryServicesManager persistentStoreCoordinator](self->_libraryServicesManager, "persistentStoreCoordinator");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

uint64_t __55__PHAssetCrashRecoverySupport_recoverFromCrashIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithPath:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to create enumerator at path %@: %@", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

void __55__PHAssetCrashRecoverySupport_recoverFromCrashIfNeeded__block_invoke_25(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "placeholderForCreatedAsset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] Successfully recovered creation of asset %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to perform asset creation request with error: %@", (uint8_t *)&v10, 0xCu);
  }

}

@end
