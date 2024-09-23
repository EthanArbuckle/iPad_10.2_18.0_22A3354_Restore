@implementation ASDGatherLogsRequest

- (ASDGatherLogsRequest)initWithOptions:(id)a3
{
  id v4;
  ASDGatherLogsRequest *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *calloutQueue;
  uint64_t v10;
  ASDGatherLogsRequestOptions *options;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDGatherLogsRequest;
  v5 = -[ASDGatherLogsRequest init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDGatherLogsRequest.access", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDGatherLogsRequest.callout", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (ASDGatherLogsRequestOptions *)v10;

  }
  return v5;
}

+ (void)clearHARFiles
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  objc_opt_self();
  v2 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/%@/HTTPArchives"), CFSTR("com.apple.StoreServices"));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasSuffix:", CFSTR(".har.compressed")) & 1) != 0
          || objc_msgSend(v10, "hasSuffix:", CFSTR(".har")))
        {
          objc_msgSend(v2, "stringByAppendingPathComponent:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v7;
          objc_msgSend(v3, "removeItemAtPath:error:", v11, &v13);
          v12 = v13;

          v7 = v12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

}

- (void)createLogFileArchiveWithCompletionBlock:(id)a3
{
  ASDGatherLogsRequestOptions *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = self->_options;
  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__ASDGatherLogsRequest__sendRequestWithOptions_completionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  dispatch_async(accessQueue, v9);

}

- (void)createHARFileArchiveWithCompletionBlock:(id)a3
{
  ASDGatherLogsRequestOptions *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = self->_options;
  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__ASDGatherLogsRequest__sendHarFileRequestWithOptions_completionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  dispatch_async(accessQueue, v9);

}

- (void)gatherLogsWithCompletionBlock:(id)a3
{
  ASDGatherLogsRequestOptions *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = self->_options;
  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__ASDGatherLogsRequest__sendGatherRequestWithOptions_completionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  dispatch_async(accessQueue, v9);

}

void __47__ASDGatherLogsRequest__appstoredContainerPath__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = container_system_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v0);
    v3 = (void *)_MergedGlobals_55;
    _MergedGlobals_55 = v2;

    free(v1);
  }
}

- (id)_combineAllLogs
{
  void *v1;
  __CFString *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  FILE *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  id v43;
  id v44;
  _QWORD v45[16];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[7];

  v50[4] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(CFSTR("/var/mobile/Library/Caches/com.apple.appstored/"), "stringByAppendingPathComponent:", CFSTR("scratch"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v42 = 0;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "removeItemAtPath:error:", v1, &v42);
  v2 = CFSTR("appstored");
  v3 = v1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v3;
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("appstored"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.log"), CFSTR("appstored"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v44 = 0;
  v40 = (void *)v7;
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v44);
  v8 = v44;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/com.apple.%@/"), CFSTR("appstored"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.log"), CFSTR("appstored"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.1.log"), CFSTR("appstored"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.2.log"), CFSTR("appstored"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.3.log"), CFSTR("appstored"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v47 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v9, "stringByAppendingPathComponent:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "fileExistsAtPath:", v20))
        {
          objc_msgSend(v40, "stringByAppendingPathComponent:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v8;
          objc_msgSend(v4, "copyItemAtPath:toPath:error:", v20, v21, &v43);
          v22 = v43;

          if (v22)
          {
            v23 = (FILE *)*MEMORY[0x1E0C80C10];
            objc_msgSend(v22, "localizedDescription");
            v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            fprintf(v23, "\nError copying file: %s", (const char *)objc_msgSend(v24, "UTF8String"));

          }
          v8 = v22;
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v39);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDGatherLogsRequest _copyDB:fullSourcePath:toDir:datbaseBase:](CFSTR("itunesstored"), CFSTR("/var/mobile/Media/Downloads/"), v39, CFSTR("downloads.28"));
  if (qword_1ECFFABB8 != -1)
    dispatch_once(&qword_1ECFFABB8, &__block_literal_global_30);
  v26 = (id)_MergedGlobals_55;
  objc_msgSend(v26, "stringByAppendingPathComponent:", CFSTR("Documents"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDGatherLogsRequest _copyDB:fullSourcePath:toDir:datbaseBase:](CFSTR("appstored"), v27, v39, CFSTR("appstored"));
  -[ASDGatherLogsRequest _copyDB:fullSourcePath:toDir:datbaseBase:](CFSTR("appstored"), v27, v39, CFSTR("updates"));
  v28 = v25;
  if (BOMCopierNew())
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToMemory");
    objc_msgSend(v29, "open");
    *(_QWORD *)&v46 = CFSTR("createPKZip");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v46 + 1) = CFSTR("outputStream");
    v45[0] = v30;
    v45[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v46, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "path");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v32, "fileSystemRepresentation");
    v33 = BOMCopierCopyWithOptions();

    if (v33)
    {
      fwrite("Error copying and zipping\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      v34 = 0;
    }
    else
    {
      objc_msgSend(v29, "propertyForKey:", *MEMORY[0x1E0C99868]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      BOMCopierFree();
    }
    v35 = v38;

  }
  else
  {
    fwrite("\nCouldn't create BomCopier for zipping", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    v34 = 0;
    v35 = v38;
  }

  objc_msgSend(CFSTR("/var/mobile/Library/Caches/com.apple.appstored/"), "stringByAppendingPathComponent:", CFSTR("appstored.zip"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "writeToFile:atomically:", v36, 1);

  return v36;
}

- (void)_copyDB:(void *)a1 fullSourcePath:(void *)a2 toDir:(void *)a3 datbaseBase:(void *)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  FILE *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  _QWORD v43[5];

  v43[3] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v9;
  v33 = v7;
  objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.sqlitedb"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v41 = 0;
  v34 = (void *)v14;
  objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v41);
  v15 = v41;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.sqlitedb"), v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.sqlitedb-shm"), v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v17;
  v31 = v10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.sqlitedb-wal"), v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v19;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v8, "stringByAppendingPathComponent:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "fileExistsAtPath:", v25))
        {
          objc_msgSend(v34, "stringByAppendingPathComponent:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v15;
          objc_msgSend(v11, "copyItemAtPath:toPath:error:", v25, v26, &v36);
          v27 = v36;

          if (v27)
          {
            v28 = (FILE *)*MEMORY[0x1E0C80C10];
            objc_msgSend(v27, "localizedDescription");
            v29 = v8;
            v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            fprintf(v28, "\nError copying file: %s", (const char *)objc_msgSend(v30, "UTF8String"));

            v8 = v29;
          }

          v15 = v27;
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v21);
  }

}

