@implementation _DPBlacklistServerStorage

- (_DPBlacklistServerStorage)init
{
  void *v3;
  _DPBlacklistServerStorage *v4;

  +[_DPStrings runtimeBlacklistDirectoryPath](_DPStrings, "runtimeBlacklistDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_DPBlacklistServerStorage initWithCustomStorePath:](self, "initWithCustomStorePath:", v3);

  return v4;
}

- (_DPBlacklistServerStorage)initWithCustomStorePath:(id)a3
{
  id v5;
  _DPBlacklistServerStorage *v6;
  _DPBlacklistServerStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPBlacklistServerStorage;
  v6 = -[_DPBlacklistServerStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storePath, a3);

  return v7;
}

- (BOOL)updateRuntimeBlacklistsFromServer
{
  _DPBlacklistServerStorage *v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  objc_class *v31;
  void *context;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t v38[4];
  void *v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (+[_DPDeviceInfo isDataCollectionEnabled](_DPDeviceInfo, "isDataCollectionEnabled"))
  {
    v4 = self;
    v5 = objc_sync_enter(v4);
    context = (void *)MEMORY[0x1D8256B78](v5);
    v36 = 0;
    v37 = 0;
    v35 = 0;
    v6 = -[_DPBlacklistServerStorage requestLatestBlacklistsSynchronously:error:lastRecordModifiedAt:](v4, "requestLatestBlacklistsSynchronously:error:lastRecordModifiedAt:", &v37, &v36, &v35);
    v7 = v37;
    v8 = v36;
    v9 = v35;
    if (v6)
    {
      +[_DPLog framework](_DPLog, "framework");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 138412546;
        v41 = v12;
        v42 = 2048;
        v43 = v13;
        _os_log_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_INFO, "%@: request for new blacklist files is completed (updated blacklists count: %lu)", buf, 0x16u);

      }
      v34 = 0;
      v14 = -[_DPBlacklistServerStorage prepareRuntimeBlacklistFolder:](v4, "prepareRuntimeBlacklistFolder:", &v34);
      v15 = v34;
      if (v14)
      {
        +[_DPLog framework](_DPLog, "framework");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v41 = v18;
          _os_log_impl(&dword_1D3FAA000, v16, OS_LOG_TYPE_INFO, "%@: Runtime Blacklists Folder is ready", buf, 0xCu);

        }
        -[_DPBlacklistServerStorage saveBlacklistsToRuntimeFolder:](v4, "saveBlacklistsToRuntimeFolder:", v7);
        v19 = objc_claimAutoreleasedReturnValue();
        +[_DPLog framework](_DPLog, "framework");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v23 = -[NSObject count](v19, "count");
          *(_DWORD *)buf = 138412546;
          v41 = v22;
          v42 = 2048;
          v43 = v23;
          _os_log_impl(&dword_1D3FAA000, v20, OS_LOG_TYPE_INFO, "%@: Blacklists saved to Runtime Folder, count: %lu", buf, 0x16u);

        }
        if (-[NSObject count](v19, "count"))
        {
          +[_DPLog framework](_DPLog, "framework");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPBlacklistServerStorage updateRuntimeBlacklistsFromServer].cold.1(v26, buf, v24);
          }

          +[_DPBlacklist removeBlackListsForKeys:](_DPBlacklist, "removeBlackListsForKeys:", v19);
          -[_DPBlacklistServerStorage setLastUpdateDate:](v4, "setLastUpdateDate:", v9);
        }
        +[_DPLog framework](_DPLog, "framework");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v38 = 138412290;
          v39 = v29;
          _os_log_impl(&dword_1D3FAA000, v27, OS_LOG_TYPE_INFO, "%@: blacklist files update from server is finished", v38, 0xCu);

        }
      }
      else
      {
        +[_DPLog daemon](_DPLog, "daemon");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          objc_claimAutoreleasedReturnValue();
          -[_DPBlacklistServerStorage updateRuntimeBlacklistsFromServer].cold.2();
        }
      }

    }
    else
    {
      +[_DPLog daemon](_DPLog, "daemon");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        objc_claimAutoreleasedReturnValue();
        -[_DPBlacklistServerStorage updateRuntimeBlacklistsFromServer].cold.3();
      }
      v14 = 0;
    }

    objc_autoreleasePoolPop(context);
    objc_sync_exit(v4);
  }
  else
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v4 = (_DPBlacklistServerStorage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
      -[_DPBlacklistServerStorage updateRuntimeBlacklistsFromServer].cold.4(a2, &v4->super);
    v14 = 0;
  }

  return v14;
}

