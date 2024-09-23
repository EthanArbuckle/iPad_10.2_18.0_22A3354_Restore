@implementation CPLStatus

- (CPLStatus)initWithClientLibraryBaseURL:(id)a3
{
  id v4;
  CPLStatus *v5;
  uint64_t v6;
  NSURL *statusFileURL;
  dispatch_queue_t v8;
  OS_dispatch_queue *lock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLStatus;
  v5 = -[CPLStatus init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("syncstatus.plist"));
    v6 = objc_claimAutoreleasedReturnValue();
    statusFileURL = v5->_statusFileURL;
    v5->_statusFileURL = (NSURL *)v6;

    v8 = dispatch_queue_create("com.apple.cpl.status", 0);
    lock = v5->_lock;
    v5->_lock = (OS_dispatch_queue *)v8;

  }
  return v5;
}

- (CPLStatus)initWithClientLibraryBaseURLForCPLEngine:(id)a3
{
  CPLStatus *result;

  result = -[CPLStatus initWithClientLibraryBaseURL:](self, "initWithClientLibraryBaseURL:", a3);
  if (result)
    result->_forCPL = 1;
  return result;
}

- (void)_setObjectInStatus:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSMutableSet *changedKeys;
  NSMutableSet *v10;
  NSMutableSet *v11;
  NSMutableDictionary *status;
  unint64_t v13;

  v13 = (unint64_t)a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_status, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v13 && v7)
  {
    if ((objc_msgSend((id)v7, "isEqual:", v13) & 1) != 0)
      goto LABEL_11;
  }
  else if (!(v13 | v7))
  {
    goto LABEL_11;
  }
  changedKeys = self->_changedKeys;
  if (!changedKeys)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = self->_changedKeys;
    self->_changedKeys = v10;

    changedKeys = self->_changedKeys;
  }
  -[NSMutableSet addObject:](changedKeys, "addObject:", v6);
  status = self->_status;
  if (v13)
    -[NSMutableDictionary setObject:forKeyedSubscript:](status, "setObject:forKeyedSubscript:", v13, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](status, "removeObjectForKey:", v6);
LABEL_11:

}

- (id)_statusClient
{
  __CFString *v2;
  CPLStatusDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  objc_class *v6;

  if (self->_forCPL)
  {
    v2 = CFSTR("Engine");
  }
  else
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)p_delegate);
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processName");
    }
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)_loadIfNecessary
{
  NSMutableDictionary **p_status;
  id v4;
  NSURL *statusFileURL;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  CPLStatus *v12;
  void *v13;
  CPLStatus *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  CPLStatus *v25;
  void *v26;
  NSMutableDictionary *status;
  id v28;
  uint8_t buf[4];
  CPLStatus *v30;
  __int16 v31;
  CPLStatus *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  NSMutableDictionary *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  p_status = &self->_status;
  if (!self->_status)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E08]);
    statusFileURL = self->_statusFileURL;
    v28 = 0;
    v6 = (void *)objc_msgSend(v4, "initWithContentsOfURL:error:", statusFileURL, &v28);
    v7 = (NSMutableDictionary *)v28;
    if (v6)
    {
      objc_storeStrong((id *)p_status, v6);
      -[NSMutableDictionary objectForKeyedSubscript:](*p_status, "objectForKeyedSubscript:", CFSTR("syncSessionMetrics"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (self->_forCPL)
        {
          -[CPLStatus _setObjectInStatus:forKey:](self, "_setObjectInStatus:forKey:", 0, CFSTR("syncSessionMetrics"));
          -[CPLStatus _save](self, "_save");
        }
        else
        {
          -[NSMutableDictionary removeObjectForKey:](*p_status, "removeObjectForKey:", CFSTR("syncSessionMetrics"));
        }
      }
      -[NSMutableDictionary objectForKeyedSubscript:](*p_status, "objectForKeyedSubscript:", CFSTR("initialSyncDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[NSURL URLByDeletingLastPathComponent](self->_statusFileURL, "URLByDeletingLastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLByAppendingPathComponent:", CFSTR("initialsync_marker"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfURL:encoding:error:", v20, 4, 0);
        if (v21)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v22, "setDateFormat:", CFSTR("yyyy-MM-dd HH.mm.ss.SSS"));
          objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setLocale:", v23);

          objc_msgSend(v22, "dateFromString:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            if (self->_forCPL)
            {
              -[CPLStatus _setObjectInStatus:forKey:](self, "_setObjectInStatus:forKey:", v24, CFSTR("initialSyncDate"));
              -[CPLStatus _save](self, "_save");
            }
            else
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](*p_status, "setObject:forKeyedSubscript:", v24, CFSTR("initialSyncDate"));
            }
          }

        }
      }
      if (self->_forCPL | _CPLSilentLogging)
        goto LABEL_28;
      __CPLStatusOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLStatus _statusClient](self, "_statusClient");
        v25 = (CPLStatus *)objc_claimAutoreleasedReturnValue();
        -[NSURL path](self->_statusFileURL, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        status = self->_status;
        *(_DWORD *)buf = 138413058;
        v30 = v25;
        v31 = 2048;
        v32 = self;
        v33 = 2112;
        v34 = v26;
        v35 = 2112;
        v36 = status;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "%@ read CPLStatus %p at %@: %@", buf, 0x2Au);

      }
LABEL_27:

LABEL_28:
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cplIsFileDoesNotExistError:", v7);

    if ((v10 & 1) != 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStatusOSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[NSURL path](self->_statusFileURL, "path");
          v12 = (CPLStatus *)objc_claimAutoreleasedReturnValue();
          -[CPLStatus _statusClient](self, "_statusClient");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v30 = self;
          v31 = 2112;
          v32 = v12;
          v33 = 2112;
          v34 = v13;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "CPLStatus %p at %@ for %@ does not exist - starting empty", buf, 0x20u);

        }
