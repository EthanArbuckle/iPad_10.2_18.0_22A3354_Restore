@implementation ML3ITunesSyncImportOperation

- (unint64_t)importSource
{
  return 5;
}

- (void)main
{
  NSMutableDictionary *v3;
  NSMutableDictionary *cachedPIDToFilePathMap;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedPIDToLocationPropertyMap;
  NSMutableSet *v7;
  NSMutableSet *importedPlaylists;
  double v9;
  double v10;
  NSObject *v11;
  int v12;
  int v13;
  double v14;
  uint64_t v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  cachedPIDToFilePathMap = self->_cachedPIDToFilePathMap;
  self->_cachedPIDToFilePathMap = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  cachedPIDToLocationPropertyMap = self->_cachedPIDToLocationPropertyMap;
  self->_cachedPIDToLocationPropertyMap = v5;

  v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  importedPlaylists = self->_importedPlaylists;
  self->_importedPlaylists = v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v10 = v9;
  if (*((_BYTE *)v18 + 24) && (-[ML3ITunesSyncImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __36__ML3ITunesSyncImportOperation_main__block_invoke;
    v16[3] = &unk_1E5B65CC8;
    v16[4] = self;
    v16[5] = &v17;
    -[ML3ImportOperation _writerTransactionWithBlock:](self, "_writerTransactionWithBlock:", v16);
  }
  v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[ML3ITunesSyncImportOperation isCancelled](self, "isCancelled");
    v13 = *((unsigned __int8 *)v18 + 24);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 67109632;
    v22 = v12;
    v23 = 1024;
    v24 = v13;
    v25 = 2048;
    v26 = v14 - v10;
    _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "[ML3ITunesSyncImportOperation] import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((_BYTE *)v18 + 24))
    v15 = -[ML3ITunesSyncImportOperation isCancelled](self, "isCancelled") ^ 1;
  else
    v15 = 0;
  -[ML3ImportOperation setSuccess:](self, "setSuccess:", v15);
  _Block_object_dispose(&v17, 8);
}

- (BOOL)_performImportWithTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  _BOOL4 v22;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ML3ImportOperation import](self, "import");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sagaIsEnabled = objc_msgSend(v5, "isSagaEnabled");

  -[ML3ImportOperation import](self, "import");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_resetSync = objc_msgSend(v6, "isResetSync");

  -[ML3ImportOperation import](self, "import");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForProperty:", CFSTR("primary_container_pid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_devicePrimaryContainer = objc_msgSend(v10, "longLongValue");

  -[ML3ImportOperation import](self, "import");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (!v13)
  {
    if (MSVDeviceOSIsInternalInstall())
      -[ML3ITunesSyncImportOperation _archiveSyncPlistFiles](self, "_archiveSyncPlistFiles");
    -[ML3ITunesSyncImportOperation _syncPlistFilesFromDirectory:](self, "_syncPlistFilesFromDirectory:", CFSTR("/var/mobile/Media/iTunes_Control/Sync/Media/"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[ML3ITunesSyncImportOperation _performImportFromPlistFiles:withTransaction:](self, "_performImportFromPlistFiles:withTransaction:", v21, v4);

    if (v22)
      goto LABEL_3;
LABEL_7:
    v20 = 0;
    goto LABEL_8;
  }
  -[ML3ImportOperation import](self, "import");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ML3ITunesSyncImportOperation _performImportOfTrackData:WithTransaction:](self, "_performImportOfTrackData:WithTransaction:", v15, v4);

  if (!v16)
    goto LABEL_7;
LABEL_3:
  v24 = CFSTR("modified_playlist_pids");
  -[NSMutableSet allObjects](self->_importedPlaylists, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ImportOperation setReturnData:](self, "setReturnData:", v19);

  v20 = 1;
LABEL_8:

  return v20;
}

- (BOOL)_performImportOfTrackData:(id)a3 WithTransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  ML3MusicLibrary *v11;
  ML3DatabaseConnection *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  BOOL v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[8];
  id v33;
  uint8_t v34[128];
  uint8_t v35[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v33;
  if (!v8)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 138543362;
      v36 = v27;
      v17 = "failed to deserialize track data. err=%{public}@";
LABEL_23:
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, v17, v35, 0xCu);
    }
LABEL_24:
    v16 = 0;
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    -[ML3ImportOperation import](self, "import");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "library");
    v11 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connection");
    v12 = (ML3DatabaseConnection *)objc_claimAutoreleasedReturnValue();
    ML3ImportSession::ML3ImportSession((ML3ImportSession *)v35, v11, v12, 3, 1);

    if ((ML3ImportSession::begin((ML3ImportSession *)v35, 1, 0, 0) & 1) != 0)
    {
      v13 = -[ML3ITunesSyncImportOperation _processSyncOperation:withImportSession:](self, "_processSyncOperation:withImportSession:", v9, v35);
      v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "committing import session changes", buf, 2u);
        }

        if (ML3ImportSession::flush((ML3ImportSession *)v35, 1))
        {
          ML3ImportSession::_finishImport((id *)v35);
          v16 = 1;
LABEL_34:
          ML3ImportSession::~ML3ImportSession((ML3ImportSession *)v35);
          goto LABEL_35;
        }
        v15 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v23 = "failed to commit the import session changes";
          v24 = v15;
          v25 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_32;
        }
LABEL_33:

        v16 = 0;
        goto LABEL_34;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      *(_WORD *)buf = 0;
      v23 = "failed to process track data";
    }
    else
    {
      v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      *(_WORD *)buf = 0;
      v23 = "failed to begin import session";
    }
    v24 = v15;
    v25 = OS_LOG_TYPE_ERROR;
LABEL_32:
    _os_log_impl(&dword_1AC149000, v24, v25, v23, buf, 2u);
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 138543362;
      v36 = v8;
      v17 = "unsupported import data. importData=%{public}@";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v8;
  v18 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v9);
        -[ML3ITunesSyncImportOperation _syncPlistFilesFromDirectory:](self, "_syncPlistFilesFromDirectory:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[ML3ITunesSyncImportOperation _performImportFromPlistFiles:withTransaction:](self, "_performImportFromPlistFiles:withTransaction:", v21, v7);

        if (!v22)
        {
          v16 = 0;
          goto LABEL_28;
        }
      }
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v18)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_28:

LABEL_35:
  return v16;
}

