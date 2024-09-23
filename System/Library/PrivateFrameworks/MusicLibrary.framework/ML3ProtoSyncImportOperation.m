@implementation ML3ProtoSyncImportOperation

- (unint64_t)importSource
{
  return 7;
}

- (ML3ProtoSyncImportOperation)initWithDatabaseImport:(id)a3
{
  id v4;
  ML3ProtoSyncImportOperation *v5;
  ML3ProtoSyncImportOperation *v6;
  OS_dispatch_source *readSource;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3ProtoSyncImportOperation;
  v5 = -[ML3ImportOperation initWithDatabaseImport:](&v11, sel_initWithDatabaseImport_, v4);
  v6 = v5;
  if (v5)
  {
    readSource = v5->_readSource;
    v5->_readSource = 0;

    v6->_importFinished = 0;
    v6->_isReadSourceCancelled = 0;
    v6->_readSourceState = 0;
    v6->_pairedDeviceCanProcessStandAloneCollections = objc_msgSend(v4, "pairedDeviceCanProcessStandaloneCollections");
    v8 = dispatch_queue_create("com.apple.amp.MediaLibrary.ML3ProtoSyncImportOperation.accessQueue", 0);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v8;

  }
  return v6;
}

- (void)main
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  NSObject *v8;
  int v9;
  int v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint8_t buf[4];
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[ML3ImportOperation import](self, "import");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentRevision");

  v25 = v5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v21 = v23[3];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  if ((-[ML3ProtoSyncImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __35__ML3ProtoSyncImportOperation_main__block_invoke;
    v17[3] = &unk_1E5B62278;
    v17[4] = self;
    v17[5] = &v22;
    v17[6] = &v26;
    v17[7] = &v18;
    -[ML3ImportOperation _writerTransactionWithBlock:](self, "_writerTransactionWithBlock:", v17);
  }
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[ML3ProtoSyncImportOperation isCancelled](self, "isCancelled");
    v10 = *((unsigned __int8 *)v27 + 24);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 67109632;
    v33 = v9;
    v34 = 1024;
    v35 = v10;
    v36 = 2048;
    v37 = v11 - v7;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "[ML3ProtoSyncImportOperation] import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  v30[0] = CFSTR("revisionBeforeImport");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = CFSTR("revisionAfterImport");
  v31[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19[3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 200, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ImportOperation setReturnData:](self, "setReturnData:", v15);

  if (*((_BYTE *)v27 + 24))
    v16 = -[ML3ProtoSyncImportOperation isCancelled](self, "isCancelled") ^ 1;
  else
    v16 = 0;
  -[ML3ImportOperation setSuccess:](self, "setSuccess:", v16);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

- (void)cancel
{
  NSObject *v3;
  _BOOL4 isReadSourceCancelled;
  NSObject *accessQueue;
  _QWORD block[5];
  objc_super v7;
  uint8_t buf[4];
  ML3ProtoSyncImportOperation *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    isReadSourceCancelled = self->_isReadSourceCancelled;
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 1024;
    v11 = isReadSourceCancelled;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "[ML3ProtoSyncImportOperation] cancelling import operation %{public}@ _isReadSourceCancelled %d", buf, 0x12u);
  }

  v7.receiver = self;
  v7.super_class = (Class)ML3ProtoSyncImportOperation;
  -[ML3ProtoSyncImportOperation cancel](&v7, sel_cancel);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ML3ProtoSyncImportOperation_cancel__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (BOOL)_performImportWithTransaction:(id)a3
{
  ML3DatabaseConnection *v4;
  ML3DatabaseConnection *connection;
  void *v6;
  NSMutableSet *v7;
  NSMutableSet *syncIdsToUnlink;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  ML3MusicLibrary *v15;
  ML3DatabaseConnection *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  _BOOL4 isServerImport;
  dispatch_semaphore_t v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  dispatch_time_t v27;
  intptr_t v28;
  _BOOL4 v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void *v34;
  int v35;
  ssize_t v36;
  NSObject *accessQueue;
  dispatch_time_t v38;
  intptr_t v39;
  NSObject *v40;
  int v41;
  ssize_t v42;
  NSObject *v43;
  dispatch_time_t v44;
  intptr_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  MSPMediaSyncPackage *v52;
  _BOOL4 v53;
  char v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  double v58;
  NSObject *v59;
  void *v60;
  char v61;
  int v62;
  NSObject *v63;
  NSObject *v65;
  NSObject *v66;
  id v67;
  char *__dst;
  NSObject *dsema;
  dispatch_semaphore_t dsemaa;
  void *v71;
  _QWORD v72[5];
  _QWORD v73[6];
  char v74;
  _QWORD block[6];
  char v76;
  size_t size;
  uint64_t v78;
  _QWORD v79[4];
  dispatch_semaphore_t v80;
  _QWORD handler[5];
  NSObject *v82;
  uint8_t v83[10];
  uint8_t v84[4];
  ML3ProtoSyncImportOperation *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  __int16 v92;
  _BOOL4 v93;
  uint8_t buf[4];
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  objc_msgSend(v67, "connection");
  v4 = (ML3DatabaseConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  self->_connection = v4;

  -[ML3ImportOperation import](self, "import");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isServerImport = objc_msgSend(v6, "isServerImport");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  syncIdsToUnlink = self->_syncIdsToUnlink;
  self->_syncIdsToUnlink = v7;

  if (!self->_isServerImport)
  {
    -[ML3ImportOperation import](self, "import");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "syncLibraryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v95 = v10;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "setting sync library id to %{public}@", buf, 0xCu);
    }

    -[ML3ImportOperation import](self, "import");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "library");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSyncLibraryID:", v10);

  }
  MSVDeviceOSIsInternalInstall();
  -[ML3ImportOperation import](self, "import");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "library");
  v15 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "connection");
  v16 = (ML3DatabaseConnection *)objc_claimAutoreleasedReturnValue();
  ML3ImportSession::ML3ImportSession((ML3ImportSession *)buf, v15, v16, 1, 1);

  -[ML3ImportOperation import](self, "import");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fileHandle");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  dsema = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(dsema, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v71, "fileDescriptor");
    -[ML3ImportOperation import](self, "import");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "pairedDeviceCanProcessStandaloneCollections");
    isServerImport = self->_isServerImport;
    *(_DWORD *)v84 = 138544386;
    v85 = self;
    v86 = 2114;
    v87 = v71;
    v88 = 1024;
    v89 = v18;
    v90 = 1024;
    v91 = v20;
    v92 = 1024;
    v93 = isServerImport;
    _os_log_impl(&dword_1AC149000, dsema, OS_LOG_TYPE_DEFAULT, "%{public}@ starting import with fileHandle %{public}@, fd=%d, pairedDeviceCanProcessStandAloneCollections=%{BOOL}u, isServerImport=%{BOOL}u", v84, 0x28u);

  }
  v22 = dispatch_semaphore_create(0);
  v23 = objc_msgSend(v71, "fileDescriptor");
  v24 = dispatch_source_create(MEMORY[0x1E0C80DB8], v23, 0, (dispatch_queue_t)self->_accessQueue);
  v25 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke;
  handler[3] = &unk_1E5B65EB8;
  handler[4] = self;
  v26 = v22;
  v82 = v26;
  dispatch_source_set_event_handler(v24, handler);
  v79[0] = v25;
  v79[1] = 3221225472;
  v79[2] = __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_12;
  v79[3] = &unk_1E5B65D80;
  dsemaa = v26;
  v80 = dsemaa;
  dispatch_source_set_cancel_handler(v24, v79);
  v66 = v24;
  objc_storeStrong((id *)&self->_readSource, v24);
  dispatch_resume((dispatch_object_t)self->_readSource);
  self->_readSourceState = 1;
  size = 0;
  v78 = 0;
  LODWORD(v26) = fcntl(objc_msgSend(v71, "fileDescriptor"), 3);
  fcntl(objc_msgSend(v71, "fileDescriptor"), 4, v26 | 4);
  v27 = dispatch_time(0, 20000000000);
  v28 = dispatch_semaphore_wait(dsemaa, v27);
  LOBYTE(v29) = v28 == 0;
  if (v28)
  {
    v30 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_1AC149000, v30, OS_LOG_TYPE_ERROR, "timed out waiting for import data", v84, 2u);
    }

  }
  __dst = 0;
  v31 = 0;
  LODWORD(v32) = 0;
  v33 = 1;
  while (1)
  {
    if (!v29)
    {
      v29 = 0;
      goto LABEL_72;
    }
    if ((-[ML3ProtoSyncImportOperation isCancelled](self, "isCancelled") & 1) != 0)
      break;
    v34 = (void *)MEMORY[0x1AF43CC0C]();
    if ((-[ML3ProtoSyncImportOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v29 = 1;
      v35 = 3;
    }
    else
    {
      if ((v33 & 1) != 0)
      {
        v36 = read(objc_msgSend(v71, "fileDescriptor"), &v83[v32], (10 - v32));
        if ((v36 & 0x8000000000000000) == 0 || *__error() != 35)
        {
          if (v36 > 0 || (_DWORD)v32)
          {
            v32 = (v32 + v36);
            if ((_DWORD)v32 == 10 || !v36)
            {
              if ((PBReaderReadVarIntBuf() & 1) == 0)
              {
                v55 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v84 = 138543362;
                  v85 = self;
                  _os_log_impl(&dword_1AC149000, v55, OS_LOG_TYPE_ERROR, "%{public}@ failed to read varint length", v84, 0xCu);
                }

                LODWORD(v32) = 0;
                goto LABEL_43;
              }
              __dst = (char *)malloc_type_malloc(size, 0xCD34466AuLL);
              v49 = v32 - v78;
              if (v32 - v78 < 1)
              {
                LODWORD(v32) = 0;
                goto LABEL_49;
              }
              memcpy(__dst, &v83[v78], v32 - v78);
              LODWORD(v32) = 0;
              v33 = 0;
              v31 += v49;
            }
            else
            {
              v33 = 1;
            }
LABEL_53:
            v29 = 1;
            goto LABEL_54;
          }
          v47 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v84 = 138543362;
            v85 = self;
            _os_log_impl(&dword_1AC149000, v47, OS_LOG_TYPE_ERROR, "%{public}@ failed to read object length from import data stream", v84, 0xCu);
          }

          LODWORD(v32) = 0;
          v29 = 0;
          goto LABEL_37;
        }
        accessQueue = self->_accessQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_13;
        block[3] = &unk_1E5B622A0;
        block[4] = self;
        block[5] = v36;
        v76 = 1;
        dispatch_sync(accessQueue, block);
        v38 = dispatch_time(0, 20000000000);
        v39 = dispatch_semaphore_wait(dsemaa, v38);
        v29 = v39 == 0;
        if (v39)
        {
          v40 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v84 = 138543362;
            v85 = self;
            _os_log_impl(&dword_1AC149000, v40, OS_LOG_TYPE_ERROR, "%{public}@ timed out waiting for import data", v84, 0xCu);
          }

        }
        v33 = 1;
      }
      else
      {
        v41 = objc_msgSend(v71, "fileDescriptor");
        v42 = read(v41, &__dst[v31], size - v31);
        if ((v42 & 0x8000000000000000) == 0 || *__error() != 35)
        {
          if (v42 <= 0 && !v31)
          {
            v48 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v84 = 138543362;
              v85 = self;
              _os_log_impl(&dword_1AC149000, v48, OS_LOG_TYPE_ERROR, "%{public}@ failed to read object from import data stream", v84, 0xCu);
            }

            v31 = 0;
LABEL_43:
            v33 = 0;
            v29 = 0;
LABEL_54:
            v35 = 0;
            goto LABEL_55;
          }
          v31 += v42;
          if (v42 && v31 != size)
          {
LABEL_49:
            v33 = 0;
            goto LABEL_53;
          }
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", __dst, size, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v50);
          v52 = objc_alloc_init(MSPMediaSyncPackage);
          if (-[MSPMediaSyncPackage readFrom:](v52, "readFrom:", v51))
          {
            v53 = -[ML3ProtoSyncImportOperation _processSyncPackage:withImportSession:](self, "_processSyncPackage:withImportSession:", v52, buf);
            if (-[MSPMediaSyncPackage lastPackage](v52, "lastPackage"))
            {
              v54 = 0;
              v35 = 3;
LABEL_67:

              v29 = v53;
              if ((v54 & 1) == 0)
              {
                v33 = 0;
                goto LABEL_55;
              }
LABEL_37:
              v33 = 1;
              goto LABEL_54;
            }
          }
          else
          {
            v56 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v84 = 0;
              _os_log_impl(&dword_1AC149000, v56, OS_LOG_TYPE_ERROR, "failed to parse sync package data", v84, 2u);
            }

            v53 = 0;
          }
          free(__dst);
          v35 = 0;
          __dst = 0;
          v31 = 0;
          v54 = 1;
          goto LABEL_67;
        }
        v43 = self->_accessQueue;
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_14;
        v73[3] = &unk_1E5B622A0;
        v73[4] = self;
        v73[5] = v42;
        v74 = 0;
        dispatch_sync(v43, v73);
        v44 = dispatch_time(0, 20000000000);
        v45 = dispatch_semaphore_wait(dsemaa, v44);
        v29 = v45 == 0;
        if (v45)
        {
          v46 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v84 = 138543362;
            v85 = self;
            _os_log_impl(&dword_1AC149000, v46, OS_LOG_TYPE_ERROR, "%{public}@ timed out waiting for import data", v84, 0xCu);
          }

        }
        v33 = 0;
      }
      v35 = 2;
    }