LABEL_13:

      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLStatusOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[CPLStatus _statusClient](self, "_statusClient");
        v14 = (CPLStatus *)objc_claimAutoreleasedReturnValue();
        -[NSURL path](self->_statusFileURL, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v30 = v14;
        v31 = 2048;
        v32 = self;
        v33 = 2112;
        v34 = v15;
        v35 = 2112;
        v36 = v7;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "%@ failed to read CPLStatus %p at %@: %@", buf, 0x2Au);

      }
      goto LABEL_13;
    }
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = *p_status;
    *p_status = v16;
    goto LABEL_27;
  }
}

- (void)_save
{
  NSMutableSet *changedKeys;
  NSMutableDictionary *status;
  NSObject *v5;
  NSURL *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSURL *statusFileURL;
  char v12;
  id v13;
  NSObject *v14;
  NSURL *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v17;
  uint8_t buf[4];
  NSURL *v19;
  __int16 v20;
  CPLStatus *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  NSMutableDictionary *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  changedKeys = self->_changedKeys;
  if (changedKeys)
  {
    status = self->_status;
    if (status)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStatusOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          -[CPLStatus _statusClient](self, "_statusClient");
          v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet allObjects](self->_changedKeys, "allObjects");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURL path](self->_statusFileURL, "path");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = self->_status;
          *(_DWORD *)buf = 138413314;
          v19 = v6;
          v20 = 2048;
          v21 = self;
          v22 = 2112;
          v23 = v8;
          v24 = 2112;
          v25 = v9;
          v26 = 2112;
          v27 = v10;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "%@ saving CPLStatus %p (changed keys: %@) to %@: %@", buf, 0x34u);

        }
        status = self->_status;
      }
      statusFileURL = self->_statusFileURL;
      v17 = 0;
      v12 = -[NSMutableDictionary writeToURL:error:](status, "writeToURL:error:", statusFileURL, &v17);
      v13 = v17;
      if ((v12 & 1) == 0 && !_CPLSilentLogging)
      {
        __CPLStatusOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = self->_statusFileURL;
          *(_DWORD *)buf = 134218498;
          v19 = v15;
          v20 = 2112;
          v21 = self;
          v22 = 2112;
          v23 = v13;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Failed to save CPLStatus %p to %@: %@", buf, 0x20u);
        }

      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)_CPLStatusDidChangeNotification, 0, 0, 0);

      changedKeys = self->_changedKeys;
    }
    self->_changedKeys = 0;

  }
}

- (BOOL)_writeInitialSyncMarkerForDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_status, "objectForKeyedSubscript:", CFSTR("exitDeleteTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (_CPLSilentLogging)
    {
      v12 = 1;
      goto LABEL_8;
    }
    __CPLStatusOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Not writing initial sync marker because the engine is in exit mode", buf, 2u);
    }
  }
  else
  {
    -[NSURL URLByDeletingLastPathComponent](self->_statusFileURL, "URLByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("initialsync_marker"));
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "cplFileExistsAtURL:", v8);

    if ((v11 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStatusOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject path](v8, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Writing initial sync marker at %@", buf, 0xCu);

        }
      }
      v16 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v16, "setDateFormat:", CFSTR("yyyy-MM-dd HH.mm.ss.SSS"));
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLocale:", v17);

      objc_msgSend(v16, "stringFromDate:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v12 = objc_msgSend(v18, "writeToURL:atomically:encoding:error:", v8, 1, 4, &v22);
      v19 = v22;

      if ((v12 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStatusOSLogDomain();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            -[NSObject path](v8, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v24 = v21;
            v25 = 2112;
            v26 = v19;
            _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Failed to write initial sync marker at %@: %@", buf, 0x16u);

          }
        }
        if (a4)
          *a4 = objc_retainAutorelease(v19);
      }

      goto LABEL_7;
    }
  }
  v12 = 1;
LABEL_7:

LABEL_8:
  return v12;
}