- (BOOL)_performImportFromPlistFiles:(id)a3 withTransaction:(id)a4
{
  void *v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  ML3DatabaseConnection *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  char isKindOfClass;
  NSObject *v25;
  double v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  NSObject *v34;
  void *v35;
  _BOOL4 v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  BOOL v47;
  NSObject *v48;
  void *v50;
  NSObject *p_super;
  ML3MusicLibrary *v52;
  ML3MusicLibrary *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id obj;
  uint64_t v59;
  void *v60;
  ML3ITunesSyncImportOperation *v61;
  _QWORD v62[4];
  ML3MusicLibrary *v63;
  ML3ITunesSyncImportOperation *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t v83[4];
  NSObject *v84;
  _BYTE v85[5];
  uint8_t v86[128];
  uint8_t buf[4];
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v54 = a4;
  v61 = self;
  -[ML3ImportOperation import](self, "import");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "library");
  v52 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();

  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v88 = v55;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "processing plist files: %{public}@", buf, 0xCu);
  }

  v8 = objc_msgSend(v55, "count");
  if (v8 <= 1)
    v9 = 250;
  else
    v9 = 500 * v8;
  objc_msgSend(v54, "connection", v52);
  v10 = (ML3DatabaseConnection *)objc_claimAutoreleasedReturnValue();
  ML3ImportSession::ML3ImportSession((ML3ImportSession *)buf, v53, v10, 3, 1);

  if ((ML3ImportSession::begin((ML3ImportSession *)buf, v9, v61->_resetSync, 0) & 1) == 0)
  {
    v29 = os_log_create("com.apple.amp.medialibrary", "Default");
    v60 = v29;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v83 = 0;
      _os_log_impl(&dword_1AC149000, v29, OS_LOG_TYPE_ERROR, "failed to begin import session", v83, 2u);
    }
    goto LABEL_91;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v55;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
  if (v11)
  {
    v12 = 0;
    v13 = 1;
    v14 = (float)(unint64_t)v9;
    v57 = *(_QWORD *)v78;
    while (1)
    {
      v15 = 0;
      v56 = v11;
      do
      {
        if (*(_QWORD *)v78 != v57)
          objc_enumerationMutation(obj);
        if ((v13 & 1) == 0)
          goto LABEL_70;
        v16 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v15);
        if ((-[ML3ITunesSyncImportOperation isCancelled](v61, "isCancelled") & 1) != 0)
          goto LABEL_52;
        -[ML3ITunesSyncImportOperation _syncOperationsFromPlistFile:](v61, "_syncOperationsFromPlistFile:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          v13 = 0;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
        v59 = v15;
        if (v19)
        {
          v20 = *(_QWORD *)v74;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v74 != v20)
                objc_enumerationMutation(v18);
              v22 = *(NSObject **)(*((_QWORD *)&v73 + 1) + 8 * v21);
              v23 = (void *)MEMORY[0x1AF43CC0C]();
              if ((v13 & 1) == 0 || (-[ML3ITunesSyncImportOperation isCancelled](v61, "isCancelled") & 1) != 0)
              {
                isKindOfClass = 0;
                goto LABEL_37;
              }
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) == 0)
              {
                v25 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v83 = 138543362;
                  v84 = v22;
                  _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_ERROR, "received invalid sync operation %{public}@", v83, 0xCu);
                }
                v13 = 0;
                goto LABEL_36;
              }
              -[NSObject objectForKey:](v22, "objectForKey:", CFSTR("operation"));
              v25 = objc_claimAutoreleasedReturnValue();
              if ((-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("insert_playlist")) & 1) != 0
                || (-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("update_playlist")) & 1) != 0
                || -[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("delete_playlist")))
              {
                objc_msgSend(v60, "addObject:", v22);
              }
              else if (!-[ML3ITunesSyncImportOperation _processSyncOperation:withImportSession:](v61, "_processSyncOperation:withImportSession:", v22, buf))
              {
                v27 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v83 = 138543362;
                  v84 = v25;
                  _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_ERROR, "failed to process sync operation '%{public}@'", v83, 0xCu);
                }

                v13 = 0;
                goto LABEL_30;
              }
              v13 = 1;
LABEL_30:
              *(float *)&v26 = (float)(unint64_t)++v12 / v14;
              if (*(float *)&v26 >= 1.0)
                *(float *)&v26 = 1.0;
              -[ML3ImportOperation setProgress:](v61, "setProgress:", v26);
LABEL_36:

LABEL_37:
              objc_autoreleasePoolPop(v23);
              if ((isKindOfClass & 1) == 0)
                goto LABEL_45;
              ++v21;
            }
            while (v19 != v21);
            v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
            v19 = v28;
          }
          while (v28);
        }
LABEL_45:

        v15 = v59 + 1;
      }
      while (v59 + 1 != v56);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      if (!v11)
      {

        if ((v13 & 1) == 0)
          goto LABEL_71;
        goto LABEL_53;
      }
    }
  }
  v13 = 1;
LABEL_52:

LABEL_53:
  if ((-[ML3ITunesSyncImportOperation isCancelled](v61, "isCancelled") & 1) == 0)
  {
    v30 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v83 = 0;
      _os_log_impl(&dword_1AC149000, v30, OS_LOG_TYPE_DEFAULT, "processing playlist changes", v83, 2u);
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v60;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v70;
      while (2)
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v70 != v32)
            objc_enumerationMutation(obj);
          v34 = *(NSObject **)(*((_QWORD *)&v69 + 1) + 8 * i);
          v35 = (void *)MEMORY[0x1AF43CC0C]();
          v36 = -[ML3ITunesSyncImportOperation _processSyncOperation:withImportSession:](v61, "_processSyncOperation:withImportSession:", v34, buf);
          if (!v36)
          {
            v37 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v83 = 138543362;
              v84 = v34;
              _os_log_impl(&dword_1AC149000, v37, OS_LOG_TYPE_ERROR, "failed to process playlist %{public}@", v83, 0xCu);
            }

          }
          objc_autoreleasePoolPop(v35);
          if (!v36)
          {
            v13 = 0;
            goto LABEL_70;
          }
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
        v13 = 1;
        if (v31)
          continue;
        break;
      }
    }
LABEL_70:

  }
LABEL_71:
  if ((v13 & 1) != 0)
  {
    if ((-[ML3ITunesSyncImportOperation isCancelled](v61, "isCancelled") & 1) == 0)
    {
      v38 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v83 = 0;
        _os_log_impl(&dword_1AC149000, v38, OS_LOG_TYPE_DEFAULT, "committing import session changes", v83, 2u);
      }

      if (!ML3ImportSession::flush((ML3ImportSession *)buf, 1))
      {
        p_super = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v83 = 0;
          _os_log_impl(&dword_1AC149000, p_super, OS_LOG_TYPE_DEFAULT, "failed to commit the import session changes", v83, 2u);
        }
        v47 = 0;
        goto LABEL_103;
      }
      ML3ImportSession::_finishImport((id *)buf);
      v13 = 1;
    }
    if ((-[ML3ITunesSyncImportOperation isCancelled](v61, "isCancelled") & 1) == 0)
    {
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      -[NSMutableDictionary allKeys](v61->_cachedPIDToLocationPropertyMap, "allKeys");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v66 != v41)
              objc_enumerationMutation(v39);
            v43 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
            -[NSMutableDictionary objectForKey:](v61->_cachedPIDToLocationPropertyMap, "objectForKey:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[ML3ITunesSyncImportOperation _recoverExistingAsset:forTrackId:](v61, "_recoverExistingAsset:forTrackId:", v44, objc_msgSend(v43, "longLongValue"));

          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
        }
        while (v40);
      }

    }
    if ((-[ML3ITunesSyncImportOperation isCancelled](v61, "isCancelled") & 1) == 0)
    {
      v45 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v83 = 0;
        _os_log_impl(&dword_1AC149000, v45, OS_LOG_TYPE_DEFAULT, "resetting play counts", v83, 2u);
      }

      objc_msgSend(v54, "connection");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v46, "executeUpdate:withParameters:error:", CFSTR("UPDATE item_stats SET play_count_recent=0,skip_count_recent=0 WHERE item_pid IN (SELECT item_pid FROM item_store WHERE sync_id!=0 AND store_saga_id=0)"), 0, 0);

    }
  }
  if ((v13 & 1) == 0)
  {
LABEL_91:
    v47 = 0;
    goto LABEL_92;
  }
  if ((-[ML3ITunesSyncImportOperation isCancelled](v61, "isCancelled") & 1) != 0)
  {
    v47 = 1;
    goto LABEL_92;
  }
  objc_msgSend(v54, "connection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __77__ML3ITunesSyncImportOperation__performImportFromPlistFiles_withTransaction___block_invoke;
  v62[3] = &unk_1E5B653E8;
  v63 = v53;
  v64 = v61;
  objc_msgSend(v50, "enqueueBlockForTransactionCommit:", v62);

  v47 = 1;
  p_super = &v63->super;
LABEL_103:

LABEL_92:
  if (-[ML3ITunesSyncImportOperation isCancelled](v61, "isCancelled"))
  {
    v48 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v83 = 0;
      _os_log_impl(&dword_1AC149000, v48, OS_LOG_TYPE_ERROR, "aborting cancelled sync", v83, 2u);
    }

    v47 = 0;
  }
  ML3ImportSession::~ML3ImportSession((ML3ImportSession *)buf);

  return v47;
}