LABEL_55:
    objc_autoreleasePoolPop(v34);
    if (v35 == 3)
      goto LABEL_72;
  }
  v29 = 1;
LABEL_72:
  v57 = self->_accessQueue;
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_18;
  v72[3] = &unk_1E5B65D80;
  v72[4] = self;
  dispatch_sync(v57, v72);
  if (__dst)
    free(__dst);
  if (!v29)
  {
LABEL_89:
    v62 = 0;
    goto LABEL_90;
  }
  if ((-[ML3ProtoSyncImportOperation isCancelled](self, "isCancelled") & 1) != 0 || !self->_syncSessionStarted)
  {
    v62 = 1;
    goto LABEL_90;
  }
  if (!ML3ImportSession::flush((ML3ImportSession *)buf, 1))
  {
    v63 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_1AC149000, v63, OS_LOG_TYPE_ERROR, "failed to commit the import session changes", v84, 2u);
    }

    goto LABEL_89;
  }
  ML3ImportSession::_finishImport((id *)buf);
  if (self->_isServerImport)
    goto LABEL_82;
  v59 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v84 = 0;
    _os_log_impl(&dword_1AC149000, v59, OS_LOG_TYPE_DEFAULT, "resetting play and skip counts", v84, 2u);
  }

  objc_msgSend(v67, "connection");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "executeUpdate:withParameters:error:", CFSTR("UPDATE item_stats SET play_count_recent=0,skip_count_recent=0,liked_state_changed=0 WHERE item_pid IN (SELECT item_pid FROM item_store WHERE sync_id!=0)"), 0, 0);

  if ((v61 & 1) != 0)
  {
LABEL_82:
    v62 = 1;
  }
  else
  {
    _ML3LogCategoryDefault();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v84 = 138543362;
      v85 = 0;
      _os_log_impl(&dword_1AC149000, v65, OS_LOG_TYPE_ERROR, "failed to clear recent counts. err=%{public}@", v84, 0xCu);
    }

    v62 = 0;
  }
  if (-[NSMutableSet count](self->_syncIdsToUnlink, "count"))
    -[ML3ProtoSyncImportOperation _unlinkUnavailableMediaItems](self, "_unlinkUnavailableMediaItems");