- (BOOL)requestLatestBlacklistsSynchronously:(id *)a3 error:(id *)a4 lastRecordModifiedAt:(id *)a5
{
  dispatch_semaphore_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  _DPBlacklistServerStorage *v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v8 = dispatch_semaphore_create(0);
  +[_DPLog framework](_DPLog, "framework");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v53 = v11;
    _os_log_impl(&dword_1D3FAA000, v9, OS_LOG_TYPE_INFO, "%@: requesting new blacklist files from server", buf, 0xCu);

  }
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __93___DPBlacklistServerStorage_requestLatestBlacklistsSynchronously_error_lastRecordModifiedAt___block_invoke;
  v23 = &unk_1E95D91C8;
  v24 = self;
  v26 = &v46;
  v27 = &v40;
  v28 = &v34;
  v29 = &v30;
  v12 = v8;
  v25 = v12;
  -[_DPBlacklistServerStorage _requestLatestBlacklists:](self, "_requestLatestBlacklists:", &v20);
  v13 = dispatch_time(0, 600000000000);
  dispatch_semaphore_wait(v12, v13);
  if (*((_BYTE *)v31 + 24))
  {
    if (!v47[5])
    {
      *a3 = objc_retainAutorelease((id)v41[5]);
      *a5 = objc_retainAutorelease((id)v35[5]);
      v18 = 1;
      goto LABEL_12;
    }
    +[_DPLog daemon](_DPLog, "daemon", v20, v21, v22, v23, v24);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      objc_claimAutoreleasedReturnValue();
      -[_DPBlacklistServerStorage requestLatestBlacklistsSynchronously:error:lastRecordModifiedAt:].cold.2();
    }
  }
  else
  {
    +[_DPLog daemon](_DPLog, "daemon", v20, v21, v22, v23, v24);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPBlacklistServerStorage requestLatestBlacklistsSynchronously:error:lastRecordModifiedAt:].cold.1(v17, (uint64_t)buf, v14);
    }
  }

  v18 = 0;
LABEL_12:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v18;
}

- (BOOL)prepareRuntimeBlacklistFolder:(id *)a3
{
  void *v4;
  void *v5;

  -[_DPBlacklistServerStorage storePath](self, "storePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, a3);

  return (char)a3;
}

- (id)saveBlacklistsToRuntimeFolder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_DPBlacklistServerStorage storePath](self, "storePath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v7)
  {
    v8 = v7;
    v25 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.blacklist"), v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringByAppendingPathComponent:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fileURLWithPath:isDirectory:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "removeItemAtURL:error:", v15, 0);
        v27 = 0;
        LOBYTE(v14) = objc_msgSend(v5, "moveItemAtURL:toURL:error:", v11, v15, &v27);
        v16 = v27;
        +[_DPLog framework](_DPLog, "framework");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if ((v14 & 1) != 0)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v33 = v20;
            v34 = 2112;
            v35 = v10;
            _os_log_debug_impl(&dword_1D3FAA000, v18, OS_LOG_TYPE_DEBUG, "%@: blacklist for key '%@' successfully moved to runtime directory", buf, 0x16u);

          }
          objc_msgSend(v24, "addObject:", v10);
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v33 = v22;
            v34 = 2112;
            v35 = v16;
            _os_log_error_impl(&dword_1D3FAA000, v18, OS_LOG_TYPE_ERROR, "%@: Unable to move new blacklist file to runtime directory: %@", buf, 0x16u);

          }
        }
        objc_msgSend(v5, "removeItemAtURL:error:", v11, 0);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v8);
  }

  return v24;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66___DPBlacklistServerStorage_scheduleMaintenanceWithName_database___block_invoke;
  v7[3] = &unk_1E95D8FC0;
  v7[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8256D34](v7);
  +[_DPPeriodicTask taskWithName:period:handler:networkingRequired:](_DPPeriodicTask, "taskWithName:period:handler:networkingRequired:", v4, kSecondsIn24Hours, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPPeriodicTaskManager registerTask:](_DPPeriodicTaskManager, "registerTask:", v6);
}

- (NSDate)lastUpdateDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kLastUpdateDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastUpdateDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("kLastUpdateDateKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

}