- (id)_syncPlistFilesFromDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentsOfDirectoryAtPath:error:", v3, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v15 = v20;
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v3, "stringByAppendingPathComponent:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "hasPrefix:", CFSTR("Sync_"))
            && objc_msgSend(v10, "hasSuffix:", CFSTR(".plist")))
          {
            objc_msgSend(v4, "addObject:", v11);
          }

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
      }
      while (v7);
    }
  }
  else
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v22 = v3;
      v23 = 2114;
      v24 = v15;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Could not read %{public}@: %{public}@", buf, 0x16u);
    }
  }

  objc_msgSend(v4, "sortUsingSelector:", sel_compare_);
  return v4;
}

- (id)_syncOperationsFromPlistFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Invalid sync plist at %{public}@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_12;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("operations"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "No operations in %{public}@", (uint8_t *)&v10, 0xCu);
    }

LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  v6 = v6;
  v7 = v6;
LABEL_13:

  return v7;
}

- (BOOL)_processSyncOperation:(id)a3 withImportSession:(void *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "_processSyncOperation %{public}@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(v6, "objectForKey:", CFSTR("operation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("insert_track")))
  {
    v9 = -[ML3ITunesSyncImportOperation _processInsertTrackOperation:withImportSession:](self, "_processInsertTrackOperation:withImportSession:", v6, a4);
LABEL_17:
    v10 = v9;
    goto LABEL_18;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("update_track")))
  {
    v9 = -[ML3ITunesSyncImportOperation _processUpdateTrackOperation:withImportSession:](self, "_processUpdateTrackOperation:withImportSession:", v6, a4);
    goto LABEL_17;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("delete_track")))
  {
    v9 = -[ML3ITunesSyncImportOperation _processDeleteTrackOperation:withImportSession:](self, "_processDeleteTrackOperation:withImportSession:", v6, a4);
    goto LABEL_17;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("insert_playlist")))
  {
    v9 = -[ML3ITunesSyncImportOperation _processInsertPlaylistOperation:withImportSession:](self, "_processInsertPlaylistOperation:withImportSession:", v6, a4);
    goto LABEL_17;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("update_playlist")))
  {
    v9 = -[ML3ITunesSyncImportOperation _processUpdatePlaylistOperation:withImportSession:](self, "_processUpdatePlaylistOperation:withImportSession:", v6, a4);
    goto LABEL_17;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("delete_playlist")))
  {
    v9 = -[ML3ITunesSyncImportOperation _processDeletePlaylistOperation:withImportSession:](self, "_processDeletePlaylistOperation:withImportSession:", v6, a4);
    goto LABEL_17;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("update_db_info")))
  {
    v9 = -[ML3ITunesSyncImportOperation _processUpdateDBInfoOperation:withImportSession:](self, "_processUpdateDBInfoOperation:withImportSession:", v6, a4);
    goto LABEL_17;
  }
  _ML3LogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "got unhandled sync operation %{public}@", (uint8_t *)&v13, 0xCu);
  }

  v10 = 1;
LABEL_18:

  return v10;
}

- (BOOL)_processInsertTrackOperation:(id)a3 withImportSession:(void *)a4
{
  ML3ITunesSyncTrackImportItem *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  uint64_t v10;
  void *v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  BOOL v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  ML3ITunesSyncAlbumImportItem *v37;
  void *v38;
  ML3MusicLibrary *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  char v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  int v52;
  BOOL v53;
  NSObject *v54;
  NSObject *v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  NSObject *v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  char v66;
  unint64_t *v67;
  unint64_t v68;
  char v69;
  unint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  NSMutableDictionary *cachedPIDToLocationPropertyMap;
  void *v76;
  void *v77;
  void *v78;
  unint64_t *v79;
  unint64_t v80;
  int v82;
  NSDictionary *v83;
  uint64_t v84;
  std::__shared_weak_count *v85;
  _QWORD v86[2];
  ML3ITunesSyncAlbumImportItem *v87;
  std::__shared_weak_count *v88;
  _QWORD v89[2];
  uint64_t v90;
  std::__shared_weak_count *v91;
  _QWORD v92[2];
  uint64_t v93;
  std::__shared_weak_count *v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  uint8_t v99[4];
  NSDictionary *v100;
  __int128 v101;
  __int128 buf;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v83 = (NSDictionary *)a3;
  v82 = _os_feature_enabled_impl();
  v6 = (ML3ITunesSyncTrackImportItem *)operator new();
  ML3ITunesSyncTrackImportItem::ML3ITunesSyncTrackImportItem(v6, v83);
  v97 = (uint64_t)v6;
  v7 = (std::__shared_weak_count *)operator new();
  v8 = v7;
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C00;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  v98 = v7;
  if ((v82 & 1) == 0)
  {
    v53 = 0;
    v84 = (uint64_t)v6;
    v85 = v7;
LABEL_79:
    v67 = (unint64_t *)&v8->__shared_owners_;
    do
      v68 = __ldxr(v67);
    while (__stxr(v68 + 1, v67));
    goto LABEL_81;
  }
  v10 = operator new();
  -[ML3ImportOperation import](self, "import");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "library");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ML3ITunesSyncArtistImportItem::ML3ITunesSyncArtistImportItem(v10, v83, 7, v12);
  v95 = v10;
  v13 = (std::__shared_weak_count *)operator new();
  v13->__shared_owners_ = 0;
  v14 = (unint64_t *)&v13->__shared_owners_;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51D18;
  v13->__shared_weak_owners_ = 0;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)v10;
  v96 = v13;

  v93 = v10;
  v94 = v13;
  do
    v15 = __ldxr(v14);
  while (__stxr(v15 + 1, v14));
  v92[0] = v6;
  v92[1] = v8;
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  v17 = ML3ImportSession::addAlbumArtist((uint64_t)a4, &v93, v92);
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  v19 = v94;
  if (!v94)
    goto LABEL_14;
  v20 = (unint64_t *)&v94->__shared_owners_;
  do
    v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    if ((v17 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_14:
    if ((v17 & 1) != 0)
    {
LABEL_15:
      v22 = operator new();
      -[ML3ImportOperation import](self, "import");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "library");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ML3ITunesSyncArtistImportItem::ML3ITunesSyncArtistImportItem(v22, v83, 2, v24);
      *(_QWORD *)&buf = v22;
      v25 = (std::__shared_weak_count *)operator new();
      v25->__shared_owners_ = 0;
      v26 = (unint64_t *)&v25->__shared_owners_;
      v25->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51D18;
      v25->__shared_weak_owners_ = 0;
      v25[1].__vftable = (std::__shared_weak_count_vtbl *)v22;
      *((_QWORD *)&buf + 1) = v25;

      v90 = v22;
      v91 = v25;
      do
        v27 = __ldxr(v26);
      while (__stxr(v27 + 1, v26));
      v28 = v98;
      v89[0] = v97;
      v89[1] = v98;
      if (v98)
      {
        v29 = (unint64_t *)&v98->__shared_owners_;
        do
          v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
      }
      v31 = ML3ImportSession::addItemArtist((uint64_t)a4, &v90, v89);
      if (v28)
      {
        v32 = (unint64_t *)&v28->__shared_owners_;
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 - 1, v32));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      v34 = v91;
      if (!v91)
        goto LABEL_29;
      v35 = (unint64_t *)&v91->__shared_owners_;
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
        if (v31)
        {
LABEL_30:
          v37 = (ML3ITunesSyncAlbumImportItem *)operator new();
          -[ML3ImportOperation import](self, "import");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "library");
          v39 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
          ML3ITunesSyncAlbumImportItem::ML3ITunesSyncAlbumImportItem(v37, v83, v39);
          *(_QWORD *)&v101 = v37;
          v40 = (std::__shared_weak_count *)operator new();
          v40->__shared_owners_ = 0;
          v41 = (unint64_t *)&v40->__shared_owners_;
          v40->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51BC8;
          v40->__shared_weak_owners_ = 0;
          v40[1].__vftable = (std::__shared_weak_count_vtbl *)v37;
          *((_QWORD *)&v101 + 1) = v40;

          v87 = v37;
          v88 = v40;
          do
            v42 = __ldxr(v41);
          while (__stxr(v42 + 1, v41));
          v43 = v98;
          v86[0] = v97;
          v86[1] = v98;
          if (v98)
          {
            v44 = (unint64_t *)&v98->__shared_owners_;
            do
              v45 = __ldxr(v44);
            while (__stxr(v45 + 1, v44));
          }
          v46 = ML3ImportSession::addAlbum((uint64_t)a4, (uint64_t *)&v87, v86, *(_QWORD *)(v95 + 8));
          if (v43)
          {
            v47 = (unint64_t *)&v43->__shared_owners_;
            do
              v48 = __ldaxr(v47);
            while (__stlxr(v48 - 1, v47));
            if (!v48)
            {
              ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
              std::__shared_weak_count::__release_weak(v43);
            }
          }
          v49 = v88;
          if (v88)
          {
            v50 = (unint64_t *)&v88->__shared_owners_;
            do
              v51 = __ldaxr(v50);
            while (__stlxr(v51 - 1, v50));
            if (!v51)
            {
              ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
              std::__shared_weak_count::__release_weak(v49);
            }
          }
          if ((v46 & 1) != 0)
          {
            v52 = 0;
          }
          else
          {
            v55 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v99 = 138543362;
              v100 = v83;
              _os_log_impl(&dword_1AC149000, v55, OS_LOG_TYPE_ERROR, "Could not import album with payload=%{public}@.", v99, 0xCu);
            }

            v52 = 1;
          }
          v56 = (std::__shared_weak_count *)*((_QWORD *)&v101 + 1);
          if (*((_QWORD *)&v101 + 1))
          {
            v57 = (unint64_t *)(*((_QWORD *)&v101 + 1) + 8);
            do
              v58 = __ldaxr(v57);
            while (__stlxr(v58 - 1, v57));
            if (!v58)
            {
              ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
              std::__shared_weak_count::__release_weak(v56);
            }
          }