LABEL_90:
  LODWORD(v58) = 1.0;
  -[ML3ImportOperation setProgress:](self, "setProgress:", v58);
  if (v62)
    v62 = -[ML3ProtoSyncImportOperation isCancelled](self, "isCancelled") ^ 1;

  ML3ImportSession::~ML3ImportSession((ML3ImportSession *)buf);
  return v62;
}

- (BOOL)_processSyncPackage:(id)a3 withImportSession:(void *)a4
{
  id v6;
  int v7;
  double v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  unsigned int v12;

  v6 = a3;
  v7 = objc_msgSend(v6, "type");
  switch(v7)
  {
    case 2:
      objc_msgSend(v6, "header");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ML3ProtoSyncImportOperation _processSyncHeader:](self, "_processSyncHeader:", v9);
      goto LABEL_7;
    case 3:
      objc_msgSend(v6, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ML3ProtoSyncImportOperation _processSyncError:](self, "_processSyncError:", v9);
      goto LABEL_7;
    case 4:
      objc_msgSend(v6, "syncOperation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ML3ProtoSyncImportOperation _processSyncOperation:withImportSession:](self, "_processSyncOperation:withImportSession:", v9, a4);
LABEL_7:
      v11 = v10;

      goto LABEL_9;
  }
  v11 = 1;
LABEL_9:
  if (self->_totalSyncPackageCount)
  {
    v12 = self->_syncPackageNum + 1;
    self->_syncPackageNum = v12;
    *(float *)&v8 = (float)v12 / (float)self->_totalSyncPackageCount;
    -[ML3ImportOperation setProgress:](self, "setProgress:", v8);
  }

  return v11;
}

- (BOOL)_processSyncHeader:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_totalSyncPackageCount = objc_msgSend(v4, "totalPackages");
  v5 = objc_msgSend(v4, "syncType");
  self->_syncType = v5;
  if (v5 == 1 && !self->_isServerImport)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "preparing for a reset sync", (uint8_t *)&v13, 2u);
    }

    -[ML3ImportOperation import](self, "import");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "library");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity unrestrictedQueryWithLibrary:predicate:orderingTerms:](ML3Container, "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v9, "countOfEntities");
      v13 = 134217984;
      v14 = v11;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "Removing %ld playlists for a reset sync", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v9, "deleteAllEntitiesFromLibraryWithDeletionType:", 2);
  }

  return 1;
}

- (BOOL)_processSyncError:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_msgSend(v3, "errorCode");
    objc_msgSend(v3, "errorDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 67109378;
    v8[1] = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "received sync error package. err=%d, desc=%{public}@", (uint8_t *)v8, 0x12u);

  }
  return 0;
}

- (BOOL)_processSyncOperation:(id)a3 withImportSession:(void *)a4
{
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  BOOL v11;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "multiverseId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mediaObjectType");
  switch(v8)
  {
    case 1:
      v9 = -[ML3ProtoSyncImportOperation _processAlbumOperation:withImportSession:](self, "_processAlbumOperation:withImportSession:", v6, a4);
      goto LABEL_9;
    case 6:
      v9 = -[ML3ProtoSyncImportOperation _processMediaItemOperation:withImportSession:](self, "_processMediaItemOperation:withImportSession:", v6, a4);
      goto LABEL_9;
    case 7:
      v9 = -[ML3ProtoSyncImportOperation _processPlaylistOperation:withImportSession:](self, "_processPlaylistOperation:withImportSession:", v6, a4);
      goto LABEL_9;
    case 8:
      v9 = -[ML3ProtoSyncImportOperation _processAlbumArtistOperation:withImportSession:](self, "_processAlbumArtistOperation:withImportSession:", v6, a4);
LABEL_9:
      v11 = v9;
      break;
    default:
      v10 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 67109120;
        v13[1] = v8;
        _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "unknown object type %d", (uint8_t *)v13, 8u);
      }

      v11 = 1;
      break;
  }

  return v11;
}

