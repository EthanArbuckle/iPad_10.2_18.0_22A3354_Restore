@implementation CKVSnapshotManager

- (CKVSnapshotManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4
{
  id v7;
  id v8;
  CKVSnapshotManager *v9;
  CKVSnapshotManager *v10;
  CCSetEnumerator **p_setEnumerator;
  NSURL *rootDirectoryURL;
  CKVSnapshotManager *v13;
  NSObject *v14;
  CCSetEnumerator *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NSURL *v21;
  __int16 v22;
  CCSetEnumerator *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKVSnapshotManager;
  v9 = -[CKVSnapshotManager init](&v17, sel_init);
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_rootDirectoryURL, a3),
        p_setEnumerator = &v10->_setEnumerator,
        objc_storeStrong((id *)&v10->_setEnumerator, a4),
        (rootDirectoryURL = v10->_rootDirectoryURL) != 0)
    && *p_setEnumerator)
  {
    v13 = v10;
  }
  else
  {
    v14 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v16 = *p_setEnumerator;
      *(_DWORD *)buf = 136315650;
      v19 = "-[CKVSnapshotManager initWithRootDirectoryURL:setEnumerator:]";
      v20 = 2112;
      v21 = rootDirectoryURL;
      v22 = 2112;
      v23 = v16;
      _os_log_error_impl(&dword_1A48B3000, v14, OS_LOG_TYPE_ERROR, "%s Invalid {rootDirectoryURL: %@, setEnumerator: %@}", buf, 0x20u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)_buildProfile:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  int v35;
  uint64_t v37;
  id *v38;
  void *v39;
  void *v40;
  id v41;
  id obj;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *context;
  id v47;
  _QWORD v48[4];
  id v49;
  _BYTE *v50;
  uint64_t *v51;
  _QWORD v52[6];
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[4];
  const char *v68;
  __int16 v69;
  void *v70;
  uint8_t v71[128];
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v38 = a4;
  -[CCSetEnumerator allSets:](self->_setEnumerator, "allSets:", a4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v40;
  if (v40)
  {
    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v7 = v40;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v64 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v11, "itemType");
          KVItemTypeFromCascadeItemType();
          if ((KVItemTypeIsValid() & 1) != 0)
          {
            objc_msgSend(v47, "addObject:", v11);
          }
          else
          {
            v12 = CKLogContextVocabulary;
            if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "-[CKVSnapshotManager _buildProfile:error:]";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v11;
              _os_log_impl(&dword_1A48B3000, v12, OS_LOG_TYPE_INFO, "%s Skipping set: %@ not supported by Koa", buf, 0x16u);
            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
      }
      while (v8);
    }

    v13 = objc_msgSend(v47, "count");
    v14 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("to file");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[CKVSnapshotManager _buildProfile:error:]";
      if (!v41)
        v15 = CFSTR("in memory");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v73) = v13;
      _os_log_impl(&dword_1A48B3000, v14, OS_LOG_TYPE_INFO, "%s Capturing vocabulary snapshot %@ for %u sets.", buf, 0x1Cu);
    }
    objc_msgSend(MEMORY[0x1E0D42C10], "capturedWithDatasetCount:error:", v13, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      if (v41)
        objc_msgSend(MEMORY[0x1E0D42C08], "fileWriterWithProfileInfo:targetDirectory:format:error:", v39, v41, 2, v38);
      else
        objc_msgSend(MEMORY[0x1E0D42C08], "builderWithProfileInfo:format:error:", v39, 2, v38);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v73 = __Block_byref_object_copy__1036;
        v74 = __Block_byref_object_dispose__1037;
        v75 = 0;
        v59 = 0;
        v60 = &v59;
        v61 = 0x2020000000;
        v62 = 1;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        obj = v47;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
        if (v17)
        {
          v44 = *MEMORY[0x1E0D0D3C8];
          v45 = *(_QWORD *)v56;
LABEL_26:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v56 != v45)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v18);
            context = (void *)MEMORY[0x1A85A28A4]();
            objc_msgSend(v19, "changePublisher");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "localItemInstanceCount");
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_alloc(MEMORY[0x1E0D42BC0]);
            objc_msgSend(v19, "itemType");
            v24 = KVItemTypeFromCascadeItemType();
            objc_msgSend(v19, "descriptorWithKey:", v44);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (id *)(*(_QWORD *)&buf[8] + 40);
            v54 = *(id *)(*(_QWORD *)&buf[8] + 40);
            LODWORD(v37) = v21;
            v28 = (void *)objc_msgSend(v23, "initWithItemType:originAppId:deviceId:userId:lastModifiedTime:capturedTime:itemCount:error:", v24, v26, 0, 0, 0, v22, v37, &v54);
            objc_storeStrong(v27, v54);
            v29 = v20;

            if (!v28)
              goto LABEL_35;
            v30 = (id *)(*(_QWORD *)&buf[8] + 40);
            v53 = *(id *)(*(_QWORD *)&buf[8] + 40);
            objc_msgSend(v43, "addDataset:error:", v28, &v53);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v30, v53);
            if (v31)
            {
              v52[0] = MEMORY[0x1E0C809B0];
              v52[1] = 3221225472;
              v52[2] = __42__CKVSnapshotManager__buildProfile_error___block_invoke;
              v52[3] = &unk_1E4D29308;
              v52[4] = buf;
              v52[5] = &v59;
              v48[0] = MEMORY[0x1E0C809B0];
              v48[1] = 3221225472;
              v48[2] = __42__CKVSnapshotManager__buildProfile_error___block_invoke_2;
              v48[3] = &unk_1E4D29330;
              v50 = buf;
              v32 = v31;
              v49 = v32;
              v51 = &v59;
              v33 = (id)objc_msgSend(v20, "sinkWithCompletion:shouldContinue:", v52, v48);
              if (*((_BYTE *)v60 + 24))
              {
                v34 = CKLogContextVocabulary;
                if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v67 = 136315394;
                  v68 = "-[CKVSnapshotManager _buildProfile:error:]";
                  v69 = 2112;
                  v70 = v28;
                  _os_log_impl(&dword_1A48B3000, v34, OS_LOG_TYPE_INFO, "%s Captured dataset %@", v67, 0x16u);
                }
                v35 = 0;
              }
              else
              {
                v35 = 8;
              }

            }
            else
            {
LABEL_35:
              *((_BYTE *)v60 + 24) = 0;
              v35 = 8;
            }

            objc_autoreleasePoolPop(context);
            if (v35)
              break;
            if (v17 == ++v18)
            {
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
              if (v17)
                goto LABEL_26;
              break;
            }
          }
        }

        if (!*((_BYTE *)v60 + 24) || *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          KVSetError();
          v16 = 0;
        }
        else
        {
          v16 = v43;
        }
        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

    v6 = v40;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)captureToFileInDirectory:(id)a3 error:(id *)a4
{
  NSURL *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (NSURL *)a3;
  if (!v6)
    v6 = self->_rootDirectoryURL;
  KVGetOrCreateDirectoryURL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKVSnapshotManager _buildProfile:error:](self, "_buildProfile:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "finishWritingWithError:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)captureInMemory:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CKVSnapshotManager _buildProfile:error:](self, "_buildProfile:error:", 0, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "buildWithError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_getFilesSortedByCreationDateForDirectoryPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  id obj;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _QWORD v34[2];
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    v33 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v33);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v33;
    if (v5)
    {
      v24 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v23 = v5;
      obj = v5;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v30;
        v10 = *MEMORY[0x1E0C998E8];
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v30 != v9)
              objc_enumerationMutation(obj);
            v12 = v3;
            objc_msgSend(v3, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v23);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 0;
            v28 = 0;
            objc_msgSend(v14, "getResourceValue:forKey:error:", &v28, v10, &v27);
            v15 = v28;
            v16 = v27;

            if (v16 || !v15)
            {
              v19 = CKLogContextVocabulary;
              if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v37 = "-[CKVSnapshotManager _getFilesSortedByCreationDateForDirectoryPath:]";
                v38 = 2112;
                v39 = v13;
                v40 = 2112;
                v41 = v16;
                _os_log_error_impl(&dword_1A48B3000, v19, OS_LOG_TYPE_ERROR, "%s Failed to get file creation date for file %@ error: %@", buf, 0x20u);
              }

              v18 = 0;
              v3 = v12;
              v5 = v23;
              v4 = v24;
              v20 = v26;
              goto LABEL_22;
            }
            v34[0] = v14;
            v34[1] = v15;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v17);

            v6 = 0;
            v3 = v12;
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          v6 = 0;
          v16 = 0;
          if (v8)
            continue;
          break;
        }
      }
      else
      {
        v16 = v6;
      }

      v20 = v26;
      objc_msgSend(v26, "sortedArrayUsingComparator:", &__block_literal_global_1028);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v23;
      v4 = v24;