- (BOOL)writeInitialSyncMarker:(id *)a3
{
  NSObject *lock;
  int v5;
  BOOL v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5707;
  v13 = __Block_byref_object_dispose__5708;
  v14 = 0;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CPLStatus_writeInitialSyncMarker___block_invoke;
  block[3] = &unk_1E60DD460;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(lock, block);
  v5 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((_BYTE *)v16 + 24))
  {
    *a3 = objc_retainAutorelease((id)v10[5]);
    v5 = *((unsigned __int8 *)v16 + 24);
  }
  v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)_deleteInitialSyncMarkerWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSURL URLByDeletingLastPathComponent](self->_statusFileURL, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("initialsync_marker"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cplFileExistsAtURL:", v5);

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStatusOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Removing initial sync marker at %@", (uint8_t *)&v13, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "removeItemAtURL:error:", v5, a3);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)checkInitialSyncMarker
{
  NSObject *lock;
  _QWORD block[5];

  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CPLStatus_checkInitialSyncMarker__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_sync(lock, block);
}

- (void)refetchFromDisk
{
  uint64_t v2;
  OS_dispatch_queue *lock;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__CPLStatus_refetchFromDisk__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_5746;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = lock;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (NSDate)lastSuccessfulSyncDate
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CPLStatus_lastSuccessfulSyncDate__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (void)setLastSuccessfulSyncDate:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CPLStatus_setLastSuccessfulSyncDate___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (NSDate)lastCompletePrefetchDate
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CPLStatus_lastCompletePrefetchDate__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (void)setLastCompletePrefetchDate:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CPLStatus_setLastCompletePrefetchDate___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (NSDate)lastPruneDate
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__CPLStatus_lastPruneDate__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (void)setLastPruneDate:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CPLStatus_setLastPruneDate___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (BOOL)hasFinishedInitialDownload
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CPLStatus_hasFinishedInitialDownload__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDate)initialSyncDate
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__CPLStatus_initialSyncDate__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (void)setInitialSyncDate:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CPLStatus_setInitialSyncDate___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (NSDate)initialDownloadDate
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__CPLStatus_initialDownloadDate__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (void)setInitialDownloadDate:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CPLStatus_setInitialDownloadDate___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (BOOL)hasChangesToProcess
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__CPLStatus_hasChangesToProcess__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setHasChangesToProcess:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__CPLStatus_setHasChangesToProcess___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)isExceedingQuota
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_isExceedingQuota__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsExceedingQuota:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__CPLStatus_setIsExceedingQuota___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)isExceedingSharedLibraryQuota
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CPLStatus_isExceedingSharedLibraryQuota__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CPLStatus_setIsExceedingSharedLibraryQuota___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (unint64_t)estimatedCountOfRemainingRecordsDuringSharedLibraryExit
{
  NSObject *lock;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__CPLStatus_estimatedCountOfRemainingRecordsDuringSharedLibraryExit__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:(unint64_t)a3
{
  NSObject *lock;
  _QWORD v4[6];

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__CPLStatus_setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit___block_invoke;
  v4[3] = &unk_1E60D6DF8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(lock, v4);
}

- (int64_t)busyState
{
  NSObject *lock;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__CPLStatus_busyState__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setBusyState:(int64_t)a3
{
  NSObject *lock;
  _QWORD v4[6];

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__CPLStatus_setBusyState___block_invoke;
  v4[3] = &unk_1E60D6DF8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)isBlockedBySnapshot
{
  return -[CPLStatus busyState](self, "busyState") == 2;
}

- (NSDate)exitDeleteTime
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__CPLStatus_exitDeleteTime__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (void)setExitDeleteTime:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CPLStatus_setExitDeleteTime___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (BOOL)iCloudLibraryHasBeenWiped
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__CPLStatus_iCloudLibraryHasBeenWiped__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setICloudLibraryHasBeenWiped:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CPLStatus_setICloudLibraryHasBeenWiped___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)iCloudLibraryExists
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__CPLStatus_iCloudLibraryExists__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setICloudLibraryExists:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__CPLStatus_setICloudLibraryExists___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)containerHasBeenWiped
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CPLStatus_containerHasBeenWiped__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setContainerHasBeenWiped:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__CPLStatus_setContainerHasBeenWiped___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)iCloudLibraryClientVersionTooOld
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CPLStatus_iCloudLibraryClientVersionTooOld__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setICloudLibraryClientVersionTooOld:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__CPLStatus_setICloudLibraryClientVersionTooOld___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)iCloudLibraryClientIsNotAuthenticated
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__CPLStatus_iCloudLibraryClientIsNotAuthenticated__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setICloudLibraryClientIsNotAuthenticated:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__CPLStatus_setICloudLibraryClientIsNotAuthenticated___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)isStuckInExitForSharedLibrary
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CPLStatus_isStuckInExitForSharedLibrary__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsStuckInExitForSharedLibrary:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CPLStatus_setIsStuckInExitForSharedLibrary___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)isWalrusEnabled
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__CPLStatus_isWalrusEnabled__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setWalrusEnabled:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__CPLStatus_setWalrusEnabled___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)isKeychainCDPEnabled
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_isKeychainCDPEnabled__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setKeychainCDPEnabled:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__CPLStatus_setKeychainCDPEnabled___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CPLStatus_isUpgradeSuggestedToAccessAllPhotos__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
  NSObject *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CPLStatus_setUpgradeSuggestedToAccessAllPhotos___block_invoke;
  v4[3] = &unk_1E60DC878;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(lock, v4);
}

- (int64_t)serverFeatureCompatibleVersion
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  NSObject *lock;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("CPLSimulatedServerFeatureCompatibleVersion"));

  v12 = v4;
  v5 = v10[3];
  if (v5 <= 0)
  {
    lock = self->_lock;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__CPLStatus_serverFeatureCompatibleVersion__block_invoke;
    v8[3] = &unk_1E60DC8A0;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(lock, v8);
    v5 = v10[3];
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)setServerFeatureCompatibleVersion:(int64_t)a3
{
  NSObject *lock;
  _QWORD v4[6];

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CPLStatus_setServerFeatureCompatibleVersion___block_invoke;
  v4[3] = &unk_1E60D6DF8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(lock, v4);
}

- (int64_t)clientFeatureCompatibleVersion
{
  return 20220;
}

- (NSDictionary)cloudAssetCountPerType
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CPLStatus_cloudAssetCountPerType__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)setCloudAssetCountPerType:(id)a3 updateCheckDate:(BOOL)a4
{
  void *v6;
  NSObject *lock;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = (void *)objc_msgSend(a3, "copy");
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CPLStatus_setCloudAssetCountPerType_updateCheckDate___block_invoke;
  block[3] = &unk_1E60DC110;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(lock, block);

}