- (BOOL)_processMediaItemOperation:(id)a3 withImportSession:(void *)a4
{
  id v6;
  MIPMultiverseIdentifier *v7;
  int v8;
  ML3ProtoSyncTrackImportItem *v9;
  void *v10;
  ML3MusicLibrary *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  char v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  ML3ProtoSyncTrackImportItem *v20;
  void *v21;
  ML3MusicLibrary *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  uint64_t v25;
  void *v26;
  ML3MusicLibrary *v27;
  void *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  MIPMultiverseIdentifier *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  ML3MusicLibrary *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  _BOOL4 v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  ML3ProtoSyncAlbumImportItem *v57;
  void *v58;
  ML3MusicLibrary *v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t *v62;
  unint64_t v63;
  char v64;
  NSObject *v65;
  ML3ProtoSyncTrackImportItem *v66;
  void *v67;
  ML3MusicLibrary *v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  uint64_t v71;
  void *v72;
  ML3MusicLibrary *v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  unint64_t v77;
  int updated;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  uint64_t v83;
  void *v84;
  ML3MusicLibrary *v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  int v92;
  unint64_t *v93;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  ML3ProtoSyncAlbumImportItem *v101;
  void *v102;
  ML3MusicLibrary *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t *v106;
  unint64_t v107;
  unint64_t *v108;
  unint64_t v109;
  char v110;
  NSObject *v111;
  NSObject *v112;
  BOOL v113;
  unint64_t *v114;
  unint64_t v115;
  _BOOL4 v116;
  BOOL v117;
  unint64_t *v118;
  unint64_t v119;
  NSObject *v120;
  NSObject *v121;
  std::__shared_weak_count *v122;
  unint64_t *v123;
  unint64_t v124;
  NSObject *v125;
  NSObject *v126;
  std::__shared_weak_count *v127;
  unint64_t *v128;
  unint64_t v129;
  unint64_t *v130;
  unint64_t v131;
  _BOOL4 pairedDeviceCanProcessStandAloneCollections;
  int v133;
  unint64_t *v134;
  unint64_t v135;
  MIPMultiverseIdentifier *v136;
  ML3ProtoSyncTrackImportItem *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  ML3DatabaseConnection *connection;
  char v149;
  NSObject *v150;
  NSObject *v151;
  NSObject *v152;
  os_log_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  ML3DatabaseConnection *v167;
  NSObject *v168;
  NSObject *v169;
  std::__shared_weak_count *v170;
  unint64_t *v171;
  unint64_t v172;
  BOOL v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  ML3DatabaseConnection *v180;
  NSObject *v181;
  std::__shared_weak_count *v182;
  unint64_t *v183;
  unint64_t v184;
  NSObject *v185;
  NSObject *v187;
  void *v188;
  uint64_t v189;
  MIPMultiverseIdentifier *v190;
  MIPMultiverseIdentifier *v191;
  MIPMultiverseIdentifier *v192;
  void *v193;
  MIPMediaItem *v194;
  uint64_t v195[2];
  NSObject *v196;
  NSObject *v197;
  id v198;
  ML3ProtoSyncTrackImportItem *v199;
  std::__shared_weak_count *v200;
  _QWORD v201[2];
  _QWORD v202[2];
  _QWORD v203[2];
  uint64_t v204;
  std::__shared_weak_count *v205;
  _QWORD v206[2];
  uint64_t v207;
  std::__shared_weak_count *v208;
  ML3ProtoSyncTrackImportItem *v209;
  std::__shared_weak_count *v210;
  uint8_t buf[16];
  _QWORD v212[2];
  uint64_t v213[2];
  _QWORD v214[2];
  uint64_t v215;
  std::__shared_weak_count *v216;
  uint8_t v217[8];
  uint64_t v218;
  _QWORD v219[2];
  uint64_t v220;
  std::__shared_weak_count *v221;
  uint8_t v222[8];
  std::__shared_weak_count *v223;
  _QWORD v224[4];
  _QWORD v225[3];
  _QWORD v226[5];
  __int128 v227;
  uint64_t v228;

  v228 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v193 = v6;
  if (!self->_syncSessionStarted)
  {
    if ((ML3ImportSession::begin((ML3ImportSession *)a4, self->_totalSyncPackageCount, self->_syncType == 1, 0) & 1) == 0)
    {
      v112 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v222 = 0;
        _os_log_impl(&dword_1AC149000, v112, OS_LOG_TYPE_ERROR, "failed to begin import session", v222, 2u);
      }

      goto LABEL_218;
    }
    self->_syncSessionStarted = 1;
  }
  objc_msgSend(v6, "multiverseId");
  v7 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItem");
  v194 = (MIPMediaItem *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "operationType");
  if (v8 != 1)
  {
    if (v8 != 2)
    {
      if (v8 != 3)
      {

LABEL_202:
        v173 = 1;
        goto LABEL_221;
      }
      v190 = v7;
      v9 = (ML3ProtoSyncTrackImportItem *)operator new();
      -[ML3ImportOperation import](self, "import");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "library");
      v11 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
      ML3ProtoSyncTrackImportItem::ML3ProtoSyncTrackImportItem(v9, v11, v7, 0, 0);
      *(_QWORD *)v9 = &off_1E5B4F080;
      *(_QWORD *)v222 = v9;
      v12 = (std::__shared_weak_count *)operator new();
      v12->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C70;
      v12->__shared_weak_owners_ = 0;
      v12[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
      v223 = v12;

      v195[0] = (uint64_t)v9;
      v195[1] = (uint64_t)v12;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
      v15 = ML3ImportSession::removeTrack((uint64_t)a4, v195);
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
      v17 = v223;
      if (v223)
      {
        v18 = (unint64_t *)&v223->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }

      goto LABEL_201;
    }
    v192 = v7;
    v66 = (ML3ProtoSyncTrackImportItem *)operator new();
    -[ML3ImportOperation import](self, "import");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "library");
    v68 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncTrackImportItem::ML3ProtoSyncTrackImportItem(v66, v68, v7, v194, self->_isServerImport);
    *(_QWORD *)v222 = v66;
    v69 = (std::__shared_weak_count *)operator new();
    v69->__shared_owners_ = 0;
    v70 = (unint64_t *)&v69->__shared_owners_;
    v69->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51B58;
    v69->__shared_weak_owners_ = 0;
    v69[1].__vftable = (std::__shared_weak_count_vtbl *)v66;
    v223 = v69;

    *((_BYTE *)v66 + 17) = 0;
    if (!_os_feature_enabled_impl() || !self->_pairedDeviceCanProcessStandAloneCollections)
    {
      v117 = 0;
      v199 = v66;
      v200 = v69;
      goto LABEL_158;
    }
    v71 = operator new();
    -[ML3ImportOperation import](self, "import");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "library");
    v73 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
    v188 = a4;
    ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v71, v73, 0, v194, 7, self->_isServerImport);
    *(_QWORD *)&v227 = v71;
    v74 = (std::__shared_weak_count *)operator new();
    v74->__shared_owners_ = 0;
    v75 = (unint64_t *)&v74->__shared_owners_;
    v74->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
    v74->__shared_weak_owners_ = 0;
    v74[1].__vftable = (std::__shared_weak_count_vtbl *)v71;
    *((_QWORD *)&v227 + 1) = v74;

    *(_BYTE *)(v71 + 17) = 0;
    v207 = v71;
    v208 = v74;
    do
      v76 = __ldxr(v75);
    while (__stxr(v76 + 1, v75));
    v206[0] = v66;
    v206[1] = v69;
    a4 = v188;
    do
      v77 = __ldxr(v70);
    while (__stxr(v77 + 1, v70));
    updated = ML3ImportSession::updateAlbumArtist((uint64_t)v188, &v207, v206, self->_isServerImport);
    do
      v79 = __ldaxr(v70);
    while (__stlxr(v79 - 1, v70));
    if (!v79)
    {
      ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
      std::__shared_weak_count::__release_weak(v69);
    }
    v80 = v208;
    if (v208)
    {
      v81 = (unint64_t *)&v208->__shared_owners_;
      do
        v82 = __ldaxr(v81);
      while (__stlxr(v82 - 1, v81));
      if (!v82)
      {
        ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
        std::__shared_weak_count::__release_weak(v80);
      }
    }
    if (updated)
    {
      v83 = operator new();
      -[ML3ImportOperation import](self, "import");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "library");
      v85 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
      ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v83, v85, 0, v194, 2, self->_isServerImport);
      *(_QWORD *)v217 = v83;
      v86 = (std::__shared_weak_count *)operator new();
      v86->__shared_owners_ = 0;
      v87 = (unint64_t *)&v86->__shared_owners_;
      v86->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
      v86->__shared_weak_owners_ = 0;
      v86[1].__vftable = (std::__shared_weak_count_vtbl *)v83;
      v218 = (uint64_t)v86;

      *(_BYTE *)(v83 + 17) = 0;
      v204 = v83;
      v205 = v86;
      do
        v88 = __ldxr(v87);
      while (__stxr(v88 + 1, v87));
      v89 = v223;
      v203[0] = *(_QWORD *)v222;
      v203[1] = v223;
      if (v223)
      {
        v90 = (unint64_t *)&v223->__shared_owners_;
        do
          v91 = __ldxr(v90);
        while (__stxr(v91 + 1, v90));
      }
      v92 = ML3ImportSession::updateItemArtist((uint64_t)v188, &v204, v203, self->_isServerImport);
      if (v89)
      {
        v93 = (unint64_t *)&v89->__shared_owners_;
        do
          v94 = __ldaxr(v93);
        while (__stlxr(v94 - 1, v93));
        if (!v94)
        {
          ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
          std::__shared_weak_count::__release_weak(v89);
        }
      }
      v95 = v205;
      if (v205)
      {
        v96 = (unint64_t *)&v205->__shared_owners_;
        do
          v97 = __ldaxr(v96);
        while (__stlxr(v97 - 1, v96));
        if (!v97)
        {
          ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
          std::__shared_weak_count::__release_weak(v95);
        }
      }
      v98 = (std::__shared_weak_count *)v218;
      if (v218)
      {
        v99 = (unint64_t *)(v218 + 8);
        do
          v100 = __ldaxr(v99);
        while (__stlxr(v100 - 1, v99));
        if (!v100)
        {
          ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
          std::__shared_weak_count::__release_weak(v98);
        }
      }
      if (v92)
      {
        v101 = (ML3ProtoSyncAlbumImportItem *)operator new();
        -[ML3ImportOperation import](self, "import");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "library");
        v103 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
        ML3ProtoSyncAlbumImportItem::ML3ProtoSyncAlbumImportItem(v101, v103, 0, v194, self->_isServerImport);
        std::shared_ptr<ML3ImportItem>::shared_ptr[abi:ne180100]<ML3ProtoSyncAlbumImportItem,void>(v217, (uint64_t)v101);

        v105 = *(_QWORD *)v217;
        v104 = v218;
        *(_BYTE *)(*(_QWORD *)v217 + 17) = 0;
        v202[0] = v105;
        v202[1] = v104;
        if (v104)
        {
          v106 = (unint64_t *)(v104 + 8);
          do
            v107 = __ldxr(v106);
          while (__stxr(v107 + 1, v106));
        }
        v201[0] = *(_QWORD *)v222;
        v201[1] = v223;
        if (v223)
        {
          v108 = (unint64_t *)&v223->__shared_owners_;
          do
            v109 = __ldxr(v108);
          while (__stxr(v109 + 1, v108));
        }
        v110 = ML3ImportSession::updateAlbum((uint64_t)v188, v202, v201, *(_QWORD *)(v227 + 8), self->_isServerImport);
        std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)v201);
        std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)v202);
        if ((v110 & 1) == 0)
        {
          _ML3LogCategoryDefault();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC149000, v111, OS_LOG_TYPE_ERROR, "failed to update album", buf, 2u);
          }

        }
        std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)v217);
        goto LABEL_152;
      }
    }
    else
    {
      v125 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v217 = 0;
        _os_log_impl(&dword_1AC149000, v125, OS_LOG_TYPE_ERROR, "failed to update album artist", v217, 2u);
      }

    }
    v126 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v217 = 0;
      _os_log_impl(&dword_1AC149000, v126, OS_LOG_TYPE_ERROR, "failed to update item artist", v217, 2u);
    }

