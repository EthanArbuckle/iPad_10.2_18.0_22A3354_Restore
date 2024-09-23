@implementation OSLogEventStore

- (id)_progressHandler
{
  return self->_progressHandler;
}

- (void)set_upgradeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

+ (id)localStore
{
  return objc_alloc_init(OSLogEventLocalStore);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_upgradeHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_relativeFilePaths, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

- (OSLogEventStore)initWithArchiveURL:(id)a3
{
  id v5;
  OSLogEventStore *v6;
  OSLogEventStore *v7;

  v5 = a3;
  v6 = -[OSLogEventStore init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_archiveURL, a3);

  return v7;
}

- (OSLogEventStore)initWithArchiveURL:(id)a3 relativePaths:(id)a4
{
  id v7;
  id v8;
  OSLogEventStore *v9;
  OSLogEventStore *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[OSLogEventStore init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_archiveURL, a3);
    objc_storeStrong((id *)&v10->_relativeFilePaths, a4);
  }

  return v10;
}

- (void)addFilesToSource:(id)a3 forCollection:(id)a4 withProgress:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  __objc2_class *v14;
  uint64_t v15;
  void *v16;
  _OSLogIndexFile *v17;
  _OSLogIndexFile *v18;
  id v19;
  void (**progressHandler)(id, void *, double);
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  NSArray *v25;
  void *v26;
  void *v27;
  id v28;
  OSLogEventStore *v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v28 = v10;
  v29 = self;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = self->_relativeFilePaths;
  v30 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v30)
  {
    v13 = *(_QWORD *)v33;
    v14 = &OBJC_METACLASS____OSLogTracepointBuffer;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(objc_alloc(&v14[6]), "initWithCollection:subpath:", v9, objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v15)), "fileSystemRepresentation"));
        v17 = [_OSLogIndexFile alloc];
        v31 = 0;
        v18 = -[_OSLogIndexFile initWithTraceFile:error:](v17, "initWithTraceFile:error:", v16, &v31);
        v19 = v31;
        if (v18)
        {
          objc_msgSend(v11, "_insertIndexFile:", v18);
        }
        else
        {
          progressHandler = (void (**)(id, void *, double))v29->_progressHandler;
          if (progressHandler)
          {
            objc_msgSend(v28, "fractionCompleted");
            v22 = v21;
            _OSLogInternalError(17, v19);
            v23 = v13;
            v24 = v9;
            v25 = v12;
            v26 = v11;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            progressHandler[2](progressHandler, v27, v22);

            v11 = v26;
            v12 = v25;
            v9 = v24;
            v13 = v23;
            v14 = &OBJC_METACLASS____OSLogTracepointBuffer;
          }
        }

        ++v15;
      }
      while (v30 != v15);
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v30);
  }

}