- (NSDate)cloudAssetCountPerTypeLastCheckDate
{
  NSObject *lock;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5707;
  v13 = __Block_byref_object_dispose__5708;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__CPLStatus_cloudAssetCountPerTypeLastCheckDate__block_invoke;
  v8[3] = &unk_1E60DC8A0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(lock, v8);
  v3 = (void *)v10[5];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v10[5];
    v10[5] = v4;

    v3 = (void *)v10[5];
  }
  v6 = v3;
  _Block_object_dispose(&v9, 8);

  return (NSDate *)v6;
}

- (void)_statusDidChange
{
  uint64_t v2;
  OS_dispatch_queue *lock;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__CPLStatus__statusDidChange__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_5746;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = lock;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)setDelegate:(id)a3
{
  id v5;
  NSObject *lock;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CPLStatus_setDelegate___block_invoke;
  block[3] = &unk_1E60D6E20;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_sync(lock, block);

}

- (id)statusDescription
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CPLStatus_statusDescription__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setHasCellularBudget:(BOOL)a3 hasBatteryBudget:(BOOL)a4 hasLowBatteryLevel:(BOOL)a5 isConstrainedNetwork:(BOOL)a6 isBlockedByLowPowerMode:(BOOL)a7 hasHeavyResourceUsage:(BOOL)a8 hasPoorNetworkQuality:(BOOL)a9 hasModerateThermalPressure:(BOOL)a10 hasThermalPressure:(BOOL)a11 hasPoorSystemConditions:(BOOL)a12 isBudgetValid:(BOOL)a13 blockedReason:(int64_t)a14 unBlockedReason:(int64_t)a15
{
  NSObject *lock;
  _QWORD block[7];
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;

  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __273__CPLStatus_setHasCellularBudget_hasBatteryBudget_hasLowBatteryLevel_isConstrainedNetwork_isBlockedByLowPowerMode_hasHeavyResourceUsage_hasPoorNetworkQuality_hasModerateThermalPressure_hasThermalPressure_hasPoorSystemConditions_isBudgetValid_blockedReason_unBlockedReason___block_invoke;
  block[3] = &unk_1E60D88B8;
  v17 = a13;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  block[4] = self;
  block[5] = a14;
  block[6] = a15;
  dispatch_sync(lock, block);
}

- (BOOL)hasValidSystemBudget
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_hasValidSystemBudget__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasCellularBudget
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CPLStatus_hasCellularBudget__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasBatteryBudget
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_hasBatteryBudget__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isConnectedToNetwork
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_isConnectedToNetwork__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCellularRestricted
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_isCellularRestricted__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInAirplaneMode
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_isInAirplaneMode__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasLowBatteryLevel
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__CPLStatus_hasLowBatteryLevel__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isConstrainedNetwork
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_isConstrainedNetwork__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBlockedByLowPowerMode
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__CPLStatus_isBlockedByLowPowerMode__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasHeavyResourceUsage
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CPLStatus_hasHeavyResourceUsage__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasPoorNetworkQuality
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CPLStatus_hasPoorNetworkQuality__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasModerateThermalPressure
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CPLStatus_hasModerateThermalPressure__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasThermalPressure
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__CPLStatus_hasThermalPressure__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasPoorSystemConditions
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__CPLStatus_hasPoorSystemConditions__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)blockedReason
{
  NSObject *lock;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__CPLStatus_blockedReason__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)unBlockedReason
{
  NSObject *lock;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__CPLStatus_unBlockedReason__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setConnectedToNetwork:(BOOL)a3 cellularIsRestricted:(BOOL)a4 inAirplaneMode:(BOOL)a5
{
  NSObject *lock;
  _QWORD v6[5];
  BOOL v7;
  BOOL v8;
  BOOL v9;

  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CPLStatus_setConnectedToNetwork_cellularIsRestricted_inAirplaneMode___block_invoke;
  v6[3] = &unk_1E60D88E0;
  v6[4] = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_sync(lock, v6);
}

- (BOOL)lowDiskSpace
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__CPLStatus_lowDiskSpace__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)veryLowDiskSpace
{
  NSObject *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_veryLowDiskSpace__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLowDiskSpace:(BOOL)a3 veryLowDiskSpace:(BOOL)a4
{
  NSObject *lock;
  _QWORD v5[5];
  BOOL v6;
  BOOL v7;

  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__CPLStatus_setLowDiskSpace_veryLowDiskSpace___block_invoke;
  v5[3] = &unk_1E60DB240;
  v5[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_sync(lock, v5);
}

- (CPLAccountFlags)accountFlags
{
  void *v2;
  CPLAccountFlags *v3;

  -[CPLStatus accountFlagsData](self, "accountFlagsData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[CPLAccountFlags initWithData:]([CPLAccountFlags alloc], "initWithData:", v2);
  else
    v3 = 0;

  return v3;
}

- (NSData)accountFlagsData
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_accountFlagsData__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

- (void)setAccountFlagsData:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CPLStatus_setAccountFlagsData___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (NSArray)disabledFeatures
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5707;
  v10 = __Block_byref_object_dispose__5708;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_disabledFeatures__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)setDisabledFeatures:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {

    v4 = 0;
  }
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CPLStatus_setDisabledFeatures___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (void)preventDelegateWithDelegationClass:(id)a3 selector:(SEL)a4
{
  objc_storeStrong((id *)&self->_delegationProtocol, a3);
  self->_delegationSelector = a4;
}

- (CPLStatusDelegate)delegate
{
  return (CPLStatusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegationProtocol, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_statusFileURL, 0);
  objc_storeStrong((id *)&self->_changedKeys, 0);
}

void __33__CPLStatus_setDisabledFeatures___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("disabledFeatures"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = v2 == 0;
  else
    v4 = 1;
  v6 = (id)v2;
  if (v4)
  {
    if (!(v3 | v2))
      goto LABEL_11;
    goto LABEL_10;
  }
  v5 = objc_msgSend((id)v3, "isEqual:", v2);
  if ((v5 & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v3, CFSTR("disabledFeatures"));
    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
LABEL_11:

}

void __29__CPLStatus_disabledFeatures__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("disabledFeatures"));
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v2;
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);

}