LABEL_152:
    v127 = (std::__shared_weak_count *)*((_QWORD *)&v227 + 1);
    if (*((_QWORD *)&v227 + 1))
    {
      v128 = (unint64_t *)(*((_QWORD *)&v227 + 1) + 8);
      do
        v129 = __ldaxr(v128);
      while (__stlxr(v129 - 1, v128));
      if (!v129)
      {
        ((void (*)(std::__shared_weak_count *))v127->__on_zero_shared)(v127);
        std::__shared_weak_count::__release_weak(v127);
      }
    }
    v69 = v223;
    v199 = *(ML3ProtoSyncTrackImportItem **)v222;
    v200 = v223;
    v117 = v223 == 0;
    if (!v223)
    {
LABEL_160:
      if (_os_feature_enabled_impl())
        pairedDeviceCanProcessStandAloneCollections = self->_pairedDeviceCanProcessStandAloneCollections;
      else
        pairedDeviceCanProcessStandAloneCollections = 0;
      v133 = ML3ImportSession::updateTrack((uint64_t)a4, (uint64_t *)&v199, pairedDeviceCanProcessStandAloneCollections, self->_isServerImport);
      if (!v117)
      {
        v134 = (unint64_t *)&v69->__shared_owners_;
        do
          v135 = __ldaxr(v134);
        while (__stlxr(v135 - 1, v134));
        if (!v135)
        {
          ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
          std::__shared_weak_count::__release_weak(v69);
        }
      }
      if (v133)
      {
        v136 = v192;
        if (self->_isServerImport)
        {
          v137 = *(ML3ProtoSyncTrackImportItem **)v222;
          v189 = *(_QWORD *)(*(_QWORD *)v222 + 8);
          v138 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)v222 + 32))(*(_QWORD *)v222, 83886085);
          v139 = (*(uint64_t (**)(ML3ProtoSyncTrackImportItem *, uint64_t))(*(_QWORD *)v137 + 32))(v137, 83886092);
          v140 = v139;
          if (v138 <= 0 && v139 < 1)
          {
            v152 = 0;
            v149 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v138);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            v226[0] = v142;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v138);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            v226[1] = v143;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v140);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            v226[2] = v144;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v140);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            v226[3] = v145;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v189);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            v226[4] = v146;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v226, 5);
            v147 = (void *)objc_claimAutoreleasedReturnValue();

            connection = self->_connection;
            v198 = 0;
            v149 = -[ML3DatabaseConnection executeUpdate:withParameters:error:](connection, "executeUpdate:withParameters:error:", CFSTR("UPDATE item_stats SET play_count_user = play_count_user + ?, play_count_recent = play_count_recent + ?, skip_count_user = skip_count_user + ?, skip_count_recent = skip_count_recent + ? WHERE item_pid = ?"), v147, &v198);
            v150 = v198;
            if ((v149 & 1) == 0)
            {
              _ML3LogCategoryDefault();
              v151 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v227) = 138543362;
                *(_QWORD *)((char *)&v227 + 4) = v150;
                _os_log_impl(&dword_1AC149000, v151, OS_LOG_TYPE_ERROR, "failed to apply stats updates. err=%{public}@", (uint8_t *)&v227, 0xCu);
              }

            }
            v152 = v150;
          }
          v154 = (*(uint64_t (**)(ML3ProtoSyncTrackImportItem *, uint64_t))(*(_QWORD *)v137 + 32))(v137, 83886098);
          v187 = v152;
          v155 = (*(uint64_t (**)(ML3ProtoSyncTrackImportItem *, uint64_t))(*(_QWORD *)v137 + 32))(v137, 83886097);
          if (v154)
          {
            v156 = v155;
            -[ML3ImportOperation import](self, "import");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "library");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), v189);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            +[ML3Entity anyInLibrary:predicate:options:](ML3Track, "anyInLibrary:predicate:options:", v158, v159, 3);
            v160 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v156);
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "setValue:forProperty:", v161, CFSTR("item_stats.liked_state"));

          }
          v162 = (*(uint64_t (**)(ML3ProtoSyncTrackImportItem *, uint64_t))(*(_QWORD *)v137 + 32))(v137, 83886087);
          if ((*(uint64_t (**)(ML3ProtoSyncTrackImportItem *, uint64_t))(*(_QWORD *)v137 + 32))(v137, 83886093))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (*(uint64_t (**)(ML3ProtoSyncTrackImportItem *, uint64_t))(*(_QWORD *)v137 + 32))(v137, 83886094));
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            v225[0] = v163;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v189);
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            v225[1] = v164;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v162);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v225[2] = v165;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v225, 3);
            v166 = (void *)objc_claimAutoreleasedReturnValue();

            v167 = self->_connection;
            v197 = v187;
            v149 = -[ML3DatabaseConnection executeUpdate:withParameters:error:](v167, "executeUpdate:withParameters:error:", CFSTR("UPDATE item_stats SET bookmark_time_ms = ? WHERE item_pid = ? AND date_played < ?"), v166, &v197);
            v168 = v197;

            if ((v149 & 1) == 0)
            {
              _ML3LogCategoryDefault();
              v169 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v227) = 138543362;
                *(_QWORD *)((char *)&v227 + 4) = v168;
                _os_log_impl(&dword_1AC149000, v169, OS_LOG_TYPE_ERROR, "failed to update bookmark time. err=%{public}@", (uint8_t *)&v227, 0xCu);
              }

            }
          }
          else
          {
            v168 = v187;
          }
          v174 = (*(uint64_t (**)(ML3ProtoSyncTrackImportItem *, uint64_t))(*(_QWORD *)v137 + 32))(v137, 83886086);
          if (v174)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v162);
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            v224[0] = v175;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v174);
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            v224[1] = v176;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v189);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            v224[2] = v177;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v162);
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            v224[3] = v178;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v224, 4);
            v179 = (void *)objc_claimAutoreleasedReturnValue();

            v180 = self->_connection;
            v196 = v168;
            v149 = -[ML3DatabaseConnection executeUpdate:withParameters:error:](v180, "executeUpdate:withParameters:error:", CFSTR("UPDATE item_stats SET date_played = ?, has_been_played = ? WHERE item_pid = ? AND date_played < ?"), v179, &v196);
            v153 = v196;

            if ((v149 & 1) == 0)
            {
              _ML3LogCategoryDefault();
              v181 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v227) = 138543362;
                *(_QWORD *)((char *)&v227 + 4) = v153;
                _os_log_impl(&dword_1AC149000, v181, OS_LOG_TYPE_ERROR, "failed to update date_played. err=%{public}@", (uint8_t *)&v227, 0xCu);
              }

            }
          }
          else
          {
            v153 = v168;
          }
LABEL_211:

          goto LABEL_212;
        }
        v149 = 1;
      }
      else
      {
        v136 = v192;
        if (self->_isServerImport)
        {
          v153 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v227) = 0;
            _os_log_impl(&dword_1AC149000, v153, OS_LOG_TYPE_ERROR, "ignoring failed update for deleted track", (uint8_t *)&v227, 2u);
          }
          v149 = 1;
          goto LABEL_211;
        }
        v149 = 0;
      }
LABEL_212:
      v182 = v223;
      if (v223)
      {
        v183 = (unint64_t *)&v223->__shared_owners_;
        do
          v184 = __ldaxr(v183);
        while (__stlxr(v184 - 1, v183));
        if (!v184)
        {
          ((void (*)(std::__shared_weak_count *))v182->__on_zero_shared)(v182);
          std::__shared_weak_count::__release_weak(v182);
        }
      }

      if ((v149 & 1) != 0)
        goto LABEL_202;
      goto LABEL_218;
    }