LABEL_64:
          v60 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
          if (*((_QWORD *)&buf + 1))
          {
            v61 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
            do
              v62 = __ldaxr(v61);
            while (__stlxr(v62 - 1, v61));
            if (!v62)
            {
              ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
              std::__shared_weak_count::__release_weak(v60);
            }
          }
          goto LABEL_69;
        }
      }
      else
      {
LABEL_29:
        if (v31)
          goto LABEL_30;
      }
      v59 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v101) = 138543362;
        *(_QWORD *)((char *)&v101 + 4) = v83;
        _os_log_impl(&dword_1AC149000, v59, OS_LOG_TYPE_ERROR, "Could not import item artist with payload=%{public}@.", (uint8_t *)&v101, 0xCu);
      }

      v46 = 0;
      v52 = 1;
      goto LABEL_64;
    }
  }
  v54 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v83;
    _os_log_impl(&dword_1AC149000, v54, OS_LOG_TYPE_ERROR, "Could not import album artist with payload=%{public}@.", (uint8_t *)&buf, 0xCu);
  }

  v46 = 0;
  v52 = 1;
LABEL_69:
  v63 = v96;
  if (v96)
  {
    v64 = (unint64_t *)&v96->__shared_owners_;
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
  if (v52)
    v66 = 0;
  else
    v66 = v46;
  v8 = v98;
  if ((v66 & 1) == 0)
  {
    v69 = 0;
    if (!v98)
      goto LABEL_95;
    goto LABEL_91;
  }
  v84 = v97;
  v85 = v98;
  v53 = v98 == 0;
  if (v98)
    goto LABEL_79;
LABEL_81:
  v69 = ML3ImportSession::addTrack((uint64_t)a4, &v84, v82);
  if (!v53)
  {
    v70 = (unint64_t *)&v8->__shared_owners_;
    do
      v71 = __ldaxr(v70);
    while (__stlxr(v71 - 1, v70));
    if (!v71)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v72 = *(_QWORD *)(v97 + 8);
  -[NSDictionary objectForKey:](v83, "objectForKey:", CFSTR("location"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectForKey:", CFSTR("location"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cachedPIDToLocationPropertyMap = self->_cachedPIDToLocationPropertyMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v72);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](cachedPIDToLocationPropertyMap, "setObject:forKey:", v74, v76);

  }
  -[ML3ImportOperation import](self, "import");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "library");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "updateUbiquitousDatabaseByRemovingUbiquitousMetadataFromTrackWithPersistentID:", v72);

  v8 = v98;
  if (v98)
  {
LABEL_91:
    v79 = (unint64_t *)&v8->__shared_owners_;
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
LABEL_95:

  return v69;
}

- (BOOL)_processUpdateTrackOperation:(id)a3 withImportSession:(void *)a4
{
  NSDictionary *v5;
  ML3ITunesSyncTrackImportItem *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  char v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  ML3ITunesSyncAlbumImportItem *v41;
  void *v42;
  ML3MusicLibrary *v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  int v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  int v56;
  BOOL v57;
  NSObject *v58;
  NSObject *v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  NSObject *v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  BOOL v70;
  unint64_t *v71;
  unint64_t v72;
  int updated;
  int v74;
  unint64_t *v75;
  unint64_t v76;
  void *v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  uint64_t v83;
  int v84;
  uint64_t v85;
  std::__shared_weak_count *v86;
  _QWORD v87[2];
  ML3ITunesSyncAlbumImportItem *v88;
  std::__shared_weak_count *v89;
  _QWORD v90[2];
  uint64_t v91;
  std::__shared_weak_count *v92;
  _QWORD v93[2];
  uint64_t v94;
  std::__shared_weak_count *v95;
  uint8_t buf[8];
  std::__shared_weak_count *v97;
  uint64_t v98;
  std::__shared_weak_count *v99;
  uint8_t v100[4];
  NSDictionary *v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v5 = (NSDictionary *)a3;
  v84 = _os_feature_enabled_impl();
  v6 = (ML3ITunesSyncTrackImportItem *)operator new();
  ML3ITunesSyncTrackImportItem::ML3ITunesSyncTrackImportItem(v6, v5);
  v98 = (uint64_t)v6;
  v7 = (std::__shared_weak_count *)operator new();
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C00;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  v99 = v7;
  if (self->_sagaIsEnabled)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring artist and album updates as cloud library is enabled.", buf, 2u);
    }

    if (self->_sagaIsEnabled)
    {
      if ((*(unsigned int (**)(ML3ITunesSyncTrackImportItem *, uint64_t))(*(_QWORD *)v6 + 56))(v6, 16777217))
      {
        v10 = (*(uint64_t (**)(ML3ITunesSyncTrackImportItem *, uint64_t))(*(_QWORD *)v6 + 32))(v6, 16777217);
        if ((MLMediaTypeByStandardizingMediaType(v10) & 0x408) != 0)
          goto LABEL_99;
      }
    }
  }
  if (-[NSDictionary count](v5, "count", a4) == 2)
  {
    -[NSDictionary objectForKey:](v5, "objectForKey:", CFSTR("pid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring empty track update.", buf, 2u);
      }
      goto LABEL_98;
    }
  }
  if ((v84 & 1) == 0)
  {
    v57 = 0;
    v85 = (uint64_t)v6;
    v86 = v7;
LABEL_90:
    v71 = (unint64_t *)&v7->__shared_owners_;
    do
      v72 = __ldxr(v71);
    while (__stxr(v72 + 1, v71));
LABEL_92:
    updated = ML3ImportSession::updateTrack(v83, &v85, v84, 0);
    v74 = updated;
    if (v57)
      goto LABEL_96;
    v75 = (unint64_t *)&v7->__shared_owners_;
    do
      v76 = __ldaxr(v75);
    while (__stlxr(v76 - 1, v75));
    if (v76)
    {
LABEL_96:
      if (updated)
      {
LABEL_97:
        -[ML3ImportOperation import](self, "import");
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject library](v13, "library");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "updateUbiquitousDatabaseByRemovingUbiquitousMetadataFromTrackWithPersistentID:", *(_QWORD *)(v98 + 8));

LABEL_98:
LABEL_99:
        v70 = 1;
        goto LABEL_102;
      }
    }
    else
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      if (v74)
        goto LABEL_97;
    }
    v70 = 0;
    goto LABEL_102;
  }
  v14 = operator new();
  -[ML3ImportOperation import](self, "import");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "library");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ML3ITunesSyncArtistImportItem::ML3ITunesSyncArtistImportItem(v14, v5, 7, v16);
  *(_QWORD *)buf = v14;
  v17 = (std::__shared_weak_count *)operator new();
  v17->__shared_owners_ = 0;
  v18 = (unint64_t *)&v17->__shared_owners_;
  v17->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51D18;
  v17->__shared_weak_owners_ = 0;
  v17[1].__vftable = (std::__shared_weak_count_vtbl *)v14;
  v97 = v17;

  v94 = v14;
  v95 = v17;
  do
    v19 = __ldxr(v18);
  while (__stxr(v19 + 1, v18));
  v93[0] = v6;
  v93[1] = v7;
  do
    v20 = __ldxr(p_shared_owners);
  while (__stxr(v20 + 1, p_shared_owners));
  v21 = ML3ImportSession::updateAlbumArtist(v83, &v94, v93, 0);
  do
    v22 = __ldaxr(p_shared_owners);
  while (__stlxr(v22 - 1, p_shared_owners));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  v23 = v95;
  if (!v95)
    goto LABEL_24;
  v24 = (unint64_t *)&v95->__shared_owners_;
  do
    v25 = __ldaxr(v24);
  while (__stlxr(v25 - 1, v24));
  if (!v25)
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
    if ((v21 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_24:
    if ((v21 & 1) != 0)
    {
LABEL_25:
      v26 = operator new();
      -[ML3ImportOperation import](self, "import");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "library");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      ML3ITunesSyncArtistImportItem::ML3ITunesSyncArtistImportItem(v26, v5, 2, v28);
      *(_QWORD *)&v103 = v26;
      v29 = (std::__shared_weak_count *)operator new();
      v29->__shared_owners_ = 0;
      v30 = (unint64_t *)&v29->__shared_owners_;
      v29->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51D18;
      v29->__shared_weak_owners_ = 0;
      v29[1].__vftable = (std::__shared_weak_count_vtbl *)v26;
      *((_QWORD *)&v103 + 1) = v29;

      v91 = v26;
      v92 = v29;
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
      v32 = v99;
      v90[0] = v98;
      v90[1] = v99;
      if (v99)
      {
        v33 = (unint64_t *)&v99->__shared_owners_;
        do
          v34 = __ldxr(v33);
        while (__stxr(v34 + 1, v33));
      }
      v35 = ML3ImportSession::updateItemArtist(v83, &v91, v90, 0);
      if (v32)
      {
        v36 = (unint64_t *)&v32->__shared_owners_;
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
      v38 = v92;
      if (!v92)
        goto LABEL_39;
      v39 = (unint64_t *)&v92->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
        if ((v35 & 1) != 0)
        {
LABEL_40:
          v41 = (ML3ITunesSyncAlbumImportItem *)operator new();
          -[ML3ImportOperation import](self, "import");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "library");
          v43 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
          ML3ITunesSyncAlbumImportItem::ML3ITunesSyncAlbumImportItem(v41, v5, v43);
          *(_QWORD *)&v102 = v41;
          v44 = (std::__shared_weak_count *)operator new();
          v44->__shared_owners_ = 0;
          v45 = (unint64_t *)&v44->__shared_owners_;
          v44->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51BC8;
          v44->__shared_weak_owners_ = 0;
          v44[1].__vftable = (std::__shared_weak_count_vtbl *)v41;
          *((_QWORD *)&v102 + 1) = v44;

          v88 = v41;
          v89 = v44;
          do
            v46 = __ldxr(v45);
          while (__stxr(v46 + 1, v45));
          v47 = v99;
          v87[0] = v98;
          v87[1] = v99;
          if (v99)
          {
            v48 = (unint64_t *)&v99->__shared_owners_;
            do
              v49 = __ldxr(v48);
            while (__stxr(v49 + 1, v48));
          }
          v50 = ML3ImportSession::updateAlbum(v83, &v88, v87, *(_QWORD *)(*(_QWORD *)buf + 8), 0);
          if (v47)
          {
            v51 = (unint64_t *)&v47->__shared_owners_;
            do
              v52 = __ldaxr(v51);
            while (__stlxr(v52 - 1, v51));
            if (!v52)
            {
              ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
              std::__shared_weak_count::__release_weak(v47);
            }
          }
          v53 = v89;
          if (v89)
          {
            v54 = (unint64_t *)&v89->__shared_owners_;
            do
              v55 = __ldaxr(v54);
            while (__stlxr(v55 - 1, v54));
            if (!v55)
            {
              ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
              std::__shared_weak_count::__release_weak(v53);
            }
          }
          if ((v50 & 1) != 0)
          {
            v56 = 0;
          }
          else
          {
            v59 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v100 = 138543362;
              v101 = v5;
              _os_log_impl(&dword_1AC149000, v59, OS_LOG_TYPE_ERROR, "Could not update album with payload=%{public}@.", v100, 0xCu);
            }

            v56 = 1;
          }
          v60 = (std::__shared_weak_count *)*((_QWORD *)&v102 + 1);
          if (*((_QWORD *)&v102 + 1))
          {
            v61 = (unint64_t *)(*((_QWORD *)&v102 + 1) + 8);
            do
              v62 = __ldaxr(v61);
            while (__stlxr(v62 - 1, v61));
            if (!v62)
            {
              ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
              std::__shared_weak_count::__release_weak(v60);
            }
          }
LABEL_74:
          v64 = (std::__shared_weak_count *)*((_QWORD *)&v103 + 1);
          if (*((_QWORD *)&v103 + 1))
          {
            v65 = (unint64_t *)(*((_QWORD *)&v103 + 1) + 8);
            do
              v66 = __ldaxr(v65);
            while (__stlxr(v66 - 1, v65));
            if (!v66)
            {
              ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
              std::__shared_weak_count::__release_weak(v64);
            }
          }
          goto LABEL_79;
        }
      }
      else
      {
LABEL_39:
        if ((v35 & 1) != 0)
          goto LABEL_40;
      }
      v63 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v102) = 138543362;
        *(_QWORD *)((char *)&v102 + 4) = v5;
        _os_log_impl(&dword_1AC149000, v63, OS_LOG_TYPE_ERROR, "Could not update item artist with payload=%{public}@.", (uint8_t *)&v102, 0xCu);
      }

      v50 = 0;
      v56 = 1;
      goto LABEL_74;
    }
  }
  v58 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v103) = 138543362;
    *(_QWORD *)((char *)&v103 + 4) = v5;
    _os_log_impl(&dword_1AC149000, v58, OS_LOG_TYPE_ERROR, "Could not update album artist with payload=%{public}@.", (uint8_t *)&v103, 0xCu);
  }

  v50 = 0;
  v56 = 1;