void __33__CPLStatus_setAccountFlagsData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("accountFlags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  if (v2)
  {
    if (!v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", 0, CFSTR("accountFlags"));
      goto LABEL_9;
    }
    if ((objc_msgSend(v2, "isEqual:") & 1) == 0)
    {
      v4 = *(void **)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
LABEL_7:
      objc_msgSend(v4, "_setObjectInStatus:forKey:", v3, CFSTR("accountFlags"));
      objc_msgSend(*(id *)(a1 + 32), "_save");
    }
  }
  else if (v3)
  {
    v4 = *(void **)(a1 + 32);
    goto LABEL_7;
  }
LABEL_9:

}

void __29__CPLStatus_accountFlagsData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("accountFlags"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46__CPLStatus_setLowDiskSpace_veryLowDiskSpace___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("lowDiskSpace"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("veryLowDiskSpace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v4, "BOOLValue");

  if (__PAIR64__(*(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 40)) != __PAIR64__(v2, v3))
  {
    v5 = MEMORY[0x1E0C9AAB0];
    if (*(_BYTE *)(a1 + 40))
      v6 = MEMORY[0x1E0C9AAB0];
    else
      v6 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v6, CFSTR("lowDiskSpace"));
    if (*(_BYTE *)(a1 + 41))
      v7 = v5;
    else
      v7 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v7, CFSTR("veryLowDiskSpace"));
    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __29__CPLStatus_veryLowDiskSpace__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("veryLowDiskSpace"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __25__CPLStatus_lowDiskSpace__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("lowDiskSpace"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __71__CPLStatus_setConnectedToNetwork_cellularIsRestricted_inAirplaneMode___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("connectedToNetwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v2;
  if (v2)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("cellularIsRestricted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("inAirplaneMode"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v4)
  {
    v7 = 0;
    if (v5)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v7 = objc_msgSend(v4, "BOOLValue");
  if (!v6)
    goto LABEL_8;
LABEL_6:
  v8 = objc_msgSend(v6, "BOOLValue");
LABEL_9:
  v9 = *(unsigned __int8 *)(a1 + 40);
  if (__PAIR64__(v7, v3) != __PAIR64__(*(unsigned __int8 *)(a1 + 41), v9) || v8 != *(unsigned __int8 *)(a1 + 42))
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9 != 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setObjectInStatus:forKey:", v11, CFSTR("connectedToNetwork"));

    if (*(_BYTE *)(a1 + 41))
      v12 = MEMORY[0x1E0C9AAB0];
    else
      v12 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v12, CFSTR("cellularIsRestricted"));
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 42));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setObjectInStatus:forKey:", v14, CFSTR("inAirplaneMode"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }

}

void __28__CPLStatus_unBlockedReason__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("unBlockedReason"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "integerValue");

}

void __26__CPLStatus_blockedReason__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("blockedReason"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "integerValue");

}

void __36__CPLStatus_hasPoorSystemConditions__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("poorSystemConditions"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __31__CPLStatus_hasThermalPressure__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("thermalPressure"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __39__CPLStatus_hasModerateThermalPressure__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("moderateThermalPressure"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __34__CPLStatus_hasPoorNetworkQuality__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("poorNetworkQuality"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __34__CPLStatus_hasHeavyResourceUsage__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("heavyResourceUsage"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __36__CPLStatus_isBlockedByLowPowerMode__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("isBlockedByLowPowerModeKey"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __33__CPLStatus_isConstrainedNetwork__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("constrainedNetwork"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __31__CPLStatus_hasLowBatteryLevel__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("lowBatteryLevel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("lowBatteryLevel"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "BOOLValue");

  }
}

void __29__CPLStatus_isInAirplaneMode__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("inAirplaneMode"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __33__CPLStatus_isCellularRestricted__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("cellularIsRestricted"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __33__CPLStatus_isConnectedToNetwork__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", CFSTR("connectedToNetwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");
    v2 = v3;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __29__CPLStatus_hasBatteryBudget__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("hasValidSystemBudgetKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("hasBatteryBudgetKey"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "BOOLValue");

  }
}

void __30__CPLStatus_hasCellularBudget__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("hasValidSystemBudgetKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("hasCellularBudgetKey"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "BOOLValue");

  }
}

void __33__CPLStatus_hasValidSystemBudget__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("hasValidSystemBudgetKey"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

uint64_t __273__CPLStatus_setHasCellularBudget_hasBatteryBudget_hasLowBatteryLevel_isConstrainedNetwork_isBlockedByLowPowerMode_hasHeavyResourceUsage_hasPoorNetworkQuality_hasModerateThermalPressure_hasThermalPressure_hasPoorSystemConditions_isBudgetValid_blockedReason_unBlockedReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setObjectInStatus:forKey:", v3, CFSTR("hasValidSystemBudgetKey"));

  if (*(_BYTE *)(a1 + 57))
    v4 = MEMORY[0x1E0C9AAB0];
  else
    v4 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v4, CFSTR("hasCellularBudgetKey"));
  if (*(_BYTE *)(a1 + 58))
    v5 = MEMORY[0x1E0C9AAB0];
  else
    v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v5, CFSTR("hasBatteryBudgetKey"));
  if (*(_BYTE *)(a1 + 59))
    v6 = MEMORY[0x1E0C9AAB0];
  else
    v6 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v6, CFSTR("lowBatteryLevel"));
  if (*(_BYTE *)(a1 + 60))
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v7, CFSTR("constrainedNetwork"));
  if (*(_BYTE *)(a1 + 61))
    v8 = MEMORY[0x1E0C9AAB0];
  else
    v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v8, CFSTR("isBlockedByLowPowerModeKey"));
  if (*(_BYTE *)(a1 + 62))
    v9 = MEMORY[0x1E0C9AAB0];
  else
    v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v9, CFSTR("heavyResourceUsage"));
  if (*(_BYTE *)(a1 + 63))
    v10 = MEMORY[0x1E0C9AAB0];
  else
    v10 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v10, CFSTR("poorNetworkQuality"));
  if (*(_BYTE *)(a1 + 64))
    v11 = MEMORY[0x1E0C9AAB0];
  else
    v11 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v11, CFSTR("moderateThermalPressure"));
  if (*(_BYTE *)(a1 + 65))
    v12 = MEMORY[0x1E0C9AAB0];
  else
    v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v12, CFSTR("thermalPressure"));
  if (*(_BYTE *)(a1 + 66))
    v13 = MEMORY[0x1E0C9AAB0];
  else
    v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v13, CFSTR("poorSystemConditions"));
  v14 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setObjectInStatus:forKey:", v15, CFSTR("blockedReason"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", 0, CFSTR("blockedReason"));
  }
  v16 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setObjectInStatus:forKey:", v17, CFSTR("unBlockedReason"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", 0, CFSTR("unBlockedReason"));
  }
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __30__CPLStatus_statusDescription__block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  unint64_t v15;
  id v16;
  CPLAccountFlags *v17;
  CPLAccountFlags *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v1 = a1;
  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "count"))
  {
    v2 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v5;
    v31 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (!v31)
      goto LABEL_25;
    v6 = CFSTR("accountFlags");
    v7 = *(_QWORD *)v33;
    v8 = 0x1E0CB3000;
    v28 = v3;
    while (1)
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v6))
        {
          v12 = v1;
          v13 = v7;
          v14 = v6;
          v15 = v2;
          v16 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (v17 = -[CPLAccountFlags initWithData:]([CPLAccountFlags alloc], "initWithData:", v16)) != 0)
          {
            v18 = v17;
            -[CPLAccountFlags dictionaryRepresentation](v17, "dictionaryRepresentation");
            v19 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v19 = v16;
          }
          v2 = v15;

          v6 = v14;
          v7 = v13;
          v1 = v12;
          v3 = v28;
        }
        else
        {
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("cloudAssetCountPerType")))
            goto LABEL_19;
          v20 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v20, "count"));
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __valueForDictionaryOfCounts_block_invoke;
            v36[3] = &unk_1E60DD138;
            v19 = v21;
            v37 = v19;
            objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v36);

          }
          else
          {
            v19 = v20;
          }

        }
        v11 = v19;
        v8 = 0x1E0CB3000uLL;