- (id)_createCombinedHarFile
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  __CFString *v18;
  char v19;
  uint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[3];
  _QWORD v96[3];
  const __CFString *v97;
  void *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = a1;
  objc_opt_self();
  v2 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/%@/HTTPArchives"), CFSTR("com.apple.StoreServices"));
  objc_msgSend(*(id *)(v1 + 32), "fileName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("combined.har");
  objc_msgSend(v2, "stringByAppendingPathComponent:", v5);
  v58 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "contentsOfDirectoryAtPath:error:", v2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(v1 + 32), "verbose"))
  {
    v7 = objc_opt_class();
    NSLog(CFSTR("[%@]: Checking for %ld files in: %@"), v7, objc_msgSend(v6, "count"), v2);
  }
  v60 = v2;
  v73 = (id)objc_opt_new();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
  v71 = v1;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v92;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v92 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "hasSuffix:", CFSTR(".har.compressed")) & 1) == 0
          && !objc_msgSend(v12, "hasSuffix:", CFSTR(".har")))
        {
          goto LABEL_17;
        }
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("combined.har")) & 1) != 0)
          goto LABEL_17;
        objc_msgSend(*(id *)(v1 + 32), "fileName");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(*(id *)(v1 + 32), "fileName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v12, "isEqualToString:", v15);

          v1 = v71;
          if ((v16 & 1) != 0)
          {
LABEL_17:
            v17 = objc_msgSend(*(id *)(v1 + 32), "verbose");
            v18 = CFSTR("Skipping file: %@");
            if (!v17)
              goto LABEL_19;
LABEL_18:
            NSLog(&v18->isa, v12);
            goto LABEL_19;
          }
        }
        objc_msgSend(v73, "addObject:", v12);
        v19 = objc_msgSend(*(id *)(v1 + 32), "verbose");
        v18 = CFSTR("Including har file: %@");
        if ((v19 & 1) != 0)
          goto LABEL_18;