- (void)_requestLatestBlacklists:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C95010]);
  -[_DPBlacklistServerStorage _predicateForFetchQuery](self, "_predicateForFetchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRecordType:predicate:", CFSTR("BlacklistRecord"), v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v7);
  -[_DPBlacklistServerStorage _attributeQueryOperation:](self, "_attributeQueryOperation:", v8);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v24 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__25;
  v21 = __Block_byref_object_dispose__26;
  v22 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke;
  v12[3] = &unk_1E95D9210;
  v12[4] = self;
  v9 = v4;
  v13 = v9;
  v14 = &v17;
  v15 = v23;
  v16 = &v25;
  v10 = MEMORY[0x1D8256D34](v12);
  v11 = (void *)v18[5];
  v18[5] = v10;

  -[_DPBlacklistServerStorage _executeQueryOperation:onOperationQueue:onCompletion:](self, "_executeQueryOperation:onOperationQueue:onCompletion:", v8, v26[5], v18[5]);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

}

- (void)_executeQueryOperation:(id)a3 onOperationQueue:(id)a4 onCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[6];
  _QWORD v20[5];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v21 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82___DPBlacklistServerStorage__executeQueryOperation_onOperationQueue_onCompletion___block_invoke;
  v19[3] = &unk_1E95D9238;
  v19[4] = self;
  v19[5] = v20;
  objc_msgSend(v8, "setRecordMatchedBlock:", v19);
  v13 = v11;
  v14 = 3221225472;
  v15 = __82___DPBlacklistServerStorage__executeQueryOperation_onOperationQueue_onCompletion___block_invoke_31;
  v16 = &unk_1E95D9260;
  v12 = v10;
  v17 = v12;
  v18 = v20;
  objc_msgSend(v8, "setQueryCompletionBlock:", &v13);
  objc_msgSend(v9, "addOperation:", v8, v13, v14, v15, v16);

  _Block_object_dispose(v20, 8);
}

- (id)_queryOperationFromCursor:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0C95038];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCursor:", v5);

  -[_DPBlacklistServerStorage _attributeQueryOperation:](self, "_attributeQueryOperation:", v6);
  return v6;
}

- (void)_attributeQueryOperation:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_opt_new();
  WeakRetained = objc_loadWeakRetained((id *)&self->_activity);
  objc_msgSend(v9, "setXpcActivity:", WeakRetained);

  objc_msgSend(v9, "setPreferAnonymousRequests:", 1);
  objc_msgSend(v9, "setDiscretionaryNetworkBehavior:", 0);
  objc_msgSend(v4, "setConfiguration:", v9);
  objc_msgSend(MEMORY[0x1E0C95088], "defaultRecordZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setZoneID:", v7);

  -[_DPBlacklistServerStorage _publicDatabaseForBlacklists](self, "_publicDatabaseForBlacklists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDatabase:", v8);

}

- (id)_blacklistURLByKeyFrom:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  objc_class *v17;
  __int128 v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = (id)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    *(_QWORD *)&v6 = 138412802;
    v19 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("key"), v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("blacklistAsset"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fileURL");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v11)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (v15)
        {
          +[_DPLog daemon](_DPLog, "daemon");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v27 = v20;
            v28 = 2112;
            v29 = v11;
            v30 = 2112;
            v31 = v12;
            _os_log_error_impl(&dword_1D3FAA000, v16, OS_LOG_TYPE_ERROR, "%@: Received wrong blacklist record from server: (key: %@, asset: %@)", buf, 0x20u);

          }
        }
        else
        {
          objc_msgSend(v21, "setObject:forKey:", v13, v11);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v7);
  }

  return v21;
}

- (id)_publicDatabaseForBlacklists
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.DPBlacklist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicCloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_predicateForFetchQuery
{
  void *v2;
  void *v3;

  -[_DPBlacklistServerStorage lastUpdateDate](self, "lastUpdateDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modificationDate > %@"), v2);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)storePath
{
  return self->_storePath;
}

- (void)setStorePath:(id)a3
{
  objc_storeStrong((id *)&self->_storePath, a3);
}

- (OS_xpc_object)activity
{
  return (OS_xpc_object *)objc_loadWeakRetained((id *)&self->_activity);
}

- (void)setActivity:(id)a3
{
  objc_storeWeak((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activity);
  objc_storeStrong((id *)&self->_storePath, 0);
}

- (void)updateRuntimeBlacklistsFromServer
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "%@: Disabled by D&U switch - skipping server deny-list update", (uint8_t *)&v4, 0xCu);

}

- (void)requestLatestBlacklistsSynchronously:(void *)a1 error:(uint64_t)a2 lastRecordModifiedAt:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = 600;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, (uint64_t)a3, "%@: Request to server was timed out (timeout in seconds: %lld)", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_3();
}

- (void)requestLatestBlacklistsSynchronously:error:lastRecordModifiedAt:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_2();
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(_QWORD *)(v3 + 14) = v2;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v6, v3, "%@: Blacklist Server responded with error: %@", v5);

  OUTLINED_FUNCTION_1_3();
}

@end