LABEL_19:
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("serverFeatureCompatibleVersion")))
        {
          objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", CFSTR("clientFeatureCompatibleVersion = %ld"), objc_msgSend(*(id *)(v1 + 32), "clientFeatureCompatibleVersion"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v22);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v11, v29);
          v23 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v23;
        }
        objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", CFSTR("%@ = %@"), v10, v11);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v24);

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (!v31)
      {
LABEL_25:

        objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        return;
      }
    }
  }
}

void __25__CPLStatus_setDelegate___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  id v3;
  id WeakRetained;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v6;
  __CFNotificationCenter *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (*(_QWORD *)(v2 + 48))
  {
    v3 = (id)a1[5];
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 64));

      if (v3 != WeakRetained)
      {
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v12 = a1[4];
            v11 = a1[5];
            NSStringFromProtocol(*(Protocol **)(v12 + 48));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1[4] + 56));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v24 = v11;
            v25 = 2112;
            v26 = v12;
            v27 = 2112;
            v28 = v13;
            v29 = 2112;
            v30 = v14;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Tried to set delegate %@ on protected %@ - status changes should be observed through -[%@ %@]", buf, 0x2Au);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = a1[6];
        v17 = a1[4];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLStatus.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = a1[4];
        v19 = a1[5];
        NSStringFromProtocol(*(Protocol **)(v20 + 48));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1[4] + 56));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, v18, 825, CFSTR("Tried to set delegate %@ on protected %@ - status changes should be observed through -[%@ %@]"), v19, v20, v21, v22);

        abort();
      }
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)a1[4], (CFNotificationName)_CPLStatusDidChangeNotification, 0);
  objc_storeWeak((id *)(a1[4] + 64), (id)a1[5]);
  v6 = objc_loadWeakRetained((id *)(a1[4] + 64));

  if (v6)
  {
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, (const void *)a1[4], (CFNotificationCallback)_statusDidChange, (CFStringRef)_CPLStatusDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1026);
    v8 = a1[4];
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

  }
}

void __29__CPLStatus__statusDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__CPLStatus__statusDidChange__block_invoke_2;
  v7[3] = &unk_1E60D65B8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v5 = v7;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_5746;
  block[3] = &unk_1E60D71F8;
  v9 = v5;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __29__CPLStatus__statusDidChange__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "statusDidChange:", *(_QWORD *)(a1 + 32));

}