LABEL_22:

      v6 = v16;
    }
    else
    {
      v21 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "-[CKVSnapshotManager _getFilesSortedByCreationDateForDirectoryPath:]";
        v38 = 2112;
        v39 = v3;
        v40 = 2112;
        v41 = v6;
        _os_log_error_impl(&dword_1A48B3000, v21, OS_LOG_TYPE_ERROR, "%s Failed to scan files at path: %@ error: %@", buf, 0x20u);
      }
      v18 = 0;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

- (void)cleanup
{
  NSObject *v3;
  void *v4;
  NSURL *rootDirectoryURL;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[CKVSnapshotManager _purgeProfileSnapshots](self, "_purgeProfileSnapshots"))
  {
    v3 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CKVSnapshotManager cleanup]";
      _os_log_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_INFO, "%s Removing snapshot directory following purge failure", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    rootDirectoryURL = self->_rootDirectoryURL;
    v9 = 0;
    v6 = objc_msgSend(v4, "removeItemAtURL:error:", rootDirectoryURL, &v9);
    v7 = v9;

    if ((v6 & 1) == 0)
    {
      v8 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[CKVSnapshotManager cleanup]";
        v12 = 2112;
        v13 = v7;
        _os_log_error_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to remove snapshot directory: %@", buf, 0x16u);
      }
    }

  }
}