LABEL_19:
        ++v11;
      }
      while (v9 != v11);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
      v9 = v20;
    }
    while (v20);
  }

  v21 = (void *)objc_opt_new();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v22 = v73;
  v23 = 0x1E0C99000uLL;
  v59 = v22;
  v65 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
  v24 = 0;
  if (v65)
  {
    v64 = *(_QWORD *)v88;
    v26 = v60;
    v25 = v61;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v88 != v64)
          objc_enumerationMutation(v22);
        v69 = v27;
        objc_msgSend(v26, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v27));
        v28 = objc_claimAutoreleasedReturnValue();
        v86 = v24;
        v68 = (void *)v28;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v86;

        v85 = v30;
        v67 = (void *)v29;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v29, 0, &v85);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v85;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("log"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("entries"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(*(id *)(v1 + 32), "urlFilters");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              v62 = v31;
              v83 = 0u;
              v84 = 0u;
              v81 = 0u;
              v82 = 0u;
              v74 = v33;
              v35 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
              if (v35)
              {
                v36 = v35;
                v37 = *(_QWORD *)v82;
                v70 = *(_QWORD *)v82;
                do
                {
                  v38 = 0;
                  v72 = v36;
                  do
                  {
                    if (*(_QWORD *)v82 != v37)
                      objc_enumerationMutation(v74);
                    v39 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v38);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v40 = v33;
                      v41 = v23;
                      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("request"));
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("url"));
                      v43 = (void *)objc_claimAutoreleasedReturnValue();

                      v79 = 0u;
                      v80 = 0u;
                      v77 = 0u;
                      v78 = 0u;
                      objc_msgSend(*(id *)(v71 + 32), "urlFilters");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
                      if (v45)
                      {
                        v46 = v45;
                        v47 = *(_QWORD *)v78;
                        do
                        {
                          for (i = 0; i != v46; ++i)
                          {
                            if (*(_QWORD *)v78 != v47)
                              objc_enumerationMutation(v44);
                            if (objc_msgSend(v43, "containsString:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i)))objc_msgSend(v21, "addObject:", v39);
                          }
                          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
                        }
                        while (v46);
                      }

                      v23 = v41;
                      v33 = v40;
                      v37 = v70;
                      v36 = v72;
                    }
                    ++v38;
                  }
                  while (v38 != v36);
                  v36 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
                }
                while (v36);
              }

              v26 = v60;
              v25 = v61;
              v1 = v71;
              v22 = v59;
              v31 = v62;
            }
            else
            {
              objc_msgSend(v21, "addObjectsFromArray:", v33);
            }
          }

        }
        v76 = v66;
        objc_msgSend(v25, "removeItemAtPath:error:", v68, &v76);
        v49 = v31;
        v24 = v76;

        v27 = v69 + 1;
      }
      while (v69 + 1 != v65);
      v65 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
    }
    while (v65);
  }
  else
  {
    v26 = v60;
  }

  v96[2] = v21;
  v97 = CFSTR("log");
  v95[0] = CFSTR("version");
  v95[1] = CFSTR("creator");
  v96[0] = CFSTR("1.2");
  v96[1] = &unk_1E37E33B0;
  v95[2] = CFSTR("entries");
  objc_msgSend(*(id *)(v23 + 3456), "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v50;
  objc_msgSend(*(id *)(v23 + 3456), "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v24;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v51, 0, &v75);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v75;

  if (v53)
  {
    v54 = objc_opt_class();
    NSLog(CFSTR("[%@]: Error merging har file: %@"), v54, v53);
    v55 = (void *)v58;
  }
  else
  {
    v55 = (void *)v58;
    if (objc_msgSend(*(id *)(v1 + 32), "verbose"))
    {
      v56 = objc_opt_class();
      NSLog(CFSTR("[%@]: Created merged har file: %@"), v56, v58);
    }
  }
  objc_msgSend(v52, "writeToFile:atomically:", v55, 1);

  return v55;
}

void __70__ASDGatherLogsRequest__sendGatherRequestWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  -[ASDGatherLogsRequest _combineAllLogs](*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDGatherLogsRequest _createCombinedHarFile](*(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ASDGatherLogsRequest__sendGatherRequestWithOptions_completionBlock___block_invoke_2;
  block[3] = &unk_1E37BDF10;
  v10 = v3;
  v11 = v4;
  v9 = v2;
  v6 = v3;
  v7 = v2;
  dispatch_async(v5, block);

}

uint64_t __70__ASDGatherLogsRequest__sendGatherRequestWithOptions_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 1, a1[4], a1[5], 0);
}

void __64__ASDGatherLogsRequest__sendRequestWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  -[ASDGatherLogsRequest _combineAllLogs](*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__ASDGatherLogsRequest__sendRequestWithOptions_completionBlock___block_invoke_2;
  v6[3] = &unk_1E37BDCC0;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __64__ASDGatherLogsRequest__sendRequestWithOptions_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32), 0);
}

void __71__ASDGatherLogsRequest__sendHarFileRequestWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  -[ASDGatherLogsRequest _createCombinedHarFile](*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__ASDGatherLogsRequest__sendHarFileRequestWithOptions_completionBlock___block_invoke_2;
  v6[3] = &unk_1E37BDCC0;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __71__ASDGatherLogsRequest__sendHarFileRequestWithOptions_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