LABEL_158:
    v130 = (unint64_t *)&v69->__shared_owners_;
    do
      v131 = __ldxr(v130);
    while (__stxr(v131 + 1, v130));
    goto LABEL_160;
  }
  v191 = v7;
  v20 = (ML3ProtoSyncTrackImportItem *)operator new();
  -[ML3ImportOperation import](self, "import");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "library");
  v22 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
  ML3ProtoSyncTrackImportItem::ML3ProtoSyncTrackImportItem(v20, v22, v7, v194, self->_isServerImport);
  *(_QWORD *)v222 = v20;
  v23 = (std::__shared_weak_count *)operator new();
  v23->__shared_owners_ = 0;
  v24 = (unint64_t *)&v23->__shared_owners_;
  v23->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51B58;
  v23->__shared_weak_owners_ = 0;
  v23[1].__vftable = (std::__shared_weak_count_vtbl *)v20;
  v223 = v23;

  if (!_os_feature_enabled_impl() || !self->_pairedDeviceCanProcessStandAloneCollections)
  {
    v113 = 0;
    v209 = v20;
    v210 = v23;
    goto LABEL_120;
  }
  v25 = operator new();
  -[ML3ImportOperation import](self, "import");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "library");
  v27 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
  ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v25, v27, 0, v194, 7, self->_isServerImport);
  v28 = a4;
  *(_QWORD *)&v227 = v25;
  v29 = (std::__shared_weak_count *)operator new();
  v29->__shared_owners_ = 0;
  v30 = (unint64_t *)&v29->__shared_owners_;
  v29->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
  v29->__shared_weak_owners_ = 0;
  v29[1].__vftable = (std::__shared_weak_count_vtbl *)v25;
  *((_QWORD *)&v227 + 1) = v29;

  v220 = v25;
  v221 = v29;
  do
    v31 = __ldxr(v30);
  while (__stxr(v31 + 1, v30));
  v219[0] = v20;
  v219[1] = v23;
  do
    v32 = __ldxr(v24);
  while (__stxr(v32 + 1, v24));
  a4 = v28;
  v33 = ML3ImportSession::addAlbumArtist((uint64_t)v28, &v220, v219);
  do
    v34 = __ldaxr(v24);
  while (__stlxr(v34 - 1, v24));
  if (!v34)
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  v35 = v221;
  v36 = v191;
  if (v221)
  {
    v37 = (unint64_t *)&v221->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  if (v33)
  {
    v39 = operator new();
    -[ML3ImportOperation import](self, "import");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "library");
    v41 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v39, v41, 0, v194, 2, self->_isServerImport);
    *(_QWORD *)v217 = v39;
    v42 = (std::__shared_weak_count *)operator new();
    v42->__shared_owners_ = 0;
    v43 = (unint64_t *)&v42->__shared_owners_;
    v42->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
    v42->__shared_weak_owners_ = 0;
    v42[1].__vftable = (std::__shared_weak_count_vtbl *)v39;
    v218 = (uint64_t)v42;

    v215 = v39;
    v216 = v42;
    do
      v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
    v45 = v223;
    v214[0] = *(_QWORD *)v222;
    v214[1] = v223;
    if (v223)
    {
      v46 = (unint64_t *)&v223->__shared_owners_;
      do
        v47 = __ldxr(v46);
      while (__stxr(v47 + 1, v46));
    }
    v36 = v191;
    v48 = ML3ImportSession::addItemArtist((uint64_t)v28, &v215, v214);
    if (v45)
    {
      v49 = (unint64_t *)&v45->__shared_owners_;
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
    v51 = v216;
    if (v216)
    {
      v52 = (unint64_t *)&v216->__shared_owners_;
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
    v54 = (std::__shared_weak_count *)v218;
    if (v218)
    {
      v55 = (unint64_t *)(v218 + 8);
      do
        v56 = __ldaxr(v55);
      while (__stlxr(v56 - 1, v55));
      if (!v56)
      {
        ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
        std::__shared_weak_count::__release_weak(v54);
      }
    }
    if (v48)
    {
      v57 = (ML3ProtoSyncAlbumImportItem *)operator new();
      -[ML3ImportOperation import](self, "import");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "library");
      v59 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
      ML3ProtoSyncAlbumImportItem::ML3ProtoSyncAlbumImportItem(v57, v59, 0, v194, self->_isServerImport);
      std::shared_ptr<ML3ImportItem>::shared_ptr[abi:ne180100]<ML3ProtoSyncAlbumImportItem,void>(v217, (uint64_t)v57);

      v213[0] = *(_QWORD *)v217;
      v213[1] = v218;
      if (v218)
      {
        v60 = (unint64_t *)(v218 + 8);
        do
          v61 = __ldxr(v60);
        while (__stxr(v61 + 1, v60));
      }
      v212[0] = *(_QWORD *)v222;
      v212[1] = v223;
      if (v223)
      {
        v62 = (unint64_t *)&v223->__shared_owners_;
        do
          v63 = __ldxr(v62);
        while (__stxr(v63 + 1, v62));
      }
      v64 = ML3ImportSession::addAlbum((uint64_t)v28, v213, v212, *(_QWORD *)(v227 + 8));
      std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)v212);
      std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)v213);
      if ((v64 & 1) == 0)
      {
        _ML3LogCategoryDefault();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v65, OS_LOG_TYPE_ERROR, "failed to import album", buf, 2u);
        }

      }
      std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)v217);
      goto LABEL_138;
    }
  }
  else
  {
    v120 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v217 = 0;
      _os_log_impl(&dword_1AC149000, v120, OS_LOG_TYPE_ERROR, "failed to import album artist", v217, 2u);
    }

  }
  v121 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v217 = 0;
    _os_log_impl(&dword_1AC149000, v121, OS_LOG_TYPE_ERROR, "failed to import item artist", v217, 2u);
  }

  v64 = 0;
LABEL_138:
  v122 = (std::__shared_weak_count *)*((_QWORD *)&v227 + 1);
  if (*((_QWORD *)&v227 + 1))
  {
    v123 = (unint64_t *)(*((_QWORD *)&v227 + 1) + 8);
    do
      v124 = __ldaxr(v123);
    while (__stlxr(v124 - 1, v123));
    if (!v124)
    {
      ((void (*)(std::__shared_weak_count *))v122->__on_zero_shared)(v122);
      std::__shared_weak_count::__release_weak(v122);
    }
  }
  if ((v64 & 1) != 0)
  {
    v23 = v223;
    v209 = *(ML3ProtoSyncTrackImportItem **)v222;
    v210 = v223;
    v113 = v223 == 0;
    if (!v223)
    {
LABEL_122:
      if (_os_feature_enabled_impl())
        v116 = self->_pairedDeviceCanProcessStandAloneCollections;
      else
        v116 = 0;
      v15 = ML3ImportSession::addTrack((uint64_t)a4, (uint64_t *)&v209, v116);
      if (v113)
      {
        v36 = v191;
      }
      else
      {
        v118 = (unint64_t *)&v23->__shared_owners_;
        do
          v119 = __ldaxr(v118);
        while (__stlxr(v119 - 1, v118));
        v36 = v191;
        if (!v119)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
      goto LABEL_195;
    }
LABEL_120:
    v114 = (unint64_t *)&v23->__shared_owners_;
    do
      v115 = __ldxr(v114);
    while (__stxr(v115 + 1, v114));
    goto LABEL_122;
  }
  v15 = 0;
LABEL_195:
  v170 = v223;
  if (v223)
  {
    v171 = (unint64_t *)&v223->__shared_owners_;
    do
      v172 = __ldaxr(v171);
    while (__stlxr(v172 - 1, v171));
    if (!v172)
    {
      ((void (*)(std::__shared_weak_count *))v170->__on_zero_shared)(v170);
      std::__shared_weak_count::__release_weak(v170);
    }
  }

LABEL_201:
  if ((v15 & 1) != 0)
    goto LABEL_202;
LABEL_218:
  v185 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v222 = 0;
    _os_log_impl(&dword_1AC149000, v185, OS_LOG_TYPE_ERROR, "failed to process media sync operation", v222, 2u);
  }

  v173 = 0;
LABEL_221:

  return v173;
}