- (void)prepareWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  NSURL *archiveURL;
  uint64_t v7;
  uint64_t v8;
  _OSLogDirectoryReference *v9;
  _OSLogDirectoryReference *v10;
  uint64_t v11;
  int v12;
  _OSLogDirectoryReference *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  void *v18;
  id v19;
  OSLogEventStore *v20;
  void (**progressHandler)(id, _QWORD);
  _OSLogCollectionReference *v22;
  _OSLogVersioning *v23;
  id v24;
  void *v25;
  _OSLogDirectoryReference *v26;
  _OSLogDirectoryReference *v27;
  id v28;
  OSLogEventStore *v29;
  void (**v30)(id, _QWORD);
  uint64_t v31;
  uint64_t (**upgradeHandler)(void);
  BOOL v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  OSLogEventStore *v38;
  void (**v39)(id, _QWORD);
  uint64_t v40;
  _OSLogCollectionReference *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void (**v45)(id, void *, double);
  double v46;
  double v47;
  void *v48;
  id v49;
  OSLogEventStore *v50;
  void (**v51)(id, _QWORD);
  uint64_t v52;
  OSLogEventSource *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  int *v64;
  void *v65;
  int *v66;
  void *v67;
  int v68;
  id v69;
  void *v70;
  void *v71;
  _OSLogEventStoreMetadata *v72;
  _OSLogDirectoryReference *v73;
  uint64_t v74;
  OSLogEventStore *v75;
  void *v76;
  _OSLogDirectoryReference *v77;
  _OSLogCollectionReference *v78;
  id v79;
  id v80;
  id v81;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  archiveURL = self->_archiveURL;
  if (!archiveURL)
  {
    _OSLogError(1);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v18 = (void *)v16;
    v4[2](v4, 0, v16);

LABEL_62:
    return;
  }
  v7 = open(-[NSURL fileSystemRepresentation](archiveURL, "fileSystemRepresentation"), 0);
  if ((_DWORD)v7 == -1)
  {
    v17 = __error();
    _OSLogPOSIXError(3, *v17);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v8 = v7;
  v9 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v7);
  v10 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v8);
  if (close(v8) == -1)
  {
    v61 = *__error();
    v15 = *__error();
    if (v61 == 9)
    {
      qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EE52EA88 = v15;
      __break(1u);
      goto LABEL_65;
    }
    _os_assumes_log();
  }
  -[NSURL URLByAppendingPathComponent:](self->_archiveURL, "URLByAppendingPathComponent:", CFSTR("timesync"));
  v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = open((const char *)objc_msgSend(v79, "fileSystemRepresentation"), 0);
  if ((_DWORD)v11 == -1)
  {
    v13 = 0;
LABEL_12:
    v19 = v5;
    v20 = self;
    objc_msgSend(v19, "setCompletedUnitCount:", objc_msgSend(v19, "completedUnitCount") + 1);
    progressHandler = (void (**)(id, _QWORD))v20->_progressHandler;

    if (progressHandler)
    {
      objc_msgSend(v19, "fractionCompleted");
      progressHandler[2](progressHandler, 0);
    }

    v22 = -[_OSLogCollectionReference initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:]([_OSLogCollectionReference alloc], "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:", v9, v13, v10);
    v81 = 0;
    v23 = -[_OSLogVersioning initWithCollection:error:]([_OSLogVersioning alloc], "initWithCollection:error:", v22, &v81);
    v24 = v81;
    v25 = v24;
    if (v23)
    {
      v76 = v5;
      v77 = v10;
      v26 = v13;
      v78 = v22;
      v27 = v9;
      v28 = v19;
      v29 = v20;
      objc_msgSend(v28, "setCompletedUnitCount:", objc_msgSend(v28, "completedUnitCount") + 1);
      v30 = (void (**)(id, _QWORD))v20->_progressHandler;

      if (v30)
      {
        objc_msgSend(v28, "fractionCompleted");
        v30[2](v30, 0);
      }

LABEL_18:
      v9 = v27;
      v13 = v26;
      while (-[_OSLogVersioning state](v23, "state") != 1)
      {
        v31 = -[_OSLogVersioning state](v23, "state");
        switch(v31)
        {
          case 3:
            upgradeHandler = (uint64_t (**)(void))v29->_upgradeHandler;
            if (!upgradeHandler || (upgradeHandler[2]() & 1) == 0)
            {
              v56 = 8;
              goto LABEL_46;
            }
            v80 = v25;
            v33 = -[_OSLogVersioning performDestructiveUpdates:](v23, "performDestructiveUpdates:", &v80);
            v34 = v80;

            v25 = v34;
            if (v33)
              goto LABEL_18;
            _OSLogPOSIXError(9, objc_msgSend(v34, "code"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, 0, (uint64_t)v35);

            v22 = v78;
            -[_OSLogCollectionReference close](v78, "close");

            v25 = v34;
            v9 = v27;
LABEL_48:
            v5 = v76;
            v10 = v77;
            goto LABEL_61;
          case 2:
            v56 = 11;
LABEL_46:
            _OSLogError(v56);
            v57 = objc_claimAutoreleasedReturnValue();
LABEL_47:
            v58 = (void *)v57;
            v4[2](v4, 0, v57);

            v22 = v78;
            -[_OSLogCollectionReference close](v78, "close");

            goto LABEL_48;
          case 0:
            _OSLogPOSIXError(10, -[_OSLogVersioning version](v23, "version"));
            v57 = objc_claimAutoreleasedReturnValue();
            goto LABEL_47;
        }
      }
      v37 = v28;
      v38 = v29;
      objc_msgSend(v37, "setCompletedUnitCount:", objc_msgSend(v37, "completedUnitCount") + 1);
      v39 = (void (**)(id, _QWORD))v20->_progressHandler;
      v75 = v38;

      if (v39)
      {
        objc_msgSend(v37, "fractionCompleted");
        v39[2](v39, 0);
      }

      v5 = v76;
      v10 = v77;
      if (!v13)
      {
        v40 = open((const char *)objc_msgSend(objc_retainAutorelease(v79), "fileSystemRepresentation"), 0);
        if ((_DWORD)v40 == -1)
        {
          v64 = __error();
          _OSLogPOSIXError(3, *v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0, (uint64_t)v65);

          -[_OSLogDirectoryReference close](v9, "close");
          -[_OSLogDirectoryReference close](v77, "close");
          v22 = v78;
LABEL_61:

          goto LABEL_62;
        }
        v13 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v40);
        v41 = -[_OSLogCollectionReference initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:]([_OSLogCollectionReference alloc], "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:", v9, v13, v77);

        v78 = v41;
      }
      -[_OSLogDirectoryReference fileDescriptor](v9, "fileDescriptor");
      v42 = _os_trace_mmap_at();
      if (v42)
      {
        v71 = v37;
        v74 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", v42, 0, &__block_literal_global_3138);
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = 0;

        if (!v43)
        {
          v55 = v44;
          _OSLogInternalError(5, v44);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0, (uint64_t)v62);

          v63 = 0;
          v22 = v78;
          -[_OSLogCollectionReference close](v78, "close");
          v54 = (void *)v74;
LABEL_59:

          v25 = v55;
          goto LABEL_60;
        }
        v69 = v44;
        v73 = v13;
        v70 = (void *)v43;
        v72 = -[_OSLogEventStoreMetadata initWithDictionary:]([_OSLogEventStoreMetadata alloc], "initWithDictionary:", v43);
        if (!v72)
        {
          v45 = (void (**)(id, void *, double))v20->_progressHandler;
          if (v45)
          {
            objc_msgSend(v71, "fractionCompleted");
            v47 = v46;
            _OSLogError(16);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v45[2](v45, v48, v47);

          }
        }
        v49 = v71;
        v50 = v75;
        objc_msgSend(v49, "setCompletedUnitCount:", objc_msgSend(v49, "completedUnitCount") + 1);
        v51 = (void (**)(id, _QWORD))v20->_progressHandler;

        if (v51)
        {
          objc_msgSend(v49, "fractionCompleted");
          v51[2](v51, 0);
        }

        v52 = _timesync_db_openat(-[_OSLogDirectoryReference fileDescriptor](v73, "fileDescriptor"), ".");
        if (!v52)
        {
          v66 = __error();
          _OSLogPOSIXError(12, *v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0, (uint64_t)v67);

          v22 = v78;
          -[_OSLogCollectionReference close](v78, "close");
          v54 = (void *)v74;
          v55 = v69;
LABEL_58:

          v13 = v73;
          v63 = v70;
          goto LABEL_59;
        }
        v53 = -[OSLogEventSource initWithCollection:metadata:timesync:]([OSLogEventSource alloc], "initWithCollection:metadata:timesync:", v78, v72, v52);
        _progress(v50, v49, 1);
        objc_msgSend(v49, "becomeCurrentWithPendingUnitCount:", 1);
        if (v50->_relativeFilePaths)
        {
          -[OSLogEventStore addFilesToSource:forCollection:withProgress:](v50, "addFilesToSource:forCollection:withProgress:", v53, v78, v49);
          v54 = (void *)v74;
          v55 = v69;
        }
        else
        {
          v68 = _enumerateArchiveIntoSource(v53, v78, v20->_progressHandler, v4);
          v54 = (void *)v74;
          v55 = v69;
          if (!v68)
          {
LABEL_57:

            v22 = v78;
            goto LABEL_58;
          }
        }
        objc_msgSend(v49, "resignCurrent");
        _progress(v50, v49, 0);
        ((void (**)(id, OSLogEventSource *, uint64_t))v4)[2](v4, v53, 0);
        goto LABEL_57;
      }
      v59 = __error();
      _OSLogPOSIXError(5, *v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, (uint64_t)v60);

      v22 = v78;
    }
    else
    {
      _OSLogPOSIXError(4, objc_msgSend(v24, "code"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, (uint64_t)v36);

    }
    -[_OSLogCollectionReference close](v22, "close");
LABEL_60:

    goto LABEL_61;
  }
  v12 = v11;
  v13 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v11);
  if (close(v12) != -1)
    goto LABEL_12;
  v14 = *__error();
  v15 = *__error();
  if (v14 != 9)
  {
    _os_assumes_log();
    goto LABEL_12;
  }