void __48__CPLStatus_cloudAssetCountPerTypeLastCheckDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("cloudAssetCountPerTypeLastCheckDate"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __55__CPLStatus_setCloudAssetCountPerType_updateCheckDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("cloudAssetCountPerType"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  v7 = (id)v2;
  if (!v4)
  {
    if ((objc_msgSend((id)v2, "isEqual:") & 1) != 0)
      goto LABEL_11;
    v3 = *(_QWORD *)(a1 + 40);
    goto LABEL_10;
  }
  if (v2 | v3)
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v3, CFSTR("cloudAssetCountPerType"));
    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
LABEL_11:
  if (*(_BYTE *)(a1 + 48))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("cloudAssetCountPerTypeLastCheckDate"));

  }
}

void __35__CPLStatus_cloudAssetCountPerType__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("cloudAssetCountPerType"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__CPLStatus_setServerFeatureCompatibleVersion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("serverFeatureCompatibleVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  v4 = *(_QWORD *)(a1 + 40);
  if (v3 != v4)
  {
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("serverFeatureCompatibleVersion"));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", 0, CFSTR("serverFeatureCompatibleVersion"));
    }
    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __43__CPLStatus_serverFeatureCompatibleVersion__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("serverFeatureCompatibleVersion"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "integerValue");

}

void __50__CPLStatus_setUpgradeSuggestedToAccessAllPhotos___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("upgradeSuggestedToAccessAllPhotos"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 40))
    v4 = 1;
  else
    v4 = v2 == 0;
  if (!v4)
  {
    v8 = v2;
    v6 = *(void **)(a1 + 32);
    v7 = 0;
LABEL_9:
    objc_msgSend(v6, "_setObjectInStatus:forKey:", v7, CFSTR("upgradeSuggestedToAccessAllPhotos"));
    objc_msgSend(*(id *)(a1 + 32), "_save");
    v3 = v8;
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    v8 = v2;
    v5 = objc_msgSend(v2, "BOOLValue");
    v3 = v8;
    if ((v5 & 1) == 0)
    {
      v6 = *(void **)(a1 + 32);
      v7 = MEMORY[0x1E0C9AAB0];
      goto LABEL_9;
    }
  }
LABEL_10:

}

void __48__CPLStatus_isUpgradeSuggestedToAccessAllPhotos__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("upgradeSuggestedToAccessAllPhotos"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __35__CPLStatus_setKeychainCDPEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("keychainCDPEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  if (v2)
  {
    v3 = objc_msgSend(v2, "BOOLValue");
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 == v3)
      goto LABEL_6;
  }
  else
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("keychainCDPEnabled"));

  objc_msgSend(*(id *)(a1 + 32), "_save");
LABEL_6:

}

void __33__CPLStatus_isKeychainCDPEnabled__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("keychainCDPEnabled"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __30__CPLStatus_setWalrusEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("walrusEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("walrusEnabled"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __28__CPLStatus_isWalrusEnabled__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("walrusEnabled"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __46__CPLStatus_setIsStuckInExitForSharedLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("isStuckInExitForSharedLibrary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("isStuckInExitForSharedLibrary"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __42__CPLStatus_isStuckInExitForSharedLibrary__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("isStuckInExitForSharedLibrary"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __54__CPLStatus_setICloudLibraryClientIsNotAuthenticated___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("iCloudLibraryClientIsNotAuthenticated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("iCloudLibraryClientIsNotAuthenticated"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __50__CPLStatus_iCloudLibraryClientIsNotAuthenticated__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("iCloudLibraryClientIsNotAuthenticated"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __49__CPLStatus_setICloudLibraryClientVersionTooOld___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("iCloudLibraryClientVersionTooOld"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("iCloudLibraryClientVersionTooOld"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __45__CPLStatus_iCloudLibraryClientVersionTooOld__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("iCloudLibraryClientVersionTooOld"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __38__CPLStatus_setContainerHasBeenWiped___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("containerHasBeenWiped"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("containerHasBeenWiped"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __34__CPLStatus_containerHasBeenWiped__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("containerHasBeenWiped"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __36__CPLStatus_setICloudLibraryExists___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("iCloudLibraryExists"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("iCloudLibraryExists"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __32__CPLStatus_iCloudLibraryExists__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("iCloudLibraryExists"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __42__CPLStatus_setICloudLibraryHasBeenWiped___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("iCloudLibraryHasBeenWiped"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("iCloudLibraryHasBeenWiped"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __38__CPLStatus_iCloudLibraryHasBeenWiped__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("iCloudLibraryHasBeenWiped"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __31__CPLStatus_setExitDeleteTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("exitDeleteTime"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  v5 = (id)v2;
  if (v4)
  {
    if (!(v2 | v3))
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((objc_msgSend((id)v2, "isEqual:") & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v3, CFSTR("exitDeleteTime"));
    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
LABEL_11:

}

void __27__CPLStatus_exitDeleteTime__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("exitDeleteTime"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __26__CPLStatus_setBusyState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  _BOOL4 v5;
  BOOL v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("busyState"));
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7 != 0;
    v5 = v3 != 0;
    if (v7)
      v6 = v3 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      if ((objc_msgSend(v7, "isEqual:", v3) & 1) != 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    v5 = 0;
    v3 = 0;
    v4 = v2 != 0;
  }
  if (v4 || v5)
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v3, CFSTR("busyState"));
    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
LABEL_12:

}

void __22__CPLStatus_busyState__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("busyState"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "integerValue");

}

void __72__CPLStatus_setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  _BOOL4 v5;
  BOOL v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("remainingCountInSharedLibraryExit"));
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7 != 0;
    v5 = v3 != 0;
    if (v7)
      v6 = v3 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      if ((objc_msgSend(v7, "isEqual:", v3) & 1) != 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    v5 = 0;
    v3 = 0;
    v4 = v2 != 0;
  }
  if (v4 || v5)
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v3, CFSTR("remainingCountInSharedLibraryExit"));
    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
LABEL_12:

}