- (BOOL)_processPlaylistOperation:(id)a3 withImportSession:(void *)a4
{
  id v6;
  MIPMultiverseIdentifier *v7;
  MIPPlaylist *v8;
  int v9;
  ML3ProtoSyncContainerImportItem *v10;
  void *v11;
  ML3MusicLibrary *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  ML3ProtoSyncContainerImportItem *v21;
  void *v22;
  ML3MusicLibrary *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v33[2];
  uint64_t v34[2];
  uint8_t buf[8];
  std::__shared_weak_count *v36;

  v6 = a3;
  if (!self->_syncSessionStarted)
  {
    if ((ML3ImportSession::begin((ML3ImportSession *)a4, self->_totalSyncPackageCount, self->_syncType == 1, 0) & 1) == 0)
    {
      v30 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v30, OS_LOG_TYPE_ERROR, "failed to begin import session", buf, 2u);
      }

      goto LABEL_34;
    }
    self->_syncSessionStarted = 1;
  }
  objc_msgSend(v6, "multiverseId");
  v7 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playlist");
  v8 = (MIPPlaylist *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "operationType");
  if (v9 == 1)
  {
    v21 = (ML3ProtoSyncContainerImportItem *)operator new();
    -[ML3ImportOperation import](self, "import");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "library");
    v23 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncContainerImportItem::ML3ProtoSyncContainerImportItem(v21, v23, v7, v8, self->_isServerImport);
    *(_QWORD *)buf = v21;
    v24 = (std::__shared_weak_count *)operator new();
    v24->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    v24->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51DF8;
    v24->__shared_weak_owners_ = 0;
    v24[1].__vftable = (std::__shared_weak_count_vtbl *)v21;
    v36 = v24;

    v34[0] = (uint64_t)v21;
    v34[1] = (uint64_t)v24;
    do
      v26 = __ldxr(p_shared_owners);
    while (__stxr(v26 + 1, p_shared_owners));
    v16 = ML3ImportSession::addContainer((uint64_t)a4, v34);
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
    v18 = v36;
    if (v36)
    {
      v28 = (unint64_t *)&v36->__shared_owners_;
      do
        v20 = __ldaxr(v28);
      while (__stlxr(v20 - 1, v28));
LABEL_25:
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  else
  {
    if (v9 != 3)
    {

      goto LABEL_30;
    }
    v10 = (ML3ProtoSyncContainerImportItem *)operator new();
    -[ML3ImportOperation import](self, "import");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "library");
    v12 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncContainerImportItem::ML3ProtoSyncContainerImportItem(v10, v12, v7, v8, self->_isServerImport);
    *(_QWORD *)buf = v10;
    v13 = (std::__shared_weak_count *)operator new();
    v13->__shared_owners_ = 0;
    v14 = (unint64_t *)&v13->__shared_owners_;
    v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51DF8;
    v13->__shared_weak_owners_ = 0;
    v13[1].__vftable = (std::__shared_weak_count_vtbl *)v10;
    v36 = v13;

    v33[0] = (uint64_t)v10;
    v33[1] = (uint64_t)v13;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
    v16 = ML3ImportSession::removeContainer((uint64_t)a4, v33);
    do
      v17 = __ldaxr(v14);
    while (__stlxr(v17 - 1, v14));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    v18 = v36;
    if (v36)
    {
      v19 = (unint64_t *)&v36->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      goto LABEL_25;
    }
  }

  if ((v16 & 1) != 0)
  {
LABEL_30:
    v29 = 1;
    goto LABEL_37;
  }
LABEL_34:
  v31 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_ERROR, "failed to process playlist sync operation", buf, 2u);
  }

  v29 = 0;
LABEL_37:

  return v29;
}

- (BOOL)_processAlbumArtistOperation:(id)a3 withImportSession:(void *)a4
{
  id v6;
  MIPArtist *v7;
  MIPMultiverseIdentifier *v8;
  int v9;
  ML3ProtoSyncImportItem *v10;
  void *v11;
  ML3MusicLibrary *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char updated;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  ML3ProtoSyncArtistImportItem *v21;
  void *v22;
  ML3MusicLibrary *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  ML3ProtoSyncArtistImportItem *v29;
  void *v30;
  ML3MusicLibrary *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t *v36;
  BOOL v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v41[2];
  _QWORD v42[2];
  uint64_t v43[2];
  _QWORD v44[2];
  uint64_t v45[2];
  uint8_t buf[8];
  std::__shared_weak_count *v47;

  v6 = a3;
  if (!self->_syncSessionStarted)
  {
    if ((ML3ImportSession::begin((ML3ImportSession *)a4, self->_totalSyncPackageCount, self->_syncType == 1, 0) & 1) == 0)
    {
      v38 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v38, OS_LOG_TYPE_ERROR, "failed to begin import session", buf, 2u);
      }

      goto LABEL_45;
    }
    self->_syncSessionStarted = 1;
  }
  objc_msgSend(v6, "artist");
  v7 = (MIPArtist *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multiverseId");
  v8 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "operationType");
  if (v9 == 1)
  {
    v21 = (ML3ProtoSyncArtistImportItem *)operator new();
    -[ML3ImportOperation import](self, "import");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "library");
    v23 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v21, v23, v8, v7, self->_isServerImport);
    *(_QWORD *)buf = v21;
    v24 = (std::__shared_weak_count *)operator new();
    v24->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    v24->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
    v24->__shared_weak_owners_ = 0;
    v24[1].__vftable = (std::__shared_weak_count_vtbl *)v21;
    v47 = v24;

    v45[0] = (uint64_t)v21;
    v45[1] = (uint64_t)v24;
    do
      v26 = __ldxr(p_shared_owners);
    while (__stxr(v26 + 1, p_shared_owners));
    v44[0] = 0;
    v44[1] = 0;
    updated = ML3ImportSession::addAlbumArtist((uint64_t)a4, v45, v44);
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
    v18 = v47;
    if (!v47)
      goto LABEL_38;
    v28 = (unint64_t *)&v47->__shared_owners_;
    do
      v20 = __ldaxr(v28);
    while (__stlxr(v20 - 1, v28));
LABEL_36:
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
    goto LABEL_38;
  }
  if (v9 == 2)
  {
    v29 = (ML3ProtoSyncArtistImportItem *)operator new();
    -[ML3ImportOperation import](self, "import");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "library");
    v31 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v29, v31, v8, v7, self->_isServerImport);
    *(_QWORD *)buf = v29;
    v32 = (std::__shared_weak_count *)operator new();
    v32->__shared_owners_ = 0;
    v33 = (unint64_t *)&v32->__shared_owners_;
    v32->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
    v32->__shared_weak_owners_ = 0;
    v32[1].__vftable = (std::__shared_weak_count_vtbl *)v29;
    v47 = v32;

    v43[0] = (uint64_t)v29;
    v43[1] = (uint64_t)v32;
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
    v42[0] = 0;
    v42[1] = 0;
    updated = ML3ImportSession::updateAlbumArtist((uint64_t)a4, v43, v42, 1);
    do
      v35 = __ldaxr(v33);
    while (__stlxr(v35 - 1, v33));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
    v18 = v47;
    if (!v47)
      goto LABEL_38;
    v36 = (unint64_t *)&v47->__shared_owners_;
    do
      v20 = __ldaxr(v36);
    while (__stlxr(v20 - 1, v36));
    goto LABEL_36;
  }
  if (v9 != 3)
  {

    goto LABEL_41;
  }
  v10 = (ML3ProtoSyncImportItem *)operator new();
  -[ML3ImportOperation import](self, "import");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "library");
  v12 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
  ML3ProtoSyncImportItem::ML3ProtoSyncImportItem(v10, v12, v8, self->_isServerImport);
  *(_QWORD *)v10 = &off_1E5B50C40;
  *(_QWORD *)buf = v10;
  v13 = (std::__shared_weak_count *)operator new();
  v13->__shared_owners_ = 0;
  v14 = (unint64_t *)&v13->__shared_owners_;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B52338;
  v13->__shared_weak_owners_ = 0;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)v10;
  v47 = v13;

  v41[0] = (uint64_t)v10;
  v41[1] = (uint64_t)v13;
  do
    v15 = __ldxr(v14);
  while (__stxr(v15 + 1, v14));
  updated = ML3ImportSession::removeAlbumArtist((uint64_t)a4, v41);
  do
    v17 = __ldaxr(v14);
  while (__stlxr(v17 - 1, v14));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  v18 = v47;
  if (v47)
  {
    v19 = (unint64_t *)&v47->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    goto LABEL_36;
  }