- (BOOL)_purgeProfileSnapshots
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  char v16;
  id v17;
  BOOL v18;
  NSObject *v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[NSURL path](self->_rootDirectoryURL, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVSnapshotManager _getFilesSortedByCreationDateForDirectoryPath:](self, "_getFilesSortedByCreationDateForDirectoryPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v17 = 0;
    v18 = 0;
    goto LABEL_20;
  }
  if (!objc_msgSend(v5, "count") || (v7 = objc_msgSend(v6, "count")) == 0)
  {
    v17 = 0;
    v18 = 1;
    goto LABEL_20;
  }
  v21 = v3;
  v8 = 0;
  v9 = 0;
  v10 = v7 - 1;
  while (1)
  {
    objc_msgSend(v6, "objectAtIndex:", v10, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceNow");
    if (fabs(v14) >= 43200.0 || (unint64_t)(v9 + 1) >= 0xB)
      break;
    ++v9;
LABEL_12:

    if (--v10 == -1)
    {
      v18 = 1;
      v17 = v8;
      goto LABEL_19;
    }
  }
  v22 = v8;
  v16 = objc_msgSend(v4, "removeItemAtURL:error:", v12, &v22);
  v17 = v22;

  if ((v16 & 1) != 0)
  {
    v8 = v17;
    goto LABEL_12;
  }
  v19 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[CKVSnapshotManager _purgeProfileSnapshots]";
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v17;
    _os_log_error_impl(&dword_1A48B3000, v19, OS_LOG_TYPE_ERROR, "%s Failed to remove snapshot %@ error: %@", buf, 0x20u);
  }

  v18 = 0;
LABEL_19:
  v3 = v21;
LABEL_20:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
}

uint64_t __68__CKVSnapshotManager__getFilesSortedByCreationDateForDirectoryPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __42__CKVSnapshotManager__buildProfile_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "state"))
  {
    objc_msgSend(v6, "error");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

uint64_t __42__CKVSnapshotManager__buildProfile_error___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a2, "addedLocalInstances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = *(_QWORD *)(a1[5] + 8);
        obj = *(id *)(v9 + 40);
        objc_msgSend(MEMORY[0x1E0D42BE8], "itemFromCascadeItem:error:", v8, &obj);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v9 + 40), obj);
        if (!v10
          || (v11 = (void *)a1[4],
              v12 = *(_QWORD *)(a1[5] + 8),
              v16 = *(id *)(v12 + 40),
              objc_msgSend(v11, "addItem:error:", v10, &v16),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_storeStrong((id *)(v12 + 40), v16),
              v13,
              !v13))
        {
          *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;

          v14 = 0;
          goto LABEL_13;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v14 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v14 = 1;
  }
LABEL_13:

  return v14;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CKVSnapshotManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1056 != -1)
    dispatch_once(&sharedInstance_onceToken_1056, block);
  return (id)sharedInstance_shared;
}

+ (id)writeProfileToFile:(id)a3 withFilename:(id)a4 inDirectory:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D42C08];
  v12 = a4;
  objc_msgSend(v9, "profileInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileWriterWithProfileInfo:targetDirectory:filename:format:error:", v13, v10, v12, 2, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_6;
  v15 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    objc_msgSend(v10, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v29 = "+[CKVSnapshotManager writeProfileToFile:withFilename:inDirectory:error:]";
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_INFO, "%s Writing profile: %@ to file in targetDirectory: %@", buf, 0x20u);

  }
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __72__CKVSnapshotManager_writeProfileToFile_withFilename_inDirectory_error___block_invoke;
  v25 = &unk_1E4D293C0;
  v18 = v14;
  v26 = v18;
  v27 = a6;
  v19 = objc_msgSend(v9, "enumerateDatasetsWithError:usingBlock:", a6, &v22);

  if (v19)
  {
    objc_msgSend(v18, "finishWritingWithError:", a6, v22, v23, v24, v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v20 = 0;
  }

  return v20;
}

uint64_t __72__CKVSnapshotManager_writeProfileToFile_withFilename_inDirectory_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "datasetInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addDataset:error:", v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__CKVSnapshotManager_writeProfileToFile_withFilename_inDirectory_error___block_invoke_2;
    v12[3] = &unk_1E4D29398;
    v8 = v6;
    v9 = *(_QWORD *)(a1 + 40);
    v13 = v8;
    v14 = v9;
    v10 = objc_msgSend(v3, "enumerateItemsWithError:usingBlock:", v7, v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __72__CKVSnapshotManager_writeProfileToFile_withFilename_inDirectory_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "addItem:error:", a2, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __36__CKVSnapshotManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc((Class)objc_opt_class());
  KVSnapshotRootDirectoryURL();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0D408], "setEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithRootDirectoryURL:setEnumerator:", v4, v1);
  v3 = (void *)sharedInstance_shared;
  sharedInstance_shared = v2;

}

@end