LABEL_65:
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v15;
  __break(1u);
}

- (NSURL)_archiveURL
{
  return self->_archiveURL;
}

- (void)set_archiveURL:(id)a3
{
  objc_storeStrong((id *)&self->_archiveURL, a3);
}

- (NSArray)_relativeFilePaths
{
  return self->_relativeFilePaths;
}

- (void)set_relativeFilePaths:(id)a3
{
  objc_storeStrong((id *)&self->_relativeFilePaths, a3);
}

- (void)set_progressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)_upgradeHandler
{
  return self->_upgradeHandler;
}

uint64_t __48__OSLogEventStore_prepareWithCompletionHandler___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

+ (id)localStoreWithRelativePaths:(id)a3
{
  id v3;
  OSLogEventLocalStore *v4;

  v3 = a3;
  v4 = objc_alloc_init(OSLogEventLocalStore);
  -[OSLogEventStore set_relativeFilePaths:](v4, "set_relativeFilePaths:", v3);

  return v4;
}

+ (id)storeWithArchiveURL:(id)a3
{
  id v3;
  OSLogEventStore *v4;

  v3 = a3;
  v4 = -[OSLogEventStore initWithArchiveURL:]([OSLogEventStore alloc], "initWithArchiveURL:", v3);

  return v4;
}

+ (id)storeWithFileURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasSuffix:", CFSTR(".logarchive"));

    if ((v8 & 1) != 0)
      break;
    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", v9, 0);

    objc_msgSend(v5, "removeLastObject");
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArchiveURL:relativePaths:", v10, v12);

  return v13;
}

+ (id)storeWithArchiveURL:(id)a3 relativePaths:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArchiveURL:relativePaths:", v7, v6);

  return v8;
}

@end