LABEL_79:
  v67 = v97;
  if (v97)
  {
    v68 = (unint64_t *)&v97->__shared_owners_;
    do
      v69 = __ldaxr(v68);
    while (__stlxr(v69 - 1, v68));
    if (!v69)
    {
      ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
      std::__shared_weak_count::__release_weak(v67);
    }
  }
  if (v56)
    v70 = v50;
  else
    v70 = 0;
  if (!v56 && ((v50 ^ 1) & 1) == 0)
  {
    v7 = v99;
    v85 = v98;
    v86 = v99;
    v57 = v99 == 0;
    if (!v99)
      goto LABEL_92;
    goto LABEL_90;
  }
LABEL_102:
  v78 = v99;
  if (v99)
  {
    v79 = (unint64_t *)&v99->__shared_owners_;
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }

  return v70;
}

- (BOOL)_processDeleteTrackOperation:(id)a3 withImportSession:(void *)a4
{
  NSDictionary *v5;
  void *v6;
  ML3ITunesSyncTrackImportItem *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  char v11;
  BOOL v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  ML3ITunesSyncTrackImportItem *v21;
  std::__shared_weak_count *v22;
  uint8_t v23[4];
  uint64_t v24;
  __int128 buf;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (NSDictionary *)a3;
  -[NSDictionary objectForKey:](v5, "objectForKey:", CFSTR("pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (ML3ITunesSyncTrackImportItem *)operator new();
    ML3ITunesSyncTrackImportItem::ML3ITunesSyncTrackImportItem(v7, v5);
    *(_QWORD *)&buf = v7;
    v8 = (std::__shared_weak_count *)operator new();
    v8->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    v8->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C00;
    v8->__shared_weak_owners_ = 0;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
    *((_QWORD *)&buf + 1) = v8;
    v21 = v7;
    v22 = v8;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    v11 = ML3ImportSession::removeTrack((uint64_t)a4, (uint64_t *)&v21);
    v12 = v11;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (v13)
    {
      if ((v11 & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
      if (v12)
      {
LABEL_16:
        v17 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v18 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v19 = __ldaxr(v18);
          while (__stlxr(v19 - 1, v18));
          if (!v19)
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
        }
        goto LABEL_21;
      }
    }
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v6, "longLongValue", v21, v22);
      *(_DWORD *)v23 = 134217984;
      v24 = v16;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "failed to delete track. pid=%lld", v23, 0xCu);
    }

    goto LABEL_16;
  }
  v14 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Got delete_track for with invalid pid: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v12 = 0;