LABEL_38:

  if ((updated & 1) != 0)
  {
LABEL_41:
    v37 = 1;
    goto LABEL_48;
  }
LABEL_45:
  v39 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v39, OS_LOG_TYPE_ERROR, "failed to process album artist sync operation", buf, 2u);
  }

  v37 = 0;
LABEL_48:

  return v37;
}

- (BOOL)_processAlbumOperation:(id)a3 withImportSession:(void *)a4
{
  id v6;
  void *v7;
  MIPMultiverseIdentifier *v8;
  uint64_t v9;
  void *v10;
  ML3MusicLibrary *v11;
  char isServerImport;
  id v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  char updated;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[8];
  std::__shared_weak_count *v29;

  v6 = a3;
  if (!self->_syncSessionStarted)
  {
    if ((ML3ImportSession::begin((ML3ImportSession *)a4, self->_totalSyncPackageCount, self->_syncType == 1, 0) & 1) == 0)
    {
      v23 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v23, OS_LOG_TYPE_ERROR, "failed to begin import session", buf, 2u);
      }

      goto LABEL_23;
    }
    self->_syncSessionStarted = 1;
  }
  objc_msgSend(v6, "album");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multiverseId");
  v8 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "operationType") != 2)
  {

LABEL_19:
    v22 = 1;
    goto LABEL_26;
  }
  v9 = operator new();
  -[ML3ImportOperation import](self, "import");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "library");
  v11 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
  isServerImport = self->_isServerImport;
  v13 = v7;
  ML3ProtoSyncImportItem::ML3ProtoSyncImportItem((ML3ProtoSyncImportItem *)v9, v11, v8, isServerImport);
  *(_QWORD *)v9 = &off_1E5B4EA18;
  *(_OWORD *)(v9 + 88) = 0u;
  *(_OWORD *)(v9 + 104) = 0u;
  *(_QWORD *)(v9 + 120) = v13;
  *(_QWORD *)(v9 + 128) = 0;
  *(_QWORD *)buf = v9;
  v14 = (std::__shared_weak_count *)operator new();
  v14->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v14->__shared_owners_;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51B20;
  v14->__shared_weak_owners_ = 0;
  v14[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
  v29 = v14;

  v27[0] = v9;
  v27[1] = v14;
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  v26[0] = 0;
  v26[1] = 0;
  updated = ML3ImportSession::updateAlbum((uint64_t)a4, v27, v26, 0, 1);
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  v19 = v29;
  if (v29)
  {
    v20 = (unint64_t *)&v29->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  if ((updated & 1) != 0)
    goto LABEL_19;
LABEL_23:
  v24 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_ERROR, "failed to process album artist sync operation", buf, 2u);
  }

  v22 = 0;
LABEL_26:

  return v22;
}

- (void)_unlinkUnavailableMediaItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  _QWORD v33[2];
  _QWORD v34[5];

  v34[3] = *MEMORY[0x1E0C80C00];
  +[ML3ContainmentPredicate predicateWithProperty:values:](ML3ContainmentPredicate, "predicateWithProperty:values:", CFSTR("item_store.sync_id"), self->_syncIdsToUnlink);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v3;
  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("(item.base_location_id > 0)"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v4;
  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("item_store.is_protected"), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ML3ImportOperation import](self, "import");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v9, v7, MEMORY[0x1E0C9AA60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __59__ML3ProtoSyncImportOperation__unlinkUnavailableMediaItems__block_invoke;
  v30[3] = &unk_1E5B65960;
  v13 = v11;
  v31 = v13;
  objc_msgSend(v10, "enumeratePersistentIDsUsingBlock:", v30);
  if (objc_msgSend(v13, "count"))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134217984;
      v33[0] = v15;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "Found %lu unavailable tracks to unlink", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3ImportOperation import](self, "import");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "library");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v12;
    v26 = 3221225472;
    v27 = __59__ML3ProtoSyncImportOperation__unlinkUnavailableMediaItems__block_invoke_37;
    v28 = &unk_1E5B63928;
    v19 = v16;
    v29 = v19;
    +[ML3Track enumeratePathsToDeleteFromLibrary:persistentIDs:usingBlock:](ML3Track, "enumeratePathsToDeleteFromLibrary:persistentIDs:usingBlock:", v18, v13, &v25);

    v20 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      LODWORD(v33[0]) = 2;
      WORD2(v33[0]) = 2114;
      *(_QWORD *)((char *)v33 + 6) = v19;
      _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEFAULT, "Deleting assets with protection type = %d that are no longer cloud available: %{public}@", buf, 0x12u);
    }

    ML3DeleteAssetsAtPaths(v19);
    -[ML3ImportOperation import](self, "import", v25, v26, v27, v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "library");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = +[ML3Track clearLocationFromLibrary:persistentIDs:usingConnection:](ML3Track, "clearLocationFromLibrary:persistentIDs:usingConnection:", v22, v13, self->_connection);

    if (!v23)
    {
      v24 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v33[0]) = 2;
        _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_DEFAULT, "Failed to clear location for unavailable tracks with asset protection type = %d", buf, 8u);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_syncIdsToUnlink, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __59__ML3ProtoSyncImportOperation__unlinkUnavailableMediaItems__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218240;
    v7 = a2;
    v8 = 1024;
    v9 = 2;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Track with persistent_id:%lld, protection type: %d is local on device with no backing cloud asset", (uint8_t *)&v6, 0x12u);
  }

}

void __59__ML3ProtoSyncImportOperation__unlinkUnavailableMediaItems__block_invoke_37(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 && objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 337) || *(_BYTE *)(v2 + 336))
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(unsigned __int8 *)(v4 + 337);
      v6 = *(unsigned __int8 *)(v4 + 336);
      v7 = 138543874;
      v8 = v4;
      v9 = 1024;
      v10 = v5;
      v11 = 1024;
      v12 = v6;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Not suspending read source _importFinished %d, _isReadSourceCancelled %d", (uint8_t *)&v7, 0x18u);
    }

  }
  else
  {
    *(_QWORD *)(v2 + 328) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 360));
  }
}

intptr_t __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_12(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = 1;
  v2 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(unsigned __int8 *)(a1 + 48);
    v6 = 138543874;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming read source bytesRead %ld parsingLen %d", (uint8_t *)&v6, 0x1Cu);
  }

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 360));
}

void __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = 1;
  v2 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(unsigned __int8 *)(a1 + 48);
    v6 = 138543874;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming read source bytesRead %ld parsingLen %d", (uint8_t *)&v6, 0x1Cu);
  }

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 360));
}

void __61__ML3ProtoSyncImportOperation__performImportWithTransaction___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 337) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 328))
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming read source", (uint8_t *)&v7, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = 1;
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 360));
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 360) && !*(_BYTE *)(v2 + 336))
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling read source", (uint8_t *)&v7, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 336) = 1;
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 360));
  }
}

void __37__ML3ProtoSyncImportOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 360);
  if (v3)
  {
    if (!*(_BYTE *)(v2 + 336))
    {
      dispatch_source_cancel(v3);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 336) = 1;
    }
  }
}

BOOL __35__ML3ProtoSyncImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v6;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "failed to start store import transaction. error=%{public}@", (uint8_t *)&v14, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "import");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "library");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "currentRevision");

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performImportWithTransaction:", v5);
    objc_msgSend(*(id *)(a1 + 32), "import");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v11, "currentRevision");

  }
  v12 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;

  return v12;
}

@end