void __68__CPLStatus_estimatedCountOfRemainingRecordsDuringSharedLibraryExit__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("remainingCountInSharedLibraryExit"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "unsignedIntegerValue");

}

void __46__CPLStatus_setIsExceedingSharedLibraryQuota___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("isExceedingSharedLibraryQuota"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("isExceedingSharedLibraryQuota"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __42__CPLStatus_isExceedingSharedLibraryQuota__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("isExceedingSharedLibraryQuota"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __33__CPLStatus_setIsExceedingQuota___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("isExceedingQuota"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 != 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectInStatus:forKey:", v6, CFSTR("isExceedingQuota"));

    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __29__CPLStatus_isExceedingQuota__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("isExceedingQuota"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __36__CPLStatus_setHasChangesToProcess___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("hasChangesToProcess"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (*(unsigned __int8 *)(a1 + 40) != v3)
  {
    v4 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setObjectInStatus:forKey:", v5, CFSTR("hasChangesToProcess"));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", 0, CFSTR("hasChangesToProcess"));
    }
    objc_msgSend(*(id *)(a1 + 32), "_save");
  }
}

void __32__CPLStatus_hasChangesToProcess__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("hasChangesToProcess"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

uint64_t __36__CPLStatus_setInitialDownloadDate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", *(_QWORD *)(a1 + 40), CFSTR("initialDownloadDate"));
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __32__CPLStatus_initialDownloadDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("initialDownloadDate"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("initialSyncDate"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

uint64_t __32__CPLStatus_setInitialSyncDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStatusOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:", *(_QWORD *)(a1 + 40));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Storing initial sync date %@ in status", (uint8_t *)&v7, 0xCu);

      }
      v2 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", v2, CFSTR("initialSyncDate"));
    objc_msgSend(*(id *)(a1 + 32), "_writeInitialSyncMarkerForDate:error:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStatusOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Dropping initial sync date in status", (uint8_t *)&v7, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", 0, CFSTR("initialSyncDate"));
    objc_msgSend(*(id *)(a1 + 32), "_deleteInitialSyncMarkerWithError:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __28__CPLStatus_initialSyncDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("initialSyncDate"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __39__CPLStatus_hasFinishedInitialDownload__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("initialDownloadDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("initialSyncDate"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

uint64_t __30__CPLStatus_setLastPruneDate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", *(_QWORD *)(a1 + 40), CFSTR("lastPruneDate"));
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __26__CPLStatus_lastPruneDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("lastPruneDate"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __41__CPLStatus_setLastCompletePrefetchDate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", *(_QWORD *)(a1 + 40), CFSTR("lastCompletePrefetchDate"));
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __37__CPLStatus_lastCompletePrefetchDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("lastCompletePrefetchDate"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __39__CPLStatus_setLastSuccessfulSyncDate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_setObjectInStatus:forKey:", *(_QWORD *)(a1 + 40), CFSTR("lastSyncDate"));
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __35__CPLStatus_lastSuccessfulSyncDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("lastSyncDate"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28__CPLStatus_refetchFromDisk__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

void __35__CPLStatus_checkInitialSyncMarker__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("initialSyncDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("exitDeleteTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("initialsync_marker"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cplFileExistsAtURL:", v5);

  if (v2)
    v8 = v3 == 0;
  else
    v8 = 0;
  if (v8)
  {
    if ((v7 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStatusOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "path");
          v13 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v26 = v13;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Writing initial sync marker at %@ because initial sync date is set", buf, 0xCu);

        }
      }
      v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      -[NSObject setDateFormat:](v14, "setDateFormat:", CFSTR("yyyy-MM-dd HH.mm.ss.SSS"));
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLocale:](v14, "setLocale:", v15);

      -[NSObject stringFromDate:](v14, "stringFromDate:", v2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v17 = objc_msgSend(v16, "writeToURL:atomically:encoding:error:", v5, 1, 4, &v23);
      v18 = v23;

      if ((v17 & 1) != 0 || _CPLSilentLogging)
        goto LABEL_29;
      __CPLStatusOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "path");
        v20 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        v27 = 2112;
        v28 = v18;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Failed to write initial sync marker at %@: %@", buf, 0x16u);

      }
      goto LABEL_28;
    }
  }
  else if (v7)
  {
    if (v2)
    {
      if (_CPLSilentLogging)
        goto LABEL_24;
      __CPLStatusOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      objc_msgSend(v5, "path");
      v10 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      v11 = "Removing initial sync marker at %@ because we are in exit mode";
    }
    else
    {
      if (_CPLSilentLogging)
        goto LABEL_24;
      __CPLStatusOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_23:

LABEL_24:
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v22 = objc_msgSend(v21, "removeItemAtURL:error:", v5, &v24);
        v14 = v24;

        if ((v22 & 1) != 0 || _CPLSilentLogging)
          goto LABEL_30;
        __CPLStatusOSLogDomain();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
        objc_msgSend(v5, "path");
        v19 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v19;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "Failed to delete initial sync marker at %@: %@", buf, 0x16u);
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(v5, "path");
      v10 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      v11 = "Removing initial sync marker at %@ because initial sync date is not set";
    }
    _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);

    goto LABEL_23;
  }
LABEL_31:

}

void __36__CPLStatus_writeInitialSyncMarker___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("initialSyncDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v4 + 40);
    v5 = objc_msgSend(v3, "_writeInitialSyncMarkerForDate:error:", v2, &obj);
    objc_storeStrong((id *)(v4 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }

}

@end