LABEL_21:

  return v12;
}

- (BOOL)_processUpdateDBInfoOperation:(id)a3 withImportSession:(void *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ML3ITunesSyncImportOperation _dbInfoValuesForStep:](self, "_dbInfoValuesForStep:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("ROWID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");
    -[ML3ImportOperation import](self, "import");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "databaseInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "existsInLibrary") || objc_msgSend(v12, "persistentID") != v9)
    {
      -[ML3ImportOperation import](self, "import");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "library");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3Entity queryWithLibrary:predicate:](ML3DatabaseMetadata, "queryWithLibrary:predicate:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deleteAllEntitiesFromLibrary");

      -[ML3ImportOperation import](self, "import");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "library");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[ML3Entity newWithDictionary:inLibrary:cachedNameOrders:](ML3DatabaseMetadata, "newWithDictionary:inLibrary:cachedNameOrders:", v7, v17, 0);

      v12 = v18;
    }
    v19 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = (uint64_t)v7;
      _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "DBInfo values: %{public}@", buf, 0xCu);
    }

    v20 = v12 != 0;
    if (v12)
    {
      v21 = objc_msgSend(v7, "count");
      v22 = v21;
      if (v21)
      {
        v23 = 8 * v21;
        MEMORY[0x1E0C80A78](v21);
        v24 = &buf[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v24, 8 * v22);
        MEMORY[0x1E0C80A78](v25);
        bzero(v24, 8 * v22);
        objc_msgSend(v7, "getObjects:andKeys:count:", v24, v24, v22);
        objc_msgSend(v12, "setValues:forProperties:count:", v24, v24, v22);
      }
      v26 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      *(_DWORD *)buf = 138543362;
      v32 = (uint64_t)v12;
      v27 = "Updated dbInfo: %{public}@";
      v28 = v26;
      v29 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      v26 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
LABEL_16:

        goto LABEL_17;
      }
      *(_DWORD *)buf = 134217984;
      v32 = v9;
      v27 = "Could not update dbInfo: %lld";
      v28 = v26;
      v29 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1AC149000, v28, v29, v27, buf, 0xCu);
    goto LABEL_16;
  }
  v20 = 0;
LABEL_17:

  return v20;
}

- (BOOL)_processInsertPlaylistOperation:(id)a3 withImportSession:(void *)a4
{
  NSDictionary *v6;
  NSDictionary *v7;
  _BOOL4 v8;
  int64_t devicePrimaryContainer;
  void *v10;
  ML3ITunesSyncContainerImportItem *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unsigned int v14;
  uint64_t v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  int v32;
  unint64_t v33;
  NSMutableSet *importedPlaylists;
  NSObject *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  NSDictionary *v46;
  uint8_t buf[8];
  uint64_t v48[2];
  _QWORD v49[5];
  ML3ITunesSyncContainerImportItem *v50;
  std::__shared_weak_count *v51;
  _QWORD v52[2];
  _QWORD v53[4];

  v53[2] = *MEMORY[0x1E0C80C00];
  v6 = (NSDictionary *)a3;
  v7 = v6;
  if (self->_sagaIsEnabled)
  {
    LOBYTE(v8) = 1;
    goto LABEL_30;
  }
  devicePrimaryContainer = self->_devicePrimaryContainer;
  v46 = v6;
  if (devicePrimaryContainer)
  {
    -[NSDictionary objectForKey:](v6, "objectForKey:", CFSTR("pid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(devicePrimaryContainer) = devicePrimaryContainer == objc_msgSend(v10, "longLongValue");

    v7 = v46;
  }
  v11 = (ML3ITunesSyncContainerImportItem *)operator new();
  ML3ITunesSyncContainerImportItem::ML3ITunesSyncContainerImportItem(v11, v7, devicePrimaryContainer);
  v44 = a4;
  v50 = v11;
  v12 = (std::__shared_weak_count *)operator new();
  v12->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51F10;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)v11;
  v51 = v12;
  v14 = (*(uint64_t (**)(ML3ITunesSyncContainerImportItem *, uint64_t))(*(_QWORD *)v11 + 32))(v11, 184549379);
  v15 = (*(uint64_t (**)(ML3ITunesSyncContainerImportItem *, uint64_t))(*(_QWORD *)v11 + 32))(v11, 184549415);
  v45 = (*(uint64_t (**)(ML3ITunesSyncContainerImportItem *, uint64_t))(*(_QWORD *)v11 + 56))(v11, 184549407);
  if (v14 == 20 && v15 != 0)
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("(container.distinguished_kind = 20 AND container.is_container_type_active_target)"), MEMORY[0x1E0C9AAB0]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("is_src_remote"), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3ImportOperation import](self, "import");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "library");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v43;
    v53[1] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", v18, v20);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "setIgnoreRestrictionsPredicates:", 1);
    objc_msgSend(v41, "deleteAllEntitiesFromLibrary");
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("is_container_type_active_target"), 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3ImportOperation import](self, "import");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "library");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v43;
    v52[1] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity unrestrictedQueryWithLibrary:predicate:orderingTerms:](ML3Container, "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v22, v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __82__ML3ITunesSyncImportOperation__processInsertPlaylistOperation_withImportSession___block_invoke;
    v49[3] = &unk_1E5B65960;
    v49[4] = self;
    objc_msgSend(v25, "enumeratePersistentIDsUsingBlock:", v49);

  }
  v26 = v45;
  if (!v14)
    v26 = 0;
  if (v26 == 1)
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("distinguished_kind"), v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3ImportOperation import](self, "import");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "library");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", v29, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "deleteAllEntitiesFromLibrary");

  }
  v48[0] = (uint64_t)v11;
  v48[1] = (uint64_t)v12;
  do
    v31 = __ldxr(p_shared_owners);
  while (__stxr(v31 + 1, p_shared_owners));
  v32 = ML3ImportSession::addContainer((uint64_t)v44, v48);
  v8 = v32;
  do
    v33 = __ldaxr(p_shared_owners);
  while (__stlxr(v33 - 1, p_shared_owners));
  if (!v33)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if (v8)
      goto LABEL_20;
LABEL_22:
    v35 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v35, OS_LOG_TYPE_ERROR, "failed to add playlist", buf, 2u);
    }
    goto LABEL_24;
  }
  if (!v32)
    goto LABEL_22;
LABEL_20:
  importedPlaylists = self->_importedPlaylists;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)v50 + 1));
  v35 = objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](importedPlaylists, "addObject:", v35);
LABEL_24:

  v36 = v51;
  if (v51)
  {
    v37 = (unint64_t *)&v51->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  v7 = v46;
LABEL_30:

  return v8;
}

- (BOOL)_processUpdatePlaylistOperation:(id)a3 withImportSession:(void *)a4
{
  NSDictionary *v6;
  NSDictionary *v7;
  _BOOL4 v8;
  int64_t devicePrimaryContainer;
  void *v11;
  ML3ITunesSyncContainerImportItem *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  int v16;
  unint64_t v17;
  NSMutableSet *importedPlaylists;
  NSObject *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint8_t v23[16];
  uint64_t v24[2];
  ML3ITunesSyncContainerImportItem *v25;
  std::__shared_weak_count *v26;

  v6 = (NSDictionary *)a3;
  v7 = v6;
  if (self->_sagaIsEnabled)
  {
    LOBYTE(v8) = 1;
    goto LABEL_3;
  }
  devicePrimaryContainer = self->_devicePrimaryContainer;
  if (devicePrimaryContainer)
  {
    -[NSDictionary objectForKey:](v6, "objectForKey:", CFSTR("pid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(devicePrimaryContainer) = devicePrimaryContainer == objc_msgSend(v11, "longLongValue");

  }
  v12 = (ML3ITunesSyncContainerImportItem *)operator new();
  ML3ITunesSyncContainerImportItem::ML3ITunesSyncContainerImportItem(v12, v7, devicePrimaryContainer);
  v25 = v12;
  v13 = (std::__shared_weak_count *)operator new();
  v13->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51F10;
  v13->__shared_weak_owners_ = 0;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)v12;
  v26 = v13;
  v24[0] = (uint64_t)v12;
  v24[1] = (uint64_t)v13;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  v16 = ML3ImportSession::addContainer((uint64_t)a4, v24);
  v8 = v16;
  do
    v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if (v8)
      goto LABEL_12;
LABEL_14:
    v19 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_ERROR, "failed to update playlist", v23, 2u);
    }
    goto LABEL_16;
  }
  if (!v16)
    goto LABEL_14;
LABEL_12:
  importedPlaylists = self->_importedPlaylists;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)v25 + 1));
  v19 = objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](importedPlaylists, "addObject:", v19);
LABEL_16:

  v20 = v26;
  if (v26)
  {
    v21 = (unint64_t *)&v26->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
LABEL_3:

  return v8;
}

- (BOOL)_processDeletePlaylistOperation:(id)a3 withImportSession:(void *)a4
{
  NSDictionary *v6;
  _BOOL4 v7;
  ML3ITunesSyncContainerImportItem *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  int v13;
  unint64_t v14;
  NSMutableSet *importedPlaylists;
  NSObject *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint8_t v20[16];
  uint64_t v21[2];
  ML3ITunesSyncContainerImportItem *v22;
  std::__shared_weak_count *v23;

  v6 = (NSDictionary *)a3;
  if (self->_sagaIsEnabled)
  {
    LOBYTE(v7) = 1;
    goto LABEL_3;
  }
  v9 = (ML3ITunesSyncContainerImportItem *)operator new();
  ML3ITunesSyncContainerImportItem::ML3ITunesSyncContainerImportItem(v9, v6, 0);
  v22 = v9;
  v10 = (std::__shared_weak_count *)operator new();
  v10->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51F10;
  v10->__shared_weak_owners_ = 0;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
  v23 = v10;
  v21[0] = (uint64_t)v9;
  v21[1] = (uint64_t)v10;
  do
    v12 = __ldxr(p_shared_owners);
  while (__stxr(v12 + 1, p_shared_owners));
  v13 = ML3ImportSession::removeContainer((uint64_t)a4, v21);
  v7 = v13;
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    if (v7)
      goto LABEL_10;
LABEL_12:
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "failed to remove playlist", v20, 2u);
    }
    goto LABEL_14;
  }
  if (!v13)
    goto LABEL_12;
LABEL_10:
  importedPlaylists = self->_importedPlaylists;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)v22 + 1));
  v16 = objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](importedPlaylists, "removeObject:", v16);
LABEL_14:

  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
LABEL_3:

  return v7;
}

- (void)_recoverExistingAsset:(id)a3 forTrackId:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  int64_t v22;
  __int16 v23;
  NSObject *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:](ML3MusicLibrary, "mediaFolderPathByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "fileExistsAtPath:", v8) & 1) == 0)
  {
    -[ML3ImportOperation import](self, "import");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "library");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity anyInLibrary:predicate:options:](ML3Track, "anyInLibrary:predicate:options:", v10, v11, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "absoluteFilePath");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v7, "fileExistsAtPath:", v13);
      v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v22 = a4;
          v23 = 2114;
          v24 = v13;
          v25 = 2114;
          v26 = v8;
          _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "Asset path differs for pid %lld. ours=%{public}@, theirs=%{public}@", buf, 0x20u);
        }
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v22 = a4;
          v23 = 2114;
          v24 = v6;
          _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "No longer have asset for pid %lld. filePath=%{public}@", buf, 0x16u);
        }

        -[ML3ImportOperation import](self, "import");
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject library](v16, "library");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3Track clearLocationFromLibrary:persistentIDs:disableKeepLocal:](ML3Track, "clearLocationFromLibrary:persistentIDs:disableKeepLocal:", v17, v19, 0);

      }
    }
    else
    {
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v22 = a4;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "recoverExistingAsset called with unknown track pid %lld", buf, 0xCu);
      }
    }

  }
}

- (id)_dbInfoValuesForStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[3];
  __int128 buf;
  void (*v22)(uint64_t, uint64_t, void *);
  void *v23;
  os_log_t v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v5, CFSTR("ROWID"));
    objc_msgSend(v4, "objectForKey:", CFSTR("db_info"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = CFSTR("audio_language");
    v19[1] = CFSTR("subtitle_language");
    v20[0] = CFSTR("audio_language");
    v20[1] = CFSTR("subtitle_language");
    v19[2] = CFSTR("genius_cuid");
    v20[2] = CFSTR("genius_cuid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v6;
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v22 = ___ZL23TranslateDictionaryKeysP12NSDictionaryS0_P19NSMutableDictionary_block_invoke;
    v23 = &unk_1E5B654D8;
    v24 = v9;
    v25 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &buf);

    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("primary_container_pid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("primary_container_pid"));
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("genius_config"));
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ML3ITunesSyncImportOperation _processGeniusConfigPlist:](self, "_processGeniusConfigPlist:", v12);
    }
    else
    {
      v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Unexpected genius config format: %{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("apple_ids"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __53__ML3ITunesSyncImportOperation__dbInfoValuesForStep___block_invoke;
      v18[3] = &unk_1E5B65448;
      v18[4] = self;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v18);
    }
    else
    {
      v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v15;
        _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "Unexpected AppleID config format: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "Got update_db_info with invalid pid: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)_processGeniusConfigPlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  os_log_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  id v31;
  _QWORD v32[4];
  os_log_t v33;
  id v34;
  id v35;
  id v36;
  __int128 *p_buf;
  uint8_t v38[4];
  id v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("data"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    objc_msgSend(v4, "objectForKey:", CFSTR("default_num_results"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("min_num_results"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v4, "objectForKey:", CFSTR("version"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v41 = 0x2020000000;
    v42 = 0;
    -[ML3ImportOperation import](self, "import");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "library");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __58__ML3ITunesSyncImportOperation__processGeniusConfigPlist___block_invoke;
    v32[3] = &unk_1E5B65470;
    p_buf = &buf;
    v8 = v9;
    v33 = v8;
    v31 = v13;
    v34 = v31;
    v24 = v17;
    v35 = v24;
    v25 = v21;
    v36 = v25;
    objc_msgSend(v23, "databaseConnectionAllowingWrites:withBlock:", 1, v32);

    LODWORD(v21) = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
    v26 = os_log_create("com.apple.amp.medialibrary", "Default");
    v27 = v26;
    if ((_DWORD)v21)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v38 = 138543362;
        v39 = v4;
        v28 = "Updated Genius configuration: %{public}@";
        v29 = v27;
        v30 = OS_LOG_TYPE_DEFAULT;
LABEL_21:
        _os_log_impl(&dword_1AC149000, v29, v30, v28, v38, 0xCu);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v38 = 138543362;
      v39 = v4;
      v28 = "Failed to update Genius configuration: %{public}@";
      v29 = v27;
      v30 = OS_LOG_TYPE_ERROR;
      goto LABEL_21;
    }

    _Block_object_dispose(&buf, 8);
    goto LABEL_23;
  }
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "No valid genius_config found in: %{public}@", (uint8_t *)&buf, 0xCu);
  }
LABEL_23:

}

- (void)_archiveSyncPlistFiles
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  int v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  unint64_t j;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _BYTE v54[128];
  _QWORD v55[2];
  _QWORD v56[5];

  v56[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E98];
  MSVMediaLoggingDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v3;
  v56[1] = CFSTR("SyncData");
  v56[2] = CFSTR("iTunes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 297;
  if (self->_resetSync)
  {
    objc_msgSend(v42, "removeItemAtURL:error:", v41, 0);
  }
  else
  {
    v43 = (void *)objc_opt_new();
    v5 = *MEMORY[0x1E0C999D0];
    v6 = *MEMORY[0x1E0C998E8];
    v55[0] = *MEMORY[0x1E0C999D0];
    v55[1] = v6;
    v44 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v41, v7, 4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v48 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v13, "lastPathComponent", v38);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Reset"));

          if ((v15 & 1) == 0)
          {
            v46 = 0;
            v16 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v46, v5, 0);
            v17 = v46;
            v18 = v17;
            if (v16 && objc_msgSend(v17, "BOOLValue"))
            {
              v45 = 0;
              v19 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v45, v44, 0);
              v20 = v45;
              if (v19)
                objc_msgSend(v43, "setObject:forKey:", v13, v20);

            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v10);
    }

    if ((unint64_t)objc_msgSend(v43, "count") >= 4)
    {
      objc_msgSend(v43, "allKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sortedArrayUsingComparator:", &__block_literal_global_19446);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      for (j = 3; objc_msgSend(v22, "count", v38) > j; ++j)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", j);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "removeItemAtURL:error:", v25, 0);

      }
    }

  }
  objc_msgSend(v42, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v41, 1, 0, 0, v38);
  if (*((_BYTE *)&self->super.super.super.isa + v39))
  {
    v26 = CFSTR("Reset");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "description");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v41, "path");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v30;
  v53[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fileURLWithPathComponents:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "path");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "copyItemAtPath:toPath:error:", CFSTR("/var/mobile/Media/iTunes_Control/Sync/Media/"), v34, 0);

  v35 = *MEMORY[0x1E0CB2A88];
  v51[0] = *MEMORY[0x1E0CB2A38];
  v51[1] = v35;
  v52[0] = v33;
  v52[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "path");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAttributes:ofItemAtPath:error:", v36, v37, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importedPlaylists, 0);
  objc_storeStrong((id *)&self->_cachedSyncIDsToPIDsMap, 0);
  objc_storeStrong((id *)&self->_cachedPIDToLocationPropertyMap, 0);
  objc_storeStrong((id *)&self->_cachedPIDToFilePathMap, 0);
}

uint64_t __54__ML3ITunesSyncImportOperation__archiveSyncPlistFiles__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __58__ML3ITunesSyncImportOperation__processGeniusConfigPlist___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO genius_config (id, data, default_num_results, min_num_results, version) VALUES (0,?,?,?,?)"), v4, 0);

}

void __53__ML3ITunesSyncImportOperation__dbInfoValuesForStep___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "import");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "library");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountCacheDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAppleID:forDSID:", v6, objc_msgSend(v5, "longLongValue"));

  }
  else
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (id)objc_opt_class();
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "Unexpected DSID/AppleID pair format: %{public}@/%{public}@", (uint8_t *)&v13, 0x16u);

    }
  }

}

void __82__ML3ITunesSyncImportOperation__processInsertPlaylistOperation_withImportSession___block_invoke(uint64_t a1, uint64_t a2)
{
  ML3Container *v4;
  void *v5;
  void *v6;
  ML3Container *v7;

  v4 = [ML3Container alloc];
  objc_msgSend(*(id *)(a1 + 32), "import");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ML3Entity initWithPersistentID:inLibrary:](v4, "initWithPersistentID:inLibrary:", a2, v6);

  -[ML3Entity setValue:forProperty:](v7, "setValue:forProperty:", &unk_1E5BAC3D8, CFSTR("is_container_type_active_target"));
}

void __77__ML3ITunesSyncImportOperation__performImportFromPlistFiles_withTransaction___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "currentRevision");
    objc_msgSend(*(id *)(a1 + 40), "import");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncAnchor");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forDatabaseProperty:", v6, CFSTR("MLSyncClientLastSyncedRevision"));

    objc_msgSend(*(id *)(a1 + 32), "setValue:forDatabaseProperty:", v7, CFSTR("MLSyncClientSyncAnchor"));
    objc_msgSend(*(id *)(a1 + 32), "setSyncGenerationID:", ML3CreateIntegerUUID());

  }
}

uint64_t __36__ML3ITunesSyncImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "[ML3ITunesSyncImportOperation] failed to start transaction. error=%{public}@", (uint8_t *)&v10, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performImportWithTransaction:", v5);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelled") ^ 1;
  else
    v8 = 0;

  return v8;
}

@end
